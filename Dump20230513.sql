-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 172.20.1.32    Database: ssi_migration
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `project_to_users`
--

DROP TABLE IF EXISTS `project_to_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_to_users` (
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `ptu_users_idx` (`user_id`),
  CONSTRAINT `project_to_users_fk1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  CONSTRAINT `project_to_users_fk2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_to_users`
--

LOCK TABLES `project_to_users` WRITE;
/*!40000 ALTER TABLE `project_to_users` DISABLE KEYS */;
INSERT INTO `project_to_users` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `project_to_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `project_id` int NOT NULL,
  `project_name` varchar(45) DEFAULT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `customer_name` varchar(45) DEFAULT NULL,
  `customer_poc` varchar(45) DEFAULT NULL,
  `impl_partner_name` varchar(45) DEFAULT NULL,
  `impl_partner_poc` varchar(45) DEFAULT NULL,
  `cloud_partner_name` varchar(45) DEFAULT NULL,
  `cloud_partner_poc` varchar(45) DEFAULT NULL,
  `project_type` varchar(100) DEFAULT NULL,
  `project_duration` varchar(45) DEFAULT NULL,
  `current_systems` varchar(45) DEFAULT NULL,
  `future_systems` varchar(100) DEFAULT NULL,
  `hosting_details` varchar(45) DEFAULT NULL,
  `proj_testing_iframe_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Vilore','Smartsoft','Vilore Food','vijays','Tekplayz','abrarzss','xxxxxssz','Azures','ECC to S/4 HANA Conversion','zxzxz','XCXCssd','SDSdz','XCXCXCCCCCCCCCCCCCCCCCCCCs','http://smartsoftus.bitrix24.com/~4bu0r'),(2,'COA','Tekplay',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Tom','Smart',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user','2023-05-09 07:26:17','2023-05-09 07:26:17'),(2,'moderator','2023-05-09 07:26:17','2023-05-09 07:26:17'),(3,'admin','2023-05-09 07:26:17','2023-05-09 07:26:17');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`roleId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES ('2023-05-09 07:57:12','2023-05-09 07:57:12',1,1),('2023-05-09 08:35:18','2023-05-09 08:35:18',1,2),('2023-05-09 08:36:54','2023-05-09 08:36:54',1,3),('2023-05-11 18:56:29','2023-05-11 18:56:29',2,4),('2023-05-11 18:56:29','2023-05-11 18:56:29',3,4);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'vijay','vijayananth.m@tekplay.com','$2a$08$TswvymhMzt5OEZQ81qbG.exoPe0diMvCdrdwCvpGvyps5PR.2n6vq','2023-05-09 07:57:12','2023-05-09 07:57:12'),(2,'rajkumar.p','rajkumar.p@test.com','$2a$08$NgAq7Y2v4TINOo4diGril.sOlgjHAUTAzVQm6emNAUNDKyvNyzv9m','2023-05-09 08:35:17','2023-05-09 08:35:17'),(3,'vijay1','vijayananth.m1@tekplay.com','$2a$08$xPauMe31hN4Py7GtfPIv1O4syvS/D/tNZiJ9oUPNdpBpYzpRnqBSq','2023-05-09 08:36:54','2023-05-09 08:36:54'),(4,'renjith','renjith.k@tekplay.com','$2a$08$gMWrJyBTgSMcjZoWIzjur.T3WL2U20rEXkFDlI4I7FlwHtDgqMknO','2023-05-11 18:56:29','2023-05-11 18:56:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-13 16:50:38
