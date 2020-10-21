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
-- Table structure for table `eav_attribute_option_value`
--

CREATE TABLE `eav_attribute_option_value` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Option ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Store ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value';

--
-- Dumping data for table `eav_attribute_option_value`
--

INSERT INTO `eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`) VALUES
(1, 1, 0, 'Male'),
(2, 2, 0, 'Female'),
(3, 3, 0, 'Not Specified'),
(4, 4, 0, 'Hike'),
(5, 5, 0, 'Outdoor'),
(6, 6, 0, 'Running'),
(7, 7, 0, 'Warmup'),
(8, 8, 0, 'Yoga'),
(9, 9, 0, 'Recreation'),
(10, 10, 0, 'Lounge'),
(11, 11, 0, 'Gym'),
(12, 12, 0, 'Climbing'),
(13, 13, 0, 'Crosstraining'),
(14, 14, 0, 'Post-workout'),
(15, 15, 0, 'Cycling'),
(16, 16, 0, 'Athletic'),
(17, 17, 0, 'Sports'),
(18, 18, 0, 'Hiking'),
(19, 19, 0, 'Overnight'),
(20, 20, 0, 'School'),
(21, 21, 0, 'Trail'),
(22, 22, 0, 'Travel'),
(23, 23, 0, 'Urban'),
(24, 24, 0, 'Backpack'),
(25, 25, 0, 'Luggage'),
(26, 26, 0, 'Duffel'),
(27, 27, 0, 'Messenger'),
(28, 28, 0, 'Laptop'),
(29, 29, 0, 'Exercise'),
(30, 30, 0, 'Tote'),
(31, 31, 0, 'Burlap'),
(32, 32, 0, 'Canvas'),
(33, 33, 0, 'Cotton'),
(34, 34, 0, 'Faux Leather'),
(35, 35, 0, 'Leather'),
(36, 36, 0, 'Mesh'),
(37, 37, 0, 'Nylon'),
(38, 38, 0, 'Polyester'),
(39, 39, 0, 'Rayon'),
(40, 40, 0, 'Ripstop'),
(41, 41, 0, 'Suede'),
(42, 42, 0, 'Foam'),
(43, 43, 0, 'Metal'),
(44, 44, 0, 'Plastic'),
(45, 45, 0, 'Rubber'),
(46, 46, 0, 'Synthetic'),
(47, 47, 0, 'Stainless Steel'),
(48, 48, 0, 'Silicone'),
(61, 61, 0, 'Adjustable'),
(62, 62, 0, 'Cross Body'),
(63, 63, 0, 'Detachable'),
(64, 64, 0, 'Double'),
(65, 65, 0, 'Padded'),
(66, 66, 0, 'Shoulder'),
(67, 67, 0, 'Single'),
(68, 68, 0, 'Telescoping'),
(69, 69, 0, 'Audio Pocket'),
(70, 70, 0, 'Wheeled'),
(71, 71, 0, 'Hydration Pocket'),
(72, 72, 0, 'Audio Pocket'),
(73, 73, 0, 'Flapover'),
(74, 74, 0, 'Waterproof'),
(75, 75, 0, 'Lightweight'),
(76, 76, 0, 'TSA Approved'),
(77, 77, 0, 'Reflective'),
(78, 78, 0, 'Laptop Sleeve'),
(79, 79, 0, 'Lockable'),
(80, 80, 0, 'Men'),
(81, 81, 0, 'Women'),
(82, 82, 0, 'Boys'),
(83, 83, 0, 'Girls'),
(84, 84, 0, 'Unisex'),
(85, 85, 0, 'Cardio'),
(86, 86, 0, 'Electronic'),
(87, 87, 0, 'Exercise'),
(88, 88, 0, 'Fashion'),
(89, 89, 0, 'Hydration'),
(90, 90, 0, 'Timepiece'),
(97, 102, 0, 'Download'),
(98, 103, 0, 'DVD'),
(99, 104, 0, 'Base Layer'),
(100, 105, 0, 'Basic'),
(101, 106, 0, 'Capri'),
(102, 107, 0, 'Compression'),
(103, 108, 0, 'Leggings'),
(104, 109, 0, 'Parachute'),
(105, 110, 0, 'Skort'),
(106, 111, 0, 'Snug'),
(107, 112, 0, 'Sweatpants'),
(108, 113, 0, 'Tights'),
(109, 114, 0, 'Track Pants'),
(110, 115, 0, 'Workout Pants'),
(111, 116, 0, 'Insulated'),
(112, 117, 0, 'Jacket'),
(113, 118, 0, 'Vest'),
(114, 119, 0, 'Lightweight'),
(115, 120, 0, 'Hooded'),
(116, 121, 0, 'Heavy Duty'),
(117, 122, 0, 'Rain Coat'),
(118, 123, 0, 'Hard Shell'),
(119, 124, 0, 'Soft Shell'),
(120, 125, 0, 'Windbreaker'),
(121, 126, 0, '&frac12; zip'),
(122, 127, 0, '&frac14; zip'),
(123, 128, 0, 'Full Zip'),
(124, 129, 0, 'Reversible'),
(125, 130, 0, 'Bra'),
(126, 131, 0, 'Hoodie'),
(127, 132, 0, 'Sweatshirt'),
(128, 133, 0, 'Polo'),
(129, 134, 0, 'Tank'),
(130, 135, 0, 'Tee'),
(131, 136, 0, 'Pullover'),
(132, 137, 0, 'Hoodie'),
(133, 138, 0, 'Cardigan'),
(134, 139, 0, 'Henley'),
(135, 140, 0, 'Tunic'),
(136, 141, 0, 'Camisole'),
(137, 142, 0, 'Cocona&reg; performance fabric'),
(138, 143, 0, 'Wool'),
(139, 144, 0, 'Fleece'),
(140, 145, 0, 'Hemp'),
(141, 146, 0, 'Jersey'),
(142, 147, 0, 'LumaTech&trade;'),
(143, 148, 0, 'Lycra&reg;'),
(144, 149, 0, 'Microfiber'),
(145, 150, 0, 'Spandex'),
(146, 151, 0, 'HeatTec&reg;'),
(147, 152, 0, 'EverCool&trade;'),
(148, 153, 0, 'Organic Cotton'),
(149, 154, 0, 'TENCEL'),
(150, 155, 0, 'CoolTech&trade;'),
(151, 156, 0, 'Khaki'),
(152, 157, 0, 'Linen'),
(153, 158, 0, 'Wool'),
(154, 159, 0, 'Terry'),
(155, 160, 0, 'Sleeve'),
(156, 161, 0, 'Long-Sleeve'),
(157, 162, 0, 'Short-Sleeve'),
(158, 163, 0, 'Sleeveless'),
(159, 164, 0, 'Tank'),
(160, 165, 0, 'Strap'),
(175, 180, 0, 'N/A'),
(176, 181, 0, '? zip'),
(177, 182, 0, 'Boat Neck'),
(178, 183, 0, 'Crew'),
(179, 184, 0, 'Full zip'),
(180, 185, 0, 'V-neck'),
(181, 186, 0, 'Ballet'),
(182, 187, 0, 'Scoop'),
(183, 188, 0, 'High Collar'),
(184, 189, 0, 'Stand Collar'),
(185, 190, 0, 'Roll Neck'),
(186, 191, 0, 'Square Neck'),
(187, 192, 0, 'Color-Blocked'),
(188, 193, 0, 'Checked'),
(189, 194, 0, 'Color-Blocked'),
(190, 195, 0, 'Graphic Print'),
(191, 196, 0, 'Solid'),
(192, 197, 0, 'Solid-Highlight'),
(193, 198, 0, 'Striped'),
(194, 199, 0, 'Camo'),
(195, 200, 0, 'Geometric'),
(196, 201, 0, 'All-Weather'),
(197, 202, 0, 'Cold'),
(198, 203, 0, 'Cool'),
(199, 204, 0, 'Indoor'),
(200, 205, 0, 'Mild'),
(201, 206, 0, 'Rainy'),
(202, 207, 0, 'Spring'),
(203, 208, 0, 'Warm'),
(204, 209, 0, 'Windy'),
(205, 210, 0, 'Wintry'),
(206, 211, 0, 'Hot'),
(207, 49, 0, 'Black'),
(208, 50, 0, 'Blue'),
(209, 51, 0, 'Brown'),
(210, 52, 0, 'Gray'),
(211, 53, 0, 'Green'),
(212, 54, 0, 'Lavender'),
(213, 55, 0, 'Multi'),
(214, 56, 0, 'Orange'),
(215, 57, 0, 'Purple'),
(216, 58, 0, 'Red'),
(217, 59, 0, 'White'),
(218, 60, 0, 'Yellow'),
(219, 91, 0, '55 cm'),
(220, 166, 0, 'XS'),
(221, 92, 0, '65 cm'),
(222, 167, 0, 'S'),
(223, 93, 0, '75 cm'),
(224, 168, 0, 'M'),
(225, 94, 0, '6 foot'),
(226, 169, 0, 'L'),
(227, 95, 0, '8 foot'),
(228, 170, 0, 'XL'),
(229, 96, 0, '10 foot'),
(230, 171, 0, '28'),
(231, 172, 0, '29'),
(232, 173, 0, '30'),
(233, 174, 0, '31'),
(234, 175, 0, '32'),
(235, 176, 0, '33'),
(236, 177, 0, '34'),
(237, 178, 0, '36'),
(238, 179, 0, '38'),
(239, 212, 0, '64G'),
(240, 213, 0, '128G'),
(241, 214, 0, '512G'),
(242, 215, 0, '4G'),
(243, 216, 0, '8G'),
(244, 217, 0, '6G'),
(245, 218, 0, '12G'),
(246, 219, 0, '3/64'),
(247, 220, 0, '4/64'),
(248, 221, 0, '3/128'),
(249, 222, 0, '4/128'),
(250, 223, 0, '6/512');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eav_attribute_option_value`
--
ALTER TABLE `eav_attribute_option_value`
  ADD PRIMARY KEY (`value_id`),
  ADD KEY `EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  ADD KEY `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eav_attribute_option_value`
--
ALTER TABLE `eav_attribute_option_value`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=251;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
