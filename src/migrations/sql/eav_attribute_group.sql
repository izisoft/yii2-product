-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 25, 2020 at 09:44 AM
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
-- Database: `magento`
--

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_group`
--

CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Group ID',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute Set ID',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `default_id` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Default ID',
  `attribute_group_code` varchar(255) NOT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group';

--
-- Dumping data for table `eav_attribute_group`
--

INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`, `attribute_group_code`, `tab_group_code`) VALUES
(1, 1, 'General', 1, 1, 'general', NULL),
(2, 2, 'General', 1, 1, 'general', NULL),
(3, 3, 'General', 10, 1, 'general', NULL),
(4, 3, 'General Information', 2, 0, 'general-information', NULL),
(5, 3, 'Display Settings', 20, 0, 'display-settings', NULL),
(6, 3, 'Custom Design', 30, 0, 'custom-design', NULL),
(7, 4, 'Product Details', 10, 1, 'product-details', 'basic'),
(8, 4, 'Advanced Pricing', 40, 0, 'advanced-pricing', 'advanced'),
(9, 4, 'Search Engine Optimization', 30, 0, 'search-engine-optimization', 'basic'),
(10, 4, 'Images', 20, 0, 'image-management', 'basic'),
(11, 4, 'Design', 50, 0, 'design', 'advanced'),
(12, 4, 'Autosettings', 60, 0, 'autosettings', 'advanced'),
(13, 4, 'Content', 15, 0, 'content', 'basic'),
(14, 4, 'Schedule Design Update', 55, 0, 'schedule-design-update', 'advanced'),
(15, 4, 'Bundle Items', 16, 0, 'bundle-items', NULL),
(16, 5, 'General', 1, 1, 'general', NULL),
(17, 6, 'General', 1, 1, 'general', NULL),
(18, 7, 'General', 1, 1, 'general', NULL),
(19, 8, 'General', 1, 1, 'general', NULL),
(20, 4, 'Gift Options', 61, 0, 'gift-options', NULL),
(21, 9, 'Gift Options', 61, 0, 'gift-options', NULL),
(22, 9, 'Autosettings', 60, 0, 'autosettings', 'advanced'),
(23, 9, 'Schedule Design Update', 55, 0, 'schedule-design-update', 'advanced'),
(24, 9, 'Design', 50, 0, 'design', 'advanced'),
(25, 9, 'Advanced Pricing', 40, 0, 'advanced-pricing', 'advanced'),
(26, 9, 'Search Engine Optimization', 30, 0, 'search-engine-optimization', 'basic'),
(27, 9, 'Images', 20, 0, 'image-management', 'basic'),
(28, 9, 'Bundle Items', 16, 0, 'bundle-items', NULL),
(29, 9, 'Content', 15, 0, 'content', 'basic'),
(30, 9, 'Product Details', 10, 1, 'product-details', 'basic'),
(31, 10, 'Gift Options', 61, 0, 'gift-options', NULL),
(32, 10, 'Autosettings', 60, 0, 'autosettings', 'advanced'),
(33, 10, 'Schedule Design Update', 55, 0, 'schedule-design-update', 'advanced'),
(34, 10, 'Design', 50, 0, 'design', 'advanced'),
(35, 10, 'Advanced Pricing', 40, 0, 'advanced-pricing', 'advanced'),
(36, 10, 'Search Engine Optimization', 30, 0, 'search-engine-optimization', 'basic'),
(37, 10, 'Images', 20, 0, 'image-management', 'basic'),
(38, 10, 'Bundle Items', 16, 0, 'bundle-items', NULL),
(39, 10, 'Content', 15, 0, 'content', 'basic'),
(40, 10, 'Product Details', 10, 1, 'product-details', 'basic'),
(41, 11, 'Gift Options', 61, 0, 'gift-options', NULL),
(42, 11, 'Autosettings', 60, 0, 'autosettings', 'advanced'),
(43, 11, 'Schedule Design Update', 55, 0, 'schedule-design-update', 'advanced'),
(44, 11, 'Design', 50, 0, 'design', 'advanced'),
(45, 11, 'Advanced Pricing', 40, 0, 'advanced-pricing', 'advanced'),
(46, 11, 'Search Engine Optimization', 30, 0, 'search-engine-optimization', 'basic'),
(47, 11, 'Images', 20, 0, 'image-management', 'basic'),
(48, 11, 'Bundle Items', 16, 0, 'bundle-items', NULL),
(49, 11, 'Content', 15, 0, 'content', 'basic'),
(50, 11, 'Product Details', 10, 1, 'product-details', 'basic'),
(51, 12, 'Gift Options', 61, 0, 'gift-options', NULL),
(52, 12, 'Autosettings', 60, 0, 'autosettings', 'advanced'),
(53, 12, 'Schedule Design Update', 55, 0, 'schedule-design-update', 'advanced'),
(54, 12, 'Design', 50, 0, 'design', 'advanced'),
(55, 12, 'Advanced Pricing', 40, 0, 'advanced-pricing', 'advanced'),
(56, 12, 'Search Engine Optimization', 30, 0, 'search-engine-optimization', 'basic'),
(57, 12, 'Images', 20, 0, 'image-management', 'basic'),
(58, 12, 'Bundle Items', 16, 0, 'bundle-items', NULL),
(59, 12, 'Content', 15, 0, 'content', 'basic'),
(60, 12, 'Product Details', 10, 1, 'product-details', 'basic'),
(61, 13, 'Gift Options', 61, 0, 'gift-options', NULL),
(62, 13, 'Autosettings', 60, 0, 'autosettings', 'advanced'),
(63, 13, 'Schedule Design Update', 55, 0, 'schedule-design-update', 'advanced'),
(64, 13, 'Design', 50, 0, 'design', 'advanced'),
(65, 13, 'Advanced Pricing', 40, 0, 'advanced-pricing', 'advanced'),
(66, 13, 'Search Engine Optimization', 30, 0, 'search-engine-optimization', 'basic'),
(67, 13, 'Images', 20, 0, 'image-management', 'basic'),
(68, 13, 'Bundle Items', 16, 0, 'bundle-items', NULL),
(69, 13, 'Content', 15, 0, 'content', 'basic'),
(70, 13, 'Product Details', 10, 1, 'product-details', 'basic'),
(71, 14, 'Gift Options', 61, 0, 'gift-options', NULL),
(72, 14, 'Autosettings', 60, 0, 'autosettings', 'advanced'),
(73, 14, 'Schedule Design Update', 55, 0, 'schedule-design-update', 'advanced'),
(74, 14, 'Design', 50, 0, 'design', 'advanced'),
(75, 14, 'Advanced Pricing', 40, 0, 'advanced-pricing', 'advanced'),
(76, 14, 'Search Engine Optimization', 30, 0, 'search-engine-optimization', 'basic'),
(77, 14, 'Images', 20, 0, 'image-management', 'basic'),
(78, 14, 'Bundle Items', 16, 0, 'bundle-items', NULL),
(79, 14, 'Content', 15, 0, 'content', 'basic'),
(80, 14, 'Product Details', 10, 1, 'product-details', 'basic'),
(81, 15, 'Gift Options', 61, 0, 'gift-options', NULL),
(82, 15, 'Autosettings', 60, 0, 'autosettings', 'advanced'),
(83, 15, 'Schedule Design Update', 55, 0, 'schedule-design-update', 'advanced'),
(84, 15, 'Design', 50, 0, 'design', 'advanced'),
(85, 15, 'Advanced Pricing', 40, 0, 'advanced-pricing', 'advanced'),
(86, 15, 'Search Engine Optimization', 30, 0, 'search-engine-optimization', 'basic'),
(87, 15, 'Images', 20, 0, 'image-management', 'basic'),
(88, 15, 'Bundle Items', 16, 0, 'bundle-items', NULL),
(89, 15, 'Content', 15, 0, 'content', 'basic'),
(90, 15, 'Product Details', 10, 1, 'product-details', 'basic'),
(91, 10, 'Attributes', 62, 0, 'attributes', NULL),
(92, 11, 'Attributes', 62, 0, 'attributes', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`),
  ADD UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_CODE` (`attribute_set_id`,`attribute_group_code`),
  ADD UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  ADD KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  MODIFY `attribute_group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group ID', AUTO_INCREMENT=93;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  ADD CONSTRAINT `EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
