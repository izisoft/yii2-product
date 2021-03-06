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
-- Table structure for table `eav_attribute_option`
--

CREATE TABLE `eav_attribute_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Attribute ID',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option';

--
-- Dumping data for table `eav_attribute_option`
--

INSERT INTO `eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`) VALUES
(1, 20, 0),
(2, 20, 1),
(3, 20, 3),
(4, 136, 0),
(5, 136, 1),
(6, 136, 2),
(7, 136, 3),
(8, 136, 4),
(9, 136, 5),
(10, 136, 6),
(11, 136, 7),
(12, 136, 8),
(13, 136, 9),
(14, 136, 10),
(15, 136, 11),
(16, 136, 12),
(17, 136, 13),
(18, 136, 14),
(19, 136, 15),
(20, 136, 16),
(21, 136, 17),
(22, 136, 18),
(23, 136, 19),
(24, 137, 0),
(25, 137, 1),
(26, 137, 2),
(27, 137, 3),
(28, 137, 4),
(29, 137, 5),
(30, 137, 6),
(31, 138, 0),
(32, 138, 1),
(33, 138, 2),
(34, 138, 3),
(35, 138, 4),
(36, 138, 5),
(37, 138, 6),
(38, 138, 7),
(39, 138, 8),
(40, 138, 9),
(41, 138, 10),
(42, 138, 11),
(43, 138, 12),
(44, 138, 13),
(45, 138, 14),
(46, 138, 15),
(47, 138, 16),
(48, 138, 17),
(49, 93, 0),
(50, 93, 1),
(51, 93, 2),
(52, 93, 3),
(53, 93, 4),
(54, 93, 5),
(55, 93, 6),
(56, 93, 7),
(57, 93, 8),
(58, 93, 9),
(59, 93, 10),
(60, 93, 11),
(61, 139, 0),
(62, 139, 1),
(63, 139, 2),
(64, 139, 3),
(65, 139, 4),
(66, 139, 5),
(67, 139, 6),
(68, 139, 7),
(69, 140, 0),
(70, 140, 1),
(71, 140, 2),
(72, 140, 3),
(73, 140, 4),
(74, 140, 5),
(75, 140, 6),
(76, 140, 7),
(77, 140, 8),
(78, 140, 9),
(79, 140, 10),
(80, 141, 0),
(81, 141, 1),
(82, 141, 2),
(83, 141, 3),
(84, 141, 4),
(85, 142, 0),
(86, 142, 1),
(87, 142, 2),
(88, 142, 3),
(89, 142, 4),
(90, 142, 5),
(91, 143, 0),
(92, 143, 2),
(93, 143, 4),
(94, 143, 6),
(95, 143, 8),
(96, 143, 10),
(97, 144, 0),
(98, 145, 0),
(99, 146, 0),
(100, 147, 0),
(101, 148, 0),
(102, 149, 0),
(103, 149, 1),
(104, 150, 0),
(105, 150, 1),
(106, 150, 2),
(107, 150, 3),
(108, 150, 4),
(109, 150, 5),
(110, 150, 6),
(111, 150, 7),
(112, 150, 8),
(113, 150, 9),
(114, 150, 10),
(115, 150, 11),
(116, 151, 0),
(117, 151, 1),
(118, 151, 2),
(119, 151, 3),
(120, 151, 4),
(121, 151, 5),
(122, 151, 6),
(123, 151, 7),
(124, 151, 8),
(125, 151, 9),
(126, 151, 10),
(127, 151, 11),
(128, 151, 12),
(129, 151, 13),
(130, 151, 14),
(131, 151, 15),
(132, 151, 16),
(133, 151, 17),
(134, 151, 18),
(135, 151, 19),
(136, 151, 20),
(137, 151, 21),
(138, 151, 22),
(139, 151, 23),
(140, 151, 24),
(141, 151, 25),
(142, 138, 0),
(143, 138, 1),
(144, 138, 2),
(145, 138, 3),
(146, 138, 4),
(147, 138, 5),
(148, 138, 6),
(149, 138, 7),
(150, 138, 8),
(151, 138, 9),
(152, 138, 10),
(153, 138, 11),
(154, 138, 12),
(155, 138, 13),
(156, 138, 14),
(157, 138, 15),
(158, 138, 16),
(159, 138, 17),
(160, 152, 0),
(161, 152, 1),
(162, 152, 2),
(163, 152, 3),
(164, 152, 4),
(165, 152, 5),
(166, 143, 1),
(167, 143, 3),
(168, 143, 5),
(169, 143, 7),
(170, 143, 9),
(171, 143, 11),
(172, 143, 12),
(173, 143, 13),
(174, 143, 14),
(175, 143, 15),
(176, 143, 16),
(177, 143, 17),
(178, 143, 18),
(179, 143, 19),
(180, 153, 0),
(181, 153, 1),
(182, 153, 2),
(183, 153, 3),
(184, 153, 4),
(185, 153, 5),
(186, 153, 6),
(187, 153, 7),
(188, 153, 8),
(189, 153, 9),
(190, 153, 10),
(191, 153, 11),
(192, 154, 0),
(193, 154, 1),
(194, 154, 2),
(195, 154, 3),
(196, 154, 4),
(197, 154, 5),
(198, 154, 6),
(199, 154, 7),
(200, 154, 8),
(201, 155, 0),
(202, 155, 1),
(203, 155, 2),
(204, 155, 3),
(205, 155, 4),
(206, 155, 5),
(207, 155, 6),
(208, 155, 7),
(209, 155, 8),
(210, 155, 9),
(211, 155, 10),
(212, 157, 1),
(213, 157, 2),
(214, 157, 3),
(215, 158, 1),
(216, 158, 2),
(217, 158, 3),
(218, 158, 4),
(219, 157, 4),
(220, 157, 5),
(221, 157, 6),
(222, 157, 7),
(223, 157, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option ID', AUTO_INCREMENT=224;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
