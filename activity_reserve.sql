-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2020 at 04:00 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `activity_reserve`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `ActivityID` int(11) NOT NULL,
  `ActivityName` varchar(50) NOT NULL,
  `ActivityPrice` int(11) NOT NULL,
  `DateTimeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`ActivityID`, `ActivityName`, `ActivityPrice`, `DateTimeID`) VALUES
(1, 'Bikeroise', 30, 1),
(2, 'Yoga for Health', 30, 2),
(3, 'Aero boxing', 30, 3),
(4, 'Firm Fun Fit', 30, 4),
(5, 'Step Aerobic', 30, 5),
(6, 'Aerobic Dance', 30, 6),
(7, 'Zamju', 30, 7),
(8, 'Exercise Ball', 30, 8),
(10, 'Aerobic Dance', 30, 10),
(11, 'Bikeroise', 30, 11),
(12, 'Step Aerobic', 30, 12),
(13, 'ํYoga for Health', 30, 13);

-- --------------------------------------------------------

--
-- Table structure for table `datetime`
--

CREATE TABLE `datetime` (
  `DateTimeID` int(11) NOT NULL,
  `Date` varchar(30) NOT NULL,
  `TimeStart` time NOT NULL,
  `TimeFinish` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `datetime`
--

INSERT INTO `datetime` (`DateTimeID`, `Date`, `TimeStart`, `TimeFinish`) VALUES
(1, 'วันจันทร์', '17:00:00', '17:30:00'),
(2, 'วันจันทร์', '17:30:00', '18:30:00'),
(3, 'วันจันทร์', '18:30:00', '19:30:00'),
(4, 'วันจันทร์', '19:30:00', '20:00:00'),
(5, 'วันอังคาร', '17:00:00', '17:30:00'),
(6, 'วันอังคาร', '17:30:00', '18:30:00'),
(7, 'วันอังคาร', '18:30:00', '19:30:00'),
(8, 'วันอังคาร', '19:30:00', '20:30:00'),
(9, 'วันพุธ', '17:00:00', '17:30:00'),
(10, 'วันพุธ', '18:30:00', '19:30:00'),
(11, 'วันพุธ', '19:30:00', '20:00:00'),
(12, 'วันพฤหัสบดี', '17:30:00', '18:30:00'),
(13, 'วันพฤหัสบดี', '18:30:00', '19:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `ID` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`ID`, `username`, `password`, `name`, `level`) VALUES
(1, 'admin', '1234', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `userreserve`
--

CREATE TABLE `userreserve` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(40) NOT NULL,
  `UserEmail` varchar(40) NOT NULL,
  `UserTel` varchar(11) NOT NULL,
  `ActivityName` varchar(20) NOT NULL,
  `Date` varchar(15) NOT NULL,
  `TimeStart` varchar(20) NOT NULL,
  `TimeFinish` varchar(20) NOT NULL,
  `ActivityPrice` int(11) NOT NULL,
  `ActivityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userreserve`
--

INSERT INTO `userreserve` (`UserID`, `UserName`, `UserEmail`, `UserTel`, `ActivityName`, `Date`, `TimeStart`, `TimeFinish`, `ActivityPrice`, `ActivityID`) VALUES
(1, 'สมชาย มากดี', 'Somchai@gmail.com', '0999999999', 'Bikeroise', 'วันจันทร์', '17:00:00', '17:30:00', 30, 1),
(2, 'สวัสดี ครับพี่ครับ', 'Sawaddee@gmail.com', '0555564', 'Bikeroise', 'วันจันทร์', '17:00:00', '17:30:00', 30, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
-- (See below for the actual view)
--
CREATE TABLE `view1` (
`ActivityID` int(11)
,`ActivityName` varchar(50)
,`Date` varchar(30)
,`TimeStart` time
,`TimeFinish` time
,`ActivityPrice` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS  select `activity`.`ActivityID` AS `ActivityID`,`activity`.`ActivityName` AS `ActivityName`,`datetime`.`Date` AS `Date`,`datetime`.`TimeStart` AS `TimeStart`,`datetime`.`TimeFinish` AS `TimeFinish`,`activity`.`ActivityPrice` AS `ActivityPrice` from (`activity` join `datetime`) where `activity`.`DateTimeID` = `datetime`.`DateTimeID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`ActivityID`),
  ADD KEY `DateTimeID` (`DateTimeID`);

--
-- Indexes for table `datetime`
--
ALTER TABLE `datetime`
  ADD PRIMARY KEY (`DateTimeID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `userreserve`
--
ALTER TABLE `userreserve`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `ActivityID` (`ActivityID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `ActivityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `datetime`
--
ALTER TABLE `datetime`
  MODIFY `DateTimeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userreserve`
--
ALTER TABLE `userreserve`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`DateTimeID`) REFERENCES `datetime` (`DateTimeID`);

--
-- Constraints for table `userreserve`
--
ALTER TABLE `userreserve`
  ADD CONSTRAINT `userreserve_ibfk_1` FOREIGN KEY (`ActivityID`) REFERENCES `activity` (`ActivityID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
