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
-- Table structure for table `eav_attribute_option_swatch`
--

CREATE TABLE `eav_attribute_option_swatch` (
  `swatch_id` int(10) UNSIGNED NOT NULL COMMENT 'Swatch ID',
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `type` smallint(5) UNSIGNED NOT NULL COMMENT 'Swatch type: 0 - text, 1 - visual color, 2 - visual image',
  `value` varchar(255) DEFAULT NULL COMMENT 'Swatch Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Swatches table';

--
-- Dumping data for table `eav_attribute_option_swatch`
--

INSERT INTO `eav_attribute_option_swatch` (`swatch_id`, `option_id`, `store_id`, `type`, `value`) VALUES
(1, 49, 0, 1, '#000000'),
(2, 50, 0, 1, '#1857f7'),
(3, 51, 0, 1, '#945454'),
(4, 52, 0, 1, '#8f8f8f'),
(5, 53, 0, 1, '#53a828'),
(6, 54, 0, 1, '#ce64d4'),
(7, 55, 0, 1, '#ffffff'),
(8, 56, 0, 1, '#eb6703'),
(9, 57, 0, 1, '#ef3dff'),
(10, 58, 0, 1, '#ff0000'),
(11, 59, 0, 1, '#ffffff'),
(12, 60, 0, 1, '#ffd500'),
(13, 91, 0, 0, '55 cm'),
(14, 91, 1, 0, '55 cm'),
(15, 166, 0, 0, 'XS'),
(16, 166, 1, 0, 'XS'),
(17, 92, 0, 0, '65 cm'),
(18, 92, 1, 0, '65 cm'),
(19, 167, 0, 0, 'S'),
(20, 167, 1, 0, 'S'),
(21, 93, 0, 0, '75 cm'),
(22, 93, 1, 0, '75 cm'),
(23, 168, 0, 0, 'M'),
(24, 168, 1, 0, 'M'),
(25, 94, 0, 0, '6 foot'),
(26, 94, 1, 0, '6 foot'),
(27, 169, 0, 0, 'L'),
(28, 169, 1, 0, 'L'),
(29, 95, 0, 0, '8 foot'),
(30, 95, 1, 0, '8 foot'),
(31, 170, 0, 0, 'XL'),
(32, 170, 1, 0, 'XL'),
(33, 96, 0, 0, '10 foot'),
(34, 96, 1, 0, '10 foot'),
(35, 171, 0, 0, '28'),
(36, 171, 1, 0, '28'),
(37, 172, 0, 0, '29'),
(38, 172, 1, 0, '29'),
(39, 173, 0, 0, '30'),
(40, 173, 1, 0, '30'),
(41, 174, 0, 0, '31'),
(42, 174, 1, 0, '31'),
(43, 175, 0, 0, '32'),
(44, 175, 1, 0, '32'),
(45, 176, 0, 0, '33'),
(46, 176, 1, 0, '33'),
(47, 177, 0, 0, '34'),
(48, 177, 1, 0, '34'),
(49, 178, 0, 0, '36'),
(50, 178, 1, 0, '36'),
(51, 179, 0, 0, '38'),
(52, 179, 1, 0, '38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eav_attribute_option_swatch`
--
ALTER TABLE `eav_attribute_option_swatch`
  ADD PRIMARY KEY (`swatch_id`),
  ADD UNIQUE KEY `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  ADD KEY `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` (`option_id`),
  ADD KEY `EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eav_attribute_option_swatch`
--
ALTER TABLE `eav_attribute_option_swatch`
  MODIFY `swatch_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Swatch ID', AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
