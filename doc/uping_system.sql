/*
Navicat MySQL Data Transfer

Source Server         : LocalHost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : uping_system

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-02-07 00:22:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for system_lsh
-- ----------------------------
DROP TABLE IF EXISTS `system_lsh`;
CREATE TABLE `system_lsh` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(20) NOT NULL COMMENT '表名',
  `lsh` bigint(10) NOT NULL COMMENT '当前流水号',
  PRIMARY KEY (`id`),
  KEY `idex_table_name` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统流水号表';

-- ----------------------------
-- Records of system_lsh
-- ----------------------------
INSERT INTO `system_lsh` VALUES ('1', 'system_school', '2');
