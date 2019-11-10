-- MySQL dump 10.13  Distrib 5.7.15, for Win64 (x86_64)
--
-- Host: localhost    Database: task_assignment
-- ------------------------------------------------------
-- Server version	5.1.59-community

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
-- Table structure for table `employee`
--
CREATE DATABASE task_assignment;
USE task_assignment;
DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeId` int(11) NOT NULL AUTO_INCREMENT,
  `endTask` date DEFAULT NULL,
  `employeeName` varchar(255) DEFAULT NULL,
  `startTask` date DEFAULT NULL,
  `taskDescription` varchar(255) DEFAULT NULL,
  `project_Id` int(11) NOT NULL,
  PRIMARY KEY (`employeeId`),
  KEY `FK3b0hd6hfo2wn44g5dhcnxlw66` (`project_Id`),
  CONSTRAINT `FK3b0hd6hfo2wn44g5dhcnxlw66` FOREIGN KEY (`project_Id`) REFERENCES `project` (`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (7,'2017-04-30','Joey','2017-04-01','UI',1),(8,'2017-04-30','Ross','2017-04-01','Backend',1),(9,'2017-04-28','Monica','2017-04-02','Backend',1),(10,'2017-04-30','Chandler','2017-04-01','Data analysis',3),(11,'2017-04-18','Rachel','2017-04-11','Sales',3),(12,NULL,'Phoebe',NULL,NULL,5),(13,NULL,'Mike',NULL,NULL,5),(14,NULL,'Sawyer',NULL,NULL,4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(255) NOT NULL,
  PRIMARY KEY (`projectId`),
  UNIQUE KEY `UK_t386d5j9yt8d3js6n14iocnlw` (`projectName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (5,'Marriott'),(4,'SWA'),(1,'IGG'),(3,'ADIDAS');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-26 15:39:33
