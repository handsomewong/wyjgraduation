/*
Navicat MySQL Data Transfer

Source Server         : wyj
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : graduation

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-02-19 20:57:07
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

-- ----------------------------
-- Table structure for clothes
-- ----------------------------
DROP TABLE IF EXISTS `clothes`;
CREATE TABLE `clothes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `cloth` varchar(255) DEFAULT NULL,
  `typess` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `abs` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  CONSTRAINT `clothes_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clothes
-- ----------------------------
INSERT INTO `clothes` VALUES ('1', '百搭衬衫', '春', '白', '纯棉', '衬衫', null, '超好看', '1');
INSERT INTO `clothes` VALUES ('2', '显腿直牛仔裤', '夏', '黑', '牛仔', '阔腿裤', null, null, '2');
INSERT INTO `clothes` VALUES ('3', '小仙女长裙', '秋', '白', '棉', '连衣裙', null, null, '3');
INSERT INTO `clothes` VALUES ('4', '到脚踝鹅绒服', '冬', '白', '鹅绒', '长款羽绒服', null, null, '4');
INSERT INTO `clothes` VALUES ('5', '超酷马丁靴', '夏', '黑', null, '马丁靴', null, null, '5');
INSERT INTO `clothes` VALUES ('6', '', '冬', '米白', null, '八角帽', null, null, '6');

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
