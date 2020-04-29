-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 29, 2020 at 03:54 PM
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

--
-- Dumping data for table `CARD`
--

INSERT INTO `CARD` (`ID`, `Type`, `Owner`, `ExpirationDate`, `PaymentID`) VALUES
(6428, 'MAsterWind', 'Golis Baggins', '2024-08-17', 3);

-- --------------------------------------------------------

--
-- Table structure for table `CASH`
--

CREATE TABLE `CASH` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CASH`
--

INSERT INTO `CASH` (`ID`) VALUES
(1),
(2);

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

--
-- Dumping data for table `CUSTOMER`
--

INSERT INTO `CUSTOMER` (`AFM`, `Name`, `Birthdate`, `Address`) VALUES
('159kt', 'Mitsos Sougias', '2000-11-04', 'Smeagoulis 4'),
('420ak', 'John', '1975-06-20', 'Wind Master 28'),
('808kk', 'Golis Baggins', '1930-07-01', 'Karamanli 18');

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

--
-- Dumping data for table `FLIGHT`
--

INSERT INTO `FLIGHT` (`ID`, `PlaneModel`, `DepartureTime`, `ArrivalTime`, `DepartureAirport`, `ArrivalAirport`, `FlightCompany`) VALUES
('a3r0plano', 'Boeing 747', '00:00:12', '00:00:15', 'Makedonias', 'Eleftherios Venizelos', 'Asta'),
('c0v19', 'Navara', '00:00:18', '00:00:20', 'Yamoussoukro', 'Avalon', 'Asta'),
('pr1vat3j3t', 'F-16', '00:00:13', '00:00:18', 'Akiak', 'Gjakova', 'US marines');

-- --------------------------------------------------------

--
-- Table structure for table `PAYMENT`
--

CREATE TABLE `PAYMENT` (
  `ID` int(11) NOT NULL,
  `DateOfPayment` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PAYMENT`
--

INSERT INTO `PAYMENT` (`ID`, `DateOfPayment`) VALUES
(1, '2019-12-12'),
(2, '2019-10-15'),
(3, '2020-10-09');

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

--
-- Dumping data for table `RECEIPT`
--

INSERT INTO `RECEIPT` (`ID`, `PrintDate`, `PrintTime`, `TicketID`) VALUES
(1, '2020-01-10', '13:00:00', '0tam1sa'),
(2, '2019-10-15', '00:00:04', 'pt1s1'),
(3, '2018-04-25', '00:00:16', 't1ck3t');

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

--
-- Dumping data for table `TICKET`
--

INSERT INTO `TICKET` (`ID`, `Price`, `AFM`, `PaymentID`, `FlightID`) VALUES
('0tam1sa', 200, '159kt', 3, 'c0v19'),
('pt1s1', 400, '420ak', 2, 'pr1vat3j3t'),
('t1ck3t', 150, '808kk', 1, 'a3r0plano');

-- --------------------------------------------------------

--
-- Table structure for table `TRIP`
--

CREATE TABLE `TRIP` (
  `DepartureLocation` varchar(50) NOT NULL,
  `DepartureDay` date NOT NULL,
  `Destination` varchar(50) NOT NULL,
  `NumberOfPassengers` int(11) NOT NULL,
  `StartOfTimeRestriction` time NOT NULL,
  `EndOfTimeRestriction` time NOT NULL,
  `AFM` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TRIP`
--

INSERT INTO `TRIP` (`DepartureLocation`, `DepartureDay`, `Destination`, `NumberOfPassengers`, `StartOfTimeRestriction`, `EndOfTimeRestriction`, `AFM`) VALUES
('Barcelona', '2020-03-15', 'Giannena', 3, '12:00:00', '02:00:00', '420ak'),
('Niaousta', '2020-01-03', 'Paraliaki', 3, '12:00:00', '06:00:00', '808kk'),
('Tsirigo', '2020-03-15', 'Windsor', 15, '21:00:00', '23:00:00', '159kt');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `RECEIPT`
--
ALTER TABLE `RECEIPT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
