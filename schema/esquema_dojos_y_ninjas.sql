-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: caro-mysql.dkr    Database: esquema_dojos_y_ninjas
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `dojos`
--

DROP TABLE IF EXISTS `dojos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dojos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojos`
--

LOCK TABLES `dojos` WRITE;
/*!40000 ALTER TABLE `dojos` DISABLE KEYS */;
INSERT INTO `dojos` VALUES (4,'Kum','2022-09-23 15:38:49','2022-09-23 15:38:49'),(5,'Koga Juku','2022-09-23 15:38:49','2022-09-23 15:38:49'),(6,'Miyagi-Do Karate','2022-09-23 15:38:49','2022-09-23 15:38:49');
/*!40000 ALTER TABLE `dojos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ninjas`
--

DROP TABLE IF EXISTS `ninjas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ninjas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `dojo_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_ninja_nombre_unico` (`last_name`,`first_name`),
  KEY `fk_ninjas_dojos_idx` (`dojo_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_ninjas_dojos` FOREIGN KEY (`dojo_id`) REFERENCES `dojos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ninjas`
--

LOCK TABLES `ninjas` WRITE;
/*!40000 ALTER TABLE `ninjas` DISABLE KEYS */;
INSERT INTO `ninjas` VALUES (1,'Hello','Kitty',40,'2022-09-23 15:58:11','2022-09-23 15:58:11',4),(2,'Gato','Felix',40,'2022-09-23 15:58:11','2022-09-23 15:58:11',4),(3,'Vecino','Totoro',40,'2022-09-23 15:58:11','2022-09-23 15:58:11',4),(4,'Luke','Skywalker',40,'2022-09-23 16:10:01','2022-09-23 16:10:01',5),(5,'Leia','Organa',40,'2022-09-23 16:10:01','2022-09-23 16:10:01',5),(6,'Han','Solo',40,'2022-09-23 16:10:01','2022-09-23 16:10:01',5),(13,'Tony','Stark',40,'2022-09-23 16:13:58','2022-09-23 16:13:58',6),(14,'Bruce','Banner',40,'2022-09-23 16:13:58','2022-09-23 16:13:58',6),(15,'Peter','Parker',40,'2022-09-23 16:13:58','2022-09-23 16:13:58',6);
/*!40000 ALTER TABLE `ninjas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-06 19:47:49
