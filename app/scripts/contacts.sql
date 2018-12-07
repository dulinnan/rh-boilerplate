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

 Date: 01/12/2018 14:19:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `company` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1744 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Triggers structure for table contacts
-- ----------------------------
DROP TRIGGER IF EXISTS `insertEmail`;
delimiter ;;
CREATE TRIGGER `insertEmail` BEFORE INSERT ON `contacts` FOR EACH ROW BEGIN
IF NOT (SELECT NEW.email REGEXP '^[A-Z0-9._%-]+@[A-Z0-9.-]+.[A-Z]{2,4}$') THEN
-- bad data
SIGNAL SQLSTATE '40000';
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table contacts
-- ----------------------------
DROP TRIGGER IF EXISTS `updateEmail`;
delimiter ;;
CREATE TRIGGER `updateEmail` BEFORE UPDATE ON `contacts` FOR EACH ROW BEGIN
IF NOT (SELECT NEW.email REGEXP '^[A-Z0-9._%-]+@[A-Z0-9.-]+.[A-Z]{2,4}$') THEN
-- bad data
SIGNAL SQLSTATE '40000';
END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
