-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2023 at 05:14 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(3) NOT NULL,
  `appoint_date` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phno` bigint(11) NOT NULL,
  `diseases` varchar(50) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `address` varchar(500) NOT NULL,
  `status` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `user_id`, `full_name`, `gender`, `age`, `appoint_date`, `email`, `phno`, `diseases`, `doctor_id`, `address`, `status`) VALUES
(1, 1, 'Onkar yevale', 'male', 23, '2023-08-26', 'onkaryevale0@gmail.com', 8698424630, 'Fever', 5, 'India', 'Checkup Completed...'),
(2, 1, 'Manashri Jadhav', 'female', 19, '2004-12-22', 'manu123@gmail.com', 9923904587, 'Fever', 3, 'India', 'Pending'),
(5, 1, 'sad ', 'male', 23, '2023-08-02', 'sad@gmail.com', 8965689569, 'dengue', 6, 'kolhapur', 'checkup completed'),
(6, 1, 'Tahir sanadi', 'male', 22, '2023-09-02', 'tahir123@gmail.com', 8659689568, 'Dandruff', 6, 'A/P sangli', 'mission accomplished'),
(7, 1, 'Tushar Gurav', 'male', 23, '2023-09-04', 'tushar123@gmail.com', 8695632538, 'Fever', 5, 'Kolhapur', 'Complete Checkup'),
(8, 1, 'Abhi Khude', 'male', 25, '2023-09-05', 'akdreamhouse123@gmail.com', 9675845896, 'fungal', 6, 'Kakhe kolhapur', 'Pending'),
(9, 1, 'Atul Khude', 'male', 24, '2023-09-05', 'atul@123gmail.com', 8551819213, 'fever', 5, 'kakhe kolhapur', 'Pending'),
(10, 1, 'swapnali shinde', 'female', 24, '2023-09-07', 'swapnali123@gmail.com', 8569856895, 'cough', 5, 'kolhapur', 'Checkup Completed...'),
(13, 1, 'Rohit Ghadage', 'male', 21, '2023-09-10', 'rohitghadage40@gmail.com', 8695685698, 'Corona', 5, 'a/p Satara', 'Pending'),
(14, 1, 'Sourabh Khude', 'male', 23, '2023-10-16', 'sourabhkhude@gmail.com', 8569856325, 'dengue', 5, 'Kakhe tal-panhala dist-kolhapur', 'Normal Condition now');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `qualification` varchar(45) NOT NULL,
  `specialist` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobno` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `full_name`, `dob`, `qualification`, `specialist`, `email`, `mobno`, `password`) VALUES
(3, 'Jaywant patil', '1979-07-11', 'MBBS ', 'Cardiologist', 'jaywant123@gmail.com', '7898568569', '1234'),
(5, 'S Kumar', '2001-08-15', 'MBBS', 'Fever', 'sk@gmail.com', '9856985658', '1234'),
(6, 'Ankita Kumar', '2023-08-10', 'PhD', 'Dermatologist', 'ankita@gmail.com', '7858789658', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `id` int(11) NOT NULL,
  `spec_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`id`, `spec_name`) VALUES
(1, 'Dentist'),
(3, 'Dermatologist'),
(4, 'Cardiologist'),
(5, 'Fever');

-- --------------------------------------------------------

--
-- Table structure for table `user_dtls`
--

CREATE TABLE `user_dtls` (
  `id` int(11) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_dtls`
--

INSERT INTO `user_dtls` (`id`, `full_name`, `email`, `password`) VALUES
(1, 'Onkar yevale', 'onkaryevale0@gmail.com', '1234'),
(2, 'Manashri Jadhav', 'manu123@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`user_id`),
  ADD KEY `did` (`doctor_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_dtls`
--
ALTER TABLE `user_dtls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `specialist`
--
ALTER TABLE `specialist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_dtls`
--
ALTER TABLE `user_dtls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `did` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `uid` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
