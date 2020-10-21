-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 07, 2020 at 11:01 PM
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
-- Table structure for table `eav_entity_type`
--

CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Entity Type ID',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity ID Field',
  `is_data_sharing` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Default Attribute Set ID',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) UNSIGNED NOT NULL DEFAULT 8 COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';

--
-- Dumping data for table `eav_entity_type`
--

INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES
(1, 'customer', 'izi\\customer\\models\\Customer', 'izi\\customer\\models\\Attribute', 'customer_entity', NULL, NULL, 1, 'default', 1, 'izi\\eav\\models\\entity\\increment\\NumericValue', 0, 8, '0', 'customer_eav_attribute', 'izi\\customer\\models\\attribute\\Collection'),
(2, 'customer_address', 'izi\\customer\\models\\Address', 'izi\\customer\\models\\Attribute', 'customer_address_entity', NULL, NULL, 1, 'default', 2, NULL, 0, 8, '0', 'customer_eav_attribute', 'izi\\customer\\models\\address\\attribute\\Collection'),
(3, 'catalog_category', 'izi\\catalog\\models\\Category', 'izi\\catalog\\models\\eav\\Attribute', 'catalog_category_entity', NULL, NULL, 1, 'default', 3, NULL, 0, 8, '0', 'catalog_eav_attribute', 'izi\\catalog\\models\\category\\attribute\\Collection'),
(4, 'catalog_product', 'izi\\product\\models\\Product', 'izi\\eav\\Attribute', 'catalog_product_entity', NULL, NULL, 1, 'default', 4, NULL, 0, 8, '0', 'catalog_eav_attribute', 'izi\\product\\models\\attribute\\Collection'),
(5, 'order', 'izi\\sales\\models\\order', NULL, 'sales_order', NULL, NULL, 1, 'default', 5, 'izi\\eav\\models\\entity\\increment\\NumericValue', 1, 8, '0', NULL, NULL),
(6, 'invoice', 'izi\\sales\\models\\order\\Invoice', NULL, 'sales_invoice', NULL, NULL, 1, 'default', 6, 'izi\\eav\\models\\entity\\increment\\NumericValue', 1, 8, '0', NULL, NULL),
(7, 'creditmemo', 'izi\\sales\\models\\order\\Creditmemo', NULL, 'sales_creditmemo', NULL, NULL, 1, 'default', 7, 'izi\\eav\\models\\entity\\increment\\NumericValue', 1, 8, '0', NULL, NULL),
(8, 'shipment', 'izi\\sales\\models\\order\\Shipment', NULL, 'sales_shipment', NULL, NULL, 1, 'default', 8, 'izi\\eav\\models\\entity\\increment\\NumericValue', 1, 8, '0', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eav_entity_type`
--
ALTER TABLE `eav_entity_type`
  ADD PRIMARY KEY (`entity_type_id`),
  ADD KEY `EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eav_entity_type`
--
ALTER TABLE `eav_entity_type`
  MODIFY `entity_type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Type ID', AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
