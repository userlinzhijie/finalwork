/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : store

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-12 20:43:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `un` varchar(255) NOT NULL,
  `pw` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('123', '234', '453');
INSERT INTO `login` VALUES ('123', '111', '111');
INSERT INTO `login` VALUES ('123', '123', '123');
INSERT INTO `login` VALUES ('111', '111', '111');
INSERT INTO `login` VALUES ('432', '432', '423');
