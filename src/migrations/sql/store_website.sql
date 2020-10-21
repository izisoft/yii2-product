-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 07, 2020 at 10:58 PM
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
-- Table structure for table `store_website`
--

CREATE TABLE `store_website` (
  `website_id` int(10) UNSIGNED NOT NULL COMMENT 'Website ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort Order',
  `default_group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Default Group ID',
  `is_default` smallint(5) UNSIGNED DEFAULT 0 COMMENT 'Defines Is Website Default',
  `sid` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Websites';

--
-- Dumping data for table `store_website`
--

INSERT INTO `store_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`, `sid`) VALUES
(0, 'admin', 'Admin', 0, 0, 0, 0),
(1, 'base', 'Main Website', 0, 1, 1, 0),
(2, 'base', 'Main Website', 0, 0, 1, 40);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `store_website`
--
ALTER TABLE `store_website`
  ADD PRIMARY KEY (`website_id`),
  ADD UNIQUE KEY `STORE_WEBSITE_CODE` (`code`,`sid`) USING BTREE,
  ADD KEY `STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  ADD KEY `STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`),
  ADD KEY `sid` (`sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `store_website`
--
ALTER TABLE `store_website`
  MODIFY `website_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Website ID', AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `store_website`
--
ALTER TABLE `store_website`
  ADD CONSTRAINT `store_website_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
