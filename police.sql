-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: police
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `Assignments`
--

DROP TABLE IF EXISTS `Assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assignments` (
  `badgeNo` int(11) NOT NULL,
  `caseNo` int(11) NOT NULL,
  PRIMARY KEY (`badgeNo`,`caseNo`),
  KEY `caseNo` (`caseNo`),
  CONSTRAINT `Assignments_ibfk_1` FOREIGN KEY (`badgeNo`) REFERENCES `Detectives` (`badgeNo`),
  CONSTRAINT `Assignments_ibfk_2` FOREIGN KEY (`caseNo`) REFERENCES `Cases` (`caseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignments`
--

LOCK TABLES `Assignments` WRITE;
/*!40000 ALTER TABLE `Assignments` DISABLE KEYS */;
INSERT INTO `Assignments` VALUES (10,1);
/*!40000 ALTER TABLE `Assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AttachedTo`
--

DROP TABLE IF EXISTS `AttachedTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AttachedTo` (
  `susId` int(11) NOT NULL,
  `caseNo` int(11) NOT NULL,
  PRIMARY KEY (`susId`,`caseNo`),
  KEY `caseNo` (`caseNo`),
  CONSTRAINT `AttachedTo_ibfk_1` FOREIGN KEY (`caseNo`) REFERENCES `Cases` (`caseNo`),
  CONSTRAINT `AttachedTo_ibfk_2` FOREIGN KEY (`susId`) REFERENCES `Suspect` (`susId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AttachedTo`
--

LOCK TABLES `AttachedTo` WRITE;
/*!40000 ALTER TABLE `AttachedTo` DISABLE KEYS */;
INSERT INTO `AttachedTo` VALUES (1,1);
/*!40000 ALTER TABLE `AttachedTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cases`
--

DROP TABLE IF EXISTS `Cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cases` (
  `caseNo` int(11) NOT NULL AUTO_INCREMENT,
  `offense` varchar(255) DEFAULT NULL,
  `solved` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`caseNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cases`
--

LOCK TABLES `Cases` WRITE;
/*!40000 ALTER TABLE `Cases` DISABLE KEYS */;
INSERT INTO `Cases` VALUES (1,'Larceny',0),(2,'Homicide',1);
/*!40000 ALTER TABLE `Cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cruisers`
--

DROP TABLE IF EXISTS `Cruisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cruisers` (
  `vin` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `officerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`vin`),
  KEY `deptId` (`deptId`),
  KEY `officerId` (`officerId`),
  CONSTRAINT `Cruisers_ibfk_1` FOREIGN KEY (`deptId`) REFERENCES `Police_Dept` (`deptId`),
  CONSTRAINT `Cruisers_ibfk_2` FOREIGN KEY (`officerId`) REFERENCES `Officers` (`officerId`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cruisers`
--

LOCK TABLES `Cruisers` WRITE;
/*!40000 ALTER TABLE `Cruisers` DISABLE KEYS */;
INSERT INTO `Cruisers` VALUES (10000,'Crown Vic',1,22);
/*!40000 ALTER TABLE `Cruisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detectives`
--

DROP TABLE IF EXISTS `Detectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Detectives` (
  `badgeNo` int(11) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(255) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `deptId` int(11) NOT NULL,
  PRIMARY KEY (`badgeNo`),
  KEY `deptId` (`deptId`),
  CONSTRAINT `Detectives_ibfk_1` FOREIGN KEY (`deptId`) REFERENCES `Police_Dept` (`deptId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detectives`
--

LOCK TABLES `Detectives` WRITE;
/*!40000 ALTER TABLE `Detectives` DISABLE KEYS */;
INSERT INTO `Detectives` VALUES (10,'Bronson','Jet',1);
/*!40000 ALTER TABLE `Detectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Divisions`
--

DROP TABLE IF EXISTS `Divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Divisions` (
  `title` varchar(255) NOT NULL,
  `deptId` int(11) NOT NULL,
  PRIMARY KEY (`title`),
  KEY `deptId` (`deptId`),
  CONSTRAINT `Divisions_ibfk_1` FOREIGN KEY (`deptId`) REFERENCES `Police_Dept` (`deptId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Divisions`
--

LOCK TABLES `Divisions` WRITE;
/*!40000 ALTER TABLE `Divisions` DISABLE KEYS */;
INSERT INTO `Divisions` VALUES ('Drug Enforcement',1),('SWAT',1),('Theft',1),('Traffic',1),('Zack',1);
/*!40000 ALTER TABLE `Divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Evidence`
--

DROP TABLE IF EXISTS `Evidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Evidence` (
  `evId` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `caseNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`evId`),
  KEY `caseNo` (`caseNo`),
  CONSTRAINT `Evidence_ibfk_1` FOREIGN KEY (`caseNo`) REFERENCES `Cases` (`caseNo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evidence`
--

LOCK TABLES `Evidence` WRITE;
/*!40000 ALTER TABLE `Evidence` DISABLE KEYS */;
INSERT INTO `Evidence` VALUES (1,'Fingerprints',1);
/*!40000 ALTER TABLE `Evidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Incidents`
--

DROP TABLE IF EXISTS `Incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Incidents` (
  `incidentId` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `location` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`incidentId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Incidents`
--

LOCK TABLES `Incidents` WRITE;
/*!40000 ALTER TABLE `Incidents` DISABLE KEYS */;
INSERT INTO `Incidents` VALUES (1,'Bar Fight','McLaren\'s'),(2,'Breaking and entering','CTB');
/*!40000 ALTER TABLE `Incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Leadership`
--

DROP TABLE IF EXISTS `Leadership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Leadership` (
  `empId` int(11) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`empId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Leadership`
--

LOCK TABLES `Leadership` WRITE;
/*!40000 ALTER TABLE `Leadership` DISABLE KEYS */;
INSERT INTO `Leadership` VALUES (1,'Root','Julius','Chief'),(2,'Gordon','Jim','Commissioner');
/*!40000 ALTER TABLE `Leadership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Officers`
--

DROP TABLE IF EXISTS `Officers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Officers` (
  `officerId` int(11) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(255) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `rank` varchar(200) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`officerId`),
  KEY `title` (`title`),
  CONSTRAINT `Officers_ibfk_1` FOREIGN KEY (`title`) REFERENCES `Divisions` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Officers`
--

LOCK TABLES `Officers` WRITE;
/*!40000 ALTER TABLE `Officers` DISABLE KEYS */;
INSERT INTO `Officers` VALUES (22,'Jones','Robert','Officer','Traffic'),(26,'Johnson','Cliff','Officer','Theft'),(27,'Satchwell','Tanner','Sergeant','Zack');
/*!40000 ALTER TABLE `Officers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Police_Dept`
--

DROP TABLE IF EXISTS `Police_Dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Police_Dept` (
  `deptId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`deptId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Police_Dept`
--

LOCK TABLES `Police_Dept` WRITE;
/*!40000 ALTER TABLE `Police_Dept` DISABLE KEYS */;
INSERT INTO `Police_Dept` VALUES (1,'Los Santos');
/*!40000 ALTER TABLE `Police_Dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Radios`
--

DROP TABLE IF EXISTS `Radios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Radios` (
  `radioId` int(11) NOT NULL AUTO_INCREMENT,
  `deptId` int(11) DEFAULT NULL,
  PRIMARY KEY (`radioId`),
  KEY `deptId` (`deptId`),
  CONSTRAINT `Radios_ibfk_1` FOREIGN KEY (`deptId`) REFERENCES `Police_Dept` (`deptId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Radios`
--

LOCK TABLES `Radios` WRITE;
/*!40000 ALTER TABLE `Radios` DISABLE KEYS */;
INSERT INTO `Radios` VALUES (1,1);
/*!40000 ALTER TABLE `Radios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Respond`
--

DROP TABLE IF EXISTS `Respond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Respond` (
  `officerId` int(11) NOT NULL,
  `incidentId` int(11) NOT NULL,
  PRIMARY KEY (`officerId`,`incidentId`),
  KEY `incidentId` (`incidentId`),
  CONSTRAINT `Respond_ibfk_1` FOREIGN KEY (`officerId`) REFERENCES `Officers` (`officerId`),
  CONSTRAINT `Respond_ibfk_2` FOREIGN KEY (`incidentId`) REFERENCES `Incidents` (`incidentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Respond`
--

LOCK TABLES `Respond` WRITE;
/*!40000 ALTER TABLE `Respond` DISABLE KEYS */;
INSERT INTO `Respond` VALUES (22,1);
/*!40000 ALTER TABLE `Respond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sidearms`
--

DROP TABLE IF EXISTS `Sidearms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sidearms` (
  `serialNo` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  PRIMARY KEY (`serialNo`),
  KEY `deptId` (`deptId`),
  CONSTRAINT `Sidearms_ibfk_1` FOREIGN KEY (`deptId`) REFERENCES `Police_Dept` (`deptId`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sidearms`
--

LOCK TABLES `Sidearms` WRITE;
/*!40000 ALTER TABLE `Sidearms` DISABLE KEYS */;
INSERT INTO `Sidearms` VALUES (1000,'Magnum',1);
/*!40000 ALTER TABLE `Sidearms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Support_Personnel`
--

DROP TABLE IF EXISTS `Support_Personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Support_Personnel` (
  `empId` int(11) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`empId`),
  KEY `title` (`title`),
  CONSTRAINT `Support_Personnel_ibfk_1` FOREIGN KEY (`title`) REFERENCES `Divisions` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Support_Personnel`
--

LOCK TABLES `Support_Personnel` WRITE;
/*!40000 ALTER TABLE `Support_Personnel` DISABLE KEYS */;
INSERT INTO `Support_Personnel` VALUES (50,'Hanzo','Yuko','Traffic');
/*!40000 ALTER TABLE `Support_Personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suspect`
--

DROP TABLE IF EXISTS `Suspect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Suspect` (
  `susId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `address` varchar(400) DEFAULT NULL,
  `caseNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`susId`),
  KEY `caseNo` (`caseNo`),
  CONSTRAINT `Suspect_ibfk_1` FOREIGN KEY (`caseNo`) REFERENCES `Cases` (`caseNo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suspect`
--

LOCK TABLES `Suspect` WRITE;
/*!40000 ALTER TABLE `Suspect` DISABLE KEYS */;
INSERT INTO `Suspect` VALUES (1,'Hamburglar','12345 McDonald Way',1);
/*!40000 ALTER TABLE `Suspect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo`
--

DROP TABLE IF EXISTS `todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `done` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo`
--

LOCK TABLES `todo` WRITE;
/*!40000 ALTER TABLE `todo` DISABLE KEYS */;
INSERT INTO `todo` VALUES (25,'still wrosk','2017-03-29 21:03:17',0),(28,'hmmdjslakfjasd','2017-03-29 21:26:36',0),(29,'zac','2017-04-04 23:46:23',0),(30,'fjdsadjklasd','2017-04-05 00:42:21',0);
/*!40000 ALTER TABLE `todo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-12 14:40:08
