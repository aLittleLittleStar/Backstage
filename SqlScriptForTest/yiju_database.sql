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
CREATE TABLE IF NOT EXISTS `manager` (
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
  `preliminary_survey` varchar(10) DEFAULT NULL,
  `water_electric_time` varchar(10) DEFAULT NULL,
  `contract_affirm` varchar(50) DEFAULT NULL,
  `contract_affirm_time` varchar(10) DEFAULT NULL,
  `reserve_time` varchar(10) DEFAULT NULL,
  `board_order_time` varchar(10) DEFAULT NULL,
  `clothes_board_order_time` varchar(10) DEFAULT NULL,
  `table_board` varchar(50) DEFAULT NULL,
  `board_door_table` varchar(50) DEFAULT NULL,
  `other_cabinet` varchar(50) DEFAULT NULL,
  `board_reserve_time` varchar(10) DEFAULT NULL,
  `clothes_board_reserve_time` varchar(10) DEFAULT NULL,
  `waterchannel_wiring` varchar(50) DEFAULT NULL,
  `hardware_fitting` varchar(50) DEFAULT NULL,
  `real_install_time` varchar(10) DEFAULT NULL,
  `install_left_issue` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sequences`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- 正在导出表  yiju_database.order_form 的数据：~22 rows (大约)
/*!40000 ALTER TABLE `order_form` DISABLE KEYS */;
INSERT INTO `order_form` (`sequences`, `contract_numbers`, `items`, `owners`, `home_decoration_designers`, `wooden_decoration_designers`, `preliminary_survey`, `water_electric_time`, `contract_affirm`, `contract_affirm_time`, `reserve_time`, `board_order_time`, `clothes_board_order_time`, `table_board`, `board_door_table`, `other_cabinet`, `board_reserve_time`, `clothes_board_reserve_time`, `waterchannel_wiring`, `hardware_fitting`, `real_install_time`, `install_left_issue`, `comment`) VALUES
	(1, 'YS-2019-1-20-1', 'asdf', 'ss', '', '', '2018-08-02', '2018-08-03', 'wwwwww', NULL, '2018-09-06', NULL, '2018-08-29', NULL, NULL, 'ddddddddddd', NULL, '2018-08-28', NULL, NULL, NULL, NULL, '是的'),
	(2, 'YS-2019/1/18 0:00:00-2', 'asdfds', 'sddsf', '', '', '2018-10-03', '2018-10-04', NULL, NULL, NULL, '2018-08-29', NULL, '这是台面', '这是门板', 'wwwwwwwwwwwwwsaf', '2018-08-31', NULL, NULL, NULL, NULL, NULL, 'sddsf'),
	(3, 'YS-2019-2-22-3', 'sss', 'sss', '', '', '2018-08-29', '2018-08-30', 'yews', '2019-02-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yews'),
	(4, 'YS-2019-1-18-4', 'test', 'test', 'null', 'null', '2018-09-12', '2018-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是的'),
	(5, 'YS-osajfd_fj;lakdsj', '时空', '李三', '张四', '李五', '2018-12-16', '2019-01-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'YS-2019-2-22-6', '测试', '测试', '', '', '2018-09-04', '2018-08-30', '是的', '2019-02-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sssss', 'sssss', '2018-09-04', 'wwwwwwwwww', 'sssssssssss'),
	(7, 'YS-osajfd_fj;lakdsj', '阎良', '张三', '张四', '李五', '2018-12-15', '2019-01-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wwwwwwwwwwwwwwwwwww', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, NULL, 'for test', 'test owner', 'home', 'wooden', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, NULL, 'ssstest', 'ssadf', 'lay', 'dd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, NULL, 'asdfasdfas', 'asf', 'asdf', 's', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, NULL, 'asdfas', 'ddds', 'sss', 'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, NULL, 'ASDFAS', 'ASFDSD', '', '', '2018-08-29', '2018-09-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, NULL, 'asdfasfd', 'asdfsd', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, NULL, 'ss', 'ss', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, NULL, 'ss', 'safd', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wwwwww', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, NULL, 'asdfds', 'asdf', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, 'YS-2019-2-22-17', 'sss', 'sss', '', '', NULL, NULL, '是的', '2019-02-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, NULL, 'abc', 'yes', 'di', 'di', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, NULL, 'asfd', 'qwreipu', 'jvam,nsdf', 'poiwer', '2018-08-29', '2018-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, NULL, 'ww', 'wr', 'sadf', 'dd', '2018-09-12', '2018-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, NULL, 'we', 'are', 'hello', 'world', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 'YS-2019-2-22-22', 'test', 'sss', 'lay', 'shiry', '2018-08-29', '2018-08-31', '666', '2019-02-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sssss', 'sssss', NULL, NULL, NULL),
	(23, NULL, '测试项目', '俊杰', '李三', '李五', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
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

-- 正在导出表  yiju_database.user_form 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `user_form` DISABLE KEYS */;
INSERT INTO `user_form` (`account`, `password`, `name`, `Identity`, `sequences`) VALUES
	('admin_mm', 'admin', '张三', 2, 7),
	('admin_u', 'admin', '李三', 2, 5),
	('admin_um', 'admin', 'ss', 2, 1);
/*!40000 ALTER TABLE `user_form` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
