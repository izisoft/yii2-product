-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 07, 2020 at 10:59 PM
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
-- Table structure for table `store_group`
--

CREATE TABLE `store_group` (
  `group_id` int(10) UNSIGNED NOT NULL COMMENT 'Group ID',
  `website_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Website ID',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Root Category ID',
  `default_store_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Default Store ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Store group unique code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store Groups';

--
-- Dumping data for table `store_group`
--

INSERT INTO `store_group` (`group_id`, `website_id`, `name`, `root_category_id`, `default_store_id`, `code`) VALUES
(0, 0, 'Default', 0, 0, 'default'),
(1, 1, 'Main Website Store', 2, 1, 'main_website_store'),
(3, 2, 'Main website store', 0, 3, 'main_website_store');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `store_group`
--
ALTER TABLE `store_group`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `STORE_GROUP_WEBSITE_ID` (`website_id`),
  ADD KEY `STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`),
  ADD KEY `STORE_GROUP_CODE` (`code`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `store_group`
--
ALTER TABLE `store_group`
  MODIFY `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Group ID', AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `store_group`
--
ALTER TABLE `store_group`
  ADD CONSTRAINT `STORE_GROUP_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
