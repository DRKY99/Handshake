-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: handshake
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `enterprise`
--

DROP TABLE IF EXISTS `enterprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `public_key` text NOT NULL,
  `contact_data` text NOT NULL,
  `ceo` varchar(150) NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise`
--

LOCK TABLES `enterprise` WRITE;
/*!40000 ALTER TABLE `enterprise` DISABLE KEYS */;
INSERT INTO `enterprise` VALUES (1,'Microsoft','none','3443241313','Bill Gates',0),(2,'Apple','ksajdhasjkdhakjowkpda','lsajdawa','Steve Jobs',1);
/*!40000 ALTER TABLE `enterprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` tinyint NOT NULL DEFAULT '0',
  `phone` tinyint NOT NULL DEFAULT '0',
  `email` tinyint NOT NULL DEFAULT '0',
  `location` tinyint NOT NULL DEFAULT '0',
  `other` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
INSERT INTO `flags` VALUES (1,0,0,0,0,0),(2,0,0,0,0,0),(3,0,0,0,0,0),(4,0,0,0,0,0),(5,0,0,0,0,0),(6,0,0,0,0,0),(7,0,0,0,0,0),(8,0,0,0,0,0),(9,0,0,0,0,0),(10,0,0,0,0,0),(11,0,0,0,0,0),(12,0,0,0,0,0),(13,0,0,0,0,0),(14,0,0,0,0,0),(15,0,0,0,0,0),(16,0,0,0,0,0),(17,0,0,0,0,0),(18,0,0,0,0,0),(19,0,0,0,0,0),(20,0,0,0,0,0),(21,0,0,0,0,0),(22,0,0,0,0,0),(23,0,0,0,0,0),(24,0,0,0,0,0);
/*!40000 ALTER TABLE `flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `rank` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'noob',1);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relationship` (
  `enterpriseId` int NOT NULL,
  `flagsId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`enterpriseId`,`userId`),
  KEY `fk_enterprise_has_user_user1_idx` (`userId`),
  KEY `fk_enterprise_has_user_enterprise1_idx` (`enterpriseId`),
  KEY `fk_relationship_flags1_idx` (`flagsId`),
  CONSTRAINT `fk_enterprise_has_user_enterprise1` FOREIGN KEY (`enterpriseId`) REFERENCES `enterprise` (`id`),
  CONSTRAINT `fk_enterprise_has_user_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_relationship_flags1` FOREIGN KEY (`flagsId`) REFERENCES `flags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship`
--

LOCK TABLES `relationship` WRITE;
/*!40000 ALTER TABLE `relationship` DISABLE KEYS */;
INSERT INTO `relationship` VALUES (1,10,1);
/*!40000 ALTER TABLE `relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(45) NOT NULL,
  `public_key` text NOT NULL,
  `flagsId` int NOT NULL,
  `levelId` int NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_user_flags1_idx` (`flagsId`),
  KEY `fk_user_level1_idx` (`levelId`),
  CONSTRAINT `fk_user_flags1` FOREIGN KEY (`flagsId`) REFERENCES `flags` (`id`),
  CONSTRAINT `fk_user_level1` FOREIGN KEY (`levelId`) REFERENCES `level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'DRYK','none',1,1,0),(2,'USER1','ksajdhasjkdhakjowkpda',6,1,1),(3,'USER1','ksajdhasjkdhakjowkpda',7,1,1),(4,'dasdw','sdjkahdi',12,1,1),(5,'das','sdjkahdi',13,1,1),(6,'das','sdjkahdi',14,1,1),(7,'das','sdjkahdi',15,1,1),(8,'das','sdjkahdi',16,1,1),(9,'das','sdjkahdi',17,1,1),(10,'das','sdjkahdi',18,1,1),(11,'das','sdjkahdi',19,1,1),(12,'dasd','sdjkahdi',20,1,1),(13,'dasd','sdjkahdi',21,1,1),(14,'dasd','sdjkahdi',22,1,1),(15,'dasd','sdjkahdi',23,1,1),(16,'dasd','sdjkahdi',24,1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-24  2:59:46
