START
1 - install and run flask
2 - use templates and render them
3 - bootstrap templates
    https://startbootstrap.com/themes/clean-blog/
4 - backend handle by flask and front-end for bootstrap
5 - use jinja templating
    - jinja.pocoo.org
    - file link url_for(static) etc..
    - use variables for conditions and loops
6 - copy paste .html from ur theme to templates and re-run
7 - inspect and check errors from browser console
8 - now copy paste these 3 folders from your template
    - css, js, img & vendor
9 - change all links/refs with jinja style
10 - no need to change url_for for https files
11 - change nav-bar item.html to /item
12 - Template inheritance
    - create layout.html
    - copy paste reusable code in it with a {% block body %} {% endblock %} in middle
    - then in required page use {% extends 'layout.html' %} {% block body %} ... {% endblock %}

DATABASE:
13 - Install xamp with php-5
14 - see what to change for dynamic (like posts in this blog) using inspect
15 - start xampp phpmyadmin
    - create db
    - create table, create cols
                    - sno, title, content, date
    - a table for storing contact msgs
        - name, email, phno, msg
16 - install flask-sqlalchemy in ur environment
17 - follow quickstart and create a class for your table also set URI
18 - add fields names in html fields also form action and method
19 - again follow quick start guidelines for adding data
    - in case of error pip install pymsql and use this connector
    - app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/cleanblog'
20 - check db (your data has been added)

STRUCTURE:
21 - create a config,json file to save ur parameters here, and make code more readable
22 - read that file in ur app.py using import json
23 - try to add more params in that file as they'll be useful and ur app will be more plugable
    - e.g. fb_url, tw_url, gh_url, blog_name, tagline etc and access in jinga after passing params in render_t..
24 - change every static entry by this dynamic one

MAIL:
25 - install flask-mail
26 - import it and write config update function
27 - intialize mail
28 - create a mail after creating post and send using given params
29 - on authentication error visit => https://support.google.com/mail/answer/78754 and allow less secure apps
30 - check mail by sending it again

DATABASE 2:
31 - add post in ur db
32 - add useful cols
    - slug (VARCHAR) like id in url
33 - create a new route name post with a string variable and pass that in function also
34 - create class for POST table and query it (Classname must be same as Tablename in DB)
35 - remove placeholders and make it more clean
36 - Now add image url here (add img_url field in table )
37 - create variable in jinja for storing that file_url for db
38 - don't forget to add newly added field in table's   class in app.py
39 - add params for about in config.json and fetch it

DATABASE 3: Fetch all
40 - go and check syntax for jinja loop
41 - add no of posts in config this param help you decide how many posts you wanna show
44 - apply loop in jinja to loop over all posts
44 - query and pass it in app.py class using filter_by().all()[0:params['no_posts']]
45 - add img files if needed

SIGN-IN:
46 - copy paste login.css and login route from bootstrap (getbootstrap.com)
47 - you can add properties and check their effect on chrome
48 - copy paste starter code (link for css/js) if your folder structure path not working
49 - add login image in params
50 - add uname and pass in params
51 - add action and method in form in that html file
52 - add name attribute in fields of form and access them in python function
53 - set the session and if session is already in then redirect user
54 - now set the session secret key for login at start in app
55 - create a dashboard.html and welcome your user in that

DASHBOARD:
56 - go find and add bootstrap table with your choice of cols
57 - edit it according to your requirements
58 - style buttons by searching for bootstrap
59 - give heading to table using h1 and br

EDIT POSTS:
60 - take button in a tag and pass {{/edit/{{post.sno}} in href for edit button
67 - create a new template for edit.html
68 - copy paste form from contact and change it according to your requirements
69 - define a route for edit.html in app.py
70 - add new post if user is login and sno is 0
71 - add button for add new post that route you with 0 sno
72 - create else statement and pass post and add html values in their respect fields
73 - update post and redirect to this page again
74 - create some basic buttons 'dashboard home' in edit.html & 'Logout' in both

DELETE POSTS:
75 - add delete route
76 - redirect to dashboard
77 - delete after retrieving post
78 - check it

FILE UPLOAD:
79 - add upload file button in dashboard
80 - create a form with enctype=multipart/form-data which includes a input file and submit button
81 - copy paste your directory full location and write in in config.json
82 - create uploader route, first check that user is login and post request is called then save your file
83 - set the upload folder in config and use that with os module and secure filename
84 - return a msg or anything you want
    TIPS:
        - if making file uploading public consider the file extensions (someone may not upload the .php, .py files etc)S
        - if things not updating try hard-reload (ctrl + reload) browser

LOGOUT:
85 - create a route/endpoint for logout
86 - kill session in it using session.pop('user')
87 - than redirect user to dashboard again

PAGINATION:
88 - add previous and next buttons with arrows(optional)
89 - work in index route ('/')
90 - query all posts
91 - get the number of last page
98 - get page_no from url using get function
99 - check if its numeric
100 - set a start and end index for posts to retrieve
101 - apply logic for first, middle and last page
102 - pass these next and previous on render_temp
103 - access these in your index.html in href of a of buttons (next and previous)

Github UPLOAD:
104 - Go and create repo on github
105 - initialize it with readme while creating
106 - add .gitignore and ignore folders you dont need (see them in directory)
107 - open git bash there and type `git init`
108 - copy link of ssh and add it to `git remote add origin -xyz-`
109 - git add -A
110 - git commit -m "Initial commit"
111 - git push origin master