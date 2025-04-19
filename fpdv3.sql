-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (arm64)
--
-- Host: localhost    Database: football_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `club_id` int NOT NULL AUTO_INCREMENT,
  `club_name` varchar(100) NOT NULL,
  `league` varchar(50) NOT NULL DEFAULT 'Premier League',
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`club_id`),
  UNIQUE KEY `club_name` (`club_name`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'Al Nassr','Saudi Pro League','Saudi Arabia'),(2,'Arsenal','Premiere League','England'),(3,'Aston Villa','Premiere League','England'),(4,'Barcelona','LaLiga','Spain'),(5,'Bournemouth','Premiere League','England'),(6,'Brentford','Premiere League','England'),(7,'Brighton','Premiere League','England'),(8,'Chelsea','Premiere League','England'),(9,'Crystal Palace','Premiere League','England'),(10,'Everton','Premiere League','England'),(11,'Fulham','Premiere League','England'),(12,'Ipswich','Premiere League','England'),(13,'Leicester','Premiere League','England'),(14,'Liverpool','Premiere League','England'),(15,'Man City','Premiere League','England'),(16,'Man Utd','Premiere League','England'),(17,'Newcastle','Premiere League','England'),(18,'Nottingham Forest','Premiere League','England'),(19,'Southampton','Premiere League','England'),(20,'Spurs','Premiere League','England'),(21,'West Ham','Premiere League','England'),(22,'Wolves','Premiere League','England');
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_clubs`
--

DROP TABLE IF EXISTS `favorite_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_clubs` (
  `fav_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `club_id` int NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fav_id`),
  KEY `user_id` (`user_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `favorite_clubs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `favorite_clubs_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_clubs`
--

LOCK TABLES `favorite_clubs` WRITE;
/*!40000 ALTER TABLE `favorite_clubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_players`
--

DROP TABLE IF EXISTS `favorite_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_players` (
  `fav_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `player_id` int NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fav_id`),
  KEY `user_id` (`user_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `favorite_players_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `favorite_players_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_players`
--

LOCK TABLES `favorite_players` WRITE;
/*!40000 ALTER TABLE `favorite_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `home_club_id` int DEFAULT NULL,
  `home_goals` int DEFAULT NULL,
  `away_goals` int DEFAULT NULL,
  `away_club_id` int DEFAULT NULL,
  `game_week` int DEFAULT NULL,
  `match_date` date DEFAULT NULL,
  PRIMARY KEY (`match_id`),
  KEY `home_club_id` (`home_club_id`),
  KEY `away_club_id` (`away_club_id`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`home_club_id`) REFERENCES `clubs` (`club_id`),
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`away_club_id`) REFERENCES `clubs` (`club_id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,16,1,0,11,1,'2024-08-16'),(2,21,1,2,3,1,'2024-08-17'),(3,2,2,0,22,1,'2024-08-17'),(4,10,0,3,7,1,'2024-08-17'),(5,17,1,0,19,1,'2024-08-17'),(6,18,1,1,5,1,'2024-08-17'),(7,12,0,2,14,1,'2024-08-17'),(8,8,0,2,15,1,'2024-08-18'),(9,6,2,1,9,1,'2024-08-18'),(10,13,1,1,20,1,'2024-08-19'),(11,3,0,2,2,2,'2024-08-24'),(12,9,0,2,21,2,'2024-08-24'),(13,11,2,1,13,2,'2024-08-24'),(14,15,4,1,12,2,'2024-08-24'),(15,19,0,1,18,2,'2024-08-24'),(16,20,4,0,10,2,'2024-08-24'),(17,7,2,1,16,2,'2024-08-24'),(18,14,2,0,6,2,'2024-08-25'),(19,5,1,1,17,2,'2024-08-25'),(20,22,2,6,8,2,'2024-08-25'),(21,21,1,3,15,3,'2024-08-31'),(22,6,3,1,19,3,'2024-08-31'),(23,10,2,3,5,3,'2024-08-31'),(24,12,1,1,11,3,'2024-08-31'),(25,13,1,2,3,3,'2024-08-31'),(26,18,1,1,22,3,'2024-08-31'),(27,2,1,1,7,3,'2024-08-31'),(28,16,0,3,14,3,'2024-09-01'),(29,8,1,1,9,3,'2024-09-01'),(30,17,2,1,20,3,'2024-09-01'),(31,5,0,1,8,4,'2024-09-14'),(32,3,3,2,10,4,'2024-09-14'),(33,7,0,0,12,4,'2024-09-14'),(34,9,2,2,13,4,'2024-09-14'),(35,11,1,1,21,4,'2024-09-14'),(36,14,0,1,18,4,'2024-09-14'),(37,15,2,1,6,4,'2024-09-14'),(38,19,0,3,16,4,'2024-09-14'),(39,22,1,2,17,4,'2024-09-15'),(40,20,0,1,2,4,'2024-09-15'),(41,9,0,0,16,5,'2024-09-21'),(42,3,3,1,22,5,'2024-09-21'),(43,11,3,1,17,5,'2024-09-21'),(44,13,1,1,10,5,'2024-09-21'),(45,14,3,0,5,5,'2024-09-21'),(46,19,1,1,12,5,'2024-09-21'),(47,20,3,1,6,5,'2024-09-21'),(48,21,0,3,8,5,'2024-09-21'),(49,15,2,2,2,5,'2024-09-22'),(50,7,2,2,18,5,'2024-09-22'),(51,22,1,2,14,6,'2024-09-28'),(52,2,4,2,13,6,'2024-09-28'),(53,6,1,1,21,6,'2024-09-28'),(54,8,4,2,7,6,'2024-09-28'),(55,10,2,1,9,6,'2024-09-28'),(56,18,0,1,11,6,'2024-09-28'),(57,17,1,1,15,6,'2024-09-28'),(58,16,0,3,20,6,'2024-09-29'),(59,12,2,2,3,6,'2024-09-29'),(60,5,3,1,19,6,'2024-09-30'),(61,10,0,0,17,7,'2024-10-05'),(62,2,3,1,19,7,'2024-10-05'),(63,6,5,3,22,7,'2024-10-05'),(64,13,1,0,5,7,'2024-10-05'),(65,15,3,2,11,7,'2024-10-05'),(66,21,4,1,12,7,'2024-10-05'),(67,9,0,1,14,7,'2024-10-05'),(68,7,3,2,20,7,'2024-10-06'),(69,3,0,0,16,7,'2024-10-06'),(70,8,1,1,18,7,'2024-10-06'),(71,5,2,0,2,8,'2024-10-19'),(72,11,1,3,3,8,'2024-10-19'),(73,12,0,2,10,8,'2024-10-19'),(74,16,2,1,6,8,'2024-10-19'),(75,17,0,1,7,8,'2024-10-19'),(76,19,2,3,13,8,'2024-10-19'),(77,20,4,1,21,8,'2024-10-19'),(78,14,2,1,8,8,'2024-10-20'),(79,22,1,2,15,8,'2024-10-20'),(80,18,1,0,9,8,'2024-10-21'),(81,13,1,3,18,9,'2024-10-25'),(82,10,1,1,11,9,'2024-10-26'),(83,3,1,1,5,9,'2024-10-26'),(84,6,4,3,12,9,'2024-10-26'),(85,7,2,2,22,9,'2024-10-26'),(86,15,1,0,19,9,'2024-10-26'),(87,2,2,2,14,9,'2024-10-27'),(88,9,1,0,20,9,'2024-10-27'),(89,8,2,1,17,9,'2024-10-27'),(90,21,2,1,16,9,'2024-10-27'),(91,22,2,2,9,10,'2024-11-02'),(92,5,2,1,15,10,'2024-11-02'),(93,12,1,1,13,10,'2024-11-02'),(94,14,2,1,7,10,'2024-11-02'),(95,18,3,0,21,10,'2024-11-02'),(96,19,1,0,10,10,'2024-11-02'),(97,17,1,0,2,10,'2024-11-02'),(98,16,1,1,8,10,'2024-11-03'),(99,20,4,1,3,10,'2024-11-03'),(100,11,2,1,6,10,'2024-11-04'),(101,14,2,0,3,11,'2024-11-09'),(102,7,2,1,15,11,'2024-11-09'),(103,6,3,2,5,11,'2024-11-09'),(104,9,0,2,11,11,'2024-11-09'),(105,21,0,0,10,11,'2024-11-09'),(106,22,2,0,19,11,'2024-11-09'),(107,8,1,1,2,11,'2024-11-10'),(108,16,3,0,13,11,'2024-11-10'),(109,18,1,3,17,11,'2024-11-10'),(110,20,1,2,12,11,'2024-11-10'),(111,15,0,4,20,12,'2024-11-23'),(112,5,1,2,7,12,'2024-11-23'),(113,2,3,0,18,12,'2024-11-23'),(114,3,2,2,9,12,'2024-11-23'),(115,10,0,0,6,12,'2024-11-23'),(116,11,1,4,22,12,'2024-11-23'),(117,13,1,2,8,12,'2024-11-23'),(118,12,1,1,16,12,'2024-11-24'),(119,19,2,3,14,12,'2024-11-24'),(120,17,0,2,21,12,'2024-11-25'),(121,7,1,1,19,13,'2024-11-29'),(122,21,2,5,2,13,'2024-11-30'),(123,6,4,1,13,13,'2024-11-30'),(124,9,1,1,17,13,'2024-11-30'),(125,12,2,4,5,13,'2024-11-30'),(126,14,2,0,15,13,'2024-12-01'),(127,8,3,0,3,13,'2024-12-01'),(128,16,4,0,10,13,'2024-12-01'),(129,20,1,1,11,13,'2024-12-01'),(130,13,3,1,21,14,'2024-12-03'),(131,12,0,1,9,14,'2024-12-03'),(132,2,2,0,16,14,'2024-12-04'),(133,3,3,1,6,14,'2024-12-04'),(134,10,4,0,22,14,'2024-12-04'),(135,15,3,0,18,14,'2024-12-04'),(136,17,3,3,14,14,'2024-12-04'),(137,19,1,5,8,14,'2024-12-04'),(138,5,1,0,20,14,'2024-12-05'),(139,11,3,1,7,14,'2024-12-05'),(140,16,2,3,18,15,'2024-12-07'),(141,3,1,0,19,15,'2024-12-07'),(142,6,4,2,17,15,'2024-12-07'),(143,9,2,2,15,15,'2024-12-07'),(144,20,3,4,8,15,'2024-12-08'),(145,11,1,1,2,15,'2024-12-08'),(146,12,1,2,5,15,'2024-12-08'),(147,13,2,2,7,15,'2024-12-08'),(148,21,2,1,22,15,'2024-12-09'),(149,18,2,1,3,16,'2024-12-14'),(150,2,0,0,10,16,'2024-12-14'),(151,14,2,2,11,16,'2024-12-14'),(152,17,4,0,13,16,'2024-12-14'),(153,22,1,2,12,16,'2024-12-14'),(154,8,2,1,6,16,'2024-12-15'),(155,19,0,5,20,16,'2024-12-15'),(156,15,1,2,16,16,'2024-12-15'),(157,7,1,3,9,16,'2024-12-15'),(158,5,1,1,21,16,'2024-12-16'),(159,9,1,5,2,17,'2024-12-21'),(160,6,0,2,18,17,'2024-12-21'),(161,12,0,4,17,17,'2024-12-21'),(162,21,1,1,7,17,'2024-12-21'),(163,3,2,1,15,17,'2024-12-21'),(164,20,3,6,14,17,'2024-12-22'),(165,10,0,0,8,17,'2024-12-22'),(166,11,0,0,19,17,'2024-12-22'),(167,13,0,3,22,17,'2024-12-22'),(168,16,0,3,5,17,'2024-12-22'),(169,14,3,1,13,18,'2024-12-26'),(170,22,2,0,16,18,'2024-12-26'),(171,5,0,0,9,18,'2024-12-26'),(172,8,1,2,11,18,'2024-12-26'),(173,17,3,0,3,18,'2024-12-26'),(174,18,1,0,20,18,'2024-12-26'),(175,19,0,1,21,18,'2024-12-26'),(176,15,1,1,10,18,'2024-12-26'),(177,2,1,0,12,18,'2024-12-27'),(178,7,0,0,6,18,'2024-12-27'),(179,21,0,5,14,19,'2024-12-29'),(180,9,2,1,19,19,'2024-12-29'),(181,10,0,2,18,19,'2024-12-29'),(182,11,2,2,5,19,'2024-12-29'),(183,20,2,2,22,19,'2024-12-29'),(184,13,0,2,15,19,'2024-12-29'),(185,16,0,2,17,19,'2024-12-30'),(186,3,2,2,7,19,'2024-12-30'),(187,12,2,0,8,19,'2024-12-30'),(188,6,1,3,2,19,'2025-01-01'),(189,7,1,1,2,20,'2025-01-04'),(190,5,1,0,10,20,'2025-01-04'),(191,3,2,1,13,20,'2025-01-04'),(192,9,1,1,8,20,'2025-01-04'),(193,15,4,1,21,20,'2025-01-04'),(194,19,0,5,6,20,'2025-01-04'),(195,20,1,2,17,20,'2025-01-04'),(196,14,2,2,16,20,'2025-01-05'),(197,11,2,2,12,20,'2025-01-05'),(198,22,0,3,18,20,'2025-01-06'),(199,18,1,1,14,21,'2025-01-14'),(200,6,2,2,15,21,'2025-01-14'),(201,8,2,2,5,21,'2025-01-14'),(202,21,3,2,11,21,'2025-01-14'),(203,2,2,1,20,21,'2025-01-15'),(204,10,0,1,3,21,'2025-01-15'),(205,13,0,2,9,21,'2025-01-15'),(206,17,3,0,22,21,'2025-01-15'),(207,16,3,1,19,21,'2025-01-16'),(208,12,0,2,7,21,'2025-01-16'),(209,2,2,2,3,22,'2025-01-18'),(210,6,0,2,14,22,'2025-01-18'),(211,13,0,2,11,22,'2025-01-18'),(212,21,0,2,9,22,'2025-01-18'),(213,17,1,4,5,22,'2025-01-18'),(214,12,0,6,15,22,'2025-01-19'),(215,10,3,2,20,22,'2025-01-19'),(216,16,1,3,7,22,'2025-01-19'),(217,18,3,2,19,22,'2025-01-19'),(218,8,3,1,22,22,'2025-01-20'),(219,15,3,1,8,23,'2025-01-25'),(220,5,5,0,18,23,'2025-01-25'),(221,7,0,1,10,23,'2025-01-25'),(222,14,4,1,12,23,'2025-01-25'),(223,19,1,3,17,23,'2025-01-25'),(224,22,0,1,2,23,'2025-01-25'),(225,11,0,1,16,23,'2025-01-26'),(226,3,1,1,21,23,'2025-01-26'),(227,9,1,2,6,23,'2025-01-26'),(228,20,1,2,13,23,'2025-01-26'),(229,22,2,0,3,24,'2025-02-01'),(230,5,0,2,14,24,'2025-02-01'),(231,10,4,0,13,24,'2025-02-01'),(232,12,1,2,19,24,'2025-02-01'),(233,17,1,2,11,24,'2025-02-01'),(234,18,7,0,7,24,'2025-02-01'),(235,2,5,1,15,24,'2025-02-02'),(236,6,0,2,20,24,'2025-02-02'),(237,16,0,2,9,24,'2025-02-02'),(238,8,2,1,21,24,'2025-02-03'),(239,10,2,2,14,24,'2025-02-12'),(240,7,3,0,8,25,'2025-02-14'),(241,9,1,2,10,25,'2025-02-15'),(242,3,1,1,12,25,'2025-02-15'),(243,11,2,1,18,25,'2025-02-15'),(244,15,4,0,17,25,'2025-02-15'),(245,19,1,3,5,25,'2025-02-15'),(246,21,0,1,6,25,'2025-02-15'),(247,13,0,2,2,25,'2025-02-15'),(248,20,1,0,16,25,'2025-02-16'),(249,14,2,1,22,25,'2025-02-16'),(250,3,2,2,14,25,'2025-02-19'),(251,13,0,4,6,26,'2025-02-21'),(252,3,2,1,8,26,'2025-02-22'),(253,5,0,1,22,26,'2025-02-22'),(254,2,0,1,21,26,'2025-02-22'),(255,11,0,2,9,26,'2025-02-22'),(256,12,1,4,20,26,'2025-02-22'),(257,19,0,4,7,26,'2025-02-22'),(258,10,2,2,16,26,'2025-02-22'),(259,15,0,2,14,26,'2025-02-23'),(260,17,4,3,18,26,'2025-02-23'),(261,8,4,0,19,27,'2025-02-25'),(262,7,2,1,5,27,'2025-02-25'),(263,9,4,1,3,27,'2025-02-25'),(264,22,1,2,11,27,'2025-02-25'),(265,14,2,0,17,27,'2025-02-26'),(266,6,1,1,10,27,'2025-02-26'),(267,16,3,2,12,27,'2025-02-26'),(268,18,0,0,2,27,'2025-02-26'),(269,20,0,1,15,27,'2025-02-26'),(270,21,2,0,13,27,'2025-02-27'),(271,22,1,1,10,28,'2025-03-08'),(272,6,0,1,3,28,'2025-03-08'),(273,7,2,1,11,28,'2025-03-08'),(274,9,1,0,12,28,'2025-03-08'),(275,14,3,1,19,28,'2025-03-08'),(276,18,1,0,15,28,'2025-03-08'),(277,16,1,1,2,28,'2025-03-09'),(278,8,1,0,13,28,'2025-03-09'),(279,20,2,2,5,28,'2025-03-09'),(280,21,0,1,17,28,'2025-03-10'),(281,5,1,2,6,29,'2025-03-15'),(282,10,1,1,21,29,'2025-03-15'),(283,12,2,4,18,29,'2025-03-15'),(284,15,2,2,7,29,'2025-03-15'),(285,19,1,2,22,29,'2025-03-15'),(286,13,0,3,16,29,'2025-03-16'),(287,2,1,0,8,29,'2025-03-16'),(288,11,2,0,20,29,'2025-03-16'),(289,18,1,0,16,30,'2025-04-01'),(290,2,2,1,11,30,'2025-04-01'),(291,22,1,0,21,30,'2025-04-01'),(292,14,1,0,10,30,'2025-04-02'),(293,5,1,2,12,30,'2025-04-02'),(294,7,0,3,3,30,'2025-04-02'),(295,15,2,0,13,30,'2025-04-02'),(296,17,2,1,6,30,'2025-04-02'),(297,19,1,1,9,30,'2025-04-02'),(298,8,1,0,20,30,'2025-04-03'),(299,3,2,1,18,31,'2025-04-05'),(300,9,2,1,7,31,'2025-04-05'),(301,12,1,2,22,31,'2025-04-05'),(302,21,2,2,5,31,'2025-04-05'),(303,10,1,1,2,31,'2025-04-05'),(304,16,0,0,15,31,'2025-04-06'),(305,6,0,0,8,31,'2025-04-06'),(306,11,3,2,14,31,'2025-04-06'),(307,20,3,1,19,31,'2025-04-06'),(308,13,0,3,17,31,'2025-04-07'),(309,2,1,1,6,32,'2025-04-12'),(310,7,2,2,13,32,'2025-04-12'),(311,18,0,1,10,32,'2025-04-12'),(312,19,0,3,3,32,'2025-04-12'),(313,15,5,2,9,32,'2025-04-12'),(314,17,4,1,16,32,'2025-04-13'),(315,8,2,2,12,32,'2025-04-13'),(316,14,2,1,21,32,'2025-04-13'),(317,22,4,2,20,32,'2025-04-13'),(318,5,1,0,11,32,'2025-04-14'),(319,17,5,0,9,32,'2025-04-16');
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_stats`
--

DROP TABLE IF EXISTS `player_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_stats` (
  `stat_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `season` varchar(9) NOT NULL,
  `matches_played` int DEFAULT '0',
  `goals` int DEFAULT '0',
  `assists` int DEFAULT '0',
  `clean_sheets` int DEFAULT '0',
  `yellow_cards` int DEFAULT '0',
  `red_cards` int DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_stats`
--

LOCK TABLES `player_stats` WRITE;
/*!40000 ALTER TABLE `player_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `player_name` varchar(100) NOT NULL,
  `club_id` int NOT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `position` varchar(10) NOT NULL,
  `age` int DEFAULT NULL,
  `market_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`) ON DELETE CASCADE,
  CONSTRAINT `players_chk_1` CHECK ((`position` in (_utf8mb4'GK',_utf8mb4'DEF',_utf8mb4'MID',_utf8mb4'FWD'))),
  CONSTRAINT `players_chk_2` CHECK ((`age` between 16 and 50))
) ENGINE=InnoDB AUTO_INCREMENT=520 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (278,'Bento',1,'Brazil','GK',25,12.00),(279,'Sultan Al-Ghannam',1,'Saudi Arabia','DEF',29,4.00),(280,'Aymeric Laporte',1,'Spain','DEF',30,18.00),(281,'Ali Lajami',1,'Saudi Arabia','DEF',28,3.00),(282,'Mohamed Simakan',1,'Brazil','DEF',24,28.00),(283,'Marcelo Brozović',1,'Croatia','MID',32,12.00),(284,'Otávio',1,'Portugal','MID',30,18.00),(285,'Seko Fofana',1,'Ivory Coast','MID',29,18.00),(286,'Jjon Durán',1,'Colombia','FWD',21,40.00),(287,'Sadio Mané',1,'Senegal','FWD',32,9.00),(288,'Cristiano Ronaldo',1,'Portugal','FWD',40,12.00),(289,'David Raya',2,'Spain','GK',29,40.00),(290,'Ben White',2,'England','DEF',27,55.00),(291,'William Saliba',2,'France','DEF',23,80.00),(292,'Gabriel Magalhães',2,'Brazil','DEF',27,75.00),(293,'Riccardo Calafiori',2,'Italy','DEF',22,45.00),(294,'Declan Rice',2,'England','MID',26,110.00),(295,'Martin Ødegaard',2,'Norway','MID',26,110.00),(296,'Kai Havertz',2,'Germany','MID',25,75.00),(297,'Bukayo Saka',2,'England','FWD',22,120.00),(298,'Gabriel Jesus',2,'Brazil','FWD',27,45.00),(299,'Leandro Trossard',2,'Belgium','FWD',30,30.00),(300,'Emiliano Martínez',3,'Argentina','GK',32,25.00),(301,'Ezri Konsa',3,'England','DEF',27,35.00),(302,'Axel Disasi',3,'France','DEF',28,35.00),(303,'Pau Torres',3,'Spain','DEF',28,45.00),(304,'Ian Maatsen',3,'Netherlands','DEF',23,32.00),(305,'John McGinn',3,'Scotland','MID',30,23.00),(306,'Youri Tielemans',3,'Belgium','MID',28,30.00),(307,'Marcus Rashford',3,'England','MID',28,55.00),(308,'Marco Asensio',3,'Spain','FWD',30,20.00),(309,'Ollie Watkins',3,'England','FWD',29,55.00),(310,'Morgan Rogers',3,'England','FWD',23,40.00),(311,'Wojciech Szczesny',4,'Poland','GK',34,1.00),(312,'Jules Koundé',4,'France','DEF',27,60.00),(313,'Ronald Araújo',4,'Uruguay','DEF',26,55.00),(314,'Pau Cubarsí',4,'Spain','DEF',18,70.00),(315,'Alejandro Balde',4,'Spain','DEF',21,55.00),(316,'Marc Casadó',4,'Spain','MID',21,30.00),(317,'Gavi',4,'Spain','MID',20,80.00),(318,'Pedri',4,'Spain','MID',22,100.00),(319,'Lamine Yamal',4,'Spain','FWD',17,180.00),(320,'Raphinha',4,'Brazil','FWD',28,80.00),(321,'Robert Lewandowski',4,'Poland','FWD',36,15.00),(322,'Kepa Arrizabalaga',5,'Spain','GK',31,8.00),(323,'Lewis Cook',5,'England','DEF',28,12.00),(324,'Illia Zabarnyi',5,'Ukraine','DEF',23,20.00),(325,'Dean Huijsen',5,'Netherlands','DEF',20,5.00),(326,'Miloš Kerkez',5,'Hungary','DEF',22,35.00),(327,'Ryan Christie',5,'Scotland','MID',31,6.00),(328,'Tyler Adams',5,'USA','MID',26,18.00),(329,'David Brooks',5,'Wales','FWD',28,10.00),(330,'Justin Kluivert',5,'Netherlands','MID',26,12.00),(331,'Antoine Semenyo',5,'Ghana','FWD',26,20.00),(332,'Dango Ouattara',5,'Burkina Faso','FWD',24,15.00),(333,'Hákon Valdimarsson',6,'Iceland','GK',23,3.00),(334,'Keane Lewis-Potter',6,'England','DEF',25,12.00),(335,'Nathan Collins',6,'Ireland','DEF',24,18.00),(336,'Ethan Pinnock',6,'Jamaica','DEF',32,5.00),(337,'Sepp van den Berg',6,'Netherlands','DEF',24,7.00),(338,'Christian Nørgaard',6,'Denmark','MID',31,10.00),(339,'Vitaly Janelt',6,'Germany','MID',27,15.00),(340,'Mikkel Damsgaard',6,'Denmark','MID',25,12.00),(341,'Kevin Schade',6,'Germany','FWD',24,20.00),(342,'Bryan Mbeumo',6,'Cameroon','FWD',26,25.00),(343,'Yoane Wissa',6,'DR Congo','FWD',29,18.00),(344,'Bart Verbruggen',7,'Netherlands','GK',23,25.00),(345,'Tariq Lamptey',7,'England','DEF',25,15.00),(346,'Jan Paul van Hecke',7,'Netherlands','DEF',26,32.00),(347,'Adam Webster',7,'England','DEF',31,15.00),(348,'Pervis Estupiñán',7,'Ecuador','DEF',28,25.00),(349,'Carlos Baleba',7,'Cameroon','MID',22,20.00),(350,'Jack Hinshelwood',7,'England','MID',20,5.00),(351,'Yankubah Minteh',7,'Gambia','FWD',22,12.00),(352,'Kaoru Mitoma',7,'Japan','FWD',28,45.00),(353,'João Pedro',7,'Brazil','MID',24,50.00),(354,'Danny Welbeck',7,'England','FWD',35,5.00),(366,'Filip Jorgensen',8,'Denmark','GK',22,20.00),(367,'Reece James',8,'England','DEF',25,30.00),(368,'Levi Colwill',8,'England','DEF',22,55.00),(369,'Wesley Fofana',8,'France','DEF',24,30.00),(370,'Marc Cucurella',8,'Spain','DEF',26,30.00),(371,'Moises Caicedo',8,'Ecuador','MID',23,80.00),(372,'Enzo Fernandez',8,'Argentina','MID',24,75.00),(373,'Cole Palmer',8,'England','MID',22,130.00),(374,'Noni Madueke',8,'England','FWD',23,55.00),(375,'Nicolas Jackson',8,'Senegal','FWD',22,25.00),(376,'Pedro Neto',8,'Portugal','FWD',25,55.00),(377,'Dean Henderson',9,'England','GK',28,12.00),(378,'Tariq Richards',9,'England','DEF',24,8.00),(379,'Maxence Lacroix',9,'France','DEF',24,15.00),(380,'Marc Guehi',9,'England','DEF',23,10.00),(381,'Tyrick Mitchell',9,'England','DEF',25,9.00),(382,'Adam Wharton',9,'England','MID',22,7.00),(383,'Philip Billing',9,'Denmark','MID',28,6.00),(384,'Ismaila Sarr',9,'Senegal','FWD',26,18.00),(385,'Eberechi Eze',9,'England','MID',26,16.00),(386,'Jean-Philippe Mateta',9,'France','FWD',28,14.00),(387,'Eddie Nketiah',9,'England','FWD',25,12.00),(388,'Jordan Pickford',10,'England','GK',31,20.00),(389,'Jake O’Brien',10,'Republic of Ireland','DEF',25,15.00),(390,'James Tarkowski',10,'England','DEF',32,10.00),(391,'Jarrad Branthwaite',10,'England','DEF',24,42.00),(392,'Vitalii Mykolenko',10,'Ukraine','DEF',26,28.00),(393,'James Garner',10,'England','MID',25,20.00),(394,'Idrissa Gueye',10,'Senegal','MID',36,4.00),(395,'Jesper Lindström',10,'Denmark','FWD',25,20.00),(396,'Abdoulaye Doucoure',10,'France','MID',33,8.00),(397,'Jack Harrison',10,'England','FWD',29,16.00),(398,'Beto Bercique',10,'Brazil','FWD',27,20.00),(399,'Bernd Leno',11,'Germany','GK',32,10.00),(400,'Antonee Robinson',11,'USA','DEF',27,8.00),(401,'Joachim Andersen',11,'Denmark','DEF',30,12.00),(402,'Calvin Bassey',11,'Nigeria','DEF',26,7.00),(403,'Timothy Castagne',11,'Belgium','DEF',30,9.00),(404,'Sander Berge',11,'Norway','MID',28,6.00),(405,'Saša Lukić',11,'Serbia','MID',29,5.00),(406,'Andreas Pereira',11,'Brazil','MID',30,8.00),(407,'Alex Iwobi',11,'Nigeria','FWD',29,7.00),(408,'Adama Traoré',11,'Mali','FWD',30,15.00),(409,'Raúl Jiménez',11,'Mexico','FWD',34,10.00),(410,'Daniel Iversen',13,'Denmark','GK',28,5.00),(411,'James Justin',13,'England','DEF',28,6.00),(412,'Wout Faes',13,'Belgium','DEF',27,7.00),(413,'Jannik Vestergaard',13,'Denmark','DEF',33,5.00),(414,'Luke Thomas',13,'England','DEF',25,4.50),(415,'Wilfred Ndidi',13,'Nigeria','MID',29,8.00),(416,'Boubakary Soumaré',13,'France','MID',27,6.50),(417,'Bobby De Cordova-Reid',13,'Jamaica','FWD',32,5.00),(418,'Othman El Khannouss',13,'Morocco','MID',23,4.50),(419,'Jamie Vardy',13,'England','FWD',38,4.00),(420,'Patson Daka',13,'Zambia','FWD',27,7.00),(421,'Alisson Becker',14,'Brazil','GK',32,25.00),(422,'Trent Alexander-Arnold',14,'England','DEF',26,75.00),(423,'Virgil van Dijk',14,'Netherlands','DEF',33,28.00),(424,'Ibrahima Konaté',14,'France','DEF',25,50.00),(425,'Andrew Robertson',14,'Scotland','DEF',31,25.00),(426,'Ryan Gravenberch',14,'Netherlands','MID',22,55.00),(427,'Dominik Szoboszlai',14,'Hungary','MID',24,75.00),(428,'Alexis Mac Allister',14,'Argentina','MID',26,80.00),(429,'Mohamed Salah',14,'Egypt','FWD',32,55.00),(430,'Cody Gakpo',14,'Netherlands','FWD',25,60.00),(431,'Luis Díaz',14,'Colombia','FWD',28,85.00),(432,'Ederson',15,'Brazil','GK',31,30.00),(433,'Rico Lewis',15,'England','DEF',20,15.00),(434,'Rúben Dias',15,'Portugal','DEF',27,75.00),(435,'John Stones',15,'England','DEF',30,32.00),(436,'Joško Gvardiol',15,'Croatia','DEF',23,75.00),(437,'Nico González',15,'Spain','MID',23,18.00),(438,'Rodri',15,'Spain','MID',28,20.00),(439,'Phil Foden',15,'England','MID',24,140.00),(440,'Omar Marmoush',15,'Egypt','FWD',26,60.00),(441,'Savinho',15,'Brazil','FWD',20,55.00),(442,'Erling Haaland',15,'Norway','FWD',24,200.00),(443,'Andre Onana',16,'Cameroon','GK',28,35.00),(444,'Noussair Mazraoui',16,'Morocco','DEF',27,20.00),(445,'Harry Maguire',16,'England','DEF',32,15.00),(446,'Matthijs de Ligt',16,'Netherlands','DEF',25,45.00),(447,'Diogo Dalot',16,'Portugal','DEF',25,40.00),(448,'Manuel Ugarte',16,'Uruguay','MID',23,50.00),(449,'Kobbie Mainoo',16,'England','MID',19,55.00),(450,'Bruno Fernandes',16,'Portugal','MID',30,55.00),(451,'Alejandro Garnacho',16,'Argentina','FWD',20,50.00),(452,'Joshua Zirkzee',16,'Netherlands','FWD',23,42.00),(453,'Rasmus Hojlund',16,'Denmark','FWD',22,60.00),(454,'Nick Pope',17,'England','GK',32,14.00),(455,'Tino Livramento',17,'England','DEF',22,35.00),(456,'Fabian Schär',17,'Switzerland','DEF',33,9.00),(457,'Dan Burn',17,'England','DEF',32,7.00),(458,'Lewis Hall',17,'England','DEF',20,25.00),(459,'Bruno Guimarães',17,'Brazil','MID',27,80.00),(460,'Lewis Miley',17,'England','MID',18,22.00),(461,'Joelinton',17,'Brazil','MID',28,40.00),(462,'Jacob Murphy',17,'England','FWD',30,14.00),(463,'Alexander Isak',17,'Sweden','FWD',25,75.00),(464,'Anthony Gordon',17,'England','FWD',24,60.00),(465,'Matz Sels',18,'Belgium','GK',33,7.00),(466,'Tosin Aina',18,'England','DEF',28,14.00),(467,'Nikola Milenkovic',18,'Serbia','DEF',27,25.00),(468,'Murillo',18,'Brazil','DEF',22,50.00),(469,'Neco Williams',18,'Wales','DEF',23,17.00),(470,'Marcos Domínguez',18,'Argentina','MID',26,17.00),(471,'Ethan Anderson',18,'England','MID',22,24.00),(472,'Anthony Elanga',18,'Sweden','FWD',22,25.00),(473,'Morgan Gibbs-White',18,'England','MID',25,40.00),(474,'Callum Hudson-Odoi',18,'England','FWD',24,28.00),(475,'Chris Wood',18,'New Zealand','FWD',33,7.00),(476,'Aaron Ramsdale',19,'England','GK',26,15.00),(477,'James Bree',19,'England','DEF',29,8.00),(478,'Jan Bednarek',19,'Poland','DEF',35,6.00),(479,'Welington',19,'Brazil','DEF',34,5.00),(480,'Ryan Manning',19,'Ireland','DEF',29,7.00),(481,'Kyle Walker-Peters',19,'England','MID',28,12.00),(482,'Lesley Ugochukwu',19,'France','MID',26,10.00),(483,'Joe Aribo',19,'Nigeria','MID',28,9.00),(484,'Mateus Fernandes',19,'Brazil','MID',18,4.00),(485,'Tyler Dibling',19,'England','MID',33,5.00),(486,'Paul Onuachu',19,'Nigeria','FWD',32,8.00),(487,'Guglielmo Vicario',20,'Italy','GK',28,35.00),(488,'Pedro Porro',20,'Spain','DEF',26,45.00),(489,'Cristian Romero',20,'Argentina','DEF',26,65.00),(490,'Micky van de Ven',20,'Netherlands','DEF',23,55.00),(491,'Destiny Udogie',20,'Italy','DEF',22,45.00),(492,'Yves Bissouma',20,'Mali','MID',28,35.00),(493,'Rodrigo Bentancur',20,'Uruguay','MID',27,35.00),(494,'James Maddison',20,'England','MID',28,60.00),(495,'Brennan Johnson',20,'Wales','FWD',23,50.00),(496,'Dominic Solanke',20,'England','FWD',27,45.00),(497,'Son Heung-min',20,'South Korea','FWD',32,38.00),(498,'Alphonse Areola',21,'France','GK',32,10.00),(499,'Aaron Wan-Bissaka',21,'England','DEF',27,22.00),(500,'Jean-Clair Todibo',21,'France','DEF',25,32.00),(501,'Konstantinos Mavropanos',21,'Greece','DEF',27,12.00),(502,'Maximilian Kilman',21,'England','DEF',27,35.00),(503,'Emerson',21,'Brazil','DEF',30,12.00),(504,'Edson Álvarez',21,'Mexico','MID',27,30.00),(505,'Mohammed Kudus',21,'Ghana','MID',24,50.00),(506,'Lucas Paquetá',21,'Brazil','MID',27,40.00),(507,'Jarrod Bowen',21,'England','FWD',28,45.00),(508,'Tomáš Souček',21,'Czech Republic','MID',30,24.00),(509,'José Sá',22,'Portugal','GK',32,15.00),(510,'Matt Doherty',22,'Republic of Ireland','DEF',33,10.00),(511,'Hugo Bueno',22,'Spain','DEF',24,8.00),(512,'Toti Gomes',22,'Portugal','DEF',26,8.00),(513,'Rayan Aït-Nouri',22,'France','DEF',23,35.00),(514,'João Gomes',22,'Brazil','MID',24,40.00),(515,'André',22,'Brazil','MID',23,25.00),(516,'Nélson Semedo',22,'Portugal','MID',30,12.00),(517,'Matheus Cunha',22,'Brazil','FWD',25,50.00),(518,'Jean-Ricner Bellegarde',22,'France','MID',27,10.00),(519,'Marshall Munetsi',22,'Zimbabwe','MID',29,8.00);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `stat_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `goals` int NOT NULL,
  `assists` int NOT NULL,
  `red_cards` int NOT NULL,
  `yellow_cards` int NOT NULL,
  `player_name` varchar(50) NOT NULL,
  PRIMARY KEY (`stat_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES (1,278,0,0,0,1,'Bento'),(2,279,1,1,0,0,'Sultan Al-Ghannam'),(3,280,3,0,0,0,'Aymeric Laporte'),(4,281,0,0,0,0,'Ali Lajami'),(5,282,1,0,0,0,'Mohamed Simakan'),(6,283,1,4,0,0,'Marcelo Brozović'),(7,284,0,0,0,0,'Otávio'),(8,285,0,0,0,0,'Seko Fofana'),(9,286,4,0,2,0,'Jhon Durán'),(10,287,7,7,0,0,'Sadio Mané'),(11,288,19,3,0,3,'Cristiano Ronaldo'),(12,289,0,0,0,1,'David Raya'),(13,290,3,5,0,2,'Ben White'),(14,291,3,0,1,3,'William Saliba'),(15,292,7,1,0,4,'Gabriel Magalhães'),(16,293,1,1,0,2,'Riccardo Calafiori'),(17,294,6,12,1,5,'Declan Rice'),(18,295,5,12,0,3,'Martin Ødegaard'),(19,296,21,8,0,2,'Kai Havertz'),(20,297,20,16,0,1,'Bukayo Saka'),(21,298,7,7,0,2,'Gabriel Jesus'),(22,299,15,3,1,3,'Leandro Trossard'),(23,300,0,0,0,0,'Emiliano Martínez'),(24,301,0,0,1,3,'Ezri Konsa'),(25,302,2,2,0,4,'Axel Disasi'),(26,303,0,0,0,7,'Pau Torres'),(27,304,1,1,0,6,'Ian Maatsen'),(28,305,8,10,4,12,'John McGinn'),(29,306,4,4,0,22,'Youri Tielemans'),(30,307,7,7,0,0,'Marcus Rashford'),(31,308,9,4,0,0,'Marco Asensio'),(32,309,10,5,0,14,'Ollie Watkins'),(33,310,6,4,0,98,'Morgan Rogers'),(34,311,1,0,0,0,'Wojciech Szczesny'),(35,312,2,3,0,3,'Jules Koundé'),(36,313,1,1,0,1,'Ronald Araújo'),(37,314,0,3,0,3,'Pau Cubarsí'),(38,315,0,3,0,2,'Alejandro Balde'),(39,316,1,3,0,3,'Marc Casadó'),(40,317,0,1,0,4,'Gavi'),(41,318,4,3,0,2,'Pedri'),(42,319,5,11,0,3,'Lamine Yamal'),(43,320,13,7,0,3,'Raphinha'),(44,321,21,2,0,1,'Robert Lewandowski'),(45,322,0,0,0,0,'Kepa Arrizabalaga'),(46,323,1,3,0,3,'Lewis Cook'),(47,324,0,0,1,0,'Illia Zabarnyi'),(48,325,2,0,0,1,'Dean Huijsen'),(49,326,2,4,0,3,'Miloš Kerkez'),(50,327,2,3,0,2,'Ryan Christie'),(51,328,0,0,0,1,'Tyler Adams'),(52,329,2,0,0,1,'David Brooks'),(53,330,12,5,0,4,'Justin Kluivert'),(54,331,7,4,0,5,'Antoine Semenyo'),(55,332,7,4,0,0,'Dango Ouattara'),(56,333,0,0,0,0,'Hákon Valdimarsson'),(57,334,1,2,0,5,'Keane Lewis-Potter'),(58,335,2,0,0,4,'Nathan Collins'),(59,336,2,0,0,2,'Ethan Pinnock'),(60,337,0,0,0,1,'Sepp van den Berg'),(61,338,4,0,1,6,'Christian Nørgaard'),(62,339,1,3,0,3,'Vitaly Janelt'),(63,340,2,10,0,2,'Mikkel Damsgaard'),(64,341,7,0,0,2,'Kevin Schade'),(65,342,15,4,0,2,'Bryan Mbeumo'),(66,343,13,1,0,2,'Yoane Wissa'),(67,344,0,0,0,0,'Bart Verbruggen'),(68,345,2,2,1,0,'Tariq Lamptey'),(69,346,0,0,0,0,'Jan Paul van Hecke'),(70,347,0,0,0,0,'Adam Webster'),(71,348,0,0,0,0,'Pervis Estupiñán'),(72,349,2,1,0,1,'Carlos Baleba'),(73,350,2,0,0,1,'Jack Hinshelwood'),(74,351,5,3,0,0,'Yankubah Minteh'),(75,352,7,3,0,0,'Kaoru Mitoma'),(76,353,8,6,0,0,'João Pedro'),(77,354,7,4,0,1,'Danny Welbeck'),(78,366,0,0,0,0,'Filip Jorgensen'),(79,367,1,0,0,0,'Reece James'),(80,368,0,0,0,3,'Levi Colwill'),(81,369,0,0,0,6,'Wesley Fofana'),(82,370,2,3,0,6,'Marc Cucurella'),(83,371,1,3,0,2,'Moises Caicedo'),(84,372,3,8,0,1,'Enzo Fernandez'),(85,373,14,6,0,3,'Cole Palmer'),(86,374,7,4,0,0,'Noni Madueke'),(87,375,9,5,0,0,'Nicolas Jackson'),(88,376,2,5,0,0,'Pedro Neto'),(89,377,0,0,0,3,'Dean Henderson'),(90,378,0,0,0,0,'Tariq Richards'),(91,379,1,2,0,4,'Maxence Lacroix'),(92,380,3,1,0,5,'Marc Guéhi'),(93,381,0,2,0,2,'Tyrick Mitchell'),(94,382,0,0,0,1,'Adam Wharton'),(95,383,0,0,0,1,'Philip Billing'),(96,384,7,3,0,1,'Ismaila Sarr'),(97,385,6,9,0,0,'Eberechi Eze'),(98,386,12,2,0,2,'Jean-Philippe Mateta'),(99,387,1,1,0,6,'Eddie Nketiah'),(100,388,0,1,0,6,'Jordan Pickford'),(101,389,2,0,0,3,'Jake O’Brien'),(102,390,1,1,0,2,'James Tarkowski'),(103,391,0,1,0,3,'Jarrad Branthwaite'),(104,392,0,1,0,2,'Vitalii Mykolenko'),(105,393,0,1,0,3,'James Garner'),(106,394,0,3,0,1,'Idrissa Gueye'),(107,395,0,1,0,0,'Jesper Lindström'),(108,396,2,1,0,1,'Abdoulaye Doucoure'),(109,397,1,0,0,1,'Jack Harrison'),(110,398,6,0,0,1,'Beto Bercique'),(111,399,0,1,0,3,'Bernd Leno'),(112,400,0,7,0,10,'Antonee Robinson'),(113,401,1,1,1,5,'Joachim Andersen'),(114,402,1,1,0,5,'Calvin Bassey'),(115,403,0,1,0,0,'Timothy Castagne'),(116,404,0,0,0,4,'Sander Berge'),(117,405,0,2,0,10,'Saša Lukić'),(118,406,2,0,0,7,'Andreas Pereira'),(119,407,7,4,0,0,'Alex Iwobi'),(120,408,2,6,0,2,'Adama Traoré'),(121,409,10,3,0,3,'Raúl Jiménez'),(122,410,0,0,0,0,'Daniel Iversen'),(123,411,4,2,0,6,'James Justin'),(124,412,1,0,0,3,'Wout Faes'),(125,413,0,0,0,5,'Jannik Vestergaard'),(126,414,0,0,0,0,'Luke Thomas'),(127,415,0,4,0,5,'Wilfred Ndidi'),(128,416,0,0,0,8,'Boubakary Soumaré'),(129,417,0,2,0,0,'Bobby De Cordova-Reid'),(130,418,2,0,0,3,'Othman El Khannouss'),(131,419,7,3,0,4,'Jamie Vardy'),(132,420,1,4,0,0,'Patson Daka'),(133,421,0,0,0,0,'Alisson Becker'),(134,422,2,6,0,4,'Trent Alexander-Arnold'),(135,423,1,1,0,3,'Virgil van Dijk'),(136,424,1,2,0,4,'Ibrahima Konaté'),(137,425,0,0,1,3,'Andrew Robertson'),(138,426,0,2,0,5,'Ryan Gravenberch'),(139,427,12,8,0,3,'Dominik Szoboszlai'),(140,428,20,11,0,4,'Mohamed Salah'),(141,429,14,4,0,1,'Luis Diaz'),(142,430,11,3,0,1,'Cody Gakpo'),(143,431,9,4,0,1,'Luis Díaz'),(144,432,0,3,0,3,'Ederson'),(145,433,1,2,0,0,'Rico Lewis'),(146,434,0,0,1,4,'Rúben Dias'),(147,435,3,0,0,1,'John Stones'),(148,436,5,0,0,1,'Joško Gvardiol'),(149,437,1,0,0,1,'Nico González'),(150,438,0,0,0,0,'Rodri'),(151,439,5,2,0,2,'Phil Foden'),(152,440,4,0,0,0,'Omar Marmoush'),(153,441,1,7,0,0,'Savinho'),(154,442,21,3,0,0,'Erling Haaland'),(155,443,0,0,0,0,'Andre Onana'),(156,444,0,1,0,4,'Noussair Mazraoui'),(157,445,1,1,0,7,'Harry Maguire'),(158,446,2,0,0,3,'Matthijs de Ligt'),(159,447,0,2,0,4,'Diogo Dalot'),(160,448,0,0,0,0,'Manuel Ugarte'),(161,449,0,0,0,0,'Kobbie Mainoo'),(162,450,8,9,2,3,'Bruno Fernandes'),(163,451,4,1,0,3,'Alejandro Garnacho'),(164,452,3,1,0,1,'Joshua Zirkzee'),(165,453,3,0,0,0,'Rasmus Højlund'),(166,454,0,0,0,4,'Nick Pope'),(167,455,0,0,0,3,'Tino Livramento'),(168,456,4,0,1,5,'Fabian Schär'),(169,457,1,0,0,9,'Dan Burn'),(170,458,0,0,0,4,'Lewis Hall'),(171,459,2,6,0,7,'Bruno Guimarães'),(172,460,2,0,0,3,'Lewis Miley'),(173,461,4,0,1,9,'Joelinton'),(174,462,6,9,0,3,'Jacob Murphy'),(175,463,19,4,0,1,'Alexander Isak'),(176,464,9,6,1,4,'Anthony Gordon'),(177,465,0,0,0,2,'Matz Sels'),(178,466,0,2,0,3,'Tosin Aina'),(179,467,4,0,0,1,'Nikola Milenkovic'),(180,468,1,0,0,5,'Murillo'),(181,469,1,1,0,6,'Neco Williams'),(182,470,0,0,0,8,'Marcos Domínguez'),(183,471,1,6,0,6,'Ethan Anderson'),(184,472,5,9,0,1,'Anthony Elanga'),(185,473,5,7,1,7,'Morgan Gibbs-White'),(186,474,5,2,0,2,'Callum Hudson-Odoi'),(187,475,18,3,0,1,'Chris Wood'),(188,476,0,0,0,2,'Aaron Ramsdale'),(189,477,0,0,0,0,'James Bree'),(190,478,2,0,0,5,'Jan Bednarek'),(191,479,0,0,0,0,'Welington'),(192,480,0,0,0,0,'Ryan Manning'),(193,481,0,2,0,5,'Kyle Walker-Peters'),(194,482,0,0,0,0,'Lesley Ugochukwu'),(195,483,3,0,0,1,'Joe Aribo'),(196,484,1,2,0,7,'Mateus Fernandes'),(197,485,0,0,0,0,'Tyler Dibling'),(198,486,3,0,0,0,'Paul Onuachu'),(199,487,0,0,0,1,'Guglielmo Vicario'),(200,488,2,5,0,2,'Pedro Porro'),(201,489,1,0,0,1,'Cristian Romero'),(202,490,0,0,0,4,'Micky van de Ven'),(203,491,0,0,0,2,'Destiny Udogie'),(204,492,2,0,0,6,'Yves Bissouma'),(205,493,2,1,0,7,'Rodrigo Bentancur'),(206,494,9,5,0,6,'James Maddison'),(207,495,9,2,0,4,'Brennan Johnson'),(208,496,7,3,0,2,'Dominic Solanke'),(209,497,7,9,0,1,'Son Heung-min'),(210,498,0,0,0,0,'Alphonse Areola'),(211,499,0,2,0,1,'Aaron Wan-Bissaka'),(212,500,0,0,0,3,'Jean-Clair Todibo'),(213,501,0,0,1,3,'Konstantinos Mavropanos'),(214,502,0,0,0,4,'Maximilian Kilman'),(215,503,2,0,0,5,'Emerson'),(216,504,0,0,1,7,'Edson Álvarez'),(217,505,3,0,1,0,'Mohammed Kudus'),(218,506,4,1,0,7,'Lucas Paquetá'),(219,507,7,5,0,4,'Jarrod Bowen'),(220,508,7,0,0,8,'Tomáš Souček'),(221,509,0,0,0,0,'José Sá'),(222,510,2,1,0,5,'Matt Doherty'),(223,511,0,0,0,2,'Hugo Bueno'),(224,512,3,1,0,0,'Toti Gomes'),(225,513,3,5,1,5,'Rayan Aït-Nouri'),(226,514,0,0,1,8,'João Gomes'),(227,515,0,0,0,4,'André'),(228,516,0,4,0,7,'Nélson Semedo'),(229,517,13,4,0,0,'Matheus Cunha'),(230,518,2,6,0,3,'Jean-Ricner Bellegarde'),(231,519,0,0,0,0,'Marshall Munetsi');
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_of_the_week`
--

DROP TABLE IF EXISTS `team_of_the_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_of_the_week` (
  `totw_id` int NOT NULL AUTO_INCREMENT,
  `week_number` int NOT NULL,
  `season` varchar(9) NOT NULL,
  `player_id` int NOT NULL,
  `club_id` int NOT NULL,
  `position` varchar(10) NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`totw_id`),
  KEY `player_id` (`player_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `team_of_the_week_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE,
  CONSTRAINT `team_of_the_week_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`) ON DELETE CASCADE,
  CONSTRAINT `team_of_the_week_chk_1` CHECK ((`week_number` between 1 and 38))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_of_the_week`
--

LOCK TABLES `team_of_the_week` WRITE;
/*!40000 ALTER TABLE `team_of_the_week` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_of_the_week` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_of_the_year`
--

DROP TABLE IF EXISTS `team_of_the_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_of_the_year` (
  `toty_id` int NOT NULL AUTO_INCREMENT,
  `season` varchar(9) NOT NULL,
  `player_id` int NOT NULL,
  `club_id` int NOT NULL,
  `position` varchar(10) NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`toty_id`),
  KEY `player_id` (`player_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `team_of_the_year_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE,
  CONSTRAINT `team_of_the_year_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_of_the_year`
--

LOCK TABLES `team_of_the_year` WRITE;
/*!40000 ALTER TABLE `team_of_the_year` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_of_the_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfers` (
  `transfer_id` int NOT NULL AUTO_INCREMENT,
  `transfer_fee` decimal(15,2) DEFAULT NULL,
  `season` varchar(50) NOT NULL,
  `player_id` int NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `from_club` varchar(100) NOT NULL,
  `to_club` varchar(100) NOT NULL,
  PRIMARY KEY (`transfer_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
INSERT INTO `transfers` VALUES (1,77.00,'2024/2025',286,'Jhon Duran','Aston Villa','Al-Nassr'),(2,59.00,'2024/2025',440,'Omar Marmoush','Eintracht Frankfurt','Manchester City'),(3,50.00,'2024/2025',437,'Nico Gonzalez','Porto','Manchester City'),(4,0.00,'2024/2025',307,'Marcus Rashford','Manchester United','Aston Villa'),(5,35.00,'2024/2025',282,'Mohamed Simikan','RB Leipzig','Al-Nassr'),(6,18.00,'2024/2025',278,'Bento','Athletico-PR','Al-Nassr'),(7,0.00,'2024/2025',302,'Axel Disasi','Chelsea','Aston Villa'),(8,0.00,'2024/2025',308,'Marco Asensio','PSG','Aston Villa');
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@atu.ie','$2a$12$dZTi4Kxsdkd3O.HPKJUF5eDsxmYIRwMOVnDAlTnigeYgqy/4WjDru','2025-04-01 14:15:41',1);
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

-- Dump completed on 2025-04-19 15:45:02
