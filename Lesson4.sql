/* Домашнее задание 4
 * 
 * Задание 1
 * Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице).
 */


-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_12
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'qui',1),(2,'non',2),(3,'ratione',3),(4,'nesciunt',4),(5,'rerum',5),(6,'saepe',6),(7,'distinctio',7),(8,'et',8),(9,'voluptatem',9),(10,'rerum',10),(11,'laborum',11),(12,'rerum',12),(13,'magni',13),(14,'explicabo',14),(15,'voluptatem',15),(16,'aperiam',16),(17,'optio',17),(18,'dolor',18),(19,'cumque',19),(20,'voluptas',20),(21,'odit',21),(22,'ut',22),(23,'maiores',23),(24,'porro',24),(25,'laborum',25),(26,'cumque',26),(27,'sit',27),(28,'velit',28),(29,'quo',29),(30,'exercitationem',30),(31,'modi',31),(32,'suscipit',32),(33,'aut',33),(34,'libero',34),(35,'quo',35),(36,'architecto',36),(37,'qui',37),(38,'consequatur',38),(39,'eaque',39),(40,'suscipit',40),(41,'et',41),(42,'commodi',42),(43,'sapiente',43),(44,'dignissimos',44),(45,'odit',45),(46,'quod',46),(47,'ut',47),(48,'iste',48),(49,'corrupti',49),(50,'nemo',50),(51,'quam',51),(52,'iure',52),(53,'cupiditate',53),(54,'ullam',54),(55,'quaerat',55),(56,'a',56),(57,'et',57),(58,'quis',58),(59,'labore',59),(60,'deserunt',60),(61,'eveniet',61),(62,'et',62),(63,'id',63),(64,'cupiditate',64),(65,'minima',65),(66,'vel',66),(67,'quasi',67),(68,'nisi',68),(69,'recusandae',69),(70,'magnam',70),(71,'consequatur',71),(72,'similique',72),(73,'ab',73),(74,'enim',74),(75,'nihil',75),(76,'est',76),(77,'vel',77),(78,'quibusdam',78),(79,'vel',79),(80,'nulla',80),(81,'qui',81),(82,'aspernatur',82),(83,'officia',83),(84,'consequatur',84),(85,'autem',85),(86,'molestiae',86),(87,'qui',87),(88,'quia',88),(89,'iste',89),(90,'dolores',90),(91,'et',91),(92,'a',92),(93,'est',93),(94,'corporis',94),(95,'alias',95),(96,'eligendi',96),(97,'inventore',97),(98,'ea',98),(99,'voluptas',99),(100,'nam',100);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (2,3,'requested','1975-05-05 05:50:45','1985-11-10 12:11:10'),(2,9,'declined','2005-11-02 04:36:47','2004-10-30 08:44:33'),(3,1,'declined','1998-04-30 05:46:36','2011-10-01 03:56:10'),(3,32,'unfriended','1974-01-12 02:15:30','2013-11-23 06:21:29'),(3,36,'approved','1998-12-02 07:26:21','1996-01-02 09:52:26'),(4,18,'requested','1982-04-11 18:23:20','1983-11-06 22:39:37'),(4,36,'approved','1986-09-20 06:27:16','1996-03-15 03:06:10'),(6,53,'declined','1979-11-28 04:28:01','2016-03-03 12:36:02'),(8,9,'declined','1977-11-13 09:48:52','2002-12-21 18:37:12'),(9,43,'requested','2000-07-27 19:11:37','2006-07-11 14:39:13'),(10,15,'unfriended','2018-07-28 13:13:57','1979-05-28 12:16:48'),(10,51,'declined','2000-02-05 13:00:12','1984-04-01 11:32:02'),(11,96,'approved','1974-06-04 16:49:40','1971-12-20 22:04:34'),(12,39,'requested','1986-07-17 11:20:20','1986-03-21 08:46:33'),(14,78,'unfriended','1971-06-30 21:41:32','2018-01-10 10:08:36'),(14,88,'unfriended','1995-04-09 16:49:22','2009-05-25 17:22:02'),(15,68,'requested','1976-11-04 14:04:43','2015-10-31 13:52:19'),(17,26,'declined','1998-06-30 18:53:12','1978-09-01 23:13:35'),(18,95,'approved','1980-10-30 20:10:15','1974-10-07 13:41:44'),(19,2,'approved','2022-02-04 03:14:47','2018-06-01 00:36:51'),(19,12,'approved','2009-08-08 11:38:24','1986-09-15 23:23:00'),(19,14,'declined','1975-03-03 19:02:35','2015-04-23 21:16:42'),(21,22,'unfriended','2008-05-01 06:43:11','1979-10-14 05:25:51'),(28,100,'requested','2015-02-28 23:55:13','2006-06-23 22:37:49'),(29,2,'declined','2022-01-24 09:30:11','2001-04-05 18:16:03'),(29,6,'approved','1985-02-16 16:56:51','2019-08-18 10:29:31'),(29,31,'unfriended','2000-02-04 08:45:09','1999-03-10 23:41:50'),(30,52,'declined','2008-02-17 10:49:18','1981-04-08 00:35:37'),(31,93,'declined','1996-08-01 04:28:56','2011-12-14 18:21:03'),(31,98,'unfriended','1983-11-13 08:31:54','1987-02-10 03:50:22'),(34,43,'approved','1973-03-11 08:39:41','2017-03-25 10:30:07'),(34,96,'unfriended','1991-08-05 12:42:52','2007-03-28 23:03:59'),(38,83,'declined','1976-04-30 04:41:11','2001-09-16 09:33:50'),(39,78,'requested','1973-11-29 10:26:03','2007-02-23 11:34:37'),(40,14,'approved','1993-03-06 16:34:19','2019-01-16 08:22:50'),(40,40,'approved','1997-01-19 15:36:56','1970-12-18 17:29:20'),(40,76,'unfriended','1994-12-19 07:19:44','1983-03-22 18:05:24'),(41,94,'declined','1976-10-27 04:32:23','2008-03-15 15:51:20'),(42,10,'unfriended','2010-08-25 09:19:50','1985-11-10 19:15:00'),(43,74,'declined','1985-08-31 16:38:26','2015-07-25 18:20:10'),(45,86,'unfriended','1992-01-19 21:39:40','2018-06-20 15:55:53'),(46,6,'approved','1982-04-28 02:07:37','1973-08-23 11:32:41'),(47,86,'requested','2003-07-17 00:31:24','2008-06-17 20:07:52'),(50,4,'unfriended','2003-07-01 00:48:46','1978-02-01 14:01:42'),(50,17,'requested','1988-07-07 01:00:43','1995-05-08 01:52:10'),(53,34,'approved','2015-11-02 06:29:42','2014-08-19 00:03:49'),(53,85,'declined','1979-09-13 17:31:28','2022-04-18 09:33:21'),(54,7,'declined','1996-10-23 11:42:44','2001-09-07 03:59:11'),(54,37,'requested','1991-12-21 17:55:09','2021-09-26 06:04:49'),(55,80,'requested','1976-08-27 23:56:15','1996-12-03 12:01:44'),(57,55,'requested','1976-11-11 03:09:56','1979-01-16 15:44:07'),(57,75,'requested','1972-04-13 05:42:14','1972-05-01 08:05:50'),(57,82,'requested','1981-06-09 09:04:14','1978-06-30 15:09:31'),(58,88,'declined','2008-05-19 07:51:13','1993-10-29 20:23:00'),(58,96,'approved','1984-01-26 00:13:33','1983-11-22 17:48:26'),(59,14,'requested','1978-02-09 05:48:50','1978-12-16 22:54:05'),(60,62,'unfriended','1982-06-16 23:05:47','1986-10-31 06:20:47'),(61,85,'requested','2017-09-21 17:54:17','2012-01-14 16:46:10'),(62,45,'requested','2020-06-08 22:41:59','1983-11-11 17:19:45'),(62,59,'declined','1982-01-22 19:27:39','1985-11-06 15:01:06'),(62,94,'unfriended','2009-04-17 10:39:38','2001-07-20 06:14:40'),(63,36,'unfriended','1987-11-18 21:37:54','1989-12-20 11:02:50'),(64,52,'unfriended','2021-05-08 04:18:28','1991-10-07 02:07:24'),(66,77,'unfriended','1980-10-18 17:17:02','2007-10-04 04:00:30'),(67,79,'declined','2022-05-29 02:28:42','1971-06-22 12:19:34'),(68,17,'requested','1992-07-06 11:51:13','1993-12-03 02:31:00'),(68,20,'approved','1976-05-30 16:09:08','1971-09-05 19:13:24'),(69,63,'declined','2022-10-14 04:15:30','2005-11-23 12:30:10'),(70,68,'requested','1977-04-13 20:16:30','1978-06-12 16:06:43'),(73,3,'declined','2020-12-09 20:22:47','1992-07-17 11:27:25'),(73,61,'approved','1986-11-07 11:44:44','1981-01-12 05:31:49'),(74,61,'requested','1990-07-11 03:36:32','1989-04-12 14:53:23'),(75,74,'declined','2007-05-25 09:35:19','2021-08-21 19:40:34'),(76,48,'approved','1995-08-30 21:59:19','2003-07-06 07:11:54'),(77,61,'approved','2002-10-10 13:34:01','2018-03-22 22:54:35'),(78,23,'unfriended','1995-10-06 15:05:08','2022-06-02 00:29:45'),(78,88,'requested','2005-10-16 19:03:04','1980-02-04 19:15:04'),(79,53,'requested','1989-08-23 11:32:23','2016-03-23 13:22:06'),(79,59,'unfriended','1970-11-23 19:33:44','1993-09-07 13:05:21'),(80,23,'approved','1991-06-21 08:05:25','1972-10-08 07:47:40'),(81,20,'unfriended','2015-06-29 05:14:17','1997-07-09 03:14:09'),(81,65,'declined','2021-04-24 23:49:48','2012-05-23 08:18:04'),(81,80,'unfriended','1991-03-23 23:46:18','1992-11-05 03:26:07'),(82,29,'unfriended','2017-10-15 18:44:23','1988-02-19 09:17:12'),(84,37,'requested','1971-07-19 05:09:57','1975-02-21 02:44:25'),(86,2,'unfriended','2016-04-13 07:30:24','2014-03-24 09:09:05'),(87,3,'approved','1984-01-22 04:06:35','1974-08-23 09:28:43'),(88,10,'unfriended','1983-12-17 05:00:41','2010-11-07 16:55:35'),(90,4,'requested','2004-07-06 17:56:47','2003-11-16 21:33:01'),(91,33,'unfriended','1996-04-08 16:10:45','1998-05-13 20:47:16'),(91,52,'approved','2009-09-01 04:11:22','1971-07-06 05:21:09'),(91,84,'requested','1988-03-01 13:34:57','1972-09-19 03:20:52'),(93,11,'unfriended','2002-11-15 05:28:42','2022-09-03 02:52:46'),(93,49,'approved','1973-10-08 11:17:40','1989-08-30 06:13:35'),(94,63,'requested','2008-09-30 18:31:11','2016-12-18 21:10:24'),(95,16,'requested','2012-08-22 13:24:32','1990-08-10 16:37:47'),(97,7,'approved','2010-09-05 11:25:12','1985-11-16 05:13:57'),(97,29,'approved','1987-10-25 13:08:12','1989-03-16 11:32:27'),(97,64,'declined','1993-09-20 21:42:52','2007-12-26 21:06:58'),(100,9,'requested','2020-02-02 16:37:16','1992-03-10 03:35:01');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `games_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `games_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'odit',1),(2,'aperiam',2),(3,'voluptate',3),(4,'quidem',4),(5,'voluptatum',5),(6,'quia',6),(7,'consequatur',7),(8,'atque',8),(9,'officiis',9),(10,'deleniti',10),(11,'ut',11),(12,'nihil',12),(13,'eum',13),(14,'mollitia',14),(15,'quasi',15),(16,'id',16),(17,'alias',17),(18,'laboriosam',18),(19,'quia',19),(20,'officiis',20),(21,'excepturi',21),(22,'minima',22),(23,'dolorem',23),(24,'non',24),(25,'vero',25),(26,'laborum',26),(27,'fuga',27),(28,'reprehenderit',28),(29,'quo',29),(30,'quia',30),(31,'rerum',31),(32,'eos',32),(33,'minima',33),(34,'quis',34),(35,'ea',35),(36,'voluptas',36),(37,'voluptatem',37),(38,'ratione',38),(39,'rerum',39),(40,'repellendus',40),(41,'est',41),(42,'nihil',42),(43,'et',43),(44,'quia',44),(45,'inventore',45),(46,'quaerat',46),(47,'ipsum',47),(48,'in',48),(49,'aut',49),(50,'accusamus',50),(51,'non',51),(52,'aperiam',52),(53,'sint',53),(54,'non',54),(55,'totam',55),(56,'et',56),(57,'fugit',57),(58,'hic',58),(59,'repellendus',59),(60,'sit',60),(61,'dolorem',61),(62,'est',62),(63,'molestiae',63),(64,'enim',64),(65,'reprehenderit',65),(66,'qui',66),(67,'sint',67),(68,'tempore',68),(69,'ipsam',69),(70,'ad',70),(71,'commodi',71),(72,'consequatur',72),(73,'quisquam',73),(74,'dolores',74),(75,'deleniti',75),(76,'quaerat',76),(77,'modi',77),(78,'at',78),(79,'consequuntur',79),(80,'sit',80),(81,'expedita',81),(82,'possimus',82),(83,'rem',83),(84,'modi',84),(85,'placeat',85),(86,'a',86),(87,'qui',87),(88,'praesentium',88),(89,'voluptas',89),(90,'magni',90),(91,'itaque',91),(92,'ratione',92),(93,'at',93),(94,'ut',94),(95,'amet',95),(96,'tenetur',96),(97,'sit',97),(98,'cumque',98),(99,'nulla',99),(100,'voluptas',100);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groop_requests`
--

DROP TABLE IF EXISTS `groop_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groop_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(3) unsigned DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `groop_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `groop_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groop_requests`
--

LOCK TABLES `groop_requests` WRITE;
/*!40000 ALTER TABLE `groop_requests` DISABLE KEYS */;
INSERT INTO `groop_requests` VALUES (1,48,0,'2022-11-01 01:00:18','1998-09-05 14:40:50'),(3,21,0,'1974-01-05 02:55:59','2019-06-28 17:56:17'),(4,88,3,'1995-07-08 22:08:43','2005-10-22 09:45:07'),(7,13,1,'1986-05-27 23:31:55','2008-05-14 05:58:29'),(7,69,1,'1972-09-21 13:15:53','2016-01-11 11:29:47'),(8,94,2,'2008-06-22 21:48:29','2001-10-02 19:40:08'),(10,99,2,'2019-09-11 15:42:15','2001-04-07 05:20:40'),(11,26,0,'2010-08-14 19:37:50','2012-12-31 18:34:51'),(11,61,0,'2003-12-03 21:52:43','2001-12-29 08:27:30'),(11,71,2,'1977-11-12 20:06:53','2012-03-26 02:13:21'),(14,26,3,'2015-07-09 23:21:44','1971-06-12 11:21:24'),(16,27,3,'2015-02-16 14:51:58','2007-01-07 10:51:13'),(16,41,2,'2008-04-20 22:33:27','2008-02-27 04:25:44'),(19,2,2,'1983-04-30 10:09:33','1973-05-05 20:02:19'),(19,62,0,'1978-06-28 10:15:00','1988-04-15 20:48:08'),(20,63,3,'2000-09-24 18:21:22','2021-09-23 03:58:48'),(20,86,0,'2022-01-29 18:12:25','1970-02-06 10:22:40'),(21,42,3,'1985-03-21 07:43:02','1995-02-04 07:13:05'),(22,86,2,'1993-02-16 18:37:16','2016-05-04 23:08:40'),(23,94,1,'1985-06-05 11:47:11','1985-11-25 11:56:37'),(25,14,0,'2011-02-19 02:08:47','2012-07-23 15:00:43'),(31,6,1,'2012-09-03 03:46:49','2006-02-26 00:57:12'),(31,23,2,'1985-06-12 22:51:12','2011-10-22 05:26:30'),(31,30,3,'1973-11-24 01:28:12','2012-02-12 02:30:04'),(31,53,3,'1981-10-17 03:17:53','2000-12-15 12:15:01'),(32,51,0,'2002-10-17 22:21:25','2010-10-27 00:29:49'),(35,17,0,'1997-04-15 02:50:32','2014-01-03 23:35:33'),(35,75,3,'2007-06-28 10:57:50','2020-07-08 10:21:23'),(35,82,0,'1975-02-14 13:04:55','1992-10-19 01:02:52'),(36,50,1,'1992-09-14 00:47:27','2003-07-10 03:57:30'),(36,92,0,'2018-09-01 04:34:02','1988-06-16 04:13:30'),(37,89,1,'1995-04-23 09:26:51','2013-11-20 16:43:19'),(40,44,2,'1995-12-24 17:18:49','2004-02-29 19:17:34'),(40,58,1,'2016-05-09 17:20:38','1971-09-28 13:20:24'),(40,92,2,'1991-04-01 04:50:49','2004-08-13 23:15:25'),(42,10,1,'1992-01-30 12:41:41','1997-08-08 12:05:27'),(42,51,2,'2011-09-08 17:29:45','1976-08-09 13:22:09'),(44,24,3,'1997-01-17 13:31:21','1986-09-15 18:56:40'),(44,51,1,'2018-03-14 02:25:45','1973-06-08 20:35:23'),(45,70,3,'1995-09-23 06:13:57','2006-08-06 13:25:47'),(45,71,3,'1977-05-19 14:44:03','1997-04-28 10:39:26'),(45,94,2,'1996-09-18 03:24:13','1985-05-12 22:08:54'),(46,36,3,'2012-09-20 10:07:50','1981-02-15 06:39:11'),(47,86,2,'1977-06-16 02:38:21','1981-01-01 15:43:25'),(48,80,3,'1994-10-09 08:29:31','1979-06-02 02:05:47'),(49,85,3,'2020-11-01 00:13:10','1970-07-09 08:37:31'),(51,23,0,'1970-09-10 04:24:46','2019-06-13 04:13:52'),(51,31,3,'1977-12-17 04:50:54','1998-04-29 13:24:12'),(52,12,1,'1998-05-02 07:59:18','2022-09-29 12:39:27'),(54,32,2,'2021-04-19 16:11:36','1972-10-16 15:54:47'),(54,64,0,'1972-12-30 05:54:19','1982-08-17 05:08:29'),(55,5,2,'2005-03-21 20:06:56','2021-10-19 04:22:19'),(55,55,1,'1980-08-14 18:51:10','1987-08-01 21:12:38'),(57,14,1,'1981-04-19 06:37:09','1987-03-12 03:42:51'),(58,54,0,'2001-07-07 02:40:26','1986-11-06 20:18:14'),(59,93,3,'2005-09-27 11:23:55','2016-10-02 12:06:36'),(60,69,1,'1976-11-07 04:47:27','1991-11-20 04:22:53'),(61,75,2,'2007-12-12 10:35:42','1991-09-19 20:59:07'),(61,84,2,'1982-11-02 15:53:45','1994-06-08 23:04:55'),(64,1,0,'2021-08-21 22:11:55','1998-07-04 04:07:14'),(65,80,1,'1986-11-19 09:19:44','1975-04-12 06:34:09'),(66,57,1,'1981-11-03 11:20:06','1973-09-20 16:51:29'),(69,8,0,'2001-03-03 12:39:14','1978-06-22 05:31:35'),(69,38,0,'2019-02-17 01:37:36','2022-08-04 14:00:10'),(70,42,2,'2015-01-12 11:09:39','2003-01-14 16:55:09'),(71,3,3,'2019-11-03 17:33:06','2010-06-03 07:40:45'),(71,26,2,'1980-03-14 23:46:32','2009-11-26 22:00:30'),(72,80,3,'1988-09-30 04:32:01','1984-07-24 16:14:25'),(74,9,0,'1986-04-03 02:57:05','1999-10-19 02:18:36'),(78,12,1,'2013-04-22 16:02:10','1997-12-13 10:56:11'),(79,15,0,'1974-01-30 21:39:48','1983-08-10 18:22:30'),(79,21,2,'2015-02-23 06:56:37','2013-04-15 18:23:09'),(79,46,2,'2003-01-25 06:58:18','1978-05-18 02:25:10'),(79,96,0,'1970-02-12 17:59:26','2016-07-24 19:41:27'),(80,52,3,'1975-12-12 21:41:53','2021-12-23 05:36:59'),(81,34,1,'1985-12-25 18:00:36','2019-12-10 22:48:49'),(81,95,0,'1975-03-19 12:43:04','1997-05-04 06:35:00'),(82,1,0,'1987-07-17 03:25:16','1986-11-18 08:39:21'),(82,18,3,'2012-08-01 16:34:28','1978-05-25 22:27:23'),(83,12,1,'1997-10-15 09:00:39','2019-05-27 23:24:59'),(83,70,1,'2020-07-19 11:52:25','2012-09-25 14:03:11'),(84,19,1,'1984-10-02 19:51:59','1979-06-08 17:54:42'),(86,26,1,'2011-01-02 06:10:34','2012-10-17 17:15:32'),(86,100,3,'2014-09-06 06:09:40','1982-11-02 19:06:42'),(87,49,2,'2018-12-26 10:58:51','1980-10-28 08:51:23'),(88,36,0,'2020-05-04 23:01:25','1979-04-29 09:08:36'),(88,46,1,'2007-09-09 02:38:12','2017-09-27 23:12:40'),(88,90,3,'1999-08-20 14:04:32','1983-04-19 10:47:43'),(89,65,3,'1987-09-28 07:17:18','1988-02-29 13:25:00'),(93,50,3,'2014-01-22 17:14:54','2015-05-17 07:41:48'),(93,85,2,'1988-09-27 21:38:30','2016-10-09 00:58:58'),(94,27,2,'2014-06-02 04:49:19','1980-03-29 23:25:41'),(94,31,0,'1977-12-13 00:05:49','1989-09-28 14:41:09'),(94,77,2,'2020-10-17 16:53:36','1989-05-11 19:12:08'),(95,40,0,'1982-04-23 21:41:19','2007-05-26 09:58:13'),(96,4,0,'2016-12-11 05:12:39','2010-02-12 14:19:28'),(96,5,1,'1994-02-10 03:50:49','1999-08-21 09:25:11'),(98,18,2,'1982-09-27 06:27:17','2005-12-12 20:58:12'),(99,80,1,'1991-02-20 09:20:49','2022-06-03 16:31:43'),(100,7,0,'2008-02-05 16:10:02','1992-05-27 13:35:53');
/*!40000 ALTER TABLE `groop_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,27,89,'2017-08-07 00:03:18'),(2,92,54,'1999-01-08 18:02:48'),(3,92,85,'1982-04-07 19:14:24'),(4,48,99,'1971-10-28 17:08:35'),(5,86,94,'1989-06-11 21:37:28'),(6,81,98,'2019-05-21 08:06:38'),(7,59,72,'1993-11-01 17:37:11'),(8,54,35,'1989-06-05 17:08:33'),(9,56,45,'1979-02-04 00:24:04'),(10,74,24,'2008-01-09 15:09:44'),(11,86,22,'1986-10-11 15:04:21'),(12,7,93,'2011-11-19 03:23:43'),(13,70,78,'1977-11-08 22:47:43'),(14,18,41,'1979-02-21 18:57:49'),(15,49,83,'1992-09-21 15:25:31'),(16,6,75,'1971-03-30 13:27:52'),(17,71,98,'1995-05-08 12:02:04'),(18,29,63,'1976-08-07 20:43:05'),(19,82,76,'2021-12-18 04:33:33'),(20,62,68,'2006-04-13 00:57:17'),(21,69,42,'2022-08-05 12:03:22'),(22,65,28,'2004-12-08 20:42:39'),(23,14,19,'2021-04-11 18:59:40'),(24,63,70,'1988-03-18 19:00:01'),(25,63,36,'1986-05-22 22:28:49'),(26,94,49,'2004-01-02 06:11:20'),(27,58,100,'2005-06-04 07:32:06'),(28,41,27,'1980-10-14 05:46:15'),(29,77,58,'1984-12-22 08:57:30'),(30,68,25,'2014-12-09 08:54:49'),(31,41,74,'1980-03-25 16:24:54'),(32,100,12,'1984-01-16 15:14:46'),(33,71,28,'1974-04-21 09:23:57'),(34,74,53,'1980-04-19 11:36:33'),(35,4,35,'1989-05-14 21:21:42'),(36,21,73,'1972-04-13 00:50:02'),(37,77,86,'2017-12-10 16:26:24'),(38,1,91,'2001-12-04 04:41:56'),(39,4,63,'2006-10-18 20:59:47'),(40,60,66,'1971-09-06 22:36:48'),(41,98,53,'2021-10-08 11:21:08'),(42,15,55,'1979-03-29 08:25:51'),(43,52,56,'2018-11-08 12:53:07'),(44,82,29,'1976-05-24 02:14:23'),(45,13,50,'1974-10-29 18:48:04'),(46,54,54,'2008-04-17 17:49:08'),(47,23,53,'2016-07-07 13:29:00'),(48,65,94,'1984-01-13 10:45:35'),(49,81,39,'2019-01-03 04:58:42'),(50,47,84,'1998-02-18 12:54:11'),(51,74,67,'2008-08-10 13:34:02'),(52,57,50,'1974-06-26 04:19:30'),(53,52,57,'2020-08-01 10:47:57'),(54,41,55,'1986-01-06 22:30:13'),(55,20,100,'1995-06-10 13:38:33'),(56,21,18,'2003-08-21 13:32:38'),(57,53,35,'2009-06-26 20:38:18'),(58,73,5,'1988-04-06 11:37:50'),(59,90,55,'2007-08-16 00:43:58'),(60,33,3,'1972-07-28 01:17:31'),(61,4,86,'2015-11-28 13:29:13'),(62,57,26,'1991-02-09 16:31:01'),(63,39,21,'1986-12-18 03:19:19'),(64,20,19,'1978-07-11 07:10:20'),(65,59,66,'1996-12-21 22:29:46'),(66,3,33,'1998-12-03 22:37:50'),(67,32,60,'1995-07-20 02:17:53'),(68,82,84,'2019-06-13 05:26:18'),(69,17,23,'2002-10-27 21:35:21'),(70,39,36,'1988-09-02 15:44:34'),(71,22,59,'1990-11-28 21:37:32'),(72,53,75,'1987-02-04 08:38:00'),(73,94,25,'2004-11-03 11:00:44'),(74,79,84,'1991-09-28 17:25:18'),(75,79,11,'1994-05-11 12:32:22'),(76,87,82,'1991-05-01 09:56:30'),(77,97,43,'1984-09-26 00:46:04'),(78,8,36,'1982-02-05 09:12:02'),(79,64,27,'1994-07-25 00:05:02'),(80,55,23,'2000-04-16 13:58:44'),(81,93,58,'2017-12-02 14:50:58'),(82,55,25,'2002-05-01 04:43:53'),(83,17,36,'1985-01-29 04:04:52'),(84,8,33,'1971-11-29 01:55:55'),(85,59,46,'1972-10-21 00:50:35'),(86,68,81,'2010-03-04 15:18:42'),(87,5,20,'1988-03-01 11:02:19'),(88,55,98,'2011-09-04 04:56:13'),(89,45,33,'1984-04-11 07:06:36'),(90,82,23,'1992-06-11 04:51:18'),(91,44,68,'2011-08-17 08:13:04'),(92,5,41,'2004-03-01 12:09:15'),(93,10,12,'2001-12-12 03:57:43'),(94,76,74,'1997-09-21 12:31:25'),(95,39,30,'2018-01-12 16:44:34'),(96,96,32,'2014-07-18 08:26:21'),(97,87,50,'1978-07-23 03:34:25'),(98,56,4,'2000-05-16 00:55:29'),(99,86,63,'2001-05-31 08:03:22'),(100,36,44,'1979-11-01 13:12:00');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,69,'Omnis ad unde porro vitae ipsum sit aut. Doloribus eos rerum fugit eaque. Et consequuntur et est ex.','quis',143,NULL,'1983-02-11 12:07:18','2021-07-12 13:33:50'),(2,2,21,'Ad et placeat praesentium. Veniam quia ipsum voluptates est est omnis. Dolorem aliquam quia labore aliquid qui praesentium. Minus ullam labore est est. Quo maiores ex quaerat qui molestiae maiores perferendis.','quo',547422,NULL,'2022-10-12 16:56:07','2020-12-19 04:06:46'),(3,3,99,'Perferendis quos sapiente numquam eaque. Et labore sunt blanditiis doloremque rem aut. Eum est animi similique.','asperiores',147000205,NULL,'1987-11-23 21:51:32','1985-09-16 00:42:50'),(4,4,6,'Aperiam qui repellat dolorem amet cum. Quia sit tempore ea aut magnam. Necessitatibus harum quam corporis eum. Labore officiis repellat ipsa corrupti corrupti sint et.','voluptatem',76,NULL,'2011-06-13 20:38:13','2016-03-22 14:56:31'),(5,1,50,'Est et optio cupiditate temporibus et temporibus. Nam id et non ut maxime non. Et neque qui dolorem possimus.','repellendus',63007,NULL,'1997-04-19 19:32:57','1992-12-02 16:51:28'),(6,2,85,'Aut laborum totam magnam quisquam. Quidem est hic exercitationem officiis. Et omnis autem aut qui odit. Praesentium ut est non aut sed et et.','rerum',4504918,NULL,'1972-06-03 04:41:26','2019-07-27 05:07:02'),(7,3,36,'Sed iste ut et. Facilis ea et aut quod earum.','exercitationem',73193581,NULL,'2004-05-07 20:52:41','2009-01-10 01:01:16'),(8,4,82,'Id qui ratione magni voluptate. Deserunt perspiciatis perspiciatis ut excepturi sit dicta. Repellendus labore modi dolorem ut eos nihil eos.','ad',583322484,NULL,'1974-10-06 05:50:50','1981-09-15 18:16:03'),(9,1,93,'Voluptas aut nisi tenetur et temporibus molestiae cum. Et inventore et ipsa et est. Non illum et minus sunt molestiae quia voluptas.','necessitatibus',8425,NULL,'2005-04-17 23:24:32','1982-06-23 15:33:37'),(10,2,47,'Earum quae magni nulla maxime. Occaecati et deleniti ratione fugit ullam omnis commodi. Tempora ut saepe occaecati qui similique repudiandae facilis. Totam ex ad cum rem distinctio nam facere qui. Consequatur iusto accusamus voluptatem beatae numquam aut earum.','earum',0,NULL,'2002-03-02 14:29:32','1985-01-17 01:46:21'),(11,3,25,'Temporibus animi dolores quibusdam iusto odit. Consequatur nisi tempore et vero et ullam et. Qui dolores dolor reiciendis et. Non ratione a maiores.','maiores',2772,NULL,'1999-02-15 12:40:51','1981-03-28 05:39:29'),(12,4,97,'Et rerum facere tempore. Corporis voluptatibus qui illum et quidem adipisci. Ut asperiores voluptas sit tenetur tenetur. Laudantium totam id soluta sit. Voluptatem dolores et est alias possimus sapiente qui.','voluptas',6,NULL,'2007-03-29 14:05:51','2004-05-25 05:51:30'),(13,1,99,'Quia est quisquam pariatur dolorum voluptatem occaecati veniam molestiae. Quia officia ab culpa magnam debitis blanditiis similique. Doloremque rerum et necessitatibus. Aliquid ipsam repellendus debitis doloribus magnam qui enim aperiam.','at',51945,NULL,'1987-09-01 03:40:47','1979-01-24 03:52:40'),(14,2,87,'Dignissimos vel quod in quo provident unde. Qui quisquam sed nemo et modi et et. Nulla vel ducimus quas. Vel quia possimus tempore et suscipit odio.','libero',0,NULL,'1985-04-03 18:48:05','2016-11-07 08:00:26'),(15,3,73,'Minus dolorem natus delectus. Explicabo deleniti eos enim ut libero nulla. Omnis blanditiis officia a eligendi qui nam ut.','illum',815097,NULL,'2010-11-28 23:51:21','1986-09-22 23:19:38'),(16,4,69,'Voluptatum pariatur qui et distinctio accusamus et nam. Quibusdam unde ut voluptatum neque. Accusamus voluptas sunt alias perspiciatis.','quibusdam',61377670,NULL,'1988-07-19 21:14:13','1998-05-03 04:39:57'),(17,1,87,'Autem sint ea minus aut. Vitae alias a numquam tempora praesentium consequatur velit. Sunt excepturi quibusdam eos voluptates iure sint. Rerum consectetur et saepe.','rerum',10610334,NULL,'2005-11-12 21:39:20','1979-02-08 21:07:51'),(18,2,38,'Et architecto et pariatur qui. Sed est qui ex saepe. Exercitationem nemo corrupti velit aut illo minima corrupti.','ratione',7689,NULL,'1996-06-21 07:32:39','2019-11-26 04:21:56'),(19,3,88,'Sunt sit laboriosam aut doloremque. Non non est facilis aut unde totam. At porro nesciunt est velit. Quia ut cumque accusamus in eum quia expedita libero. Voluptatum quidem incidunt et nemo.','et',649,NULL,'1980-03-02 03:08:33','1993-11-08 06:00:05'),(20,4,14,'Ipsum velit odit doloremque deserunt. Expedita dolorem alias sed dolor assumenda. Voluptate autem iste qui. Ut ut quae quos quaerat est.','voluptatum',581383759,NULL,'1993-05-08 03:40:31','1975-02-03 15:25:01'),(21,1,55,'Dolorem illo facilis omnis sit. Asperiores sed hic libero error esse. Ratione optio porro iste labore vel. Repellendus quod est quo pariatur illo quis ex.','ut',13964597,NULL,'1971-01-13 17:02:24','1981-03-24 09:35:46'),(22,2,24,'Velit beatae voluptas similique quam quia amet. Dolorem culpa dignissimos perspiciatis cumque qui. Unde eius sint consequatur et. Labore dolor at ipsa in necessitatibus voluptate.','temporibus',0,NULL,'2007-05-24 09:50:34','2004-01-15 00:51:16'),(23,3,83,'Unde at eius nisi. Ea delectus quod vero quia voluptatem quidem est. Autem sed omnis ab quia delectus. Ad rerum nisi maxime.','sapiente',967303,NULL,'2005-07-27 18:24:05','1985-10-24 16:53:53'),(24,4,65,'Architecto cumque vitae optio placeat non qui. Facilis quasi earum incidunt harum qui. Error et sit alias nihil. Laudantium qui voluptas esse corrupti et ratione.','sit',3749,NULL,'2016-03-11 15:07:57','2019-09-17 02:51:09'),(25,1,12,'Similique ut sint numquam. Et ea voluptatum perspiciatis fugit. Est ut excepturi non non sunt quae dolorem. Suscipit nihil et omnis qui accusamus voluptatem quia id.','rem',90159,NULL,'1986-08-22 11:14:08','1971-10-08 05:27:29'),(26,2,98,'Beatae iure sunt sed quis voluptatum voluptatibus magni. Delectus delectus rerum quaerat temporibus corporis quia.','porro',29,NULL,'1994-12-09 01:57:44','2017-04-05 13:38:17'),(27,3,57,'Voluptatibus quod dolorem non voluptatem debitis laudantium. Beatae deleniti inventore architecto culpa eaque. Qui voluptas deleniti ea ut voluptates sit optio. Aut ea in cumque qui molestiae laboriosam dolor.','a',95230,NULL,'1975-01-18 13:35:01','1973-09-27 22:46:56'),(28,4,48,'Nobis quisquam enim voluptatem qui. Illo et esse illum molestiae. Id aperiam et dolore.','et',161122,NULL,'1984-11-21 13:32:07','2010-08-30 00:06:33'),(29,1,34,'Sed eaque modi optio et. Explicabo voluptates dolor suscipit atque hic minima. Harum dolor saepe aut maiores consectetur est fugiat. Distinctio qui aut aliquam fugiat et facere.','omnis',816,NULL,'1971-09-04 12:35:54','1992-04-23 11:54:20'),(30,2,17,'Doloribus sit consectetur quia. Fuga accusamus consequatur tenetur ea aspernatur placeat. Nihil non sed aliquam et ea. Quo laboriosam temporibus similique sint non rem sed.','aut',311,NULL,'1980-01-30 19:25:36','1987-08-14 07:43:22'),(31,3,36,'Officia dolor placeat cupiditate nam in laboriosam. Deserunt et autem omnis error. Qui sed ipsa voluptates dolor. Nemo veritatis expedita occaecati voluptatum sapiente.','aut',44691,NULL,'1990-05-23 07:51:03','2014-07-16 08:07:46'),(32,4,3,'Iste illum voluptas eum quod. Eius aliquam aut ut ea aut officiis et. Fuga enim qui nihil omnis.','ut',0,NULL,'2020-09-19 21:10:50','2016-03-08 07:17:23'),(33,1,38,'Cupiditate autem facere omnis. Molestiae aliquid et quas. Dicta cupiditate impedit ipsum eligendi. Quia vero saepe nihil dolores rerum quasi sunt.','expedita',388,NULL,'2005-02-21 21:13:27','2002-02-20 18:22:56'),(34,2,34,'Suscipit vitae aut sequi facilis explicabo. Quod quibusdam neque fuga quis. Cum odio esse fuga expedita maiores accusantium.','eos',0,NULL,'1987-03-21 05:35:54','2015-12-28 02:11:13'),(35,3,8,'Sed et blanditiis aut aut. Reiciendis adipisci voluptatem non. Veniam omnis vero doloremque architecto et quia aspernatur.','aliquam',852756,NULL,'1986-09-16 11:07:32','1985-11-24 00:48:02'),(36,4,87,'Ut nihil explicabo quas odit. Eveniet aut nemo aut numquam amet mollitia ut.','quasi',301993924,NULL,'2005-02-28 14:27:44','1975-12-25 18:27:09'),(37,1,18,'Dolorem qui voluptas voluptas et eaque maxime cupiditate. Ab dolor ipsum totam provident non. Aut expedita est enim.','voluptatem',175701,NULL,'1993-05-18 00:18:54','2022-07-14 07:16:57'),(38,2,44,'Est nulla quisquam magnam et. Recusandae a nemo eum dolor. Perspiciatis atque explicabo non consectetur. Accusantium quam exercitationem vitae eius natus dolore.','adipisci',2,NULL,'1998-11-25 06:28:31','2006-08-09 08:21:26'),(39,3,68,'Eveniet non dicta fuga alias consequuntur sit cumque. Ea quis ratione sunt nisi accusamus quae omnis non. Voluptas et ducimus itaque necessitatibus tempore expedita est. Quia repellendus asperiores dicta sit et alias dignissimos.','sed',471,NULL,'1976-03-01 18:00:28','2009-11-26 02:02:34'),(40,4,11,'Necessitatibus magnam qui qui eveniet corporis dolorem mollitia. Porro aut voluptatum eius unde labore vel et. Sapiente nihil debitis consequatur non voluptas minus. Eveniet cumque totam voluptas vero alias.','est',89904461,NULL,'1987-04-21 14:42:50','2002-06-21 15:31:48'),(41,1,90,'Eum excepturi esse modi nemo. Eius vitae quo quidem numquam. Aperiam corrupti dolorem fugit ut magni suscipit sint et. Porro illum eos esse. Sint nesciunt et quas aliquid saepe minima.','sit',0,NULL,'2019-06-26 20:09:33','2010-07-25 07:00:41'),(42,2,93,'Dolore modi omnis nemo doloremque et exercitationem eligendi. Tempora eos cupiditate et iure eius. Quae aliquid facilis quia soluta distinctio velit maiores. Aut vero aspernatur autem eveniet.','atque',90540966,NULL,'1971-10-04 03:05:15','1994-06-01 04:05:35'),(43,3,8,'In repudiandae aut atque repudiandae id nisi voluptatibus. Esse illum quam amet dolorum similique totam nobis quisquam. Quo tenetur quia fugit et quis excepturi. Saepe nobis quo assumenda fuga necessitatibus at expedita.','eum',134483,NULL,'2019-03-12 11:20:07','1986-01-12 06:35:01'),(44,4,89,'Deleniti et ut qui impedit sit velit. Ipsam sapiente ipsa ex. Nihil consequatur voluptas cum id corporis quia.','eveniet',1480370,NULL,'2006-07-09 14:25:22','1980-08-26 23:31:39'),(45,1,80,'Qui numquam eos aut consequuntur omnis. Illum aliquid architecto quia placeat nihil incidunt est assumenda. Omnis quibusdam dolorem quasi aut. Voluptatem doloremque voluptas fugiat incidunt optio. Temporibus quae sequi voluptas consequuntur voluptas dignissimos.','quia',726409,NULL,'2016-01-15 23:12:28','2007-10-22 23:47:47'),(46,2,80,'Excepturi et reiciendis perferendis dolor corporis. Vel voluptate quibusdam vel. Mollitia dolor et ipsa. Temporibus aut dicta vel dicta quo.','pariatur',514,NULL,'1975-11-17 04:12:32','1988-11-03 10:09:58'),(47,3,57,'Facilis ut et velit similique placeat. Sit voluptatibus nihil ut ut ut. Molestiae recusandae et labore quasi eum facilis non. At perspiciatis non tempora facere omnis.','vel',987,NULL,'2012-05-07 16:49:15','1987-12-06 22:34:42'),(48,4,66,'Enim adipisci et fugiat officia dolorum magni maiores. Atque ex suscipit suscipit nihil dolore. Nulla itaque exercitationem ut est ut.','occaecati',957,NULL,'2003-02-28 00:05:24','1988-11-25 14:58:23'),(49,1,18,'Aperiam reiciendis voluptas voluptates assumenda est atque. Quis incidunt necessitatibus ut modi. Quibusdam doloremque dolor ipsa incidunt porro neque aliquam nam.','ex',22738460,NULL,'2001-10-26 15:57:02','2001-06-09 03:04:10'),(50,2,45,'Repudiandae adipisci ut et commodi recusandae eum qui ea. Et reprehenderit nihil necessitatibus officiis atque tempora sed. Cumque nihil nobis qui alias pariatur.','voluptate',14036,NULL,'1972-01-26 04:29:13','1970-10-03 16:30:10'),(51,3,80,'Non expedita eum cumque. Et aliquid corporis non explicabo molestiae et. Provident non ea accusamus aliquam excepturi ullam.','magni',74398,NULL,'2014-05-16 02:28:08','1981-08-31 18:37:31'),(52,4,72,'Soluta sapiente quia voluptas magni ullam dolores nostrum. Totam nihil voluptatem doloremque.','eaque',4862,NULL,'2021-10-29 15:59:00','1976-11-04 09:17:08'),(53,1,69,'Hic numquam reprehenderit eum laborum repellendus quasi. Autem dolor nam enim voluptate id. Quia perspiciatis voluptatem beatae quam in ut. Dolore sit quas recusandae voluptatem.','nisi',913087,NULL,'2010-05-05 16:31:01','2006-06-20 07:06:18'),(54,2,62,'Reiciendis suscipit dolores commodi reprehenderit nesciunt mollitia fugiat voluptate. Reprehenderit ut officiis vero. Repellendus at veritatis mollitia aut deserunt.','sint',68,NULL,'2016-10-10 08:41:35','2006-08-06 15:35:14'),(55,3,37,'Eligendi inventore nisi doloremque ut. Repellat molestiae asperiores nemo commodi qui unde. Quam omnis incidunt corporis est eligendi occaecati qui maxime. Corporis mollitia et et sapiente animi.','consectetur',79583783,NULL,'2015-09-08 08:30:54','2017-12-16 14:15:59'),(56,4,80,'Sunt qui facilis quis ut nostrum molestiae. Inventore occaecati praesentium quae minus eum ab. Inventore ea consequatur necessitatibus alias blanditiis. Atque enim ut minima officiis et error.','qui',5700,NULL,'2015-09-08 03:36:41','2008-08-22 11:47:52'),(57,1,59,'Dolorem culpa distinctio eaque voluptatem vel neque. Nulla aliquid assumenda magnam fugit. Et maiores et voluptatum error.','repellat',5685,NULL,'2016-09-06 05:36:04','1991-07-13 07:40:30'),(58,2,93,'Non quisquam itaque aut non iure dolores consequatur quae. Suscipit esse repellat explicabo eligendi alias. Consequatur et dicta iure velit eveniet est in. Harum et qui ullam ducimus. Autem voluptas aut id.','tempore',0,NULL,'2019-06-01 20:36:59','2000-03-20 07:00:12'),(59,3,28,'Id fugiat culpa sit delectus tempore. Rem aut quae facere sapiente dolor quia. Sed libero soluta voluptas inventore. Vero provident aliquam fuga similique. Recusandae exercitationem nisi dolorem sit id corrupti similique.','doloremque',71022147,NULL,'1983-08-02 04:09:16','2020-11-06 03:59:57'),(60,4,93,'Non qui sit provident sit possimus. Sunt iusto eaque eos occaecati quo officia. Molestias quis qui praesentium saepe laborum. Excepturi provident possimus enim perferendis eaque ab reprehenderit.','sed',0,NULL,'1980-09-16 17:18:58','1975-10-01 22:20:04'),(61,1,10,'Deleniti nostrum quam ab quae. Qui sunt et qui et. Quis rerum natus sed. Et ipsam quibusdam ut ea eos aut.','vel',478,NULL,'1984-11-29 00:11:42','1991-10-14 08:53:38'),(62,2,63,'Expedita ea corporis eius consequatur exercitationem. Culpa ipsa eos quia quos.','exercitationem',291149759,NULL,'1981-09-10 23:30:25','1976-09-21 17:56:59'),(63,3,96,'Dolorem voluptatem in debitis sunt laudantium est. Similique quo magni consequatur dolor iusto labore.','animi',687,NULL,'1988-07-07 12:27:50','2005-02-10 13:23:53'),(64,4,48,'Aut illo autem ut voluptatem velit blanditiis velit. Temporibus omnis ipsa ab sit nobis vel autem. Eveniet iusto natus dolorem. Ut aliquid et ipsum dolores perspiciatis quasi quos.','ratione',9,NULL,'1985-08-15 13:06:22','2015-02-22 02:59:37'),(65,1,96,'Consectetur odit aut quisquam quis nihil. Modi hic sequi velit veritatis temporibus sapiente. Et fugiat placeat velit mollitia consequatur accusantium.','molestiae',48,NULL,'1994-05-27 20:19:59','2011-03-09 17:34:47'),(66,2,3,'Nobis quod facere vel eius eligendi. Et rerum consequuntur reprehenderit repellendus dicta inventore et. Quod eius repellat quia voluptatem architecto rerum. Possimus exercitationem laborum sunt ipsum officiis optio et.','aut',4,NULL,'2013-11-15 08:17:36','2017-09-06 03:23:49'),(67,3,35,'Laborum sunt doloremque excepturi amet rerum. Vel quae enim maxime natus quis voluptatem amet minus. Doloremque rerum rerum facere doloremque molestiae.','rerum',9003759,NULL,'1988-05-09 07:54:12','1981-03-01 14:18:25'),(68,4,14,'Laborum non veritatis et rerum veritatis quaerat. Nostrum voluptas sit similique nesciunt quo. Qui sed natus ipsum quos. Tempora adipisci occaecati optio aspernatur.','ut',881703201,NULL,'2003-02-21 03:12:05','1988-04-11 12:46:44'),(69,1,46,'Ullam magnam nemo et cupiditate. Ea voluptate sint in sed. Voluptate iste repellendus consectetur praesentium ut. Sed enim vel ut ipsum vel natus ea.','qui',204,NULL,'1982-09-08 08:47:08','1983-12-03 23:52:33'),(70,2,3,'Expedita laudantium aut quos dolores voluptate. Explicabo optio minus occaecati deserunt deserunt et. Ullam dolorum ullam atque. Qui harum fuga dolores consequatur.','modi',0,NULL,'1992-01-06 13:43:01','1990-03-04 04:36:55'),(71,3,25,'Velit voluptatum consectetur id sit dolor eos. Beatae asperiores in consequatur aut placeat nisi. Esse similique aliquid et facilis. Error et iste animi reiciendis.','tenetur',0,NULL,'1977-08-22 20:55:31','1993-04-11 09:25:45'),(72,4,36,'Expedita voluptas cupiditate quidem autem voluptatem delectus sed. Sequi nobis cumque voluptatum eos.','in',38512976,NULL,'1980-11-24 09:36:25','1983-07-21 08:47:54'),(73,1,96,'Assumenda ullam nisi est. Adipisci aut nam rem quas itaque itaque. A consequatur ut vel cupiditate ab voluptates. Ut quo quo et eligendi beatae qui et dolores.','numquam',274730,NULL,'1999-06-05 21:30:11','2017-08-10 15:01:34'),(74,2,32,'Similique suscipit commodi et ratione omnis est cupiditate dolores. Quasi occaecati voluptatem voluptas ipsam id nisi necessitatibus asperiores. Corrupti distinctio et architecto atque nihil ut.','provident',67603,NULL,'1996-06-15 07:31:36','2000-08-05 21:36:01'),(75,3,25,'Placeat molestiae alias alias dolore. Eligendi ullam laboriosam non in vel. Maxime qui consequatur iure aliquid.','doloribus',4,NULL,'1973-11-01 03:04:12','2000-04-03 18:38:20'),(76,4,75,'Nihil quis dicta iste non. Illum ullam beatae enim sit in et. Libero eum facere sapiente rerum itaque qui voluptatibus. Adipisci modi molestias enim recusandae.','fuga',34,NULL,'2008-03-24 01:14:56','1998-12-14 20:08:18'),(77,1,12,'Velit sunt iste et illo vel nemo quidem aspernatur. Vitae illum voluptas numquam cumque tenetur dolorum quaerat. Natus dolorem quisquam et quia at non voluptatem. Alias quo quaerat laudantium quisquam aut neque.','voluptatem',25,NULL,'2007-04-02 23:41:49','1997-06-28 02:58:43'),(78,2,81,'Et ex voluptatem autem unde sed ipsam. Et eligendi cum a ut laborum. Sit est placeat est omnis qui. Dolores quia harum et porro unde sed ea iste.','eaque',549566,NULL,'2021-04-09 06:07:08','1982-06-09 02:34:15'),(79,3,41,'Hic mollitia ad quasi accusantium possimus. Aut nihil repellat ratione recusandae ipsum. Veniam adipisci enim maiores quos. Id qui dolore excepturi et ut nostrum aperiam. Beatae aut quae in.','est',59419,NULL,'1975-07-27 03:40:10','2014-09-13 14:30:16'),(80,4,29,'Qui doloribus reprehenderit ut sit. Deleniti voluptas nihil nostrum consequuntur et architecto numquam. Dolorum et dolor tenetur sunt voluptas cumque. Dolor odit sunt enim distinctio.','voluptas',84,NULL,'1978-05-24 05:40:34','2022-08-26 02:31:55'),(81,1,26,'Officia ab tempora esse incidunt iusto alias veniam. Voluptatem dolore voluptatem ipsa et. Repudiandae quo quis aliquam neque dolores nisi adipisci.','doloribus',8,NULL,'2017-03-16 22:21:19','1995-10-05 09:35:09'),(82,2,20,'Voluptates dolorem occaecati voluptas et voluptatem odit neque. Odit esse harum culpa dicta. Est amet dolores quo sit qui maxime alias. Asperiores qui qui recusandae et nihil.','est',806379018,NULL,'2020-07-19 09:43:05','2007-12-22 17:55:39'),(83,3,100,'Facilis incidunt ea placeat aut consectetur. Rerum veniam blanditiis illo quibusdam similique doloribus. Omnis quidem exercitationem accusantium fugit magni. Et asperiores ad minima dolorem sapiente et occaecati iste.','et',67237,NULL,'1981-07-07 14:13:55','1982-05-11 15:29:34'),(84,4,94,'Ut dolore eos alias maxime et. Fuga et consequatur in itaque. Eveniet eum accusamus sit amet.','dolores',24,NULL,'2009-12-10 12:23:37','1970-04-27 20:31:03'),(85,1,82,'Vero qui necessitatibus voluptate non explicabo magnam illum. Tenetur rem illo dolor possimus sunt debitis. Rerum dolore ducimus ipsa deserunt.','praesentium',0,NULL,'1994-02-05 22:16:46','2013-11-15 01:15:27'),(86,2,37,'Labore minima cumque facilis qui hic ea sed. Necessitatibus non eveniet sunt reprehenderit sint et. Et maxime odio iste placeat. Vel aperiam ullam sint sed repellat consequatur. Impedit eaque aut in et odio id expedita.','necessitatibus',3027334,NULL,'1985-01-04 11:11:05','2003-04-16 18:24:53'),(87,3,74,'Esse aut et rerum totam. Ipsum officiis officiis exercitationem id. Ut impedit rem qui debitis rerum fugiat illum.','expedita',92,NULL,'1995-06-08 09:31:43','2009-09-26 01:38:43'),(88,4,41,'Ipsa similique nesciunt eius vitae atque magni dolores. Id nostrum quam iste sit repellat. Nostrum ad ut eum laboriosam iusto quaerat.','ratione',167,NULL,'1997-09-22 18:10:07','2005-12-31 16:24:14'),(89,1,29,'Harum pariatur numquam dolorum magni. Autem dolor placeat asperiores. Ad totam dicta ex commodi. Pariatur quam dolores accusamus sunt.','distinctio',1,NULL,'1978-05-24 23:33:26','1992-02-20 03:30:56'),(90,2,1,'Et et qui sunt ex a. Eius ut aliquid et vel. Deserunt aperiam nulla enim ipsam.','magnam',36822,NULL,'1982-02-19 13:50:40','1971-12-23 08:12:53'),(91,3,33,'Minus eligendi eligendi deserunt voluptatum voluptatem aut libero. Est iure ullam cupiditate facilis. Facilis id commodi autem reiciendis ut quia quis nostrum. Ea dolores corporis ex.','aperiam',94802040,NULL,'1984-08-12 02:18:51','1974-01-03 04:32:14'),(92,4,39,'Optio similique unde mollitia eius aperiam quibusdam inventore. Dolorem facere nemo porro cupiditate provident. Voluptatem animi aut aut aut quod voluptatem vero atque.','iure',867763445,NULL,'1999-07-22 00:17:58','2012-06-07 19:08:09'),(93,1,63,'Tenetur quis odio et nemo dolorem. Id doloribus tempora eaque delectus culpa. Nam molestiae molestiae maiores nam doloremque officiis.','praesentium',2067,NULL,'2004-12-04 14:58:31','1977-04-10 18:34:54'),(94,2,29,'Voluptatem occaecati error atque est cumque quis nam. Fuga eum vero minima earum.','eum',740004287,NULL,'1975-08-01 20:47:52','1980-11-05 08:40:34'),(95,3,87,'Nisi inventore sunt sed ut quo pariatur sint sint. Architecto ipsum et quos distinctio velit est eius magnam. Esse est sequi et et necessitatibus. Omnis eum molestiae ut nisi et iste vel.','recusandae',407476,NULL,'2009-01-09 01:45:41','1983-03-20 18:58:30'),(96,4,59,'Ut esse atque recusandae non repellat necessitatibus accusamus. Distinctio provident ut nihil voluptatem accusamus voluptates. Similique et consequatur laborum architecto velit rem qui.','eaque',597489816,NULL,'1971-05-29 10:38:03','2020-06-19 16:41:55'),(97,1,31,'Qui veniam repudiandae nesciunt eum saepe eaque facere. Maxime enim laborum in odit sed. Earum est reiciendis voluptates distinctio similique voluptatem. Ut aliquam aperiam aliquam quod aut aut sit ea.','delectus',77,NULL,'1995-07-30 02:26:33','1981-07-10 10:02:35'),(98,2,21,'Harum ad cum sit qui. Dolores sed quibusdam ullam. Consequatur minima quidem et. Iusto est non mollitia eos possimus.','ratione',946455170,NULL,'1981-04-08 19:20:29','1988-05-12 11:47:25'),(99,3,72,'Consequatur est rerum aut dolorem earum possimus. Ut ex deserunt expedita aperiam praesentium. Culpa dolores sit tempore amet qui voluptate.','eligendi',52695883,NULL,'2010-04-16 03:57:14','2016-04-16 03:44:27'),(100,4,77,'Fugiat doloribus in aliquam numquam nihil. Deleniti voluptatem molestias qui sit. Fugiat iure sit dolor quasi iste doloribus veniam veniam.','optio',99,NULL,'2016-05-22 20:21:34','2005-01-02 05:26:34');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'non','2005-04-30 06:37:37','2017-08-25 23:07:24'),(2,'pariatur','1973-10-16 07:52:27','2022-01-10 01:14:22'),(3,'ipsam','1995-10-06 13:57:09','2013-02-03 01:56:41'),(4,'ea','1996-10-03 23:29:44','1971-11-08 15:53:17');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Assumenda voluptatem ut minus rerum. Cupiditate ullam voluptate molestias officia. Cupiditate et omnis atque quidem sint et itaque. Cupiditate neque modi debitis officiis ad. Asperiores quas doloribus alias impedit quasi consectetur pariatur.','2002-11-09 22:52:21'),(2,2,2,'Aut aut et minima nisi. Iste sit expedita quia et. Nesciunt est hic aspernatur minima et officiis aut. Placeat molestiae non rerum accusamus tempore perferendis illum.','1981-02-02 18:27:00'),(3,3,3,'Consequatur nam quisquam asperiores error nihil quibusdam. Perferendis adipisci temporibus veritatis ut distinctio libero autem. Vero dolor repellat velit inventore at.','2003-09-19 13:45:49'),(4,4,4,'Omnis rem ut corporis vel facere alias aut. Qui sequi aperiam et perspiciatis. Architecto tempore magnam alias accusantium debitis et. Laborum numquam est eos eveniet quo quas quas.','1984-06-15 03:34:48'),(5,5,5,'Error et in distinctio ipsum ratione reprehenderit. Distinctio recusandae praesentium non nostrum. Repellat nostrum reprehenderit quod.','1996-06-10 14:54:24'),(6,6,6,'Est et molestiae assumenda accusamus odit ipsa nostrum et. Quasi ut mollitia accusantium eos aperiam aut totam. Quo minima repellendus id.','2013-04-05 18:05:20'),(7,7,7,'Natus maiores autem quia corporis repudiandae. Consectetur eius et quo nobis cumque. Sunt delectus aliquid voluptates velit. Illo totam nostrum similique culpa et. Deserunt consequatur nihil sit nihil accusamus impedit.','1987-05-10 12:13:50'),(8,8,8,'Tempora laboriosam qui quia iusto in quisquam earum. Nihil veniam consequatur consequatur animi iste.','2013-09-07 07:33:54'),(9,9,9,'Esse praesentium molestias quaerat provident omnis nulla temporibus. Voluptatem omnis minus amet doloremque cum sit itaque adipisci. Dicta quaerat voluptas vero non.','1972-01-04 23:03:47'),(10,10,10,'Eius modi adipisci dolor sapiente dignissimos nesciunt provident. Dicta officiis eius ut nulla. Consequatur at quia minima. Eveniet aut quidem voluptatem incidunt. Id repudiandae aperiam magni laudantium perspiciatis nostrum.','2019-05-12 11:52:25'),(11,11,11,'Est iure dolor tempore quam quod ullam atque. Incidunt cum est omnis voluptates aperiam culpa non voluptatum. Dolor consequatur fugiat qui consequatur aut enim.','2001-01-03 18:50:28'),(12,12,12,'Suscipit sed rerum minus facilis. Veniam expedita tempore officiis dolores quos ea. Aspernatur dolor rerum maxime consequatur. Dolorem ab voluptatem reprehenderit quae excepturi debitis.','2013-08-18 03:35:48'),(13,13,13,'Consequatur est dolore repudiandae accusantium. Suscipit nisi velit fugit porro facilis. Quis sed voluptate necessitatibus harum omnis exercitationem consequuntur voluptates.','2016-02-16 12:54:23'),(14,14,14,'Eligendi velit beatae ut iste qui. Itaque facere aut voluptatem minima optio qui occaecati. In rerum commodi tempora.','1971-03-21 12:23:27'),(15,15,15,'Ut dolores asperiores non quam. Aut sit asperiores laudantium rerum qui rerum aut. Voluptatem magnam ut possimus commodi. Est ipsam modi quis repellat.','2010-08-18 18:08:03'),(16,16,16,'Impedit necessitatibus pariatur nisi eum veniam voluptas quia. Similique est est ullam doloremque vero est. Sapiente rerum voluptas et et officiis. Labore rerum facere accusamus ducimus quod aut enim.','2022-10-12 18:54:42'),(17,17,17,'Commodi est ducimus velit. Nobis dolores eos delectus eum quasi voluptatum. Et ipsa dolorum quo qui fugiat labore sequi.','2004-11-09 13:35:53'),(18,18,18,'Praesentium nesciunt perferendis repellat. Et eligendi voluptatem vel in laboriosam. Modi quo neque voluptas beatae. Sint eius ipsam atque commodi error odit fugit.','2001-03-07 13:04:36'),(19,19,19,'Fugiat in sunt ut et nihil dolor nesciunt. Dolorum consectetur voluptatum asperiores quibusdam atque amet et.','2017-06-28 12:11:22'),(20,20,20,'Perferendis ut porro distinctio minus quas porro ipsa facilis. Quia eos et maiores nemo ab omnis sunt. Natus illo pariatur nobis odit. Sed rem ullam aliquam aut nemo at consectetur.','1985-03-20 17:52:22'),(21,21,21,'Sint modi error repellat autem vero. Nemo delectus omnis doloribus pariatur sunt. Perferendis quas deserunt voluptatibus vel aut qui.','1986-10-08 06:41:04'),(22,22,22,'Quos officia ut dolorem velit aspernatur occaecati. Exercitationem cumque voluptatem rerum animi temporibus consequatur fuga. Quis earum laborum eum nihil ad et. Inventore temporibus beatae accusantium molestias.','1977-07-20 22:31:20'),(23,23,23,'Voluptas fuga ea quia dolores dolor vero unde quae. Molestias vitae et explicabo vel. Facilis error assumenda ea blanditiis quia minima.','2014-03-16 19:29:01'),(24,24,24,'Quaerat voluptas enim sit velit. Laudantium fugiat commodi dolor ab repudiandae voluptatem. Tempore ratione non ut et asperiores sequi a.','1974-06-13 18:24:06'),(25,25,25,'Sint hic illum quaerat officiis eaque. Tempore odio excepturi quam quo vero. Eos alias aut numquam explicabo illum laudantium sed. Consectetur ea eos repellendus rem commodi eos et ab.','1984-12-08 14:23:05'),(26,26,26,'Quae optio tempore accusamus eos accusantium voluptas. Veniam pariatur animi nulla rerum fugit optio. Illum aspernatur est corporis repudiandae qui consectetur.','2015-12-21 22:22:14'),(27,27,27,'Id autem rerum enim et voluptatem excepturi ut. Dolor eveniet maxime impedit voluptas placeat ex. Eaque sed sunt molestiae officiis voluptatem neque autem. Sunt velit rem voluptas aut.','1988-06-01 17:36:22'),(28,28,28,'Quibusdam reprehenderit nemo est illum. Nihil dolores consequatur nemo qui itaque. Perferendis exercitationem dicta ut eveniet consequuntur. Beatae recusandae et molestiae suscipit nemo omnis veritatis rerum. Iure consequatur voluptate et aspernatur explicabo.','2017-11-25 14:23:37'),(29,29,29,'Nihil voluptatem aut quia quia libero deleniti et. Facilis quas dignissimos voluptatum a quasi eos quas. A soluta voluptatum omnis et rem omnis.','2007-12-26 10:17:04'),(30,30,30,'Sed aperiam aut voluptatem aut voluptas nostrum voluptas quo. Mollitia id velit sapiente aut id quia pariatur. Vitae iusto autem voluptatem voluptas recusandae dolor est. Sequi optio at nesciunt.','2019-07-08 09:40:53'),(31,31,31,'Dignissimos ut repellendus sed voluptatem qui vel accusantium. Sint atque facilis qui sequi voluptate et officia. Nulla nihil quisquam dolores dolor dolore voluptatum. Corrupti ut est voluptatem qui.','1988-09-04 22:08:20'),(32,32,32,'Velit libero ab ut. Exercitationem et quae error perferendis illum et. Eum quaerat voluptas autem quasi nulla dolorem.','2013-05-14 23:13:44'),(33,33,33,'Architecto consectetur officia omnis consequuntur explicabo temporibus optio. Expedita et magni dolores ea est est placeat. Ut et et itaque quidem et illo eos. Quis est nobis nobis excepturi.','1991-05-12 14:28:40'),(34,34,34,'Tenetur voluptatibus qui eos officia est. Consequatur ut excepturi vel possimus excepturi fugit. Aperiam nulla voluptate culpa hic ut.','2016-10-20 12:47:26'),(35,35,35,'Cum ut at similique. Qui repellendus nihil dolore aut reiciendis id maxime qui. Modi ratione laboriosam distinctio.','1974-01-21 07:01:52'),(36,36,36,'Sequi vel minima unde dolorem. Sapiente dolorem molestias magnam ullam inventore.','2006-03-12 05:17:38'),(37,37,37,'Tempore enim vitae eius veritatis explicabo aperiam. Dolorem qui et voluptates vel corrupti eum porro. Aut laborum rem id veritatis et.','2007-06-12 02:23:44'),(38,38,38,'Quaerat dolores illo quis dolor. Reiciendis odit et vitae quia esse ratione. Libero accusamus quo mollitia et ipsum corrupti ullam.','1978-11-30 10:22:34'),(39,39,39,'Et esse quas nulla necessitatibus. Quod magni distinctio autem consequuntur quia reprehenderit dolor. Dolor dolor voluptates nihil et amet ut consequatur.','2020-12-05 02:36:32'),(40,40,40,'Ut numquam amet ex provident exercitationem architecto rerum. Distinctio minima officia fugiat officia aliquam ea. Nihil corrupti officiis nisi soluta nostrum deserunt. Est laudantium assumenda provident.','2002-07-14 04:09:03'),(41,41,41,'Qui aperiam aut in. Exercitationem accusamus et maiores voluptatum. Sunt deleniti beatae aspernatur qui vero. Aperiam debitis debitis voluptate quibusdam optio fugit recusandae.','2011-10-30 22:44:25'),(42,42,42,'Voluptatem animi rem voluptas et et. Eligendi qui unde quia omnis provident et eaque est. Sed eum consequatur repellat dolor hic cumque amet.','2006-05-17 16:25:58'),(43,43,43,'Repellendus sed pariatur at a quidem non dolore. Aut non soluta accusantium recusandae saepe. Qui et qui libero magni a voluptates. Rem ratione consequatur illum fugiat laborum ea libero asperiores. Deleniti reprehenderit est aliquid molestias magnam.','1982-09-06 06:11:16'),(44,44,44,'Qui corrupti quia vel reprehenderit veritatis ut pariatur. Vel eos culpa laboriosam qui est. Consequuntur sit temporibus cum iste.','2007-07-28 16:05:23'),(45,45,45,'Sint magni delectus et alias. Voluptas quaerat aliquam voluptatem corporis ut fugit laboriosam earum. Odio pariatur quos sit.','1999-12-13 11:05:22'),(46,46,46,'Adipisci nesciunt tempore sunt in veritatis vitae distinctio. Totam dolores velit ad culpa nobis unde unde laudantium.','1979-04-07 12:15:36'),(47,47,47,'Eaque sint veritatis voluptates tempore. Architecto quaerat molestiae unde nihil et. Ut enim quidem dicta qui consequatur exercitationem.','1972-05-14 05:04:50'),(48,48,48,'Sit rerum iusto ut odit. Aut consectetur labore ut voluptas possimus. Fugiat ab porro aspernatur officia est ea saepe.','2011-02-11 06:37:38'),(49,49,49,'Nisi itaque necessitatibus labore exercitationem fuga. Consequuntur voluptate autem dolorem non id consequuntur vitae accusantium. Excepturi ducimus in corporis maxime asperiores animi. Fugit debitis odit saepe modi.','1989-03-29 21:31:20'),(50,50,50,'Commodi in voluptatibus aspernatur et ex aut. Laudantium minima similique omnis quae beatae assumenda qui. Quaerat sit repellat iure quia et quis qui. Minus blanditiis ad nam at et et molestiae consequatur.','1973-11-09 12:20:38'),(51,51,51,'Enim blanditiis veniam quo repellendus ipsum. Rerum accusamus veritatis neque. Odit laboriosam omnis iusto cupiditate.','2019-01-31 10:09:30'),(52,52,52,'Libero est deleniti delectus perspiciatis atque et. Amet rem fugiat provident adipisci earum. Libero voluptas a vitae explicabo vero ullam. Rerum quia eius a nam.','2013-09-06 23:26:02'),(53,53,53,'Ipsam dolores labore id eos. Qui qui explicabo explicabo veritatis perspiciatis delectus. Laboriosam quis aut est qui.','1987-01-06 20:56:09'),(54,54,54,'Iusto ratione eveniet et in explicabo magni. Id molestiae enim sint aut. Adipisci voluptate occaecati quia suscipit. Recusandae et aliquam eveniet iste dolor.','1990-02-06 10:40:12'),(55,55,55,'Eum voluptatem placeat molestias ut enim. Id occaecati inventore et. Ex necessitatibus laudantium est voluptate et. Quisquam eligendi voluptatibus deserunt quas voluptas vitae quod.','2017-03-27 00:30:06'),(56,56,56,'Perspiciatis sunt aliquid laboriosam. Necessitatibus quo est voluptatibus in laudantium nihil aliquam. Omnis provident aut quia aspernatur sint.','1977-04-02 00:04:12'),(57,57,57,'Omnis autem ut laborum nostrum debitis eligendi. Veritatis consectetur adipisci aut cumque dolorum accusamus. Aut accusantium perferendis ut consequatur nihil facere et. Fuga error assumenda ipsum enim qui.','1994-06-23 04:07:56'),(58,58,58,'Nobis magnam non voluptas. Deleniti atque est quod temporibus molestiae. Sed iste quos quia magnam delectus maxime. Quam quod officiis deleniti nisi saepe.','1973-11-21 17:20:37'),(59,59,59,'Atque aspernatur autem tempora beatae laborum. Sed numquam atque sit blanditiis ut. Sed incidunt at mollitia fuga voluptates est.','1976-06-04 22:39:34'),(60,60,60,'Sit similique aspernatur officia nobis ipsa voluptas distinctio. Repellendus dolor et reiciendis et id non maxime.','1985-07-24 18:12:28'),(61,61,61,'Quis autem ut autem ipsam vel voluptas rerum. Aut totam nihil cupiditate itaque esse quisquam. Velit qui aut sit sunt officia.','1998-08-12 13:23:58'),(62,62,62,'Animi aut sit et inventore expedita facere. Autem incidunt laboriosam fugiat corporis voluptas vitae magnam in. Quod eos a deleniti maxime nemo quasi.','2014-05-17 00:19:18'),(63,63,63,'Provident dolor qui sequi dignissimos. Atque nihil sit exercitationem blanditiis. Consequuntur adipisci a similique explicabo adipisci provident illo. Sapiente beatae molestias quod rerum sit possimus cumque numquam.','2021-07-30 12:37:08'),(64,64,64,'Labore nihil eum quasi autem. Aut voluptas voluptatem at aut. Autem voluptatem velit omnis odio et occaecati veritatis.','2013-03-29 19:32:12'),(65,65,65,'Enim pariatur reprehenderit et optio amet magni dolorem minima. Sed quas perferendis vitae ipsa ut.','1999-02-05 10:19:14'),(66,66,66,'Ea perferendis quia saepe. Voluptas qui nihil non dolores culpa at. Inventore dolor sunt fugiat nisi tempora veritatis. Molestiae et aliquid vel harum.','2002-09-28 04:13:33'),(67,67,67,'Aut voluptas rerum voluptate et. Earum perspiciatis quae est aliquid ut veniam hic reprehenderit. Praesentium sit quia sint in et veniam hic.','2011-08-17 02:24:14'),(68,68,68,'Provident eius saepe dolor similique amet dolores. Rerum voluptatem fugit recusandae voluptatum eum voluptatibus. Officia itaque modi saepe distinctio qui.','2001-01-07 21:21:12'),(69,69,69,'Aspernatur incidunt cupiditate dolores asperiores sed. Beatae provident quia alias. Corporis sit quia autem.','1981-01-28 05:01:13'),(70,70,70,'Omnis at ut recusandae. Tempora in aperiam ut qui voluptatem doloremque. Ducimus quos omnis quod nisi dolores tenetur.','2006-07-03 12:30:24'),(71,71,71,'Aspernatur eligendi voluptas dolore architecto unde aperiam dolor. Consequatur quas voluptatem id exercitationem enim voluptate. Aut aut et saepe minima delectus et laboriosam voluptate.','1994-04-13 18:24:26'),(72,72,72,'Et expedita ab velit alias optio. Et quibusdam nulla sunt dolores molestiae voluptas. Itaque veniam quidem quam illo. Exercitationem quaerat doloremque magni nostrum voluptatem eligendi veniam reprehenderit.','2012-07-08 01:42:31'),(73,73,73,'Ex sit consequatur maxime esse officia enim voluptatem. Et et omnis eum illum. Vitae reiciendis doloribus dicta consequatur nihil doloribus. Dolorum sapiente consequatur dolor esse.','1970-09-24 05:04:26'),(74,74,74,'Laboriosam sint fugiat est animi quia. Modi quod pariatur eligendi. Ipsum sit sed iusto ipsa temporibus ex. Vero omnis ut dignissimos aut alias qui.','1987-12-31 13:57:19'),(75,75,75,'Vitae vitae natus consequatur. Nesciunt libero nesciunt sunt voluptas sit odio. Consequatur et iusto nulla quibusdam. Quo dolores aut quis repellendus error tempore et.','1996-06-10 13:16:45'),(76,76,76,'Dolor nobis tenetur eos aut debitis voluptas deleniti. Optio qui dolores inventore et. Quaerat quas fugiat ex fuga quos. Enim incidunt repellat voluptatem est maiores. Enim cumque et maxime sequi.','2006-01-04 04:55:48'),(77,77,77,'Praesentium minus dicta est odio pariatur quia in aperiam. Animi ut similique dignissimos ab. Consequuntur dolor tenetur sit. Reprehenderit officia consequatur blanditiis laboriosam unde qui.','2020-06-25 13:32:31'),(78,78,78,'Officiis velit exercitationem eveniet error aut ipsum. Ab placeat sunt porro impedit.','1974-07-02 13:41:46'),(79,79,79,'Hic consequatur dicta nostrum accusantium soluta voluptas temporibus. Error neque sed quis facilis ipsum mollitia doloribus. Vero totam consequatur porro et et ut fugiat. Omnis labore quasi ratione non eos quibusdam incidunt amet.','1992-01-06 19:18:04'),(80,80,80,'Enim quia omnis dolorem. Dolorum est iste repellat omnis est vitae consectetur. Harum sequi et aliquid quas placeat deleniti necessitatibus odit.','1995-03-31 10:18:41'),(81,81,81,'Dolores est laudantium quos illum omnis. Eos et quasi aut rerum. Eaque fugit culpa ut doloremque recusandae.','2019-03-13 09:48:37'),(82,82,82,'Omnis aut cumque qui illum. Odio non nihil repellat consectetur quo. Laborum ipsum nulla dolorum. Temporibus rem numquam laboriosam facilis.','1992-09-22 16:38:04'),(83,83,83,'Temporibus ducimus inventore tenetur sed velit placeat. Porro tempora debitis non occaecati. Consequuntur rerum sit eligendi aut quasi tempore sunt.','2019-12-16 09:19:41'),(84,84,84,'Voluptate at soluta quo corrupti quia. Voluptatem ut atque quia minus officiis. Doloribus porro consequatur dignissimos molestiae.','2010-07-23 23:53:45'),(85,85,85,'Sed distinctio officia aut fuga minus. Adipisci eveniet eum voluptatem totam. Ad sit qui architecto rem dignissimos.','1996-07-20 22:01:03'),(86,86,86,'Error ipsam beatae error eum. Harum officia ut et aut aut sint explicabo doloribus. Enim ut consequatur in in tempora in illo nihil.','1979-08-29 00:10:08'),(87,87,87,'Consequatur rerum doloremque eum amet earum ducimus. Occaecati suscipit doloremque molestiae quas et rerum sit corrupti. Repellat quia sunt quis vitae consequatur porro quaerat.','1998-08-09 09:24:47'),(88,88,88,'Esse sint sunt earum dicta rerum inventore. Et incidunt cupiditate quasi. Molestiae possimus sunt commodi suscipit. In aut repellat blanditiis accusamus architecto occaecati repellendus temporibus.','1983-09-30 14:01:26'),(89,89,89,'Tenetur enim molestias recusandae ea cum. Ut excepturi voluptas enim ex molestiae a dolorem. Omnis ad at vel ut placeat laudantium tempora. Ut et magnam iste velit veniam sint maiores.','1994-12-23 15:25:17'),(90,90,90,'Soluta aliquid neque dolor officia. Maiores necessitatibus nihil optio qui ducimus necessitatibus qui. Rerum sapiente qui occaecati recusandae voluptatibus aperiam.','1998-05-31 10:01:39'),(91,91,91,'Suscipit blanditiis et eum mollitia. Iste sit quibusdam repellat saepe. Mollitia distinctio quas nihil nemo corporis voluptas.','2000-12-21 04:29:22'),(92,92,92,'Porro error non odit ullam laboriosam quod vel. Voluptas voluptas architecto aut voluptatem enim aut optio. Assumenda nesciunt eos sunt tempore. Itaque aliquam autem nobis et eos eligendi.','2001-07-27 01:48:51'),(93,93,93,'Voluptatem quos maiores vero. Ea consequatur id iusto autem non omnis quos. Rerum laudantium in est.','2010-08-30 21:39:11'),(94,94,94,'Illum exercitationem inventore quia necessitatibus alias dolorem est. Consequatur id error ea vitae minima ducimus eos. Et expedita beatae excepturi. Aperiam sunt quasi ratione ut. Quidem ad et et placeat impedit eum.','1971-06-12 08:25:53'),(95,95,95,'Inventore non culpa maiores inventore ea eos. Saepe maiores molestias in ut molestiae dolores quae. Et est nihil eius odio quasi. Ipsa vel aspernatur sit optio facere.','2013-12-26 13:55:45'),(96,96,96,'Sequi laboriosam eos officia ipsam quis ratione ducimus provident. Dignissimos provident dicta enim aliquid quibusdam. Iste officiis consectetur consequatur optio nulla sapiente debitis. Laudantium blanditiis sint eos quis. Fugit voluptatibus quia ratione voluptatibus voluptas unde.','2020-03-16 16:46:07'),(97,97,97,'Modi aut ut odio ut. Ullam animi repellat repellendus assumenda.','1978-11-13 01:49:20'),(98,98,98,'Veritatis id velit nostrum sint consequatur explicabo. Perferendis illum voluptatem et est labore reprehenderit saepe. Accusantium quibusdam dolores enim sunt itaque vel.','1982-07-15 11:23:04'),(99,99,99,'Non excepturi unde minima perspiciatis. Natus quam facere vel sunt quia et tempore. Aspernatur enim alias omnis placeat doloribus. Consequatur autem minima itaque et id officia.','1999-10-15 15:58:28'),(100,100,100,'Porro qui officiis corporis nulla natus. Consequatur dolore impedit eos placeat. Repudiandae voluptatibus nobis consequuntur minus fuga odit unde. Pariatur et perspiciatis voluptas veritatis aliquid deleniti.','1999-11-10 03:58:16');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'qui',1),(2,'velit',2),(3,'quasi',3),(4,'repellat',4),(5,'a',5),(6,'vel',6),(7,'nulla',7),(8,'dolores',8),(9,'numquam',9),(10,'eos',10),(11,'similique',11),(12,'dolorem',12),(13,'nesciunt',13),(14,'ducimus',14),(15,'laudantium',15),(16,'voluptas',16),(17,'maiores',17),(18,'voluptatem',18),(19,'ut',19),(20,'et',20),(21,'magnam',21),(22,'qui',22),(23,'voluptatem',23),(24,'consequatur',24),(25,'est',25),(26,'quaerat',26),(27,'sed',27),(28,'qui',28),(29,'facere',29),(30,'dolorem',30),(31,'repudiandae',31),(32,'nulla',32),(33,'a',33),(34,'distinctio',34),(35,'ea',35),(36,'omnis',36),(37,'et',37),(38,'laborum',38),(39,'sunt',39),(40,'perferendis',40),(41,'odit',41),(42,'autem',42),(43,'est',43),(44,'molestias',44),(45,'quam',45),(46,'qui',46),(47,'sunt',47),(48,'et',48),(49,'mollitia',49),(50,'quod',50),(51,'harum',51),(52,'repellendus',52),(53,'quidem',53),(54,'est',54),(55,'dolore',55),(56,'id',56),(57,'tempore',57),(58,'laboriosam',58),(59,'delectus',59),(60,'debitis',60),(61,'velit',61),(62,'excepturi',62),(63,'labore',63),(64,'quia',64),(65,'dolore',65),(66,'a',66),(67,'totam',67),(68,'sed',68),(69,'nam',69),(70,'deserunt',70),(71,'id',71),(72,'ducimus',72),(73,'qui',73),(74,'est',74),(75,'nam',75),(76,'optio',76),(77,'neque',77),(78,'repellendus',78),(79,'vitae',79),(80,'quis',80),(81,'dolore',81),(82,'dignissimos',82),(83,'harum',83),(84,'ut',84),(85,'dolores',85),(86,'inventore',86),(87,'ipsum',87),(88,'optio',88),(89,'reprehenderit',89),(90,'ad',90),(91,'officiis',91),(92,'beatae',92),(93,'sapiente',93),(94,'voluptatibus',94),(95,'minus',95),(96,'voluptatem',96),(97,'et',97),(98,'voluptas',98),(99,'et',99),(100,'odio',100);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,74,1),(2,66,2),(3,34,3),(4,99,4),(5,29,5),(6,44,6),(7,92,7),(8,77,8),(9,64,9),(10,59,10),(11,18,11),(12,58,12),(13,92,13),(14,85,14),(15,23,15),(16,62,16),(17,23,17),(18,30,18),(19,18,19),(20,57,20),(21,19,21),(22,66,22),(23,73,23),(24,62,24),(25,62,25),(26,34,26),(27,24,27),(28,45,28),(29,7,29),(30,55,30),(31,52,31),(32,81,32),(33,21,33),(34,85,34),(35,80,35),(36,49,36),(37,29,37),(38,71,38),(39,25,39),(40,93,40),(41,29,41),(42,43,42),(43,50,43),(44,21,44),(45,27,45),(46,73,46),(47,82,47),(48,50,48),(49,3,49),(50,99,50),(51,6,51),(52,21,52),(53,65,53),(54,79,54),(55,83,55),(56,26,56),(57,12,57),(58,6,58),(59,70,59),(60,19,60),(61,61,61),(62,22,62),(63,100,63),(64,81,64),(65,7,65),(66,79,66),(67,30,67),(68,35,68),(69,49,69),(70,54,70),(71,28,71),(72,78,72),(73,97,73),(74,77,74),(75,98,75),(76,24,76),(77,49,77),(78,79,78),(79,73,79),(80,52,80),(81,77,81),(82,79,82),(83,73,83),(84,42,84),(85,57,85),(86,55,86),(87,67,87),(88,69,88),(89,61,89),(90,37,90),(91,88,91),(92,21,92),(93,59,93),(94,87,94),(95,2,95),(96,65,96),(97,65,97),(98,31,98),(99,100,99),(100,13,100);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_photo_id` (`photo_id`),
  CONSTRAINT `fk_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','1970-01-23',1,'1974-10-13 10:56:57','f'),(2,'f','2012-12-30',2,'2000-07-25 21:19:58','d'),(3,'f','1979-08-28',3,'2020-08-10 20:48:31','t'),(4,'m','1976-05-02',4,'2021-05-15 03:18:44','i'),(5,'f','1998-07-21',5,'1989-05-01 06:28:25','l'),(6,'f','1983-04-14',6,'1977-11-18 21:01:55','i'),(7,'m','1988-03-08',7,'1978-12-12 14:20:14','p'),(8,'f','1995-09-21',8,'1998-05-02 03:30:09','f'),(9,'m','1998-11-14',9,'1994-08-21 18:25:28','m'),(10,'m','1985-03-26',10,'1992-12-25 23:41:23','z'),(11,'m','1979-09-10',11,'2007-06-17 17:24:28','h'),(12,'m','1983-03-19',12,'2010-08-30 01:22:33','z'),(13,'m','2010-03-28',13,'2014-03-31 20:03:24','w'),(14,'f','1995-11-09',14,'1980-02-26 22:28:21','o'),(15,'f','1973-04-30',15,'2000-05-01 07:41:31','m'),(16,'m','2013-08-01',16,'2021-07-03 02:30:25','b'),(17,'m','1980-08-12',17,'1978-03-23 16:09:38','a'),(18,'f','2021-11-24',18,'1990-07-11 18:46:15','a'),(19,'f','2011-11-05',19,'2019-12-03 21:09:59','x'),(20,'m','2018-05-10',20,'2018-12-14 00:42:42','e'),(21,'f','1986-12-06',21,'2021-11-20 04:32:46','x'),(22,'f','2001-11-29',22,'1994-05-05 06:12:01','n'),(23,'m','2008-06-12',23,'2001-10-23 00:28:52','q'),(24,'f','2012-03-05',24,'2004-09-20 23:22:56','d'),(25,'m','2002-11-01',25,'2009-02-23 21:05:55','p'),(26,'f','1987-01-14',26,'1994-02-23 15:36:50','g'),(27,'f','1987-03-12',27,'2016-05-08 13:03:18','t'),(28,'m','1974-05-12',28,'1988-08-07 04:17:32','x'),(29,'m','1999-03-19',29,'1985-10-26 09:23:57','k'),(30,'m','2000-10-02',30,'1995-05-06 08:32:04','n'),(31,'m','1980-08-16',31,'2010-12-21 09:33:11','c'),(32,'f','2015-01-17',32,'2010-03-30 23:30:34','v'),(33,'m','1977-10-28',33,'1999-02-10 20:32:11','g'),(34,'f','2019-06-28',34,'2020-03-05 07:14:27','a'),(35,'m','1993-10-16',35,'2007-04-11 02:43:14','l'),(36,'m','2018-10-07',36,'1979-04-19 01:06:31','t'),(37,'f','1997-12-24',37,'1992-09-14 23:19:23','v'),(38,'m','1988-06-27',38,'2020-06-10 17:11:27','g'),(39,'m','2013-05-08',39,'1979-09-10 07:50:38','c'),(40,'f','2012-07-12',40,'1998-08-18 09:58:23','h'),(41,'f','2014-03-20',41,'1989-03-13 04:51:49','i'),(42,'m','2006-03-28',42,'2012-11-28 18:33:01','k'),(43,'f','2020-10-02',43,'1990-05-13 00:47:03','d'),(44,'f','2019-12-25',44,'1971-08-31 03:59:52','r'),(45,'m','1987-10-09',45,'1979-04-08 10:42:32','m'),(46,'m','1983-12-12',46,'1995-04-01 20:20:59','o'),(47,'m','1971-07-31',47,'1980-07-22 22:07:53','a'),(48,'m','2007-02-11',48,'1975-01-31 18:11:00','p'),(49,'m','1970-11-19',49,'2001-01-22 19:16:22','l'),(50,'m','2008-05-06',50,'1979-04-01 18:44:32','j'),(51,'m','2021-12-25',51,'1987-02-14 09:09:49','n'),(52,'f','1984-06-28',52,'1982-07-02 14:39:27','e'),(53,'m','1974-02-13',53,'2010-08-17 03:36:57','q'),(54,'f','2012-08-23',54,'1977-07-28 03:25:57','c'),(55,'m','1978-03-03',55,'2014-12-15 17:38:52','y'),(56,'f','2019-08-25',56,'1973-01-18 02:17:29','n'),(57,'m','1970-06-20',57,'2002-03-07 00:36:53','b'),(58,'f','2001-06-20',58,'2010-10-10 22:21:12','z'),(59,'m','1977-02-14',59,'1973-07-27 13:06:37','p'),(60,'m','2006-03-02',60,'1973-01-14 06:42:47','t'),(61,'m','2005-06-30',61,'1976-12-26 04:59:05','o'),(62,'m','2003-02-17',62,'2021-01-09 04:46:21','n'),(63,'m','1974-02-07',63,'1983-07-25 19:13:49','q'),(64,'f','1990-12-27',64,'1974-09-12 16:55:52','c'),(65,'m','1994-03-26',65,'1986-06-12 21:01:11','x'),(66,'f','2019-08-04',66,'1993-06-29 23:14:26','l'),(67,'m','2021-04-08',67,'1972-03-01 02:25:08','i'),(68,'m','1997-02-03',68,'1988-12-05 06:23:40','v'),(69,'m','1996-12-13',69,'1972-12-15 14:25:11','i'),(70,'m','2000-06-29',70,'1990-09-13 07:40:09','d'),(71,'f','2016-06-02',71,'1984-09-12 23:49:00','j'),(72,'m','2004-02-11',72,'2000-09-25 04:45:03','b'),(73,'m','2003-05-21',73,'1985-04-30 10:36:00','z'),(74,'f','1988-03-31',74,'2002-12-23 02:38:48','s'),(75,'f','2010-08-18',75,'1990-03-31 08:39:37','n'),(76,'f','2017-05-13',76,'2015-04-24 12:33:00','m'),(77,'m','1980-06-24',77,'1981-08-07 03:07:29','a'),(78,'m','2014-03-17',78,'2002-08-22 09:02:06','m'),(79,'m','1973-02-12',79,'2020-03-01 21:51:32','u'),(80,'m','1972-11-10',80,'2021-03-02 09:18:05','x'),(81,'f','1982-05-02',81,'2013-08-16 04:10:05','v'),(82,'m','1995-07-02',82,'1983-04-10 05:34:59','i'),(83,'m','1995-05-24',83,'2011-04-06 15:40:08','a'),(84,'m','2009-10-20',84,'1981-04-18 14:39:09','w'),(85,'f','1981-12-01',85,'1988-07-18 12:12:57','e'),(86,'m','2008-07-04',86,'1999-11-12 03:15:37','i'),(87,'m','1998-10-12',87,'1981-08-13 19:04:26','m'),(88,'f','2019-01-06',88,'2021-08-17 11:55:41','x'),(89,'m','2012-08-30',89,'2003-06-04 17:06:17','s'),(90,'f','1987-09-05',90,'2016-03-13 17:45:20','i'),(91,'f','1979-05-06',91,'1995-01-14 12:10:11','z'),(92,'f','1993-12-01',92,'1994-12-11 11:37:21','n'),(93,'m','2020-04-20',93,'1991-07-04 20:59:30','v'),(94,'m','1974-07-02',94,'2001-10-29 02:24:25','j'),(95,'m','2016-02-16',95,'1977-05-07 08:08:04','d'),(96,'f','2016-11-14',96,'1981-10-29 13:07:56','n'),(97,'f','2002-12-13',97,'1970-04-09 02:32:31','r'),(98,'m','1994-02-06',98,'1988-05-06 14:36:56','l'),(99,'m','1978-03-25',99,'2006-04-20 01:24:23','a'),(100,'m','1970-07-31',100,'1986-01-28 06:51:00','x');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Elyssa','Steuber','sawayn.lilla@example.org','b09eaf58d81a63a87fb9d330d04defd4e3a0cee1',0,''),(2,'Theodora','Kling','cole.darron@example.com','f7ccb9e4e59374669e63475417c29d018b649221',1006944,''),(3,'Gage','Bruen','desmond84@example.com','ac1d8ca1d2b13a8360dda1bdd4df4f79dd0534aa',82581519,''),(4,'Melyna','Stoltenberg','lou.morissette@example.net','c288ec9fec4961191b9f30c6cc582cb94b5a0420',79850588,''),(5,'Breanna','Beatty','daron.predovic@example.net','636c2cefea7bd4f7732db0b428c1f85808084070',20321,'\0'),(6,'Cicero','Bogan','sgleichner@example.com','87230ee848ec6aa4ea8b18bb5831445a05e4ec82',0,''),(7,'Coty','Mraz','braxton85@example.org','4a87f297b56a8e624d40d82ef8be9769e3d0ce0e',887,''),(8,'Marcellus','Thompson','jerod61@example.net','5376c8ebff8f9844896e2c75999da1a59ce479a1',666328,''),(9,'Stefanie','Bins','samara03@example.com','ebeb10ade54ec58d4cd60e03e37e11f60836a027',0,'\0'),(10,'Kailyn','Lehner','macy.turcotte@example.com','de3a1778e923143698b653d0fa338c0762766296',7,''),(11,'Dorothea','Langworth','joelle.hoeger@example.org','c256ad9a166c00416ad01967213d9d5b88f9d9d1',365,'\0'),(12,'Alan','Lemke','dakota49@example.com','9b312945448de7022000ab6db23fb9889a48da62',0,'\0'),(13,'Paula','Robel','nina.waelchi@example.org','2d30915bd8e58cb0bd55ddce499eba6b13aed8ab',1115651,''),(14,'Destany','Balistreri','alexandrine.cormier@example.net','7b7545b2a6a02ecfa358941ce0b2d95c768c2661',1722414,'\0'),(15,'Wiley','Carroll','tmorar@example.net','79d4a3bfb94c14f2ffa5058f99f008b9a708031a',2780,'\0'),(16,'Maximo','Legros','dgreen@example.net','ef667af3b14e2d3cd0e7d76c0a0648fac8669cd0',5492483,''),(17,'Nestor','Hauck','ygrant@example.com','e860130205d352839345397afb1fcf332b40c85b',6,''),(18,'Heloise','Adams','kris.raymond@example.com','59ef0e425c58ffcf1ed371152907f568bec5db19',792159,'\0'),(19,'Connor','Paucek','francis.monahan@example.net','877553b1946623e41fa17074c67b4fd96869d522',0,''),(20,'Eliane','Tremblay','toy.unique@example.org','96bfedbe9da1da077dd5b3616e4aef7841441b01',3372159,'\0'),(21,'Favian','Littel','thompson.gage@example.org','4d4ee04f8e4162a6d1013b369cdf4c78dbe5bf5b',679024,''),(22,'Giovanny','Gutkowski','hudson.o\'connell@example.org','2ea29cb9ae78ab55d3c8d0bee3f87a23d8b2b3f8',820,'\0'),(23,'Cecilia','Mohr','mertie80@example.com','eb4185814cbe49a881d8508222b6f24d9b795c19',28,''),(24,'Helen','Denesik','donnelly.graciela@example.org','cb47e5b5cf37d6b2d2ac23b2aba911de0ecdf69d',482740,''),(25,'Giuseppe','Davis','hazle36@example.com','4d92dbd818dd47adaa02efb703b20db24f7c0384',30972,'\0'),(26,'Kenyatta','Pagac','aniya26@example.com','c9062694a8133a3b770f996539173541aa2ce5bd',4,'\0'),(27,'Angelo','Murazik','zlittel@example.com','b46919659bd2755c8bc2b91e513bb07770cc9ddf',0,'\0'),(28,'Connie','Greenholt','alana.ratke@example.com','d7761d9418ba4575db8e2034de6339c4b3d21ffa',173058969,'\0'),(29,'Hilbert','Bradtke','nicolas.lambert@example.net','3966ed0fe0d3f324a4f6aede669a99dbe72829c4',189,''),(30,'Jacinthe','Bradtke','santa11@example.net','b3450d1495c4b3f561cec75bd67cd9ea645cbc5a',233270731,''),(31,'Merl','Abbott','dora87@example.com','ed71d992e2d5b5ad934bbd4451106b6d7cc33d36',7820,''),(32,'Corrine','O\'Keefe','rhickle@example.net','011af194970e2661fb856f99c51cf904193e741b',22306232,'\0'),(33,'Lafayette','Langworth','leon57@example.net','7dfea5c37bc73c9ab0edb091e3005902d12883b1',0,'\0'),(34,'Florida','Brekke','lebsack.krystel@example.net','4b5f7a3a13d2e7dd89ed0b53878c6815026d729d',0,'\0'),(35,'Joyce','Cartwright','tromp.quinton@example.com','82de12bd9f2dc44be59848b50c34f9dbabd0a498',2161214,''),(36,'Malika','Pfeffer','torphy.juana@example.com','50b388594a070ef09c21e7ed09629065c21bcf9d',3323702,'\0'),(37,'Nettie','Sporer','leuschke.darby@example.com','45126ef740a865d11b5295fcd9e2b0177f63d4fe',181590,'\0'),(38,'Jevon','O\'Reilly','gerry.west@example.org','a4dde5fb9a40f15fcf87ad1e2d6261161eb3b49e',33924189,''),(39,'Ari','Von','abelardo.gerlach@example.net','ea2f0e6f62ba767dabf89609d017cb212b360fe0',5,'\0'),(40,'Erica','Conn','darion.ward@example.com','72af4b6cfa450110a76491e372c112702abdf6f6',10065453,''),(41,'Adrian','Ferry','jbernhard@example.org','2947314f9b7f621bef0b51d18a2f93174870ffef',0,''),(42,'Bailey','Gerlach','wiza.ettie@example.com','e73de766c447ae77865ef29b6faa2e520a5f4fd9',0,'\0'),(43,'Clemens','Macejkovic','nolan.pauline@example.org','3bbd251c16548dafea8687ae8f67cace15dc19b4',1113027,'\0'),(44,'Elton','West','hoppe.nichole@example.net','588bff24aadb81faa851510c28e14ce11706a643',2947304,'\0'),(45,'Nelda','Blick','eo\'connell@example.com','ee6e2253b4739b3454a71ae4c303b470c7a5bc16',2839812,''),(46,'Ronny','Osinski','purdy.tom@example.net','37a9efecd7cc37faeb16adc88dc787668982d485',377092757,''),(47,'Caden','Bode','miller.marvin@example.com','88b2c2538ca25db451a923857f4e23fdf2ed053d',660488,''),(48,'Nathanial','Block','kemmer.dereck@example.com','fe502cfe1df92f4b7d72bbea34256d813a7f1f89',21105,''),(49,'Otha','Okuneva','israel88@example.org','ffa4b2621801105afac35ec08f5ffc88ce18641a',8701,''),(50,'Ezequiel','Tremblay','hfisher@example.com','61c0db60a79f273d230661e7183d5de20499ea84',56,''),(51,'Rudy','Streich','sharris@example.com','8a251a3d0b2940d739422981689097c2fee8dbdc',6108082,''),(52,'Conner','Block','xmonahan@example.org','99d536059dc59a932c5a94f696a689c75ffe4255',1105087,'\0'),(53,'Jerrod','Price','bfadel@example.org','f1039b010f8a3d459810fd442e28ad1612d511e5',39815,'\0'),(54,'Chaya','Herman','megane13@example.org','3ef17bb0a26b61d05905a3e963a97822ebd6f58d',1745,''),(55,'Octavia','Pouros','evie50@example.org','80e27988752ddc5538c980a2320c5ea985980f74',47782,'\0'),(56,'Eldred','Stamm','gschoen@example.org','655c634c8db800551dd86d957a97ffbba2f4c97c',5038316,''),(57,'Fleta','Stoltenberg','marjorie43@example.net','4fb3cf52d91c9bd47633eb876b76e3988ce8aef8',473,'\0'),(58,'Jesse','Predovic','lueilwitz.alf@example.com','63fb3e25d28fd30c36b3acee0d5102a153a17915',1034828,''),(59,'Minerva','Hoppe','benny39@example.org','5d0badefacc12fdfe2c8fb4802b4a9a8453c1c25',108,'\0'),(60,'Coleman','O\'Hara','david.kuhic@example.net','3d6265f901962244c48da0d9a92265c1e5915a42',24,'\0'),(61,'Amos','Green','damon21@example.org','b5990ef3614c05f1f4e8997ce57190fb02c45bcf',8180641,'\0'),(62,'Craig','Wiza','estracke@example.com','029ecd8332c7c03b7b6ef0123293c4a956386208',58,''),(63,'Laron','Balistreri','bins.holden@example.com','4164303fbaafb9816b08c383a7712199cbbb8464',116208252,'\0'),(64,'River','White','gkling@example.com','5e0e736af607d14282b2b44a0ab107489fdc0721',79015457,'\0'),(65,'Dimitri','Wisozk','skunde@example.net','102449a62bc21834e3dff8315c69142579e58168',399368337,'\0'),(66,'Vada','Block','haag.magdalen@example.org','b9b41cae03fbf3d78fdde165e2d093955be34317',14097,'\0'),(67,'Coy','Volkman','kbruen@example.org','94491ea62871d913264979defc33842cec8549cb',133653892,'\0'),(68,'Marcelino','Jerde','conn.dallas@example.org','42587bdac384374b9f00cda0bf64f77a425241c1',39286986,'\0'),(69,'Clifford','Konopelski','kassulke.michael@example.net','7309fbdecc766379f56ab8335b73cddcba11ae0a',822606,''),(70,'Lelia','Macejkovic','casimir63@example.net','75ca5b6db1f8456140a1d56df525b3809d4455e2',4,''),(71,'Wanda','Kunde','dolly63@example.net','926de855c52fc71e89cf417b9d6a34f90fb78a67',364,'\0'),(72,'Vernice','Kuhn','roberts.levi@example.net','0a75f5599151a7618f413a37b72c092bef8e2a9d',298,''),(73,'Alfredo','Langworth','xsawayn@example.org','2add9c9567c587f4fcf3e129bc209d302cc15fae',5572,''),(74,'Myah','Sporer','qosinski@example.net','496b9503d91608f1a68cd05f8284dafe1497a735',412847,''),(75,'Maxie','Williamson','zachery.bruen@example.com','e86ccc40678c90b2f12f02f1cff90c7ab7296deb',55017,''),(76,'Loma','Jacobson','skiles.moises@example.com','b443477ee04f0775e7076fadcd2440a87fc9e91d',0,'\0'),(77,'Kane','Vandervort','lflatley@example.org','bab4954a5ba8187efbee5d5748ec4544a77888f0',9,''),(78,'Charlene','Hackett','zkrajcik@example.com','da0cbf72e43fb949944ac097539d468dfb1c4373',214460306,'\0'),(79,'Minerva','Beer','mafalda33@example.net','248ef20a9d47fa923a85e61000f70f91ab505dd8',4397554,'\0'),(80,'Rollin','DuBuque','imelda97@example.com','e27e6fd109bb0d705b26d3dfb68e37a4a900d983',14,''),(81,'Roy','Larkin','jacky.boyer@example.org','fcf2c3d3a8e9caa64f2954c4d38f65db821312ab',21113,'\0'),(82,'Darion','Goldner','mitchell.jany@example.org','78ba333409df6b3f5f93c9d1115331da3268f109',1,'\0'),(83,'Antonio','Ziemann','idella.beahan@example.com','471e0de767eb54445b388c6a29130b30e0f1248d',55,''),(84,'Desiree','Boyer','feest.jarvis@example.com','e4b2bd3ab327e8596973962bd50e7dbc079e160c',0,''),(85,'Mona','Hudson','winnifred.buckridge@example.net','2876044e6528cb62819d21a99233fb39527abd93',76,''),(86,'Jules','Bernhard','satterfield.ezra@example.com','ff766af98f5182efdd382b0aa6e02630a2aa81ca',69782019,''),(87,'Odell','Bogisich','aron25@example.org','08a88f01865d1cf10b197b0f21f76cb708de1231',63,'\0'),(88,'Braulio','Murazik','glen.mueller@example.com','3aa2068cb789800b1b5f0a3cdec6cfc4a0e84c5c',3161,'\0'),(89,'Kevin','Reichel','ischuppe@example.com','23ad0642ba32edbcc8b5a4f1c563c5f1a6e07101',23,''),(90,'Donavon','Kub','marcelino.mraz@example.com','e2dc65ea3a3c02a4d0886f240cbe71f88f8ff6aa',5,'\0'),(91,'Verdie','Moen','rwintheiser@example.net','d6cd259e13b5de4652ec49d82c70a3db3713336b',0,''),(92,'Katelyn','Torp','gislason.scotty@example.net','df3d845127a2aa8d61a3f33a9a00384452383223',32,''),(93,'Jean','Cartwright','alysson72@example.net','f234875ce7304e065411b56102bbca5cc7947911',41979,''),(94,'Jaunita','Effertz','joan.hintz@example.net','4d43e6e479a10eaac127fdadf9eb4637b0611117',167163,'\0'),(95,'Chaim','Fahey','swift.ivah@example.com','0e1359311394cf850149c859bdc5bda8696f1a2b',1,''),(96,'Wilma','Luettgen','elza55@example.org','1f536704a749a1297156650e128e0b6a104c9183',87,'\0'),(97,'Afton','Willms','solon.herzog@example.org','2b35c3e99185f31500e025a69edb74940b47d2b1',324855,'\0'),(98,'Odell','Ziemann','cweimann@example.com','4df578bd5aea0bddd29fde5671e1bd9743e16fc6',5227316,'\0'),(99,'Catharine','Hettinger','yundt.lillian@example.org','4e6b5fda81d87d1392a7b39930795f4661c8a00e',202922,''),(100,'Joe','Farrell','elise.harris@example.org','8e2207cb18dcdb5abed1ba1c8ed62ed7a4a005b9',311,'\0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,3),(1,54),(1,64),(1,97),(2,99),(3,17),(4,100),(5,20),(5,62),(5,74),(6,86),(7,44),(9,7),(9,51),(9,71),(9,91),(10,46),(10,49),(12,18),(15,59),(16,58),(19,87),(21,60),(23,9),(23,51),(23,90),(24,39),(25,25),(28,29),(28,53),(30,29),(30,72),(32,86),(34,63),(35,32),(37,71),(39,86),(40,9),(40,18),(40,42),(41,13),(41,32),(41,33),(44,36),(45,30),(45,94),(46,55),(47,67),(48,22),(48,42),(48,71),(48,92),(49,100),(52,51),(53,35),(53,86),(54,72),(55,75),(55,95),(56,43),(59,2),(59,8),(59,86),(59,95),(62,26),(64,84),(64,86),(67,64),(68,27),(68,45),(70,87),(71,39),(72,67),(73,84),(74,22),(76,56),(78,13),(78,70),(79,53),(81,39),(81,57),(82,62),(83,51),(84,51),(85,3),(85,38),(86,42),(86,46),(87,26),(88,71),(88,94),(88,100),(91,36),(91,37),(92,7),(92,96),(95,83),(98,43),(98,90),(99,5);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_games`
--

DROP TABLE IF EXISTS `users_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_games` (
  `user_id` bigint(20) unsigned NOT NULL,
  `game_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`game_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `users_games_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_games_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_games`
--

LOCK TABLES `users_games` WRITE;
/*!40000 ALTER TABLE `users_games` DISABLE KEYS */;
INSERT INTO `users_games` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80),(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90),(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100);
/*!40000 ALTER TABLE `users_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_albums`
--

DROP TABLE IF EXISTS `video_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `video_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_albums`
--

LOCK TABLES `video_albums` WRITE;
/*!40000 ALTER TABLE `video_albums` DISABLE KEYS */;
INSERT INTO `video_albums` VALUES (1,'totam',66),(2,'optio',81),(3,'voluptatibus',8),(4,'quae',100),(5,'ut',12),(6,'adipisci',47),(7,'modi',33),(8,'ipsam',9),(9,'omnis',63),(10,'non',33),(11,'neque',15),(12,'sunt',51),(13,'eligendi',2),(14,'dolores',28),(15,'porro',28),(16,'vero',17),(17,'autem',75),(18,'qui',27),(19,'nihil',43),(20,'explicabo',9),(21,'quod',25),(22,'praesentium',79),(23,'illo',98),(24,'et',3),(25,'dolorem',72),(26,'fugit',71),(27,'neque',59),(28,'quam',61),(29,'impedit',8),(30,'quia',73),(31,'error',36),(32,'error',74),(33,'quia',53),(34,'deleniti',43),(35,'rerum',73),(36,'qui',65),(37,'molestiae',89),(38,'qui',6),(39,'ipsum',74),(40,'illo',52),(41,'aperiam',38),(42,'recusandae',88),(43,'veritatis',3),(44,'non',40),(45,'aut',16),(46,'sint',31),(47,'possimus',57),(48,'possimus',90),(49,'voluptatem',57),(50,'quo',99),(51,'quae',99),(52,'voluptatem',82),(53,'sunt',78),(54,'laudantium',96),(55,'eos',85),(56,'ullam',49),(57,'facere',67),(58,'et',43),(59,'quasi',10),(60,'non',75),(61,'et',16),(62,'nihil',45),(63,'dolores',48),(64,'ut',69),(65,'hic',88),(66,'iure',21),(67,'debitis',33),(68,'ab',77),(69,'quibusdam',26),(70,'animi',6),(71,'expedita',28),(72,'quaerat',64),(73,'corporis',94),(74,'et',31),(75,'velit',4),(76,'dignissimos',9),(77,'aut',61),(78,'minus',60),(79,'est',99),(80,'odit',18),(81,'quia',59),(82,'ut',97),(83,'dolore',99),(84,'nulla',36),(85,'dignissimos',92),(86,'dolores',83),(87,'eum',85),(88,'est',59),(89,'sequi',26),(90,'et',95),(91,'porro',33),(92,'id',42),(93,'aut',39),(94,'iusto',81),(95,'tenetur',10),(96,'non',26),(97,'aliquid',1),(98,'nihil',43),(99,'eius',2),(100,'laudantium',26);
/*!40000 ALTER TABLE `video_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `videos_name_idx` (`name`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `video_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,'cumque',9,1,'1971-09-26 04:35:26'),(2,'aut',29,2,'2020-01-31 22:01:29'),(3,'eum',7,3,'1996-03-21 15:37:19'),(4,'officia',19,4,'2019-11-21 23:26:44'),(5,'qui',17,5,'2005-12-27 17:13:46'),(6,'at',9,6,'1978-12-26 13:39:40'),(7,'sunt',68,7,'1999-11-27 23:04:47'),(8,'sit',12,8,'2008-12-29 10:39:48'),(9,'et',35,9,'1993-12-29 17:22:45'),(10,'qui',68,10,'2001-09-03 05:11:51'),(11,'quidem',24,11,'1973-01-12 20:59:03'),(12,'consequatur',76,12,'1975-11-23 23:38:53'),(13,'sunt',57,13,'1980-01-08 01:16:47'),(14,'velit',73,14,'1989-01-13 00:45:43'),(15,'commodi',11,15,'1979-01-24 14:58:45'),(16,'porro',77,16,'1985-02-20 13:00:50'),(17,'voluptatem',67,17,'1992-08-12 21:36:28'),(18,'fugiat',12,18,'1997-05-30 17:37:15'),(19,'corporis',70,19,'1979-12-01 09:01:29'),(20,'ut',58,20,'1989-09-05 21:10:29'),(21,'itaque',62,21,'1984-01-06 20:00:12'),(22,'aperiam',75,22,'1975-07-09 21:04:28'),(23,'illum',23,23,'1992-12-27 22:44:55'),(24,'corporis',37,24,'1984-11-11 19:11:04'),(25,'tenetur',46,25,'1994-09-01 10:25:34'),(26,'quisquam',11,26,'1997-07-04 13:04:45'),(27,'maxime',98,27,'1983-01-17 00:51:49'),(28,'doloribus',24,28,'1974-06-14 07:09:13'),(29,'rem',86,29,'1981-07-21 04:05:12'),(30,'molestiae',35,30,'1977-01-03 19:09:41'),(31,'architecto',65,31,'1993-02-01 00:36:27'),(32,'quia',95,32,'2008-12-17 21:28:11'),(33,'iure',63,33,'2012-08-03 17:27:19'),(34,'quos',72,34,'2008-12-31 01:16:06'),(35,'repudiandae',13,35,'2019-06-13 12:50:13'),(36,'debitis',80,36,'1975-10-16 09:11:39'),(37,'beatae',80,37,'1992-09-12 16:59:19'),(38,'a',80,38,'1977-02-16 20:04:45'),(39,'cum',92,39,'2003-05-25 10:26:17'),(40,'ipsa',15,40,'1993-08-15 21:19:28'),(41,'incidunt',48,41,'2006-10-29 02:27:09'),(42,'aperiam',15,42,'2014-09-02 21:02:03'),(43,'fugiat',91,43,'1991-08-15 09:48:25'),(44,'dicta',4,44,'2004-06-10 18:36:44'),(45,'ad',88,45,'2004-03-23 12:37:47'),(46,'minus',2,46,'2016-02-08 09:54:19'),(47,'fugit',80,47,'1992-04-20 16:52:35'),(48,'nesciunt',54,48,'2014-03-23 11:18:24'),(49,'eius',13,49,'1986-06-16 18:23:30'),(50,'culpa',50,50,'2003-03-01 14:04:14'),(51,'ut',11,51,'2021-11-09 14:50:01'),(52,'neque',74,52,'2008-10-24 04:00:56'),(53,'voluptatem',24,53,'1987-02-14 17:18:00'),(54,'harum',34,54,'2007-10-04 00:01:51'),(55,'debitis',11,55,'2011-12-30 00:19:37'),(56,'soluta',70,56,'2018-12-27 10:25:03'),(57,'quis',44,57,'1975-12-23 03:44:13'),(58,'dolorem',9,58,'1971-05-11 18:22:50'),(59,'enim',94,59,'2006-01-02 12:13:23'),(60,'deserunt',29,60,'1985-07-05 15:00:48'),(61,'omnis',44,61,'2019-03-07 13:28:18'),(62,'voluptas',59,62,'1979-02-27 12:02:41'),(63,'eligendi',23,63,'1986-03-10 13:19:27'),(64,'sapiente',6,64,'1983-04-21 23:43:13'),(65,'consequuntur',30,65,'1974-06-03 08:55:56'),(66,'error',36,66,'1978-03-11 17:47:41'),(67,'voluptas',86,67,'2019-02-08 05:28:36'),(68,'consequatur',10,68,'1997-05-10 04:17:08'),(69,'voluptatibus',16,69,'1980-05-27 16:52:09'),(70,'repellendus',77,70,'1983-01-18 07:48:10'),(71,'dolor',24,71,'1978-10-29 10:28:07'),(72,'libero',63,72,'1973-09-29 10:43:03'),(73,'incidunt',92,73,'1981-08-18 11:40:57'),(74,'dolor',15,74,'1978-07-27 22:08:38'),(75,'dolores',67,75,'1971-04-18 04:48:10'),(76,'dolores',79,76,'1981-03-05 00:39:53'),(77,'et',16,77,'1984-10-02 22:35:29'),(78,'dolorem',47,78,'1996-05-29 01:40:14'),(79,'autem',32,79,'2015-07-25 14:16:59'),(80,'nemo',29,80,'1970-02-22 16:24:35'),(81,'vitae',97,81,'2011-01-02 22:56:59'),(82,'doloremque',43,82,'1990-02-18 07:20:37'),(83,'et',3,83,'2005-06-02 06:13:39'),(84,'ea',21,84,'1995-10-03 12:54:27'),(85,'voluptatibus',76,85,'1970-12-23 16:00:29'),(86,'doloremque',14,86,'2003-08-31 12:55:16'),(87,'aliquid',90,87,'2011-10-05 23:58:31'),(88,'rerum',20,88,'1972-08-21 08:20:57'),(89,'nulla',22,89,'1974-03-27 22:36:17'),(90,'quia',83,90,'2016-08-22 17:17:58'),(91,'in',49,91,'2000-08-11 09:37:38'),(92,'voluptatum',65,92,'1983-07-02 00:02:27'),(93,'est',42,93,'2007-11-21 01:20:55'),(94,'officia',72,94,'2005-11-16 20:05:34'),(95,'quia',71,95,'1990-05-04 23:29:28'),(96,'id',71,96,'1983-05-19 19:37:25'),(97,'excepturi',7,97,'1979-01-02 07:29:39'),(98,'exercitationem',57,98,'2010-04-22 09:41:22'),(99,'recusandae',81,99,'1971-07-03 10:37:07'),(100,'consequuntur',23,100,'1999-04-20 05:21:34');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-24 10:48:00


/*  Задание 2
 * Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке.
 */

SELECT DISTINCT firstname
FROM users;

/*  Задание 3
 * Первые пять пользователей пометить как удаленные.
 */

UPDATE users
SET is_deleted = TRUE
LIMIT 5;

  /*Задание 4
  Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней).
 */

DELETE FROM messages
WHERE created_at > now();

 /*Задание 5
 * Написать название темы курсового проекта.
 */

/* Начал делать базу данных отеля, в кототой на данный момент 8 сущностей;
 * 
 * 1. Номера
 * 2. посетители(прошлые)
 * 3. Бронирование
 * 4. Питание.
 * 5. Отзывы
 * 6. Фотоальбомы отеля
 * 7. Фотографии номеров
 * 8. Акции
 * 
 * Ниже начало работы над базой
 */

 * -- Создаю базу Hotel

DROP DATABASE IF EXISTS hotel;
CREATE DATABASE hotel;
USE hotel;

-- Создаю табицу комнаты, так же номер комнаты, категорию и вместимость номера

DROP TABLE IF EXISTS rooms;
CREATE TABLE rooms (
	id_number_room SERIAL PRIMARY KEY,
	room_category VARCHAR(100),
	room_capacity INT,
	INDEX rooms_room_category_room_capacity_idx(room_category, room_capacity)
);
	
-- Создаю таблицу базы посетителей отеля

DROP TABLE IF EXISTS visitors;
CREATE TABLE visitors (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'Фамилия', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(100) UNIQUE,
    phone BIGINT,
    gender CHAR(1),
    birthday DATE,
	rooms_id BIGINT UNSIGNED NOT NULL,
    `check_in` DATETIME,
    `exit` DATETIME,
    hometown VARCHAR(100),
    INDEX visitors_lastname_capacity_idx(firstname, lastname),
    
    FOREIGN KEY (rooms_id) REFERENCES rooms(id_number_room) ON UPDATE CASCADE ON DELETE CASCADE
);


DROP TABLE IF EXISTS `photo_albums_hotel`;
CREATE TABLE `photo_albums_hotel` (
	`id` SERIAL,
	`name` varchar(255) DEFAULT NULL,
    `room_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (room_id) REFERENCES rooms(id_number_room) ON UPDATE CASCADE ON DELETE SET NULL,
  	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `rooms_photos`;
CREATE TABLE `rooms_photos` (
	id SERIAL PRIMARY KEY,
	`album_id` BIGINT UNSIGNED NOT NULL,

	FOREIGN KEY (album_id) REFERENCES photo_albums_hotel(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS booking;
CREATE TABLE booking (
	id_number_room SERIAL PRIMARY KEY,
	firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'Фамилия', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(100) UNIQUE,
    phone BIGINT,
    gender CHAR(1),
    birthday DATE,
	rooms_id BIGINT UNSIGNED NOT NULL,
    `check_in` DATETIME,
    `exit` DATETIME,
    hometown VARCHAR(100),
    INDEX booking_lastname_capacity_idx(firstname, lastname),
    
    FOREIGN KEY (rooms_id) REFERENCES rooms(id_number_room) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
	id SERIAL PRIMARY KEY,
	body TEXT,
	rooms_id BIGINT UNSIGNED NOT NULL,
	visitors_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'Фамилия',
    phone BIGINT,
	
	FOREIGN KEY (rooms_id) REFERENCES rooms(id_number_room) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (visitors_id) REFERENCES visitors(id) ON UPDATE CASCADE ON DELETE CASCADE
	
);

DROP TABLE IF EXISTS nutrition;
CREATE TABLE nutrition (
	id SERIAL PRIMARY KEY,
	`room category` ENUM('all_inclusive', 'breakfast_dinner', 'breakfast_only', 'without_food'),
	rooms_id BIGINT UNSIGNED NOT NULL,
	booking_id BIGINT UNSIGNED NOT NULL,
	`check_in` DATETIME,
	`exit` DATETIME,
	
	FOREIGN KEY (rooms_id) REFERENCES rooms(id_number_room) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (booking_id) REFERENCES booking(id_number_room) ON UPDATE CASCADE ON DELETE CASCADE
	
);

DROP TABLE IF EXISTS stocks;
CREATE TABLE stocks (
	id SERIAL PRIMARY KEY,
	`discount` ENUM('5%', '10%', '15%', '20%'),
	rooms_id BIGINT UNSIGNED NOT NULL,
	booking_id BIGINT UNSIGNED NOT NULL,
	`beginning_discount` DATETIME,
	`end_discountt` DATETIME,
	
	FOREIGN KEY (rooms_id) REFERENCES rooms(id_number_room) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (booking_id) REFERENCES booking(id_number_room) ON UPDATE CASCADE ON DELETE CASCADE
	
);
	
