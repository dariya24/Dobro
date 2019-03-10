-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dobro
-- ------------------------------------------------------
-- Server version	5.5.62-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `deeds`
--

DROP TABLE IF EXISTS `deeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deeds` (
  `deed_id` int(11) NOT NULL AUTO_INCREMENT,
  `deadline` varchar(50) DEFAULT NULL,
  `duration` float NOT NULL,
  `org_name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) NOT NULL,
  `place` varchar(100) DEFAULT NULL,
  `timeline` varchar(100) DEFAULT NULL,
  `event_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`deed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deeds`
--

LOCK TABLES `deeds` WRITE;
/*!40000 ALTER TABLE `deeds` DISABLE KEYS */;
INSERT INTO `deeds` VALUES (1,'щочетверга ',3,'Львівський геріатричний пансіонат','Поспілкуватися з пристарілими, підняти їм настрій','вул. Медової Печери 71','з 16:00',1),(2,'щовівторка',3,'Навчально-реабілітаційний центр \"Джерело\"','Спілкуватися з молоддю та людьми, що там лікується, розбавити їх сірі будні','проспект Червоної Калини 86а','для детальної інформації пишіть у Viber або Телеграм на номер 0969300747',1),(3,'-',3,'Дім Емаус','Спілкуватися з неповносправними, розважити і підняти їм настрій','-','для детальної інформації пишіть у Viber або Телеграм на номер 0969300747',1),(4,'-',0.5,'-',' Зроби комплімент старшійлюдині і поділись з нею солодким.','-','-',0),(5,'-',0.5,'-',' Купи еко-сумку і користуйся нею.','-','-',0),(6,'-',0.5,'-','Купи безхатченку їжі.','-','-',0),(7,'-',0.5,'-',' Нагодуй песика, що живе на вулиці.','-','-',0),(8,'-',0.5,'-','Лиши декілька добрих записок у бібліотечних книгах.','-','-',0),(9,'-',0.5,'-',' Допоможи старшій людині донести сумки додому.','-','-',0),(10,'-',0.5,'-','Попідбирай сміття, що валяється на тротуарах.','-','-',0),(11,'-',0.5,'-','Купи флягу на воду і перестань використовувати одноразові пластикові пляшки. ','-','-',0),(12,'-',0.5,'-','Підніми комусь настрій поприбиравши навколо.','-','-',0),(13,'-',0.5,'-','Пригости незнайомця чимось смачненьким.','-','-',0),(14,'-',0.5,'-','Підніми настрій засмученому перехожому(застосуй свою фантазію). ','-','-',0);
/*!40000 ALTER TABLE `deeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` varchar(60) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_deeds`
--

DROP TABLE IF EXISTS `users_deeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_deeds` (
  `user_id` varchar(60) NOT NULL,
  `deed_id` int(11) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`deed_id`),
  KEY `deed_id` (`deed_id`),
  CONSTRAINT `users_deeds_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `users_deeds_ibfk_2` FOREIGN KEY (`deed_id`) REFERENCES `deeds` (`deed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_deeds`
--

LOCK TABLES `users_deeds` WRITE;
/*!40000 ALTER TABLE `users_deeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_deeds` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-10 11:29:45
