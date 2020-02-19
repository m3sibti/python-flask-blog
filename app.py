import math
import os

from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from datetime import datetime
import json

from werkzeug.utils import secure_filename

with open('config.json') as C:
    params = json.load(C)['params']

local_server = params['local_server']
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['uploader_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail_username'],
    MAIL_PASSWORD=params['gmail_pass']

)
mail = Mail(app)

if local_server:
    uri = params['local_uri']
else:
    uri = params['prod_uri']

app.config['SQLALCHEMY_DATABASE_URI'] = uri
db = SQLAlchemy(app)


class Contacts(db.Model):
    """
    sno, name, phone_no, msg, date
    """
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    phone_no = db.Column(db.String(120), unique=False, nullable=False)
    msg = db.Column(db.String(120), unique=False, nullable=False)
    date = db.Column(db.Date(), unique=False, nullable=False)

    def __repr__(self):
        return '<User %r>' % self.name


class Post(db.Model):
    """
    sno, name, phone_no, msg, date
    """
    sno = db.Column(db.Integer, primary_key=True)
    slug = db.Column(db.String(80), unique=False, nullable=False)
    title = db.Column(db.String(120), unique=False, nullable=False)
    content = db.Column(db.String(120), unique=False, nullable=False)
    img_file = db.Column(db.String(120), unique=False, nullable=False)
    date = db.Column(db.Date(), unique=False, nullable=False, )

    def __repr__(self):
        return '<Post %r>' % self.title


@app.route('/')
def home():
    m_posts = Post.query.filter_by().all()
    no_posts = int(params['no_posts'])
    last = math.ceil(len(m_posts) / no_posts)

    page = request.args.get('page')
    if not str(page).isnumeric():
        page = 1
    page = int(page)

    start_index = (page - 1) * no_posts
    end_index = (page - 1) * no_posts + no_posts
    m_posts = m_posts[start_index: end_index]

    if page == 1:
        prev_p = '#'
        next_p = f"/?page={page + 1}"
    elif page == last:
        prev_p = f"/?page={page - 1}"
        next_p = '#'
    else:
        prev_p = f"/?page={page - 1}"
        next_p = f"/?page={page + 1}"

    return render_template('index.html', params=params, m_posts=m_posts, next=next_p, prev=prev_p)


@app.route('/about')
def about():
    return render_template('about.html', params=params)


@app.route('/dashboard', methods=['GET', 'POST'])
def login():
    m_posts = Post.query.all()
    if 'user' in session and session['user'] == params['u_email']:
        return render_template('dashboard.html', params=params, m_posts=m_posts)

    if request.method == 'POST':
        uemail = request.form.get('u_email')
        upass = request.form.get('u_pass')
        if uemail == params['u_email'] and upass == params['u_pass']:
            session['user'] = uemail
            return render_template('dashboard.html', params=params, m_posts=m_posts)

    return render_template('login.html', params=params)


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route('/uploader', methods=['GET', 'POST'])
def uploader():
    if 'user' in session and session['user'] == params['u_email']:
        if request.method == 'POST':
            f = request.files['m_file']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return 'Uploaded Successfully'


@app.route('/edit/<string:sno>', methods=['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['u_email']:
        if request.method == 'POST':
            title = request.form.get('title')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno == '0':
                n_post = Post(slug=slug, title=title, content=content, img_file=img_file, date=date)
                db.session.add(n_post)
                db.session.commit()
            else:
                m_post = Post.query.filter_by(sno=sno).first()
                m_post.title = title
                m_post.slug = slug
                m_post.content = content
                m_post.img_file = img_file
                m_post.date = date
                db.session.commit()
                return redirect(f'/edit/{sno}')
        post = Post.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, sno=sno, post=post)


@app.route('/delete/<string:sno>', methods=['GET', 'POST'])
def delete(sno):
    if 'user' in session and session['user'] == params['u_email']:
        post_to_del = Post.query.filter_by(sno=sno).first()
        db.session.delete(post_to_del)
        db.session.commit()
    return redirect('/dashboard')


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        '''Add entry to database'''
        name = request.form.get('name')
        phone = request.form.get('phone')
        msg = request.form.get('msg')
        dt = datetime.now()

        entry = Contacts(name=name, phone_no=phone, msg=msg, date=dt)
        db.session.add(entry)
        db.session.commit()

        mail.send_message(f'New Message from {name}',
                          sender='m3si6ti@gmail.com',
                          recipients=[params['gmail_username']],
                          body=msg + "\n" + phone)

    return render_template('contact.html', params=params)


@app.route('/post/<string:post_slug>', methods=['GET'])
def post(post_slug):
    m_post = Post.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, m_post=m_post)


if __name__ == '__main__':
    # app.run()
    app.debug = True  # for auto reload (dont forget to check Debug from Config file)
