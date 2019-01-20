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
  `账号` varchar(10) NOT NULL,
  `密码` varchar(15) NOT NULL,
  `项目` varchar(50) NOT NULL,
order_formroot_managerroot_managerusermanager  PRIMARY KEY (`项目`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yiju_database.manager 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` (`账号`, `密码`, `项目`) VALUES
	('admin', 'admin', '西航外招');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;

-- 导出  表 yiju_database.order_form 结构
CREATE TABLE IF NOT EXISTS `order_form` (
  `序号` int(11) NOT NULL AUTO_INCREMENT,
  `合同编号` varchar(50) DEFAULT NULL,
  `项目` varchar(50) NOT NULL,
  `业主` varchar(50) NOT NULL,
  `家装设计师` varchar(50) DEFAULT '无',
  `木作设计师` varchar(50) DEFAULT '无',
  `初测/水电` varchar(50) DEFAULT NULL,
  `复尺` varchar(50) DEFAULT NULL,
  `合同确认` varchar(50) DEFAULT NULL,
  `预定安装日期` varchar(50) DEFAULT NULL,
  `橱柜/衣柜(下单时间)` varchar(50) DEFAULT NULL,
  `台面` varchar(50) DEFAULT NULL,
  `橱柜门板` varchar(50) DEFAULT NULL,
  `衣柜、其他柜门板` varchar(50) DEFAULT NULL,
  `移门` varchar(50) DEFAULT NULL,
  `柜体部分` varchar(50) DEFAULT NULL,
  `水槽、电器` varchar(50) DEFAULT NULL,
  `五金配件` varchar(50) DEFAULT NULL,
  `实际安装时间` varchar(50) DEFAULT NULL,
  `安装遗留问题` varchar(100) DEFAULT NULL,
  `备注` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`序号`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- 正在导出表  yiju_database.order_form 的数据：~21 rows (大约)
/*!40000 ALTER TABLE `order_form` DISABLE KEYS */;
INSERT INTO `order_form` (`序号`, `合同编号`, `项目`, `业主`, `家装设计师`, `木作设计师`, `初测/水电`, `复尺`, `合同确认`, `预定安装日期`, `橱柜/衣柜(下单时间)`, `台面`, `橱柜门板`, `衣柜、其他柜门板`, `移门`, `柜体部分`, `水槽、电器`, `五金配件`, `实际安装时间`, `安装遗留问题`, `备注`) VALUES
	(1, NULL, 'asdf', 'ss', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, NULL, 'asdfds', 'sddsf', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, NULL, 'sss', 'sss', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, NULL, 'test', 'test', 'null', 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'YS-osajfd_fj;lakdsj', '时空', '李三', '张四', '李五', '2018-12-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, NULL, '测试', '测试', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'YS-osajfd_fj;lakdsj', '阎良', '张三', '张四', '李五', '2018-12-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, NULL, 'for test', 'test owner', 'home', 'wooden', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, NULL, 'ssstest', 'ssadf', 'lay', 'dd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, NULL, 'asdfasdfas', 'asf', 'asdf', 's', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, NULL, 'asdfas', 'ddds', 'sss', 'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, NULL, 'ASDFAS', 'ASFDSD', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, NULL, 'asdfasfd', 'asdfsd', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, NULL, 'ss', 'ss', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, NULL, 'ss', 'safd', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, NULL, 'asdfds', 'asdf', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, NULL, 'sss', 'sss', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, NULL, 'abc', 'yes', 'di', 'di', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, NULL, 'asfd', 'qwreipu', 'jvam,nsdf', 'poiwer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, NULL, 'ww', 'wr', 'sadf', 'dd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, NULL, 'we', 'are', 'hello', 'world', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, NULL, 'test', 'sss', 'lay', 'shiry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `order_form` ENABLE KEYS */;

-- 导出  表 yiju_database.root_manager 结构
CREATE TABLE IF NOT EXISTS `root_manager` (
  `账号` varchar(10) NOT NULL,
  `密码` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yiju_database.root_manager 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `root_manager` DISABLE KEYS */;
INSERT INTO `root_manager` (`账号`, `密码`) VALUES
	('admin', 'admin');
/*!40000 ALTER TABLE `root_manager` ENABLE KEYS */;

-- 导出  表 yiju_database.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `账号` varchar(10) NOT NULL,
  `密码` varchar(15) NOT NULL,
  `业主` varchar(10) NOT NULL,
  PRIMARY KEY (`业主`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yiju_database.user 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`账号`, `密码`, `业主`) VALUES
	('admin', 'admin', '张三');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
