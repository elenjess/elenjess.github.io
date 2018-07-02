-- Adminer 4.6.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `Inc.`;

DROP TABLE IF EXISTS `Итоговый доход`;
CREATE TABLE `Итоговый доход` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Итоговая сумма` int(11) NOT NULL,
  `id сотрудника` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id сотрудника` (`id сотрудника`),
  CONSTRAINT `итоговый доход_ibfk_1` FOREIGN KEY (`id сотрудника`) REFERENCES `Сотрудник` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Итоговый доход` (`id`, `Итоговая сумма`, `id сотрудника`) VALUES
(1,	300,	1),
(2,	350,	2);

DELIMITER ;;

CREATE TRIGGER `Итоговый доход_ai` AFTER INSERT ON `Итоговый доход` FOR EACH ROW
UPDATE `итоговый.доход` SET `итоговая.сумма`=`итоговая.сумма`+`NEW.сумма` WHERE `итоговый.доход_id`=`NEW.итоговый.доход_id`;;

DELIMITER ;

DROP TABLE IF EXISTS `Начисления и списания`;
CREATE TABLE `Начисления и списания` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Сумма` int(11) NOT NULL,
  `id сотрудника` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id сотрудника` (`id сотрудника`),
  CONSTRAINT `начисления и списания_ibfk_1` FOREIGN KEY (`id сотрудника`) REFERENCES `Сотрудник` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Начисления и списания` (`id`, `Сумма`, `id сотрудника`) VALUES
(1,	500,	1),
(2,	500,	2),
(3,	-200,	1),
(4,	-150,	2),
(5,	200,	1),
(6,	200,	2),
(7,	-100,	1),
(8,	100,	1),
(9,	100,	2);

DROP TABLE IF EXISTS `Сотрудник`;
CREATE TABLE `Сотрудник` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ФИО` varchar(30) NOT NULL,
  `Должность` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Сотрудник` (`id`, `ФИО`, `Должность`) VALUES
(1,	'Иванов Иван Иванович',	'Инженер'),
(2,	'Иванова Иоанна Ивановна',	'Бухгалтер');

-- 2018-07-02 16:34:47
