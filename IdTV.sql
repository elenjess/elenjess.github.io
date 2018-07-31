-- Adminer 4.6.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `IdTV`;

DROP TABLE IF EXISTS `consoles`;
CREATE TABLE `consoles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(30) NOT NULL,
  `locations_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_id` (`locations_id`),
  CONSTRAINT `consoles_ibfk_1` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `consoles`;

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(30) NOT NULL,
  `types_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `types_id` (`types_id`),
  CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`types_id`) REFERENCES `types` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`types_id`) REFERENCES `types` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `locations`;

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `types`;

DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video` int(11) NOT NULL,
  `duration` time NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `videos`;

-- 2018-07-31 13:35:06
