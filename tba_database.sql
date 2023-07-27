-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 27, 2023 at 09:53 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tba database`
--

-- --------------------------------------------------------

--
-- Table structure for table `motivation_goals`
--

DROP TABLE IF EXISTS `motivation_goals`;
CREATE TABLE IF NOT EXISTS `motivation_goals` (
  `student_id` int(255) NOT NULL,
  `motivation` varchar(255) NOT NULL,
  `career_goals` varchar(255) NOT NULL,
  KEY `motivation_goals_ibfk_1` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `motivation_goals`
--

INSERT INTO `motivation_goals` (`student_id`, `motivation`, `career_goals`) VALUES
(9, 'hello', 'holla'),
(10, 'hello', 'holla'),
(11, 'hello', 'holla'),
(12, 'hop', 'giopo');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int(255) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `date_of_birth` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `institution` varchar(255) NOT NULL,
  `field_of_study` varchar(255) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `full_name`, `email`, `phone`, `address`, `date_of_birth`, `nationality`, `institution`, `field_of_study`) VALUES
(1, 'emmanuel kiama ', 'emmanuelkiama@gmail.com', '0763553710', '23456789', '2001-12-31', 'tanzania', 'must', 'must'),
(2, 'emmanuel kiama ', 'emmanuelkiama@gmail.com', '0763553710', '23456789', '2001-12-31', 'tanzania', 'must', 'must'),
(5, 'daudi yohana', 'emmanueldaudi@gmail.com', '1234567890', '23456789', '2001-12-31', 'tanzania', 'must', 'must'),
(6, 'ktytreawQ', 'asdfghjk@gmail.com', '23456789', 'qwertyuh', '2001-03-31', 'tanzanian', 'must', 'cs'),
(7, 'ktytreawQ', 'asdfghjk@gmail.com', '23456789', 'qwertyuh', '2001-03-31', 'tanzanian', 'must', 'cs'),
(8, 'alvin', 'abas@gmail.com', '06244556788', 'html', '1992-07-12', 'tanzanian', 'must', 'computer engineering'),
(9, 'alvin', 'abas@gmail.com', '06244556788', 'html', '1992-07-12', 'tanzanian', 'must', 'computer engineering'),
(10, 'alvin', 'abas@gmail.com', '06244556788', 'html', '1992-07-12', 'tanzanian', 'must', 'computer engineering'),
(11, 'job', 'job@gmail.com', '0624456799', 'docs', '1992-07-12', 'tanzanian', 'must', 'computer engineering'),
(12, 'joy ', 'joyas@gmail.com', '8765555888', '1234f', '2020-02-22', 'Morocco', 'chuo', 'sectaa');

-- --------------------------------------------------------

--
-- Table structure for table `training_preferences`
--

DROP TABLE IF EXISTS `training_preferences`;
CREATE TABLE IF NOT EXISTS `training_preferences` (
  `student_id` int(255) NOT NULL,
  `training_area` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `duration` varchar(255) NOT NULL,
  KEY `training_preferences_ibfk_1` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `training_preferences`
--

INSERT INTO `training_preferences` (`student_id`, `training_area`, `start_date`, `duration`) VALUES
(1, 'it', '2023-02-02', '23erty'),
(2, 'it', '2023-02-02', '23erty'),
(3, 'it', '2023-02-02', '23erty'),
(4, 'it', '2023-02-02', '23erty'),
(5, 'it', '2023-02-02', '3 days'),
(6, 'SDFGHJ', '2022-02-06', 'ASED'),
(7, 'SDFGHJ', '2022-02-06', 'ASED'),
(8, 'it', '2023-07-20', '3 months'),
(9, 'it', '2023-07-20', '3 months'),
(10, 'it', '2023-07-20', '3 months'),
(11, 'it', '2023-07-20', '3 months'),
(12, 'investment', '2009-12-03', '6 weeks');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `motivation_goals`
--
ALTER TABLE `motivation_goals`
  ADD CONSTRAINT `motivation_goals_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
