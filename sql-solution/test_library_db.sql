-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: test_library
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `publication_year` year DEFAULT NULL,
  `isbn` bigint NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `idx_publish_year` (`publication_year`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'title1','author1',2023,1),(2,'title2','author2',2018,2),(3,'title3','author3',2022,3),(4,'title4','author4',2023,4),(5,'title5','author5',2020,5),(6,'title6','author6',2003,6),(7,'title7','author7',NULL,7),(8,'title8','author8',2020,8),(9,'title9','author9',NULL,9),(10,'title10','author10',NULL,10),(11,'title11','author11',NULL,11),(12,'title12','author12',NULL,12),(13,'title13','author13',NULL,13),(14,'title14','author14',NULL,14),(15,'title15','author15',NULL,15),(16,'title16','author16',NULL,16),(17,'title17','author17',NULL,17),(18,'title18','author18',NULL,18),(19,'title19','author19',NULL,19),(20,'title20','author20',NULL,20),(21,'title21','author21',2020,21);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed_books`
--

DROP TABLE IF EXISTS `borrowed_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowed_books` (
  `borrow_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `borrow_date` datetime DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `book_id_idx` (`book_id`),
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed_books`
--

LOCK TABLES `borrowed_books` WRITE;
/*!40000 ALTER TABLE `borrowed_books` DISABLE KEYS */;
INSERT INTO `borrowed_books` VALUES (103,'test10',11,'2023-02-13 14:52:11','2023-04-11 14:52:11',NULL),(104,'test9',11,'2023-08-01 14:54:29','2022-11-08 14:54:29',NULL),(105,'test7',4,'2023-08-18 14:54:30','2023-02-11 14:54:30',NULL),(106,'test4',15,'2023-04-02 14:54:30','2023-07-30 14:54:30',NULL),(107,'test7',9,'2023-06-26 14:54:30','2022-12-22 14:54:30',NULL),(108,'test7',14,'2023-03-21 14:54:30','2023-05-12 14:54:30',NULL),(109,'test7',2,'2023-04-18 14:54:31','2023-01-04 14:54:31',NULL),(110,'test9',16,'2023-06-11 14:54:31','2023-09-30 14:54:31',NULL),(111,'test4',10,'2023-03-07 14:54:31','2023-07-15 14:54:31',NULL),(112,'test6',5,'2023-04-20 14:54:31','2023-06-11 14:54:31',NULL),(113,'test6',10,'2022-12-01 14:54:31','2023-01-27 14:54:31',NULL),(114,'test3',1,'2023-04-03 14:54:32','2023-08-08 14:54:32',NULL),(115,'test5',18,'2022-10-28 14:54:32','2023-09-20 14:54:32',NULL),(116,'test5',1,'2022-12-26 14:54:32','2023-01-25 14:54:32',NULL),(117,'test6',6,'2022-11-30 14:54:32','2022-12-06 14:54:32',NULL),(118,'test4',9,'2023-06-30 14:54:33','2023-01-28 14:54:33',NULL),(119,'test2',9,'2022-12-15 14:54:33','2023-03-11 14:54:33',NULL),(120,'test8',17,'2023-09-05 14:54:33','2023-04-30 14:54:33',NULL),(121,'test4',8,'2022-12-15 14:54:33','2023-01-03 14:54:33',NULL),(122,'test8',6,'2023-06-08 14:54:33','2023-06-23 14:54:33',NULL),(123,'test4',19,'2022-11-30 14:54:34','2023-06-20 14:54:34',NULL),(124,'test2',11,'2023-04-24 14:54:34','2023-05-27 14:54:34',NULL),(125,'test8',12,'2023-02-19 14:54:34','2023-07-11 14:54:34',NULL),(126,'test6',17,'2023-03-31 14:54:34','2022-11-22 14:54:34',NULL),(127,'test4',16,'2022-10-10 14:54:35','2023-04-02 14:54:35',NULL),(128,'test9',9,'2023-01-31 14:54:35','2022-11-11 14:54:35',NULL),(129,'test10',18,'2023-05-03 14:54:35','2023-06-19 14:54:35',NULL),(130,'test6',11,'2023-07-23 14:54:35','2023-09-06 14:54:35',NULL),(131,'test1',19,'2023-04-03 14:54:35','2023-03-27 14:54:35',NULL),(132,'test5',15,'2023-08-10 14:54:36','2023-07-06 14:54:36',NULL),(133,'test2',17,'2022-12-30 14:54:36','2023-07-14 14:54:36',NULL),(134,'test1',7,'2023-03-30 14:54:36','2023-04-27 14:54:36',NULL),(135,'test10',9,'2023-06-09 14:54:36','2023-10-04 14:54:36',NULL),(136,'test3',3,'2023-08-22 14:54:36','2023-01-19 14:54:36',NULL),(137,'test8',8,'2023-02-11 14:54:37','2022-11-11 14:54:37',NULL),(138,'test1',8,'2023-01-29 14:54:37','2023-08-10 14:54:37',NULL),(139,'test9',19,'2022-11-20 14:54:37','2023-03-15 14:54:37',NULL),(140,'test5',10,'2023-08-20 14:54:37','2023-01-16 14:54:37',NULL),(141,'test8',10,'2023-08-10 14:54:37','2022-11-13 14:54:37',NULL),(142,'test7',5,'2023-06-09 14:54:38','2023-03-10 14:54:38',NULL),(143,'test4',17,'2023-08-03 14:54:38','2023-09-27 14:54:38',NULL),(144,'test9',2,'2022-11-04 14:54:38','2023-06-24 14:54:38',NULL),(145,'test9',3,'2023-06-30 14:54:38','2023-03-11 14:54:38',NULL),(146,'test6',15,'2023-08-25 14:54:39','2023-10-01 14:54:39',NULL),(147,'test10',17,'2023-07-23 14:54:39','2023-07-16 14:54:39',NULL),(148,'test9',8,'2023-04-29 14:54:39','2023-01-02 14:54:39',NULL),(149,'test10',8,'2022-10-27 14:54:39','2023-03-29 14:54:39',NULL),(150,'test1',10,'2023-06-30 14:54:39','2023-03-08 14:54:39',NULL),(151,'test6',17,'2023-02-23 14:54:40','2023-06-05 14:54:40',NULL),(152,'test1',7,'2023-04-06 14:54:40','2023-07-16 14:54:40',NULL),(153,'test9',11,'2023-07-27 14:54:40','2022-11-06 14:54:40',NULL),(154,'test7',2,'2023-02-09 14:54:40','2022-12-31 14:54:40',NULL),(155,'test3',19,'2022-11-21 14:54:40','2023-05-01 14:54:40',NULL),(156,'test8',9,'2022-12-07 14:54:40','2023-01-12 14:54:40',NULL),(157,'test6',7,'2022-10-17 14:54:41','2022-12-16 14:54:41',NULL),(158,'test5',17,'2023-03-03 14:54:41','2023-06-04 14:54:41',NULL),(159,'test2',16,'2023-05-29 14:54:41','2023-08-02 14:54:41',NULL),(160,'test1',16,'2023-02-07 14:54:41','2022-12-27 14:54:41',NULL),(161,'test4',3,'2023-02-06 14:54:41','2023-01-14 14:54:41',NULL),(162,'test1',17,'2023-07-28 14:54:42','2023-09-20 14:54:42',NULL),(163,'test9',5,'2023-02-26 14:54:42','2023-08-22 14:54:42',NULL),(164,'test10',8,'2023-08-15 14:54:42','2023-08-15 14:54:42',NULL),(165,'test6',9,'2023-04-11 14:54:42','2022-12-10 14:54:42',NULL),(166,'test2',2,'2022-11-29 14:54:43','2023-09-30 14:54:43',NULL),(167,'test6',17,'2023-04-29 14:54:43','2023-05-03 14:54:43',NULL),(168,'test2',9,'2023-01-17 14:54:43','2023-08-21 14:54:43',NULL),(169,'test7',14,'2023-03-27 14:54:43','2023-05-15 14:54:43',NULL),(170,'test7',3,'2023-02-24 14:54:43','2023-04-16 14:54:43',NULL),(171,'test9',14,'2022-12-09 14:54:44','2023-09-23 14:54:44',NULL),(172,'test8',14,'2023-07-05 14:54:44','2022-12-23 14:54:44',NULL),(173,'test8',20,'2022-12-09 14:54:44','2023-09-09 14:54:44',NULL),(174,'test10',13,'2023-07-20 14:54:44','2022-12-15 14:54:44',NULL),(175,'test10',5,'2023-06-12 14:54:44','2023-03-29 14:54:44',NULL),(176,'test1',14,'2023-08-01 14:54:45','2023-04-09 14:54:45',NULL),(177,'test4',4,'2022-11-29 14:54:45','2023-03-06 14:54:45',NULL),(178,'test7',10,'2023-05-05 14:54:45','2023-05-24 14:54:45',NULL),(179,'test10',7,'2022-11-22 14:54:45','2023-06-09 14:54:45',NULL),(180,'test2',18,'2022-11-09 14:54:45','2023-01-09 14:54:45',NULL),(181,'test4',5,'2023-07-26 14:54:46','2022-11-17 14:54:46',NULL),(182,'test5',7,'2023-06-23 14:54:46','2023-08-02 14:54:46',NULL),(183,'test3',18,'2023-03-12 14:54:46','2023-10-01 14:54:46',NULL),(184,'test5',7,'2023-07-24 14:54:46','2023-02-03 14:54:46',NULL),(185,'test3',3,'2022-11-27 14:54:46','2023-01-01 14:54:46',NULL),(186,'test7',13,'2023-06-21 14:54:47','2023-06-30 14:54:47',NULL),(187,'test8',20,'2023-03-08 14:54:47','2023-01-10 14:54:47',NULL),(188,'test4',11,'2023-05-05 14:54:47','2023-06-13 14:54:47',NULL),(189,'test6',20,'2022-10-09 14:54:47','2023-09-10 14:54:47',NULL),(190,'test5',17,'2022-10-12 14:54:47','2023-06-05 14:54:47',NULL),(191,'test9',8,'2023-08-01 14:54:47','2023-05-06 14:54:47',NULL),(192,'test10',10,'2023-03-29 14:54:48','2022-11-18 14:54:48',NULL),(193,'test4',20,'2023-01-10 14:54:48','2023-02-22 14:54:48',NULL),(194,'test3',3,'2022-11-24 14:54:48','2022-11-25 14:54:48',NULL),(195,'test2',19,'2023-08-12 14:54:48','2023-02-25 14:54:48',NULL),(196,'test1',11,'2023-06-28 14:54:48','2023-04-10 14:54:48',NULL),(197,'test1',13,'2022-10-30 14:54:48','2023-01-08 14:54:48',NULL),(198,'test3',17,'2023-03-30 14:54:48','2022-12-30 14:54:48',NULL),(199,'test8',5,'2022-11-05 14:54:48','2022-12-25 14:54:48',NULL),(200,'test6',2,'2022-12-09 14:54:49','2023-01-08 14:54:49',NULL),(201,'test7',13,'2023-05-03 14:54:49','2022-11-23 14:54:49',NULL),(202,'test7',4,'2023-08-24 14:54:49','2023-02-20 14:54:49',NULL),(203,'test3',8,'2023-08-10 14:54:49','2023-07-19 14:54:49',NULL),(204,'test10',20,'2023-07-31 14:54:49','2023-03-20 14:54:49',NULL),(205,'test7',9,'2023-06-12 14:54:49','2022-11-19 14:54:49',NULL),(206,'test1',6,'2023-06-21 14:54:49','2023-07-06 14:54:49',NULL),(207,'test2',5,'2023-08-10 14:54:49','2023-09-05 16:16:52','test');
/*!40000 ALTER TABLE `borrowed_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(255) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `registration_date` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('test1','test1','one','test1@gmail.com','2023-01-30 12:46:18.553'),('test10','test10','ten','test10@gmail.com','2022-05-03 12:46:18.553'),('test2','test2','two','test2@gmail.com','2023-02-10 12:46:18.553'),('test3','test3','three','test3@gmail.com','2022-05-03 12:46:18.553'),('test4','test4','four','test4@gmail.com','2023-01-25 12:46:18.553'),('test5','test5','five','test5@gmail.com','2021-02-11 12:46:18.553'),('test6','test6','six','test6@gmail.com','2018-05-03 12:46:18.553'),('test7','test7','seven','test7@gmail.com','2019-05-03 12:46:18.553'),('test8','test8','eight','test8@gmail.com','2022-05-03 12:46:18.553'),('test9','test9','nine','test9@gmail.com','2022-05-03 12:46:18.553');
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

-- Dump completed on 2023-09-05 16:18:36
