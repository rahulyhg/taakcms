-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 14, 2019 at 10:17 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.1.30

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

CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  `has_subcategory` tinyint(1) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contents`
--

CREATE TABLE `tbl_contents` (
  `id` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `row_index` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_details`
--

CREATE TABLE `tbl_content_details` (
  `content_id` int(11) NOT NULL,
  `field_key` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `field_value` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_images`
--

CREATE TABLE `tbl_content_images` (
  `content_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `title` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_persian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_sounds`
--

CREATE TABLE `tbl_content_sounds` (
  `id` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `duration` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `url` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_videos`
--

CREATE TABLE `tbl_content_videos` (
  `id` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `url` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fieldsets`
--

CREATE TABLE `tbl_fieldsets` (
  `id` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fieldset_details`
--

CREATE TABLE `tbl_fieldset_details` (
  `id` int(11) NOT NULL,
  `fieldset_id` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `title_latin` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `data_type` varchar(16) COLLATE utf8_persian_ci DEFAULT NULL,
  `value` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
  `orderfield` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `id` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `logo` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `terms_and_conditions` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `about` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
  `baner_contentId` int(11) DEFAULT NULL,
  `color` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategories`
--

CREATE TABLE `tbl_subcategories` (
  `id` int(11) NOT NULL,
  `title` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `logo` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `content_fieldset_id` int(11) DEFAULT NULL,
  `has_audio` tinyint(1) DEFAULT NULL,
  `has_video` tinyint(1) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `self_fieldset_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `has_image` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory_details`
--

CREATE TABLE `tbl_subcategory_details` (
  `id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `field_key` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `field_value` varchar(500) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `fullname` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contents`
--
ALTER TABLE `tbl_contents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_content_details`
--
ALTER TABLE `tbl_content_details`
  ADD PRIMARY KEY (`content_id`,`field_key`);

--
-- Indexes for table `tbl_content_images`
--
ALTER TABLE `tbl_content_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_content_sounds`
--
ALTER TABLE `tbl_content_sounds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_content_videos`
--
ALTER TABLE `tbl_content_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_fieldsets`
--
ALTER TABLE `tbl_fieldsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_fieldset_details`
--
ALTER TABLE `tbl_fieldset_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`);

--
-- Indexes for table `tbl_subcategories`
--
ALTER TABLE `tbl_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_subcategory_details`
--
ALTER TABLE `tbl_subcategory_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_contents`
--
ALTER TABLE `tbl_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_content_images`
--
ALTER TABLE `tbl_content_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_content_sounds`
--
ALTER TABLE `tbl_content_sounds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_content_videos`
--
ALTER TABLE `tbl_content_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_fieldsets`
--
ALTER TABLE `tbl_fieldsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_fieldset_details`
--
ALTER TABLE `tbl_fieldset_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_subcategories`
--
ALTER TABLE `tbl_subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_subcategory_details`
--
ALTER TABLE `tbl_subcategory_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
