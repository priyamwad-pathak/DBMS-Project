CREATE DATABASE  IF NOT EXISTS `collegedatabasesystem` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `collegedatabasesystem`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: collegedatabasesystem
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atheletics`
--

DROP TABLE IF EXISTS `atheletics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atheletics` (
  `AYear` int(11) NOT NULL DEFAULT '0',
  `AEvent` varchar(30) NOT NULL DEFAULT '',
  `Category` varchar(1) NOT NULL,
  `FirstPosition` varchar(30) NOT NULL,
  `FirstWV` float DEFAULT NULL,
  `SecondPosition` varchar(30) NOT NULL,
  `SecondWV` float DEFAULT NULL,
  `ThirdPosition` varchar(30) NOT NULL,
  `ThirdWV` float DEFAULT NULL,
  PRIMARY KEY (`AYear`,`AEvent`,`Category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cclub`
--

DROP TABLE IF EXISTS `cclub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cclub` (
  `ClubName` varchar(30) NOT NULL,
  `ClubYear` int(11) NOT NULL,
  `ClubCoordinators` varchar(30) NOT NULL,
  PRIMARY KEY (`ClubName`,`ClubYear`,`ClubCoordinators`),
  CONSTRAINT `cclub_ibfk_1` FOREIGN KEY (`ClubName`, `ClubYear`) REFERENCES `club` (`ClubName`, `ClubYear`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cjoin`
--

DROP TABLE IF EXISTS `cjoin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cjoin` (
  `EnrollmentNo` varchar(13) NOT NULL,
  `ClubName` varchar(20) NOT NULL,
  `Cyear` int(11) NOT NULL,
  PRIMARY KEY (`EnrollmentNo`,`ClubName`,`Cyear`),
  CONSTRAINT `cjoin_ibfk_1` FOREIGN KEY (`EnrollmentNo`) REFERENCES `student` (`EnrollmentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club` (
  `ClubName` varchar(30) NOT NULL,
  `ClubYear` int(11) NOT NULL,
  `ClubCaptain` varchar(30) NOT NULL,
  PRIMARY KEY (`ClubName`,`ClubYear`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `courier`
--

DROP TABLE IF EXISTS `courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courier` (
  `CourierNo` int(11) NOT NULL,
  `CDate` varchar(20) NOT NULL,
  `Signature` varchar(30) NOT NULL,
  `RecieveFromWhome` varchar(30) NOT NULL,
  PRIMARY KEY (`CourierNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `EmployeeId` char(13) NOT NULL DEFAULT '',
  `EName` varchar(25) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `HName` varchar(8) NOT NULL,
  `HYear` int(11) NOT NULL,
  `RoomNo` int(11) DEFAULT NULL,
  `RoomLoc` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`),
  KEY `RoomNo` (`RoomNo`,`RoomLoc`),
  KEY `HName` (`HName`,`HYear`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`RoomNo`, `RoomLoc`) REFERENCES `sroomloc` (`RoomNo`, `RoomLoc`),
  CONSTRAINT `faculty_ibfk_2` FOREIGN KEY (`HName`, `HYear`) REFERENCES `house` (`HName`, `HYear`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facultycontact`
--

DROP TABLE IF EXISTS `facultycontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facultycontact` (
  `EmployeeId` varchar(13) NOT NULL,
  `MobileNo` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeId`,`MobileNo`),
  CONSTRAINT `facultycontact_ibfk_1` FOREIGN KEY (`EmployeeId`) REFERENCES `faculty` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fcourier`
--

DROP TABLE IF EXISTS `fcourier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fcourier` (
  `CourierNo` int(11) NOT NULL,
  `EmployeeId` varchar(13) NOT NULL,
  PRIMARY KEY (`CourierNo`),
  KEY `EmployeeId` (`EmployeeId`),
  CONSTRAINT `fcourier_ibfk_1` FOREIGN KEY (`CourierNo`) REFERENCES `courier` (`CourierNo`),
  CONSTRAINT `fcourier_ibfk_2` FOREIGN KEY (`EmployeeId`) REFERENCES `faculty` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fparticipatesins`
--

DROP TABLE IF EXISTS `fparticipatesins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fparticipatesins` (
  `EmployeeId` varchar(13) NOT NULL DEFAULT '',
  `Syear` int(11) NOT NULL DEFAULT '0',
  `SEvent` varchar(30) NOT NULL DEFAULT '',
  `EventType` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`EmployeeId`,`Syear`,`SEvent`,`EventType`),
  CONSTRAINT `fparticipatesins_ibfk_1` FOREIGN KEY (`EmployeeId`) REFERENCES `faculty` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fparticipatesinscategory`
--

DROP TABLE IF EXISTS `fparticipatesinscategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fparticipatesinscategory` (
  `EmployeeId` varchar(13) NOT NULL DEFAULT '',
  `Category` varchar(1) NOT NULL,
  PRIMARY KEY (`EmployeeId`),
  CONSTRAINT `fparticipatesinscategory_ibfk_1` FOREIGN KEY (`EmployeeId`) REFERENCES `fparticipatesins` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house` (
  `HName` varchar(13) NOT NULL,
  `HYear` int(11) NOT NULL,
  `HCaptain` varchar(30) NOT NULL,
  `HVCaptain` varchar(30) NOT NULL,
  PRIMARY KEY (`HName`,`HYear`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `housepoints`
--

DROP TABLE IF EXISTS `housepoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housepoints` (
  `HpEvent` varchar(30) NOT NULL,
  `HpPoint` int(11) NOT NULL,
  `HpYear` int(11) NOT NULL,
  `HName` varchar(30) NOT NULL,
  PRIMARY KEY (`HpYear`,`HpEvent`,`HName`),
  KEY `HName` (`HName`),
  CONSTRAINT `housepoints_ibfk_1` FOREIGN KEY (`HName`) REFERENCES `house` (`HName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ingenuity`
--

DROP TABLE IF EXISTS `ingenuity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingenuity` (
  `IYear` int(11) NOT NULL DEFAULT '0',
  `IEvent` varchar(20) NOT NULL DEFAULT '',
  `Coordinator` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`IYear`,`IEvent`,`Coordinator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ingenuityteam`
--

DROP TABLE IF EXISTS `ingenuityteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingenuityteam` (
  `IYear` int(11) NOT NULL DEFAULT '0',
  `IEvent` varchar(20) NOT NULL DEFAULT '',
  `Team` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IYear`,`IEvent`),
  CONSTRAINT `ingenuityteam_ibfk_1` FOREIGN KEY (`IYear`, `IEvent`) REFERENCES `ingenuity` (`IYear`, `IEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyallocation`
--

DROP TABLE IF EXISTS `keyallocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyallocation` (
  `KARoomNo` varchar(10) NOT NULL,
  `KARoomLoc` varchar(10) NOT NULL,
  PRIMARY KEY (`KARoomNo`,`KARoomLoc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `occontact`
--

DROP TABLE IF EXISTS `occontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occontact` (
  `CollegeName` varchar(20) NOT NULL DEFAULT '',
  `Syear` int(11) NOT NULL DEFAULT '0',
  `RepresentativeContactNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`CollegeName`,`Syear`),
  CONSTRAINT `occontact_ibfk_1` FOREIGN KEY (`CollegeName`, `Syear`) REFERENCES `ocparticipates` (`CollegeName`, `Syear`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ocparticipates`
--

DROP TABLE IF EXISTS `ocparticipates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ocparticipates` (
  `CollegeName` varchar(20) NOT NULL DEFAULT '',
  `Syear` int(11) NOT NULL DEFAULT '0',
  `SEvent` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`CollegeName`,`Syear`,`SEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `BestAthelete` varchar(30) NOT NULL,
  `RYear` int(11) NOT NULL DEFAULT '0',
  `Category` varchar(1) NOT NULL DEFAULT '',
  `Points` int(11) NOT NULL,
  PRIMARY KEY (`Category`,`RYear`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scourier`
--

DROP TABLE IF EXISTS `scourier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scourier` (
  `CourierNo` int(11) NOT NULL,
  `EnrollmentNo` varchar(13) NOT NULL,
  PRIMARY KEY (`CourierNo`),
  KEY `EnrollmentNo` (`EnrollmentNo`),
  CONSTRAINT `scourier_ibfk_1` FOREIGN KEY (`CourierNo`) REFERENCES `courier` (`CourierNo`),
  CONSTRAINT `scourier_ibfk_2` FOREIGN KEY (`EnrollmentNo`) REFERENCES `student` (`EnrollmentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shassea`
--

DROP TABLE IF EXISTS `shassea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shassea` (
  `EnrollmentNo` varchar(13) NOT NULL,
  `SHSDate` varchar(20) NOT NULL,
  `SportsName` varchar(30) NOT NULL,
  `SpOutTime` varchar(20) NOT NULL,
  `Signature` varchar(30) NOT NULL,
  `SHSInTime` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`EnrollmentNo`,`SHSDate`,`SHSInTime`),
  KEY `SportsName` (`SportsName`),
  CONSTRAINT `shassea_ibfk_1` FOREIGN KEY (`SportsName`) REFERENCES `sportsequipmentallocation` (`SpName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sparticipatesina`
--

DROP TABLE IF EXISTS `sparticipatesina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sparticipatesina` (
  `EnrollmentNo` varchar(13) NOT NULL DEFAULT '',
  `Syear` int(11) NOT NULL DEFAULT '0',
  `SEvent` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`EnrollmentNo`,`Syear`,`SEvent`),
  CONSTRAINT `sparticipatesina_ibfk_1` FOREIGN KEY (`EnrollmentNo`) REFERENCES `student` (`EnrollmentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sparticipatesinacategory`
--

DROP TABLE IF EXISTS `sparticipatesinacategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sparticipatesinacategory` (
  `EnrollmentNo` varchar(13) NOT NULL DEFAULT '',
  `Category` varchar(1) NOT NULL,
  PRIMARY KEY (`EnrollmentNo`),
  CONSTRAINT `sparticipatesinacategory_ibfk_1` FOREIGN KEY (`EnrollmentNo`) REFERENCES `sparticipatesina` (`EnrollmentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sparticipatesini`
--

DROP TABLE IF EXISTS `sparticipatesini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sparticipatesini` (
  `EnrollmentNo` varchar(13) NOT NULL DEFAULT '',
  `Syear` int(11) NOT NULL DEFAULT '0',
  `SEvent` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`EnrollmentNo`,`Syear`,`SEvent`),
  CONSTRAINT `sparticipatesini_ibfk_1` FOREIGN KEY (`EnrollmentNo`) REFERENCES `student` (`EnrollmentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sparticipatesins`
--

DROP TABLE IF EXISTS `sparticipatesins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sparticipatesins` (
  `EnrollmentNo` varchar(13) NOT NULL DEFAULT '',
  `Syear` int(11) NOT NULL DEFAULT '0',
  `SEvent` varchar(30) NOT NULL DEFAULT '',
  `EventType` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`EnrollmentNo`,`Syear`,`SEvent`,`EventType`),
  CONSTRAINT `sparticipatesins_ibfk_1` FOREIGN KEY (`EnrollmentNo`) REFERENCES `student` (`EnrollmentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sparticipatesinscategory`
--

DROP TABLE IF EXISTS `sparticipatesinscategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sparticipatesinscategory` (
  `EnrollmentNo` varchar(13) NOT NULL DEFAULT '',
  `Category` varchar(1) NOT NULL,
  PRIMARY KEY (`EnrollmentNo`),
  CONSTRAINT `sparticipatesinscategory_ibfk_1` FOREIGN KEY (`EnrollmentNo`) REFERENCES `sparticipatesins` (`EnrollmentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sports` (
  `SportEvent` varchar(10) NOT NULL,
  `SportEventType` varchar(10) NOT NULL,
  `SpYear` int(11) NOT NULL,
  `Category` varchar(1) NOT NULL,
  `Winner` varchar(30) NOT NULL,
  PRIMARY KEY (`SpYear`,`SportEvent`,`SportEventType`,`Category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sportsequipmentallocation`
--

DROP TABLE IF EXISTS `sportsequipmentallocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sportsequipmentallocation` (
  `SpName` varchar(30) NOT NULL,
  PRIMARY KEY (`SpName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sroomin`
--

DROP TABLE IF EXISTS `sroomin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sroomin` (
  `RoomNo` int(11) NOT NULL DEFAULT '0',
  `RoomLoc` varchar(6) NOT NULL DEFAULT '',
  `RDate` varchar(20) NOT NULL DEFAULT '',
  `InTime` varchar(10) DEFAULT NULL,
  `Signature` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RoomNo`,`RoomLoc`,`RDate`),
  CONSTRAINT `sroomin_ibfk_1` FOREIGN KEY (`RoomNo`, `RoomLoc`) REFERENCES `sroomloc` (`RoomNo`, `RoomLoc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sroomloc`
--

DROP TABLE IF EXISTS `sroomloc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sroomloc` (
  `RoomNo` int(11) NOT NULL DEFAULT '0',
  `RoomLoc` varchar(6) NOT NULL DEFAULT '',
  `RoomType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`RoomNo`,`RoomLoc`),
  KEY `RoomType` (`RoomType`),
  CONSTRAINT `sroomloc_ibfk_1` FOREIGN KEY (`RoomType`) REFERENCES `sroomrent` (`RoomType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sroomrent`
--

DROP TABLE IF EXISTS `sroomrent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sroomrent` (
  `RoomType` varchar(10) NOT NULL DEFAULT '',
  `Rent` int(11) NOT NULL,
  PRIMARY KEY (`RoomType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stakesk`
--

DROP TABLE IF EXISTS `stakesk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stakesk` (
  `EnrollmentNo` varchar(13) NOT NULL,
  `RoomNo` varchar(10) NOT NULL,
  `RoomLoc` varchar(10) NOT NULL,
  `SDate` varchar(20) NOT NULL,
  `InTime` varchar(20) NOT NULL,
  `Signature` varchar(30) NOT NULL,
  PRIMARY KEY (`EnrollmentNo`,`SDate`,`InTime`),
  KEY `RoomNo` (`RoomNo`,`RoomLoc`),
  CONSTRAINT `stakesk_ibfk_1` FOREIGN KEY (`RoomNo`, `RoomLoc`) REFERENCES `keyallocation` (`KARoomNo`, `KARoomLoc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `EnrollmentNo` varchar(13) NOT NULL DEFAULT '',
  `SName` varchar(25) NOT NULL,
  `Batch` varchar(4) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Branch` varchar(20) NOT NULL,
  `HName` varchar(8) NOT NULL,
  `HYear` int(11) NOT NULL,
  `RoomNo` int(11) DEFAULT NULL,
  `RoomLoc` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`EnrollmentNo`),
  KEY `HName` (`HName`,`HYear`),
  KEY `RoomNo` (`RoomNo`,`RoomLoc`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`HName`, `HYear`) REFERENCES `house` (`HName`, `HYear`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`RoomNo`, `RoomLoc`) REFERENCES `sroomloc` (`RoomNo`, `RoomLoc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studentcontact`
--

DROP TABLE IF EXISTS `studentcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentcontact` (
  `EnrollmentNo` varchar(13) NOT NULL,
  `MobileNo` int(11) NOT NULL,
  PRIMARY KEY (`EnrollmentNo`,`MobileNo`),
  CONSTRAINT `studentcontact_ibfk_1` FOREIGN KEY (`EnrollmentNo`) REFERENCES `student` (`EnrollmentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-29 19:51:02
