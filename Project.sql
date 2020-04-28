-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 28, 2020 at 07:40 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Project`
--

-- --------------------------------------------------------

--
-- Table structure for table `CARD`
--

CREATE TABLE `CARD` (
  `ID` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Owner` varchar(50) NOT NULL,
  `ExpirationDate` date NOT NULL,
  `PaymentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CASH`
--

CREATE TABLE `CASH` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER`
--

CREATE TABLE `CUSTOMER` (
  `AFM` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Birthdate` date NOT NULL,
  `Address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `FLIGHT`
--

CREATE TABLE `FLIGHT` (
  `ID` varchar(50) NOT NULL,
  `PlaneModel` varchar(50) NOT NULL,
  `DepartureTime` time NOT NULL,
  `ArrivalTime` time NOT NULL,
  `DepartureAirport` varchar(50) NOT NULL,
  `ArrivalAirport` varchar(50) NOT NULL,
  `FlightCompany` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PAYMENT`
--

CREATE TABLE `PAYMENT` (
  `ID` int(11) NOT NULL,
  `DateOfPayment` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RECEIPT`
--

CREATE TABLE `RECEIPT` (
  `ID` int(11) NOT NULL,
  `PrintDate` date NOT NULL,
  `PrintTime` time NOT NULL,
  `TicketID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TICKET`
--

CREATE TABLE `TICKET` (
  `ID` varchar(50) NOT NULL,
  `Price` int(11) NOT NULL,
  `AFM` varchar(50) NOT NULL,
  `PaymentID` int(11) NOT NULL,
  `FlightID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TRIP`
--

CREATE TABLE `TRIP` (
  `DepartureLocation` varchar(50) NOT NULL,
  `DepartureDay` varchar(50) NOT NULL,
  `Destination` varchar(50) NOT NULL,
  `NumberOfPassengers` int(11) NOT NULL,
  `StartOfTimeRestriction` time NOT NULL,
  `EndOfTimeRestriction` time NOT NULL,
  `AFM` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CARD`
--
ALTER TABLE `CARD`
  ADD PRIMARY KEY (`PaymentID`);

--
-- Indexes for table `CASH`
--
ALTER TABLE `CASH`
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD PRIMARY KEY (`AFM`);

--
-- Indexes for table `FLIGHT`
--
ALTER TABLE `FLIGHT`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `PAYMENT`
--
ALTER TABLE `PAYMENT`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RECEIPT`
--
ALTER TABLE `RECEIPT`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TicketID` (`TicketID`);

--
-- Indexes for table `TICKET`
--
ALTER TABLE `TICKET`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AFM` (`AFM`),
  ADD KEY `PaymentID` (`PaymentID`),
  ADD KEY `FlightID` (`FlightID`);

--
-- Indexes for table `TRIP`
--
ALTER TABLE `TRIP`
  ADD PRIMARY KEY (`DepartureLocation`,`DepartureDay`,`Destination`),
  ADD KEY `AFM` (`AFM`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `PAYMENT`
--
ALTER TABLE `PAYMENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `RECEIPT`
--
ALTER TABLE `RECEIPT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CARD`
--
ALTER TABLE `CARD`
  ADD CONSTRAINT `CARD_ibfk_1` FOREIGN KEY (`PaymentID`) REFERENCES `PAYMENT` (`ID`);

--
-- Constraints for table `CASH`
--
ALTER TABLE `CASH`
  ADD CONSTRAINT `CASH_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `PAYMENT` (`ID`);

--
-- Constraints for table `RECEIPT`
--
ALTER TABLE `RECEIPT`
  ADD CONSTRAINT `RECEIPT_ibfk_1` FOREIGN KEY (`TicketID`) REFERENCES `TICKET` (`ID`);

--
-- Constraints for table `TICKET`
--
ALTER TABLE `TICKET`
  ADD CONSTRAINT `TICKET_ibfk_1` FOREIGN KEY (`AFM`) REFERENCES `CUSTOMER` (`AFM`),
  ADD CONSTRAINT `TICKET_ibfk_2` FOREIGN KEY (`PaymentID`) REFERENCES `PAYMENT` (`ID`),
  ADD CONSTRAINT `TICKET_ibfk_3` FOREIGN KEY (`FlightID`) REFERENCES `FLIGHT` (`ID`);

--
-- Constraints for table `TRIP`
--
ALTER TABLE `TRIP`
  ADD CONSTRAINT `TRIP_ibfk_1` FOREIGN KEY (`AFM`) REFERENCES `CUSTOMER` (`AFM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
