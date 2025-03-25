-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: football_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2025-03-25 10:01:07
