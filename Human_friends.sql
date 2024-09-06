-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: Human_friends
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `Animals`
--

DROP TABLE IF EXISTS `Animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `supported_commands` varchar(150) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `animal_kind_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `animal_kind_id` (`animal_kind_id`),
  CONSTRAINT `Animals_ibfk_1` FOREIGN KEY (`animal_kind_id`) REFERENCES `Animals_kinds` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animals`
--

LOCK TABLES `Animals` WRITE;
/*!40000 ALTER TABLE `Animals` DISABLE KEYS */;
INSERT INTO `Animals` VALUES (1,'Buddy','Bark, Sit, Come, Stop','2020-03-20',1),(2,'Whiskers','Sit, Pounce','2019-05-15',2),(3,'Hammy','Roll, Hide','2021-03-10',3),(4,'Fido','Sit, Stay, Fetch','2020-01-01',1),(5,'Smudge','Sit, Pounce, Scratch','2020-02-20',2),(6,'Peanut','Roll, Spin','2021-08-01',3),(7,'Bella','Sit, Stay, Roll','2019-11-11',1),(8,'Thunder','Trot, Canter, Gallop','2015-07-21',5),(10,'Eeyore','Walk, Carry, Load, Bray','2017-09-18',4),(11,'Oliver','Meow, Scratch, Jump','2020-06-30',2),(12,'Storm','Trot, Canter','2014-05-05',5),(14,'Burro','Walk, Bray, Kick','2019-01-23',4),(15,'Blaze','Trot, Jump, Gallop','2016-02-29',5);
/*!40000 ALTER TABLE `Animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Animals_kinds`
--

DROP TABLE IF EXISTS `Animals_kinds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animals_kinds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `animal_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `animal_type_id` (`animal_type_id`),
  CONSTRAINT `Animals_kinds_ibfk_1` FOREIGN KEY (`animal_type_id`) REFERENCES `Animals_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animals_kinds`
--

LOCK TABLES `Animals_kinds` WRITE;
/*!40000 ALTER TABLE `Animals_kinds` DISABLE KEYS */;
INSERT INTO `Animals_kinds` VALUES (1,'Dog',1),(2,'Cat',1),(3,'Hamster',1),(4,'Donkey',2),(5,'Horse',2),(6,'Camel',2);
/*!40000 ALTER TABLE `Animals_kinds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Animals_types`
--

DROP TABLE IF EXISTS `Animals_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animals_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animals_types`
--

LOCK TABLES `Animals_types` WRITE;
/*!40000 ALTER TABLE `Animals_types` DISABLE KEYS */;
INSERT INTO `Animals_types` VALUES (1,'Pets'),(2,'Pack animals');
/*!40000 ALTER TABLE `Animals_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Young_animals`
--

DROP TABLE IF EXISTS `Young_animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Young_animals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `age` varchar(50) DEFAULT NULL,
  `animal_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `animal_id` (`animal_id`),
  CONSTRAINT `Young_animals_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `Animals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Young_animals`
--

LOCK TABLES `Young_animals` WRITE;
/*!40000 ALTER TABLE `Young_animals` DISABLE KEYS */;
INSERT INTO `Young_animals` VALUES (1,'02 years 06 months',1),(2,'01 years 06 months',3),(3,'02 years 09 months',4),(4,'02 years 07 months',5),(5,'01 years 02 months',6),(6,'02 years 10 months',7),(7,'02 years 03 months',11);
/*!40000 ALTER TABLE `Young_animals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-06 23:23:58
