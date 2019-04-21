-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- Server version:               5.7.21-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL 版本:                  10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for yiju_database
CREATE DATABASE IF NOT EXISTS `yiju_database` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yiju_database`;

-- Dumping structure for table yiju_database.manager
CREATE TABLE IF NOT EXISTS `manager` (
  `account` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  `name` varchar(10) NOT NULL DEFAULT '管理员',
  `Identity` int(1) NOT NULL DEFAULT '1',
  `sequences` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yiju_database.manager: ~1 rows (approximately)
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` (`account`, `password`, `name`, `Identity`, `sequences`) VALUES
	('admin_m', 'admin', '管理员', 1, 0);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;

-- Dumping structure for table yiju_database.order_form
CREATE TABLE IF NOT EXISTS `order_form` (
  `sequences` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contract_numbers` varchar(50) DEFAULT NULL,
  `items` varchar(20) NOT NULL,
  `owners` varchar(10) NOT NULL,
  `home_decoration_designers` varchar(50) DEFAULT '无',
  `wooden_decoration_designers` varchar(50) DEFAULT '无',
  `preliminary_survey` varchar(20) DEFAULT NULL,
  `water_electric_time` varchar(20) DEFAULT NULL,
  `contract_affirm` varchar(50) DEFAULT NULL,
  `contract_affirm_time` varchar(20) DEFAULT NULL,
  `reserve_time` varchar(20) DEFAULT NULL,
  `board_order_time` varchar(20) DEFAULT NULL,
  `clothes_board_order_time` varchar(20) DEFAULT NULL,
  `table_board` varchar(50) DEFAULT NULL,
  `board_door_table` varchar(50) DEFAULT NULL,
  `other_cabinet` varchar(50) DEFAULT NULL,
  `board_reserve_time` varchar(20) DEFAULT NULL,
  `clothes_board_reserve_time` varchar(20) DEFAULT NULL,
  `waterchannel_wiring` varchar(50) DEFAULT NULL,
  `hardware_fitting` varchar(50) DEFAULT NULL,
  `real_install_time` varchar(20) DEFAULT NULL,
  `install_left_issue` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sequences`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table yiju_database.order_form: ~22 rows (approximately)
/*!40000 ALTER TABLE `order_form` DISABLE KEYS */;
INSERT INTO `order_form` (`sequences`, `contract_numbers`, `items`, `owners`, `home_decoration_designers`, `wooden_decoration_designers`, `preliminary_survey`, `water_electric_time`, `contract_affirm`, `contract_affirm_time`, `reserve_time`, `board_order_time`, `clothes_board_order_time`, `table_board`, `board_door_table`, `other_cabinet`, `board_reserve_time`, `clothes_board_reserve_time`, `waterchannel_wiring`, `hardware_fitting`, `real_install_time`, `install_left_issue`, `comment`) VALUES
	(2, NULL, 'ForOneTest', '王老吉', '李三', '赵四', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, NULL, 'ForOneTest', '王老吉', '李三', '赵四', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, NULL, 'test_item', '王老吉', '李三', '赵四', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, NULL, 'test_item', '王老吉', '李三', '赵四', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, NULL, 'test_item', '老王fqwer', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 'yyy', 'ForOneTest', '老王', '无', '无', NULL, NULL, '', '2019-04-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `order_form` ENABLE KEYS */;

-- Dumping structure for table yiju_database.root_manager
CREATE TABLE IF NOT EXISTS `root_manager` (
  `account` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  `name` varchar(10) NOT NULL DEFAULT '超管',
  `Identity` int(1) NOT NULL DEFAULT '0',
  `sequences` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yiju_database.root_manager: ~1 rows (approximately)
/*!40000 ALTER TABLE `root_manager` DISABLE KEYS */;
INSERT INTO `root_manager` (`account`, `password`, `name`, `Identity`, `sequences`) VALUES
	('admin_rm', 'admin', 'null', 0, 0);
/*!40000 ALTER TABLE `root_manager` ENABLE KEYS */;

-- Dumping structure for table yiju_database.user_form
CREATE TABLE IF NOT EXISTS `user_form` (
  `account` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL DEFAULT '12345678',
  `name` varchar(10) NOT NULL,
  `Identity` int(1) NOT NULL DEFAULT '2',
  `sequences` int(11) unsigned NOT NULL,
  PRIMARY KEY (`account`),
  KEY `FK_IdentityWithOrder` (`sequences`),
  CONSTRAINT `FK_IdentityWithOrder` FOREIGN KEY (`sequences`) REFERENCES `order_form` (`sequences`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yiju_database.user_form: ~21 rows (approximately)
/*!40000 ALTER TABLE `user_form` DISABLE KEYS */;
INSERT INTO `user_form` (`account`, `password`, `name`, `Identity`, `sequences`) VALUES
	('157872', '12345678', '老王', 2, 10),
	('238436', '12345678', '王老吉', 2, 3),
	('293911', '12345678', '老王', 2, 20),
	('32408', '12345678', '老王', 2, 19),
	('360382', '12345678', '老王', 2, 17),
	('372329', '12345678', '老王', 2, 21),
	('395172', '12345678', '老王', 2, 9),
	('408258', '12345678', '王老吉', 2, 6),
	('521043', '12345678', '老王', 2, 7),
	('545613', '12345678', '老王', 2, 12),
	('59733', '12345678', '老王', 2, 16),
	('603846', '12345678', '老王', 2, 11),
	('622711', '12345678', '老王', 2, 18),
	('782580', '12345678', '老王', 2, 23),
	('8510', '12345678', '王老吉', 2, 5),
	('882472', '12345678', '王老吉', 2, 2),
	('916528', '12345678', '老王', 2, 13),
	('939329', '12345678', '老王fqwer', 2, 8),
	('945802', '12345678', '老王', 2, 14),
	('973160', '12345678', '老王', 2, 24),
	('979428', '12345678', '老王', 2, 15),
	('979913', '12345678', '老王', 2, 22);
/*!40000 ALTER TABLE `user_form` ENABLE KEYS */;

-- Dumping structure for trigger yiju_database.order_form_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `order_form_after_insert` AFTER INSERT ON `order_form` FOR EACH ROW BEGIN
	declare num int;
	
	set @seq = (select max(sequences) from order_form);
	set @name = (select `owners` from order_form where sequences=@seq);
	set @u_account = left(floor(rand()*1000000), 6);
	
	select count(*) into num from user_form where account=@u_account;
	if (num=0)
		then
			insert into user_form (`account`, `name`, `sequences`) values (@u_account, @name, @seq);
		else
			set @u_account = concat(@u_account, left(rand()*(9-0 + 1)+(0-0.5), 3));
			insert into user_form (`account`, `name`, `sequences`) values (@u_account, @name, @seq);
	end if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
