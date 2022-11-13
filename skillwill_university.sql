-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2022 at 05:26 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skillwill_university`
--

-- --------------------------------------------------------

--
-- Table structure for table `assistant_managers`
--

CREATE TABLE `assistant_managers` (
  `ID` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `gender` enum('f','m') NOT NULL,
  `apartment_number` int(11) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `secon_adrress` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assistant_managers`
--

INSERT INTO `assistant_managers` (`ID`, `email`, `address`, `gender`, `apartment_number`, `last_name`, `name`, `date_of_birth`, `secon_adrress`) VALUES
(600034223, 'a.jiqia@skillwill.ge', 'agmasheneblis23', 'f', NULL, 'Jikia', 'Ani', '1995-11-09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attend`
--

CREATE TABLE `attend` (
  `studentidFK` int(11) NOT NULL,
  `subjectidFK` int(11) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`) VALUES
(1, 'backend_PHP');

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `ID` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` int(11) NOT NULL,
  `gender` enum('f','m') NOT NULL,
  `apartment_number` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `secon_adrress` int(11) DEFAULT NULL,
  `account_number` int(11) NOT NULL,
  `rank` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`ID`, `email`, `address`, `gender`, `apartment_number`, `name`, `last_name`, `date_of_birth`, `secon_adrress`, `account_number`, `rank`) VALUES
(600023435, 'l.sikharulia@sweeftdigital.com', 16, 'f', NULL, 'Lika', 'Sikharulia', '1995-07-25', NULL, 23453, 'Associate Lecturer');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(30) NOT NULL,
  `second_address` varchar(30) DEFAULT NULL,
  `gender` enum('f','m') NOT NULL,
  `apartment_number` int(11) DEFAULT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ID`, `name`, `last_name`, `date_of_birth`, `address`, `second_address`, `gender`, `apartment_number`, `email`) VALUES
(600049683, 'Lika', 'Chilochava', '0202-11-01', 'agmasheneblis64', NULL, 'f', 64, 'likachilo@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_ID` int(11) NOT NULL,
  `subject_name` varchar(30) NOT NULL,
  `courseidFK` int(11) NOT NULL,
  `proffesoridFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_ID`, `subject_name`, `courseidFK`, `proffesoridFK`) VALUES
(4234, 'sql', 1, 600023435);

-- --------------------------------------------------------

--
-- Table structure for table `takes`
--

CREATE TABLE `takes` (
  `studentidFK` int(11) NOT NULL,
  `courseidFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `takes`
--

INSERT INTO `takes` (`studentidFK`, `courseidFK`) VALUES
(600049683, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assistant_managers`
--
ALTER TABLE `assistant_managers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `attend`
--
ALTER TABLE `attend`
  ADD PRIMARY KEY (`studentidFK`,`subjectidFK`),
  ADD KEY `subjectidFK` (`subjectidFK`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_ID`),
  ADD KEY `courseidFK` (`courseidFK`),
  ADD KEY `proffesoridFK` (`proffesoridFK`);

--
-- Indexes for table `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`studentidFK`,`courseidFK`),
  ADD KEY `courseidFK` (`courseidFK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4235;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attend`
--
ALTER TABLE `attend`
  ADD CONSTRAINT `attend_ibfk_1` FOREIGN KEY (`studentidFK`) REFERENCES `student` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `attend_ibfk_2` FOREIGN KEY (`subjectidFK`) REFERENCES `subject` (`subject_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`courseidFK`) REFERENCES `course` (`course_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`proffesoridFK`) REFERENCES `professor` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `takes`
--
ALTER TABLE `takes`
  ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`courseidFK`) REFERENCES `course` (`course_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`studentidFK`) REFERENCES `student` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
