/*
Navicat MySQL Data Transfer

Source Server         : CentOS
Source Server Version : 50621
Source Host           : 192.168.1.187:3306
Source Database       : uping_system

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-02-06 18:03:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for system_bureau
-- ----------------------------
DROP TABLE IF EXISTS `system_bureau`;
CREATE TABLE `system_bureau` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bureau_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '教育局名称',
  `bureau_area` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '区域',
  `bureau_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '区域code',
  `status` int(1) DEFAULT '1' COMMENT '1启用0停用',
  `delflag` int(1) DEFAULT '0' COMMENT '1删除0未删除',
  `create_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `INDEX_CODE` (`bureau_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='教育局信息表';

-- ----------------------------
-- Records of system_bureau
-- ----------------------------
INSERT INTO `system_bureau` VALUES ('1', '皇姑区教育局', '辽宁省沈阳市皇姑区', '210105', '1', '0', 'Xushd', '2017-02-06 09:59:08');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统字典表';

-- ----------------------------
-- Records of system_dictionary
-- ----------------------------
INSERT INTO `system_dictionary` VALUES ('1', '系统功能', '0', '1', '0', 'Xushd', '2017-01-23 15:28:55');
INSERT INTO `system_dictionary` VALUES ('2', '系统', '1', '1', '0', 'Xushd', '2017-01-23 15:29:43');
INSERT INTO `system_dictionary` VALUES ('3', '学校', '1', '1', '0', 'Xushd', '2017-02-04 10:11:54');

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
  `params` text COLLATE utf8_unicode_ci COMMENT '请求参数',
  `user_name` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'root' COMMENT '操作用户名',
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '日志时间',
  PRIMARY KEY (`id`),
  KEY `idex_log_time` (`log_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1062 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统日志表';

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
INSERT INTO `system_log` VALUES ('802', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 09:22:54');
INSERT INTO `system_log` VALUES ('803', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 09:22:59');
INSERT INTO `system_log` VALUES ('804', 'com.upingwang.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 09:23:07');
INSERT INTO `system_log` VALUES ('805', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 09:35:33');
INSERT INTO `system_log` VALUES ('806', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 09:36:33');
INSERT INTO `system_log` VALUES ('807', 'com.upingwang.controller.DictionaryController.dictionarySave()', '0', '字典管理', '字典新增', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 09:36:46');
INSERT INTO `system_log` VALUES ('808', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 09:36:49');
INSERT INTO `system_log` VALUES ('809', 'com.upingwang.controller.DictionaryController.dictionaryDelete()', '0', '字典管理', '字典删除', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 09:36:52');
INSERT INTO `system_log` VALUES ('810', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:05:09');
INSERT INTO `system_log` VALUES ('811', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:05:10');
INSERT INTO `system_log` VALUES ('812', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:08:01');
INSERT INTO `system_log` VALUES ('813', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:08:05');
INSERT INTO `system_log` VALUES ('814', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:08:08');
INSERT INTO `system_log` VALUES ('815', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:08:10');
INSERT INTO `system_log` VALUES ('816', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:08:12');
INSERT INTO `system_log` VALUES ('817', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:08:26');
INSERT INTO `system_log` VALUES ('818', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:08:30');
INSERT INTO `system_log` VALUES ('819', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:09:02');
INSERT INTO `system_log` VALUES ('820', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:09:02');
INSERT INTO `system_log` VALUES ('821', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:09:04');
INSERT INTO `system_log` VALUES ('822', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:09:05');
INSERT INTO `system_log` VALUES ('823', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:09:05');
INSERT INTO `system_log` VALUES ('824', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:11:04');
INSERT INTO `system_log` VALUES ('825', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:11:42');
INSERT INTO `system_log` VALUES ('826', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:11:45');
INSERT INTO `system_log` VALUES ('827', 'com.upingwang.controller.DictionaryController.dictionarySave()', '0', '字典管理', '字典新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:11:54');
INSERT INTO `system_log` VALUES ('828', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:11:56');
INSERT INTO `system_log` VALUES ('829', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:12:01');
INSERT INTO `system_log` VALUES ('830', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:12:07');
INSERT INTO `system_log` VALUES ('831', 'com.upingwang.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:14:32');
INSERT INTO `system_log` VALUES ('832', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:14:33');
INSERT INTO `system_log` VALUES ('833', 'com.upingwang.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:14:41');
INSERT INTO `system_log` VALUES ('834', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:14:42');
INSERT INTO `system_log` VALUES ('835', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:18:46');
INSERT INTO `system_log` VALUES ('836', 'com.upingwang.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:18:54');
INSERT INTO `system_log` VALUES ('837', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:18:55');
INSERT INTO `system_log` VALUES ('838', 'com.upingwang.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:21:00');
INSERT INTO `system_log` VALUES ('839', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:21:01');
INSERT INTO `system_log` VALUES ('840', 'com.upingwang.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:24:52');
INSERT INTO `system_log` VALUES ('841', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:24:53');
INSERT INTO `system_log` VALUES ('842', 'com.upingwang.controller.MenuController.menuUpdate()', '0', '菜单管理', '菜单修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:25:08');
INSERT INTO `system_log` VALUES ('843', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:25:09');
INSERT INTO `system_log` VALUES ('844', 'com.upingwang.controller.MenuController.menuSave()', '0', '菜单管理', '菜单新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:26:31');
INSERT INTO `system_log` VALUES ('845', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:26:33');
INSERT INTO `system_log` VALUES ('846', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:27:09');
INSERT INTO `system_log` VALUES ('847', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:27:56');
INSERT INTO `system_log` VALUES ('848', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:33:41');
INSERT INTO `system_log` VALUES ('849', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 10:33:51');
INSERT INTO `system_log` VALUES ('850', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 11:06:53');
INSERT INTO `system_log` VALUES ('851', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 11:06:58');
INSERT INTO `system_log` VALUES ('852', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 11:07:45');
INSERT INTO `system_log` VALUES ('853', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 11:26:36');
INSERT INTO `system_log` VALUES ('854', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 11:26:37');
INSERT INTO `system_log` VALUES ('855', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 11:26:38');
INSERT INTO `system_log` VALUES ('856', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 11:26:39');
INSERT INTO `system_log` VALUES ('857', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 11:26:39');
INSERT INTO `system_log` VALUES ('858', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 11:27:01');
INSERT INTO `system_log` VALUES ('859', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 11:27:05');
INSERT INTO `system_log` VALUES ('860', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 11:27:08');
INSERT INTO `system_log` VALUES ('861', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 11:27:09');
INSERT INTO `system_log` VALUES ('862', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 13:37:12');
INSERT INTO `system_log` VALUES ('863', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 13:37:18');
INSERT INTO `system_log` VALUES ('864', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 13:45:58');
INSERT INTO `system_log` VALUES ('865', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 13:47:01');
INSERT INTO `system_log` VALUES ('866', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 13:47:10');
INSERT INTO `system_log` VALUES ('867', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 13:47:16');
INSERT INTO `system_log` VALUES ('868', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 13:47:35');
INSERT INTO `system_log` VALUES ('869', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 13:51:13');
INSERT INTO `system_log` VALUES ('870', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 13:52:16');
INSERT INTO `system_log` VALUES ('871', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 13:55:04');
INSERT INTO `system_log` VALUES ('872', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 13:55:21');
INSERT INTO `system_log` VALUES ('873', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:00:25');
INSERT INTO `system_log` VALUES ('874', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:02:53');
INSERT INTO `system_log` VALUES ('875', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:06:01');
INSERT INTO `system_log` VALUES ('876', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:06:17');
INSERT INTO `system_log` VALUES ('877', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:27:24');
INSERT INTO `system_log` VALUES ('878', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:28:15');
INSERT INTO `system_log` VALUES ('879', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:28:37');
INSERT INTO `system_log` VALUES ('880', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:28:45');
INSERT INTO `system_log` VALUES ('881', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:28:53');
INSERT INTO `system_log` VALUES ('882', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:28:54');
INSERT INTO `system_log` VALUES ('883', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:28:54');
INSERT INTO `system_log` VALUES ('884', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:37:54');
INSERT INTO `system_log` VALUES ('885', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:38:17');
INSERT INTO `system_log` VALUES ('886', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:38:18');
INSERT INTO `system_log` VALUES ('887', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:38:19');
INSERT INTO `system_log` VALUES ('888', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:38:19');
INSERT INTO `system_log` VALUES ('889', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:38:20');
INSERT INTO `system_log` VALUES ('890', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:38:21');
INSERT INTO `system_log` VALUES ('891', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:38:21');
INSERT INTO `system_log` VALUES ('892', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:38:21');
INSERT INTO `system_log` VALUES ('893', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:38:22');
INSERT INTO `system_log` VALUES ('894', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:43:19');
INSERT INTO `system_log` VALUES ('895', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:44:16');
INSERT INTO `system_log` VALUES ('896', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:47:24');
INSERT INTO `system_log` VALUES ('897', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:47:43');
INSERT INTO `system_log` VALUES ('898', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:52:10');
INSERT INTO `system_log` VALUES ('899', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:52:11');
INSERT INTO `system_log` VALUES ('900', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:52:12');
INSERT INTO `system_log` VALUES ('901', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:52:13');
INSERT INTO `system_log` VALUES ('902', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:52:14');
INSERT INTO `system_log` VALUES ('903', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:53:48');
INSERT INTO `system_log` VALUES ('904', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:53:50');
INSERT INTO `system_log` VALUES ('905', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:54:58');
INSERT INTO `system_log` VALUES ('906', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:55:02');
INSERT INTO `system_log` VALUES ('907', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:55:06');
INSERT INTO `system_log` VALUES ('908', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:55:08');
INSERT INTO `system_log` VALUES ('909', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:55:10');
INSERT INTO `system_log` VALUES ('910', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:55:14');
INSERT INTO `system_log` VALUES ('911', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:55:16');
INSERT INTO `system_log` VALUES ('912', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:55:19');
INSERT INTO `system_log` VALUES ('913', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:56:39');
INSERT INTO `system_log` VALUES ('914', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:56:43');
INSERT INTO `system_log` VALUES ('915', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:56:44');
INSERT INTO `system_log` VALUES ('916', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:56:44');
INSERT INTO `system_log` VALUES ('917', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:56:45');
INSERT INTO `system_log` VALUES ('918', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:56:46');
INSERT INTO `system_log` VALUES ('919', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:56:47');
INSERT INTO `system_log` VALUES ('920', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:56:48');
INSERT INTO `system_log` VALUES ('921', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:56:49');
INSERT INTO `system_log` VALUES ('922', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:58:31');
INSERT INTO `system_log` VALUES ('923', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:58:33');
INSERT INTO `system_log` VALUES ('924', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:58:34');
INSERT INTO `system_log` VALUES ('925', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:58:35');
INSERT INTO `system_log` VALUES ('926', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:58:35');
INSERT INTO `system_log` VALUES ('927', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:58:36');
INSERT INTO `system_log` VALUES ('928', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 14:58:37');
INSERT INTO `system_log` VALUES ('929', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:03:37');
INSERT INTO `system_log` VALUES ('930', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:03:38');
INSERT INTO `system_log` VALUES ('931', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:03:40');
INSERT INTO `system_log` VALUES ('932', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:03:45');
INSERT INTO `system_log` VALUES ('933', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:03:49');
INSERT INTO `system_log` VALUES ('934', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:05:48');
INSERT INTO `system_log` VALUES ('935', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:05:50');
INSERT INTO `system_log` VALUES ('936', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:05:51');
INSERT INTO `system_log` VALUES ('937', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:05:52');
INSERT INTO `system_log` VALUES ('938', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:05:57');
INSERT INTO `system_log` VALUES ('939', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:06:03');
INSERT INTO `system_log` VALUES ('940', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:06:04');
INSERT INTO `system_log` VALUES ('941', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:06:09');
INSERT INTO `system_log` VALUES ('942', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:06:10');
INSERT INTO `system_log` VALUES ('943', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:06:11');
INSERT INTO `system_log` VALUES ('944', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 15:06:12');
INSERT INTO `system_log` VALUES ('945', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:28:41');
INSERT INTO `system_log` VALUES ('946', 'com.upingwang.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:29:19');
INSERT INTO `system_log` VALUES ('947', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:30:10');
INSERT INTO `system_log` VALUES ('948', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:30:35');
INSERT INTO `system_log` VALUES ('949', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:30:38');
INSERT INTO `system_log` VALUES ('950', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:30:40');
INSERT INTO `system_log` VALUES ('951', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:31:20');
INSERT INTO `system_log` VALUES ('952', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:31:21');
INSERT INTO `system_log` VALUES ('953', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:31:48');
INSERT INTO `system_log` VALUES ('954', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:31:49');
INSERT INTO `system_log` VALUES ('955', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:32:15');
INSERT INTO `system_log` VALUES ('956', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:32:17');
INSERT INTO `system_log` VALUES ('957', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:32:40');
INSERT INTO `system_log` VALUES ('958', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:32:41');
INSERT INTO `system_log` VALUES ('959', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:32:53');
INSERT INTO `system_log` VALUES ('960', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:32:58');
INSERT INTO `system_log` VALUES ('961', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:32:59');
INSERT INTO `system_log` VALUES ('962', 'com.upingwang.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:33:03');
INSERT INTO `system_log` VALUES ('963', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:33:20');
INSERT INTO `system_log` VALUES ('964', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:42:53');
INSERT INTO `system_log` VALUES ('965', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 16:49:30');
INSERT INTO `system_log` VALUES ('966', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:46:36');
INSERT INTO `system_log` VALUES ('967', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:46:40');
INSERT INTO `system_log` VALUES ('968', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 17:46:40');
INSERT INTO `system_log` VALUES ('969', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:47:06');
INSERT INTO `system_log` VALUES ('970', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:47:09');
INSERT INTO `system_log` VALUES ('971', 'com.upingwang.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:47:14');
INSERT INTO `system_log` VALUES ('972', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:47:35');
INSERT INTO `system_log` VALUES ('973', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:47:38');
INSERT INTO `system_log` VALUES ('974', 'com.upingwang.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:48:13');
INSERT INTO `system_log` VALUES ('975', 'com.upingwang.controller.MenuController.menuJson()', '0', '菜单管理', '前台菜单获取', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:48:33');
INSERT INTO `system_log` VALUES ('976', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:48:36');
INSERT INTO `system_log` VALUES ('977', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:49:06');
INSERT INTO `system_log` VALUES ('978', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:49:07');
INSERT INTO `system_log` VALUES ('979', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'dev0001', '2017-02-04 17:49:07');
INSERT INTO `system_log` VALUES ('980', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 17:52:04');
INSERT INTO `system_log` VALUES ('981', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 17:52:28');
INSERT INTO `system_log` VALUES ('982', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 17:53:31');
INSERT INTO `system_log` VALUES ('983', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-04 18:04:40');
INSERT INTO `system_log` VALUES ('984', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 09:56:18');
INSERT INTO `system_log` VALUES ('985', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 09:56:20');
INSERT INTO `system_log` VALUES ('986', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 09:56:25');
INSERT INTO `system_log` VALUES ('987', 'com.upingwang.controller.BureauController.bureauSave()', '0', '教育局管理', '教育局新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 09:59:08');
INSERT INTO `system_log` VALUES ('988', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 09:59:09');
INSERT INTO `system_log` VALUES ('989', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:10:32');
INSERT INTO `system_log` VALUES ('990', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:11:06');
INSERT INTO `system_log` VALUES ('991', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:11:27');
INSERT INTO `system_log` VALUES ('992', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:12:07');
INSERT INTO `system_log` VALUES ('993', 'com.upingwang.controller.MenuController.menuRedisClear()', '0', '菜单管理', '菜单缓存清除', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:12:08');
INSERT INTO `system_log` VALUES ('994', 'com.upingwang.controller.MenuController.menuRedisClear()', '0', '菜单管理', '菜单缓存清除', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:12:11');
INSERT INTO `system_log` VALUES ('995', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:13:05');
INSERT INTO `system_log` VALUES ('996', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:13:29');
INSERT INTO `system_log` VALUES ('997', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:13:30');
INSERT INTO `system_log` VALUES ('998', 'com.upingwang.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:13:39');
INSERT INTO `system_log` VALUES ('999', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:13:58');
INSERT INTO `system_log` VALUES ('1000', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:14:06');
INSERT INTO `system_log` VALUES ('1001', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:14:10');
INSERT INTO `system_log` VALUES ('1002', 'com.upingwang.controller.MenuController.menuRedisClear()', '0', '菜单管理', '菜单缓存清除', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:14:11');
INSERT INTO `system_log` VALUES ('1003', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:14:18');
INSERT INTO `system_log` VALUES ('1004', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:14:21');
INSERT INTO `system_log` VALUES ('1005', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:14:22');
INSERT INTO `system_log` VALUES ('1006', 'com.upingwang.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:14:26');
INSERT INTO `system_log` VALUES ('1007', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:14:54');
INSERT INTO `system_log` VALUES ('1008', 'com.upingwang.controller.MenuController.menuRedisClear()', '0', '菜单管理', '菜单缓存清除', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:14:58');
INSERT INTO `system_log` VALUES ('1009', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:15:21');
INSERT INTO `system_log` VALUES ('1010', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:16:03');
INSERT INTO `system_log` VALUES ('1011', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:16:05');
INSERT INTO `system_log` VALUES ('1012', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:16:07');
INSERT INTO `system_log` VALUES ('1013', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:16:14');
INSERT INTO `system_log` VALUES ('1014', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:16:17');
INSERT INTO `system_log` VALUES ('1015', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:16:40');
INSERT INTO `system_log` VALUES ('1016', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:16:41');
INSERT INTO `system_log` VALUES ('1017', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:17:31');
INSERT INTO `system_log` VALUES ('1018', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:17:32');
INSERT INTO `system_log` VALUES ('1019', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:18:01');
INSERT INTO `system_log` VALUES ('1020', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:18:02');
INSERT INTO `system_log` VALUES ('1021', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:18:27');
INSERT INTO `system_log` VALUES ('1022', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:18:29');
INSERT INTO `system_log` VALUES ('1023', 'com.upingwang.controller.PermissionController.permissionSave()', '0', '权限管理', '权限新增', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:19:11');
INSERT INTO `system_log` VALUES ('1024', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:19:12');
INSERT INTO `system_log` VALUES ('1025', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:19:26');
INSERT INTO `system_log` VALUES ('1026', 'com.upingwang.controller.RoleController.rolePermission()', '0', '角色管理', '角色权限分配', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:19:35');
INSERT INTO `system_log` VALUES ('1027', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:19:37');
INSERT INTO `system_log` VALUES ('1028', 'com.upingwang.controller.LoginController.logOut()', '0', '登录模块', '用户退出', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:20:34');
INSERT INTO `system_log` VALUES ('1029', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:41:55');
INSERT INTO `system_log` VALUES ('1030', 'com.upingwang.controller.PermissionController.permissionList()', '0', '权限管理', '权限列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:41:58');
INSERT INTO `system_log` VALUES ('1031', 'com.upingwang.controller.DictionaryController.dictionaryList()', '0', '字典管理', '字典列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:42:01');
INSERT INTO `system_log` VALUES ('1032', 'com.upingwang.controller.MenuController.menuList()', '0', '菜单管理', '菜单列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:42:03');
INSERT INTO `system_log` VALUES ('1033', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 13:43:44');
INSERT INTO `system_log` VALUES ('1034', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 16:26:58');
INSERT INTO `system_log` VALUES ('1035', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 16:40:29');
INSERT INTO `system_log` VALUES ('1036', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 16:50:51');
INSERT INTO `system_log` VALUES ('1037', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:25:49');
INSERT INTO `system_log` VALUES ('1038', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:26:21');
INSERT INTO `system_log` VALUES ('1039', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:26:39');
INSERT INTO `system_log` VALUES ('1040', 'com.upingwang.controller.BureauController.userList()', '0', '教育局管理', '教育局列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:27:25');
INSERT INTO `system_log` VALUES ('1041', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:27:30');
INSERT INTO `system_log` VALUES ('1042', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:28:07');
INSERT INTO `system_log` VALUES ('1043', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:31:42');
INSERT INTO `system_log` VALUES ('1044', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:36:49');
INSERT INTO `system_log` VALUES ('1045', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:37:44');
INSERT INTO `system_log` VALUES ('1046', 'com.upingwang.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:37:53');
INSERT INTO `system_log` VALUES ('1047', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:39:40');
INSERT INTO `system_log` VALUES ('1048', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:39:55');
INSERT INTO `system_log` VALUES ('1049', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:44:13');
INSERT INTO `system_log` VALUES ('1050', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:52:34');
INSERT INTO `system_log` VALUES ('1051', 'com.upingwang.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:52:41');
INSERT INTO `system_log` VALUES ('1052', 'com.upingwang.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:54:50');
INSERT INTO `system_log` VALUES ('1053', 'com.upingwang.controller.RoleController.roleList()', '0', '角色管理', '角色列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:57:15');
INSERT INTO `system_log` VALUES ('1054', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:57:17');
INSERT INTO `system_log` VALUES ('1055', 'com.upingwang.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:57:25');
INSERT INTO `system_log` VALUES ('1056', 'com.upingwang.service.impl.SystemUserServiceImpl.userAdvertUpload()', '1', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', 'org.springframework.dao.DataIntegrityViolationException', '### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'user_advert\' at row 1\r\n### The error may involve com.upingwang.mapper.SystemUserMapper.updateByPrimaryKeySelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update system_user      SET user_advert = ?      where id = ?\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'user_advert\' at row 1\n; SQL []; Data truncation: Data too long for column \'user_advert\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'user_advert\' at row 1', '[{\"bytes\":\"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\",\"contentType\":\"image/jpeg\",\"empty\":false,\"fileItem\":{\"contentType\":\"image/jpeg\",\"fieldName\":\"advert\",\"formField\":false,\"headers\":{\"headerNames\":{}},\"inMemory\":true,\"inputStream\":{},\"name\":\"0.jpg\",\"outputStream\":{\"byteCount\":4989,\"data\":\"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\",\"file\":\"C:\\\\Users\\\\Administrator\\\\IdeaProjects\\\\UpingWang\\\\upingwang_manager\\\\upingwang_controller\\\\target\\\\tomcat\\\\work\\\\Tomcat\\\\localhost\\\\_\\\\upload_d9ed5201_44f5_4fbb_adc7_beb4ae2e03e9_00000001.tmp\",\"inMemory\":true,\"threshold\":10240,\"thresholdExceeded\":false},\"size\":4989,\"storeLocation\":\"C:\\\\Users\\\\Administrator\\\\IdeaProjects\\\\UpingWang\\\\upingwang_manager\\\\upingwang_controller\\\\target\\\\tomcat\\\\work\\\\Tomcat\\\\localhost\\\\_\\\\upload_d9ed5201_44f5_4fbb_adc7_beb4ae2e03e9_00000001.tmp\",\"string\":\"ÿØÿà\\u0000\\u0010JFIF\\u0000\\u0001\\u0001\\u0001\\u0000H\\u0000H\\u0000\\u0000ÿÛ\\u0000C\\u0000\\r\\t\\t\\n\\n\\n\\u000E\\u000B\\u000B\\u000E\\u0014\\r\\u000B\\r\\u0014\\u0017\\u0011\\u000E\\u000E\\u0011\\u0017\\u001B\\u0015\\u0015\\u0015\\u0015\\u0015\\u001B\\u001B\\u0015\\u0017\\u0017\\u0017\\u0017\\u0015\\u001B\\u001A\\u001E ! \\u001E\\u001A\'\'**\'\'555556666666666ÿÛ\\u0000C\\u0001\\u000E\\r\\r\\u0011\\u0011\\u0011\\u0017\\u0011\\u0011\\u0017\\u0017\\u0013\\u0014\\u0013\\u0017\\u001D\\u0019\\u001A\\u001A\\u0019\\u001D&\\u001D\\u001D\\u001E\\u001D\\u001D&,$    $,(+&&&+(//,,//666666666666666ÿÀ\\u0000\\u0011\\b\\u0000È\\u0000È\\u0003\\u0001\\u0011\\u0000\\u0002\\u0011\\u0001\\u0003\\u0011\\u0001ÿÄ\\u0000\\u001B\\u0000\\u0000\\u0002\\u0003\\u0001\\u0001\\u0001\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0003\\u0004\\u0001\\u0002\\u0005\\u0006\\u0000\\u0007ÿÄ\\u0000:\\u0010\\u0000\\u0001\\u0003\\u0002\\u0004\\u0004\\u0004\\u0005\\u0002\\u0004\\u0005\\u0005\\u0000\\u0000\\u0000\\u0000\\u0001\\u0000\\u0002\\u0003\\u0004\\u0011\\u0012!1A\\u0005\\u0013\\\"Q\\u0006aq\\u0081\\u00142\\u0091¡±#BRbÁÑ\\u000734rá\\u0016S\\u0092ðñÿÄ\\u0000\\u001A\\u0001\\u0000\\u0003\\u0001\\u0001\\u0001\\u0001\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0001\\u0002\\u0003\\u0004\\u0005\\u0006ÿÄ\\u0000!\\u0011\\u0001\\u0001\\u0001\\u0001\\u0001\\u0001\\u0001\\u0000\\u0003\\u0000\\u0003\\u0001\\u0000\\u0000\\u0000\\u0000\\u0000\\u0001\\u0011\\u0002\\u0003\\u0012!\\u0004\\u00131\\u0014\\\"A2ÿÚ\\u0000\\f\\u0003\\u0001\\u0000\\u0002\\u0011\\u0003\\u0011\\u0000?\\u0000Ç2)Åj¼Äðµ\\\\I\\u0092¸\\u0093%n\\u0099\\\"é\\u0084!(s\\u0083\\u0005Êp\\u0017ø±îtU\\u0080¼ò=îÃß^ê¡U9\\u0098\\u0006\\u0016\\u0083\\u009A\\u0002Í/\\u001F3u@C1\\u008FM¶O\\u0002Íª|G[\\u0083¡S\\u0080Í3^÷s,rÞöû\\u00955pìÕ\\u0005à\\u000BX\\u008Dï\\u007Fº\\u0083^#\\u0088z\\\"¥b\\u0088\\u0094YQ\\\"È\\bA<\\u0083JJB\\u0002\\u0010\\u0002Ä§\\u0017¨Ä\\u009E\\u0016£\\u0012\\u0003Ø\\u0093\'®\\u0080õÓ\\u0001>¥\\u008D½\\u0086\\u009Bª\\u0090\\u0089ó%©\\u007F-»è\\u0015ü¤ìôñE`Þ¹M\\u0080\\nWQ\\u001D3m¨¹ùß·¢-#qÒ\\u0086\\u008BÇ\\u001E¹\\u0019\\u001F\\u0097¸\\u001A¨Ó\\u0080ÔB\\u0006Åû\\u000B\\u0002.\\u007F%\\u001At\\u0003@ü\\u009D ÁÙºýU}\'\\u0002\\u0092\\u001C9ZÝ½UhÃ\\u0011ô±\\u0091·7\\u001CÜ|Ê\\u008ApIC!\\u001DN\\u0019h\\u00120é\'ëµò½¬\\u009DLi¹¸\\u007Fº\\u0081CT\\u0097\\u0090\\u0010\\u0082E\\u0090k)R\\n\\u0002\\u00850S\\u0012aìH\\u000F]2zè\\u000FbHÂ\\u0096LºUÂ\\u0001Âç\\u000FÕP\\u001E9\\u0084#\\fC¬êR\\u000Favg\\u0017ûß¿\\u00A0H\\u0006Ú\\u008C\\u0007#f\\r;§\\u0081çÕ=ç§\\u0010înn\\u0094\\u0087§éø¯%\\u0098^ó\\u0095¬Hþ\\u00A0©ë\\u0095J\\u0099«qJ\\u000EX]¡Ûê\\u0012ù\\nÉ\\u001Bçvokm¶zù&Z\\u008EP\\u0088]Ï°îãa\\u007F!º¢Òs\\u0012÷tÞÝ÷)ÈIlX\\u001C-\\u0091ÖéQ\\u001A4¯/\\u0016w°YÕ\\u009AåÛÓºIÀÜ\\u0010HL\\u0095A¬\\u0091¨â\\u0090\\f¦\\tÝY=t\\u0007®\\u0099=t\\u00049ßtC\\u000EA\\u0084\\u000B|Û\\u0005D\\u0001v\\r~m\\u0015\\u0005ãv\\u0011\\u0089 ,Ò\\u0006ÂØÆ®êqK\\f¶\\u000B\\u0091¯\\u0092a.k¯ë\\u00A0@«G9\\u0089í½\\u009FmC\\u0080-ú FÔ\\u0091ÑÖR\\u0017ÄÞUHµ\\u0084wÀÿ\\u0000,=V+\\u0016\\u0098Ïø\\u001A\\u008C&Q\\u0089\\u008CÔl´\\u009D3¤úË°»¬\\u009C\\u0085ïôÍQF\\u008D-1{9Ñ´àfr3^\\u009Fâiòì¢ôÒCß\\u000F\\u001B\\u009A$¸Ë/+\\u001Bf§èH(¦øg\\u000B°åº\\u008D\\\\\\u00869A\\u008Cæ\\u0097\\u0086\\u008D\\u0083®\\u0091XVY\\u0098z¾\\u0096ÑR)Y\\u001ClH9\\u0001p©)kñ4\\u001Eè\\u000B]I\\u00A0\\u0094\\u0000\\\\û*\\\"·TIº\\u0003×@NH0\\\\üNòL$»ÿ\\u0000\\\"¨\\u008A\\u009E·\\u001F-U%lð\\u009Bm\\u0098R§¤v\'\\u00A0j·ËÓtÆ\\u008FK\\u000F:ça\\u0095ÔÕCsQ1±âi\\u0017*>\\u009A|´ø7\\u000Fc¥\\u0085¯\\u001A±ÏxÓ°\\u0003î¢ÓÆ\\u0084\\u009C\\u0012w<Á\\u0011.\\u0080\\u009CE£0IìNmKì|\\u0081QáÜ\\u0086\\u0011\\u0085ã1lò\\u001E\\u007FÕ\\u0013Ð¾\\tS¶n\\u001B1iÒKå¶zÿ\\u0000ñ=Õ|¦\\u0007ÚIa¶L\\u0004\\u0011¨Ã{\\u0083ì\\u000FÑ4ãY\\u0094<AÐÇÍs\\r(É¯¹#È9À\\\\\\u000E×\\u0016óYõqP>+GTØ\\u0083\\u009FLÜ\\u0003W1áÍ#Ù\\u0012\\u009D\\u008C¶\\u001AnS\\u009A\\u001ACÇsqôV\\u008C*c\\u0092A~Ú\\u008FåïeZÎ¯ò\\u0084T Éd\\tÐ2N\\u009E\\u001D.é\\u001Cí\\u0015ÎS{YJ\\u0092\\u0080õÓ\\u0001I\\\"\\f!¶~ª\\u0088XíÕ»µ¾¨ \\u0019ó\\u009F<\\u0090\\u0007\\u008ANSÚû_¸ÚÉ-\\u001C@3\\u009A$\\u008BGf?²9+\\u000BÅ\\u001CÓ\\u001C\\r¾z§G1Ñpú\\u000E\\\\x\\u001A1îN×òX^\\u009AóËB>\\u001B3ÝnYü\\u008FÍ\\u0094ëGCÃx?(bwÌm}ý\\u0094uF6c¥dCò³\\fª9`g\\u0014¨¦\\u009D×-c\\u0004\\\"ÄôZûzª°k\\u001FÄÑ@Ö\\u0019cÚæúeÙkÂ~\\u0089ø3\\u0087\\u001Aú¹ä\\u0094]\\u0098\\b\'Ìä\\u0015z\\\\G-\\u0086º«ÃÓ\\u0098%c¥\\u00A0wÈö\\u008B\\u0096\\rÁ\\u001B\\u008FÂÃÿ\\u0000¦ØbHø5d%ÐJÖ\\u0013\\u0099\\fu\\u0087¸ÿ\\u0000\\u0084ÉÇÕE\\u001B\\\\û\\u009B\\u0080rïª×\\u009A\\u008A]\\u0092\\tO¥óÙ[:\\u0004ò\\u0006«\\u0091\\u0095-Ìs´U9+Ö,Úw½\\\\å\\u0087~øÐ§áø¶ZN\\\\·Ø\\u008D\\u0097+ÔzÈ\\nHp\\u008F4C*ç]ËBUÎ-\\u001Eh!ãv\\u0018Ã·7\\u0007l\\u0092\\n\\u0098\\u009F\\u001B\\u0086Y\\u001CÁò(P\\u008D\\u0018­åª\\u0085CTôf\\u00A0g¶\\u009B©½/\\u001AÔ\\u009C5\\u0091íý\\u0014^\\u0095\\u008D\\u0098a\\r¶K3jÒÆ\\u0091´ãv\\u0010\\u00A0Ó4\\u0097a²\\u0003\\u008Fñ\\u0005\\reD\\u008C¨\\u0083\\u0014uQX\\t\\u001Bqp4\\u0006Þ«^itB\\u001E\\u0017â\\u000E,ðÊÉ?Hj]\\u009FØ+¾\\u008Cþ\\u001Dï\\u0003á1pÊq\\u001CcÌ\\u009DÉXuÞ®Cµ\\u0094ñÔÇ\\u0085ãLÁÞêbõ\\u0083WÃàù¤\\u0081\\u0092<e\\u008B\\bÄ®R®V²\\u008EX¢`\\u0095\\u00A0\\u0017\\u0013qü·Ék*+.~\\\\\\u007Fåêu\\u001Aæµ\\u0091\\u008FT¯!Ï+XåïÐÝ=\\rÖ±ÅéìÓ\\u0086\\u0084\\r\\u0093×7}éúzp\\u0012ÔJå¬¹_D\\u008C(\\u0000T·+öN\\u00027²Ð\\u00966u¼ò(%­w[ö\\u008FÀH/Îqu¯Ò/aý\\u0090¡£hq»·ÙFª68{\\u0080ím\\u0000YØÕ§G\'5Ç°9\\u001Fè¢Å5âÀ\\u0014\\u0091èj\\\"¶¡#0Ù£;ê\\u0091®\\b¿ª@FÂ\\u001C\\u0096\\u008Af\\u001Av7;{¥¢\\u0018HÕr\\b\\t#c\\u0093\\u000ECÆ\\u009F¤Ú{nH[ð\\u008E\\u009C»akÜÜºÉ¹ô[Ç?£F\\u001A1er¼¿n\\u008C2\\u0010Ò´\\u0095ç÷M2É\\u0090\\u008D6(\\u0012¹;.WÓ½d\\u0002õyÆ«\\u0094³\\u009F\\u001B¯ê´%\\u008Br×]\\u0090\\u0012\\u0006ykº\\u0003ß¿È\\\"\\u009CjAÊu9¸ë\\u001FU\\u0095i\\rRÒ\\u0089\\u0000óÕEhÝ§\\u008D\\u0094ñÙ£¨è\\u0016uFãáòÔg#ËAÑ­Ëê\\u0096\\u008D[à\\f\\u0006÷$w)\\rXTyè\\u00983\\r_Ût¨jÓT\\u0007\\u008FE ó\\u001C\\u00A0,ù0µ\\u0006Jj\\u009EÞåV\\u001176ªC\\u008A#ê\\u00136\'\\u008A\\u001Cî\\\\\\u0018\\u0087[\\u000B\\u0081\\u000BO:\\u008EÜü9\\u009Cdh¶\\u008E/ä~Fµ9\\u0005\\u008AÞO}/ËÄUóXN~\\u008EÃI\\u0097\\u009A/nÏ?ã-%.\\u001CÑ;O\\u007FÇqk\\u0017´«ò\\b\\u0000M\\u0094*¹I\\u000B\\u0015¡$ÚÝ[j\\u0080ö-\\u009A=÷@Z6â#$­Th²\\u0017`·{,­i\\u001Aô\\u008CÀÁôY­±I\\u0018\\u0007\\u0013¾ªTuÕM\\u0085\\u0097ì§\\u00063fã\\u0013MvÁ\\u0013\\u009Fk\\u009B\\u0081\\u0095½ÕàdÍ]PÇÞF:=\\u008DÆJ¾KLÓq\\u000BÛ4¯#]\'\\r\\u009B\\u001AÎ\\u009B¡\\u0081\\u0097mÖT\\u0017­\\u0093\\u0094.í\\u0013\\u0081ÍÖq)ïúq=ÌÔ\\u00902ZÈbpÞ<É\\u001D\\u0080äá\\u0091\\u001A%aÒþ1\\u0095\\u008D§\\u0086A«\\u0089ü*ò\\u008C½\\u001CÍ=EÆ\\u001Eë¢8ý\\u007Fí\\u001At\\u008F6ÌXéeO\\u001FÚejÒ³\\u0013\\u0094Õÿ\\u0000\\u001F\\u009FÖÕ<!gkÙóæcÕ\\u0011\\u000B\\\"Tzó\\u001F5º¦Ê\\u0094\\u0002\\u0095\\u000FÀ0÷W\\b¶\\u0013·ÑZPàö\\u008FL\\u008FtÂ\\u009DNÑ\\u0001¡@Âç\\u008FºË¦\\u009C·\\u00A0¥Ä4ËºËZ\\u009C\\u008E\\u001C*\\fÜW>\\u00882õÓ23\\u0085×\\u0091Çå`ïçä\\u009C\\u0085B©tðÑ¶ydåb\\\"6µ\\u009A4\\u0013\\u0099=íÙi9c×lÉ*cæDÈ*\\u008DceÊxdaicü\\u008E\\u0084\\u0014ó\\u0004¢ÒÑó\\u007FR\\u000Bò]rAÕ®\\u001B%jÝ7\\u0004k\\u009Bkì±íq×Ál\\u000B\\u0015\\u0011âP\\u00878\\u0017i\\u0095\\u0087\\u009A®S\\\\¯\\u001A®dU2ÓË]ðØ\\u0018\\u000B\\u001AÖ]¥çö\\u009Bfº9\\u008C¯lªQ-W.v\\u008FÖÑÛ{¥ÛnhÞ&sßððºß¦ÒOk\\u0094pÏÑ\\u0085\\bv<Ý\\u0086Ú-£\\u009B¯ñ¯LìÇå[Å÷¿­\\u008AWa*z\\u0083Ç¬lC6K?\\u0097«çëø¬Ó§9\\u001E\\u009D¾ot:^º\\u0001\\u0019úßé\\u0092Ò\\u0012¼¬N\\u0000{\\\"©éÞóÐî¬9\\u0003º\\u0000\\u0004\\u0090ßEhið\\u0093õXö×\\u0097WI\\u001FHXZÔè§Ä\\u0090\\u001E*7\\u0013oº\\fCÁã¾\\\"Ûÿ\\u00006÷GÐ±J®\\r\\u0005T\\u0006\\u0019%-\\u00071\\u0090$\\u001Eê¿µ\\u009Dò\\u000B\\u0086øF\\u0086\\u009EA3¥|Ïn`a\\rmûþë¥}U<ÎÏÃá\\u008468\\u0019\\u0081º\\u009Eþé}iü¯M\\u0010\\u0089E9\\u001B4Rd¡X4ñµÿ\\u00000¿nè\\u00958æx×\\u0086éëæçµÎ\\u008EA`A\\u0017\\u0006ËiØþ­3CÁâ\\u00866Ç\\u001B2`¶#©=ÔõÚ¾qÍx¾7ÃXÌ²s\\u0006k_&=¹øÍÍ¬·\\u008Enÿ\\u0000Æ\\u0095\\u001EvVñýyýlÃ¢\\u008BYOÃ\\\"G5\\u0011ÓÇht¥ÉÓ½¸e\\u009B×zÈ\\u0005\\u009CÛ8ùæ¬TÇ\\u00919÷7J¯\\u00944_¨mªb\\u0095\\u009B©øX5ÙS*w\\u0086â\\u008EFßÝGm<ã±£\\u007F@\\\\ÕÐÓ\\u0085Á\\\"?\\u0013óü¤q¥\\u0015\\u009C\\u0014\\u0098¼\\u0085!\\u0005\\u0098}{¦T¼\\u0091}Ó\\fê\\u00890;\\bÙP\\u0087x|£}ÔUµ]ÔÔ\\u0099\\u0086X\\n5z\\u009Bd\\u0098q¾3\\u0011¶HÝ è-\\\"ë_6~\\u008E5\\u008FfniË@ºdrtÐ¡z­y~ñ¹O¢Î¹ÇDZ\\u0089\\u008DqI=Ç\\u0090\\u0014\\u0091\\u00A0\\u008CöU\\u0013A\\u008BçÃß \\u009BNGÁÊ\\u008FÝK[ÈtÎcjLï\\u0017\\u0002à\\u000F5Lï\'£n7s-kçe\\u009E®FÝ\\u0013²Yô¸Ô\\u0089Ê\\fì.Í#\\u008D:Wý\\u0014\\u009BA®ÉHI²\\u0001j\\u0087ai=\\u0093Ms\\u0082¯\\u0014®óZCeCâ\\u0088æª1F\\u001CË8´:Ý.·á;Á·O\\u0089c¦\\u008E6ÈI\\u0092L\\u0098Á\\u009B\\u008Fsä<Öx©Ë¢¥\\u0097\\u009B\\u000B]ÝN\'¨\\\"\\u0003\\u008Aÿ\\u0000\\u0010!\\u0096X©ÌgG\\u0010}\\u0016þ,}\\u009C[`13=JérÓtra(pûFí=@²\\u009B\\u001Ccº¤\\\"B/%`\\n±XåÔ=Ç\\u0090\\u001E(\\n:Úî\\u00133\\u00921¿\\r\\u008Fè¢WOþ\\u0011l2\\u001BºÅV³\\u0093ôô\\u000E?\\u000E\\u001C\\u007Fc\\u0080ö*ZV¥\\u001B\\u0094Ñ\\u001A±¹@9\\u000B\\u0092Qè¤²\\u0093=\\u001Cù$¡¹·\\t$­cîÌ=ÕD¹ÇðÚ\\u009Eis\\u001C,wW\\u0006«Oá¼\\u0007\\u0013\\u0005\\u0089Ì\\u0094þ\\u0087Ó]þ\\u001F\\u008EfÄáfË\\u001EX\\u0088¹²ÎÕN\\u009Bp4C\\u001Bc\\u001F·+©ÑE.É åüaþ\\u009E/÷\\u001FÂÛÉ\\u0087»\\u008B\\u009Cdº\\u001CÄ¹\\u0098\\u001C®0ï\\u008D5\\u001F\\u0011Ãº¬rõâ\\u00898·\\u009Ax\'ñÉMÅIÝ6Üÿ\\u0000\\u001CUÎîy\\u0001\\u0017A\\u0007.\\u008A\\u0080ü2±\\u009Féå?í;z)ë\\u0097G\\u0097ZÓøg´â\\u008DÃ=C³iYë\\\\Cáqoê[,Ã[¥û\\u0094ASC!Í§dTµ!\\u0091H8É\\u00123\\u0011Ì\\u0091\\u009B\\u008Et\\u008CËgH\\u0017\\u009A¨cU\\u0012\\u0098¤\\u000EO\\u0012Õ¥t$[\\u0010¿e\\u0015\\u007F\\u00039ìý¤\\u0015#\\u0000t½HÁ\\u0012eA¹o\\u0014Ï\\u008EHâþ\\u0010I÷[y9½ÜÌ£%»\\u009D\\u0093T\\bW\\t\\u009Eé\\u001C\\u0015\\u009FÈD¸¦¬\\u0088ÂPzÛX\\u0007®\\u0080\\u0082\\u0099\\u0086öïÛdÁ)Å\\u009Fqº¤í?IÆå\\u0085¡\\u0092\\u000EcF\\u0087u\\u001Dpß\\u008Fl\\u0016N<×\\u0090ÐÂ/©*~\\u0017}µ§\\r²\\u0091»©³\\u000BtóJ\\u0095\\u0098\\u008EE&a¯H\\u0018\\u008Dé\\u0018Üì-N\\u0015eÍU×{ä®D³ë¼F(Å\\u009Az\\u008E\\u008D\\u001F7ü\\u0005S\\u0085l\\u008C\\u008FúÆ³\\u0016LËµÎª¿¨ÿ\\u0000äc¢ðï\\u0089¦«p\\u0012k¡\\u000B>øi÷õ\\u001DG3\\u0013\\u0096,çå\\u0015Ò\\u00860¹Ú\\fÉD\\u0085Õq\\u0095ó\\u009A\\u009A\\u0087ÉÜåèº8qúR2\\u0005IgTÆ®\\u00139ôæêô#áÑ¡?\\u000E\\u008D\\u0007®²Z.\\u0080\\u008B¦\\u0015)\\u0082Òµ¥1\\u00A0X\\u0004È7*\\u0081Ðpz\\u008Ed8\\u000E­Xz6æ¶#9,Ú\\fÔ(v\\u0095&j4\\u0082j\\u001Df\'\\u0013\\\\¿\\u0015¯,¼qüç~Ã¿ªÖ@ç^×\\u0017\\u0012ãrs\'Rµ\\u0088¼Ðmª½N7ü\'\\u008Bâ¼®\\tXú6çñô8M×-9úO\\u008DUò\\u00A0å·æ\\u0093#è¯\\u0098ËÖ¹Òµs\\u0006à\\u0098-$wL\\u008B:\\u0004ô#\\u0092\\u009E\\u0085y(Ð\\u0015ÒZ\\n\\u0000nrd\\u0019\\u00910\\u0013Ü\\u0082\\u0002êÂn\\u0083Ö\\u0087\\t%³e¦ë.Úq]\\u0014Nû¬ZÃ-B\\u0085\\u008DJ¡Ø¬\\u0090¨©Ó\\u000F|\\u0095Dÿ\\u0000ë\\u008A\\u009A3Î\\u0090ËpüFäú­%o\\u009F\\u0085æ\\fÿ\\u0000\\u0085R§¸\\u000Bi±³\\u001D²Üª×=u^\\u0014áæ(]PíôYwZf:È\\u009C\\u001B\\u001E#\\u00A0Ì\\u0095\\u0089\\u007F\\u008Ejº¨ÕT9ÿ\\u0000´dÑä´\\u008E~î\\u0080U³\\u00904Â\\u0085¨\\u0001¹¨\\u0001á@{\\na\\u009DtÔ«\\u0090\\u0001z¤\\u0080\\\\\\u0098P\\u0095AD\\u0082.\\u0083lpX±]ý´YvÓ\\u0088Øk¬T45\\u001B\\u0094ª\\u000E×$¨v\\u009B¨¤(5n<ÏDÏ\\u008FôÍ=\\u0005-dFK\\u000B¿\'\\f¾ÈÖýOÂ\\u0092øE²\\u0087àsY°&çTç£>ª­ðÛ(é\\f2<>I2f\\u001Eû\\u0094_Rç\\u008DlRÒ²*l\\rÐX\\u000Fe\\u0016\\u009F·ã;\\u008C×ò£øhÏ[¾oE\\\\Ç?§_\\u008Cf-\\u001Câ\\u0014BÕJaT\\u0005\\u001C\\u0080\\u0011@A@dãT¥L\\u008A\\u0088\\u0017¹2\\u0001É\\u0085\\u0013\\bR\\u0017\\u008A\\u0017ÊðÖ\\u008DQj£§£§\\u0014ð\\u0086ýV\\u001DVüÁ\\nAxåÃè\\u0080e¯û¥\\u008AÓ\\u0094µ\\u0018Táêk®\\u001F\\u008Fö\\u009DÓ\\u0082P¨ø\\u0083è\\u009F{c\\u0085Ú\\u008DýB,uùú6éøµ\\u0003\\u0085ñ\\u0011Ü\\u0011\\u009A\\u009F\\u0095ß>Pk`\\u0095ß\\u00A0\\u000BÞr\\u000E:\\u0001ä\\u008COÔ\\u008Añ*ÖpêQÿ\\u0000päÑæ\\u009F1ÇéÓ\\u008FtÏ\\u0096C#ÍÜs%jæ£F\\u009AEA!\\u0001[\\u00A0(ä\\u0010E\\u0001[\\u00A0Ø/\\u0091j\\u0003æ&\\u0015Ä\\u0080ª`FSË »[\\u0092Dv\\u008F\\u0087\\u0090ìRû\\u0004\\u0081øbdOÅl\\u008A\\u009E\\u0097Íh_%\\u00967\\u0095B\\u0082\\u0005Î@UµN\\u0088þBx4ì5,\\u007FÊ}Fêpõ©M#&o.MÔ¨vpL_#ò:#èÌ3ÃçøþÊ>\\u008E^\\u008FÃÃá£g1Ç\\u0011\\u001A#EµÎñÊ\\u001Aº\\u0099¹ì»Út\\u001D\\u0082Û\\u0098æ½1]\\u0004±\\u001FÔam\\u0095¤XÒ!PJ\\u00A0\\u0090\\u0080\\u001B\\u008A`\\u0017\\u0014\\u0004\\\\ Üô\\u008BP\\u0018iv\\u00810n\\u000E\\u0019U1É\\u0084\\u0003¹Hµ«\\u000F\\u0002dmÅ\'S»l\\u0084é\\u0091\\u0003XÜ-\\u0019vHj¼» j\\u000BPo5îj\\u009F\\u0095}\\u008BÌÄ§å§Ò\\u008E\\nU¥ÞÕF\\u0016\\\"ÃqõBtí?\\u0010\\u0095§¨b¶ú\\u001564æ·è+ç·EÏ\\u0092ÎÅý6iêkd?åû\\u0092¢\\u009E\\u009A\\u0090\\u0097t;2uì\\u009F1\\u0097}<#\\u0000aì´b\\f\\u0094\\u0090>áí\\t\\u0086Eg\\u0087Ù|P\\u001B_m\\u0093K6n\\u001DU\\u0017ì¿\\u0098TD$ya³²òA\\u0002gO\\u0000n\\u009D0\\u0013¤@W\\u009C\\u0099\\u008DEá·Ì\\u0004\\u0093\\u001E\\u0093\\u009D\\u0093ÓmSðºx[Ñ\\u0018Ët¾\\u0092`Â-¢\\t_\\u0086¸@Å\\u001FKm\\u0093\\u0018\\t¦ò@À\\u008C>^È\\u0001\\u0018<½\\u0091¤¯\'î\\u0083Õ\\u001D\\u001B\\u0086\\u009B%ò¯\\u00A0]\\u008B²X¿í\\u0006Ùæ\\r\\u0091\\u0087öv\\u009D\\u008CË¤¨ùTí¿BöD\\u0007Fª~\\u000Fû\\u001AÑÔHroHSð\\u009F±cÌþJx\\u009D3qlÐ\\u0014Â\\u0098N\\u0004\\u0082®cJdÎ®àðU4åcÝT¡Êñ\\u001E\\u0003WJK\\u009A1°oº¹PÆs¾¡PS\\u0011@T\\u0097&\\u001DÅ Ä\\u0000Ùf\\fòÀH#\\u0097ÿ\\u0000»¦\\u001ElMº\\u0002p³û$\\u0003ÂÃª`\\u001F\\u0087\\u0007Odô\\u00834¾HÐ£©rËÐ\\u0084ÀN¥ÂáÒ|û&\\u00154¸²²4bíá¹u7Ý-<3\\u0015\\bhÈz©Ðz:l6¶Éi\\u009D\\u0085¶)\\u0018Í\\u0019ä¤\\b\\u0006\\u001CþÈ1\\u00125I@F\\u001B\\u00A0,FH\\u0001I\\u00171¶w¢\\u00A0ù÷\\u001A¡\\u0010V½­\\u0019\\u001CÂÖ\\\"³Äj\\u0089nR\\u0003ÿÙ\"},\"inputStream\":{},\"name\":\"advert\",\"originalFilename\":\"0.jpg\",\"size\":4989,\"storageDescription\":\"in memory\"},1001]', 'Xushd', '2017-02-06 17:57:25');
INSERT INTO `system_log` VALUES ('1057', 'com.upingwang.controller.LogController.logErrorDetail()', '0', '日志管理', '异常日志详情', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:58:30');
INSERT INTO `system_log` VALUES ('1058', 'com.upingwang.controller.UserController.userList()', '0', '用户管理', '用户列表', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:59:16');
INSERT INTO `system_log` VALUES ('1059', 'com.upingwang.controller.UserController.userAdvertUpload()', '0', '用户管理', '用户头像修改', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 17:59:22');
INSERT INTO `system_log` VALUES ('1060', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 18:00:19');
INSERT INTO `system_log` VALUES ('1061', 'com.upingwang.controller.SchoolController.schoolLogoUpload()', '0', '学校管理', '学校logo上传', '0:0:0:0:0:0:0:1', null, null, null, 'Xushd', '2017-02-06 18:02:43');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统菜单表';

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
INSERT INTO `system_menu` VALUES ('19', '学校控制', 'fa2 fa-mortar-board', '/parent', '3', '0', '3', '1', '0', 'Xushd', '2017-02-04 10:14:32');
INSERT INTO `system_menu` VALUES ('20', '教育局管理', 'fa2 fa-rebel', '/bureau', '3', '19', '0', '1', '0', 'Xushd', '2017-02-04 10:21:00');
INSERT INTO `system_menu` VALUES ('21', '学校录入', 'fa2 fa-google-plus-official', '/school/input', '3', '19', '1', '1', '0', 'Xushd', '2017-02-04 10:24:52');
INSERT INTO `system_menu` VALUES ('22', '学校管理', 'fa2 fa-shirtsinbulk', '/school', '3', '19', '2', '1', '0', 'Xushd', '2017-02-04 10:26:31');

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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统权限表';

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
INSERT INTO `system_permission` VALUES ('62', '教育局管理', '/bureau', '0', '7', '1', '0', 'Xushd', '2017-02-04 16:31:20');
INSERT INTO `system_permission` VALUES ('63', '教育局新增', '/bureau/save', '62', '0', '1', '0', 'Xushd', '2017-02-04 16:31:48');
INSERT INTO `system_permission` VALUES ('64', '教育局修改', '/bureau/update', '62', '1', '1', '0', 'Xushd', '2017-02-04 16:32:15');
INSERT INTO `system_permission` VALUES ('65', '教育局删除', '/bureau/delete', '62', '2', '1', '0', 'Xushd', '2017-02-04 16:32:40');
INSERT INTO `system_permission` VALUES ('66', '同步菜单缓存', '/menu/redis/clear', '46', '3', '1', '0', 'Xushd', '2017-02-06 13:13:29');
INSERT INTO `system_permission` VALUES ('67', '学校管理', '/school', '0', '8', '1', '0', 'Xushd', '2017-02-06 13:16:40');
INSERT INTO `system_permission` VALUES ('68', '学校录入', '/school/input', '67', '0', '1', '0', 'Xushd', '2017-02-06 13:17:31');
INSERT INTO `system_permission` VALUES ('69', '学校新增', '/school/save', '67', '1', '1', '0', 'Xushd', '2017-02-06 13:18:01');
INSERT INTO `system_permission` VALUES ('70', '学校修改', '/school/update', '67', '2', '1', '0', 'Xushd', '2017-02-06 13:18:27');
INSERT INTO `system_permission` VALUES ('71', '学校删除', '/shool/delete', '67', '3', '1', '0', 'Xushd', '2017-02-06 13:19:11');

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
INSERT INTO `system_role_permission` VALUES ('1000', '62');
INSERT INTO `system_role_permission` VALUES ('1000', '63');
INSERT INTO `system_role_permission` VALUES ('1000', '64');
INSERT INTO `system_role_permission` VALUES ('1000', '65');
INSERT INTO `system_role_permission` VALUES ('1000', '66');
INSERT INTO `system_role_permission` VALUES ('1000', '67');
INSERT INTO `system_role_permission` VALUES ('1000', '68');
INSERT INTO `system_role_permission` VALUES ('1000', '69');
INSERT INTO `system_role_permission` VALUES ('1000', '70');
INSERT INTO `system_role_permission` VALUES ('1000', '71');
INSERT INTO `system_role_permission` VALUES ('1001', '50');
INSERT INTO `system_role_permission` VALUES ('1001', '58');
INSERT INTO `system_role_permission` VALUES ('1001', '60');

-- ----------------------------
-- Table structure for system_school
-- ----------------------------
DROP TABLE IF EXISTS `system_school`;
CREATE TABLE `system_school` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bureau_id` bigint(10) NOT NULL COMMENT '教育局id',
  `school_code` char(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '学校code',
  `school_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '学校名称',
  `school_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '学校地址',
  `school_logo` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '学校LOGO',
  `school_linkman` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '学校联系人',
  `school_linkphone` char(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '学校联系电话',
  `status` int(1) DEFAULT '1' COMMENT '1启用0停用',
  `delflag` int(1) DEFAULT '0' COMMENT '1删除0未删除',
  `create_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `INDEX_CODE` (`school_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统学校表';

-- ----------------------------
-- Records of system_school
-- ----------------------------

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
  `user_advert` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
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
INSERT INTO `system_user` VALUES ('1000', 'Xushd', '13354239889', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'xsd529@163.com', 'http://localhost:9000/uping/advert/1486373872630405.jpg', '1', '0', 'root', null, null, '');
INSERT INTO `system_user` VALUES ('1001', 'dev0001', '13800000001', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'dev0001@163.com', 'http://upingwang.oss-cn-beijing.aliyuncs.com/userAdvert/1486375161697568.jpg?x-oss-process=image/resize,m_fill,w_200,h_200,limit_0/auto-orient,0/quality,q_100', '1', '0', 'Xushd', '2017-02-04 00:51:51', null, '');

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
SET FOREIGN_KEY_CHECKS=1;
