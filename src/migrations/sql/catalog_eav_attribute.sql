-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 07, 2020 at 11:02 PM
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
-- Table structure for table `catalog_eav_attribute`
--

CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Is Global',
  `is_visible` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Is Visible',
  `is_searchable` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Searchable',
  `is_filterable` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Filterable',
  `is_comparable` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT 1 COMMENT 'Search Weight',
  `additional_data` text DEFAULT NULL COMMENT 'Additional swatch attributes data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';

--
-- Dumping data for table `catalog_eav_attribute`
--

INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`, `is_required_in_admin_store`, `is_used_in_grid`, `is_visible_in_grid`, `is_filterable_in_grid`, `search_weight`, `additional_data`) VALUES
(45, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(46, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(47, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 1, NULL),
(48, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(49, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(50, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(51, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(52, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(53, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(54, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(55, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(56, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(57, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(58, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(59, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(60, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(61, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(62, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(63, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(64, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(65, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(66, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(67, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(68, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(69, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(70, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(71, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(72, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(73, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 5, NULL),
(74, NULL, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 0, 0, 0, 6, NULL),
(75, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, NULL),
(76, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, NULL, 1, 0, 1, 0, 0, 1, 0, 0, 1, NULL),
(77, NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 'simple,virtual,bundle,downloadable,configurable', 1, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(78, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(79, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(80, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(81, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,downloadable', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(82, 'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(83, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 'simple,configurable', 1, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(84, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(85, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(86, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(87, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(88, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(89, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(90, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(91, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(92, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,bundle,downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(93, NULL, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 'simple,virtual,configurable', 0, 0, 0, 1, 0, 1, 0, 1, 1, '{\"swatch_input_type\":\"visual\",\"update_product_preview_image\":1,\"use_product_image_for_swatch\":0}'),
(94, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(95, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(96, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(97, 'Magento\\Framework\\Data\\Form\\Element\\Hidden', 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 1, NULL),
(98, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(99, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 1, NULL),
(100, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(101, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(102, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(103, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(104, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(105, 'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(106, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(107, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(108, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(109, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(110, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(111, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(112, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(113, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(114, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,bundle,configurable,grouped', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(115, 'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(116, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(117, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(118, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(119, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(120, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(121, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(122, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(123, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(124, 'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type', 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(125, 'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price', 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(126, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(127, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(128, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(129, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(130, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(131, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(132, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(133, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(134, NULL, 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(135, 'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(136, NULL, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(137, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(138, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(139, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(140, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(141, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(142, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(143, NULL, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, '{\"swatch_input_type\":\"text\",\"update_product_preview_image\":1,\"use_product_image_for_swatch\":0}'),
(144, NULL, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(145, NULL, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(146, NULL, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(147, NULL, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(148, NULL, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(149, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(150, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(151, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(152, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(153, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(154, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(155, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL),
(156, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(157, NULL, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 1, 1, NULL),
(158, NULL, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 1, 1, NULL),
(159, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 1, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalog_eav_attribute`
--
ALTER TABLE `catalog_eav_attribute`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  ADD KEY `CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
