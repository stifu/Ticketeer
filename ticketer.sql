-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 21, 2010 at 05:14 PM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ticketer`
--

-- --------------------------------------------------------

--
-- Table structure for table `foretag`
--

CREATE TABLE IF NOT EXISTS `foretag` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `namn` varchar(30) NOT NULL,
  `adress` varchar(50) NOT NULL,
  `postnumer` varchar(6) NOT NULL,
  `postort` varchar(30) NOT NULL,
  `kontaktperson` varchar(30) NOT NULL,
  `telefon_prim` varchar(30) NOT NULL,
  `telefon_seco` varchar(30) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `orgnr` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `foretag`
--

INSERT INTO `foretag` (`id`, `namn`, `adress`, `postnumer`, `postort`, `kontaktperson`, `telefon_prim`, `telefon_seco`, `mail`, `orgnr`) VALUES
(1, 'Softpower', 'Gatan 1', '145 65', 'Nödsborg', 'Torkel Pettersson', '08 522 3525', '070 885200', 'torkel@snyggaskor.se', '8121211-124'),
(2, 'Dummy Corp', 'Doghnut road', '555 55', 'Ankeborg', 'Knatte Fnattesson', '08 8555 55 5 ', '070 5454654', 'kalle@anka.se', '8121211-124'),
(4, 'Dragon Corp', 'Fire', '141 50', 'Norsdragon', 'Dragon dude', '01232030', '0852229030', 'dragon@dragon.dr', '1212323-123');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `typ` varchar(30) NOT NULL,
  `modell` varchar(30) NOT NULL,
  `sn` varchar(40) NOT NULL,
  `garanti` varchar(5) NOT NULL,
  `delar` int(5) NOT NULL,
  `kontaktperson` varchar(30) NOT NULL,
  `foretag` varchar(30) NOT NULL,
  `datum` date NOT NULL,
  `operator_reciever` varchar(30) NOT NULL,
  `os` varchar(30) NOT NULL,
  `login` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `measure` varchar(300) NOT NULL,
  `product` varchar(300) NOT NULL,
  `spara` varchar(300) NOT NULL,
  `status` varchar(10) NOT NULL,
  `reason` varchar(300) NOT NULL,
  `finished` date NOT NULL,
  `operator_operating` varchar(30) NOT NULL,
  `delivered` varchar(5) NOT NULL,
  `operator_delivering` varchar(30) NOT NULL,
  `delivering_method` varchar(10) NOT NULL,
  `alt_adress` varchar(100) NOT NULL,
  `misc` varchar(300) NOT NULL,
  `placeholder` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `typ`, `modell`, `sn`, `garanti`, `delar`, `kontaktperson`, `foretag`, `datum`, `operator_reciever`, `os`, `login`, `desc`, `measure`, `product`, `spara`, `status`, `reason`, `finished`, `operator_operating`, `delivered`, `operator_delivering`, `delivering_method`, `alt_adress`, `misc`, `placeholder`) VALUES
(1, 'Bärbar', 'Lenovo AS15055 ', '1518623a1as2312321', 'Nej', 2, 'Evert', 'Dummy Corp', '2010-01-24', 'Stefan', 'Windows XP Home Edition', 'user user', 'Windows Tar ca 10 minuter att starta. Vad göra?', '', '', 'Ja', 'inlämnad', '', '0000-00-00', '', '', '', '', '', 'trasig hårddisk?', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Lastname` varchar(30) NOT NULL,
  `rank` int(10) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Global user' AUTO_INCREMENT=30 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `Name`, `Lastname`, `rank`) VALUES
(1, '1', 'Stefan', 'Pålsson', 1),
(23, '2', 'Jörgen', 'Lindblom', 1);
