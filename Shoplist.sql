/*
MySQL Backup
Source Server Version: 5.0.96
Source Database: webshop
Date: 2017/5/23 星期二 19:49:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(255) NOT NULL auto_increment,
  `brand` varchar(255) default NULL,
  `price` float default NULL,
  `name` varchar(255) default NULL,
  `version` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `color` varchar(255) default NULL,
  `transmission` varchar(255) default NULL,
  `standard` varchar(255) default NULL,
  `interface` varchar(255) default NULL,
  `backlight` varchar(255) default NULL,
  `shaft_type` varchar(255) default NULL,
  `ergo` varchar(255) default NULL,
  `size` varchar(255) default NULL,
  `weight` varchar(255) default NULL,
  `material` varchar(255) default NULL,
  `details` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `goods` VALUES ('1','雷蛇','189','雷蛇机械键盘','B78','机械键盘','黑色','有线','107键','USB','混色背光','黑轴','支持','441*182*42mm','1kg左右','金属','可编程全键无冲'), ('2','牧马人','89.5','牧马人鼠标','C88','无线鼠标','白色','无线','激光','USB&蓝牙','双色背光','1800dpi','支持','13.5*7*4cm','170g','碳纤维','可编程可调节配重块'), ('3','雷蛇','34','激光鼠标','T45','有线鼠标','亮银','有线','光电','USB','无','3600dpi','不支持','13.5*7.4','180g','塑料','宏设置');
