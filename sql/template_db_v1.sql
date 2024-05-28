-- MySQL dump 10.13  Distrib 8.4.0, for macos14 (arm64)
--
-- Host: localhost    Database: template_db
-- ------------------------------------------------------
-- Server version	8.4.0

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

--
-- Current Database: `template_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `template_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `template_db`;

--
-- Table structure for table `header`
--

DROP TABLE IF EXISTS `header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `header` (
  `ID` int NOT NULL,
  `HEADER_NAME` varchar(255) DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(255) DEFAULT NULL,
  `UPDATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ROUTE` varchar(255) DEFAULT NULL,
  `display` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header`
--

LOCK TABLES `header` WRITE;
/*!40000 ALTER TABLE `header` DISABLE KEYS */;
INSERT INTO `header` VALUES (300,'Academics','root@localhost','2024-05-23 05:03:04','root@localhost','2024-05-23 05:03:04','/academics',0),(301,'Study materials','root@localhost','2024-05-23 05:03:04','root@localhost','2024-05-23 05:03:04','/study-materials',0),(302,'Assignment checker','root@localhost','2024-05-23 05:03:04','root@localhost','2024-05-23 05:03:04','/assignment-checker',0);
/*!40000 ALTER TABLE `header` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `BEFORE_HEADER_INSERT` BEFORE INSERT ON `header` FOR EACH ROW BEGIN
  SET NEW.CREATED_BY =  CURRENT_USER();
  SET NEW.UPDATED_BY = CURRENT_USER();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `HEADER_MENU`
--

DROP TABLE IF EXISTS `HEADER_MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HEADER_MENU` (
  `HEADER_ID` int NOT NULL,
  `MENU_ID` int NOT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`HEADER_ID`,`MENU_ID`),
  KEY `MENU_ID` (`MENU_ID`),
  CONSTRAINT `header_menu_ibfk_1` FOREIGN KEY (`HEADER_ID`) REFERENCES `HEADER` (`ID`),
  CONSTRAINT `header_menu_ibfk_2` FOREIGN KEY (`MENU_ID`) REFERENCES `MENU` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HEADER_MENU`
--

LOCK TABLES `HEADER_MENU` WRITE;
/*!40000 ALTER TABLE `HEADER_MENU` DISABLE KEYS */;
INSERT INTO `HEADER_MENU` VALUES (300,500,'root@localhost','2024-05-23 05:16:08'),(301,502,'root@localhost','2024-05-23 05:16:08'),(302,503,'root@localhost','2024-05-23 05:16:08'),(302,504,'root@localhost','2024-05-23 05:16:08');
/*!40000 ALTER TABLE `HEADER_MENU` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `BEFORE_HEADER__MENU_INSERT` BEFORE INSERT ON `header_menu` FOR EACH ROW BEGIN
  SET NEW.CREATED_BY =  CURRENT_USER();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `PARENT_ID` int DEFAULT NULL,
  `ID` int NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(255) DEFAULT NULL,
  `UPDATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `display` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PARENT_ID` (`PARENT_ID`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`PARENT_ID`) REFERENCES `MENU` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (NULL,500,'degrees and programs','root@localhost','2024-05-23 04:59:47','root@localhost','2024-05-23 04:59:47',0),(NULL,501,'library','root@localhost','2024-05-23 04:59:47','root@localhost','2024-05-23 04:59:47',0),(NULL,502,'catalog','root@localhost','2024-05-23 04:59:47','root@localhost','2024-05-23 04:59:47',0),(NULL,503,'upload assigment','root@localhost','2024-05-23 04:59:47','root@localhost','2024-05-23 04:59:47',0),(NULL,504,'upload grade','root@localhost','2024-05-23 04:59:47','root@localhost','2024-05-23 04:59:47',0),(500,600,'graduate programs','root@localhost','2024-05-23 04:59:47','root@localhost','2024-05-23 04:59:47',0),(500,601,'undergraduate programs','root@localhost','2024-05-23 04:59:47','root@localhost','2024-05-23 04:59:47',0),(502,602,'calendar','root@localhost','2024-05-23 04:59:47','root@localhost','2024-05-23 04:59:47',0),(502,603,'courses','root@localhost','2024-05-23 04:59:47','root@localhost','2024-05-23 04:59:47',0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `BEFORE_MENU_INSERT` BEFORE INSERT ON `menu` FOR EACH ROW BEGIN
  SET NEW.CREATED_BY =  CURRENT_USER();
  SET NEW.UPDATED_BY = CURRENT_USER();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ROLE`
--

DROP TABLE IF EXISTS `ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE` (
  `ID` int NOT NULL,
  `ROLE_NAME` varchar(255) DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(255) DEFAULT NULL,
  `UPDATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` VALUES (100,'user','root@localhost','2024-05-23 04:57:56','root@localhost','2024-05-23 04:57:56'),(101,'student','root@localhost','2024-05-23 04:57:56','root@localhost','2024-05-23 04:57:56'),(102,'faculty','root@localhost','2024-05-23 04:57:56','root@localhost','2024-05-23 04:57:56');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `BEFORE_ROLE_INSERT` BEFORE INSERT ON `role` FOR EACH ROW BEGIN
  SET NEW.CREATED_BY =  CURRENT_USER();
  SET NEW.UPDATED_BY = CURRENT_USER();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ROLE_HEADER`
--

DROP TABLE IF EXISTS `ROLE_HEADER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_HEADER` (
  `HEADER_ID` int NOT NULL,
  `ROLE_ID` int NOT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`HEADER_ID`,`ROLE_ID`),
  KEY `ROLE_ID` (`ROLE_ID`),
  CONSTRAINT `role_header_ibfk_1` FOREIGN KEY (`HEADER_ID`) REFERENCES `HEADER` (`ID`),
  CONSTRAINT `role_header_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_HEADER`
--

LOCK TABLES `ROLE_HEADER` WRITE;
/*!40000 ALTER TABLE `ROLE_HEADER` DISABLE KEYS */;
INSERT INTO `ROLE_HEADER` VALUES (300,100,NULL,'2024-05-24 22:02:21'),(300,101,NULL,'2024-05-24 22:02:21'),(301,100,NULL,'2024-05-24 22:02:21'),(301,101,NULL,'2024-05-24 22:02:21'),(302,102,NULL,'2024-05-24 22:02:21');
/*!40000 ALTER TABLE `ROLE_HEADER` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `BEFORE_ROLE_HEADER_INSERT` BEFORE INSERT ON `role_header` FOR EACH ROW BEGIN
  SET NEW.CREATED_BY =  CURRENT_USER();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(255) DEFAULT NULL,
  `UPDATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ROLE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ROLE_ID` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'ashwija','ashwij@gmail.com','$2a$08$j/f.sWD8lHsjZgic9s.3cOfjiZ2F2/97REj9gOauzw3uSXHz97AEm','root@localhost','2024-05-23 14:57:38','root@localhost','2024-05-23 14:57:38',100),(2,'ash','test@gmail.com','$2a$08$iRVONdKhL67Q.LvtAjsZrelWaXmbXTik6E6ayI0o8duSdF195HU6e','root@localhost','2024-05-23 19:40:12','root@localhost','2024-05-23 19:40:12',100),(3,'test1','test1@gmail.com','$2a$08$U.9tpejXp8/WbdF/Nx9VNOZbRMV6ZGacljFnzg53a/C.ihtVvvbrG','root@localhost','2024-05-23 19:41:46','root@localhost','2024-05-23 19:41:46',100),(4,'test','ashwijanayak@gmail.com','$2a$08$WSvdMKFNtqOpSxzP6FsTvOLPqFxKCMOdTW.rptRMHgFCILta/eEsq','root@localhost','2024-05-23 19:52:22','root@localhost','2024-05-23 19:52:22',100),(5,'swig','swig@gmail.com','$2a$08$bN9VgkQVDpbs5FSRXn0sSusXWKvU3zKXjXmuMxqrloWxj6I.5p42i','root@localhost','2024-05-23 20:03:58','root@localhost','2024-05-23 20:03:58',100),(6,'swig1','swig1@gmail.com','$2a$08$TPGmjI7c1Uyv/5RAXg/gS.NexgoF3iUF3Q/db4I2nzC7tKET3NUe2','root@localhost','2024-05-23 20:04:39','root@localhost','2024-05-23 20:04:39',100),(7,'swig2','swig2@gmail.com','$2a$08$h8vgtA.AFC/z49bhMS9ij.NbSFn2H2NRDeu0jATQoof3or8fL22Qy','root@localhost','2024-05-23 20:11:20','root@localhost','2024-05-23 20:11:20',100),(8,'test10','test10@gmail.com','$2a$08$iji2xZ1B/yV.gis7y66H/.PMusruz9gyp0Gk0OJKy.f2zIG92a0.a','root@localhost','2024-05-23 20:21:48','root@localhost','2024-05-23 20:21:48',100),(9,'test21','test21@gmail.com','$2a$08$Zn/4s.43IC9ngKm3JjMcw.8GcSBk6b.KZ7RsYJWnesoAoIrl8mt6q','root@localhost','2024-05-23 21:29:37','root@localhost','2024-05-23 21:29:37',100),(10,'test50','test50@gmail.com','$2a$08$tHAszIDhT1P5X8bgzPApye9NtIPir4J3XbaIhk8IYp3CHpCWANfza','root@localhost','2024-05-23 22:38:37','root@localhost','2024-05-23 22:38:37',100),(11,'test','test@gmail.com','123','root@localhost','2024-05-24 15:06:43','root@localhost','2024-05-24 15:06:43',100),(12,'test20','test20@gmail.com','$2a$08$2SlaBLNNyo4QGXfgdbTzZ.rI1j0OOSbIQ31t0OGKQnizFTGm8Z.gq','root@localhost','2024-05-24 15:10:58','root@localhost','2024-05-24 15:10:58',100),(13,'test100','test100@gmail.com','$2a$08$bbofYQq23zgNO4yajuDxwe1pqzmSuLTGv1Td4pj6GDCLQ4XfBySCK','root@localhost','2024-05-24 18:55:22','root@localhost','2024-05-24 18:55:22',101);
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `BEFORE_USER_INSERT` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
  SET NEW.CREATED_BY =  CURRENT_USER();
  SET NEW.UPDATED_BY = CURRENT_USER();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `USER_ROLE`
--

DROP TABLE IF EXISTS `USER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE` (
  `ROLE_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  UNIQUE KEY `USER_ROLE_USER_ID_ROLE_ID_unique` (`ROLE_ID`,`USER_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE`
--

LOCK TABLES `USER_ROLE` WRITE;
/*!40000 ALTER TABLE `USER_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-25  0:06:16
