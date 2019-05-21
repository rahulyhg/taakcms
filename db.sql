CREATE DATABASE  IF NOT EXISTS `cms` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_persian_ci */;
USE `cms`;
-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_categories`
--

DROP TABLE IF EXISTS `tbl_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `logo` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `fieldset_id` int(11) DEFAULT NULL,
  `max_audio_count` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `max_video_count` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categories`
--

LOCK TABLES `tbl_categories` WRITE;
/*!40000 ALTER TABLE `tbl_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_content_details`
--

DROP TABLE IF EXISTS `tbl_content_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_content_details` (
  `content_id` int(11) NOT NULL,
  `field_key` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `field_value` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`content_id`,`field_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_content_details`
--

LOCK TABLES `tbl_content_details` WRITE;
/*!40000 ALTER TABLE `tbl_content_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_content_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_content_sounds`
--

DROP TABLE IF EXISTS `tbl_content_sounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_content_sounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `duration` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `url` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_content_sounds`
--

LOCK TABLES `tbl_content_sounds` WRITE;
/*!40000 ALTER TABLE `tbl_content_sounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_content_sounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_content_videos`
--

DROP TABLE IF EXISTS `tbl_content_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_content_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `url` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_content_videos`
--

LOCK TABLES `tbl_content_videos` WRITE;
/*!40000 ALTER TABLE `tbl_content_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_content_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contents`
--

DROP TABLE IF EXISTS `tbl_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `row_index` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contents`
--

LOCK TABLES `tbl_contents` WRITE;
/*!40000 ALTER TABLE `tbl_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fieldset_details`
--

DROP TABLE IF EXISTS `tbl_fieldset_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_fieldset_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldset_id` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `title_latin` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `data_type` varchar(16) COLLATE utf8_persian_ci DEFAULT NULL,
  `value` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fieldset_details`
--

LOCK TABLES `tbl_fieldset_details` WRITE;
/*!40000 ALTER TABLE `tbl_fieldset_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fieldset_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fieldsets`
--

DROP TABLE IF EXISTS `tbl_fieldsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_fieldsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fieldsets`
--

LOCK TABLES `tbl_fieldsets` WRITE;
/*!40000 ALTER TABLE `tbl_fieldsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fieldsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `logo` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `terms_and_conditions` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `about` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `baner_contentId` int(11) DEFAULT NULL,
  `color` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products`
--

LOCK TABLES `tbl_products` WRITE;
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` VALUES (2,'فلسش','asdasdasd',NULL,NULL,NULL,NULL),(5,'فنگلی','','ق','د',1,'red'),(6,'آشپزی','','a','d',2,'purple'),(8,'گاراژ2','','','',0,'orange'),(9,'جینگیلی','','','',0,'yellow'),(15,'حسنی2','',NULL,NULL,NULL,NULL),(36,'شسی','',NULL,NULL,NULL,NULL),(37,'شسیشسیشی','',NULL,NULL,NULL,NULL),(44,'فسقل','','شی','شسیشسیشسی',2,'cyan');
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `fullname` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (1,'ali','123','alireza'),(2,'reza','456','reza');
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-21 15:49:30
