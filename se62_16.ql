-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2020 at 12:43 PM
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
-- Database: `projectse`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentCode` varchar(10) NOT NULL,
  `DepartmentName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentCode`, `DepartmentName`) VALUES
('E29', 'ภาควิชาวิศวกรรมคอมพิวเตอร์');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `EquipmentID` varchar(30) NOT NULL,
  `EquipmentName` varchar(30) NOT NULL,
  `EquipmentDetail` varchar(30) NOT NULL,
  `EquipmentStatus` varchar(30) NOT NULL,
  `EquipmentImage` varchar(30) NOT NULL,
  `TypeID` varchar(30) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`EquipmentID`, `EquipmentName`, `EquipmentDetail`, `EquipmentStatus`, `EquipmentImage`, `TypeID`, `Quantity`) VALUES
('1002003000', 'โน้ตบุค', 'คอมพิวเตอร์ชนิดเคลื่อนที่', 'พร้อมใช้งาน', 'Notebook.jpeg', 'EH', 2),
('2001003000', 'เร้าเตอร์', 'อุปกรณ์รับสัญญาณ', 'พร้อมใช้งาน', 'Router.jpeg', 'EN', 0),
('3001002000', 'แผ่นลงไดร์เวอร์', 'ลงไดร์เวอร์ให้กับคอมพิวเตอร์', 'พร้อมใช้งาน', 'Driver.jpeg', 'ES', 3);

-- --------------------------------------------------------

--
-- Table structure for table `equipmentincart`
--

CREATE TABLE `equipmentincart` (
  `EquipmentINCartID` int(11) NOT NULL,
  `UserCode` varchar(15) NOT NULL,
  `EquipmentID` varchar(30) NOT NULL,
  `EquipmentName` varchar(30) NOT NULL,
  `EquipmentDetail` varchar(50) NOT NULL,
  `EquipmentStatus` varchar(15) NOT NULL,
  `EquipmentImage` varchar(40) NOT NULL,
  `TypeID` varchar(11) NOT NULL,
  `Number` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `equipmentincart`
--

INSERT INTO `equipmentincart` (`EquipmentINCartID`, `UserCode`, `EquipmentID`, `EquipmentName`, `EquipmentDetail`, `EquipmentStatus`, `EquipmentImage`, `TypeID`, `Number`) VALUES
(1, 'b6020552004', '1002003000', 'โน้ตบุค', 'คอมพิวเตอร์ชนิดเคลื่อนที่', 'พร้อมใช้งาน', 'Notebook.jpeg', 'EH', '1');

-- --------------------------------------------------------

--
-- Table structure for table `equipmentstatus`
--

CREATE TABLE `equipmentstatus` (
  `StatusID` varchar(20) NOT NULL,
  `StatusName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `equipmenttype`
--

CREATE TABLE `equipmenttype` (
  `TypeID` varchar(30) NOT NULL,
  `TypeName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `equipmenttype`
--

INSERT INTO `equipmenttype` (`TypeID`, `TypeName`) VALUES
('EH', 'อุปกรณ์ฮาร์ดแวร์'),
('EN', 'อุปกรณ์เน็ตเวิร์ค'),
('ES', 'อุปกรณ์ซอฟต์แวร์');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `historyid` int(11) NOT NULL,
  `historyCode` varchar(15) NOT NULL,
  `EquipmentID` varchar(30) NOT NULL,
  `historyFNameEN` varchar(30) NOT NULL,
  `historyLNameEN` varchar(30) NOT NULL,
  `historyFNameTH` varchar(30) NOT NULL,
  `historyLNameTH` varchar(30) NOT NULL,
  `historyEmail` varchar(40) NOT NULL,
  `historyGender` varchar(10) NOT NULL,
  `hidtoryDeprtment` varchar(10) NOT NULL,
  `UserID` varchar(10) NOT NULL,
  `historyequipmentCartID` int(11) NOT NULL,
  `Project` varchar(20) NOT NULL,
  `Teacher` varchar(20) NOT NULL,
  `Reason` text NOT NULL,
  `DateBorrow` date NOT NULL,
  `DateReturn` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `name`, `level`) VALUES
('admin', '1234', 'admin', 'admin'),
('b6020550532', 'tncoil1998', 'Thanachart Kositrodjanalurk', 'member'),
('b6020552004', '@Ohmworrs98', 'Worrasak Khammuang', 'member');

-- --------------------------------------------------------

--
-- Table structure for table `usermember`
--

CREATE TABLE `usermember` (
  `UserCode` varchar(15) NOT NULL,
  `NameTitle` varchar(10) NOT NULL,
  `UserFNameEn` varchar(30) NOT NULL,
  `UserLNameEn` varchar(30) NOT NULL,
  `UserFNameTh` varchar(30) NOT NULL,
  `UserLNameTh` varchar(30) NOT NULL,
  `UserEmail` varchar(40) NOT NULL,
  `UserGender` varchar(10) NOT NULL,
  `DepartmentCode` varchar(10) NOT NULL,
  `UsermemberID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usermember`
--

INSERT INTO `usermember` (`UserCode`, `NameTitle`, `UserFNameEn`, `UserLNameEn`, `UserFNameTh`, `UserLNameTh`, `UserEmail`, `UserGender`, `DepartmentCode`, `UsermemberID`) VALUES
('b6020550532', 'Mr./นาย', 'Thanachart', 'Kositrodjanalurk', 'ธนชาติ', 'โฆษิตโรจนฤกษ์', 'thanachart.k@ku.th', 'male', 'E29', '6020550532'),
('b6020552004', 'Mr./นาย', 'Thanachart', 'Kositrodjanalurk', 'ธนชาติ', 'โฆษิตโรจนฤกษ์', 'thanachart.k@ku.th', 'male', 'E29', '6020552004');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentCode`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`EquipmentID`),
  ADD KEY `TypeID` (`TypeID`);

--
-- Indexes for table `equipmentincart`
--
ALTER TABLE `equipmentincart`
  ADD PRIMARY KEY (`EquipmentINCartID`),
  ADD KEY `EquipmentID` (`EquipmentID`),
  ADD KEY `TypeID` (`TypeID`),
  ADD KEY `UserCode` (`UserCode`);

--
-- Indexes for table `equipmentstatus`
--
ALTER TABLE `equipmentstatus`
  ADD PRIMARY KEY (`StatusID`);

--
-- Indexes for table `equipmenttype`
--
ALTER TABLE `equipmenttype`
  ADD PRIMARY KEY (`TypeID`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`historyid`),
  ADD KEY `historyCode` (`historyCode`),
  ADD KEY `hidtoryDeprtment` (`hidtoryDeprtment`),
  ADD KEY `historyequipmentCartID` (`historyequipmentCartID`),
  ADD KEY `EquipmentID` (`EquipmentID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `usermember`
--
ALTER TABLE `usermember`
  ADD PRIMARY KEY (`UserCode`),
  ADD KEY `DepartmentCode` (`DepartmentCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipmentincart`
--
ALTER TABLE `equipmentincart`
  MODIFY `EquipmentINCartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `historyid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`TypeID`) REFERENCES `equipmenttype` (`TypeID`);

--
-- Constraints for table `equipmentincart`
--
ALTER TABLE `equipmentincart`
  ADD CONSTRAINT `equipmentincart_ibfk_1` FOREIGN KEY (`EquipmentID`) REFERENCES `equipment` (`EquipmentID`),
  ADD CONSTRAINT `equipmentincart_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `equipmenttype` (`TypeID`),
  ADD CONSTRAINT `equipmentincart_ibfk_3` FOREIGN KEY (`UserCode`) REFERENCES `usermember` (`UserCode`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`historyCode`) REFERENCES `usermember` (`UserCode`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`hidtoryDeprtment`) REFERENCES `usermember` (`DepartmentCode`),
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`historyequipmentCartID`) REFERENCES `equipmentincart` (`EquipmentINCartID`),
  ADD CONSTRAINT `history_ibfk_4` FOREIGN KEY (`EquipmentID`) REFERENCES `equipment` (`EquipmentID`);

--
-- Constraints for table `usermember`
--
ALTER TABLE `usermember`
  ADD CONSTRAINT `usermember_ibfk_1` FOREIGN KEY (`UserCode`) REFERENCES `login` (`username`),
  ADD CONSTRAINT `usermember_ibfk_2` FOREIGN KEY (`DepartmentCode`) REFERENCES `department` (`DepartmentCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
