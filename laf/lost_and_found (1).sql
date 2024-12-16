-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2024 at 03:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `lost_and_found`

-- Table structure for table `admin_info`
CREATE TABLE `admin_info` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `admin_info` (`id`, `username`, `password`) VALUES
(1, 'adminISUCC', 'scrypt:32768:8:1$1yJcPq3R2XStpDW6$d40c892aa527c2518ed78b6feb7a215c0c0235d5e0ea7d4e45dc2eeba0b218f2b4eb555e134e98357d1cfe62dfe24cb3a79dfa5f0202a71ec37b6b7d0af0b3c4');

-- Table structure for table `claims`
CREATE TABLE `claims` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `claimer_name` varchar(255) NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `status` enum('pending','confirmed') DEFAULT 'pending',
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `claims` (`id`, `item_id`, `claimer_name`, `contact_info`, `status`, `message`) VALUES
(5, 15, 'phone', 'no', 'confirmed', 'pakibalik please');

-- Table structure for table `items`
CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('published','claimed') DEFAULT 'published',
  `location` varchar(255) NOT NULL,
  `date_found` date NOT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `items` (`id`, `item_name`, `description`, `status`, `location`, `date_found`, `image_path`) VALUES
(13, 'Tumbler', 'Khaki Tumbler', 'published', 'IT Building Rm 204', '2024-12-04', 'tumbler.jpg'),
(14, 'Umbrella', 'Brown folded', 'published', 'IT Building Hallway First Floor', '2024-12-04', 'umbrella.jpg'),
(15, 'Phone', 'white iphone', 'claimed', 'RMB Hallway', '2024-12-04', 'phone1.jpg'),
(16, 'Keys', 'Different key with no keychain', 'published', 'IT Room 303', '2024-12-04', 'keys.jpg'),
(17, 'freska tuna', 'ulam ni mharian', 'published', 'San Mateo', '2024-12-05', 'cute.png');

-- Indexes for dumped tables
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `claims`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT for dumped tables
ALTER TABLE `admin_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `claims`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

-- Constraints for dumped tables
ALTER TABLE `claims`
  ADD CONSTRAINT `claims_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
