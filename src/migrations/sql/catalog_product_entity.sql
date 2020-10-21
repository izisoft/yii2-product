-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 08, 2020 at 12:03 AM
-- Server version: 10.3.23-MariaDB-1
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_izinet`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity`
--

CREATE TABLE `catalog_product_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `attribute_set_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `type` varchar(32) NOT NULL DEFAULT 'text' COMMENT 'Type',
  `sku` varchar(64) DEFAULT NULL COMMENT 'Sku',
  `has_options` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Has Options',
  `required_options` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Required Options',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp() COMMENT 'Update Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catalog_product_entity`
--
 

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalog_product_entity`
--
ALTER TABLE `catalog_product_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_SKU` (`sku`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalog_product_entity`
--
ALTER TABLE `catalog_product_entity`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
