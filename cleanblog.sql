-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2020 at 10:28 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cleanblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_no` varchar(200) NOT NULL,
  `msg` text NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_no`, `msg`, `date`) VALUES
(1, 'A', '123', 'I want a msg', '2020-02-11'),
(2, 'qw', 'qw121', 'qwd', '2020-02-13'),
(3, 'qw', 'qw121', 'qwd', '2020-02-13'),
(4, '123', '03314982944', 'sad', '2020-02-13'),
(5, '123', '03314982944', 'sad', '2020-02-13'),
(6, '123', '03314982944', 'sad', '2020-02-13'),
(7, 'abv', 'sad', 'sda', '2020-02-13'),
(8, 'a', 'c', 's', '2020-02-13'),
(9, 'a', 'c', 'd', '2020-02-13'),
(10, 'a', 'c', 'd', '2020-02-13'),
(11, 'a', 'c', 'd', '2020-02-13'),
(12, 'a', 'c', 'd', '2020-02-13'),
(13, 'a', 'c', 'c', '2020-02-13'),
(14, 'a', 'c', 'd', '2020-02-13'),
(15, 'a', 'c', 'd', '2020-02-13'),
(16, 'a', 'c', 'd', '2020-02-13'),
(17, 'a', 'c', 'd', '2020-02-13'),
(18, 'a', 'c', 'd', '2020-02-13'),
(19, 'a', 'c', 'd', '2020-02-13'),
(20, 'a', 'c', 'd', '2020-02-13'),
(21, 'Test', '1234', 'Hello', '2020-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `sno` int(11) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(200) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`sno`, `slug`, `title`, `content`, `img_file`, `date`) VALUES
(2, 'first-post', 'My First Post', 'Hello this is our first post', 'about-bg.jpg', '2020-02-14'),
(3, 'variable', 'Variable (mathematics)', 'In mathematics, a variable is a symbol used to represent an arbitrary element of a set. In addition to numbers, variables are commonly used to represent vectors, matrices and functions.\r\n\r\nMaking algebraic computations with variables as if they were explicit numbers allows one to solve a range of problems in a single computation. A typical example is the quadratic formula, which allows one to solve every quadratic equation by simply substituting the numeric values of the coefficients of the given equation for the variables that represent them.\r\n\r\nIn mathematical logic, a variable is either a symbol representing an unspecified term of the theory, or a basic object of the theory, which is manipulated without referring to its possible intuitive interpretation.', '', '0000-00-00'),
(4, 'constant', 'Constant (mathematics)', 'In mathematics, the adjective constant means non-varying. The noun constant may have two different meanings. It may refer to a fixed and well-defined number or other mathematical object. The term mathematical constant (and also physical constant) is sometimes used to distinguish this meaning from the other one. A constant may also refer to a constant function or its value (it is a common usage to identify them). Such a constant is commonly represented by a variable which does not depend on the main variable(s) of the studied problem. This is the case, for example, for a constant of integration which is an arbitrary constant function (not depending on the variable of integration) added to a particular antiderivative to get all the antiderivatives of the given function.\r\n\r\nFor example, a general quadratic function is commonly written as:\r\n\r\n{\\displaystyle ax^{2}+bx+c\\,,}a x^2 + b x + c\\, ,\r\nwhere a, b and c are constants (or parameters), while x is the variable, a placeholder for the argument of the function being studied. A more explicit way to denote this function is\r\n\r\n{\\displaystyle x\\mapsto ax^{2}+bx+c\\,,}x\\mapsto a x^2 + b x + c \\, ,\r\nwhich makes the function-argument status of x clear, and thereby implicitly the constant status of a, b and c. In this example a, b and c are coefficients of the polynomial. Since c occurs in a term that does not involve x, it is called the constant term of the polynomial and can be thought of as the coefficient of x0; any polynomial term or expression of degree zero is a constant.[1]:18', '', '0000-00-00'),
(5, 'loop', 'LOOP (programming language)', 'LOOP is a programming language designed by Uwe Schöning, along with GOTO and WHILE. The only operations supported in the language are assignment, addition and looping.\r\n\r\nThe key property of the LOOP language is that the functions it can compute are exactly the primitive recursive functions.[1]', 'home-bg.jpg', '0000-00-00'),
(6, 'conditional-statement', 'Conditional (computer programming)', ' In computer science, conditional statements, conditional expressions and conditional constructs are features of a programming language, which perform different computations or actions depending on whether a programmer-specified boolean condition evaluates to true or false. Apart from the case of branch predication, this is always achieved by selectively altering the control flow based on some condition.\r\n\r\nIn imperative programming languages, the term \"conditional statement\" is usually used, whereas in functional programming, the terms \"conditional expression\" or \"conditional construct\" are preferred, because these terms all have distinct meanings.\r\n\r\nAlthough dynamic dispatch is not usually classified as a conditional construct, it is another way to select between alternatives at runtime.', 'xyz.png', '2020-02-17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
