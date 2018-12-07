/*
 Navicat Premium Data Transfer

 Source Server         : rh-db
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : rh-holidays-db.cvaigtzmlayy.ap-northeast-1.rds.amazonaws.com:3306
 Source Schema         : rh

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 01/12/2018 18:32:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_title` varchar(50) NOT NULL,
  `category_description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, 'G1', 'Modern home offering good quality accommodation,  spacious indoor and living areas, private facilities (either on suite bathroom or separate guest bathroom and toilet)');
INSERT INTO `category` VALUES (2, 'G2', 'Slightly older home (over 10 years) offering comfortable guest accommodation, guest (shared) bathroom and toilet facilities G2 historic home');
INSERT INTO `category` VALUES (3, 'G3', 'Standard comfortable home, shared bathroom and toilet facilities ');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
