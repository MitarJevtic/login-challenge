-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 01, 2019 at 10:18 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loginforma`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`article_id`, `title`, `text`, `user_id`) VALUES
(17, 'vest2', 'Maecenas in tristique magna, blandit luctus augue. In eu elementum neque. Aenean tellus quam, elementum sit amet tincidunt vel, sollicitudin nec erat. Vestibulum eu nibh neque. Mauris in finibus nisi. Etiam ac auctor turpis. Maecenas orci risus, tempor ac libero at, pretium rhoncus metus. Nam eu pulvinar dui. Vivamus posuere turpis quis bibendum tincidunt. Aliquam erat volutpat. Sed ultricies consectetur mauris, in dignissim nunc. Integer lobortis quam est, in efficitur lacus condimentum ut. Ut sagittis, orci et mollis sollicitudin, risus ante tempor ex, et vestibulum risus sem vitae erat. Aliquam posuere lectus sit amet rutrum condimentum.', 1),
(18, 'vesti', 'Nulla imperdiet tincidunt neque eu placerat. Aenean vestibulum ligula urna, in dictum sapien tristique id. Aenean sit amet diam quis quam semper ornare. Phasellus at libero libero. Sed placerat feugiat risus, eget lacinia nunc. Donec laoreet vehicula ante, at faucibus libero porta a. Nullam blandit velit ante, vitae mollis ligula feugiat id. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis sed auctor est, et aliquet lorem. Nam eu turpis feugiat, mollis dui quis, cursus lectus.', 1),
(19, 'Lorem ipsum', 'In sollicitudin ipsum vel tortor blandit, id pretium diam fermentum. Donec massa felis, lacinia id lectus a, auctor scelerisque dolor. Integer rutrum sem nec egestas lobortis. Praesent nec lacus sit amet nisl pulvinar interdum sed vitae lectus. Maecenas vestibulum posuere nunc ut luctus. Phasellus posuere tristique libero ac auctor. In egestas ultrices augue, a accumsan libero porta nec.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`) VALUES
(1, 'Mitar', 'test123', 'test@hotmail.com'),
(4, 't', 't', 't@t.t');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
