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
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mac` text NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_devices_user1_idx` (`userId`),
  CONSTRAINT `fk_devices_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (39,'eb63b707-05a5-4b0e-9fa9-c9c83512965e',81),(40,'7213ff5e-ef08-4c3f-92ab-664cc6dbb4ef',82),(41,'6a056ac7-768c-47ba-b887-6f10d468d39f',83);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `enterprise` VALUES (1,'Microsoft','-----BEGIN PGP PUBLIC KEY BLOCK-----\\n\\nxjMEYU7EbBYJKwYBBAHaRw8BAQdAhI8zq2NQ88VLOxuO4Fq76FBed8cCTD+X\\nQnO/uFJT1h7NGmFyaWVsIDxsYXJhcGE5OUBnbWFpbC5jb20+wowEEBYKAB0F\\nAmFOxGwECwkHCAMVCAoEFgACAQIZAQIbAwIeAQAhCRC9vHvHbmxBSxYhBLrk\\nSdtl0HUw1gkmKr28e8dubEFL/UEBAOH5G43J9+fOBZgsgHfhECzosYPisSxe\\no14OZStgpelPAQCxX6ihV9ISOiEaVs0kFlUw9R7VK0MBXT1MRk3rHxUeDM44\\nBGFOxGwSCisGAQQBl1UBBQEBB0CqXS9tZLIuHAWT9gvHl1ypaxcPFyXkIFeB\\nzsxrAL3abQMBCAfCeAQYFggACQUCYU7EbAIbDAAhCRC9vHvHbmxBSxYhBLrk\\nSdtl0HUw1gkmKr28e8dubEFLhBoBANxXw1Ts4lhH8IqyKgSGb62Bux3i+n9z\\n8SlxeYlkF4wuAQCtVJ/dPTRxmmuH1Vn4TWUpzuy4LawBlopLVkCPWAXDAg==\\n=jv17\\n-----END PGP PUBLIC KEY BLOCK-----\\n','data','Bill Gates',1);
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
  `email` tinyint NOT NULL DEFAULT '1',
  `location` tinyint NOT NULL DEFAULT '0',
  `other` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
INSERT INTO `flags` VALUES (92,0,0,0,0,0),(93,0,0,0,0,0),(94,1,1,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'one',1),(2,'two',2),(3,'three',3),(4,'four',4),(5,'five',5);
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
  `email` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_user_flags1_idx` (`flagsId`),
  KEY `fk_user_level1_idx` (`levelId`),
  CONSTRAINT `fk_user_flags1` FOREIGN KEY (`flagsId`) REFERENCES `flags` (`id`),
  CONSTRAINT `fk_user_level1` FOREIGN KEY (`levelId`) REFERENCES `level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (81,'DRKY','-----BEGIN PGP PUBLIC KEY BLOCK-----\n\nxjMEYU7C2RYJKwYBBAHaRw8BAQdAOjKshh3JMwsDKN80RtAKk7bGVxTLuf+u\nFCY2Wf9E4GrNGURSS1kgPGxhcmFwYTk5QGdtYWlsLmNvbT7CjAQQFgoAHQUC\nYU7C2QQLCQcIAxUICgQWAAIBAhkBAhsDAh4BACEJENOqi9e70Q4ZFiEE6p/+\n8VL1WGLU5q3O06qL17vRDhmMsAD/YKyBRqgb6mWg1kA633JBJzwHh8kbYkpz\nS6rpDX3bkDsA/1DRG2Nx3mXpDRgnrGJLejXpGiV2k840Sl1r/Z+Sa28PzjgE\nYU7C2RIKKwYBBAGXVQEFAQEHQK9C5GQ2d6K6f/JR7JJia4BB2RpiyVc7mrXC\nkAyPTqMrAwEIB8J4BBgWCAAJBQJhTsLZAhsMACEJENOqi9e70Q4ZFiEE6p/+\n8VL1WGLU5q3O06qL17vRDhlj9wD9GlQ9mzJQJAXavHm/PWWswW+x0+zNHMI/\n2zFE6TentC0BAJ7Em5CWEaIWtnII2qupFTe8Gs9UcLnQ8ThPRM2SB2sJ\n=Cpfc\n-----END PGP PUBLIC KEY BLOCK-----\n',92,1,1,'larapa99@gmail.com'),(82,'ariel','-----BEGIN PGP PUBLIC KEY BLOCK-----\n\nxjMEYU7EbBYJKwYBBAHaRw8BAQdAhI8zq2NQ88VLOxuO4Fq76FBed8cCTD+X\nQnO/uFJT1h7NGmFyaWVsIDxsYXJhcGE5OUBnbWFpbC5jb20+wowEEBYKAB0F\nAmFOxGwECwkHCAMVCAoEFgACAQIZAQIbAwIeAQAhCRC9vHvHbmxBSxYhBLrk\nSdtl0HUw1gkmKr28e8dubEFL/UEBAOH5G43J9+fOBZgsgHfhECzosYPisSxe\no14OZStgpelPAQCxX6ihV9ISOiEaVs0kFlUw9R7VK0MBXT1MRk3rHxUeDM44\nBGFOxGwSCisGAQQBl1UBBQEBB0CqXS9tZLIuHAWT9gvHl1ypaxcPFyXkIFeB\nzsxrAL3abQMBCAfCeAQYFggACQUCYU7EbAIbDAAhCRC9vHvHbmxBSxYhBLrk\nSdtl0HUw1gkmKr28e8dubEFLhBoBANxXw1Ts4lhH8IqyKgSGb62Bux3i+n9z\n8SlxeYlkF4wuAQCtVJ/dPTRxmmuH1Vn4TWUpzuy4LawBlopLVkCPWAXDAg==\n=jv17\n-----END PGP PUBLIC KEY BLOCK-----\n',93,1,1,'larapa99@gmail.com'),(83,'ariel2','-----BEGIN PGP PUBLIC KEY BLOCK-----\n\nxjMEYU7EtRYJKwYBBAHaRw8BAQdAq1NdEMnRsLASJJhQFGyOPz1w093qRBKE\n8pbuTRnSvcrNG2FyaWVsMiA8bGFyYXBhOTlAZ21haWwuY29tPsKMBBAWCgAd\nBQJhTsS1BAsJBwgDFQgKBBYAAgECGQECGwMCHgEAIQkQ/GPWpqll5AYWIQR+\nODVgJRpfBVk3ts78Y9amqWXkBsByAP4m8T/Z4VQflnDqxu1h+/1RcIDidZFt\nyluoKL1FXEWZ0AEAw9qq2QU3I2OPkrGQcsOavKlogycdGbcUkxmZIyjS6wLO\nOARhTsS1EgorBgEEAZdVAQUBAQdA7/VzTpECTvwV5llElv08OHZm1Gt71s52\nBJHw0JXR3HQDAQgHwngEGBYIAAkFAmFOxLUCGwwAIQkQ/GPWpqll5AYWIQR+\nODVgJRpfBVk3ts78Y9amqWXkBvY1AQDBeFk1y9GojFGZlURlAazuAnd8eovP\nihAOrkx/Jl/0KAD/SMTAXQRHEgMox/uTZFnkjA6wMEW+TWEwooXI2sc6Cwk=\n=JUaY\n-----END PGP PUBLIC KEY BLOCK-----\n',94,2,1,'larapa99@gmail.com');
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

-- Dump completed on 2021-09-25  1:57:48
