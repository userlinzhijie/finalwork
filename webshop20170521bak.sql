/*
MySQL Backup
Source Server Version: 5.0.96
Source Database: webshop
Date: 2017/5/21 星期日 18:27:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `info` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `shop`
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shop_id` int(16) NOT NULL,
  `user_id` int(16) NOT NULL,
  `status` int(16) default NULL,
  PRIMARY KEY  (`shop_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(16) NOT NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `manager` VALUES ('1','1','1'), ('2','2','2'), ('3','3','3'), ('5','55','5'), ('234','324','3242');
INSERT INTO `shop` VALUES ('12','1','0'), ('13','12311','1'), ('14','2','2');
INSERT INTO `user` VALUES ('1','老大','first'), ('2','老二','second'), ('12311','阿菜','fawe');
