-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 22, 2013 at 11:56 AM
-- Server version: 5.1.70-cll
-- PHP Version: 5.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `visionsf_visions`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE IF NOT EXISTS `about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `short` text NOT NULL,
  `long_text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `about`
--


-- --------------------------------------------------------

--
-- Table structure for table `emailsent`
--

CREATE TABLE IF NOT EXISTS `emailsent` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `sender` int(4) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `senttime` int(4) NOT NULL,
  `nosent` int(4) NOT NULL,
  `mailerrors` text NOT NULL,
  `justmods` enum('on','off') NOT NULL DEFAULT 'off',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `emailsent`
--



-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `start` int(4) NOT NULL,
  `end` int(4) NOT NULL,
  `org` int(4) NOT NULL,
  `price` varchar(255) CHARACTER SET latin1 NOT NULL,
  `contactname` varchar(64) CHARACTER SET latin1 NOT NULL,
  `contactemail` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tel` varchar(20) CHARACTER SET latin1 NOT NULL,
  `web` varchar(255) CHARACTER SET latin1 NOT NULL,
  `book` enum('yes','no','optional','optionalplaceslimited') CHARACTER SET latin1 NOT NULL,
  `buildingroom` varchar(64) CHARACTER SET latin1 NOT NULL,
  `address1` varchar(64) CHARACTER SET latin1 NOT NULL,
  `address2` varchar(64) CHARACTER SET latin1 NOT NULL,
  `towncity` varchar(64) CHARACTER SET latin1 NOT NULL,
  `postcode` varchar(10) CHARACTER SET latin1 NOT NULL,
  `status` enum('approved','pending','deleted') CHARACTER SET latin1 NOT NULL DEFAULT 'pending',
  `creator` int(4) NOT NULL DEFAULT '0',
  `modby` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=323 ;

--
-- Dumping data for table `event`
--



-- --------------------------------------------------------

--
-- Table structure for table `eventadmin`
--

CREATE TABLE IF NOT EXISTS `eventadmin` (
  `uid` int(4) NOT NULL,
  `eid` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventadmin`
--



-- --------------------------------------------------------

--
-- Table structure for table `groupadmin`
--

CREATE TABLE IF NOT EXISTS `groupadmin` (
  `uid` int(4) NOT NULL,
  `gid` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groupadmin`
--


-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL,
  `event` varchar(32) NOT NULL,
  `variable` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `log`
--


-- --------------------------------------------------------

--
-- Table structure for table `org`
--

CREATE TABLE IF NOT EXISTS `org` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `orgname` varchar(64) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `contactname` varchar(64) CHARACTER SET latin1 NOT NULL,
  `publicemail` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tel` varchar(20) CHARACTER SET latin1 NOT NULL,
  `website` varchar(255) CHARACTER SET latin1 NOT NULL,
  `otherlink` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` enum('approved','pending','deleted') CHARACTER SET latin1 NOT NULL DEFAULT 'pending',
  `creator` int(4) NOT NULL DEFAULT '0',
  `modby` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `org`
--


-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `sid` text NOT NULL,
  `uid` int(4) NOT NULL DEFAULT '0',
  `expires` int(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE IF NOT EXISTS `site` (
  `id` int(4) NOT NULL DEFAULT '1',
  `lasthousekeeping` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `substoactivate`
--

CREATE TABLE IF NOT EXISTS `substoactivate` (
  `sid` int(4) NOT NULL,
  `token` varchar(24) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `substoactivate`
--

-- data deleted

-- --------------------------------------------------------

--
-- Table structure for table `toactivate`
--

CREATE TABLE IF NOT EXISTS `toactivate` (
  `token` varchar(20) NOT NULL DEFAULT '',
  `uid` int(4) NOT NULL DEFAULT '0',
  `password` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toactivate`
--

-- Data deleted

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `uname` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `password` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `postcode` varchar(12) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `lat` float(10,6) NOT NULL DEFAULT '0.000000',
  `lng` float(10,6) NOT NULL DEFAULT '0.000000',
  `image` int(4) NOT NULL DEFAULT '0',
  `moderator` enum('yes','no') CHARACTER SET latin1 NOT NULL DEFAULT 'no',
  `blocked` enum('yes','no') CHARACTER SET latin1 NOT NULL DEFAULT 'no',
  `activated` enum('yes','no') NOT NULL DEFAULT 'no',
  `digest` enum('yes','no') NOT NULL DEFAULT 'yes',
  `mail` enum('yes','no') NOT NULL DEFAULT 'yes',
  `preferences` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uname` (`uname`,`lat`,`lng`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=175 ;

--
-- Dumping data for table `user`
--
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
         