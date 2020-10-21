-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 07, 2020 at 11:00 PM
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
-- Table structure for table `eav_attribute_label`
--

CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int(10) UNSIGNED NOT NULL COMMENT 'Attribute Label ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label';

--
-- Dumping data for table `eav_attribute_label`
--

INSERT INTO `eav_attribute_label` (`attribute_label_id`, `attribute_id`, `store_id`, `value`) VALUES
(2, 137, 1, 'Style'),
(6, 142, 1, 'Category'),
(11, 150, 1, 'Style'),
(13, 151, 1, 'Style'),
(26, 158, 1, 'Ram'),
(28, 143, 1, 'Size');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eav_attribute_label`
--
ALTER TABLE `eav_attribute_label`
  ADD PRIMARY KEY (`attribute_label_id`),
  ADD KEY `EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  ADD KEY `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eav_attribute_label`
--
ALTER TABLE `eav_attribute_label`
  MODIFY `attribute_label_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label ID', AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
