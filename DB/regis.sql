-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 25, 2017 at 06:39 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `regis`
--
CREATE DATABASE IF NOT EXISTS `regis` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `regis`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `cart_qty` int(11) NOT NULL,
  `cart_stock_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cart_uniqid` varchar(35) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `item_id` (`item_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `expired`
--

CREATE TABLE IF NOT EXISTS `expired` (
  `exp_id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_itemName` varchar(50) NOT NULL,
  `exp_itemPrice` float NOT NULL,
  `exp_itemQty` int(11) NOT NULL,
  `exp_expiredDate` date NOT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `expired`
--

INSERT INTO `expired` (`exp_id`, `exp_itemName`, `exp_itemPrice`, `exp_itemQty`, `exp_expiredDate`) VALUES
(1, 'haha', 5.6, 7, '2017-08-18'),
(2, 'haha', 5.6, 12, '2017-03-23'),
(3, 'sipons', 3.5, 3, '2017-03-31'),
(4, '111', 7.5, 34, '2017-04-14'),
(5, '111', 7.5, 13, '2017-04-21'),
(6, 'haha', 5.6, 23, '2017-04-12'),
(7, 'sipons', 3.5, 123, '2017-04-08'),
(8, '111', 7.5, 123, '2017-04-08'),
(9, '111', 7.5, 23, '2017-05-04'),
(10, '111', 7.5, 21, '2017-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL,
  `item_price` double NOT NULL,
  `item_type_id` int(11) NOT NULL,
  `item_code` varchar(35) NOT NULL,
  `item_brand` varchar(50) NOT NULL,
  `item_grams` varchar(20) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_type_id` (`item_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `item_price`, `item_type_id`, `item_code`, `item_brand`, `item_grams`) VALUES
(1, 'sipons', 3.5, 1, '131313', 'Brand Ni Siya', '500ml'),
(2, 'haha', 5.6, 2, '12321', '12321321', '1232213'),
(3, '111', 7.5, 1, '111', '111', '11'),
(4, 'Lala', 15, 2, '12321', '12321321', '1232213'),
(5, 'Sdas', 123, 3, 'Ss1', 'Ss', '100'),
(6, 'Citurs Cough Sirup', 250, 2, 'Cip01', 'Cipla', '100');

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE IF NOT EXISTS `item_type` (
  `item_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type_desc` varchar(50) NOT NULL,
  PRIMARY KEY (`item_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`item_type_id`, `item_type_desc`) VALUES
(1, 'Tablet'),
(2, 'Syrup'),
(3, 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `sales_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(35) NOT NULL,
  `generic_name` varchar(35) NOT NULL,
  `brand` varchar(35) NOT NULL,
  `gram` varchar(35) NOT NULL,
  `type` varchar(35) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `date_sold` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `item_code`, `generic_name`, `brand`, `gram`, `type`, `qty`, `price`, `date_sold`) VALUES
(1, '131313', 'sipons', 'Brand Ni Siya', '500ml', 'Tablet', 4, 3.5, '2017-03-22 22:03:36'),
(2, '12321', 'haha', '12321321', '1232213', 'Syrup', 2, 5.6, '2017-03-22 22:03:36'),
(3, '131313', 'sipons', 'Brand Ni Siya', '500ml', 'Tablet', 3, 3.5, '2017-03-22 22:07:38'),
(4, '131313', 'sipons', 'Brand Ni Siya', '500ml', 'Tablet', 1, 3.5, '2017-03-22 22:08:09'),
(5, '12321', 'haha', '12321321', '1232213', 'Syrup', 2, 5.6, '2017-03-22 22:08:09'),
(6, '12321', 'haha', '12321321', '1232213', 'Syrup', 1, 5.6, '2017-03-22 22:09:47'),
(7, '12321', 'haha', '12321321', '1232213', 'Syrup', 1, 5.6, '2017-03-22 22:09:47'),
(8, '131313', 'sipons', 'Brand Ni Siya', '500ml', 'Tablet', 1, 3.5, '2017-03-22 22:09:47'),
(9, '131313', 'sipons', 'Brand Ni Siya', '500ml', 'Tablet', 2, 3.5, '2017-03-22 22:10:11'),
(10, '12321', 'haha', '12321321', '1232213', 'Syrup', 1, 5.6, '2017-03-22 22:10:11'),
(11, '12321', 'Lala', '12321321', '1232213', 'Syrup', 1, 15, '2017-03-28 07:04:50'),
(12, '111', '111', '111', '11', 'Tablet', 2, 7.5, '2017-10-25 06:23:12'),
(13, 'Cip01', 'Citurs Cough Sirup', 'Cipla', '100', 'Syrup', 5, 250, '2017-10-25 06:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `stock_qty` int(11) NOT NULL,
  `stock_expiry` date NOT NULL,
  `stock_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stock_manufactured` date NOT NULL,
  `stock_purchased` date NOT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `item_id`, `stock_qty`, `stock_expiry`, `stock_added`, `stock_manufactured`, `stock_purchased`) VALUES
(8, 3, 21, '2017-10-27', '2017-10-25 06:22:18', '2017-10-24', '2017-10-24'),
(9, 6, 45, '2017-10-30', '2017-10-25 06:37:52', '2017-10-01', '2017-10-25');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(50) NOT NULL,
  `user_pass` varchar(35) NOT NULL,
  `user_type` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_account`, `user_pass`, `user_type`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'admin2', '21232f297a57a5a743894a0e4a801fc3', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`item_type_id`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
