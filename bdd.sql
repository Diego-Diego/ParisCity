-- --------------------------------------------------------
-- Hôte:                         88.198.32.216
-- Version du serveur:           10.8.3-MariaDB-1:10.8.3+maria~bullseye - mariadb.org binary distribution
-- SE du serveur:                debian-linux-gnu
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour s10100_paris
CREATE DATABASE IF NOT EXISTS `s10100_paris` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `s10100_paris`;

-- Listage de la structure de la table s10100_paris. addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.addon_account : ~10 rows (environ)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Livret Bleu', 0),
	('caution', 'caution', 0),
	('society_ambulance', 'EMS', 1),
	('society_banker', 'Banque', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_fire', 'fire', 1),
	('society_gendarme', 'Gendarme', 1),
	('society_gouv', 'Gouvernement', 1),
	('society_journaliste', 'TF1', 1),
	('society_mcd', 'McDonald\'s', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('society_unicorn', 'Unicorn', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.addon_account_data : ~11 rows (environ)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 0, NULL),
	(2, 'society_police', 430, NULL),
	(3, 'society_ambulance', 0, NULL),
	(4, 'society_mechanic', 0, NULL),
	(5, 'society_taxi', 1376, NULL),
	(9, 'society_banker', 0, NULL),
	(12, 'bank_savings', 0, 'e73fa9838ccc0c7b36e07d7861d12901d22cd214'),
	(13, 'caution', 0, 'e73fa9838ccc0c7b36e07d7861d12901d22cd214'),
	(14, 'society_mcd', 0, NULL),
	(15, 'caution', 0, 'd177a0391f10d267a74b356beb0f717e25e51272'),
	(16, 'bank_savings', 0, 'd177a0391f10d267a74b356beb0f717e25e51272'),
	(17, 'society_fire', 0, NULL),
	(18, 'caution', 0, '64f0af59c9f834e6f42010ae9fe1f8988b83f4ff'),
	(19, 'bank_savings', 0, '64f0af59c9f834e6f42010ae9fe1f8988b83f4ff'),
	(20, 'society_unicorn', 0, NULL),
	(21, 'society_gouv', 0, NULL),
	(22, 'society_journaliste', 0, NULL),
	(23, 'society_gendarme', 0, NULL),
	(24, 'caution', 0, '6fd90010663e62b8214c8e6c8690a2e7cff48f5c'),
	(25, 'bank_savings', 0, '6fd90010663e62b8214c8e6c8690a2e7cff48f5c');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.addon_inventory : ~9 rows (environ)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_fire', 'fire', 1),
	('society_gendarme', 'Gendarme', 1),
	('society_gouv', 'Gouvernement', 1),
	('society_journaliste', 'TF1', 1),
	('society_mcd', 'McDonald\'s', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('society_unicorn', 'Unicorn', 1),
	('society_unicorn_fridge', 'Unicorn (frigo)', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.addon_inventory_items : ~0 rows (environ)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. ambulance_rdv
CREATE TABLE IF NOT EXISTS `ambulance_rdv` (
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table s10100_paris.ambulance_rdv : ~0 rows (environ)
/*!40000 ALTER TABLE `ambulance_rdv` DISABLE KEYS */;
INSERT INTO `ambulance_rdv` (`number`, `lastname`, `firstname`, `date`, `phone_number`, `reason`) VALUES
	(1, 'Miller', 'Kevin', '24/10/2022 - 00:58', '555-5818', 'Test 123');
/*!40000 ALTER TABLE `ambulance_rdv` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. banking
CREATE TABLE IF NOT EXISTS `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table s10100_paris.banking : ~2 rows (environ)
/*!40000 ALTER TABLE `banking` DISABLE KEYS */;
INSERT INTO `banking` (`identifier`, `type`, `amount`, `time`, `ID`, `balance`) VALUES
	('e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'WITHDRAW', 50000, 1666483055000, 1, 4100),
	('e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'DEPOSIT', 50000, 1666483075000, 2, 54100);
/*!40000 ALTER TABLE `banking` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.billing : ~0 rows (environ)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.cardealer_vehicles : ~0 rows (environ)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. command_mcd
CREATE TABLE IF NOT EXISTS `command_mcd` (
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table s10100_paris.command_mcd : ~0 rows (environ)
/*!40000 ALTER TABLE `command_mcd` DISABLE KEYS */;
/*!40000 ALTER TABLE `command_mcd` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. crew_phone_bank
CREATE TABLE IF NOT EXISTS `crew_phone_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 1,
  `identifier` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table s10100_paris.crew_phone_bank : ~0 rows (environ)
/*!40000 ALTER TABLE `crew_phone_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `crew_phone_bank` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. crew_phone_news
CREATE TABLE IF NOT EXISTS `crew_phone_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.crew_phone_news : ~0 rows (environ)
/*!40000 ALTER TABLE `crew_phone_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `crew_phone_news` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.datastore : ~11 rows (environ)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_fire', 'fire', 1),
	('society_gendarme', 'Gendarme', 1),
	('society_gouv', 'Gouvernement', 1),
	('society_journaliste', 'TF1', 1),
	('society_mcd', 'McDonald\'s', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('society_unicorn', 'Unicorn', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.datastore_data : ~169 rows (environ)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}'),
	(2, 'society_ambulance', NULL, '{}'),
	(3, 'society_mechanic', NULL, '{}'),
	(4, 'society_taxi', NULL, '{}'),
	(5, 'property', NULL, '{}'),
	(6, 'property', NULL, '{}'),
	(7, 'property', NULL, '{}'),
	(8, 'property', 'char1:e73fa9838ccc0c7b36e07d7861d12901d22cd214', '{}'),
	(9, 'user_ears', 'char1:e73fa9838ccc0c7b36e07d7861d12901d22cd214', '{}'),
	(10, 'user_mask', 'char1:e73fa9838ccc0c7b36e07d7861d12901d22cd214', '{}'),
	(11, 'user_helmet', 'char1:e73fa9838ccc0c7b36e07d7861d12901d22cd214', '{}'),
	(12, 'user_glasses', 'char1:e73fa9838ccc0c7b36e07d7861d12901d22cd214', '{}'),
	(13, 'property', NULL, '{}'),
	(14, 'property', NULL, '{}'),
	(15, 'property', NULL, '{}'),
	(16, 'property', NULL, '{}'),
	(17, 'property', NULL, '{}'),
	(18, 'property', NULL, '{}'),
	(19, 'property', NULL, '{}'),
	(20, 'property', NULL, '{}'),
	(21, 'property', 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', '{}'),
	(22, 'user_helmet', 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', '{}'),
	(23, 'user_ears', 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', '{}'),
	(24, 'user_mask', 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', '{}'),
	(25, 'user_glasses', 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', '{}'),
	(26, 'property', NULL, '{}'),
	(27, 'property', NULL, '{}'),
	(28, 'property', NULL, '{}'),
	(29, 'property', NULL, '{}'),
	(30, 'property', NULL, '{}'),
	(31, 'property', NULL, '{}'),
	(32, 'property', NULL, '{}'),
	(33, 'property', NULL, '{}'),
	(34, 'property', NULL, '{}'),
	(35, 'property', NULL, '{}'),
	(36, 'property', NULL, '{}'),
	(37, 'property', NULL, '{}'),
	(38, 'property', NULL, '{}'),
	(39, 'property', NULL, '{}'),
	(40, 'property', NULL, '{}'),
	(41, 'property', NULL, '{}'),
	(42, 'property', NULL, '{}'),
	(43, 'property', NULL, '{}'),
	(44, 'property', NULL, '{}'),
	(45, 'property', NULL, '{}'),
	(46, 'property', NULL, '{}'),
	(47, 'property', NULL, '{}'),
	(48, 'property', NULL, '{}'),
	(49, 'property', NULL, '{}'),
	(50, 'property', NULL, '{}'),
	(51, 'property', NULL, '{}'),
	(52, 'property', NULL, '{}'),
	(53, 'property', NULL, '{}'),
	(54, 'property', NULL, '{}'),
	(55, 'property', NULL, '{}'),
	(56, 'property', NULL, '{}'),
	(57, 'property', NULL, '{}'),
	(58, 'property', NULL, '{}'),
	(59, 'property', NULL, '{}'),
	(60, 'property', NULL, '{}'),
	(61, 'property', NULL, '{}'),
	(62, 'property', NULL, '{}'),
	(63, 'property', NULL, '{}'),
	(64, 'property', NULL, '{}'),
	(65, 'property', NULL, '{}'),
	(66, 'property', NULL, '{}'),
	(67, 'property', NULL, '{}'),
	(68, 'property', NULL, '{}'),
	(69, 'property', NULL, '{}'),
	(70, 'property', NULL, '{}'),
	(71, 'society_mcd', NULL, '\'{}\''),
	(72, 'property', NULL, '{}'),
	(73, 'property', NULL, '{}'),
	(74, 'property', NULL, '{}'),
	(75, 'property', NULL, '{}'),
	(76, 'property', NULL, '{}'),
	(77, 'property', NULL, '{}'),
	(78, 'property', NULL, '{}'),
	(79, 'property', NULL, '{}'),
	(80, 'property', NULL, '{}'),
	(81, 'property', NULL, '{}'),
	(82, 'property', NULL, '{}'),
	(83, 'property', NULL, '{}'),
	(84, 'property', NULL, '{}'),
	(85, 'property', NULL, '{}'),
	(86, 'property', NULL, '{}'),
	(87, 'property', NULL, '{}'),
	(88, 'property', NULL, '{}'),
	(89, 'property', NULL, '{}'),
	(90, 'property', NULL, '{}'),
	(91, 'property', NULL, '{}'),
	(92, 'property', NULL, '{}'),
	(93, 'property', NULL, '{}'),
	(94, 'property', NULL, '{}'),
	(95, 'property', NULL, '{}'),
	(96, 'property', NULL, '{}'),
	(97, 'property', NULL, '{}'),
	(98, 'property', NULL, '{}'),
	(99, 'property', NULL, '{}'),
	(100, 'property', NULL, '{}'),
	(101, 'property', NULL, '{}'),
	(102, 'property', NULL, '{}'),
	(103, 'property', NULL, '{}'),
	(104, 'property', NULL, '{}'),
	(105, 'property', NULL, '{}'),
	(106, 'property', NULL, '{}'),
	(107, 'property', NULL, '{}'),
	(108, 'property', NULL, '{}'),
	(109, 'property', NULL, '{}'),
	(110, 'property', NULL, '{}'),
	(111, 'property', NULL, '{}'),
	(112, 'property', NULL, '{}'),
	(113, 'property', NULL, '{}'),
	(114, 'property', NULL, '{}'),
	(115, 'property', NULL, '{}'),
	(116, 'property', NULL, '{}'),
	(117, 'property', NULL, '{}'),
	(118, 'property', NULL, '{}'),
	(119, 'property', NULL, '{}'),
	(120, 'property', NULL, '{}'),
	(121, 'property', NULL, '{}'),
	(122, 'property', NULL, '{}'),
	(123, 'property', NULL, '{}'),
	(124, 'property', NULL, '{}'),
	(125, 'property', NULL, '{}'),
	(126, 'property', NULL, '{}'),
	(127, 'property', NULL, '{}'),
	(128, 'property', NULL, '{}'),
	(129, 'property', NULL, '{}'),
	(130, 'property', NULL, '{}'),
	(131, 'property', NULL, '{}'),
	(132, 'property', NULL, '{}'),
	(133, 'property', NULL, '{}'),
	(134, 'property', NULL, '{}'),
	(135, 'property', NULL, '{}'),
	(136, 'property', NULL, '{}'),
	(137, 'property', NULL, '{}'),
	(138, 'property', NULL, '{}'),
	(139, 'property', NULL, '{}'),
	(140, 'property', NULL, '{}'),
	(141, 'property', NULL, '{}'),
	(142, 'property', NULL, '{}'),
	(143, 'property', NULL, '{}'),
	(144, 'property', NULL, '{}'),
	(145, 'property', NULL, '{}'),
	(146, 'property', NULL, '{}'),
	(147, 'property', NULL, '{}'),
	(148, 'property', NULL, '{}'),
	(149, 'property', NULL, '{}'),
	(150, 'property', NULL, '{}'),
	(151, 'property', NULL, '{}'),
	(152, 'property', NULL, '{}'),
	(153, 'property', NULL, '{}'),
	(154, 'property', NULL, '{}'),
	(155, 'user_helmet', 'd177a0391f10d267a74b356beb0f717e25e51272', '{}'),
	(156, 'user_glasses', 'd177a0391f10d267a74b356beb0f717e25e51272', '{}'),
	(157, 'user_ears', 'd177a0391f10d267a74b356beb0f717e25e51272', '{}'),
	(158, 'property', 'd177a0391f10d267a74b356beb0f717e25e51272', '{}'),
	(159, 'user_mask', 'd177a0391f10d267a74b356beb0f717e25e51272', '{}'),
	(160, 'society_fire', NULL, '\'{}\''),
	(161, 'property', '64f0af59c9f834e6f42010ae9fe1f8988b83f4ff', '{}'),
	(162, 'user_ears', '64f0af59c9f834e6f42010ae9fe1f8988b83f4ff', '{}'),
	(163, 'user_mask', '64f0af59c9f834e6f42010ae9fe1f8988b83f4ff', '{}'),
	(164, 'user_helmet', '64f0af59c9f834e6f42010ae9fe1f8988b83f4ff', '{}'),
	(165, 'user_glasses', '64f0af59c9f834e6f42010ae9fe1f8988b83f4ff', '{}'),
	(166, 'society_unicorn', NULL, '\'{}\''),
	(167, 'society_gouv', NULL, '\'{}\''),
	(168, 'society_journaliste', NULL, '\'{}\''),
	(169, 'society_gendarme', NULL, '\'{}\''),
	(170, 'property', '6fd90010663e62b8214c8e6c8690a2e7cff48f5c', '{}'),
	(171, 'user_ears', '6fd90010663e62b8214c8e6c8690a2e7cff48f5c', '{}'),
	(172, 'user_glasses', '6fd90010663e62b8214c8e6c8690a2e7cff48f5c', '{}'),
	(173, 'user_helmet', '6fd90010663e62b8214c8e6c8690a2e7cff48f5c', '{}'),
	(174, 'user_mask', '6fd90010663e62b8214c8e6c8690a2e7cff48f5c', '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table s10100_paris.dpkeybinds : ~1 rows (environ)
/*!40000 ALTER TABLE `dpkeybinds` DISABLE KEYS */;
INSERT INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
	('license:e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('license:d177a0391f10d267a74b356beb0f717e25e51272', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000134fc6709', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000135032e49', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('license:6fd90010663e62b8214c8e6c8690a2e7cff48f5c', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');
/*!40000 ALTER TABLE `dpkeybinds` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. factions
CREATE TABLE IF NOT EXISTS `factions` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.factions : ~0 rows (environ)
/*!40000 ALTER TABLE `factions` DISABLE KEYS */;
INSERT INTO `factions` (`name`, `label`) VALUES
	('citizen', 'RSA');
/*!40000 ALTER TABLE `factions` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. faction_grades
CREATE TABLE IF NOT EXISTS `faction_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faction_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.faction_grades : ~0 rows (environ)
/*!40000 ALTER TABLE `faction_grades` DISABLE KEYS */;
INSERT INTO `faction_grades` (`id`, `faction_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'citizen', 0, 'citizen', 'Citoyen', 200, '{}', '{}');
/*!40000 ALTER TABLE `faction_grades` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table s10100_paris.fine_types : ~28 rows (environ)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Atteinte à la pudeur', 5000, 0),
	(2, 'Conduite avec un véhicule dégradé', 5000, 0),
	(3, 'Conduite dangereuse', 10000, 0),
	(4, 'Conduite en contre-sens', 5000, 0),
	(5, 'Conduite sans port de casque', 1500, 0),
	(6, 'Corruption', 30000, 0),
	(7, 'Défaut de présentation des documents d\'identité', 5000, 0),
	(8, 'Dissimulation du visage', 5000, 0),
	(9, 'Excès de vitesse 1-10km/h', 1000, 0),
	(10, 'Excès de vitesse 11-20 km/h', 1500, 0),
	(11, 'Excès de vitesse 21-30 km/h', 2000, 0),
	(12, 'Excès de vitesse 31-50 km/h', 5000, 0),
	(13, 'Excès de vitesse 51+ km/h', 7500, 0),
	(14, 'Extorsion / Escroquerie', 40000, 0),
	(15, 'Faux (Fabrication)', 10000, 0),
	(16, 'Incivilité sur la voie publique (sans débordement)', 1000, 0),
	(17, 'Ivresse sur la voie publique', 5000, 0),
	(18, 'Kidnapping', 30000, 0),
	(19, 'Mendicité en lieu public', 500, 0),
	(20, 'Organisation évènementiel sans autorisation', 5500, 0),
	(21, 'Port d\'un holster sans PPA', 2000, 0),
	(22, 'Possession de cannabis', 50, 0),
	(23, 'Possession d\'un équipement sans autorisation', 5000, 0),
	(24, 'Possession de méthamphétamine', 100, 0),
	(25, 'Présence piétonne sur une autoroute', 2000, 0),
	(26, 'Prise d’otage', 30000, 0),
	(27, 'Provocation sans raison des forces de l\'ordre', 20000, 0),
	(28, 'Stationnement gênant', 2000, 0),
	(29, 'Stationnement Interdit', 2000, 0),
	(30, 'Trafic de Meth', 200, 0),
	(31, 'Usage de Faux', 20000, 0),
	(32, 'Véhicule dégradé', 1500, 0),
	(33, 'Violation de propriété privée', 10000, 0),
	(34, 'Agression sur agent (employé d\'Etat ou police)', 40000, 1),
	(35, 'Agression sur citoyen', 7000, 1),
	(36, 'Braconnage (Chasse / Pêche illégal)', 5000, 1),
	(37, 'Braconnage (Espèce Protégée)', 8000, 1),
	(38, 'Braquage à main armée Citoyens', 10000, 1),
	(39, 'Braquage à main armée Supérette', 24000, 1),
	(40, 'Cambriolage', 15000, 1),
	(41, 'Chantage', 7000, 1),
	(42, 'Complicité de braquage à main armée', 15000, 1),
	(43, 'Conduite avec facultés affaiblies (grave)', 4000, 1),
	(44, 'Conduite en état d\'ivresse (> 0.5g/l)', 2000, 1),
	(45, 'Conduite sans permis', 2500, 1),
	(46, 'Conduite sous interdiction de permis', 5000, 1),
	(47, 'Course de rue illégale', 5500, 1),
	(48, 'Dégradation de biens privés', 2500, 1),
	(49, 'Dégradation de biens publics', 2500, 1),
	(50, 'Dégradation de matériel public', 3000, 1),
	(51, 'Délit de fuite', 8000, 1),
	(52, 'Dénonciation calomnieuse', 10000, 1),
	(53, 'Destruction de preuve(s)', 60000, 1),
	(54, 'Diffamation avérée', 5000, 1),
	(55, 'Entrave aux Services Publics / SPAM bipeur', 5000, 1),
	(56, 'Entrave volontaire à la circulation', 1000, 1),
	(57, 'Espionnage', 2000, 1),
	(58, 'Exhibition d’armes', 7000, 1),
	(59, 'Exhibition d’armes lourdes', 14000, 1),
	(60, 'Faux Appels (Canulars)', 4000, 1),
	(61, 'Harcèlement', 6000, 1),
	(62, 'Menaces de mort ET/OU Menaces graves', 5000, 1),
	(63, 'Mise en danger de la vie d’autrui', 7000, 1),
	(64, 'Non assistance à personne en danger', 2000, 1),
	(65, 'Non présentation à une convocation de police', 2000, 1),
	(66, 'Non respect de l\'assignation géographique', 3000, 1),
	(67, 'Non respect du contrôle judiciaire', 8000, 1),
	(68, 'Obstruction à la justice', 10000, 1),
	(69, 'Outrage à employé d\'Etat (Gouvernement / EMS) et Barreau (Avocat)', 15000, 1),
	(70, 'Port d\'arme de chasse non réglementaire', 10000, 1),
	(71, 'Possession d\'arme avec numéro de série illisible', 8000, 1),
	(72, 'Possession d\'arme non déclarée et/ou sans permis', 12000, 1),
	(73, 'Possession de cocaïne', 100, 1),
	(74, 'Possession importante de munitions', 100, 1),
	(75, 'Recel de véhicule volé', 10000, 1),
	(76, 'Recel de vol (objets / armes légales)', 5000, 1),
	(77, 'Refus d’obtempérer', 5000, 1),
	(78, 'Refus de se soumettre à une injonction', 5000, 1),
	(79, 'Sollicitation ou incitation à la prostitution', 10000, 1),
	(80, 'Tentative de corruption', 10000, 1),
	(81, 'Trouble à l’ordre public', 4000, 1),
	(82, 'Usurpation d\'identité / fonction', 10000, 1),
	(83, 'Vol', 5000, 1),
	(84, 'Vol de produits et d\'équipements d\'entreprise', 300, 1),
	(85, 'Vol de véhicule', 3000, 1),
	(86, 'Achat d\'armes illégales', 5000, 2),
	(87, 'Agression sur citoyen avec arme à feu', 25000, 2),
	(88, 'Braquage à main armée Fleeca', 40000, 2),
	(89, 'Braquage de banque', 55000, 2),
	(90, 'Braquage de la Pacific Bank', 100000, 2),
	(91, 'Détournement de fonds', 35000, 2),
	(92, 'Emploi Fictif', 20000, 2),
	(93, 'Entrave à une opération/enquête/Faux témoignage', 30000, 2),
	(94, 'Entreposage d\'armes illégales (> 2)', 10000, 2),
	(95, 'Fraude Fiscale', 10000, 2),
	(96, 'Homicide involontaire', 25000, 2),
	(97, 'Meurtre', 50000, 2),
	(98, 'Possession d\'arme sous interdiction PPA', 25000, 2),
	(99, 'Possession d’arme illégale', 20000, 2),
	(100, 'Propos racistes ou homophobes', 5000, 2),
	(101, 'Séquestration', 15000, 2),
	(102, 'Tentative d\'extorsion/escroquerie', 30000, 2),
	(103, 'Tentative de destruction de preuve(s)', 30000, 2),
	(104, 'Tentative de dissimulation de preuve(s)', 5000, 2),
	(105, 'Tentative de meurtre', 50000, 2),
	(106, 'Terrorisme', 200000, 2),
	(107, 'Trafic d’armes', 15000, 2),
	(108, 'Trafic de cannabis', 100, 2),
	(109, 'Trafic de cocaïne', 250, 2),
	(110, 'Violation du secret professionnel', 50000, 2),
	(111, 'Assassinat (Meurtre prémédité)', 120000, 3),
	(112, 'Association de malfaiteurs', 80000, 3),
	(113, 'Cavale', 40000, 3),
	(114, 'Tentative d\'assassinat (prémédité)', 90000, 3);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.items : ~5 rows (environ)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('blue_phone', 'Téléphone bleue', 1, 0, 1),
	('green_phone', 'Téléphone vert', 1, 0, 1),
	('weed', 'Weed (Humide)', 1, 0, 1),
	('weed_trait', 'Weed (Sèche)', 1, 0, 1),
	('white_phone', 'Téléphone blanc', 1, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.jobs : ~20 rows (environ)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'Samu', 1),
	('banker', 'Banquier', 1),
	('cardealer', 'Concessionnaire', 1),
	('fire', 'Pompier', 1),
	('fisherman', 'Pecheur', 0),
	('fueler', 'Raffineur', 0),
	('gendarme', 'Gendarmerie', 1),
	('gouv', 'Gouvernement', 1),
	('journaliste', 'TF1', 1),
	('lumberjack', 'Bucheron', 0),
	('mcd', 'McDonalds', 1),
	('mechanic', 'Norauto', 1),
	('miner', 'Miner', 0),
	('police', 'Police N.', 1),
	('reporter', 'Reporter', 1),
	('slaughterer', 'Abatteur', 0),
	('tailor', 'Couturier', 0),
	('taxi', 'Taxi', 1),
	('unemployed', 'Chômeur', 0),
	('unicorn', 'Unicorn', 1);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.job_grades : ~70 rows (environ)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'RSA', 200, '{}', '{}'),
	(11, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
	(12, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(13, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
	(14, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(15, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(16, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(17, 'fueler', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(18, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(19, 'tailor', 0, 'employee', 'Employee', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(20, 'miner', 0, 'employee', 'Employee', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(21, 'slaughterer', 0, 'employee', 'Employee', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(22, 'ambulance', 0, 'ambulance', 'Jr. EMT', 20, '{"chain_1":30, "chain_2":0, "tshirt_2":0,"hair_color_1":5,"glasses_2":0,"shoes":77,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":129,"helmet_1":122,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(23, 'ambulance', 1, 'doctor', 'EMT', 40, '{"chain_1":30, "chain_2":0, "tshirt_2":0,"hair_color_1":5,"glasses_2":0,"shoes":77,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":129,"helmet_1":122,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(24, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 60, '{"chain_1":30, "chain_2":0, "tshirt_2":0,"hair_color_1":5,"glasses_2":0,"shoes":77,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":129,"helmet_1":122,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(25, 'ambulance', 3, 'boss', 'EMT Supervisor', 80, '{"chain_1":30, "chain_2":0, "tshirt_2":0,"hair_color_1":5,"glasses_2":0,"shoes":77,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":129,"helmet_1":122,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(26, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
	(27, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
	(28, 'mechanic', 2, 'experimente', 'Experienced', 36, '{}', '{}'),
	(29, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}'),
	(30, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}'),
	(31, 'taxi', 0, 'recrue', 'nil', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(32, 'taxi', 1, 'novice', 'Cabby', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(33, 'taxi', 2, 'experimente', 'Experienced', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(34, 'taxi', 3, 'uber', 'Uber Cabby', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(35, 'taxi', 4, 'boss', 'Lead Cabby', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(36, 'banker', 0, 'advisor', 'Conseiller', 10, '{}', '{}'),
	(37, 'banker', 1, 'banker', 'Banquier', 20, '{}', '{}'),
	(38, 'banker', 2, 'business_banker', 'Banquier d\'affaire', 30, '{}', '{}'),
	(39, 'banker', 3, 'trader', 'Trader', 40, '{}', '{}'),
	(40, 'banker', 4, 'boss', 'Patron', 0, '{}', '{}'),
	(41, 'mcd', 0, 'McCleaner', 'Nettoyeur', 200, '{}', '{}'),
	(42, 'mcd', 1, 'McCashier', 'Caissier', 250, '{}', '{}'),
	(43, 'mcd', 2, 'McCook', 'Cuisinier', 250, '{}', '{}'),
	(44, 'mcd', 3, 'McDelivery', 'Livreur', 250, '{}', '{}'),
	(45, 'mcd', 4, 'McBoss', 'Patron', 350, '{}', '{}'),
	(46, 'police', 0, 'Stagiaire', 'Stagiaire', 280, '{}', '{}'),
	(47, 'police', 1, 'recruit', 'Gardien de la paix', 350, '{}', '{}'),
	(48, 'police', 2, 'officier', 'Brigadier', 400, '{}', '{}'),
	(49, 'police', 3, 'officier', 'Brigadier chef', 450, '{}', '{}'),
	(50, 'police', 4, 'sergent', 'Lieutenant', 500, '{}', '{}'),
	(51, 'police', 5, 'sergent', 'Capitaine', 600, '{}', '{}'),
	(52, 'police', 6, 'boss', 'Commandant', 650, '{}', '{}'),
	(53, 'police', 7, 'boss', 'Commissaire', 700, '{}', '{}'),
	(54, 'fire', 0, 'recruit', 'Recrue', 20, '{"tshirt_1":57,"torso_1":55,"arms":0,"pants_1":35,"glasses":0,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":5,"face":19,"glasses_2":1,"torso_2":0,"shoes":24,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":8}', '{"tshirt_1":34,"torso_1":48,"shoes":24,"pants_1":34,"torso_2":0,"decals_2":0,"hair_color_2":0,"glasses":0,"helmet_2":0,"hair_2":3,"face":21,"decals_1":0,"glasses_2":1,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"pants_2":0,"arms":14,"hair_color_1":10,"tshirt_2":0,"helmet_1":57}'),
	(55, 'fire', 1, 'sergeant', 'Sergent', 40, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":1,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"arms":0,"decals_1":8,"torso_2":0,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"hair_color_1":5,"glasses":0,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":14,"pants_1":34,"pants_2":0,"decals_2":1,"hair_color_2":0,"shoes":24,"helmet_2":0,"hair_2":3,"decals_1":7,"torso_2":0,"face":21,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"glasses_2":1,"hair_color_1":10,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(56, 'fire', 2, 'lieutenant', 'Lieutenant', 65, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":2,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"glasses":0,"decals_1":8,"hair_color_1":5,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"torso_2":0,"arms":41,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":44,"pants_1":34,"hair_2":3,"decals_2":2,"hair_color_2":0,"hair_color_1":10,"helmet_2":0,"face":21,"shoes":24,"torso_2":0,"glasses_2":1,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"pants_2":0,"decals_1":7,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(57, 'fire', 3, 'boss', 'Commandant', 80, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":3,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"arms":41,"torso_2":0,"hair_color_1":5,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"decals_1":8,"glasses":0,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":44,"pants_1":34,"pants_2":0,"decals_2":3,"hair_color_2":0,"face":21,"helmet_2":0,"hair_2":3,"decals_1":7,"torso_2":0,"hair_color_1":10,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"glasses_2":1,"shoes":24,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(58, 'unicorn', 0, 'barman', 'Barman', 300, '{}', '{}'),
	(59, 'unicorn', 1, 'dancer', 'Danseur', 300, '{}', '{}'),
	(60, 'unicorn', 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
	(61, 'unicorn', 3, 'boss', 'Gérant', 600, '{}', '{}'),
	(62, 'journaliste', 0, 'interim', 'Livreur', 100, '{}', '{}'),
	(63, 'journaliste', 1, 'journalist', 'Journaliste', 100, '{}', '{}'),
	(64, 'journaliste', 2, 'reporter', 'Reporter', 100, '{}', '{}'),
	(65, 'journaliste', 3, 'chief', 'Rédacteur en chef', 100, '{}', '{}'),
	(66, 'journaliste', 4, 'boss', 'Patron', 100, '{}', '{}'),
	(67, 'gouv', 0, 'stagiaire', 'Stagiaire', 350, '{}', '{}'),
	(68, 'gouv', 1, 'secretaire', 'Secrétaire', 550, '{}', '{}'),
	(69, 'gouv', 2, 'agents', 'Agent de sécu', 700, '{}', '{}'),
	(70, 'gouv', 3, 'juge', 'Juge', 800, '{}', '{}'),
	(71, 'gouv', 4, 'boss', 'Gouv', 1000, '{}', '{}'),
	(72, 'gendarme', 0, 'recruit', 'Gendarme', 150, '{}', '{}'),
	(73, 'gendarme', 2, 'officer', 'Brigadier-Chef', 250, '{}', '{}'),
	(74, 'gendarme', 4, 'lieutenant', 'Adjudant-Chef', 500, '{}', '{}'),
	(75, 'gendarme', 5, 'lieutenant', 'Major', 600, '{}', '{}'),
	(76, 'gendarme', 3, 'sergeant', 'Adjudant', 450, '{}', '{}'),
	(77, 'gendarme', 1, 'recruit', 'Brigadier ', 500, '{}', '{}'),
	(78, 'gendarme', 6, 'boss', 'Lieutenant', 800, '{}', '{}'),
	(79, 'gendarme', 7, 'boss', 'Capitaine', 850, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.licenses : ~5 rows (environ)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Driving Permit'),
	('drive', 'Drivers License'),
	('drive_bike', 'Motorcycle License'),
	('drive_truck', 'Commercial Drivers License'),
	('weed_processing', 'Weed Processing License');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. multicharacter_slots
CREATE TABLE IF NOT EXISTS `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL,
  `slots` int(11) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.multicharacter_slots : ~0 rows (environ)
/*!40000 ALTER TABLE `multicharacter_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `multicharacter_slots` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.owned_vehicles : ~4 rows (environ)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`, `parking`, `pound`, `glovebox`, `trunk`) VALUES
	('64f0af59c9f834e6f42010ae9fe1f8988b83f4ff', 'DDP 568', '{"doorsBroken":{"0":false,"2":false,"1":false,"4":false,"3":false},"model":674271439,"plate":"DDP 568","modFrame":-1,"tankHealth":1000.0,"modVanityPlate":-1,"tyreSmokeColor":[255,255,255],"modRightFender":-1,"modTrimA":-1,"modArmor":-1,"modRearBumper":-1,"modShifterLeavers":-1,"modSmokeEnabled":false,"windowTint":-1,"modXenon":false,"modDoorR":-1,"plateIndex":4,"modGrille":-1,"modAirFilter":-1,"modAPlate":-1,"modSideSkirt":-1,"color2":0,"modFender":-1,"wheelColor":0,"modExhaust":-1,"modOrnaments":-1,"modSteeringWheel":-1,"modRoof":-1,"modEngineBlock":-1,"color1":0,"extras":{"2":1,"1":1,"6":1,"5":1},"windowsBroken":{"6":false,"5":false,"0":false,"7":false,"2":false,"1":false,"4":false,"3":false},"tyreBurst":{"0":false,"5":false,"4":false,"1":false},"modHydrolic":-1,"modDial":-1,"modBackWheels":-1,"bodyHealth":1000.0,"modTank":-1,"modDoorSpeaker":-1,"modHorns":-1,"modAerials":-1,"engineHealth":1000.0,"modBrakes":-1,"modDashboard":-1,"fuelLevel":47.0,"modSuspension":-1,"modLightbar":-1,"pearlescentColor":0,"dirtLevel":2.0,"modPlateHolder":-1,"modStruts":-1,"modEngine":-1,"neonEnabled":[false,false,false,false],"modTurbo":false,"modTrunk":-1,"modTransmission":-1,"neonColor":[255,0,255],"xenonColor":255,"modArchCover":-1,"modHood":-1,"modSeats":-1,"wheels":0,"modSpeakers":-1,"modLivery":0,"modFrontBumper":-1,"modSpoilers":-1,"modFrontWheels":-1,"modTrimB":-1}', 'car', 'gendarme', 1, NULL, NULL, NULL, NULL),
	('d177a0391f10d267a74b356beb0f717e25e51272', 'FGE 157', '{"modRightFender":-1,"color1":0,"modSideSkirt":-1,"modVanityPlate":-1,"modRoof":-1,"model":-1961627517,"wheels":0,"modArmor":-1,"modDoorR":-1,"modTrunk":-1,"windowTint":-1,"modSeats":-1,"xenonColor":255,"modTransmission":-1,"modExhaust":-1,"wheelColor":156,"tyreSmokeColor":[255,255,255],"modTank":-1,"modSpoilers":-1,"modSpeakers":-1,"modGrille":-1,"modSuspension":-1,"plateIndex":0,"modDoorSpeaker":-1,"modFender":-1,"modXenon":false,"modLightbar":-1,"engineHealth":1000.0,"plate":"FGE 157","modFrontBumper":-1,"tyreBurst":{"5":false,"4":false,"0":false,"1":false},"tankHealth":1000.0,"neonColor":[255,0,255],"modDashboard":-1,"modFrame":-1,"extras":{"1":1,"10":false,"11":false,"4":1,"12":1,"2":1},"modDial":-1,"modEngine":-1,"modHorns":-1,"modAirFilter":-1,"modBackWheels":-1,"modTrimA":-1,"bodyHealth":1000.0,"modTurbo":false,"modSteeringWheel":-1,"modOrnaments":-1,"modStruts":-1,"modFrontWheels":-1,"pearlescentColor":2,"fuelLevel":57.8,"modTrimB":-1,"color2":0,"modSmokeEnabled":false,"modAPlate":-1,"modLivery":-1,"modHydrolic":-1,"dirtLevel":6.0,"windowsBroken":{"1":false,"0":false,"7":false,"6":false,"5":false,"4":false,"3":false,"2":false},"modRearBumper":-1,"modEngineBlock":-1,"modShifterLeavers":-1,"doorsBroken":{"1":false,"0":false,"6":false,"5":false,"4":false,"3":false,"2":false},"neonEnabled":[false,false,false,false],"modAerials":-1,"modHood":-1,"modArchCover":-1,"modBrakes":-1,"modPlateHolder":-1}', 'car', 'gouv', 0, NULL, NULL, NULL, NULL),
	('d177a0391f10d267a74b356beb0f717e25e51272', 'GOE 536', '{"fuelLevel":44.3,"wheels":1,"modTrimB":-1,"color1":134,"modSmokeEnabled":false,"modEngineBlock":-1,"model":2046537925,"modRoof":-1,"modGrille":-1,"dirtLevel":0.0,"modHorns":-1,"modArchCover":-1,"modSpeakers":-1,"tankHealth":1000.0,"modFrontWheels":-1,"modLivery":-1,"neonEnabled":[false,false,false,false],"modXenon":false,"doorsBroken":{"1":false,"2":false,"3":false,"4":false,"0":false},"modDial":-1,"modTank":-1,"modTrimA":-1,"modAerials":-1,"neonColor":[255,0,255],"tyreBurst":{"1":false,"0":false,"5":false,"4":false},"modSeats":-1,"modVanityPlate":-1,"modFender":-1,"modRearBumper":-1,"modAirFilter":-1,"modShifterLeavers":-1,"modHydrolic":-1,"color2":134,"modAPlate":-1,"modSuspension":-1,"pearlescentColor":156,"modOrnaments":-1,"engineHealth":1000.0,"extras":[],"modTurbo":false,"modPlateHolder":-1,"plate":"GOE 536","modSteeringWheel":-1,"modFrame":-1,"modArmor":-1,"modStruts":-1,"windowTint":-1,"modDoorSpeaker":-1,"modRightFender":-1,"plateIndex":4,"modEngine":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"bodyHealth":1000.0,"modLightbar":-1,"modDashboard":-1,"modDoorR":-1,"modFrontBumper":-1,"modExhaust":-1,"modTransmission":-1,"modSideSkirt":-1,"xenonColor":255,"wheelColor":156,"modBrakes":-1,"modSpoilers":-1,"windowsBroken":{"1":false,"2":false,"3":false,"4":true,"5":true,"6":false,"7":false,"0":false},"modHood":-1,"modTrunk":-1}', 'car', 'gouv', 0, NULL, NULL, NULL, NULL),
	('d177a0391f10d267a74b356beb0f717e25e51272', 'LFC 611', '{"modRightFender":-1,"color1":6,"modSideSkirt":-1,"modVanityPlate":-1,"modRoof":-1,"model":-1095688294,"wheels":7,"modArmor":-1,"modDoorR":-1,"modTrunk":-1,"windowTint":-1,"modSeats":-1,"xenonColor":255,"modTransmission":-1,"modExhaust":-1,"wheelColor":7,"tyreSmokeColor":[255,255,255],"modTank":-1,"modSpoilers":-1,"modSpeakers":-1,"modGrille":-1,"modSuspension":-1,"plateIndex":0,"modDoorSpeaker":-1,"modFender":-1,"modXenon":false,"modLightbar":-1,"engineHealth":1000.0,"plate":"LFC 611","modFrontBumper":-1,"tyreBurst":{"5":false,"4":false,"0":false,"1":false},"tankHealth":1000.0,"neonColor":[255,0,255],"modDashboard":-1,"modFrame":-1,"extras":{"11":1,"1":1,"12":false},"modDial":-1,"modEngine":-1,"modHorns":-1,"modAirFilter":-1,"modBackWheels":-1,"modTrimA":-1,"bodyHealth":1000.0,"modTurbo":false,"modSteeringWheel":-1,"modOrnaments":-1,"modStruts":-1,"modFrontWheels":-1,"pearlescentColor":1,"fuelLevel":40.2,"modTrimB":-1,"color2":0,"modSmokeEnabled":false,"modAPlate":-1,"modLivery":-1,"modHydrolic":-1,"dirtLevel":0.0,"windowsBroken":{"1":false,"0":false,"7":false,"6":false,"5":false,"4":false,"3":false,"2":false},"modRearBumper":-1,"modEngineBlock":-1,"modShifterLeavers":-1,"doorsBroken":{"1":false,"0":false,"6":false,"5":false,"4":false,"3":false,"2":false},"neonEnabled":[false,false,false,false],"modAerials":-1,"modHood":-1,"modArchCover":-1,"modBrakes":-1,"modPlateHolder":-1}', 'car', 'gouv', 0, NULL, NULL, NULL, NULL),
	('d177a0391f10d267a74b356beb0f717e25e51272', 'OPC 995', '{"modRightFender":-1,"color1":4,"modSideSkirt":-1,"modVanityPlate":-1,"modRoof":-1,"model":859560111,"wheels":0,"modArmor":-1,"modDoorR":-1,"modTrunk":-1,"windowTint":-1,"modSeats":-1,"xenonColor":255,"modTransmission":-1,"modExhaust":-1,"wheelColor":156,"tyreSmokeColor":[255,255,255],"modTank":-1,"modSpoilers":-1,"modSpeakers":-1,"modGrille":-1,"modSuspension":-1,"plateIndex":0,"modDoorSpeaker":-1,"modFender":-1,"modXenon":false,"modLightbar":-1,"engineHealth":1000.0,"plate":"OPC 995","modFrontBumper":-1,"tyreBurst":{"5":false,"4":false,"0":false,"1":false},"tankHealth":1000.0,"neonColor":[255,0,255],"modDashboard":-1,"modFrame":-1,"extras":{"1":1,"3":false,"2":false},"modDial":-1,"modEngine":-1,"modHorns":-1,"modAirFilter":-1,"modBackWheels":-1,"modTrimA":-1,"bodyHealth":1000.0,"modTurbo":false,"modSteeringWheel":-1,"modOrnaments":-1,"modStruts":-1,"modFrontWheels":-1,"pearlescentColor":122,"fuelLevel":45.0,"modTrimB":-1,"color2":80,"modSmokeEnabled":false,"modAPlate":-1,"modLivery":-1,"modHydrolic":-1,"dirtLevel":6.0,"windowsBroken":{"1":false,"0":false,"7":false,"6":false,"5":true,"4":true,"3":false,"2":false},"modRearBumper":-1,"modEngineBlock":-1,"modShifterLeavers":-1,"doorsBroken":{"1":false,"0":false,"6":false,"5":false,"4":false,"3":false,"2":false},"neonEnabled":[false,false,false,false],"modAerials":-1,"modHood":-1,"modArchCover":-1,"modBrakes":-1,"modPlateHolder":-1}', 'car', 'gouv', 1, NULL, NULL, NULL, NULL),
	('e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'PMY 022', '{"plate":"PMY 022","model":-344943009}', 'car', NULL, 2, NULL, 'LosSantos', NULL, NULL);
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.ox_inventory : ~0 rows (environ)
/*!40000 ALTER TABLE `ox_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ox_inventory` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.phone_app_chat : ~0 rows (environ)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL,
  `num` varchar(10) NOT NULL,
  `incoming` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16291 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.phone_calls : ~0 rows (environ)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45219 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.phone_messages : 0 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `mynumero` varchar(50) DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4708 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.phone_users_contacts : 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.rented_vehicles : ~0 rows (environ)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.society_moneywash : ~0 rows (environ)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. sublime_bans
CREATE TABLE IF NOT EXISTS `sublime_bans` (
  `identifier` varchar(40) NOT NULL,
  `reason` longtext DEFAULT NULL,
  `expiration` varchar(50) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.sublime_bans : ~0 rows (environ)
/*!40000 ALTER TABLE `sublime_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `sublime_bans` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. sublime_data
CREATE TABLE IF NOT EXISTS `sublime_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '**NIL**',
  `data` longtext DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.sublime_data : ~0 rows (environ)
/*!40000 ALTER TABLE `sublime_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sublime_data` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. sublime_permissions
CREATE TABLE IF NOT EXISTS `sublime_permissions` (
  `identifier` varchar(100) NOT NULL,
  `rank` int(2) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.sublime_permissions : ~0 rows (environ)
/*!40000 ALTER TABLE `sublime_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sublime_permissions` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb3 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1734 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table s10100_paris.twitter_accounts : ~0 rows (environ)
/*!40000 ALTER TABLE `twitter_accounts` DISABLE KEYS */;
INSERT INTO `twitter_accounts` (`id`, `username`, `password`, `avatar_url`, `identifier`) VALUES
	(1733, 'Kevin Miller', '0', NULL, 'e73fa9838ccc0c7b36e07d7861d12901d22cd214');
/*!40000 ALTER TABLE `twitter_accounts` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=605 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table s10100_paris.twitter_likes : ~0 rows (environ)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11048 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table s10100_paris.twitter_tweets : ~0 rows (environ)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
INSERT INTO `twitter_tweets` (`id`, `authorId`, `realUser`, `message`, `image`, `time`, `likes`) VALUES
	(11047, 1733, 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'test', '', '2022-11-11 23:38:01', 0);
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `faction` varchar(20) DEFAULT 'citizen',
  `faction_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `pincode` int(11) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.users : ~1 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `faction`, `faction_grade`, `loadout`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `id`, `disabled`, `last_property`, `created_at`, `last_seen`, `pincode`, `phone_number`) VALUES
	('64f0af59c9f834e6f42010ae9fe1f8988b83f4ff', '{"bank":50200,"money":0,"black_money":0}', 'dev', '[{"slot":1,"count":1,"name":"green_phone"}]', 'unemployed', 0, 'citizen', 0, '[]', '{"heading":0.0,"x":251.1,"y":-1011.4,"z":29.3}', 'Lucas', 'Crew', '25/12/1995', 'm', 75, '{"torso_2":0,"bags_1":0,"blush_3":0,"neck_thickness":0,"blemishes_1":0,"mom":21,"helmet_1":-1,"bracelets_1":-1,"decals_2":0,"glasses_2":0,"sun_1":0,"jaw_2":0,"watches_2":0,"chin_4":0,"decals_1":0,"blush_2":0,"pants_2":0,"ears_1":-1,"face_md_weight":50,"hair_2":0,"eye_squint":0,"mask_1":-1,"eyebrows_3":0,"bodyb_4":0,"sun_2":0,"beard_4":0,"moles_2":0,"chain_1":0,"jaw_1":0,"bproof_2":0,"torso_1":71,"bags_2":0,"eyebrows_6":0,"hair_color_2":0,"eyebrows_1":0,"tshirt_1":-1,"ears_2":0,"cheeks_1":0,"nose_1":0,"shoes_1":7,"lipstick_2":0,"nose_3":0,"eyebrows_4":0,"arms_2":0,"shoes_2":0,"lipstick_1":0,"hair_1":2,"lip_thickness":0,"bracelets_2":0,"chest_1":0,"blemishes_2":0,"chin_3":0,"makeup_2":0,"tshirt_2":0,"skin_md_weight":50,"nose_6":0,"glasses_1":-1,"lipstick_4":0,"beard_3":0,"cheeks_2":0,"chin_2":0,"hair_color_1":0,"nose_2":0,"moles_1":0,"eye_color":0,"blush_1":0,"eyebrows_5":0,"helmet_2":0,"complexion_1":0,"bodyb_3":-1,"age_1":0,"arms":0,"sex":0,"pants_1":3,"cheeks_3":0,"chain_2":0,"lipstick_3":0,"beard_1":0,"bodyb_2":0,"complexion_2":0,"mask_2":0,"makeup_4":0,"nose_5":0,"chest_2":0,"dad":0,"nose_4":0,"bodyb_1":-1,"eyebrows_2":0,"bproof_1":0,"chest_3":0,"makeup_1":0,"beard_2":0,"age_2":0,"watches_1":-1,"makeup_3":0,"chin_1":0}', '[{"val":0,"name":"drunk","percent":0.0},{"val":476500,"name":"hunger","percent":47.65},{"val":482375,"name":"thirst","percent":48.2375}]', 0, 8, 0, NULL, '2022-11-11 23:50:28', '2022-11-12 00:01:48', NULL, '555-9585'),
	('6fd90010663e62b8214c8e6c8690a2e7cff48f5c', '{"bank":50000}', 'user', NULL, 'unemployed', 0, 'citizen', 0, NULL, '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}', 'Léo', 'Dubois', '25/05/1995', 'm', 175, NULL, NULL, 0, 9, 0, NULL, '2022-11-12 00:28:55', '2022-11-12 00:31:07', NULL, '555-3886');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. user_contacts
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_contacts_identifier_name_number` (`identifier`,`name`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.user_contacts : ~0 rows (environ)
/*!40000 ALTER TABLE `user_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contacts` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.user_licenses : ~0 rows (environ)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.vehicles : ~13 rows (environ)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.vehicle_categories : ~11 rows (environ)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.vehicle_sold : ~0 rows (environ)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(46) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Listage des données de la table s10100_paris.whitelist : ~0 rows (environ)
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

-- Listage de la structure de la table s10100_paris. xbilling
CREATE TABLE IF NOT EXISTS `xbilling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `raison` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `society` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table s10100_paris.xbilling : ~4 rows (environ)
/*!40000 ALTER TABLE `xbilling` DISABLE KEYS */;
INSERT INTO `xbilling` (`id`, `identifier`, `sender`, `raison`, `amount`, `society`) VALUES
	(8, 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'test', 10, 'society_police'),
	(9, 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'test', 10, 'society_police'),
	(10, 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'test', 10, 'society_police'),
	(11, 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'e73fa9838ccc0c7b36e07d7861d12901d22cd214', 'test', 10, 'society_police');
/*!40000 ALTER TABLE `xbilling` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
