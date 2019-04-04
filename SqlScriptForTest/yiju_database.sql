-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.21-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 yiju_database 的数据库结构
CREATE DATABASE IF NOT EXISTS `yiju_database` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yiju_database`;

-- 导出  表 yiju_database.manager 结构
CREATE TABLE IF NOT EXISTS `manager` (managerorder_form
  `account` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  `name` varchar(10) NOT NULL DEFAULT 'null',
  `Identity` int(1) NOT NULL DEFAULT '1',
  `sequences` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yiju_database.manager 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` (`account`, `password`, `name`, `Identity`, `sequences`) VALUES
	('admin_m', 'admin', 'null', 1, 0);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;

-- 导出  表 yiju_database.order_form 结构
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- 正在导出表  yiju_database.order_form 的数据：~23 rows (大约)
/*!40000 ALTER TABLE `order_form` DISABLE KEYS */;
INSERT INTO `order_form` (`sequences`, `contract_numbers`, `items`, `owners`, `home_decoration_designers`, `wooden_decoration_designers`, `preliminary_survey`, `water_electric_time`, `contract_affirm`, `contract_affirm_time`, `reserve_time`, `board_order_time`, `clothes_board_order_time`, `table_board`, `board_door_table`, `other_cabinet`, `board_reserve_time`, `clothes_board_reserve_time`, `waterchannel_wiring`, `hardware_fitting`, `real_install_time`, `install_left_issue`, `comment`) VALUES
	(1, 'YS-2019-1-20-1', 'asdf', 'ss', '', '', '2018-08-02', '2018-08-03', 'wwwwww', NULL, '2018-09-06', NULL, '2018-08-29', NULL, NULL, 'ddddddddddd', NULL, '2018-08-28', NULL, NULL, NULL, NULL, '是的'),
	(2, 'YS-2019/1/18 0:00:00-2', 'asdfds', 'sddsf', '', '', '2018-10-03', '2018-10-04', NULL, NULL, NULL, '2018-08-29', NULL, '这是台面', '这是门板', 'wwwwwwwwwwwwwsaf', '2018-08-31', NULL, NULL, NULL, NULL, NULL, 'sddsf'),
	(3, 'YS-2019-2-22-3', 'sss', 'sss', '', '', '2018-08-29', '2018-08-30', 'yews', '2019-02-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yews'),
	(4, 'YS-2019-1-18-4', 'test', 'test', 'null', 'null', '2018-09-12', '2018-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是的'),
	(5, 'YS-osajfd_fj;lakdsj', '时空', '李三', '张四', '李五', '2018-12-16', '2019-01-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'YS-2019-2-22-6', '测试', '测试', '', '', '2018-09-04', '2018-08-30', '是的', '2019-02-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sssss', 'sssss', '2018-09-04', 'wwwwwwwwww', 'sssssssssss'),
	(7, 'YS-Test-Input', '阎良', '张三', '张四', '李五', '2018-12-15', '2019-01-10', '', '2019-33-26', NULL, NULL, NULL, NULL, NULL, 'wwwwwwwwwwwwwwwwwww', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, NULL, 'for test', 'test owner', 'home', 'wooden', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, NULL, 'ssstest', 'ssadf', 'lay', 'dd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'YS-Test-Input', 'asdfasdfas', 'asf', 'asdf', 's', NULL, NULL, '', '2019-03-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'YS-Test-Input', 'asdfas', 'ddds', 'sss', 'sdf', NULL, NULL, '', '2019-00-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'YS-Test-Input', 'ASDFAS', 'ASFDSD', '', '', '2018-08-29', '2018-09-01', '', '2019-03-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'YS-Test-Input', 'asdfasfd', 'asdfsd', '', '', NULL, NULL, '', '2019-03-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 'YS-Test-Input', 'ss', 'ss', '', '', NULL, NULL, '', 'YYYY-03-DD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, NULL, 'ss', 'safd', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wwwwww', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, NULL, 'asdfds', 'asdf', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, 'YS-2019-2-22-17', 'sss', 'sss', '', '', NULL, NULL, '是的', '2019-02-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, NULL, 'abc', 'yes', 'di', 'di', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, NULL, 'asfd', 'qwreipu', 'jvam,nsdf', 'poiwer', '2018-08-29', '2018-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, NULL, 'ww', 'wr', 'sadf', 'dd', '2018-09-12', '2018-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, NULL, 'we', 'are', 'hello', 'world', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 'YS-2019-2-22-22', 'test', 'sss', 'lay', 'shiry', '2018-08-29', '2018-08-31', '666', '2019-02-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sssss', 'sssss', NULL, NULL, NULL),
	(23, NULL, '测试项目', '俊杰', '李三', '李五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, NULL, 'test_item', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, NULL, 'ForOneTest', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, NULL, 'ForOneTestw', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, NULL, 'ForOneTest1', '老王', '无', '无', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35, NULL, '测试项目', '俊杰', '李三', '李五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(36, NULL, '测试项目', '俊杰r2q34sf', '李三', '李五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(37, NULL, '测试项目', '我是测试', '李三', '李五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(38, NULL, '测试项目', '我是测试1', '李三', '李五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `order_form` ENABLE KEYS */;

-- 导出  表 yiju_database.root_manager 结构
CREATE TABLE IF NOT EXISTS `root_manager` (
  `account` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  `name` varchar(10) NOT NULL DEFAULT 'null',
  `Identity` int(1) NOT NULL DEFAULT '0',
  `sequences` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yiju_database.root_manager 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `root_manager` DISABLE KEYS */;
INSERT INTO `root_manager` (`account`, `password`, `name`, `Identity`, `sequences`) VALUES
	('admin_rm', 'admin', 'null', 0, 0);
/*!40000 ALTER TABLE `root_manager` ENABLE KEYS */;

-- 导出  表 yiju_database.user_form 结构
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

-- 正在导出表  yiju_database.user_form 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `user_form` DISABLE KEYS */;
INSERT INTO `user_form` (`account`, `password`, `name`, `Identity`, `sequences`) VALUES
	('-0.121', '12345678', '俊杰', 2, 35),
	('0.541299', '12345678', '老王', 2, 29),
	('0da4d833', '12345678', '老王', 2, 28),
	('425174', '12345678', '我是测试1', 2, 38),
	('520968', '12345678', '我是测试', 2, 37),
	('8', '12345678', '俊杰r2q34sf', 2, 36),
	('admin27老王', '12345678', '老王', 2, 27),
	('admin_mm', 'admin', '张三', 2, 7),
	('admin_u', 'admin', '李三', 2, 5),
	('admin_um', 'admin', 'ss', 2, 1),
	('test', '12345678', '老王', 2, 24);
/*!40000 ALTER TABLE `user_form` ENABLE KEYS */;

-- 导出  触发器 yiju_database.order_form_after_insert 结构
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
managerorder_form