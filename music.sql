-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: May 11, 2019 at 04:34 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` varchar(10) NOT NULL,
  `UserName` varchar(30) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `BookingID` varchar(20) NOT NULL,
  `ConcertID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `UserName`, `Password`, `BookingID`, `ConcertID`) VALUES
('AD001', 'adminalfa', '123abcstyz', 'BO123', 'C003'),
('AD002', 'adminbeta', '@at135abc', 'BO124', 'C003'),
('AD003', 'adminomega', '&12ax3bcv', 'BO125', 'C012');

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `AgentID` varchar(20) NOT NULL,
  `AgentFirstName` varchar(30) DEFAULT NULL,
  `AgentLastName` varchar(20) DEFAULT NULL,
  `AgentEmail` varchar(40) DEFAULT NULL,
  `AgentTelNo` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`AgentID`, `AgentFirstName`, `AgentLastName`, `AgentEmail`, `AgentTelNo`) VALUES
('A001', 'Jake', 'Curt', 'jakecurt@gmail.com', '07667095431'),
('A012', 'Diana', 'Evans', 'dianaevans2019@yahoo.com', '07863391678'),
('A112', 'Julian', 'Defoe', 'juliandefoe13@gmail.com', '07881235430'),
('A123', 'Susan', 'Tailor', 'susantailor22@gmail.com', '07885670068'),
('A144', 'Jim', 'Swan', 'jimswan99@gmail.com', '07653541003'),
('A223', 'Mike', 'Stark', 'mikestark@hotmail.com', '07553341268'),
('A256', 'Sam ', 'Owen', 'samowen@yahoo.com', '07782230169'),
('A331', 'Martin', 'Pitt', 'martinpitt@yahoo.com', '07556614938');

-- --------------------------------------------------------

--
-- Table structure for table `band`
--

CREATE TABLE `band` (
  `BandNumber` int(4) NOT NULL,
  `AgentID` varchar(20) NOT NULL,
  `BandName` varchar(40) DEFAULT NULL,
  `BandEntry` datetime DEFAULT NULL,
  `BandFinish` datetime DEFAULT NULL,
  `BandMusicType` varchar(30) DEFAULT NULL,
  `NumberOfArtists` int(2) DEFAULT NULL,
  `BandDesc` varchar(100) DEFAULT NULL,
  `ConcertID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `band`
--

INSERT INTO `band` (`BandNumber`, `AgentID`, `BandName`, `BandEntry`, `BandFinish`, `BandMusicType`, `NumberOfArtists`, `BandDesc`, `ConcertID`) VALUES
(1, 'A001', 'Iron Maiden', '2019-06-14 16:00:00', '2019-06-14 18:00:00', 'Rock', 5, 'Heavy Metal Rock', 'C001'),
(2, 'A012', 'In Flames', '2019-06-14 18:30:00', '2019-06-14 20:30:00', 'Rock', 4, 'Melodic Death Metal', 'C001'),
(3, 'A112', 'David Guetta', '2019-06-02 16:00:00', '2019-06-02 18:00:00', 'House ', 2, 'World famous house DJ', 'C012'),
(4, 'A123', 'Ricky Martin', '2019-06-02 18:30:00', '2019-06-02 20:00:00', 'Dance', 3, 'one voice singer,one electric guitarist', 'C012'),
(5, 'A144', 'System', '2019-06-02 20:30:00', '2019-06-02 23:00:00', 'House Dance ', 4, 'Pyrotechnic mix dance music ', 'C012'),
(6, 'A223', 'Circus Freaks', '2019-06-02 23:30:00', '2019-06-03 01:30:00', ' House', 6, 'Mix Dance House with acrobatic and street dance', 'C012'),
(7, 'A256', 'Katy Perry', '2019-07-06 20:00:00', '2019-07-06 22:30:00', 'Dance', 3, 'Woman voice,dance and pop mixture', 'C003'),
(8, 'A331', 'Armin Van Buuren', '2019-05-19 18:30:00', '2019-05-19 21:30:00', 'House Mix', 3, 'World Famous DJ', 'C002');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `BookingID` int(5) NOT NULL,
  `Username` varchar(25) NOT NULL,
  `ConcertDesc` varchar(200) NOT NULL,
  `NumberOfTickets` varchar(25) NOT NULL,
  `Status` varchar(25) NOT NULL,
  `BookingDate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingID`, `Username`, `ConcertDesc`, `NumberOfTickets`, `Status`, `BookingDate`) VALUES
(4, 'test', 'Live Music,Lights Show', '3', 'PAID', '2019-06-01'),
(5, 'laba.trista', 'Dance and Pop Artists', '1', 'PAID', '2019-07-06');

-- --------------------------------------------------------

--
-- Table structure for table `concert`
--

CREATE TABLE `concert` (
  `ConcertID` varchar(20) NOT NULL DEFAULT '',
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Location` varchar(40) DEFAULT NULL,
  `ConcertDesc` varchar(100) DEFAULT NULL,
  `OrganizerID` varchar(20) NOT NULL,
  `Price` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concert`
--

INSERT INTO `concert` (`ConcertID`, `StartDate`, `EndDate`, `Location`, `ConcertDesc`, `OrganizerID`, `Price`) VALUES
('C001', '2019-06-14', '2019-06-14', 'Frankfurt,Central Square,Germany', 'Rock Festival,pyrotechnic show at the end', 'O122', '£100'),
('C002', '2019-05-19', '2019-05-19', 'Rome, Colloseum ,Italy', 'House Mix,Circus entertainment', 'O134', '£150'),
('C003', '2019-07-06', '2019-07-06', 'Amsterdam,Town Square,Holland', 'Dance and Pop Artists', 'O145', '£120'),
('C012', '2019-06-02', '2019-06-03', 'Tenerife, Las Americas Beach, Spain', 'Beach Concert,  diversified kind of music and entertainment', 'O122', '£130'),
('C112', '2019-06-01', '2019-06-01', 'Hyde Park London', 'Live Music,Lights Show', 'O112', '£160');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(20) NOT NULL,
  `Title` varchar(3) DEFAULT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `UserName` varchar(30) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Town` varchar(30) DEFAULT NULL,
  `Postcode` varchar(20) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `MobileNo` int(15) DEFAULT NULL,
  `Type` varchar(20) NOT NULL,
  `PaymentMethod` varchar(20) DEFAULT NULL,
  `AccountNo` int(15) DEFAULT NULL,
  `OrganisationName` varchar(40) DEFAULT NULL,
  `ContactName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `Title`, `FirstName`, `LastName`, `UserName`, `Password`, `Address`, `Town`, `Postcode`, `Email`, `MobileNo`, `Type`, `PaymentMethod`, `AccountNo`, `OrganisationName`, `ContactName`) VALUES
(0, 'Mr.', 'abc', 'tttt', 'test', 'test123', 'sssss', 'ghhjjjj', 'hytr3344', 'gffddd', 44556666, 'no', 'Credit card', 456666, 'no', NULL),
(1, 'Mr.', 'yyyyyyy', 'ytttt', 'yyyyyy', 'blabla', 'ttt', 'pllll', 'lu76hgg', 'ttttttt', 76655444, 'no', 'Credit card', 6555555, 'rrrrrrr', NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'corporate', NULL, NULL, NULL, NULL),
(101, 'Mr.', 'coco', 'jambo', 'laba.trista', '123456', 'coruia', 'drujbeni', '999999', 'caca.moale@diaree.coi', 1122, 'pornografica', 'Credit card', 111111111, 'pornografica', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organizer`
--

CREATE TABLE `organizer` (
  `OrganizerID` varchar(20) NOT NULL,
  `OrganizerFirstName` varchar(30) DEFAULT NULL,
  `OrganizerLastName` varchar(20) DEFAULT NULL,
  `UserName` varchar(30) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `OrgEmail` varchar(40) DEFAULT NULL,
  `OrgTelNo` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organizer`
--

INSERT INTO `organizer` (`OrganizerID`, `OrganizerFirstName`, `OrganizerLastName`, `UserName`, `Password`, `OrgEmail`, `OrgTelNo`) VALUES
('O112', 'Thomas', 'Ford', 'TomF', '@123axyz', 'thomasford@hotmail.com', '07225891322'),
('O122', 'Iron', 'Cruise', 'IronC', '124abc', 'ironcruise@gmail.com', '07884069533'),
('O123', 'John', 'Smith', 'JohnS', '123abc', 'johnsmith@gmail.com', '07788069912'),
('O134', 'Giussepe', 'Leone', 'Gusleon', '122xyqz', 'giussepeleone@yahoo.com', '07882346507'),
('O145', 'Ana', 'Hitchin', 'AnaH', 'qas31268', 'anahitchin@yahoo.com', '07681346602');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD KEY `BookingID` (`BookingID`),
  ADD KEY `ConcertID` (`ConcertID`);

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`AgentID`);

--
-- Indexes for table `band`
--
ALTER TABLE `band`
  ADD PRIMARY KEY (`BandNumber`,`AgentID`),
  ADD KEY `AgentID` (`AgentID`),
  ADD KEY `ConcertID` (`ConcertID`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingID`);

--
-- Indexes for table `concert`
--
ALTER TABLE `concert`
  ADD PRIMARY KEY (`ConcertID`),
  ADD KEY `OrganizerID` (`OrganizerID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `organizer`
--
ALTER TABLE `organizer`
  ADD PRIMARY KEY (`OrganizerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BookingID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `Admin_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  ADD CONSTRAINT `Admin_ibfk_2` FOREIGN KEY (`ConcertID`) REFERENCES `concert` (`ConcertID`);

--
-- Constraints for table `band`
--
ALTER TABLE `band`
  ADD CONSTRAINT `Band_ibfk_1` FOREIGN KEY (`AgentID`) REFERENCES `agent` (`AgentID`),
  ADD CONSTRAINT `Band_ibfk_2` FOREIGN KEY (`ConcertID`) REFERENCES `concert` (`ConcertID`);

--
-- Constraints for table `concert`
--
ALTER TABLE `concert`
  ADD CONSTRAINT `Concert_ibfk_1` FOREIGN KEY (`OrganizerID`) REFERENCES `organizer` (`OrganizerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
