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
-- Table structure for table `catalog_product_entity_datetime`
--

CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int(10) NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  MODIFY `value_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
