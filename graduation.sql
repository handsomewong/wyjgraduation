/*
Navicat MySQL Data Transfer

Source Server         : wyj
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : graduation

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-02-24 15:49:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '上衣');
INSERT INTO `category` VALUES ('2', '裤子');
INSERT INTO `category` VALUES ('3', '裙装');
INSERT INTO `category` VALUES ('4', '外套');
INSERT INTO `category` VALUES ('5', '鞋子');
INSERT INTO `category` VALUES ('6', '配饰');
INSERT INTO `category` VALUES ('7', '眼妆');
INSERT INTO `category` VALUES ('8', '腮红');
INSERT INTO `category` VALUES ('9', '口红');

-- ----------------------------
-- Table structure for clothes
-- ----------------------------
DROP TABLE IF EXISTS `clothes`;
CREATE TABLE `clothes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `cloth` varchar(255) DEFAULT NULL,
  `typess` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `abs` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`),
  CONSTRAINT `clothes_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`),
  CONSTRAINT `clothes_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `season` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clothes
-- ----------------------------
INSERT INTO `clothes` VALUES ('1', '百搭衬衫', '白', '纯棉', '衬衫', 'http://localhost:8443/api/file/mjbi96.jpg', '超好看', '1', '1');
INSERT INTO `clothes` VALUES ('2', '显腿直牛仔裤', '黑', '牛仔', '阔腿裤', 'http://localhost:8443/api/file/slkirr.jpg', null, '2', '2');
INSERT INTO `clothes` VALUES ('3', '小仙女长裙', '白', '棉', '连衣裙', 'http://localhost:8443/api/file/473tue.jpg', null, '3', '2');
INSERT INTO `clothes` VALUES ('4', '到脚踝鹅绒服', '白', '鹅绒', '长款羽绒服', 'http://localhost:8443/api/file/61kr9o.jpg', null, '4', '4');
INSERT INTO `clothes` VALUES ('5', '超酷马丁靴', '黑', '皮', '马丁靴', 'http://localhost:8443/api/file/umze6x.jpg', '八孔', '5', '1');
INSERT INTO `clothes` VALUES ('8', '皮质八角帽', '黑', '皮', '八角帽', 'http://localhost:8443/api/file/e9l9v0.jpg', '超酷', '6', '4');
INSERT INTO `clothes` VALUES ('9', '亮晶晶眼影', '橘黄', 'ssp', '眼影盘', 'http://localhost:8443/api/file/wug9of.jpg', '', '7', '1');
INSERT INTO `clothes` VALUES ('10', '可爱腮红', '粉', 'Nars', '单色腮红', 'http://localhost:8443/api/file/7jiuqu.jpg', '', '8', '2');

-- ----------------------------
-- Table structure for season
-- ----------------------------
DROP TABLE IF EXISTS `season`;
CREATE TABLE `season` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of season
-- ----------------------------
INSERT INTO `season` VALUES ('1', '全季节');
INSERT INTO `season` VALUES ('2', '春秋');
INSERT INTO `season` VALUES ('3', '夏');
INSERT INTO `season` VALUES ('4', '冬');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123');
