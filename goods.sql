/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : store

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-23 21:35:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `transmission` varchar(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `interface` varchar(255) DEFAULT NULL,
  `backlight` varchar(255) DEFAULT NULL,
  `ergo` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '雷蛇', '189', '雷蛇机械键盘', 'B78', '机械键盘', '黑色', '有线', '107键', 'USB', '混色背光', '支持', '441*182*42mm', '1kg左右', null, '金属', '可编程全键无冲');
INSERT INTO `goods` VALUES ('2', '牧马人', '89.5', '牧马人鼠标', 'C88', '无线鼠标', '白色', '无线', '激光', 'USB&蓝牙', '双色背光', '支持', '13.5*7*4cm', '170g', null, '碳纤维', '可编程可调节配重块');
INSERT INTO `goods` VALUES ('3', '雷蛇', '34', '激光鼠标', 'T45', '有线鼠标', '亮银', '有线', '光电', 'USB', '无', '不支持', '13.5*7.4', '180g', '', '塑料', '宏设置');
