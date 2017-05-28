/*
MySQL Backup
Source Server Version: 5.0.96
Source Database: webshop
Date: 2017/5/28 星期日 14:45:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `telephone` varchar(255) default NULL,
  `province` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `dist` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `de_fault` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `address_user` (`user_id`),
  CONSTRAINT `address_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 3072 kB; ';

-- ----------------------------
--  Table structure for `advice`
-- ----------------------------
DROP TABLE IF EXISTS `advice`;
CREATE TABLE `advice` (
  `id` int(11) NOT NULL auto_increment,
  `details` varchar(255) default NULL,
  `tag` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bill`
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `user_id` int(11) NOT NULL,
  `details` varchar(255) default NULL,
  `date` varchar(255) default NULL,
  `money` float(255,0) default NULL,
  KEY `user_bill` (`user_id`),
  CONSTRAINT `user_bill` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `card`
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `id` varchar(255) NOT NULL,
  `user_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `id_number` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `bank` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_card` (`user_id`),
  CONSTRAINT `user_card` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `number` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `g_cart` (`goods_id`),
  KEY `u_cart` (`user_id`),
  CONSTRAINT `g_cart` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `u_cart` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `goods_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `g_Collect` (`goods_id`),
  KEY `u_Collect` (`user_id`),
  CONSTRAINT `g_Collect` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `u_Collect` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(255) NOT NULL auto_increment,
  `brand` varchar(255) default NULL,
  `price` int(11) default NULL,
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
--  Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `goods_id` int(11) default NULL,
  `date` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `u_History` (`user_id`),
  KEY `g_History` (`goods_id`),
  CONSTRAINT `g_History` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `u_History` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `info` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `og`
-- ----------------------------
DROP TABLE IF EXISTS `og`;
CREATE TABLE `og` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  `number` int(11) default NULL,
  `grade` varchar(255) default NULL,
  `details` varchar(255) default NULL,
  `photos` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `goods_og` (`goods_id`),
  KEY `address_og` (`order_id`),
  CONSTRAINT `address_og` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `goods_og` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `address_id` int(11) default NULL,
  `total` int(11) default NULL,
  `transfee` int(11) default NULL,
  `status` int(11) default NULL,
  `date` varchar(255) default NULL,
  `card_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_order` (`user_id`),
  KEY `address_order` (`address_id`),
  KEY `card_order` (`card_id`),
  CONSTRAINT `address_order` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `card_order` FOREIGN KEY (`card_id`) REFERENCES `card` (`id`),
  CONSTRAINT `user_order` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `shop`
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shop_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`shop_id`),
  KEY `user_shop` (`user_id`),
  CONSTRAINT `user_shop` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(255) NOT NULL auto_increment,
  `nickname` varchar(255) default NULL,
  `money` float(255,0) default NULL,
  `telephone` varchar(255) default NULL,
  `birth` varchar(255) default NULL,
  `sex` int(11) default NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `address` VALUES ('1','1','老大的弟弟','13424416519','广东省','深圳市','南山区','白石洲塘头3坊7号','1'), ('2','1','老大','12213141413','广东省','广州市','海珠区','仲恺路500号','0'), ('3','2','老鹅','13414142424','北京','直辖市','中山街5号','东城区','1'), ('4','3','山哥','13421116580','湖北省','武汉市','某个区','一条街','0'), ('7','8','2','2222222222','1','2','3','4','0'), ('8','8','3','3333333333','333','222','111','222','0');
INSERT INTO `bill` VALUES ('1','充值','2017-05-21 09:05:27','87'), ('1','充话费','2017-05-23 09:06:06','-78');
INSERT INTO `card` VALUES ('9559849844868441466','8','2','311510846849484','13215684846','XX银行'), ('9559983968085648017','1','老大','440506209608100048','13415516840','人民银行'), ('9559983968085655528','1','劳尔','440506105908100048','13526649820','农业银行');
INSERT INTO `cart` VALUES ('3','3','1','5'), ('4','2','2','4'), ('8','2','1','1');
INSERT INTO `collect` VALUES ('1','1','2'), ('3','1','3'), ('5','1','1');
INSERT INTO `goods` VALUES ('1','雷蛇','189','雷蛇机械键盘','B78','机械键盘','黑色','有线','107键','USB','混色背光','黑轴','支持','441*182*42mm','1kg左右','金属','可编程全键无冲'), ('2','牧马人','90','牧马人鼠标','C88','无线鼠标','白色','无线','激光','USB&蓝牙','双色背光','1800dpi','支持','13.5*7*4cm','170g','碳纤维','可编程可调节配重块'), ('3','雷蛇','34','激光鼠标','T45','有线鼠标','亮银','有线','光电','USB','无','3600dpi','不支持','13.5*7.4','180g','塑料','宏设置');
INSERT INTO `history` VALUES ('1','1','1','2017-05-21 09:10:27');
INSERT INTO `manager` VALUES ('1','1','1'), ('2','2','2'), ('3','3','3'), ('5','55','5'), ('234','324','3242');
INSERT INTO `og` VALUES ('1','1','1','11','5','无',NULL,'0'), ('2','2','1','21','4',NULL,NULL,NULL), ('4','1','3','13',NULL,NULL,NULL,NULL), ('5','2','4','24',NULL,NULL,NULL,NULL), ('6','3','5','35','2',NULL,NULL,NULL), ('7','1','6','16',NULL,NULL,NULL,NULL), ('8','2','6','2',NULL,NULL,NULL,NULL), ('9','3','6','1',NULL,NULL,NULL,NULL), ('22','1','10','2',NULL,NULL,NULL,NULL), ('23','3','10','5',NULL,NULL,NULL,NULL), ('24','1','11','2',NULL,NULL,NULL,NULL), ('25','3','11','5',NULL,NULL,NULL,NULL), ('26','3','12','5',NULL,NULL,NULL,NULL), ('27','2','12','1',NULL,NULL,NULL,NULL);
INSERT INTO `order` VALUES ('1','1','1','7','1','5','2017-05-22','9559983968085648017'), ('3','1','1','3','2','2','2017-05-23','9559983968085655528'), ('4','1','1','4','1','7','2017-05-24','9559983968085655528'), ('5','1','1','5','5','4','2017-05-22','9559983968085648017'), ('6','1','1','6','6','3','2017-05-22','9559983968085655528'), ('10','1','2','548','0','1','2017-05-28 00:03:22','9559983968085648017'), ('11','1','2','548','0','2','2017-05-28 00:16:11','9559983968085655528'), ('12','1','2','260','0','1','2017-05-28 14:39:56','9559983968085655528');
INSERT INTO `shop` VALUES ('1','1','0'), ('2','2','1'), ('3','3','2'), ('4','4','0'), ('5','5','0'), ('6','6','0'), ('7','8','0'), ('8','8','0');
INSERT INTO `user` VALUES ('1','老二哥','7','12345678901','2017-05-22','1','老大','123456','21@xn--wnu.com'), ('2','唉',NULL,'12325252','2017-05-23','1','老二','123','1@141.com'), ('3',NULL,NULL,NULL,NULL,NULL,'老商','shang',NULL), ('4',NULL,NULL,NULL,'2017-05-10',NULL,'阿菜','fawe',NULL), ('5',NULL,NULL,NULL,NULL,NULL,'多个的','453',NULL), ('6','呢称','0','手机号','生日','0','账号','密码','邮箱'), ('7',NULL,NULL,NULL,NULL,NULL,'1','1',NULL), ('8','22',NULL,'121','2017-05-10','2','2','2','34@xn--nqq'), ('10',NULL,NULL,NULL,NULL,NULL,'3','3',NULL);
