-- MySQL dump 10.13  Distrib 9.7.1, for macos15 (arm64)
--
-- Host: localhost    Database: ghostnetfishing
-- ------------------------------------------------------
-- Server version	9.7.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '9d28333e-7330-11f1-aa37-a1d239a593ee:1-111';

--
-- Current Database: `ghostnetfishing`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ghostnetfishing` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ghostnetfishing`;

--
-- Table structure for table `geisternetz`
--

DROP TABLE IF EXISTS `geisternetz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geisternetz` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `groesse` varchar(255) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `status` enum('BERGUNG_BEVORSTEHEND','GEBORGEN','GEMELDET','VERSCHOLLEN') DEFAULT NULL,
  `melder_id` bigint DEFAULT NULL,
  `berger_id` bigint DEFAULT NULL,
  `verschollen_melder_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi3pgulxfcgafwydisf5miabob` (`melder_id`),
  KEY `FK2gidqe8hl81rusxpf1yh7bq2u` (`berger_id`),
  KEY `FKqk0xnaigbxus2l0nqp81l49ht` (`verschollen_melder_id`),
  CONSTRAINT `FK2gidqe8hl81rusxpf1yh7bq2u` FOREIGN KEY (`berger_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FKi3pgulxfcgafwydisf5miabob` FOREIGN KEY (`melder_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FKqk0xnaigbxus2l0nqp81l49ht` FOREIGN KEY (`verschollen_melder_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geisternetz`
--

LOCK TABLES `geisternetz` WRITE;
/*!40000 ALTER TABLE `geisternetz` DISABLE KEYS */;
INSERT INTO `geisternetz` VALUES (1,'ca. 3 x 5 m',30,34,'BERGUNG_BEVORSTEHEND',NULL,14,NULL),(2,'ca. 10 x 3 m',23.34,40.21,'GEBORGEN',11,15,NULL),(3,'ca. 5 x 4 m',44,31.21,'VERSCHOLLEN',12,NULL,16),(4,'ca. 3 x 4 m',45.11,28.79,'GEMELDET',13,NULL,NULL),(5,'ca. 3 x 3 m',12,46,'GEMELDET',NULL,NULL,NULL);
/*!40000 ALTER TABLE `geisternetz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `telefonnummer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (11,'Bernd','0176 12345678'),(12,'Kai','0153 12345679'),(13,'Lara','0153 12457377'),(14,'Robert','0178 12235847'),(15,'Marc','0175 14793721'),(16,'Fritz','0164 73358380');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-11  1:56:56
