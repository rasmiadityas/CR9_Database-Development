-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2021 at 02:43 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr9_famazon_rasmisilasari`
--
CREATE DATABASE IF NOT EXISTS `cr9_famazon_rasmisilasari` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr9_famazon_rasmisilasari`;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `cityID` int(11) NOT NULL,
  `cityName` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cityID`, `cityName`, `state`) VALUES
(1, 'Vienna', 'Vienna'),
(2, 'Linz', 'Upper Austria'),
(3, 'Graz', 'Styria'),
(4, 'Klagenfurt', 'Carinthia'),
(5, 'Innsbruck', 'Tirol'),
(6, 'Baden', 'Lower Austria');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `companyID` int(11) NOT NULL,
  `companyName` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyID`, `companyName`, `status`) VALUES
(1, 'Honeybee', 'Corporation'),
(2, 'Majestic', 'Corporation'),
(3, 'Stardust', 'Corporation'),
(4, 'Mayrhofer', 'Family'),
(5, 'Liebes', 'Family'),
(6, 'Perfekto', 'Family');

-- --------------------------------------------------------

--
-- Table structure for table `courier`
--

CREATE TABLE `courier` (
  `courierID` int(11) NOT NULL,
  `courierName` varchar(50) NOT NULL,
  `shipPrice` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courier`
--

INSERT INTO `courier` (`courierID`, `courierName`, `shipPrice`) VALUES
(1, 'Post', '3.50'),
(2, 'Hermes', '6.00'),
(3, 'DPD', '10.50'),
(4, 'DHL', '15.50');

-- --------------------------------------------------------

--
-- Table structure for table `fruit`
--

CREATE TABLE `fruit` (
  `fruitID` int(11) NOT NULL,
  `fruitName` varchar(50) NOT NULL,
  `taste` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fruit`
--

INSERT INTO `fruit` (`fruitID`, `fruitName`, `taste`) VALUES
(1, 'Strawberry', 'sweet, sour'),
(2, 'Blueberry', 'less sweet, less sour'),
(3, 'Apricot', 'less sweet, sour'),
(4, 'Grape', 'very sweet, not sour'),
(5, 'Prune', 'sweet, very sour'),
(6, 'Orange', 'very sweet, very sour');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemID` int(11) NOT NULL,
  `barcode` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `fruitName` varchar(50) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `companyName` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`itemID`, `barcode`, `title`, `fruitName`, `price`, `companyName`, `stock`, `created`) VALUES
(1, 123456, 'Morning Delight', 'Strawberry', '3.50', 'Honeybee', 20, '2020-01-02'),
(2, 654321, 'Lovely Day', 'Blueberry', '3.50', 'Majestic', 75, '2020-02-02'),
(3, 234567, 'Afternoon Treat', 'Blueberry', '4.20', 'Stardust', 31, '2020-03-02'),
(4, 765432, 'Surprise Me', 'Grape', '5.60', 'Stardust', 46, '2020-04-02'),
(5, 345678, 'Spring Gift', 'Grape', '2.20', 'Liebes', 67, '2020-05-02'),
(6, 876543, 'Mother Recipe', 'Orange', '4.50', 'Perfekto', 34, '2020-06-02');

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `orderitemID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`orderitemID`, `orderID`, `itemID`, `quantity`) VALUES
(9, 1, 1, 5),
(10, 2, 1, 12),
(11, 2, 3, 4),
(12, 3, 1, 10),
(13, 3, 5, 4),
(14, 3, 6, 7),
(15, 4, 1, 3),
(16, 4, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `tracking` varchar(50) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `userName`, `invoice`, `tracking`, `created`) VALUES
(1, 'cfarren0', 'VIE1234', 'AT1234VIE', '2004-07-22'),
(2, 'cfarren0', 'VIE1236', 'AT1236VIE', '2010-09-20'),
(3, 'tfear2', 'LIN2234', 'AT2234LIN', '2006-05-12'),
(4, 'clacer4', 'KLA3234', 'AT3234KLA', '2012-06-14');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(11) NOT NULL,
  `paymentName` varchar(50) NOT NULL,
  `paymentInfo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `paymentName`, `paymentInfo`) VALUES
(1, 'Bank Transfer', 'Directed to Klarna'),
(2, 'PayPal', 'Directed to PayPal'),
(3, 'Credit Card', 'Directed to Card Control');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchaseID` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `paymentName` varchar(50) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchaseID`, `invoice`, `paymentName`, `created`) VALUES
(1, 'VIE1234', 'PayPal', '2004-07-23'),
(2, 'VIE1236', 'Credit Card', '2010-09-22'),
(3, 'LIN2234', 'Bank Transfer', '2006-05-13'),
(4, 'KLA3234', 'PayPal', '2012-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `shipmentID` int(11) NOT NULL,
  `tracking` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `cityName` varchar(50) NOT NULL,
  `courierName` varchar(50) NOT NULL,
  `sent` date NOT NULL,
  `received` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipment`
--

INSERT INTO `shipment` (`shipmentID`, `tracking`, `address`, `cityName`, `courierName`, `sent`, `received`) VALUES
(1, 'AT1234VIE', 'Astrasse 1', 'Vienna', 'Post', '2004-07-24', '2004-07-30'),
(2, 'AT1236VIE', 'Astrasse 1', 'Vienna', 'DPD', '2010-09-22', '2010-09-27'),
(3, 'AT2234LIN', 'Cstrasse 3', 'Linz', 'DHL', '2006-05-14', '2006-05-16'),
(4, 'AT3234KLA', 'Estrasse 5', 'Klagenfurt', 'Hermes', '2012-06-16', '2012-06-23');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `birthDate` date NOT NULL,
  `address` varchar(50) NOT NULL,
  `cityName` varchar(50) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userName`, `firstName`, `lastName`, `birthDate`, `address`, `cityName`, `mobile`, `email`, `password`, `created`) VALUES
(1, 'cfarren0', 'Cherice', 'Farren', '1975-10-16', 'Astrasse 1', 'Vienna', '+43 468 851 774', 'cfarren0@hp.com', 'nPv6JE', '2002-07-13'),
(2, 'rhuntly1', 'Reg', 'Huntly', '1962-02-11', 'Bstrasse 2', 'Linz', '+43 492 902 399', 'rhuntly1@biglobe.ne.jp', 'bEk1gP5p', '2012-06-09'),
(3, 'tfear2', 'Trever', 'Fear', '1938-12-29', 'Cstrasse 3', 'Linz', '+43 792 787 533', 'tfear2@imgur.com', 'ApfZ64KUhmI', '2008-10-25'),
(4, 'bcossans3', 'Billie', 'Cossans', '2004-05-26', 'Dstrasse 4', 'Innsbruck', '+43 309 164 883', 'bcossans3@mapquest.com', 'pfeNmVq', '2010-09-19'),
(5, 'clacer4', 'Chester', 'Lacer', '1945-09-20', 'Estrasse 5', 'Klagenfurt', '+43 382 484 724', 'clacer4@list-manage.com', 'yRjGwFlfE9rc', '2006-05-27'),
(6, 'pshortin5', 'Pete', 'Shortin', '2000-08-01', 'Fstrasse 6', 'Vienna', '+43 681 649 264', 'pshortin5@nifty.com', 'JA4FU8Sp6', '2004-07-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cityID`),
  ADD UNIQUE KEY `cityName` (`cityName`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`companyID`),
  ADD UNIQUE KEY `companyName` (`companyName`);

--
-- Indexes for table `courier`
--
ALTER TABLE `courier`
  ADD PRIMARY KEY (`courierID`),
  ADD UNIQUE KEY `courierName` (`courierName`);

--
-- Indexes for table `fruit`
--
ALTER TABLE `fruit`
  ADD PRIMARY KEY (`fruitID`),
  ADD UNIQUE KEY `fruitName` (`fruitName`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemID`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `fruitName` (`fruitName`),
  ADD KEY `companyName` (`companyName`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`orderitemID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `itemID` (`itemID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `userName` (`userName`),
  ADD KEY `invoice` (`invoice`),
  ADD KEY `tracking` (`tracking`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`),
  ADD UNIQUE KEY `paymentName` (`paymentName`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchaseID`),
  ADD UNIQUE KEY `invoice` (`invoice`),
  ADD KEY `paymentName` (`paymentName`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`shipmentID`),
  ADD UNIQUE KEY `tracking` (`tracking`),
  ADD KEY `cityName` (`cityName`),
  ADD KEY `courierName` (`courierName`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userName` (`userName`),
  ADD KEY `city` (`cityName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `cityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `companyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `courier`
--
ALTER TABLE `courier`
  MODIFY `courierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fruit`
--
ALTER TABLE `fruit`
  MODIFY `fruitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `orderitemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shipment`
--
ALTER TABLE `shipment`
  MODIFY `shipmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`fruitName`) REFERENCES `fruit` (`fruitName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`companyName`) REFERENCES `company` (`companyName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`invoice`) REFERENCES `purchase` (`invoice`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`tracking`) REFERENCES `shipment` (`tracking`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`paymentName`) REFERENCES `payment` (`paymentName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`cityName`) REFERENCES `city` (`cityName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`courierName`) REFERENCES `courier` (`courierName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`cityName`) REFERENCES `city` (`cityName`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
