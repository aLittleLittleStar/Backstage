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
  `密码` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yiju_database.manager 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` (`账号`, `密码`) VALUES
	('admin', 'admin');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;

-- 导出  表 yiju_database.order_form 结构
CREATE TABLE IF NOT EXISTS `order_form` (
  `合同编号` varchar(50) NOT NULL,
  `项目` varchar(50) NOT NULL,
  `业主` varchar(50) NOT NULL,
  `家装设计师` varchar(50) NOT NULL,
  `木作设计师` varchar(50) NOT NULL,
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
  PRIMARY KEY (`合同编号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yiju_database.order_form 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `order_form` DISABLE KEYS */;
INSERT INTO `order_form` (`合同编号`, `项目`, `业主`, `家装设计师`, `木作设计师`, `初测/水电`, `复尺`, `合同确认`, `预定安装日期`, `橱柜/衣柜(下单时间)`, `台面`, `橱柜门板`, `衣柜、其他柜门板`, `移门`, `柜体部分`, `水槽、电器`, `五金配件`, `实际安装时间`, `安装遗留问题`, `备注`) VALUES
	('YS-10-10-08', '西航外招', '张铁蛋', '李四', '王九十九', '09.31 初测/10.05水电', '10.25 复尺', '方案确认、颜色未确认', '11.30', '11.05', '缺货未下', '钻牌、翊菲已到厂', '6月11已下（凯迪）', '佳美北郊6月20下午可提货', '待安装', '台上、客户自备自装', '缺货', '12.05', '门板破损', '待验收'),
	('YS-18-10-01', '阎良', '张三', '李四', '王五', '09.31 初测/10.05水电', '10.25 复尺', '10.28签合同', '11.30安装', '11.02', '已下单', '钻牌、翊菲已到厂', '未确定', '待打款', '已下单', '台下、公司', '拉篮、骑马抽已到厂，重型支撑未买', '11.29', '漏下条子', '已验收交工'),
	('YS-18-10-02', '西航外招', '张四', '李七', '王九', '09.31 初测/10.05水电', '10.25 复尺 ', '方案确认、颜色未确认', '11.30安装', '11.05', '缺货未下', '未确定', '6月11已下（凯迪）', '佳美北郊6月20下午可提货', '待安装', '台上、客户自备自装', '缺货', '12.05', '门板破损', '待验收'),
	('YS-18-10-04', '西航外招', '张铁蛋', '李四', '王九十九', '09.31 初测/10.05水电', '10.25 复尺', '方案确认、颜色未确认', '11.30', '11.05', '缺货未下', '钻牌、翊菲已到厂', '6月11已下（凯迪）', '佳美北郊6月20下午可提货', '待安装', '台上、客户自备自装', '缺货', '12.05', '门板破损', '待验收'),
	('YS-19-10-05', '西航外招', '张铁蛋', '李四', '王九十九', '09.31 初测/10.05水电', '10.25 复尺', '方案确认、颜色未确认', '11.30', '11.05', '缺货未下', '钻牌、翊菲已到厂', '6月11已下（凯迪）', '佳美北郊6月20下午可提货', '待安装', '台上、客户自备自装', '缺货', '12.05', '门板破损', '待验收');
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
  `密码` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  yiju_database.user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
