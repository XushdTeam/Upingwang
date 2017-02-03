/*
Navicat MySQL Data Transfer

Source Server         : LocalHost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : uping_system

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-02-04 01:01:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for system_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionary`;
CREATE TABLE `system_dictionary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dic_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '字典名称',
  `parent` bigint(10) NOT NULL COMMENT '父级',
  `status` int(1) DEFAULT '1' COMMENT '1启用0停用',
  `delflag` int(1) DEFAULT '0' COMMENT '1删除0未删除',
  `create_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idex_parent` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统字典表';

-- ----------------------------
-- Records of system_dictionary
-- ----------------------------
INSERT INTO `system_dictionary` VALUES ('1', '系统功能', '0', '1', '0', 'Xushd', '2017-01-23 15:28:55');
INSERT INTO `system_dictionary` VALUES ('2', '系统', '1', '1', '0', 'Xushd', '2017-01-23 15:29:43');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `log_method` varchar(200) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '方法',
  `log_type` int(1) NOT NULL COMMENT '操作类型0 正常 1异常',
  `module_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日志说明',
  `method_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_ip` char(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '请求IP',
  `exception_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '异常code',
  `exception_detail` text COLLATE utf8_unicode_ci COMMENT '异常详细',
  `params` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '请求参数',
  `user_name` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'root' COMMENT '操作用户名',
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '日志时间',
  PRIMARY KEY (`id`),
  KEY `idex_log_time` (`log_time`)
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统日志表';

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES ('1', 'com.uping.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '192.168.1.186', null, null, null, 'Xushd', '2017-01-19 22:43:38');
INSERT INTO `system_log` VALUES ('2', 'com.uping.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '192.168.1.186', null, null, null, 'Xushd', '2017-01-20 16:21:51');
INSERT INTO `system_log` VALUES ('3', 'com.uping.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '192.168.1.186', null, null, null, 'Xushd', '2017-01-20 16:21:50');
INSERT INTO `system_log` VALUES ('4', 'com.uping.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 15:00:16');
INSERT INTO `system_log` VALUES ('5', 'com.uping.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 15:07:12');
INSERT INTO `system_log` VALUES ('6', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '登录模块', '用户退出', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 15:10:32');
INSERT INTO `system_log` VALUES ('7', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:28:47');
INSERT INTO `system_log` VALUES ('8', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:30:15');
INSERT INTO `system_log` VALUES ('9', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:31:11');
INSERT INTO `system_log` VALUES ('10', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:34:45');
INSERT INTO `system_log` VALUES ('11', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:40:12');
INSERT INTO `system_log` VALUES ('12', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:40:20');
INSERT INTO `system_log` VALUES ('13', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:40:27');
INSERT INTO `system_log` VALUES ('14', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:51:21');
INSERT INTO `system_log` VALUES ('15', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:51:28');
INSERT INTO `system_log` VALUES ('16', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:52:16');
INSERT INTO `system_log` VALUES ('17', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:53:25');
INSERT INTO `system_log` VALUES ('18', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:54:01');
INSERT INTO `system_log` VALUES ('19', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:54:03');
INSERT INTO `system_log` VALUES ('20', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:54:04');
INSERT INTO `system_log` VALUES ('21', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 16:54:11');
INSERT INTO `system_log` VALUES ('22', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:02:38');
INSERT INTO `system_log` VALUES ('23', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:16:13');
INSERT INTO `system_log` VALUES ('24', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:16:15');
INSERT INTO `system_log` VALUES ('25', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:20:00');
INSERT INTO `system_log` VALUES ('26', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:20:14');
INSERT INTO `system_log` VALUES ('27', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:22:00');
INSERT INTO `system_log` VALUES ('28', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:22:04');
INSERT INTO `system_log` VALUES ('29', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:22:18');
INSERT INTO `system_log` VALUES ('30', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:22:47');
INSERT INTO `system_log` VALUES ('31', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:23:53');
INSERT INTO `system_log` VALUES ('32', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:28:57');
INSERT INTO `system_log` VALUES ('33', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:32:31');
INSERT INTO `system_log` VALUES ('34', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:35:33');
INSERT INTO `system_log` VALUES ('35', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:46:31');
INSERT INTO `system_log` VALUES ('36', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:49:50');
INSERT INTO `system_log` VALUES ('37', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:50:33');
INSERT INTO `system_log` VALUES ('38', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 17:56:20');
INSERT INTO `system_log` VALUES ('39', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 19:09:56');
INSERT INTO `system_log` VALUES ('40', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 19:10:30');
INSERT INTO `system_log` VALUES ('41', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 19:13:08');
INSERT INTO `system_log` VALUES ('42', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 19:19:32');
INSERT INTO `system_log` VALUES ('43', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 19:19:48');
INSERT INTO `system_log` VALUES ('44', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 19:19:48');
INSERT INTO `system_log` VALUES ('45', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 19:20:27');
INSERT INTO `system_log` VALUES ('46', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 19:22:01');
INSERT INTO `system_log` VALUES ('47', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 19:22:23');
INSERT INTO `system_log` VALUES ('48', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 19:22:55');
INSERT INTO `system_log` VALUES ('49', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 19:22:55');
INSERT INTO `system_log` VALUES ('50', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-22 19:23:01');
INSERT INTO `system_log` VALUES ('51', 'com.uping.controller.LoginController.lock()', '0', '登录模块', '用户锁屏', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:26:32');
INSERT INTO `system_log` VALUES ('52', 'com.uping.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:26:47');
INSERT INTO `system_log` VALUES ('53', 'com.uping.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:39:47');
INSERT INTO `system_log` VALUES ('54', 'com.uping.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:40:22');
INSERT INTO `system_log` VALUES ('55', 'com.uping.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:45:01');
INSERT INTO `system_log` VALUES ('56', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:51:03');
INSERT INTO `system_log` VALUES ('57', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:51:16');
INSERT INTO `system_log` VALUES ('58', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:51:17');
INSERT INTO `system_log` VALUES ('59', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:51:45');
INSERT INTO `system_log` VALUES ('60', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:51:47');
INSERT INTO `system_log` VALUES ('61', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:51:59');
INSERT INTO `system_log` VALUES ('62', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:52:01');
INSERT INTO `system_log` VALUES ('63', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:52:32');
INSERT INTO `system_log` VALUES ('64', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:52:33');
INSERT INTO `system_log` VALUES ('65', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 09:52:45');
INSERT INTO `system_log` VALUES ('66', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:06:40');
INSERT INTO `system_log` VALUES ('67', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:06:41');
INSERT INTO `system_log` VALUES ('68', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:07:07');
INSERT INTO `system_log` VALUES ('69', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:07:08');
INSERT INTO `system_log` VALUES ('70', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:09:54');
INSERT INTO `system_log` VALUES ('71', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:19:04');
INSERT INTO `system_log` VALUES ('72', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:23:48');
INSERT INTO `system_log` VALUES ('73', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:24:19');
INSERT INTO `system_log` VALUES ('74', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:24:23');
INSERT INTO `system_log` VALUES ('75', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:37:03');
INSERT INTO `system_log` VALUES ('76', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:37:26');
INSERT INTO `system_log` VALUES ('77', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:37:27');
INSERT INTO `system_log` VALUES ('78', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:37:51');
INSERT INTO `system_log` VALUES ('79', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:37:53');
INSERT INTO `system_log` VALUES ('80', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:38:15');
INSERT INTO `system_log` VALUES ('81', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:38:16');
INSERT INTO `system_log` VALUES ('82', 'com.uping.controller.PermissionController.permissionDelete()', '0', '权限管理', '权限删除', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:38:22');
INSERT INTO `system_log` VALUES ('83', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:38:23');
INSERT INTO `system_log` VALUES ('84', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:38:37');
INSERT INTO `system_log` VALUES ('85', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:38:39');
INSERT INTO `system_log` VALUES ('86', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:39:02');
INSERT INTO `system_log` VALUES ('87', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:39:03');
INSERT INTO `system_log` VALUES ('88', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:39:35');
INSERT INTO `system_log` VALUES ('89', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 10:39:36');
INSERT INTO `system_log` VALUES ('90', 'com.uping.controller.PermissionController.ajaxPermissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 11:32:26');
INSERT INTO `system_log` VALUES ('91', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 13:15:04');
INSERT INTO `system_log` VALUES ('92', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:23:54');
INSERT INTO `system_log` VALUES ('93', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:24:13');
INSERT INTO `system_log` VALUES ('94', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:24:16');
INSERT INTO `system_log` VALUES ('95', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:24:19');
INSERT INTO `system_log` VALUES ('96', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:24:25');
INSERT INTO `system_log` VALUES ('97', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:37:23');
INSERT INTO `system_log` VALUES ('98', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:37:25');
INSERT INTO `system_log` VALUES ('99', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:38:29');
INSERT INTO `system_log` VALUES ('100', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:38:42');
INSERT INTO `system_log` VALUES ('101', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:39:36');
INSERT INTO `system_log` VALUES ('102', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:40:03');
INSERT INTO `system_log` VALUES ('103', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:40:04');
INSERT INTO `system_log` VALUES ('104', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:40:32');
INSERT INTO `system_log` VALUES ('105', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:40:34');
INSERT INTO `system_log` VALUES ('106', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:40:58');
INSERT INTO `system_log` VALUES ('107', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:41:00');
INSERT INTO `system_log` VALUES ('108', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:41:15');
INSERT INTO `system_log` VALUES ('109', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:41:16');
INSERT INTO `system_log` VALUES ('110', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:41:29');
INSERT INTO `system_log` VALUES ('111', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:41:33');
INSERT INTO `system_log` VALUES ('112', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:41:34');
INSERT INTO `system_log` VALUES ('113', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:41:43');
INSERT INTO `system_log` VALUES ('114', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:41:45');
INSERT INTO `system_log` VALUES ('115', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:41:54');
INSERT INTO `system_log` VALUES ('116', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:41:55');
INSERT INTO `system_log` VALUES ('117', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:42:10');
INSERT INTO `system_log` VALUES ('118', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:42:25');
INSERT INTO `system_log` VALUES ('119', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:42:27');
INSERT INTO `system_log` VALUES ('120', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:42:41');
INSERT INTO `system_log` VALUES ('121', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:42:42');
INSERT INTO `system_log` VALUES ('122', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:42:47');
INSERT INTO `system_log` VALUES ('123', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:42:48');
INSERT INTO `system_log` VALUES ('124', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:42:59');
INSERT INTO `system_log` VALUES ('125', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:43:00');
INSERT INTO `system_log` VALUES ('126', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:43:10');
INSERT INTO `system_log` VALUES ('127', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:43:11');
INSERT INTO `system_log` VALUES ('128', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:43:28');
INSERT INTO `system_log` VALUES ('129', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:50:43');
INSERT INTO `system_log` VALUES ('130', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 14:50:48');
INSERT INTO `system_log` VALUES ('131', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:19:20');
INSERT INTO `system_log` VALUES ('132', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:27:40');
INSERT INTO `system_log` VALUES ('133', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:27:56');
INSERT INTO `system_log` VALUES ('134', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:28:10');
INSERT INTO `system_log` VALUES ('135', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:28:29');
INSERT INTO `system_log` VALUES ('136', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:28:31');
INSERT INTO `system_log` VALUES ('137', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:28:36');
INSERT INTO `system_log` VALUES ('138', 'com.uping.controller.DictionaryController.dictionarySave()', '0', '字典管理', '字典新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:28:55');
INSERT INTO `system_log` VALUES ('139', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:28:57');
INSERT INTO `system_log` VALUES ('140', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:29:12');
INSERT INTO `system_log` VALUES ('141', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:29:29');
INSERT INTO `system_log` VALUES ('142', 'com.uping.controller.DictionaryController.dictionarySave()', '0', '字典管理', '字典新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:29:43');
INSERT INTO `system_log` VALUES ('143', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:29:45');
INSERT INTO `system_log` VALUES ('144', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:30:30');
INSERT INTO `system_log` VALUES ('145', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:31:19');
INSERT INTO `system_log` VALUES ('146', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:32:13');
INSERT INTO `system_log` VALUES ('147', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:32:17');
INSERT INTO `system_log` VALUES ('148', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 15:32:18');
INSERT INTO `system_log` VALUES ('149', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:20:15');
INSERT INTO `system_log` VALUES ('150', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:20:51');
INSERT INTO `system_log` VALUES ('151', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:21:06');
INSERT INTO `system_log` VALUES ('152', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:21:24');
INSERT INTO `system_log` VALUES ('153', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:22:45');
INSERT INTO `system_log` VALUES ('154', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:23:06');
INSERT INTO `system_log` VALUES ('155', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:24:52');
INSERT INTO `system_log` VALUES ('156', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:24:53');
INSERT INTO `system_log` VALUES ('157', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:25:46');
INSERT INTO `system_log` VALUES ('158', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:25:56');
INSERT INTO `system_log` VALUES ('159', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:26:12');
INSERT INTO `system_log` VALUES ('160', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:28:05');
INSERT INTO `system_log` VALUES ('161', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:28:14');
INSERT INTO `system_log` VALUES ('162', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:30:03');
INSERT INTO `system_log` VALUES ('163', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:30:52');
INSERT INTO `system_log` VALUES ('164', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:30:54');
INSERT INTO `system_log` VALUES ('165', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:31:12');
INSERT INTO `system_log` VALUES ('166', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:31:13');
INSERT INTO `system_log` VALUES ('167', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:31:29');
INSERT INTO `system_log` VALUES ('168', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:31:30');
INSERT INTO `system_log` VALUES ('169', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:38:26');
INSERT INTO `system_log` VALUES ('170', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:38:28');
INSERT INTO `system_log` VALUES ('171', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:38:41');
INSERT INTO `system_log` VALUES ('172', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:38:42');
INSERT INTO `system_log` VALUES ('173', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:39:11');
INSERT INTO `system_log` VALUES ('174', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:39:12');
INSERT INTO `system_log` VALUES ('175', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:39:51');
INSERT INTO `system_log` VALUES ('176', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:42:28');
INSERT INTO `system_log` VALUES ('177', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:52:16');
INSERT INTO `system_log` VALUES ('178', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:52:50');
INSERT INTO `system_log` VALUES ('179', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:53:25');
INSERT INTO `system_log` VALUES ('180', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:53:45');
INSERT INTO `system_log` VALUES ('181', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:54:16');
INSERT INTO `system_log` VALUES ('182', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:54:42');
INSERT INTO `system_log` VALUES ('183', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 16:54:56');
INSERT INTO `system_log` VALUES ('184', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:04:04');
INSERT INTO `system_log` VALUES ('185', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:04:06');
INSERT INTO `system_log` VALUES ('186', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:05:25');
INSERT INTO `system_log` VALUES ('187', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:13:43');
INSERT INTO `system_log` VALUES ('188', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:16:11');
INSERT INTO `system_log` VALUES ('189', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:17:24');
INSERT INTO `system_log` VALUES ('190', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:18:01');
INSERT INTO `system_log` VALUES ('191', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:39:22');
INSERT INTO `system_log` VALUES ('192', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:42:40');
INSERT INTO `system_log` VALUES ('193', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:46:52');
INSERT INTO `system_log` VALUES ('194', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:46:55');
INSERT INTO `system_log` VALUES ('195', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:47:56');
INSERT INTO `system_log` VALUES ('196', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:48:29');
INSERT INTO `system_log` VALUES ('197', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:49:55');
INSERT INTO `system_log` VALUES ('198', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:51:06');
INSERT INTO `system_log` VALUES ('199', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:51:08');
INSERT INTO `system_log` VALUES ('200', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:51:15');
INSERT INTO `system_log` VALUES ('201', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:53:47');
INSERT INTO `system_log` VALUES ('202', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:54:00');
INSERT INTO `system_log` VALUES ('203', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:54:01');
INSERT INTO `system_log` VALUES ('204', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:54:33');
INSERT INTO `system_log` VALUES ('205', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '192.168.1.186', null, null, null, 'Xushd', '2017-01-23 17:54:34');
INSERT INTO `system_log` VALUES ('206', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:18:58');
INSERT INTO `system_log` VALUES ('207', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:19:02');
INSERT INTO `system_log` VALUES ('208', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:19:04');
INSERT INTO `system_log` VALUES ('209', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:19:36');
INSERT INTO `system_log` VALUES ('210', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:19:42');
INSERT INTO `system_log` VALUES ('211', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:20:14');
INSERT INTO `system_log` VALUES ('212', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:20:15');
INSERT INTO `system_log` VALUES ('213', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:25:06');
INSERT INTO `system_log` VALUES ('214', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:25:07');
INSERT INTO `system_log` VALUES ('215', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:25:39');
INSERT INTO `system_log` VALUES ('216', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:25:40');
INSERT INTO `system_log` VALUES ('217', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:25:48');
INSERT INTO `system_log` VALUES ('218', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:25:49');
INSERT INTO `system_log` VALUES ('219', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:25:57');
INSERT INTO `system_log` VALUES ('220', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:26:02');
INSERT INTO `system_log` VALUES ('221', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:26:26');
INSERT INTO `system_log` VALUES ('222', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:27:19');
INSERT INTO `system_log` VALUES ('223', 'com.uping.controller.DictionaryController.dictionaryUpdate()', '0', '字典管理', '字典修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:27:26');
INSERT INTO `system_log` VALUES ('224', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:27:27');
INSERT INTO `system_log` VALUES ('225', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:27:30');
INSERT INTO `system_log` VALUES ('226', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:28:55');
INSERT INTO `system_log` VALUES ('227', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:28:59');
INSERT INTO `system_log` VALUES ('228', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:29:19');
INSERT INTO `system_log` VALUES ('229', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:29:34');
INSERT INTO `system_log` VALUES ('230', 'com.uping.controller.DictionaryController.dictionaryUpdate()', '0', '字典管理', '字典修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:29:38');
INSERT INTO `system_log` VALUES ('231', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:29:39');
INSERT INTO `system_log` VALUES ('232', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:29:43');
INSERT INTO `system_log` VALUES ('233', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:29:49');
INSERT INTO `system_log` VALUES ('234', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:29:50');
INSERT INTO `system_log` VALUES ('235', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:29:56');
INSERT INTO `system_log` VALUES ('236', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:29:57');
INSERT INTO `system_log` VALUES ('237', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:29:57');
INSERT INTO `system_log` VALUES ('238', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:29:58');
INSERT INTO `system_log` VALUES ('239', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:30:03');
INSERT INTO `system_log` VALUES ('240', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:34:38');
INSERT INTO `system_log` VALUES ('241', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:34:58');
INSERT INTO `system_log` VALUES ('242', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:35:08');
INSERT INTO `system_log` VALUES ('243', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:35:09');
INSERT INTO `system_log` VALUES ('244', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:36:48');
INSERT INTO `system_log` VALUES ('245', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:40:23');
INSERT INTO `system_log` VALUES ('246', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:41:51');
INSERT INTO `system_log` VALUES ('247', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 22:44:20');
INSERT INTO `system_log` VALUES ('248', 'com.uping.controller.LoginController.lock()', '0', '登录模块', '用户锁屏', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-23 23:04:19');
INSERT INTO `system_log` VALUES ('249', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:41:00');
INSERT INTO `system_log` VALUES ('250', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:42:46');
INSERT INTO `system_log` VALUES ('251', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:46:20');
INSERT INTO `system_log` VALUES ('252', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:48:30');
INSERT INTO `system_log` VALUES ('253', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:48:40');
INSERT INTO `system_log` VALUES ('254', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:53:47');
INSERT INTO `system_log` VALUES ('255', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:55:05');
INSERT INTO `system_log` VALUES ('256', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:55:06');
INSERT INTO `system_log` VALUES ('257', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:55:29');
INSERT INTO `system_log` VALUES ('258', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:55:39');
INSERT INTO `system_log` VALUES ('259', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:59:02');
INSERT INTO `system_log` VALUES ('260', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:59:06');
INSERT INTO `system_log` VALUES ('261', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:59:08');
INSERT INTO `system_log` VALUES ('262', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:59:14');
INSERT INTO `system_log` VALUES ('263', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:59:15');
INSERT INTO `system_log` VALUES ('264', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:59:21');
INSERT INTO `system_log` VALUES ('265', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:59:23');
INSERT INTO `system_log` VALUES ('266', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:59:24');
INSERT INTO `system_log` VALUES ('267', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:59:36');
INSERT INTO `system_log` VALUES ('268', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:59:37');
INSERT INTO `system_log` VALUES ('269', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 00:59:41');
INSERT INTO `system_log` VALUES ('270', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 01:00:42');
INSERT INTO `system_log` VALUES ('271', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 01:00:44');
INSERT INTO `system_log` VALUES ('272', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 01:00:45');
INSERT INTO `system_log` VALUES ('273', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-01-24 01:00:46');
INSERT INTO `system_log` VALUES ('274', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:10:07');
INSERT INTO `system_log` VALUES ('275', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:10:09');
INSERT INTO `system_log` VALUES ('276', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:10:14');
INSERT INTO `system_log` VALUES ('277', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:10:16');
INSERT INTO `system_log` VALUES ('278', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:10:27');
INSERT INTO `system_log` VALUES ('279', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:10:34');
INSERT INTO `system_log` VALUES ('280', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:10:49');
INSERT INTO `system_log` VALUES ('281', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:10:51');
INSERT INTO `system_log` VALUES ('282', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:10:53');
INSERT INTO `system_log` VALUES ('283', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:13:37');
INSERT INTO `system_log` VALUES ('284', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:13:38');
INSERT INTO `system_log` VALUES ('285', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:14:24');
INSERT INTO `system_log` VALUES ('286', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:14:25');
INSERT INTO `system_log` VALUES ('287', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:14:31');
INSERT INTO `system_log` VALUES ('288', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:14:37');
INSERT INTO `system_log` VALUES ('289', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:14:45');
INSERT INTO `system_log` VALUES ('290', 'com.uping.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:15:14');
INSERT INTO `system_log` VALUES ('291', 'com.uping.controller.UserController.userPassUpdate()', '0', '用户管理', '用户密码修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:15:57');
INSERT INTO `system_log` VALUES ('292', 'com.uping.controller.UserController.userPassUpdate()', '0', '用户管理', '用户密码修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 00:16:03');
INSERT INTO `system_log` VALUES ('293', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:53:25');
INSERT INTO `system_log` VALUES ('294', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:53:28');
INSERT INTO `system_log` VALUES ('295', 'com.uping.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:54:50');
INSERT INTO `system_log` VALUES ('296', 'com.uping.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:55:55');
INSERT INTO `system_log` VALUES ('297', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:58:05');
INSERT INTO `system_log` VALUES ('298', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:58:08');
INSERT INTO `system_log` VALUES ('299', 'com.uping.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:58:15');
INSERT INTO `system_log` VALUES ('300', 'com.uping.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:58:42');
INSERT INTO `system_log` VALUES ('301', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:59:01');
INSERT INTO `system_log` VALUES ('302', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:59:03');
INSERT INTO `system_log` VALUES ('303', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:59:10');
INSERT INTO `system_log` VALUES ('304', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:59:28');
INSERT INTO `system_log` VALUES ('305', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:59:30');
INSERT INTO `system_log` VALUES ('306', 'com.uping.controller.DictionaryController.dictionaryUpdate()', '0', '字典管理', '字典修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:59:40');
INSERT INTO `system_log` VALUES ('307', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:59:41');
INSERT INTO `system_log` VALUES ('308', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 08:59:46');
INSERT INTO `system_log` VALUES ('309', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:00:06');
INSERT INTO `system_log` VALUES ('310', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:00:17');
INSERT INTO `system_log` VALUES ('311', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:15:20');
INSERT INTO `system_log` VALUES ('312', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:15:21');
INSERT INTO `system_log` VALUES ('313', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:16:13');
INSERT INTO `system_log` VALUES ('314', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:16:15');
INSERT INTO `system_log` VALUES ('315', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:20:07');
INSERT INTO `system_log` VALUES ('316', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:20:12');
INSERT INTO `system_log` VALUES ('317', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:20:13');
INSERT INTO `system_log` VALUES ('318', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:21:08');
INSERT INTO `system_log` VALUES ('319', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:21:09');
INSERT INTO `system_log` VALUES ('320', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:21:56');
INSERT INTO `system_log` VALUES ('321', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:21:58');
INSERT INTO `system_log` VALUES ('322', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:22:25');
INSERT INTO `system_log` VALUES ('323', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:22:26');
INSERT INTO `system_log` VALUES ('324', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:23:20');
INSERT INTO `system_log` VALUES ('325', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:23:21');
INSERT INTO `system_log` VALUES ('326', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:24:01');
INSERT INTO `system_log` VALUES ('327', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:24:03');
INSERT INTO `system_log` VALUES ('328', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:25:44');
INSERT INTO `system_log` VALUES ('329', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:25:46');
INSERT INTO `system_log` VALUES ('330', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:26:18');
INSERT INTO `system_log` VALUES ('331', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:26:19');
INSERT INTO `system_log` VALUES ('332', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:26:22');
INSERT INTO `system_log` VALUES ('333', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:26:25');
INSERT INTO `system_log` VALUES ('334', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:27:27');
INSERT INTO `system_log` VALUES ('335', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:27:28');
INSERT INTO `system_log` VALUES ('336', 'com.uping.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:29:23');
INSERT INTO `system_log` VALUES ('337', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:34:02');
INSERT INTO `system_log` VALUES ('338', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:34:03');
INSERT INTO `system_log` VALUES ('339', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:35:00');
INSERT INTO `system_log` VALUES ('340', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:35:01');
INSERT INTO `system_log` VALUES ('341', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:36:17');
INSERT INTO `system_log` VALUES ('342', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:36:23');
INSERT INTO `system_log` VALUES ('343', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:36:24');
INSERT INTO `system_log` VALUES ('344', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:37:26');
INSERT INTO `system_log` VALUES ('345', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:37:28');
INSERT INTO `system_log` VALUES ('346', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:38:16');
INSERT INTO `system_log` VALUES ('347', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:38:17');
INSERT INTO `system_log` VALUES ('348', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:41:38');
INSERT INTO `system_log` VALUES ('349', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:41:40');
INSERT INTO `system_log` VALUES ('350', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:41:42');
INSERT INTO `system_log` VALUES ('351', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:47:25');
INSERT INTO `system_log` VALUES ('352', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:47:35');
INSERT INTO `system_log` VALUES ('353', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:47:36');
INSERT INTO `system_log` VALUES ('354', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:47:38');
INSERT INTO `system_log` VALUES ('355', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:49:21');
INSERT INTO `system_log` VALUES ('356', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 09:49:23');
INSERT INTO `system_log` VALUES ('357', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 10:48:55');
INSERT INTO `system_log` VALUES ('358', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 10:48:56');
INSERT INTO `system_log` VALUES ('359', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 10:53:29');
INSERT INTO `system_log` VALUES ('360', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 10:53:30');
INSERT INTO `system_log` VALUES ('361', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 10:54:09');
INSERT INTO `system_log` VALUES ('362', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-02 10:54:10');
INSERT INTO `system_log` VALUES ('363', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:35:42');
INSERT INTO `system_log` VALUES ('364', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:35:45');
INSERT INTO `system_log` VALUES ('365', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:35:50');
INSERT INTO `system_log` VALUES ('366', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:37:26');
INSERT INTO `system_log` VALUES ('367', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:42:48');
INSERT INTO `system_log` VALUES ('368', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:42:49');
INSERT INTO `system_log` VALUES ('369', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:44:09');
INSERT INTO `system_log` VALUES ('370', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:44:10');
INSERT INTO `system_log` VALUES ('371', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:44:21');
INSERT INTO `system_log` VALUES ('372', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:44:22');
INSERT INTO `system_log` VALUES ('373', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:44:39');
INSERT INTO `system_log` VALUES ('374', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:44:45');
INSERT INTO `system_log` VALUES ('375', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:44:46');
INSERT INTO `system_log` VALUES ('376', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:46:27');
INSERT INTO `system_log` VALUES ('377', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:46:28');
INSERT INTO `system_log` VALUES ('378', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:47:23');
INSERT INTO `system_log` VALUES ('379', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:47:24');
INSERT INTO `system_log` VALUES ('380', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:47:27');
INSERT INTO `system_log` VALUES ('381', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:47:28');
INSERT INTO `system_log` VALUES ('382', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:48:35');
INSERT INTO `system_log` VALUES ('383', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:48:36');
INSERT INTO `system_log` VALUES ('384', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:48:39');
INSERT INTO `system_log` VALUES ('385', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:49:17');
INSERT INTO `system_log` VALUES ('386', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:49:22');
INSERT INTO `system_log` VALUES ('387', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:50:35');
INSERT INTO `system_log` VALUES ('388', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:50:36');
INSERT INTO `system_log` VALUES ('389', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:50:59');
INSERT INTO `system_log` VALUES ('390', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:09');
INSERT INTO `system_log` VALUES ('391', 'com.uping.controller.MenuController.menuDelete()', '0', '菜单管理', '菜单删除', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:12');
INSERT INTO `system_log` VALUES ('392', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:13');
INSERT INTO `system_log` VALUES ('393', 'com.uping.controller.MenuController.menuDelete()', '0', '菜单管理', '菜单删除', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:16');
INSERT INTO `system_log` VALUES ('394', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:17');
INSERT INTO `system_log` VALUES ('395', 'com.uping.controller.MenuController.menuDelete()', '0', '菜单管理', '菜单删除', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:22');
INSERT INTO `system_log` VALUES ('396', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:24');
INSERT INTO `system_log` VALUES ('397', 'com.uping.controller.MenuController.menuDelete()', '0', '菜单管理', '菜单删除', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:26');
INSERT INTO `system_log` VALUES ('398', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:27');
INSERT INTO `system_log` VALUES ('399', 'com.uping.controller.MenuController.menuDelete()', '0', '菜单管理', '菜单删除', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:38');
INSERT INTO `system_log` VALUES ('400', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:39');
INSERT INTO `system_log` VALUES ('401', 'com.uping.controller.MenuController.menuDelete()', '0', '菜单管理', '菜单删除', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:42');
INSERT INTO `system_log` VALUES ('402', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:43');
INSERT INTO `system_log` VALUES ('403', 'com.uping.controller.MenuController.menuDelete()', '0', '菜单管理', '菜单删除', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:52');
INSERT INTO `system_log` VALUES ('404', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:51:53');
INSERT INTO `system_log` VALUES ('405', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:53:09');
INSERT INTO `system_log` VALUES ('406', 'com.uping.controller.MenuController.menuDelete()', '0', '菜单管理', '菜单删除', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:53:16');
INSERT INTO `system_log` VALUES ('407', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:53:17');
INSERT INTO `system_log` VALUES ('408', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:54:22');
INSERT INTO `system_log` VALUES ('409', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:54:23');
INSERT INTO `system_log` VALUES ('410', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:55:40');
INSERT INTO `system_log` VALUES ('411', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:55:41');
INSERT INTO `system_log` VALUES ('412', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:58:10');
INSERT INTO `system_log` VALUES ('413', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:58:11');
INSERT INTO `system_log` VALUES ('414', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:58:39');
INSERT INTO `system_log` VALUES ('415', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:58:41');
INSERT INTO `system_log` VALUES ('416', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:59:07');
INSERT INTO `system_log` VALUES ('417', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:59:08');
INSERT INTO `system_log` VALUES ('418', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:59:14');
INSERT INTO `system_log` VALUES ('419', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:59:15');
INSERT INTO `system_log` VALUES ('420', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:59:49');
INSERT INTO `system_log` VALUES ('421', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:59:50');
INSERT INTO `system_log` VALUES ('422', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:59:55');
INSERT INTO `system_log` VALUES ('423', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 19:59:56');
INSERT INTO `system_log` VALUES ('424', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:00:47');
INSERT INTO `system_log` VALUES ('425', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:00:48');
INSERT INTO `system_log` VALUES ('426', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:01:15');
INSERT INTO `system_log` VALUES ('427', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:01:16');
INSERT INTO `system_log` VALUES ('428', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:04:21');
INSERT INTO `system_log` VALUES ('429', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:04:22');
INSERT INTO `system_log` VALUES ('430', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:06:03');
INSERT INTO `system_log` VALUES ('431', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:06:04');
INSERT INTO `system_log` VALUES ('432', 'com.uping.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:06:38');
INSERT INTO `system_log` VALUES ('433', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:06:39');
INSERT INTO `system_log` VALUES ('434', 'com.uping.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:06:54');
INSERT INTO `system_log` VALUES ('435', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:06:55');
INSERT INTO `system_log` VALUES ('436', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:07:00');
INSERT INTO `system_log` VALUES ('437', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:07:11');
INSERT INTO `system_log` VALUES ('438', 'com.uping.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:07:12');
INSERT INTO `system_log` VALUES ('439', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:07:13');
INSERT INTO `system_log` VALUES ('440', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:07:17');
INSERT INTO `system_log` VALUES ('441', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:07:18');
INSERT INTO `system_log` VALUES ('442', 'com.uping.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:07:19');
INSERT INTO `system_log` VALUES ('443', 'com.uping.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:07:21');
INSERT INTO `system_log` VALUES ('444', 'com.uping.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:07:23');
INSERT INTO `system_log` VALUES ('445', 'com.uping.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:07:24');
INSERT INTO `system_log` VALUES ('446', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:07:27');
INSERT INTO `system_log` VALUES ('447', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:17:02');
INSERT INTO `system_log` VALUES ('448', 'com.uping.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:17:08');
INSERT INTO `system_log` VALUES ('449', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:17:16');
INSERT INTO `system_log` VALUES ('450', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:17:52');
INSERT INTO `system_log` VALUES ('451', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:17:57');
INSERT INTO `system_log` VALUES ('452', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:17:59');
INSERT INTO `system_log` VALUES ('453', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:18:39');
INSERT INTO `system_log` VALUES ('454', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:18:40');
INSERT INTO `system_log` VALUES ('455', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:18:48');
INSERT INTO `system_log` VALUES ('456', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:19:17');
INSERT INTO `system_log` VALUES ('457', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:19:18');
INSERT INTO `system_log` VALUES ('458', 'com.uping.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:19:53');
INSERT INTO `system_log` VALUES ('459', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:19:55');
INSERT INTO `system_log` VALUES ('460', 'com.uping.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:20:12');
INSERT INTO `system_log` VALUES ('461', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:20:13');
INSERT INTO `system_log` VALUES ('462', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:20:23');
INSERT INTO `system_log` VALUES ('463', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:32:29');
INSERT INTO `system_log` VALUES ('464', 'com.uping.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:32:33');
INSERT INTO `system_log` VALUES ('465', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 20:52:50');
INSERT INTO `system_log` VALUES ('466', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:00:55');
INSERT INTO `system_log` VALUES ('467', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:02:04');
INSERT INTO `system_log` VALUES ('468', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:02:11');
INSERT INTO `system_log` VALUES ('469', 'com.uping.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:02:19');
INSERT INTO `system_log` VALUES ('470', 'com.uping.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:02:21');
INSERT INTO `system_log` VALUES ('471', 'com.uping.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:02:22');
INSERT INTO `system_log` VALUES ('472', 'com.uping.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:02:23');
INSERT INTO `system_log` VALUES ('473', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:03:01');
INSERT INTO `system_log` VALUES ('474', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:03:03');
INSERT INTO `system_log` VALUES ('475', 'com.uping.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:03:05');
INSERT INTO `system_log` VALUES ('476', 'com.uping.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:03:10');
INSERT INTO `system_log` VALUES ('477', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:31:37');
INSERT INTO `system_log` VALUES ('478', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:32:37');
INSERT INTO `system_log` VALUES ('479', 'com.uping.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:32:46');
INSERT INTO `system_log` VALUES ('480', 'com.uping.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:34:33');
INSERT INTO `system_log` VALUES ('481', 'com.uping.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:34:34');
INSERT INTO `system_log` VALUES ('482', 'com.uping.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:34:40');
INSERT INTO `system_log` VALUES ('483', 'com.uping.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:34:41');
INSERT INTO `system_log` VALUES ('484', 'com.uping.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:34:44');
INSERT INTO `system_log` VALUES ('485', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:34:45');
INSERT INTO `system_log` VALUES ('486', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:34:57');
INSERT INTO `system_log` VALUES ('487', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:35:01');
INSERT INTO `system_log` VALUES ('488', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:35:02');
INSERT INTO `system_log` VALUES ('489', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:35:05');
INSERT INTO `system_log` VALUES ('490', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:35:14');
INSERT INTO `system_log` VALUES ('491', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:35:56');
INSERT INTO `system_log` VALUES ('492', 'com.uping.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:36:37');
INSERT INTO `system_log` VALUES ('493', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:45:54');
INSERT INTO `system_log` VALUES ('494', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:45:56');
INSERT INTO `system_log` VALUES ('495', 'com.uping.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:46:00');
INSERT INTO `system_log` VALUES ('496', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:47:01');
INSERT INTO `system_log` VALUES ('497', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:47:04');
INSERT INTO `system_log` VALUES ('498', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:47:06');
INSERT INTO `system_log` VALUES ('499', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:47:21');
INSERT INTO `system_log` VALUES ('500', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:47:22');
INSERT INTO `system_log` VALUES ('501', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:47:26');
INSERT INTO `system_log` VALUES ('502', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:47:30');
INSERT INTO `system_log` VALUES ('503', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:48:05');
INSERT INTO `system_log` VALUES ('504', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:48:06');
INSERT INTO `system_log` VALUES ('505', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:49:36');
INSERT INTO `system_log` VALUES ('506', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:49:37');
INSERT INTO `system_log` VALUES ('507', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:49:43');
INSERT INTO `system_log` VALUES ('508', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:49:48');
INSERT INTO `system_log` VALUES ('509', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:50:27');
INSERT INTO `system_log` VALUES ('510', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:50:33');
INSERT INTO `system_log` VALUES ('511', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:50:37');
INSERT INTO `system_log` VALUES ('512', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:50:40');
INSERT INTO `system_log` VALUES ('513', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:50:49');
INSERT INTO `system_log` VALUES ('514', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:52:25');
INSERT INTO `system_log` VALUES ('515', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:52:26');
INSERT INTO `system_log` VALUES ('516', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:52:27');
INSERT INTO `system_log` VALUES ('517', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:52:29');
INSERT INTO `system_log` VALUES ('518', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:52:31');
INSERT INTO `system_log` VALUES ('519', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:52:32');
INSERT INTO `system_log` VALUES ('520', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:52:34');
INSERT INTO `system_log` VALUES ('521', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:52:35');
INSERT INTO `system_log` VALUES ('522', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:52:38');
INSERT INTO `system_log` VALUES ('523', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:54:11');
INSERT INTO `system_log` VALUES ('524', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:54:12');
INSERT INTO `system_log` VALUES ('525', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:54:17');
INSERT INTO `system_log` VALUES ('526', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:54:44');
INSERT INTO `system_log` VALUES ('527', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:54:45');
INSERT INTO `system_log` VALUES ('528', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:54:48');
INSERT INTO `system_log` VALUES ('529', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:54:54');
INSERT INTO `system_log` VALUES ('530', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 21:54:57');
INSERT INTO `system_log` VALUES ('531', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:02:11');
INSERT INTO `system_log` VALUES ('532', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:02:25');
INSERT INTO `system_log` VALUES ('533', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:03:17');
INSERT INTO `system_log` VALUES ('534', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:03:18');
INSERT INTO `system_log` VALUES ('535', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:03:25');
INSERT INTO `system_log` VALUES ('536', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:03:42');
INSERT INTO `system_log` VALUES ('537', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:03:43');
INSERT INTO `system_log` VALUES ('538', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:04:33');
INSERT INTO `system_log` VALUES ('539', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:04:35');
INSERT INTO `system_log` VALUES ('540', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:04:40');
INSERT INTO `system_log` VALUES ('541', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:05:48');
INSERT INTO `system_log` VALUES ('542', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:05:50');
INSERT INTO `system_log` VALUES ('543', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:05:51');
INSERT INTO `system_log` VALUES ('544', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:05:57');
INSERT INTO `system_log` VALUES ('545', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:05:58');
INSERT INTO `system_log` VALUES ('546', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:09:20');
INSERT INTO `system_log` VALUES ('547', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:09:26');
INSERT INTO `system_log` VALUES ('548', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:09:28');
INSERT INTO `system_log` VALUES ('549', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:11:05');
INSERT INTO `system_log` VALUES ('550', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:11:06');
INSERT INTO `system_log` VALUES ('551', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:11:08');
INSERT INTO `system_log` VALUES ('552', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:11:09');
INSERT INTO `system_log` VALUES ('553', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:11:14');
INSERT INTO `system_log` VALUES ('554', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:11:18');
INSERT INTO `system_log` VALUES ('555', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:11:28');
INSERT INTO `system_log` VALUES ('556', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:12:19');
INSERT INTO `system_log` VALUES ('557', 'com.upingwang.controller.UserController.userRoleUpdate()', '0', '用户管理', '修改用户角色', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:12:29');
INSERT INTO `system_log` VALUES ('558', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:12:39');
INSERT INTO `system_log` VALUES ('559', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:14:17');
INSERT INTO `system_log` VALUES ('560', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:14:43');
INSERT INTO `system_log` VALUES ('561', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:14:44');
INSERT INTO `system_log` VALUES ('562', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:15:10');
INSERT INTO `system_log` VALUES ('563', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:15:11');
INSERT INTO `system_log` VALUES ('564', 'com.upingwang.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:15:23');
INSERT INTO `system_log` VALUES ('565', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:15:24');
INSERT INTO `system_log` VALUES ('566', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:15:54');
INSERT INTO `system_log` VALUES ('567', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:15:55');
INSERT INTO `system_log` VALUES ('568', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:16:10');
INSERT INTO `system_log` VALUES ('569', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:16:11');
INSERT INTO `system_log` VALUES ('570', 'com.upingwang.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:16:19');
INSERT INTO `system_log` VALUES ('571', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:16:20');
INSERT INTO `system_log` VALUES ('572', 'com.upingwang.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:16:29');
INSERT INTO `system_log` VALUES ('573', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:16:30');
INSERT INTO `system_log` VALUES ('574', 'com.upingwang.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:16:35');
INSERT INTO `system_log` VALUES ('575', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:16:36');
INSERT INTO `system_log` VALUES ('576', 'com.upingwang.controller.PermissionController.permissionUpdate()', '0', '权限管理', '权限修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:16:41');
INSERT INTO `system_log` VALUES ('577', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:16:42');
INSERT INTO `system_log` VALUES ('578', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:16:47');
INSERT INTO `system_log` VALUES ('579', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:18:26');
INSERT INTO `system_log` VALUES ('580', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:18:28');
INSERT INTO `system_log` VALUES ('581', 'com.upingwang.controller.UserController.userSave()', '0', '用户管理', '用户新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:18:52');
INSERT INTO `system_log` VALUES ('582', 'com.upingwang.controller.UserController.userSave()', '0', '用户管理', '用户新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:18:56');
INSERT INTO `system_log` VALUES ('583', 'com.upingwang.controller.UserController.userSave()', '0', '用户管理', '用户新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:19:00');
INSERT INTO `system_log` VALUES ('584', 'com.upingwang.controller.UserController.userSave()', '0', '用户管理', '用户新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:31:27');
INSERT INTO `system_log` VALUES ('585', 'com.upingwang.controller.UserController.userSave()', '0', '用户管理', '用户新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:31:34');
INSERT INTO `system_log` VALUES ('586', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:35:59');
INSERT INTO `system_log` VALUES ('587', 'com.upingwang.controller.UserController.userUpdate()', '0', '用户管理', '用户信息修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:36:10');
INSERT INTO `system_log` VALUES ('588', 'com.upingwang.controller.UserController.userUpdate()', '0', '用户管理', '用户信息修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:36:16');
INSERT INTO `system_log` VALUES ('589', 'com.upingwang.controller.UserController.userUpdate()', '0', '用户管理', '用户信息修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:36:22');
INSERT INTO `system_log` VALUES ('590', 'com.upingwang.controller.UserController.userUpdate()', '0', '用户管理', '用户信息修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:37:25');
INSERT INTO `system_log` VALUES ('591', 'com.upingwang.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:37:34');
INSERT INTO `system_log` VALUES ('592', 'com.upingwang.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:38:26');
INSERT INTO `system_log` VALUES ('593', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:38:42');
INSERT INTO `system_log` VALUES ('594', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:38:44');
INSERT INTO `system_log` VALUES ('595', 'com.upingwang.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:38:51');
INSERT INTO `system_log` VALUES ('596', 'com.upingwang.controller.UserController.userPassUpdate()', '0', '用户管理', '用户密码修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:40:19');
INSERT INTO `system_log` VALUES ('597', 'com.upingwang.controller.UserController.userPassUpdate()', '0', '用户管理', '用户密码修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:40:22');
INSERT INTO `system_log` VALUES ('598', 'com.upingwang.controller.UserController.userRoleUpdate()', '0', '用户管理', '修改用户角色', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:40:27');
INSERT INTO `system_log` VALUES ('599', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:40:38');
INSERT INTO `system_log` VALUES ('600', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:40:40');
INSERT INTO `system_log` VALUES ('601', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:44:36');
INSERT INTO `system_log` VALUES ('602', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:44:40');
INSERT INTO `system_log` VALUES ('603', 'com.upingwang.controller.UserController.userDelete()', '0', '用户管理', '删除用户', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:44:42');
INSERT INTO `system_log` VALUES ('604', 'com.upingwang.controller.UserController.userDelete()', '0', '用户管理', '删除用户', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:44:46');
INSERT INTO `system_log` VALUES ('605', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:44:57');
INSERT INTO `system_log` VALUES ('606', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 22:44:58');
INSERT INTO `system_log` VALUES ('607', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:00:25');
INSERT INTO `system_log` VALUES ('608', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:00:26');
INSERT INTO `system_log` VALUES ('609', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:00:30');
INSERT INTO `system_log` VALUES ('610', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:00:31');
INSERT INTO `system_log` VALUES ('611', 'com.upingwang.controller.UserController.userUpdate()', '0', '用户管理', '用户信息修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:00:41');
INSERT INTO `system_log` VALUES ('612', 'com.upingwang.controller.UserController.userPassUpdate()', '0', '用户管理', '用户密码修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:00:56');
INSERT INTO `system_log` VALUES ('613', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:01:03');
INSERT INTO `system_log` VALUES ('614', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:01:04');
INSERT INTO `system_log` VALUES ('615', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:01:34');
INSERT INTO `system_log` VALUES ('616', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:01:35');
INSERT INTO `system_log` VALUES ('617', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:01:41');
INSERT INTO `system_log` VALUES ('618', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:01:50');
INSERT INTO `system_log` VALUES ('619', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:01:57');
INSERT INTO `system_log` VALUES ('620', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:01:59');
INSERT INTO `system_log` VALUES ('621', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:02:06');
INSERT INTO `system_log` VALUES ('622', 'com.upingwang.controller.UserController.userUpdate()', '0', '用户管理', '用户信息修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:02:16');
INSERT INTO `system_log` VALUES ('623', 'com.upingwang.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:02:25');
INSERT INTO `system_log` VALUES ('624', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:06:33');
INSERT INTO `system_log` VALUES ('625', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:06:34');
INSERT INTO `system_log` VALUES ('626', 'com.upingwang.controller.UserController.userDelete()', '0', '用户管理', '删除用户', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:06:36');
INSERT INTO `system_log` VALUES ('627', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:07:08');
INSERT INTO `system_log` VALUES ('628', 'com.upingwang.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:07:28');
INSERT INTO `system_log` VALUES ('629', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:25:08');
INSERT INTO `system_log` VALUES ('630', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:25:09');
INSERT INTO `system_log` VALUES ('631', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:25:19');
INSERT INTO `system_log` VALUES ('632', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:25:21');
INSERT INTO `system_log` VALUES ('633', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:26:41');
INSERT INTO `system_log` VALUES ('635', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:26:56');
INSERT INTO `system_log` VALUES ('637', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:35:50');
INSERT INTO `system_log` VALUES ('640', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:47:09');
INSERT INTO `system_log` VALUES ('641', 'com.upingwang.service.impl.SystemRoleServiceImpl.updateRolePermission()', '1', '角色管理', '修改角色的权限信息', '0:0:0:0:0:0:0:1', 'org.springframework.dao.DuplicateKeyException', '### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'1000\' for key \'PRIMARY\'\r\n### The error may involve com.upingwang.mapper.SystemRolePermissionMapper.insertRolePermission-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT  system_role_permission     (role_id,permission_id)     VALUES              (?,?)      ,        (?,?)      ,        (?,?)      ,        (?,?)      ,        (?,?)      ,        (?,?)      ,        (?,?)\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'1000\' for key \'PRIMARY\'\n; SQL []; Duplicate entry \'1000\' for key \'PRIMARY\'; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'1000\' for key \'PRIMARY\'', '[[\"34\",\"35\",\"36\",\"40\",\"37\",\"38\",\"39\"],1000]', 'Xushd', '2017-02-03 23:47:09');
INSERT INTO `system_log` VALUES ('642', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:49:01');
INSERT INTO `system_log` VALUES ('643', 'com.upingwang.service.impl.SystemRoleServiceImpl.updateRolePermission()', '1', '角色管理', '修改角色的权限信息', '0:0:0:0:0:0:0:1', 'org.springframework.dao.DuplicateKeyException', '### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'1000\' for key \'PRIMARY\'\r\n### The error may involve com.upingwang.mapper.SystemRolePermissionMapper.insertRolePermission-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT  system_role_permission     (role_id,permission_id)     VALUES              (?,?)      ,        (?,?)      ,        (?,?)      ,        (?,?)      ,        (?,?)      ,        (?,?)      ,        (?,?)\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'1000\' for key \'PRIMARY\'\n; SQL []; Duplicate entry \'1000\' for key \'PRIMARY\'; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'1000\' for key \'PRIMARY\'', '[[\"34\",\"35\",\"36\",\"40\",\"37\",\"38\",\"39\"],1000]', 'Xushd', '2017-02-03 23:49:01');
INSERT INTO `system_log` VALUES ('644', 'com.upingwang.controller.LogController.logErrorDetail()', '0', '日志管理', '异常日志详情', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:55:25');
INSERT INTO `system_log` VALUES ('645', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:56:04');
INSERT INTO `system_log` VALUES ('646', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:56:06');
INSERT INTO `system_log` VALUES ('647', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:56:07');
INSERT INTO `system_log` VALUES ('648', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:57:44');
INSERT INTO `system_log` VALUES ('649', 'com.upingwang.controller.RoleController.update()', '0', '角色管理', '角色修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:58:07');
INSERT INTO `system_log` VALUES ('650', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:58:08');
INSERT INTO `system_log` VALUES ('651', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:58:18');
INSERT INTO `system_log` VALUES ('652', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:58:23');
INSERT INTO `system_log` VALUES ('653', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:58:27');
INSERT INTO `system_log` VALUES ('654', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:58:49');
INSERT INTO `system_log` VALUES ('655', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:58:54');
INSERT INTO `system_log` VALUES ('656', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:58:58');
INSERT INTO `system_log` VALUES ('657', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:59:00');
INSERT INTO `system_log` VALUES ('658', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:59:07');
INSERT INTO `system_log` VALUES ('659', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:59:09');
INSERT INTO `system_log` VALUES ('660', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:59:10');
INSERT INTO `system_log` VALUES ('661', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:59:14');
INSERT INTO `system_log` VALUES ('662', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:59:16');
INSERT INTO `system_log` VALUES ('663', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-03 23:59:21');
INSERT INTO `system_log` VALUES ('664', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:00:15');
INSERT INTO `system_log` VALUES ('665', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:00:16');
INSERT INTO `system_log` VALUES ('666', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:00:24');
INSERT INTO `system_log` VALUES ('667', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:00:25');
INSERT INTO `system_log` VALUES ('668', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:00:41');
INSERT INTO `system_log` VALUES ('669', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:01:07');
INSERT INTO `system_log` VALUES ('670', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:01:12');
INSERT INTO `system_log` VALUES ('671', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:01:17');
INSERT INTO `system_log` VALUES ('672', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:01:40');
INSERT INTO `system_log` VALUES ('673', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:02:23');
INSERT INTO `system_log` VALUES ('674', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:02:28');
INSERT INTO `system_log` VALUES ('675', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:02:32');
INSERT INTO `system_log` VALUES ('676', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:02:48');
INSERT INTO `system_log` VALUES ('677', 'com.upingwang.controller.LogController.logErrorDetail()', '0', '日志管理', '异常日志详情', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:03:51');
INSERT INTO `system_log` VALUES ('678', 'com.upingwang.controller.LogController.logErrorDetail()', '0', '日志管理', '异常日志详情', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:12:27');
INSERT INTO `system_log` VALUES ('679', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:12:34');
INSERT INTO `system_log` VALUES ('680', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:12:35');
INSERT INTO `system_log` VALUES ('681', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:12:44');
INSERT INTO `system_log` VALUES ('682', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:12:45');
INSERT INTO `system_log` VALUES ('683', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:12:55');
INSERT INTO `system_log` VALUES ('684', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:12:57');
INSERT INTO `system_log` VALUES ('685', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:13:01');
INSERT INTO `system_log` VALUES ('686', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:13:38');
INSERT INTO `system_log` VALUES ('687', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:13:39');
INSERT INTO `system_log` VALUES ('688', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:14:05');
INSERT INTO `system_log` VALUES ('689', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:14:06');
INSERT INTO `system_log` VALUES ('690', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:14:23');
INSERT INTO `system_log` VALUES ('691', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:14:24');
INSERT INTO `system_log` VALUES ('692', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:15:36');
INSERT INTO `system_log` VALUES ('693', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:15:37');
INSERT INTO `system_log` VALUES ('694', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:17:47');
INSERT INTO `system_log` VALUES ('695', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:17:48');
INSERT INTO `system_log` VALUES ('696', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:18:01');
INSERT INTO `system_log` VALUES ('697', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:18:02');
INSERT INTO `system_log` VALUES ('698', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:18:07');
INSERT INTO `system_log` VALUES ('699', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:18:08');
INSERT INTO `system_log` VALUES ('700', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:18:14');
INSERT INTO `system_log` VALUES ('701', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:18:15');
INSERT INTO `system_log` VALUES ('702', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:18:59');
INSERT INTO `system_log` VALUES ('703', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:19:00');
INSERT INTO `system_log` VALUES ('704', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:19:06');
INSERT INTO `system_log` VALUES ('705', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:19:07');
INSERT INTO `system_log` VALUES ('706', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:19:33');
INSERT INTO `system_log` VALUES ('707', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:21:46');
INSERT INTO `system_log` VALUES ('708', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:21:48');
INSERT INTO `system_log` VALUES ('709', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:21:55');
INSERT INTO `system_log` VALUES ('710', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '修改用户权限', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:21:59');
INSERT INTO `system_log` VALUES ('711', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:22:03');
INSERT INTO `system_log` VALUES ('712', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:23:53');
INSERT INTO `system_log` VALUES ('713', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:26:02');
INSERT INTO `system_log` VALUES ('714', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:26:04');
INSERT INTO `system_log` VALUES ('715', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:26:06');
INSERT INTO `system_log` VALUES ('716', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:26:08');
INSERT INTO `system_log` VALUES ('717', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:26:13');
INSERT INTO `system_log` VALUES ('718', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:26:16');
INSERT INTO `system_log` VALUES ('719', 'com.upingwang.controller.RoleController.save()', '0', '角色管理', '角色新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:26:24');
INSERT INTO `system_log` VALUES ('720', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:27:50');
INSERT INTO `system_log` VALUES ('721', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:28:11');
INSERT INTO `system_log` VALUES ('722', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:28:12');
INSERT INTO `system_log` VALUES ('723', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:29:12');
INSERT INTO `system_log` VALUES ('724', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:29:13');
INSERT INTO `system_log` VALUES ('725', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:29:33');
INSERT INTO `system_log` VALUES ('726', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:29:34');
INSERT INTO `system_log` VALUES ('727', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:30:10');
INSERT INTO `system_log` VALUES ('728', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:30:11');
INSERT INTO `system_log` VALUES ('729', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:30:56');
INSERT INTO `system_log` VALUES ('730', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:30:57');
INSERT INTO `system_log` VALUES ('731', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:32:04');
INSERT INTO `system_log` VALUES ('732', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:32:05');
INSERT INTO `system_log` VALUES ('733', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:32:23');
INSERT INTO `system_log` VALUES ('734', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:32:24');
INSERT INTO `system_log` VALUES ('735', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:32:49');
INSERT INTO `system_log` VALUES ('736', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:32:50');
INSERT INTO `system_log` VALUES ('737', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:33:32');
INSERT INTO `system_log` VALUES ('738', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:33:33');
INSERT INTO `system_log` VALUES ('739', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:33:57');
INSERT INTO `system_log` VALUES ('740', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:33:58');
INSERT INTO `system_log` VALUES ('741', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:34:15');
INSERT INTO `system_log` VALUES ('742', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:34:16');
INSERT INTO `system_log` VALUES ('743', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:34:35');
INSERT INTO `system_log` VALUES ('744', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:34:36');
INSERT INTO `system_log` VALUES ('745', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:38:44');
INSERT INTO `system_log` VALUES ('746', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:40:14');
INSERT INTO `system_log` VALUES ('747', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:40:15');
INSERT INTO `system_log` VALUES ('748', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:41:36');
INSERT INTO `system_log` VALUES ('749', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:41:37');
INSERT INTO `system_log` VALUES ('750', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:42:10');
INSERT INTO `system_log` VALUES ('751', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:42:12');
INSERT INTO `system_log` VALUES ('752', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:42:29');
INSERT INTO `system_log` VALUES ('753', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:42:30');
INSERT INTO `system_log` VALUES ('754', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:44:12');
INSERT INTO `system_log` VALUES ('755', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:44:34');
INSERT INTO `system_log` VALUES ('756', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:46:02');
INSERT INTO `system_log` VALUES ('757', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:47:09');
INSERT INTO `system_log` VALUES ('758', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:47:10');
INSERT INTO `system_log` VALUES ('759', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:47:54');
INSERT INTO `system_log` VALUES ('760', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:47:57');
INSERT INTO `system_log` VALUES ('761', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:48:00');
INSERT INTO `system_log` VALUES ('762', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:48:12');
INSERT INTO `system_log` VALUES ('763', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:48:13');
INSERT INTO `system_log` VALUES ('764', 'com.upingwang.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:48:24');
INSERT INTO `system_log` VALUES ('765', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:48:39');
INSERT INTO `system_log` VALUES ('766', 'com.upingwang.controller.LogController.logErrorDetail()', '0', '日志管理', '异常日志详情', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:48:56');
INSERT INTO `system_log` VALUES ('767', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:49:12');
INSERT INTO `system_log` VALUES ('768', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:49:15');
INSERT INTO `system_log` VALUES ('769', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:49:19');
INSERT INTO `system_log` VALUES ('770', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:49:28');
INSERT INTO `system_log` VALUES ('771', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:49:29');
INSERT INTO `system_log` VALUES ('772', 'com.upingwang.controller.RoleController.save()', '0', '角色管理', '角色新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:50:36');
INSERT INTO `system_log` VALUES ('773', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:50:37');
INSERT INTO `system_log` VALUES ('774', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:50:40');
INSERT INTO `system_log` VALUES ('775', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:50:58');
INSERT INTO `system_log` VALUES ('776', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:50:59');
INSERT INTO `system_log` VALUES ('777', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:51:01');
INSERT INTO `system_log` VALUES ('778', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:51:04');
INSERT INTO `system_log` VALUES ('779', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:51:05');
INSERT INTO `system_log` VALUES ('780', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:51:08');
INSERT INTO `system_log` VALUES ('781', 'com.upingwang.controller.UserController.userSave()', '0', '用户管理', '用户新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:51:51');
INSERT INTO `system_log` VALUES ('782', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:51:53');
INSERT INTO `system_log` VALUES ('783', 'com.upingwang.controller.UserController.userRoleUpdate()', '0', '用户管理', '修改用户角色', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:52:00');
INSERT INTO `system_log` VALUES ('784', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:52:08');
INSERT INTO `system_log` VALUES ('785', 'com.upingwang.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 00:52:18');
INSERT INTO `system_log` VALUES ('786', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:52:29');
INSERT INTO `system_log` VALUES ('787', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:53:29');
INSERT INTO `system_log` VALUES ('788', 'com.upingwang.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:55:38');
INSERT INTO `system_log` VALUES ('789', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:55:55');
INSERT INTO `system_log` VALUES ('790', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:56:02');
INSERT INTO `system_log` VALUES ('791', 'com.upingwang.controller.DictionaryController.dictionarySave()', '0', '字典管理', '字典新增', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:56:09');
INSERT INTO `system_log` VALUES ('792', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:56:12');
INSERT INTO `system_log` VALUES ('793', 'com.upingwang.controller.DictionaryController.dictionaryUpdate()', '0', '字典管理', '字典修改', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:56:27');
INSERT INTO `system_log` VALUES ('794', 'com.upingwang.controller.DictionaryController.dictionaryUpdate()', '0', '字典管理', '字典修改', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:57:07');
INSERT INTO `system_log` VALUES ('795', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:57:10');
INSERT INTO `system_log` VALUES ('796', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:57:49');
INSERT INTO `system_log` VALUES ('797', 'com.upingwang.controller.DictionaryController.dictionaryDelete()', '0', '字典管理', '字典删除', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:57:52');
INSERT INTO `system_log` VALUES ('798', 'com.upingwang.controller.DictionaryController.dictionaryDelete()', '0', '字典管理', '字典删除', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:57:55');
INSERT INTO `system_log` VALUES ('799', 'com.upingwang.controller.LogController.logRunDelete()', '0', '日志管理', '删除7天之前运行日志', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:58:02');
INSERT INTO `system_log` VALUES ('800', 'com.upingwang.controller.LogController.logErrorDelete()', '0', '日志管理', '删除7天之前错误日志', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:58:06');
INSERT INTO `system_log` VALUES ('801', 'com.upingwang.controller.LogController.logErrorDetail()', '0', '日志管理', '异常日志详情', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 00:58:09');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `menu_ico` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单图标',
  `menu_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单链接',
  `menu_type` char(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单类型',
  `parent` bigint(10) NOT NULL COMMENT '父级',
  `sort` int(2) DEFAULT '0',
  `status` int(1) DEFAULT '1' COMMENT '1启用0停用',
  `delflag` int(1) DEFAULT '0' COMMENT '1删除0未删除',
  `create_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idex_menu_name` (`menu_name`),
  KEY `idex_parent` (`parent`),
  KEY `idex_menu_type` (`menu_type`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统菜单表';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('9', '系统控制', 'fa2 fa-cogs', '/parent', '2', '0', '1', '1', '0', 'Xushd', '2017-02-03 19:50:35');
INSERT INTO `system_menu` VALUES ('10', '菜单管理', 'fa2 fa-globe', '/menu', '2', '9', '0', '1', '0', 'Xushd', '2017-02-03 19:54:22');
INSERT INTO `system_menu` VALUES ('11', '数据字典', 'fa2 fa-book', '/dictionary', '2', '9', '1', '1', '0', 'Xushd', '2017-02-03 19:58:39');
INSERT INTO `system_menu` VALUES ('12', '权限管理', 'fa2 fa-key', '/permission', '2', '9', '2', '1', '0', 'Xushd', '2017-02-03 19:59:07');
INSERT INTO `system_menu` VALUES ('13', '用户控制', 'fa2 fa-user', '/parent', '2', '0', '0', '1', '0', 'Xushd', '2017-02-03 19:59:49');
INSERT INTO `system_menu` VALUES ('14', '用户管理', 'fa2 fa-address-card-o', '/user', '2', '13', '0', '1', '0', 'Xushd', '2017-02-03 20:00:47');
INSERT INTO `system_menu` VALUES ('15', '角色管理', 'fa2 fa-group', '/role', '2', '13', '1', '1', '0', 'Xushd', '2017-02-03 20:01:15');
INSERT INTO `system_menu` VALUES ('16', '系统日志', 'fa2 fa-file-code-o', '/parent', '2', '0', '2', '1', '0', 'Xushd', '2017-02-03 20:04:21');
INSERT INTO `system_menu` VALUES ('17', '运行日志', 'fa2 fa-modx', '/log/run', '2', '16', '0', '1', '0', 'Xushd', '2017-02-03 20:06:03');
INSERT INTO `system_menu` VALUES ('18', '异常日志', 'fa2 fa-bug', '/log/error', '2', '16', '1', '1', '0', 'Xushd', '2017-02-03 20:06:38');

-- ----------------------------
-- Table structure for system_permission
-- ----------------------------
DROP TABLE IF EXISTS `system_permission`;
CREATE TABLE `system_permission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限名称',
  `permission_key` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限KEY',
  `parent` bigint(10) NOT NULL COMMENT '父节点id 0为父节点',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `status` int(1) DEFAULT '1' COMMENT '1启用0停用',
  `delflag` int(1) DEFAULT '0' COMMENT '1删除0未删除',
  `create_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idex_permission_name` (`permission_name`),
  KEY `idex_permission_key` (`permission_key`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统权限表';

-- ----------------------------
-- Records of system_permission
-- ----------------------------
INSERT INTO `system_permission` VALUES ('34', '用户管理', '/user', '0', '0', '1', '0', 'Xushd', '2017-02-03 20:18:39');
INSERT INTO `system_permission` VALUES ('35', '用户注册', '/user/save', '34', '0', '1', '0', 'Xushd', '2017-02-03 20:19:17');
INSERT INTO `system_permission` VALUES ('36', '用户信息编辑', '/user/update', '34', '1', '1', '0', 'Xushd', '2017-02-03 20:19:54');
INSERT INTO `system_permission` VALUES ('37', '用户密码修改', '/user/pass', '34', '3', '1', '0', 'Xushd', '2017-02-03 22:14:43');
INSERT INTO `system_permission` VALUES ('38', '用户头像修改', '/user/advert', '34', '4', '1', '0', 'Xushd', '2017-02-03 22:15:10');
INSERT INTO `system_permission` VALUES ('39', '用户角色修改', '/user/role', '34', '5', '1', '0', 'Xushd', '2017-02-03 22:15:54');
INSERT INTO `system_permission` VALUES ('40', '用户删除', '/user/delete', '34', '2', '1', '0', 'Xushd', '2017-02-03 22:16:10');
INSERT INTO `system_permission` VALUES ('41', '角色管理', '/role', '0', '1', '1', '0', 'Xushd', '2017-02-04 00:13:38');
INSERT INTO `system_permission` VALUES ('42', '角色新增', '/role/save', '41', '0', '1', '0', 'Xushd', '2017-02-04 00:14:05');
INSERT INTO `system_permission` VALUES ('43', '角色修改', '/role/update', '41', '1', '1', '0', 'Xushd', '2017-02-04 00:14:23');
INSERT INTO `system_permission` VALUES ('44', '权限分配', '/role/permission', '41', '2', '1', '0', 'Xushd', '2017-02-04 00:15:36');
INSERT INTO `system_permission` VALUES ('45', '角色删除', '/role/delete', '41', '3', '1', '0', 'Xushd', '2017-02-04 00:17:47');
INSERT INTO `system_permission` VALUES ('46', '菜单管理', '/menu', '0', '2', '1', '0', 'Xushd', '2017-02-04 00:28:11');
INSERT INTO `system_permission` VALUES ('47', '菜单新增', '/menu/save', '46', '0', '1', '0', 'Xushd', '2017-02-04 00:29:12');
INSERT INTO `system_permission` VALUES ('48', '菜单修改', '/menu/update', '46', '1', '1', '0', 'Xushd', '2017-02-04 00:29:33');
INSERT INTO `system_permission` VALUES ('49', '菜单删除', '/menu/delete', '46', '2', '1', '0', 'Xushd', '2017-02-04 00:30:10');
INSERT INTO `system_permission` VALUES ('50', '数据字典', '/dictionary', '0', '3', '1', '0', 'Xushd', '2017-02-04 00:30:56');
INSERT INTO `system_permission` VALUES ('51', '字典新增', '/dictionary/save', '50', '0', '1', '0', 'Xushd', '2017-02-04 00:32:04');
INSERT INTO `system_permission` VALUES ('52', '字典修改', '/dictionary/update', '50', '1', '1', '0', 'Xushd', '2017-02-04 00:32:23');
INSERT INTO `system_permission` VALUES ('53', '字典删除', '/dictionary/delete', '50', '2', '1', '0', 'Xushd', '2017-02-04 00:32:49');
INSERT INTO `system_permission` VALUES ('54', '权限管理', '/permission', '0', '4', '1', '0', 'Xushd', '2017-02-04 00:33:32');
INSERT INTO `system_permission` VALUES ('55', '权限新增', '/permission/save', '54', '0', '1', '0', 'Xushd', '2017-02-04 00:33:57');
INSERT INTO `system_permission` VALUES ('56', '权限修改', '/permission/update', '54', '1', '1', '0', 'Xushd', '2017-02-04 00:34:15');
INSERT INTO `system_permission` VALUES ('57', '权限删除', '/permission/delete', '54', '2', '1', '0', 'Xushd', '2017-02-04 00:34:35');
INSERT INTO `system_permission` VALUES ('58', '运行日志', '/log/run', '0', '5', '1', '0', 'Xushd', '2017-02-04 00:40:14');
INSERT INTO `system_permission` VALUES ('59', '日志删除', '/log/run/delete', '58', '0', '1', '0', 'Xushd', '2017-02-04 00:41:36');
INSERT INTO `system_permission` VALUES ('60', '异常日志', '/log/error', '0', '6', '1', '0', 'Xushd', '2017-02-04 00:42:10');
INSERT INTO `system_permission` VALUES ('61', '日志删除', '/log/error/delete', '60', '0', '1', '0', 'Xushd', '2017-02-04 00:42:29');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` char(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色key',
  `role_description` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色描述',
  `status` int(1) DEFAULT '1' COMMENT '1启用0停用',
  `delflag` int(1) DEFAULT '0' COMMENT '1删除0未删除',
  `create_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idex_role_key` (`role_key`),
  KEY `idex_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统角色表';

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('1000', '系统管理员', 'admin', '系统初始默认系统管理员角色', '1', '0', 'root', '2017-01-19 20:43:57');
INSERT INTO `system_role` VALUES ('1001', '开发用户', 'dev', '开发使用，可以查看系统日志及非系统模块的功能', '1', '0', 'Xushd', '2017-02-04 00:50:36');

-- ----------------------------
-- Table structure for system_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `system_role_permission`;
CREATE TABLE `system_role_permission` (
  `role_id` bigint(10) NOT NULL COMMENT '角色ID',
  `permission_id` bigint(10) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色权限关联表';

-- ----------------------------
-- Records of system_role_permission
-- ----------------------------
INSERT INTO `system_role_permission` VALUES ('1000', '34');
INSERT INTO `system_role_permission` VALUES ('1000', '35');
INSERT INTO `system_role_permission` VALUES ('1000', '36');
INSERT INTO `system_role_permission` VALUES ('1000', '37');
INSERT INTO `system_role_permission` VALUES ('1000', '38');
INSERT INTO `system_role_permission` VALUES ('1000', '39');
INSERT INTO `system_role_permission` VALUES ('1000', '40');
INSERT INTO `system_role_permission` VALUES ('1000', '41');
INSERT INTO `system_role_permission` VALUES ('1000', '42');
INSERT INTO `system_role_permission` VALUES ('1000', '43');
INSERT INTO `system_role_permission` VALUES ('1000', '44');
INSERT INTO `system_role_permission` VALUES ('1000', '45');
INSERT INTO `system_role_permission` VALUES ('1000', '46');
INSERT INTO `system_role_permission` VALUES ('1000', '47');
INSERT INTO `system_role_permission` VALUES ('1000', '48');
INSERT INTO `system_role_permission` VALUES ('1000', '49');
INSERT INTO `system_role_permission` VALUES ('1000', '50');
INSERT INTO `system_role_permission` VALUES ('1000', '51');
INSERT INTO `system_role_permission` VALUES ('1000', '52');
INSERT INTO `system_role_permission` VALUES ('1000', '53');
INSERT INTO `system_role_permission` VALUES ('1000', '54');
INSERT INTO `system_role_permission` VALUES ('1000', '55');
INSERT INTO `system_role_permission` VALUES ('1000', '56');
INSERT INTO `system_role_permission` VALUES ('1000', '57');
INSERT INTO `system_role_permission` VALUES ('1000', '58');
INSERT INTO `system_role_permission` VALUES ('1000', '59');
INSERT INTO `system_role_permission` VALUES ('1000', '60');
INSERT INTO `system_role_permission` VALUES ('1000', '61');
INSERT INTO `system_role_permission` VALUES ('1001', '50');
INSERT INTO `system_role_permission` VALUES ('1001', '58');
INSERT INTO `system_role_permission` VALUES ('1001', '60');

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `user_phone` char(11) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户手机号',
  `password` char(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `user_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_advert` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '1启用0停用',
  `delflag` int(1) DEFAULT '0' COMMENT '1删除0未删除',
  `create_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新者',
  `remark` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idex_user_name` (`user_name`),
  KEY `idex_user_phone` (`user_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统用户表';

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1000', 'Xushd', '13354239889', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'xsd529@163.com', 'http://localhost:9000/uping/advert/1485997104037253.jpg', '1', '0', 'root', null, null, '');
INSERT INTO `system_user` VALUES ('1001', 'dev0001', '13800000001', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'dev0001@163.com', '/resources/images/person.jpg', '1', '0', 'Xushd', '2017-02-04 00:51:51', null, '');

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role` (
  `user_id` bigint(10) NOT NULL COMMENT '用户ID',
  `role_id` bigint(10) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户角色关联';

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES ('1000', '1000');
INSERT INTO `system_user_role` VALUES ('1001', '1001');
