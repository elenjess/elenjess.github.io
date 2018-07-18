-- Adminer 4.6.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `VIDEO`;

DROP TABLE IF EXISTS `console`;
CREATE TABLE `console` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `console` (`id`, `name`, `location`) VALUES
(1,	'PANASONIC_M300',	'OMEGA'),
(2,	'SONY_GG01',	'Kazan_Federal_University'),
(3,	'SONY_GG01',	'Kazan_Federal_University'),
(4,	'LG_N900',	'DUMBALLA'),
(5,	'SAMSUNG_P10',	'RUBIN'),
(6,	'PANASONIC M500',	'CITY_MALL');

DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `console_id` int(11) NOT NULL,
  `location_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `console_id` (`console_id`),
  KEY `location_type_id` (`location_type_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`console_id`) REFERENCES `console` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `location_ibfk_2` FOREIGN KEY (`location_type_id`) REFERENCES `location_type` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `location_type`;
CREATE TABLE `location_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_of_location` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `console_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `console_id` (`console_id`),
  CONSTRAINT `location_type_ibfk_1` FOREIGN KEY (`console_id`) REFERENCES `console` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `location_type` (`id`, `type_of_location`, `console_id`) VALUES
(2,	'shopping center',	1),
(3,	'universities',	2),
(4,	'bars',	4),
(5,	'sport_centers',	5);

DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `console_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `location_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `console_id` (`console_id`),
  KEY `location_id` (`location_id`),
  KEY `location_type_id` (`location_type_id`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`console_id`) REFERENCES `console` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `videos_ibfk_3` FOREIGN KEY (`location_type_id`) REFERENCES `location_type` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2018-07-18 18:07:55
