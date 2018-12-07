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

 Date: 01/12/2018 13:36:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `group_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `group_desc` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
