-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 01:52 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paf`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Specialization` varchar(30) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `Mobile` int(10) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `DoctorFee` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DID`, `Name`, `Specialization`, `NIC`, `Mobile`, `Email`, `DoctorFee`) VALUES
(2, 'Dr. Harshini Fernando', 'Physician', '967879521V', 769845680, 'harshi123@gmail.com', '2500.00'),
(59, 'Dr.Anjali Gamage', 'Neurologist', '986581480V', 1234567892, 'aa@gmail.com', '1200.00'),
(60, 'Dr. Archana', 'Corona', '98723789V', 712345678, 'archaa12@mail.com', '1200.00'),
(63, 'Dr.Pathma', 'ENT', '986123678V', 771234567, 'pathmawathy@gmail.com', '8000.00'),
(64, 'Dr. Heashith Hari', 'Cardiologist', '981234568V', 762378936, 'hari166@gmail.com', '7000.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `DID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
