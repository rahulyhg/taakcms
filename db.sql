-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 30, 2019 at 04:53 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

DROP TABLE IF EXISTS `tbl_categories`;
CREATE TABLE IF NOT EXISTS `tbl_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  `has_subcategory` tinyint(1) NOT NULL,
  `product_id` int(11) NOT NULL,
  `content_fieldset_id` int(11) NOT NULL,
  `subcategory_fieldset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contents`
--

DROP TABLE IF EXISTS `tbl_contents`;
CREATE TABLE IF NOT EXISTS `tbl_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `row_index` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_details`
--

DROP TABLE IF EXISTS `tbl_content_details`;
CREATE TABLE IF NOT EXISTS `tbl_content_details` (
  `content_id` int(11) NOT NULL,
  `field_key` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `field_value` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`field_key`,`content_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_images`
--

DROP TABLE IF EXISTS `tbl_content_images`;
CREATE TABLE IF NOT EXISTS `tbl_content_images` (
  `content_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_sounds`
--

DROP TABLE IF EXISTS `tbl_content_sounds`;
CREATE TABLE IF NOT EXISTS `tbl_content_sounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `duration` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `url` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_videos`
--

DROP TABLE IF EXISTS `tbl_content_videos`;
CREATE TABLE IF NOT EXISTS `tbl_content_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `url` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fieldsets`
--

DROP TABLE IF EXISTS `tbl_fieldsets`;
CREATE TABLE IF NOT EXISTS `tbl_fieldsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `has_audio` tinyint(1) NOT NULL,
  `has_video` tinyint(1) NOT NULL,
  `has_image` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fieldset_details`
--

DROP TABLE IF EXISTS `tbl_fieldset_details`;
CREATE TABLE IF NOT EXISTS `tbl_fieldset_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldset_id` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `title_latin` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `data_type` varchar(16) COLLATE utf8_persian_ci DEFAULT NULL,
  `value` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
  `orderfield` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
CREATE TABLE IF NOT EXISTS `tbl_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `logo` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `terms_and_conditions` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `about` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `baner_contentId` int(11) DEFAULT NULL,
  `color` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `api_key` varchar(24) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategories`
--

DROP TABLE IF EXISTS `tbl_subcategories`;
CREATE TABLE IF NOT EXISTS `tbl_subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `row_index` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory_details`
--

DROP TABLE IF EXISTS `tbl_subcategory_details`;
CREATE TABLE IF NOT EXISTS `tbl_subcategory_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory_id` int(11) NOT NULL,
  `field_key` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `field_value` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory_images`
--

DROP TABLE IF EXISTS `tbl_subcategory_images`;
CREATE TABLE IF NOT EXISTS `tbl_subcategory_images` (
  `subcategory_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory_sounds`
--

DROP TABLE IF EXISTS `tbl_subcategory_sounds`;
CREATE TABLE IF NOT EXISTS `tbl_subcategory_sounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `duration` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `url` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory_videos`
--

DROP TABLE IF EXISTS `tbl_subcategory_videos`;
CREATE TABLE IF NOT EXISTS `tbl_subcategory_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `url` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `fullname` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `role` varchar(10) COLLATE utf8_persian_ci NOT NULL,
  `accessed_products` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `password`, `fullname`, `role`, `accessed_products`) VALUES
(1, 'ali', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'alireza', 'admin', '[]'),
(2, 'reza', '456', 'reza', 'user', '[{\"field_id\":\"-312\",\"product\":\"7\",\"row_status\":\"inserted\"}]'),
(3, 'hasan', NULL, 'حسنی', 'user', 'Array'),
(4, 'یب', NULL, 'شسی', 'user', '[{\"field_id\":\"-293\",\"product\":\"2\",\"row_status\":\"inserted\"},{\"field_id\":\"-518\",\"product\":\"6\",\"row_status\":\"inserted\"}]');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_subcategories`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vw_subcategories`;
CREATE TABLE IF NOT EXISTS `vw_subcategories` (
`id` int(11)
,`row_index` int(11)
,`title` varchar(45)
,`category_id` int(11)
,`content_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_subcategories`
--
DROP TABLE IF EXISTS `vw_subcategories`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_subcategories`  AS  select `tbl_subcategories`.`id` AS `id`,`tbl_subcategories`.`row_index` AS `row_index`,`tbl_subcategories`.`title` AS `title`,`tbl_subcategories`.`category_id` AS `category_id`,(select count(0) from `tbl_contents` where (`tbl_contents`.`subcategory_id` = `tbl_subcategories`.`id`)) AS `content_count` from `tbl_subcategories` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
