-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2022 at 05:40 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_base_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `events_type`
--

CREATE TABLE `events_type` (
  `ID_EventType` varchar(11) NOT NULL,
  `Event_Type_Name` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events_type`
--

INSERT INTO `events_type` (`ID_EventType`, `Event_Type_Name`) VALUES
('ET00001', 'คอนเสิร์ต'),
('ET00002', 'งานแสดงศิลปะ'),
('ET00003', 'อีเวนท์');

-- --------------------------------------------------------

--
-- Table structure for table `event_s`
--

CREATE TABLE `event_s` (
  `ID_Event` varchar(11) NOT NULL,
  `event_name` varchar(256) DEFAULT NULL,
  `event_type` varchar(11) NOT NULL,
  `event_round` int(11) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `show_time_start` time DEFAULT NULL,
  `show_time_end` time DEFAULT NULL,
  `total_showtime` time GENERATED ALWAYS AS (`show_time_end` - `show_time_start`) VIRTUAL,
  `ID_Location` varchar(11) NOT NULL,
  `event_status` varchar(10) DEFAULT NULL,
  `image_addr` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_s`
--

INSERT INTO `event_s` (`ID_Event`, `event_name`, `event_type`, `event_round`, `event_date`, `show_time_start`, `show_time_end`, `ID_Location`, `event_status`, `image_addr`) VALUES
('E00001', 'Tilly birds concert', 'ET00001', 1, '2022-04-22', '12:00:00', '14:00:00', 'L00001', 'D', 'images/E00001.jpg'),
('E00002', 'งานเปิดตัวหนังสือ \"ในหนังมีศิลปะ\"', 'ET00002', 1, '2022-04-23', '13:00:00', '16:00:00', 'L00002', 'D', 'images/E00002.jpg'),
('E00003', 'Thailand Mobile Expo 2022', 'ET00003', 1, '2022-05-12', '09:00:00', '16:00:00', 'L00003', 'D', 'images/E00003.jpg'),
('E00004', 'BTS concert', 'ET00001', 1, '2022-04-10', '18:00:00', '20:00:00', 'L00001', 'D', 'images/E00004.jpg'),
('E00005', 'ROAD TO PARADISEFEST', 'ET00003', 1, '2022-05-01', '12:00:00', '14:00:00', 'L00004', 'O', 'images/E00005.jpeg'),
('E00006', 'Tilly Birds Live In 2SIS', 'ET00001', 1, '2022-05-11', '18:00:00', '20:00:00', 'L00005', 'O', 'images/tilly.jpg'),
('E00007', 'Yesterday', 'ET00002', 1, '2022-04-28', '14:00:00', '17:00:00', 'L00006', 'O', 'images/yesterday.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `ID_Location` varchar(11) NOT NULL,
  `loc_name` varchar(256) DEFAULT NULL,
  `loc_people_capacity` varchar(256) DEFAULT NULL,
  `loc_building_type` varchar(100) DEFAULT NULL,
  `loc_owner_name` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`ID_Location`, `loc_name`, `loc_people_capacity`, `loc_building_type`, `loc_owner_name`) VALUES
('L00001', 'IMPACT Arena เมืองทองธานี', '12000', 'IMPACT', 'อาคารสำหรับงานแสดง'),
('L00002', 'หอศิลปวัฒนธรรมแห่งกรุงเทพมหานคร', '2000', 'นางกอบกาญจน์  วัฒนวรางกูร', 'หอศิลป์'),
('L00003', 'ไบเทค บางนา', '100000', 'BITEC', 'ศูนย์ประชุมและ ศูนย์แสดงสินค้า'),
('L00004', 'Lido connect 3', '320', 'ห้องจัดแสดงงานอีเวนท์', 'Lido'),
('L00005', '2SIS Easy Restaurant', '150', 'ร้านอาหาร', '2SIS'),
('L00006', 'โรงละคอนแห่งมหาวิทยาลัยธรรมศาสตร์', '500', 'โรงละคอน', 'มหาวิทยาลัยธรรมศาสตร์');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `ID_Member` varchar(11) NOT NULL,
  `userID` varchar(11) DEFAULT NULL,
  `Type_in_out` varchar(1) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`ID_Member`, `userID`, `Type_in_out`, `time_stamp`) VALUES
('M00001', 'user1', 'I', '2022-04-23 05:04:01'),
('M00001', 'user1', 'O', '2022-04-23 06:40:41'),
('M00001', 'user1', 'I', '2022-05-02 08:14:10'),
('M00001', 'user1', 'O', '2022-05-02 08:14:13'),
('M00001', 'user1', 'I', '2022-05-02 08:16:30'),
('M00001', 'user1', 'O', '2022-05-02 08:16:39'),
('M00001', 'user1', 'I', '2022-05-02 08:17:11'),
('M00001', 'user1', 'O', '2022-05-02 08:17:17'),
('M00001', 'user1', 'I', '2022-05-02 08:27:17'),
('M00001', 'user1', 'I', '2022-05-02 08:27:23'),
('M00001', 'user1', 'I', '2022-05-02 08:27:30'),
('M00001', 'user1', 'I', '2022-05-02 08:27:35'),
('M00001', 'user1', 'O', '2022-05-02 08:27:37'),
('M00001', 'user1', 'I', '2022-05-02 13:34:02'),
('M00001', 'user1', 'I', '2022-05-02 15:23:22'),
('M00001', 'user1', 'O', '2022-05-02 15:23:25'),
('M00001', 'user1', 'I', '2022-05-02 17:45:58'),
('M00001', 'user1', 'I', '2022-05-02 18:33:13'),
('M00001', 'user1', 'I', '2022-05-02 18:38:21'),
('M00001', 'user1', 'I', '2022-05-02 18:39:04'),
('M00001', 'user1', 'O', '2022-05-02 18:39:06'),
('M00001', 'user1', 'I', '2022-05-03 02:29:50'),
('M00001', 'user1', 'I', '2022-05-03 02:40:29'),
('M00001', 'user1', 'I', '2022-05-03 02:48:18'),
('M00001', 'user1', 'I', '2022-05-03 02:48:25'),
('M00001', 'user1', 'I', '2022-05-03 02:53:31'),
('M00001', 'user1', 'I', '2022-05-03 02:54:17'),
('M00001', 'user1', 'I', '2022-05-03 02:55:48'),
('M00001', 'user1', 'I', '2022-05-03 03:06:53'),
('M00001', 'user1', 'I', '2022-05-03 03:09:40'),
('M00001', 'user1', 'I', '2022-05-03 03:10:49'),
('M00001', 'user1', 'I', '2022-05-03 03:11:01'),
('M00001', 'user1', 'I', '2022-05-03 04:27:55'),
('M00001', 'user1', 'I', '2022-05-03 05:21:00'),
('M00001', 'user1', 'I', '2022-05-03 05:21:42'),
('M00001', 'user1', 'I', '2022-05-03 05:23:27'),
('M00001', 'user1', 'I', '2022-05-03 05:44:59'),
('M00001', 'user1', 'I', '2022-05-03 05:48:40'),
('M00001', 'user1', 'I', '2022-05-03 05:48:47'),
('M00001', 'user1', 'I', '2022-05-03 05:54:32'),
('M00001', 'user1', 'I', '2022-05-03 05:54:39'),
('M00001', 'user1', 'I', '2022-05-03 05:56:45'),
('M00001', 'user1', 'I', '2022-05-03 06:12:52'),
('M00001', 'user1', 'I', '2022-05-03 06:18:45'),
('M00001', 'user1', 'O', '2022-05-03 06:18:48'),
('M00001', 'user1', 'I', '2022-05-03 06:19:03'),
('M00001', 'user1', 'I', '2022-05-03 06:19:51'),
('M00001', 'user1', 'I', '2022-05-03 06:20:28'),
('M00001', 'user1', 'I', '2022-05-03 06:20:57'),
('M00001', 'user1', 'I', '2022-05-03 06:21:34'),
('M00001', 'user1', 'I', '2022-05-03 06:22:09'),
('M00001', 'user1', 'I', '2022-05-03 06:22:18'),
('M00001', 'user1', 'I', '2022-05-03 06:22:27'),
('M00001', 'user1', 'I', '2022-05-03 06:24:35'),
('M00001', 'user1', 'I', '2022-05-03 06:25:04'),
('M00001', 'user1', 'I', '2022-05-03 06:26:01'),
('M00001', 'user1', 'I', '2022-05-03 06:26:24'),
('M00001', 'user1', 'I', '2022-05-03 06:26:32'),
('M00001', 'user1', 'I', '2022-05-03 06:29:02'),
('M00001', 'user1', 'I', '2022-05-03 06:29:27'),
('M00001', 'user1', 'I', '2022-05-03 06:29:56'),
('M00001', 'user1', 'I', '2022-05-03 06:34:00'),
('M00001', 'user1', 'I', '2022-05-03 06:34:05'),
('M00001', 'user1', 'I', '2022-05-03 06:34:11'),
('M00001', 'user1', 'I', '2022-05-03 06:34:20'),
('M00001', 'user1', 'I', '2022-05-03 06:38:22'),
('M00001', 'user1', 'I', '2022-05-03 06:38:28'),
('M00001', 'user1', 'I', '2022-05-03 06:38:54'),
('M00001', 'user1', 'I', '2022-05-03 06:38:58'),
('M00001', 'user1', 'I', '2022-05-03 06:41:54'),
('M00001', 'user1', 'I', '2022-05-03 06:42:00'),
('M00001', 'user1', 'I', '2022-05-03 06:42:09'),
('M00001', 'user1', 'I', '2022-05-03 06:42:16'),
('M00001', 'user1', 'I', '2022-05-03 06:42:38'),
('M00001', 'user1', 'I', '2022-05-03 06:45:55'),
('M00001', 'user1', 'I', '2022-05-03 06:46:00'),
('M00001', 'user1', 'I', '2022-05-03 06:46:06'),
('M00001', 'user1', 'I', '2022-05-03 06:46:39'),
('M00001', 'user1', 'I', '2022-05-03 06:46:44'),
('M00001', 'user1', 'I', '2022-05-03 06:48:29'),
('M00001', 'user1', 'I', '2022-05-03 06:48:34'),
('M00001', 'user1', 'I', '2022-05-03 06:48:43'),
('M00001', 'user1', 'I', '2022-05-03 06:48:52'),
('M00001', 'user1', 'I', '2022-05-03 06:50:58'),
('M00001', 'user1', 'I', '2022-05-03 06:52:27'),
('M00001', 'user1', 'I', '2022-05-03 06:52:43'),
('M00001', 'user1', 'I', '2022-05-03 06:54:33'),
('M00001', 'user1', 'I', '2022-05-03 06:54:41'),
('M00001', 'user1', 'I', '2022-05-03 06:55:42'),
('M00001', 'user1', 'I', '2022-05-03 06:57:17'),
('M00001', 'user1', 'I', '2022-05-03 06:57:26'),
('M00001', 'user1', 'I', '2022-05-03 06:57:31'),
('M00001', 'user1', 'I', '2022-05-03 07:02:27'),
('M00001', 'user1', 'O', '2022-05-03 07:02:46'),
('M00001', 'user1', 'I', '2022-05-03 07:10:26'),
('M00001', 'user1', 'I', '2022-05-03 07:13:02'),
('M00001', 'user1', 'I', '2022-05-03 07:13:17'),
('M00001', 'user1', 'I', '2022-05-03 07:18:07'),
('M00001', 'user1', 'I', '2022-05-03 07:18:11'),
('M00001', 'user1', 'I', '2022-05-03 07:19:37'),
('M00001', 'user1', 'I', '2022-05-03 07:19:48'),
('M00001', 'user1', 'I', '2022-05-03 07:23:34'),
('M00001', 'user1', 'I', '2022-05-03 07:25:30'),
('M00001', 'user1', 'I', '2022-05-03 07:25:46'),
('M00001', 'user1', 'I', '2022-05-03 07:25:51'),
('M00001', 'user1', 'I', '2022-05-03 07:26:03'),
('M00001', 'user1', 'I', '2022-05-03 07:32:16'),
('M00001', 'user1', 'I', '2022-05-03 07:32:48'),
('M00001', 'user1', 'I', '2022-05-03 07:33:04'),
('M00001', 'user1', 'I', '2022-05-03 07:33:08'),
('M00001', 'user1', 'I', '2022-05-03 07:36:33'),
('M00001', 'user1', 'I', '2022-05-03 07:36:48'),
('M00001', 'user1', 'I', '2022-05-03 07:38:52'),
('M00001', 'user1', 'I', '2022-05-03 07:38:57'),
('M00001', 'user1', 'I', '2022-05-03 07:39:08'),
('M00001', 'user1', 'I', '2022-05-03 07:42:02'),
('M00001', 'user1', 'I', '2022-05-03 07:42:42'),
('M00001', 'user1', 'I', '2022-05-03 07:42:47'),
('M00001', 'user1', 'I', '2022-05-03 07:43:26'),
('M00001', 'user1', 'I', '2022-05-03 07:44:03'),
('M00001', 'user1', 'I', '2022-05-03 08:06:51'),
('M00001', 'user1', 'O', '2022-05-03 08:06:54'),
('M00001', 'user1', 'I', '2022-05-03 08:08:27'),
('M00001', 'user1', 'I', '2022-05-03 08:09:26'),
('M00001', 'user1', 'I', '2022-05-03 08:10:00'),
('M00001', 'user1', 'I', '2022-05-03 08:10:43'),
('M00001', 'user1', 'I', '2022-05-03 08:10:59'),
('M00001', 'user1', 'I', '2022-05-03 08:11:21'),
('M00001', 'user1', 'I', '2022-05-03 08:11:29'),
('M00001', 'user1', 'I', '2022-05-03 08:11:35'),
('M00001', 'user1', 'I', '2022-05-03 08:11:50'),
('M00001', 'user1', 'I', '2022-05-03 08:14:07'),
('M00001', 'user1', 'I', '2022-05-03 08:14:26'),
('M00001', 'user1', 'I', '2022-05-03 08:17:53'),
('M00001', 'user1', 'I', '2022-05-03 08:18:38'),
('M00001', 'user1', 'I', '2022-05-03 08:19:01'),
('M00001', 'user1', 'O', '2022-05-03 08:19:08'),
('M00001', 'user1', 'I', '2022-05-03 08:41:45'),
('M00001', 'user1', 'I', '2022-05-03 08:41:51'),
('M00001', 'user1', 'I', '2022-05-03 08:42:36'),
('M00001', 'user1', 'I', '2022-05-03 14:40:55'),
('M00001', 'user1', 'I', '2022-05-03 14:41:00'),
('M00001', 'user1', 'I', '2022-05-03 14:41:16'),
('M00001', 'user1', 'I', '2022-05-03 14:41:28'),
('M00001', 'user1', 'I', '2022-05-03 14:41:48'),
('M00001', 'user1', 'I', '2022-05-03 14:48:37'),
('M00001', 'user1', 'O', '2022-05-03 14:48:39'),
('M00001', 'user1', 'I', '2022-05-03 15:18:29'),
('M00001', 'user1', 'I', '2022-05-03 15:18:49'),
('M00001', 'user1', 'O', '2022-05-03 15:18:51'),
('M00002', 'user2', 'I', '2022-04-23 06:20:51'),
('M00002', 'user2', 'O', '2022-04-23 08:50:31'),
('M00002', 'user2', 'I', '2022-05-02 18:39:15'),
('M00002', 'user2', 'I', '2022-05-02 18:39:19'),
('M00002', 'user2', 'I', '2022-05-02 18:41:23'),
('M00002', 'user2', 'I', '2022-05-02 18:41:31'),
('M00002', 'user2', 'I', '2022-05-02 18:41:57'),
('M00002', 'user2', 'I', '2022-05-02 18:42:20'),
('M00002', 'user2', 'I', '2022-05-02 18:42:26'),
('M00002', 'user2', 'I', '2022-05-03 07:03:21'),
('M00002', 'user2', 'I', '2022-05-03 07:06:33'),
('M00002', 'user2', 'I', '2022-05-03 07:06:52'),
('M00002', 'user2', 'I', '2022-05-03 07:08:41'),
('M00002', 'user2', 'I', '2022-05-03 07:10:08'),
('M00002', 'user2', 'O', '2022-05-03 07:10:10'),
('M00002', 'user2', 'I', '2022-05-03 08:20:39'),
('M00002', 'user2', 'I', '2022-05-03 08:21:20'),
('M00002', 'user2', 'I', '2022-05-03 08:22:09'),
('M00002', 'user2', 'O', '2022-05-03 08:22:22'),
('M00002', 'user2', 'I', '2022-05-03 13:19:17'),
('M00002', 'user2', 'I', '2022-05-03 13:19:56'),
('M00002', 'user2', 'I', '2022-05-03 13:20:03'),
('M00002', 'user2', 'I', '2022-05-03 13:20:10'),
('M00002', 'user2', 'I', '2022-05-03 14:23:05'),
('M00002', 'user2', 'O', '2022-05-03 14:23:17'),
('M00002', 'user2', 'I', '2022-05-03 14:23:42'),
('M00002', 'user2', 'I', '2022-05-03 14:23:59'),
('M00002', 'user2', 'I', '2022-05-03 14:25:37'),
('M00002', 'user2', 'I', '2022-05-03 14:25:57'),
('M00002', 'user2', 'I', '2022-05-03 14:26:02'),
('M00002', 'user2', 'I', '2022-05-03 14:26:08'),
('M00002', 'user2', 'I', '2022-05-03 14:28:59'),
('M00002', 'user2', 'I', '2022-05-03 14:29:23'),
('M00002', 'user2', 'I', '2022-05-03 14:31:42'),
('M00002', 'user2', 'I', '2022-05-03 14:31:47'),
('M00002', 'user2', 'I', '2022-05-03 14:32:02'),
('M00002', 'user2', 'I', '2022-05-03 14:40:45'),
('M00002', 'user2', 'O', '2022-05-03 14:40:47'),
('M00002', 'user2', 'I', '2022-05-03 14:49:07'),
('M00002', 'user2', 'I', '2022-05-03 15:07:59'),
('M00002', 'user2', 'O', '2022-05-03 15:08:06'),
('M00002', 'user2', 'I', '2022-05-03 15:08:52'),
('M00002', 'user2', 'I', '2022-05-03 15:09:03'),
('M00002', 'user2', 'I', '2022-05-03 15:15:40'),
('M00002', 'user2', 'I', '2022-05-03 15:15:51'),
('M00002', 'user2', 'I', '2022-05-03 15:15:57'),
('M00002', 'user2', 'O', '2022-05-03 15:16:32'),
('M00002', 'user2', 'I', '2022-05-03 15:16:42'),
('M00002', 'user2', 'I', '2022-05-03 15:16:47'),
('M00002', 'user2', 'I', '2022-05-03 15:16:55'),
('M00002', 'user2', 'O', '2022-05-03 15:16:57'),
('M00002', 'user2', 'I', '2022-05-03 15:19:00'),
('M00002', 'user2', 'I', '2022-05-03 15:19:12'),
('M00002', 'user2', 'O', '2022-05-03 15:19:14'),
('M00002', 'user2', 'I', '2022-05-03 15:27:23'),
('M00002', 'user2', 'I', '2022-05-03 15:27:59'),
('M00002', 'user2', 'I', '2022-05-03 15:28:06'),
('M00002', 'user2', 'I', '2022-05-03 15:34:01'),
('M00002', 'user2', 'I', '2022-05-03 15:37:17'),
('M00002', 'user2', 'I', '2022-05-03 15:37:25'),
('M00002', 'user2', 'O', '2022-05-03 15:39:56'),
('M00003', 'user3', 'I', '2022-04-23 08:30:21'),
('M00004', 'plaipmc', 'I', '2022-05-02 15:28:00'),
('M00004', 'plaipmc', 'I', '2022-05-02 16:10:14'),
('M00004', 'plaipmc', 'O', '2022-05-02 16:34:10'),
('M00004', 'plaipmc', 'I', '2022-05-02 16:34:26'),
('M00004', 'plaipmc', 'I', '2022-05-02 16:55:28'),
('M00004', 'plaipmc', 'I', '2022-05-02 16:56:38'),
('M00004', 'plaipmc', 'I', '2022-05-02 16:57:57'),
('M00004', 'plaipmc', 'I', '2022-05-02 17:00:08'),
('M00004', 'plaipmc', 'I', '2022-05-02 17:04:15'),
('M00004', 'plaipmc', 'I', '2022-05-02 17:05:32'),
('M00004', 'plaipmc', 'I', '2022-05-02 17:06:00'),
('M00004', 'plaipmc', 'I', '2022-05-02 17:38:20'),
('M00004', 'plaipmc', 'I', '2022-05-02 17:45:48'),
('M00004', 'plaipmc', 'O', '2022-05-02 17:45:49');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `ID_Member` varchar(11) NOT NULL,
  `CitizenID` bigint(13) DEFAULT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `fname` varchar(256) DEFAULT NULL,
  `lname` varchar(256) DEFAULT NULL,
  `mem_birthdate` date DEFAULT NULL,
  `userID` varchar(11) DEFAULT NULL,
  `User_pass` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`ID_Member`, `CitizenID`, `prefix`, `fname`, `lname`, `mem_birthdate`, `userID`, `User_pass`) VALUES
('M00001', 1100401040101, 'นาย', 'ธำรง', 'ทรงไว้', '2001-04-04', 'user1', 'pass1'),
('M00002', 1100401040102, 'นางสาว', 'กนกพร', 'ทองประเสริฐ', '1998-01-20', 'user2', 'pass2'),
('M00003', 1100401040103, 'นาง', 'ชลลดา', 'ลูกคลื่น', '1980-12-12', 'user3', 'pass3'),
('M00004', 1100401067421, 'หญิง', 'Pamica', 'Srimora', '2022-05-02', 'plaipmc', 'plai0401');

-- --------------------------------------------------------

--
-- Table structure for table `member_address`
--

CREATE TABLE `member_address` (
  `ID_Member` varchar(11) NOT NULL,
  `Address_name` varchar(256) NOT NULL,
  `Address_house_num` varchar(10) DEFAULT NULL,
  `Address_road` varchar(256) DEFAULT NULL,
  `Address_province` varchar(256) DEFAULT NULL,
  `Address_district` varchar(256) DEFAULT NULL,
  `Address_postel_code` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member_address`
--

INSERT INTO `member_address` (`ID_Member`, `Address_name`, `Address_house_num`, `Address_road`, `Address_province`, `Address_district`, `Address_postel_code`) VALUES
('M00001', 'บ้าน', '12', 'ใต้', 'กทม.', 'จตุจักร', 10900),
('M00001', 'มอ', '1', 'เหนือ', 'กทม.', 'คลองเตย', 10110),
('M00002', 'บ้าน', '2', 'ออก', 'กทม.', 'บางมด', 10150),
('M00003', 'บ้าน', '3', 'ตก', 'กทม.', 'ดินแดง', 10400),
('M00004', 'บ้าน', '129/30', '-', '-', 'กทม.', 10210);

-- --------------------------------------------------------

--
-- Table structure for table `member_age`
--

CREATE TABLE `member_age` (
  `ID_Member` varchar(11) NOT NULL,
  `Member_Age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member_age`
--

INSERT INTO `member_age` (`ID_Member`, `Member_Age`) VALUES
('M00001', 21),
('M00002', 24),
('M00003', 41);

-- --------------------------------------------------------

--
-- Table structure for table `member_bank_account`
--

CREATE TABLE `member_bank_account` (
  `ID_Member` varchar(11) NOT NULL,
  `acc_number` bigint(11) NOT NULL,
  `acc_name` varchar(256) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member_bank_account`
--

INSERT INTO `member_bank_account` (`ID_Member`, `acc_number`, `acc_name`, `bank_name`) VALUES
('M00001', 1111111111, 'นายธำรง ทรงไว้', 'กรุงไทย'),
('M00002', 2222222222, 'นางสาวกนกพร ทองประเสริฐ', 'พร้อมเพย์'),
('M00003', 3333333333, 'นางชลลดา ลูกคลื่น', 'กรุุงเทพ');

-- --------------------------------------------------------

--
-- Table structure for table `member_phone`
--

CREATE TABLE `member_phone` (
  `ID_Member` varchar(11) NOT NULL,
  `PhoneNumber` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member_phone`
--

INSERT INTO `member_phone` (`ID_Member`, `PhoneNumber`) VALUES
('M00001', 911111111),
('M00001', 912222222),
('M00002', 921234567),
('M00003', 938765432),
('M00004', 811369932);

-- --------------------------------------------------------

--
-- Table structure for table `merchandise`
--

CREATE TABLE `merchandise` (
  `ID_Mer` varchar(11) NOT NULL,
  `mer_color` varchar(20) DEFAULT NULL,
  `mer_name` varchar(256) DEFAULT NULL,
  `mer_type` varchar(11) NOT NULL,
  `mer_price` int(10) DEFAULT NULL,
  `addr_image_mer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `merchandise`
--

INSERT INTO `merchandise` (`ID_Mer`, `mer_color`, `mer_name`, `mer_type`, `mer_price`, `addr_image_mer`) VALUES
('MER00001', 'สีดำ', 'กำไลวง TILLY BIRDS 1', 'MT00001', 1890, 'images/tb-charm.jpg'),
('MER00002', 'สีดำ', 'กำไลวง TILLY BIRDS 2', 'MT00001', 1890, 'images/tb-charm2.jpg'),
('MER00003', 'สีดำ', 'แท่งไฟวง TILLY BIRDS', 'MT00004', 500, 'images/tb-light.jpg'),
('MER00004', 'สีดำ', 'เสื้อวง TILLY BIRDS', 'MT00002', 240, 'images/tb-tshirt.jpg'),
('MER00005', 'สีดำ', 'ALBUM TILLY BIRDS', 'MT00003', 360, 'images/tb-album.jpg'),
('MER00006', 'สีดำ', 'POSTER TILLY BIRDS', 'MT00005', 499, 'images/tb-poster.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `merchandise_stock`
--

CREATE TABLE `merchandise_stock` (
  `ID_Mer` varchar(11) NOT NULL,
  `mer_qty` int(11) DEFAULT NULL,
  `update_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `merchandise_stock`
--

INSERT INTO `merchandise_stock` (`ID_Mer`, `mer_qty`, `update_date`) VALUES
('MER00001', 100, '2022-05-03'),
('MER00002', 94, '2022-05-03'),
('MER00003', 98, '2022-05-03'),
('MER00004', 98, '2022-05-03'),
('MER00005', 97, '2022-05-03'),
('MER00006', 100, '2022-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `merchandise_type`
--

CREATE TABLE `merchandise_type` (
  `ID_mer_type` varchar(11) NOT NULL,
  `mer_type` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `merchandise_type`
--

INSERT INTO `merchandise_type` (`ID_mer_type`, `mer_type`) VALUES
('MT00001', 'เครื่องประดับ'),
('MT00002', 'เสื้อผ้า'),
('MT00003', 'Album'),
('MT00004', 'แท่งไฟ'),
('MT00005', 'Poster');

-- --------------------------------------------------------

--
-- Table structure for table `order_mer_detail`
--

CREATE TABLE `order_mer_detail` (
  `ID_Order` varchar(11) NOT NULL,
  `ID_Mer` varchar(11) NOT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` int(11) GENERATED ALWAYS AS (`unit_price` * `quantity`) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_mer_detail`
--

INSERT INTO `order_mer_detail` (`ID_Order`, `ID_Mer`, `unit_price`, `quantity`) VALUES
('OR00001', 'MER00001', 500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_payment`
--

CREATE TABLE `order_payment` (
  `Payment_ID` varchar(11) NOT NULL,
  `ID_Order` varchar(11) NOT NULL,
  `ID_Member` varchar(11) NOT NULL,
  `payment_date_time` datetime DEFAULT NULL,
  `payment_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_payment`
--

INSERT INTO `order_payment` (`Payment_ID`, `ID_Order`, `ID_Member`, `payment_date_time`, `payment_amount`) VALUES
('OP00001', 'OR00001', 'M00001', '2022-04-23 12:50:00', 500);

-- --------------------------------------------------------

--
-- Table structure for table `order_s`
--

CREATE TABLE `order_s` (
  `ID_Order` varchar(11) NOT NULL,
  `ID_Member` varchar(11) NOT NULL,
  `CCstatus` varchar(1) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Shipping_date` date DEFAULT NULL,
  `Shipping_Address` varchar(256) DEFAULT NULL,
  `Tracking_Num` varchar(20) DEFAULT NULL,
  `Order_Status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_s`
--

INSERT INTO `order_s` (`ID_Order`, `ID_Member`, `CCstatus`, `order_date`, `Shipping_date`, `Shipping_Address`, `Tracking_Num`, `Order_Status`) VALUES
('OR00001', 'M00001', '-', '2022-04-23 05:40:00', '0000-00-00', 'บ้าน', '-', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `seat_reserve`
--

CREATE TABLE `seat_reserve` (
  `ID_Seat` varchar(11) NOT NULL,
  `ID_Location` varchar(11) NOT NULL,
  `Seat_number` int(11) DEFAULT NULL,
  `Seat_price` int(11) DEFAULT NULL,
  `Seat_zone` varchar(3) DEFAULT NULL,
  `Seat_status` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seat_reserve`
--

INSERT INTO `seat_reserve` (`ID_Seat`, `ID_Location`, `Seat_number`, `Seat_price`, `Seat_zone`, `Seat_status`) VALUES
('SR00001', 'L00001', 1, 750, 'A', 'R'),
('SR00002', 'L00002', 2, 750, 'A', 'A'),
('SR00003', 'L00003', 1, 1200, '-', 'A'),
('SRL400001', 'L00004', 1, 499, 'ATD', 'A'),
('SRL400002', 'L00004', 2, 499, 'ATD', 'A'),
('SRL400003', 'L00004', 3, 499, 'ATD', 'A'),
('SRL400004', 'L00004', 4, 499, 'ATD', 'A'),
('SRL400005', 'L00004', 5, 499, 'ATD', 'A'),
('SRL400006', 'L00004', 6, 499, 'ATD', 'A'),
('SRL400007', 'L00004', 7, 499, 'ATD', 'A'),
('SRL400008', 'L00004', 8, 499, 'ATD', 'A'),
('SRL400009', 'L00004', 9, 499, 'ATD', 'A'),
('SRL400010', 'L00004', 1, 399, 'EB', 'A'),
('SRL400011', 'L00004', 2, 399, 'EB', 'A'),
('SRL400012', 'L00004', 3, 399, 'EB', 'A'),
('SRL400013', 'L00004', 4, 399, 'EB', 'A'),
('SRL400014', 'L00004', 5, 399, 'EB', 'A'),
('SRL400015', 'L00004', 6, 399, 'EB', 'A'),
('SRL400016', 'L00004', 7, 399, 'EB', 'A'),
('SRL400017', 'L00004', 8, 399, 'EB', 'A'),
('SRL50001', 'L00005', 1, 750, 'A', 'A'),
('SRL50002', 'L00005', 2, 750, 'A', 'A'),
('SRL50003', 'L00005', 3, 750, 'A', 'A'),
('SRL50004', 'L00005', 4, 750, 'A', 'A'),
('SRL50005', 'L00005', 5, 750, 'A', 'A'),
('SRL50006', 'L00005', 1, 550, 'B', 'A'),
('SRL50007', 'L00005', 2, 550, 'B', 'A'),
('SRL50008', 'L00005', 3, 550, 'B', 'A'),
('SRL50009', 'L00005', 4, 550, 'B', 'A'),
('SRL50010', 'L00005', 5, 550, 'B', 'A'),
('SRL60001', 'L00006', 1, 150, '', 'A'),
('SRL60002', 'L00006', 2, 150, '', 'A'),
('SRL60003', 'L00006', 3, 150, '', 'A'),
('SRL60004', 'L00006', 4, 150, '', 'A'),
('SRL60005', 'L00006', 5, 150, '', 'A'),
('SRL60006', 'L00006', 6, 150, '', 'A'),
('SRL60007', 'L00006', 7, 150, '', 'A'),
('SRL60008', 'L00006', 8, 150, '', 'A'),
('SRL60009', 'L00006', 9, 150, '', 'A'),
('SRL60010', 'L00006', 10, 150, '', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ID_Ticket` varchar(11) NOT NULL,
  `ID_Member` varchar(11) NOT NULL,
  `ID_Event` varchar(11) NOT NULL,
  `ID_Seat` varchar(11) DEFAULT NULL,
  `CCstatus` varchar(1) DEFAULT NULL,
  `booking_date` timestamp NULL DEFAULT NULL,
  `Ticket_Status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ID_Ticket`, `ID_Member`, `ID_Event`, `ID_Seat`, `CCstatus`, `booking_date`, `Ticket_Status`) VALUES
('T00001', 'M00001', 'E00001', 'SR00001', 'N', '2022-04-23 06:10:21', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_payment`
--

CREATE TABLE `ticket_payment` (
  `Payment_ID` varchar(11) NOT NULL,
  `ID_Ticket` varchar(11) NOT NULL,
  `ID_Member` varchar(11) NOT NULL,
  `payment_date_time` datetime DEFAULT NULL,
  `payment_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket_payment`
--

INSERT INTO `ticket_payment` (`Payment_ID`, `ID_Ticket`, `ID_Member`, `payment_date_time`, `payment_amount`) VALUES
('TP00001', 'T00001', 'M00001', '2022-04-23 13:20:21', 750);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events_type`
--
ALTER TABLE `events_type`
  ADD PRIMARY KEY (`ID_EventType`);

--
-- Indexes for table `event_s`
--
ALTER TABLE `event_s`
  ADD PRIMARY KEY (`ID_Event`),
  ADD KEY `ID_Location` (`ID_Location`),
  ADD KEY `event_type` (`event_type`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`ID_Location`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`ID_Member`,`time_stamp`) USING BTREE,
  ADD UNIQUE KEY `timestamp` (`time_stamp`) USING BTREE;

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`ID_Member`),
  ADD UNIQUE KEY `CitizenID` (`CitizenID`),
  ADD UNIQUE KEY `userID` (`userID`);

--
-- Indexes for table `member_address`
--
ALTER TABLE `member_address`
  ADD PRIMARY KEY (`ID_Member`,`Address_name`);

--
-- Indexes for table `member_age`
--
ALTER TABLE `member_age`
  ADD PRIMARY KEY (`ID_Member`);

--
-- Indexes for table `member_bank_account`
--
ALTER TABLE `member_bank_account`
  ADD PRIMARY KEY (`ID_Member`,`acc_number`);

--
-- Indexes for table `member_phone`
--
ALTER TABLE `member_phone`
  ADD PRIMARY KEY (`ID_Member`,`PhoneNumber`);

--
-- Indexes for table `merchandise`
--
ALTER TABLE `merchandise`
  ADD PRIMARY KEY (`ID_Mer`),
  ADD KEY `mer_type` (`mer_type`);

--
-- Indexes for table `merchandise_stock`
--
ALTER TABLE `merchandise_stock`
  ADD PRIMARY KEY (`ID_Mer`);

--
-- Indexes for table `merchandise_type`
--
ALTER TABLE `merchandise_type`
  ADD PRIMARY KEY (`ID_mer_type`);

--
-- Indexes for table `order_mer_detail`
--
ALTER TABLE `order_mer_detail`
  ADD PRIMARY KEY (`ID_Order`,`ID_Mer`),
  ADD KEY `ID_Mer` (`ID_Mer`);

--
-- Indexes for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `ID_Order` (`ID_Order`),
  ADD KEY `order_payment_fk_mem` (`ID_Member`);

--
-- Indexes for table `order_s`
--
ALTER TABLE `order_s`
  ADD PRIMARY KEY (`ID_Order`),
  ADD KEY `order_s_fk_mem` (`ID_Member`);

--
-- Indexes for table `seat_reserve`
--
ALTER TABLE `seat_reserve`
  ADD PRIMARY KEY (`ID_Seat`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ID_Ticket`),
  ADD KEY `ID_Event` (`ID_Event`),
  ADD KEY `ID_Seat` (`ID_Seat`),
  ADD KEY `ticket_fk_mem` (`ID_Member`);

--
-- Indexes for table `ticket_payment`
--
ALTER TABLE `ticket_payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `ID_Ticket` (`ID_Ticket`),
  ADD KEY `ticket_payment_fk_mem` (`ID_Member`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_s`
--
ALTER TABLE `event_s`
  ADD CONSTRAINT `event_s_ibfk_1` FOREIGN KEY (`ID_Location`) REFERENCES `location` (`ID_Location`),
  ADD CONSTRAINT `event_s_ibfk_2` FOREIGN KEY (`event_type`) REFERENCES `events_type` (`ID_EventType`);

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_fk_mem` FOREIGN KEY (`ID_Member`) REFERENCES `member` (`ID_Member`);

--
-- Constraints for table `member_address`
--
ALTER TABLE `member_address`
  ADD CONSTRAINT `member_address_fk_mem` FOREIGN KEY (`ID_Member`) REFERENCES `member` (`ID_Member`);

--
-- Constraints for table `member_age`
--
ALTER TABLE `member_age`
  ADD CONSTRAINT `member_age_fk_mem` FOREIGN KEY (`ID_Member`) REFERENCES `member` (`ID_Member`);

--
-- Constraints for table `member_bank_account`
--
ALTER TABLE `member_bank_account`
  ADD CONSTRAINT `member_bank_account_fk_mem` FOREIGN KEY (`ID_Member`) REFERENCES `member` (`ID_Member`);

--
-- Constraints for table `member_phone`
--
ALTER TABLE `member_phone`
  ADD CONSTRAINT `member_phone_fk_mem` FOREIGN KEY (`ID_Member`) REFERENCES `member` (`ID_Member`);

--
-- Constraints for table `merchandise`
--
ALTER TABLE `merchandise`
  ADD CONSTRAINT `merchandise_ibfk_1` FOREIGN KEY (`mer_type`) REFERENCES `merchandise_type` (`ID_mer_type`);

--
-- Constraints for table `merchandise_stock`
--
ALTER TABLE `merchandise_stock`
  ADD CONSTRAINT `merchandise_stock_ibfk_1` FOREIGN KEY (`ID_Mer`) REFERENCES `merchandise` (`ID_Mer`);

--
-- Constraints for table `order_mer_detail`
--
ALTER TABLE `order_mer_detail`
  ADD CONSTRAINT `order_mer_detail_ibfk_1` FOREIGN KEY (`ID_Order`) REFERENCES `order_s` (`ID_Order`),
  ADD CONSTRAINT `order_mer_detail_ibfk_2` FOREIGN KEY (`ID_Mer`) REFERENCES `merchandise` (`ID_Mer`);

--
-- Constraints for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD CONSTRAINT `order_payment_fk_mem` FOREIGN KEY (`ID_Member`) REFERENCES `member` (`ID_Member`),
  ADD CONSTRAINT `order_payment_ibfk_2` FOREIGN KEY (`ID_Order`) REFERENCES `order_s` (`ID_Order`);

--
-- Constraints for table `order_s`
--
ALTER TABLE `order_s`
  ADD CONSTRAINT `order_s_fk_mem` FOREIGN KEY (`ID_Member`) REFERENCES `member` (`ID_Member`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_fk_mem` FOREIGN KEY (`ID_Member`) REFERENCES `member` (`ID_Member`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`ID_Event`) REFERENCES `event_s` (`ID_Event`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`ID_Seat`) REFERENCES `seat_reserve` (`ID_Seat`);

--
-- Constraints for table `ticket_payment`
--
ALTER TABLE `ticket_payment`
  ADD CONSTRAINT `ticket_payment_fk_mem` FOREIGN KEY (`ID_Member`) REFERENCES `member` (`ID_Member`),
  ADD CONSTRAINT `ticket_payment_ibfk_2` FOREIGN KEY (`ID_Ticket`) REFERENCES `ticket` (`ID_Ticket`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
