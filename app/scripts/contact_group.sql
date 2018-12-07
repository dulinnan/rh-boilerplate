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

 Date: 03/12/2018 14:54:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for contact_group
-- ----------------------------
DROP TABLE IF EXISTS `contact_group`;
CREATE TABLE `contact_group` (
  `contact_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`contact_id`,`group_id`),
  KEY `contact_group` (`contact_id`,`group_id`),
  KEY `fk_group_id` (`group_id`),
  CONSTRAINT `fk_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`),
  CONSTRAINT `fk_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
