/*
Navicat MySQL Data Transfer

Source Server         : zeze
Source Server Version : 50731
Source Host           : 39.106.96.175:3306
Source Database       : seckillgoods

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2021-01-18 21:11:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `admin_auth_rule`;
CREATE TABLE `admin_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(255) NOT NULL DEFAULT '',
  `rule_url` varchar(255) NOT NULL DEFAULT '',
  `role_id_list` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_name` (`rule_name`),
  UNIQUE KEY `rule_url` (`rule_url`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin_auth_rule
-- ----------------------------
INSERT INTO `admin_auth_rule` VALUES ('1', '系统日志', '/admin/syslog', '1,2');
INSERT INTO `admin_auth_rule` VALUES ('2', '管理员管理', '/admin/administrator', '1,2');
INSERT INTO `admin_auth_rule` VALUES ('3', '商品管理', '/admin/goods', '1,3');
INSERT INTO `admin_auth_rule` VALUES ('4', '客户管理', '/admin/customer', '1,2');

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=882 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin_log
-- ----------------------------
INSERT INTO `admin_log` VALUES ('1', '0', '', '/admin/login', '[::1]:10234', '2021-01-04 13:40:12');
INSERT INTO `admin_log` VALUES ('2', '0', '', '/admin/dologin', '[::1]:10234', '2021-01-04 13:41:15');
INSERT INTO `admin_log` VALUES ('3', '1', 'root', '/admin', '[::1]:10234', '2021-01-04 13:41:15');
INSERT INTO `admin_log` VALUES ('4', '1', 'root', '/admin', '[::1]:10748', '2021-01-04 13:45:03');
INSERT INTO `admin_log` VALUES ('5', '1', 'root', '/admin/logout', '[::1]:10748', '2021-01-04 13:45:17');
INSERT INTO `admin_log` VALUES ('6', '1', 'root', '/admin', '[::1]:11268', '2021-01-04 21:49:06');
INSERT INTO `admin_log` VALUES ('7', '1', 'root', '/admin', '[::1]:12676', '2021-01-04 22:10:39');
INSERT INTO `admin_log` VALUES ('8', '1', 'root', '/admin/welcome', '[::1]:12676', '2021-01-04 22:10:44');
INSERT INTO `admin_log` VALUES ('9', '1', 'root', '/admin', '[::1]:13052', '2021-01-04 22:15:32');
INSERT INTO `admin_log` VALUES ('10', '1', 'root', '/admin/welcome', '[::1]:13052', '2021-01-04 22:15:35');
INSERT INTO `admin_log` VALUES ('11', '1', 'root', '/admin', '[::1]:13156', '2021-01-04 22:16:51');
INSERT INTO `admin_log` VALUES ('12', '1', 'root', '/admin/welcome', '[::1]:13156', '2021-01-04 22:16:54');
INSERT INTO `admin_log` VALUES ('13', '1', 'root', '/admin', '[::1]:13697', '2021-01-04 22:25:19');
INSERT INTO `admin_log` VALUES ('14', '1', 'root', '/admin/welcome', '[::1]:13697', '2021-01-04 22:25:19');
INSERT INTO `admin_log` VALUES ('15', '1', 'root', '/admin/person', '[::1]:13738', '2021-01-04 22:25:42');
INSERT INTO `admin_log` VALUES ('16', '1', 'root', '/admin/login', '[::1]:13697', '2021-01-04 22:26:44');
INSERT INTO `admin_log` VALUES ('17', '1', 'root', '/admin', '[::1]:13697', '2021-01-04 22:26:44');
INSERT INTO `admin_log` VALUES ('18', '1', 'root', '/admin/welcome', '[::1]:13697', '2021-01-04 22:26:44');
INSERT INTO `admin_log` VALUES ('19', '1', 'root', '/admin/logout', '[::1]:13697', '2021-01-04 22:26:46');
INSERT INTO `admin_log` VALUES ('20', '1', 'root', '/admin', '[::1]:13697', '2021-01-04 22:27:14');
INSERT INTO `admin_log` VALUES ('21', '1', 'root', '/admin/welcome', '[::1]:13697', '2021-01-04 22:27:14');
INSERT INTO `admin_log` VALUES ('22', '1', 'root', '/admin', '[::1]:7306', '2021-01-04 22:29:10');
INSERT INTO `admin_log` VALUES ('23', '1', 'root', '/admin/welcome', '[::1]:7306', '2021-01-04 22:29:10');
INSERT INTO `admin_log` VALUES ('24', '1', 'root', '/admin', '[::1]:14787', '2021-01-04 22:43:50');
INSERT INTO `admin_log` VALUES ('25', '1', 'root', '/admin/welcome', '[::1]:14787', '2021-01-04 22:43:50');
INSERT INTO `admin_log` VALUES ('26', '1', 'root', '/admin/person', '[::1]:14787', '2021-01-04 22:43:52');
INSERT INTO `admin_log` VALUES ('27', '1', 'root', '/admin', '[::1]:14787', '2021-01-04 22:44:50');
INSERT INTO `admin_log` VALUES ('28', '1', 'root', '/admin/welcome', '[::1]:14787', '2021-01-04 22:44:50');
INSERT INTO `admin_log` VALUES ('29', '1', 'root', '/admin/person', '[::1]:14787', '2021-01-04 22:44:52');
INSERT INTO `admin_log` VALUES ('30', '1', 'root', '/admin/person', '[::1]:14787', '2021-01-04 22:45:27');
INSERT INTO `admin_log` VALUES ('31', '1', 'root', '/admin', '[::1]:14787', '2021-01-04 22:46:08');
INSERT INTO `admin_log` VALUES ('32', '1', 'root', '/admin/welcome', '[::1]:14787', '2021-01-04 22:46:08');
INSERT INTO `admin_log` VALUES ('33', '1', 'root', '/admin/person', '[::1]:14787', '2021-01-04 22:46:10');
INSERT INTO `admin_log` VALUES ('34', '1', 'root', '/admin/person', '[::1]:14787', '2021-01-04 22:46:18');
INSERT INTO `admin_log` VALUES ('35', '1', 'root', '/admin', '[::1]:1921', '2021-01-04 22:59:07');
INSERT INTO `admin_log` VALUES ('36', '1', 'root', '/admin/welcome', '[::1]:1921', '2021-01-04 22:59:07');
INSERT INTO `admin_log` VALUES ('37', '1', 'root', '/admin/person', '[::1]:1921', '2021-01-04 22:59:09');
INSERT INTO `admin_log` VALUES ('38', '1', 'root', '/admin/person', '[::1]:1921', '2021-01-04 22:59:33');
INSERT INTO `admin_log` VALUES ('39', '1', 'root', '/admin', '[::1]:1921', '2021-01-04 22:59:35');
INSERT INTO `admin_log` VALUES ('40', '1', 'root', '/admin/welcome', '[::1]:1921', '2021-01-04 22:59:35');
INSERT INTO `admin_log` VALUES ('41', '1', 'root', '/admin/person', '[::1]:1921', '2021-01-04 22:59:37');
INSERT INTO `admin_log` VALUES ('42', '1', 'root', '/admin/person', '[::1]:1921', '2021-01-04 23:00:06');
INSERT INTO `admin_log` VALUES ('43', '1', 'root', '/admin/person', '[::1]:1921', '2021-01-04 23:00:23');
INSERT INTO `admin_log` VALUES ('44', '1', 'root', '/admin', '[::1]:1921', '2021-01-04 23:00:24');
INSERT INTO `admin_log` VALUES ('45', '1', 'root', '/admin/welcome', '[::1]:1921', '2021-01-04 23:00:25');
INSERT INTO `admin_log` VALUES ('46', '1', 'root', '/admin', '[::1]:2382', '2021-01-04 23:04:46');
INSERT INTO `admin_log` VALUES ('47', '1', 'root', '/admin/welcome', '[::1]:2382', '2021-01-04 23:04:46');
INSERT INTO `admin_log` VALUES ('48', '1', 'root', '/admin/person', '[::1]:2382', '2021-01-04 23:04:48');
INSERT INTO `admin_log` VALUES ('49', '1', 'root', '/admin', '[::1]:2820', '2021-01-04 23:10:17');
INSERT INTO `admin_log` VALUES ('50', '1', 'root', '/admin/welcome', '[::1]:2820', '2021-01-04 23:10:17');
INSERT INTO `admin_log` VALUES ('51', '1', 'root', '/admin/person', '[::1]:2820', '2021-01-04 23:10:21');
INSERT INTO `admin_log` VALUES ('52', '1', 'root', '/admin/person', '[::1]:2820', '2021-01-04 23:11:41');
INSERT INTO `admin_log` VALUES ('53', '1', 'root', '/admin/person', '[::1]:2820', '2021-01-04 23:12:07');
INSERT INTO `admin_log` VALUES ('54', '1', 'root', '/admin', '[::1]:4202', '2021-01-05 16:12:16');
INSERT INTO `admin_log` VALUES ('55', '1', 'root', '/admin/welcome', '[::1]:4202', '2021-01-05 16:12:16');
INSERT INTO `admin_log` VALUES ('56', '1', 'root', '/admin', '[::1]:4202', '2021-01-05 16:12:24');
INSERT INTO `admin_log` VALUES ('57', '1', 'root', '/admin/welcome', '[::1]:4202', '2021-01-05 16:12:24');
INSERT INTO `admin_log` VALUES ('58', '1', 'root', '/admin', '[::1]:4202', '2021-01-05 16:12:39');
INSERT INTO `admin_log` VALUES ('59', '1', 'root', '/admin/welcome', '[::1]:4202', '2021-01-05 16:12:39');
INSERT INTO `admin_log` VALUES ('60', '1', 'root', '/admin', '[::1]:4202', '2021-01-05 16:13:20');
INSERT INTO `admin_log` VALUES ('61', '1', 'root', '/admin/welcome', '[::1]:4202', '2021-01-05 16:13:20');
INSERT INTO `admin_log` VALUES ('62', '1', 'root', '/admin/person', '[::1]:4202', '2021-01-05 16:13:29');
INSERT INTO `admin_log` VALUES ('63', '1', 'root', '/admin', '[::1]:4202', '2021-01-05 16:14:32');
INSERT INTO `admin_log` VALUES ('64', '1', 'root', '/admin/welcome', '[::1]:4202', '2021-01-05 16:14:32');
INSERT INTO `admin_log` VALUES ('65', '1', 'root', '/admin', '[::1]:4202', '2021-01-05 16:14:33');
INSERT INTO `admin_log` VALUES ('66', '1', 'root', '/admin/welcome', '[::1]:4202', '2021-01-05 16:14:33');
INSERT INTO `admin_log` VALUES ('67', '1', 'root', '/admin', '[::1]:4202', '2021-01-05 16:14:41');
INSERT INTO `admin_log` VALUES ('68', '1', 'root', '/admin/welcome', '[::1]:4202', '2021-01-05 16:14:41');
INSERT INTO `admin_log` VALUES ('69', '1', 'root', '/admin', '[::1]:4202', '2021-01-05 16:16:25');
INSERT INTO `admin_log` VALUES ('70', '1', 'root', '/admin/welcome', '[::1]:4202', '2021-01-05 16:16:25');
INSERT INTO `admin_log` VALUES ('71', '1', 'root', '/admin', '[::1]:4202', '2021-01-05 16:16:25');
INSERT INTO `admin_log` VALUES ('72', '1', 'root', '/admin/welcome', '[::1]:4202', '2021-01-05 16:16:25');
INSERT INTO `admin_log` VALUES ('73', '1', 'root', '/admin', '[::1]:4202', '2021-01-05 16:17:07');
INSERT INTO `admin_log` VALUES ('74', '1', 'root', '/admin/welcome', '[::1]:4202', '2021-01-05 16:17:07');
INSERT INTO `admin_log` VALUES ('75', '1', 'root', '/admin', '[::1]:7789', '2021-01-05 17:15:05');
INSERT INTO `admin_log` VALUES ('76', '1', 'root', '/admin/welcome', '[::1]:7789', '2021-01-05 17:15:05');
INSERT INTO `admin_log` VALUES ('77', '1', 'root', '/admin', '[::1]:7789', '2021-01-05 17:16:05');
INSERT INTO `admin_log` VALUES ('78', '1', 'root', '/admin/welcome', '[::1]:7789', '2021-01-05 17:16:05');
INSERT INTO `admin_log` VALUES ('79', '1', 'root', '/admin/log', '[::1]:7789', '2021-01-05 17:16:06');
INSERT INTO `admin_log` VALUES ('80', '1', 'root', '/admin', '[::1]:7789', '2021-01-05 17:17:09');
INSERT INTO `admin_log` VALUES ('81', '1', 'root', '/admin/welcome', '[::1]:7789', '2021-01-05 17:17:09');
INSERT INTO `admin_log` VALUES ('82', '1', 'root', '/admin/log', '[::1]:7789', '2021-01-05 17:17:09');
INSERT INTO `admin_log` VALUES ('83', '1', 'root', '/admin/log', '[::1]:7789', '2021-01-05 17:17:22');
INSERT INTO `admin_log` VALUES ('84', '1', 'root', '/admin', '[::1]:7789', '2021-01-05 17:17:25');
INSERT INTO `admin_log` VALUES ('85', '1', 'root', '/admin/welcome', '[::1]:7789', '2021-01-05 17:17:25');
INSERT INTO `admin_log` VALUES ('86', '1', 'root', '/admin/log', '[::1]:7789', '2021-01-05 17:17:25');
INSERT INTO `admin_log` VALUES ('87', '1', 'root', '/admin/log?keyword=welcome', '[::1]:7789', '2021-01-05 17:17:53');
INSERT INTO `admin_log` VALUES ('88', '1', 'root', '/admin/log?keyword=', '[::1]:7789', '2021-01-05 17:18:02');
INSERT INTO `admin_log` VALUES ('89', '1', 'root', '/admin', '[::1]:8035', '2021-01-05 17:20:04');
INSERT INTO `admin_log` VALUES ('90', '1', 'root', '/admin/welcome', '[::1]:8035', '2021-01-05 17:20:04');
INSERT INTO `admin_log` VALUES ('91', '1', 'root', '/admin/log', '[::1]:8035', '2021-01-05 17:20:04');
INSERT INTO `admin_log` VALUES ('92', '1', 'root', '/admin', '[::1]:8035', '2021-01-05 17:20:42');
INSERT INTO `admin_log` VALUES ('93', '1', 'root', '/admin/welcome', '[::1]:8035', '2021-01-05 17:20:42');
INSERT INTO `admin_log` VALUES ('94', '1', 'root', '/admin/log', '[::1]:8035', '2021-01-05 17:20:42');
INSERT INTO `admin_log` VALUES ('95', '1', 'root', '/admin/log?page=2', '[::1]:8035', '2021-01-05 17:20:43');
INSERT INTO `admin_log` VALUES ('96', '1', 'root', '/admin/log?page=3', '[::1]:8035', '2021-01-05 17:20:45');
INSERT INTO `admin_log` VALUES ('97', '1', 'root', '/admin/log?page=1', '[::1]:8035', '2021-01-05 17:20:46');
INSERT INTO `admin_log` VALUES ('98', '1', 'root', '/admin/log?page=2', '[::1]:8035', '2021-01-05 17:20:49');
INSERT INTO `admin_log` VALUES ('99', '1', 'root', '/admin/log?page=1', '[::1]:8035', '2021-01-05 17:20:50');
INSERT INTO `admin_log` VALUES ('100', '1', 'root', '/admin', '[::1]:8035', '2021-01-05 17:22:32');
INSERT INTO `admin_log` VALUES ('101', '1', 'root', '/admin/welcome', '[::1]:8035', '2021-01-05 17:22:32');
INSERT INTO `admin_log` VALUES ('102', '1', 'root', '/admin/log', '[::1]:8035', '2021-01-05 17:22:32');
INSERT INTO `admin_log` VALUES ('103', '1', 'root', '/admin/log', '[::1]:8035', '2021-01-05 17:22:38');
INSERT INTO `admin_log` VALUES ('104', '1', 'root', '/admin/log?page=11', '[::1]:8035', '2021-01-05 17:22:42');
INSERT INTO `admin_log` VALUES ('105', '1', 'root', '/admin/log?page=1', '[::1]:8035', '2021-01-05 17:22:44');
INSERT INTO `admin_log` VALUES ('106', '1', 'root', '/admin', '[::1]:8035', '2021-01-05 17:22:48');
INSERT INTO `admin_log` VALUES ('107', '1', 'root', '/admin/welcome', '[::1]:8035', '2021-01-05 17:22:48');
INSERT INTO `admin_log` VALUES ('108', '1', 'root', '/admin/log', '[::1]:8247', '2021-01-05 17:22:48');
INSERT INTO `admin_log` VALUES ('109', '1', 'root', '/admin', '[::1]:8247', '2021-01-05 17:22:49');
INSERT INTO `admin_log` VALUES ('110', '1', 'root', '/admin/welcome', '[::1]:8247', '2021-01-05 17:22:50');
INSERT INTO `admin_log` VALUES ('111', '1', 'root', '/admin/log', '[::1]:8247', '2021-01-05 17:22:50');
INSERT INTO `admin_log` VALUES ('112', '1', 'root', '/admin', '[::1]:8247', '2021-01-05 17:22:51');
INSERT INTO `admin_log` VALUES ('113', '1', 'root', '/admin/welcome', '[::1]:8247', '2021-01-05 17:22:51');
INSERT INTO `admin_log` VALUES ('114', '1', 'root', '/admin/log', '[::1]:8247', '2021-01-05 17:22:51');
INSERT INTO `admin_log` VALUES ('115', '1', 'root', '/admin', '[::1]:8247', '2021-01-05 17:22:52');
INSERT INTO `admin_log` VALUES ('116', '1', 'root', '/admin/welcome', '[::1]:8247', '2021-01-05 17:22:52');
INSERT INTO `admin_log` VALUES ('117', '1', 'root', '/admin/log', '[::1]:8247', '2021-01-05 17:22:53');
INSERT INTO `admin_log` VALUES ('118', '1', 'root', '/admin', '[::1]:8354', '2021-01-05 17:24:27');
INSERT INTO `admin_log` VALUES ('119', '1', 'root', '/admin/welcome', '[::1]:8354', '2021-01-05 17:24:27');
INSERT INTO `admin_log` VALUES ('120', '1', 'root', '/admin/log', '[::1]:8354', '2021-01-05 17:24:32');
INSERT INTO `admin_log` VALUES ('121', '1', 'root', '/admin', '[::1]:8354', '2021-01-05 17:24:34');
INSERT INTO `admin_log` VALUES ('122', '1', 'root', '/admin/welcome', '[::1]:8354', '2021-01-05 17:24:34');
INSERT INTO `admin_log` VALUES ('123', '1', 'root', '/admin/log', '[::1]:8354', '2021-01-05 17:24:34');
INSERT INTO `admin_log` VALUES ('124', '1', 'root', '/admin', '[::1]:8354', '2021-01-05 17:24:36');
INSERT INTO `admin_log` VALUES ('125', '1', 'root', '/admin/welcome', '[::1]:8354', '2021-01-05 17:24:36');
INSERT INTO `admin_log` VALUES ('126', '1', 'root', '/admin/log', '[::1]:8354', '2021-01-05 17:24:36');
INSERT INTO `admin_log` VALUES ('127', '1', 'root', '/admin/log?page=5', '[::1]:9617', '2021-01-05 17:56:50');
INSERT INTO `admin_log` VALUES ('128', '1', 'root', '/admin/log?page=1', '[::1]:9617', '2021-01-05 17:56:52');
INSERT INTO `admin_log` VALUES ('129', '1', 'root', '/admin/person', '[::1]:9617', '2021-01-05 17:58:58');
INSERT INTO `admin_log` VALUES ('130', '1', 'root', '/admin/', '[::1]:9617', '2021-01-05 17:59:44');
INSERT INTO `admin_log` VALUES ('131', '1', 'root', '/admin/', '[::1]:9617', '2021-01-05 17:59:48');
INSERT INTO `admin_log` VALUES ('132', '1', 'root', '/admin/welcome/', '[::1]:9617', '2021-01-05 18:00:30');
INSERT INTO `admin_log` VALUES ('133', '0', '', '/admin/dologin', '[::1]:10482', '2021-01-05 18:15:13');
INSERT INTO `admin_log` VALUES ('134', '0', '', '/admin/dologin', '[::1]:10482', '2021-01-05 18:15:23');
INSERT INTO `admin_log` VALUES ('135', '1', 'root', '/admin/person', '[::1]:10482', '2021-01-05 18:16:06');
INSERT INTO `admin_log` VALUES ('136', '1', 'root', '/admin/logout', '[::1]:10482', '2021-01-05 18:16:31');
INSERT INTO `admin_log` VALUES ('137', '0', '', '/admin/dologin', '[::1]:11496', '2021-01-05 18:35:39');
INSERT INTO `admin_log` VALUES ('138', '1', 'root', '/admin/logout', '[::1]:11496', '2021-01-05 18:37:49');
INSERT INTO `admin_log` VALUES ('139', '0', '', '/admin/dologin', '[::1]:11496', '2021-01-05 18:37:56');
INSERT INTO `admin_log` VALUES ('140', '1', 'root', '/admin/logout', '[::1]:11496', '2021-01-05 18:38:19');
INSERT INTO `admin_log` VALUES ('141', '0', '', '/admin/dologin', '[::1]:11496', '2021-01-05 18:38:25');
INSERT INTO `admin_log` VALUES ('142', '1', 'root', '/admin/logout', '[::1]:11496', '2021-01-05 18:39:08');
INSERT INTO `admin_log` VALUES ('143', '0', '', '/admin/dologin', '[::1]:11496', '2021-01-05 18:39:13');
INSERT INTO `admin_log` VALUES ('144', '1', 'root', '/admin/logout', '[::1]:11496', '2021-01-05 18:39:24');
INSERT INTO `admin_log` VALUES ('145', '0', '', '/admin/dologin', '[::1]:11496', '2021-01-05 18:39:30');
INSERT INTO `admin_log` VALUES ('146', '1', 'root', '/admin/logout', '[::1]:11496', '2021-01-05 18:39:58');
INSERT INTO `admin_log` VALUES ('147', '0', '', '/admin/dologin', '[::1]:11496', '2021-01-05 18:40:03');
INSERT INTO `admin_log` VALUES ('148', '1', 'root', '/admin/logout', '[::1]:11496', '2021-01-05 18:40:47');
INSERT INTO `admin_log` VALUES ('149', '0', '', '/admin/dologin', '[::1]:11496', '2021-01-05 18:40:53');
INSERT INTO `admin_log` VALUES ('150', '1', 'root', '/admin/logout', '[::1]:11496', '2021-01-05 18:41:07');
INSERT INTO `admin_log` VALUES ('151', '0', '', '/admin/dologin', '[::1]:11496', '2021-01-05 18:41:11');
INSERT INTO `admin_log` VALUES ('152', '1', 'root', '/admin/logout', '[::1]:11839', '2021-01-05 18:41:27');
INSERT INTO `admin_log` VALUES ('153', '0', '', '/admin/dologin', '[::1]:11839', '2021-01-05 18:41:33');
INSERT INTO `admin_log` VALUES ('154', '1', 'root', '/admin/logout', '[::1]:11831', '2021-01-05 18:44:15');
INSERT INTO `admin_log` VALUES ('155', '0', '', '/admin/dologin', '[::1]:11831', '2021-01-05 18:44:20');
INSERT INTO `admin_log` VALUES ('156', '0', '', '/admin/dologin', '[::1]:12409', '2021-01-05 18:52:43');
INSERT INTO `admin_log` VALUES ('157', '0', '', '/admin/dologin', '[::1]:8314', '2021-01-05 20:40:35');
INSERT INTO `admin_log` VALUES ('158', '1', 'root', '/admin/person', '[::1]:8314', '2021-01-05 20:40:38');
INSERT INTO `admin_log` VALUES ('159', '1', 'root', '/admin/person', '[::1]:8314', '2021-01-05 20:40:47');
INSERT INTO `admin_log` VALUES ('160', '1', 'root', '/admin/person', '[::1]:8314', '2021-01-05 20:41:01');
INSERT INTO `admin_log` VALUES ('161', '1', 'root', '/admin/person', '[::1]:8314', '2021-01-05 20:41:23');
INSERT INTO `admin_log` VALUES ('162', '1', 'root', '/admin/person', '[::1]:8314', '2021-01-05 20:44:12');
INSERT INTO `admin_log` VALUES ('163', '0', '', '/admin/person', '[::1]:3253', '2021-01-05 20:50:13');
INSERT INTO `admin_log` VALUES ('164', '0', '', '/admin/person', '[::1]:3253', '2021-01-05 20:50:29');
INSERT INTO `admin_log` VALUES ('165', '1', 'root', '/admin/person', '[::1]:3253', '2021-01-05 20:50:54');
INSERT INTO `admin_log` VALUES ('166', '1', 'root', '/admin/person', '[::1]:3253', '2021-01-05 20:51:02');
INSERT INTO `admin_log` VALUES ('167', '0', '', '/admin/dologin', '[::1]:14878', '2021-01-05 21:13:09');
INSERT INTO `admin_log` VALUES ('168', '1', 'root', '/admin/administrator', '[::1]:14878', '2021-01-05 21:13:11');
INSERT INTO `admin_log` VALUES ('169', '1', 'root', '/admin/administrator/create', '[::1]:14878', '2021-01-05 21:13:20');
INSERT INTO `admin_log` VALUES ('170', '1', 'root', '/admin/administrator/edit/1', '[::1]:14878', '2021-01-05 21:13:25');
INSERT INTO `admin_log` VALUES ('171', '1', 'root', '/admin/administrator?username=abc', '[::1]:14878', '2021-01-05 21:13:41');
INSERT INTO `admin_log` VALUES ('172', '1', 'root', '/admin/administrator?username=root', '[::1]:14878', '2021-01-05 21:13:45');
INSERT INTO `admin_log` VALUES ('173', '0', '', '/admin/administrator/update_status', '[::1]:6201', '2021-01-05 21:38:04');
INSERT INTO `admin_log` VALUES ('174', '0', '', '/admin/administrator/update_status', '[::1]:6201', '2021-01-05 21:39:06');
INSERT INTO `admin_log` VALUES ('175', '0', '', '/admin/administrator/update_status', '[::1]:6201', '2021-01-05 21:39:35');
INSERT INTO `admin_log` VALUES ('176', '0', '', '/admin/administrator/update_status', '[::1]:6201', '2021-01-05 21:39:37');
INSERT INTO `admin_log` VALUES ('177', '0', '', '/admin/administrator/update_status', '[::1]:6499', '2021-01-05 21:41:46');
INSERT INTO `admin_log` VALUES ('178', '0', '', '/admin/administrator/update_status', '[::1]:6499', '2021-01-05 21:41:52');
INSERT INTO `admin_log` VALUES ('179', '0', '', '/admin/administrator/destroy', '[::1]:6630', '2021-01-05 21:42:55');
INSERT INTO `admin_log` VALUES ('180', '0', '', '/admin/administrator/destroy/2', '[::1]:6630', '2021-01-05 21:43:32');
INSERT INTO `admin_log` VALUES ('181', '0', '', '/admin/administrator/destroy/2', '[::1]:6630', '2021-01-05 21:43:42');
INSERT INTO `admin_log` VALUES ('182', '0', '', '/admin/administrator/update_status/2', '[::1]:6851', '2021-01-05 21:46:05');
INSERT INTO `admin_log` VALUES ('183', '0', '', '/admin/administrator/update_status/1', '[::1]:6851', '2021-01-05 21:46:09');
INSERT INTO `admin_log` VALUES ('184', '0', '', '/admin/administrator/update_status/1', '[::1]:6851', '2021-01-05 21:46:36');
INSERT INTO `admin_log` VALUES ('185', '0', '', '/admin/administrator/update_status/3', '[::1]:6851', '2021-01-05 21:47:48');
INSERT INTO `admin_log` VALUES ('186', '0', '', '/admin/administrator/update_status', '[::1]:7035', '2021-01-05 21:49:03');
INSERT INTO `admin_log` VALUES ('187', '0', '', '/admin/administrator/update_status', '[::1]:7035', '2021-01-05 21:49:09');
INSERT INTO `admin_log` VALUES ('188', '0', '', '/admin/administrator/update_status', '[::1]:7035', '2021-01-05 21:49:12');
INSERT INTO `admin_log` VALUES ('189', '0', '', '/admin/administrator/update_status/1', '[::1]:7110', '2021-01-05 21:50:38');
INSERT INTO `admin_log` VALUES ('190', '0', '', '/admin/administrator/update_status/1', '[::1]:7110', '2021-01-05 21:50:39');
INSERT INTO `admin_log` VALUES ('191', '0', '', '/admin/administrator/update_status/1', '[::1]:7206', '2021-01-05 21:52:06');
INSERT INTO `admin_log` VALUES ('192', '0', '', '/admin/administrator/update_status/1', '[::1]:11810', '2021-01-05 21:53:21');
INSERT INTO `admin_log` VALUES ('193', '0', '', '/admin/administrator/update_status/3', '[::1]:11810', '2021-01-05 21:53:28');
INSERT INTO `admin_log` VALUES ('194', '0', '', '/admin/administrator/update_status/3', '[::1]:11810', '2021-01-05 21:53:39');
INSERT INTO `admin_log` VALUES ('195', '0', '', '/admin/administrator/update_status/2', '[::1]:11810', '2021-01-05 21:53:44');
INSERT INTO `admin_log` VALUES ('196', '0', '', '/admin/dologin', '[::1]:12622', '2021-01-05 22:03:35');
INSERT INTO `admin_log` VALUES ('197', '1', 'root', '/admin/administrator', '[::1]:12622', '2021-01-05 22:03:35');
INSERT INTO `admin_log` VALUES ('198', '1', 'root', '/admin/administrator/update_status/3', '[::1]:12622', '2021-01-05 22:03:44');
INSERT INTO `admin_log` VALUES ('199', '1', 'root', '/admin/administrator/update_status/3', '[::1]:12622', '2021-01-05 22:03:50');
INSERT INTO `admin_log` VALUES ('200', '1', 'root', '/admin/administrator/destroy/3', '[::1]:12622', '2021-01-05 22:04:04');
INSERT INTO `admin_log` VALUES ('201', '1', 'root', '/admin/administrator/edit/1', '[::1]:12622', '2021-01-05 22:04:16');
INSERT INTO `admin_log` VALUES ('202', '1', 'root', '/admin/administrator/create', '[::1]:12622', '2021-01-05 22:04:18');
INSERT INTO `admin_log` VALUES ('203', '0', '', '/admin/dologin', '[::1]:12449', '2021-01-06 00:30:51');
INSERT INTO `admin_log` VALUES ('204', '1', 'root', '/admin/administrator', '[::1]:12449', '2021-01-06 00:30:52');
INSERT INTO `admin_log` VALUES ('205', '1', 'root', '/admin/administrator/add_page', '[::1]:12449', '2021-01-06 00:30:55');
INSERT INTO `admin_log` VALUES ('206', '1', 'root', '/admin/administrator/add', '[::1]:12449', '2021-01-06 00:31:33');
INSERT INTO `admin_log` VALUES ('207', '1', 'root', '/admin/administrator/add', '[::1]:12449', '2021-01-06 00:31:38');
INSERT INTO `admin_log` VALUES ('208', '1', 'root', '/admin/administrator', '[::1]:12449', '2021-01-06 00:31:40');
INSERT INTO `admin_log` VALUES ('209', '1', 'root', '/admin/administrator/edit/4', '[::1]:12449', '2021-01-06 00:32:02');
INSERT INTO `admin_log` VALUES ('210', '1', 'root', '/admin/administrator/update_status/4', '[::1]:12449', '2021-01-06 00:32:19');
INSERT INTO `admin_log` VALUES ('211', '1', 'root', '/admin/administrator/update_status/4', '[::1]:12449', '2021-01-06 00:32:33');
INSERT INTO `admin_log` VALUES ('212', '0', '', '/admin/dologin', '[::1]:4153', '2021-01-06 22:04:20');
INSERT INTO `admin_log` VALUES ('213', '1', 'root', '/admin/administrator', '[::1]:4172', '2021-01-06 22:04:20');
INSERT INTO `admin_log` VALUES ('214', '1', 'root', '/admin/administrator/edit/4', '[::1]:4171', '2021-01-06 22:04:28');
INSERT INTO `admin_log` VALUES ('215', '1', 'root', '/admin/administrator', '[::1]:4152', '2021-01-06 22:05:24');
INSERT INTO `admin_log` VALUES ('216', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:4152', '2021-01-06 22:05:25');
INSERT INTO `admin_log` VALUES ('217', '1', 'root', '/admin/administrator/edit_page/1', '[::1]:4152', '2021-01-06 22:05:34');
INSERT INTO `admin_log` VALUES ('218', '1', 'root', '/admin/administrator/add_page', '[::1]:4152', '2021-01-06 22:05:49');
INSERT INTO `admin_log` VALUES ('219', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:4152', '2021-01-06 22:06:04');
INSERT INTO `admin_log` VALUES ('220', '1', 'root', '/admin/administrator/add_page', '[::1]:4152', '2021-01-06 22:06:09');
INSERT INTO `admin_log` VALUES ('221', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:4152', '2021-01-06 22:06:15');
INSERT INTO `admin_log` VALUES ('222', '1', 'root', '/admin/administrator', '[::1]:4152', '2021-01-06 22:06:52');
INSERT INTO `admin_log` VALUES ('223', '1', 'root', '/admin/administrator/add_page', '[::1]:4152', '2021-01-06 22:06:53');
INSERT INTO `admin_log` VALUES ('224', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:4152', '2021-01-06 22:06:56');
INSERT INTO `admin_log` VALUES ('225', '1', 'root', '/admin/administrator/update/4', '[::1]:4152', '2021-01-06 22:07:01');
INSERT INTO `admin_log` VALUES ('226', '1', 'root', '/admin/administrator/update/4', '[::1]:4152', '2021-01-06 22:07:10');
INSERT INTO `admin_log` VALUES ('227', '1', 'root', '/admin/administrator', '[::1]:4152', '2021-01-06 22:07:12');
INSERT INTO `admin_log` VALUES ('228', '1', 'root', '/admin/administrator/update_status/4', '[::1]:4152', '2021-01-06 22:07:26');
INSERT INTO `admin_log` VALUES ('229', '1', 'root', '/admin/administrator/update_status/4', '[::1]:4152', '2021-01-06 22:07:33');
INSERT INTO `admin_log` VALUES ('230', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:4152', '2021-01-06 22:07:37');
INSERT INTO `admin_log` VALUES ('231', '1', 'root', '/admin/administrator/edit_page/1', '[::1]:4152', '2021-01-06 22:07:41');
INSERT INTO `admin_log` VALUES ('232', '1', 'root', '/admin/administrator', '[::1]:4152', '2021-01-06 22:09:42');
INSERT INTO `admin_log` VALUES ('233', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:4152', '2021-01-06 22:09:45');
INSERT INTO `admin_log` VALUES ('234', '1', 'root', '/admin/administrator/update/4', '[::1]:4152', '2021-01-06 22:09:47');
INSERT INTO `admin_log` VALUES ('235', '1', 'root', '/admin/administrator', '[::1]:4152', '2021-01-06 22:09:48');
INSERT INTO `admin_log` VALUES ('236', '1', 'root', '/admin/administrator/add_page', '[::1]:4152', '2021-01-06 22:10:11');
INSERT INTO `admin_log` VALUES ('237', '1', 'root', '/admin/administrator', '[::1]:4152', '2021-01-06 22:11:03');
INSERT INTO `admin_log` VALUES ('238', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:4152', '2021-01-06 22:11:04');
INSERT INTO `admin_log` VALUES ('239', '1', 'root', '/admin/administrator/edit_page/1', '[::1]:4152', '2021-01-06 22:11:06');
INSERT INTO `admin_log` VALUES ('240', '1', 'root', '/admin/administrator/add_page', '[::1]:4152', '2021-01-06 22:12:02');
INSERT INTO `admin_log` VALUES ('241', '1', 'root', '/admin/administrator/add', '[::1]:4152', '2021-01-06 22:12:28');
INSERT INTO `admin_log` VALUES ('242', '1', 'root', '/admin/administrator/add', '[::1]:4152', '2021-01-06 22:12:45');
INSERT INTO `admin_log` VALUES ('243', '1', 'root', '/admin/administrator/add', '[::1]:4152', '2021-01-06 22:12:51');
INSERT INTO `admin_log` VALUES ('244', '1', 'root', '/admin/administrator/add', '[::1]:4152', '2021-01-06 22:12:58');
INSERT INTO `admin_log` VALUES ('245', '1', 'root', '/admin/administrator/add', '[::1]:4152', '2021-01-06 22:13:33');
INSERT INTO `admin_log` VALUES ('246', '1', 'root', '/admin/administrator', '[::1]:4152', '2021-01-06 22:13:34');
INSERT INTO `admin_log` VALUES ('247', '1', 'root', '/admin/person', '[::1]:4152', '2021-01-06 22:13:45');
INSERT INTO `admin_log` VALUES ('248', '1', 'root', '/admin/administrator/edit_page/5', '[::1]:4152', '2021-01-06 22:14:22');
INSERT INTO `admin_log` VALUES ('249', '1', 'root', '/admin/administrator/update/5', '[::1]:4152', '2021-01-06 22:14:27');
INSERT INTO `admin_log` VALUES ('250', '1', 'root', '/admin/administrator/update/5', '[::1]:4152', '2021-01-06 22:15:04');
INSERT INTO `admin_log` VALUES ('251', '1', 'root', '/admin/administrator/update/5', '[::1]:4152', '2021-01-06 22:16:33');
INSERT INTO `admin_log` VALUES ('252', '1', 'root', '/admin/administrator', '[::1]:4152', '2021-01-06 22:16:34');
INSERT INTO `admin_log` VALUES ('253', '1', 'root', '/admin/administrator/edit_page/5', '[::1]:4152', '2021-01-06 22:16:54');
INSERT INTO `admin_log` VALUES ('254', '1', 'root', '/admin/administrator/update/5', '[::1]:4152', '2021-01-06 22:17:57');
INSERT INTO `admin_log` VALUES ('255', '1', 'root', '/admin/administrator/update/5', '[::1]:4152', '2021-01-06 22:18:02');
INSERT INTO `admin_log` VALUES ('256', '1', 'root', '/admin/administrator/update/5', '[::1]:4152', '2021-01-06 22:18:20');
INSERT INTO `admin_log` VALUES ('257', '1', 'root', '/admin/administrator/update/5', '[::1]:4152', '2021-01-06 22:18:26');
INSERT INTO `admin_log` VALUES ('258', '1', 'root', '/admin/administrator/update/5', '[::1]:4152', '2021-01-06 22:18:42');
INSERT INTO `admin_log` VALUES ('259', '1', 'root', '/admin/administrator', '[::1]:4152', '2021-01-06 22:18:46');
INSERT INTO `admin_log` VALUES ('260', '0', '', '/admin/dologin', '[::1]:4934', '2021-01-06 22:22:07');
INSERT INTO `admin_log` VALUES ('261', '1', 'root', '/admin/administrator', '[::1]:4934', '2021-01-06 22:22:07');
INSERT INTO `admin_log` VALUES ('262', '1', 'root', '/admin/administrator/edit_page/5', '[::1]:4935', '2021-01-06 22:22:16');
INSERT INTO `admin_log` VALUES ('263', '1', 'root', '/admin/administrator/update/5', '[::1]:4935', '2021-01-06 22:22:18');
INSERT INTO `admin_log` VALUES ('264', '1', 'root', '/admin/administrator/update/5', '[::1]:4935', '2021-01-06 22:22:29');
INSERT INTO `admin_log` VALUES ('265', '1', 'root', '/admin/administrator/update/5', '[::1]:4935', '2021-01-06 22:22:33');
INSERT INTO `admin_log` VALUES ('266', '1', 'root', '/admin/administrator', '[::1]:4935', '2021-01-06 22:22:35');
INSERT INTO `admin_log` VALUES ('267', '1', 'root', '/admin/administrator/add_page', '[::1]:4935', '2021-01-06 22:22:37');
INSERT INTO `admin_log` VALUES ('268', '1', 'root', '/admin/administrator/add', '[::1]:4935', '2021-01-06 22:22:51');
INSERT INTO `admin_log` VALUES ('269', '1', 'root', '/admin/administrator', '[::1]:4935', '2021-01-06 22:23:20');
INSERT INTO `admin_log` VALUES ('270', '1', 'root', '/admin/administrator/add_page', '[::1]:4935', '2021-01-06 22:23:23');
INSERT INTO `admin_log` VALUES ('271', '1', 'root', '/admin/person', '[::1]:4935', '2021-01-06 22:23:41');
INSERT INTO `admin_log` VALUES ('272', '1', 'root', '/admin/administrator/add_page', '[::1]:4935', '2021-01-06 22:23:49');
INSERT INTO `admin_log` VALUES ('273', '1', 'root', '/admin/administrator/edit_page/5', '[::1]:4935', '2021-01-06 22:23:54');
INSERT INTO `admin_log` VALUES ('274', '1', 'root', '/admin/administrator/edit_page/5', '[::1]:4935', '2021-01-06 22:24:27');
INSERT INTO `admin_log` VALUES ('275', '1', 'root', '/admin/person', '[::1]:4935', '2021-01-06 22:24:33');
INSERT INTO `admin_log` VALUES ('276', '1', 'root', '/admin/administrator/edit_page/5', '[::1]:4935', '2021-01-06 22:24:39');
INSERT INTO `admin_log` VALUES ('277', '1', 'root', '/admin/person', '[::1]:4935', '2021-01-06 22:24:45');
INSERT INTO `admin_log` VALUES ('278', '1', 'root', '/admin/administrator/edit_page/5', '[::1]:4935', '2021-01-06 22:25:03');
INSERT INTO `admin_log` VALUES ('279', '1', 'root', '/admin/person', '[::1]:4935', '2021-01-06 22:25:37');
INSERT INTO `admin_log` VALUES ('280', '1', 'root', '/admin/administrator/edit_page/5', '[::1]:4935', '2021-01-06 22:25:44');
INSERT INTO `admin_log` VALUES ('281', '1', 'root', '/admin/person', '[::1]:4935', '2021-01-06 22:26:36');
INSERT INTO `admin_log` VALUES ('282', '1', 'root', '/admin/administrator', '[::1]:4935', '2021-01-06 22:27:47');
INSERT INTO `admin_log` VALUES ('283', '1', 'root', '/admin/person', '[::1]:4935', '2021-01-06 22:27:49');
INSERT INTO `admin_log` VALUES ('284', '1', 'root', '/admin/person', '[::1]:4935', '2021-01-06 22:27:54');
INSERT INTO `admin_log` VALUES ('285', '1', 'root', '/admin/administrator', '[::1]:4935', '2021-01-06 22:27:56');
INSERT INTO `admin_log` VALUES ('286', '1', 'root', '/admin/administrator/edit_page/5', '[::1]:4935', '2021-01-06 22:27:58');
INSERT INTO `admin_log` VALUES ('287', '1', 'root', '/admin/administrator/update/5', '[::1]:4935', '2021-01-06 22:28:01');
INSERT INTO `admin_log` VALUES ('288', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:4935', '2021-01-06 22:29:05');
INSERT INTO `admin_log` VALUES ('289', '1', 'root', '/admin/administrator', '[::1]:4935', '2021-01-06 22:29:11');
INSERT INTO `admin_log` VALUES ('290', '1', 'root', '/admin/person', '[::1]:4935', '2021-01-06 22:29:25');
INSERT INTO `admin_log` VALUES ('291', '1', 'root', '/admin/person', '[::1]:4935', '2021-01-06 22:29:53');
INSERT INTO `admin_log` VALUES ('292', '1', 'root', '/admin/administrator', '[::1]:4935', '2021-01-06 22:29:54');
INSERT INTO `admin_log` VALUES ('293', '1', 'root', '/admin/administrator/edit_page/1', '[::1]:4935', '2021-01-06 22:29:56');
INSERT INTO `admin_log` VALUES ('294', '1', 'root', '/admin/administrator/edit_page/5', '[::1]:4935', '2021-01-06 22:30:24');
INSERT INTO `admin_log` VALUES ('295', '1', 'root', '/admin/administrator/add_page', '[::1]:4935', '2021-01-06 22:30:35');
INSERT INTO `admin_log` VALUES ('296', '1', 'root', '/admin/administrator', '[::1]:4935', '2021-01-06 22:33:03');
INSERT INTO `admin_log` VALUES ('297', '1', 'root', '/admin/administrator', '[::1]:4935', '2021-01-06 22:33:54');
INSERT INTO `admin_log` VALUES ('298', '1', 'root', '/admin/logout', '[::1]:4935', '2021-01-06 22:33:58');
INSERT INTO `admin_log` VALUES ('299', '0', '', '/admin/dologin', '[::1]:4935', '2021-01-06 22:34:04');
INSERT INTO `admin_log` VALUES ('300', '0', '', '/admin/dologin', '[::1]:4935', '2021-01-06 22:34:08');
INSERT INTO `admin_log` VALUES ('301', '0', '', '/admin/dologin', '[::1]:4935', '2021-01-06 22:34:32');
INSERT INTO `admin_log` VALUES ('302', '1', 'root', '/admin/administrator', '[::1]:4935', '2021-01-06 22:34:32');
INSERT INTO `admin_log` VALUES ('303', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:4935', '2021-01-06 22:34:38');
INSERT INTO `admin_log` VALUES ('304', '1', 'root', '/admin/administrator/update/4', '[::1]:4935', '2021-01-06 22:34:47');
INSERT INTO `admin_log` VALUES ('305', '1', 'root', '/admin/administrator/update/4', '[::1]:4935', '2021-01-06 22:34:51');
INSERT INTO `admin_log` VALUES ('306', '1', 'root', '/admin/administrator', '[::1]:4935', '2021-01-06 22:34:52');
INSERT INTO `admin_log` VALUES ('307', '1', 'root', '/admin/logout', '[::1]:4935', '2021-01-06 22:34:55');
INSERT INTO `admin_log` VALUES ('308', '0', '', '/admin/dologin', '[::1]:4935', '2021-01-06 22:35:00');
INSERT INTO `admin_log` VALUES ('309', '4', 'xmzd', '/admin/administrator', '[::1]:4935', '2021-01-06 22:35:01');
INSERT INTO `admin_log` VALUES ('310', '4', 'xmzd', '/admin/administrator', '[::1]:4935', '2021-01-06 22:35:11');
INSERT INTO `admin_log` VALUES ('311', '4', 'xmzd', '/admin/administrator/update_status/4', '[::1]:4935', '2021-01-06 22:35:21');
INSERT INTO `admin_log` VALUES ('312', '4', 'xmzd', '/admin/logout', '[::1]:4935', '2021-01-06 22:35:23');
INSERT INTO `admin_log` VALUES ('313', '0', '', '/admin/dologin', '[::1]:4935', '2021-01-06 22:35:29');
INSERT INTO `admin_log` VALUES ('314', '0', '', '/admin/dologin', '[::1]:4935', '2021-01-06 22:35:34');
INSERT INTO `admin_log` VALUES ('315', '0', '', '/admin/dologin', '[::1]:4935', '2021-01-06 22:35:39');
INSERT INTO `admin_log` VALUES ('316', '5', 'xmzz', '/admin/administrator', '[::1]:4935', '2021-01-06 22:35:39');
INSERT INTO `admin_log` VALUES ('317', '5', 'xmzz', '/admin/administrator/update_status/4', '[::1]:4935', '2021-01-06 22:35:43');
INSERT INTO `admin_log` VALUES ('318', '5', 'xmzz', '/admin/administrator/edit_page/5', '[::1]:4935', '2021-01-06 22:35:46');
INSERT INTO `admin_log` VALUES ('319', '0', '', '/admin/dologin', '127.0.0.1:11212', '2021-01-06 22:46:12');
INSERT INTO `admin_log` VALUES ('320', '0', '', '/admin/dologin', '127.0.0.1:11212', '2021-01-06 22:46:14');
INSERT INTO `admin_log` VALUES ('321', '5', 'xmzz', '/admin/administrator', '127.0.0.1:11212', '2021-01-06 22:46:15');
INSERT INTO `admin_log` VALUES ('322', '5', 'xmzz', '/admin/person', '127.0.0.1:11212', '2021-01-06 22:46:17');
INSERT INTO `admin_log` VALUES ('323', '5', 'xmzz', '/admin/administrator/edit_page/5', '127.0.0.1:11212', '2021-01-06 22:46:35');
INSERT INTO `admin_log` VALUES ('324', '5', 'xmzz', '/admin/administrator/update/5', '127.0.0.1:11212', '2021-01-06 22:46:41');
INSERT INTO `admin_log` VALUES ('325', '5', 'xmzz', '/admin/administrator/update/5', '127.0.0.1:11212', '2021-01-06 22:46:50');
INSERT INTO `admin_log` VALUES ('326', '5', 'xmzz', '/admin/administrator', '127.0.0.1:11212', '2021-01-06 22:46:51');
INSERT INTO `admin_log` VALUES ('327', '5', 'xmzz', '/admin/person', '127.0.0.1:11212', '2021-01-06 22:46:57');
INSERT INTO `admin_log` VALUES ('328', '5', 'xmzz', '/admin/administrator', '127.0.0.1:11212', '2021-01-06 22:47:01');
INSERT INTO `admin_log` VALUES ('329', '5', 'xmzz', '/admin/person', '127.0.0.1:11212', '2021-01-06 22:47:40');
INSERT INTO `admin_log` VALUES ('330', '5', 'xmzz', '/admin/person', '127.0.0.1:11212', '2021-01-06 22:47:49');
INSERT INTO `admin_log` VALUES ('331', '0', '', '/admin/dologin', '[::1]:13008', '2021-01-06 23:13:14');
INSERT INTO `admin_log` VALUES ('332', '1', 'root', '/admin/administrator', '[::1]:13008', '2021-01-06 23:13:16');
INSERT INTO `admin_log` VALUES ('333', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:13008', '2021-01-06 23:13:29');
INSERT INTO `admin_log` VALUES ('334', '1', 'root', '/admin/administrator/add_page', '[::1]:13008', '2021-01-06 23:13:32');
INSERT INTO `admin_log` VALUES ('335', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:13008', '2021-01-06 23:13:51');
INSERT INTO `admin_log` VALUES ('336', '1', 'root', '/admin/person', '[::1]:13008', '2021-01-06 23:14:03');
INSERT INTO `admin_log` VALUES ('337', '1', 'root', '/admin/administrator', '[::1]:13008', '2021-01-06 23:17:37');
INSERT INTO `admin_log` VALUES ('338', '1', 'root', '/admin/administrator', '[::1]:13008', '2021-01-06 23:18:46');
INSERT INTO `admin_log` VALUES ('339', '1', 'root', '/admin/administrator/edit_page/1', '[::1]:13008', '2021-01-06 23:18:48');
INSERT INTO `admin_log` VALUES ('340', '1', 'root', '/admin/administrator', '[::1]:13384', '2021-01-06 23:19:27');
INSERT INTO `admin_log` VALUES ('341', '1', 'root', '/admin/administrator', '[::1]:13384', '2021-01-06 23:19:48');
INSERT INTO `admin_log` VALUES ('342', '1', 'root', '/admin/administrator/destroy/1', '[::1]:13384', '2021-01-06 23:19:52');
INSERT INTO `admin_log` VALUES ('343', '1', 'root', '/admin/administrator/destroy/1', '[::1]:13384', '2021-01-06 23:19:58');
INSERT INTO `admin_log` VALUES ('344', '1', 'root', '/admin/administrator', '[::1]:13384', '2021-01-06 23:20:13');
INSERT INTO `admin_log` VALUES ('345', '1', 'root', '/admin/administrator/destroy/5', '[::1]:13384', '2021-01-06 23:20:19');
INSERT INTO `admin_log` VALUES ('346', '1', 'root', '/admin/administrator/add_page', '[::1]:13384', '2021-01-06 23:20:23');
INSERT INTO `admin_log` VALUES ('347', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:13384', '2021-01-06 23:20:27');
INSERT INTO `admin_log` VALUES ('348', '1', 'root', '/admin/administrator/add_page', '[::1]:13384', '2021-01-06 23:20:33');
INSERT INTO `admin_log` VALUES ('349', '1', 'root', '/admin/administrator/add', '[::1]:13384', '2021-01-06 23:20:48');
INSERT INTO `admin_log` VALUES ('350', '1', 'root', '/admin/administrator', '[::1]:13384', '2021-01-06 23:20:50');
INSERT INTO `admin_log` VALUES ('351', '1', 'root', '/admin/administrator/edit_page/6', '[::1]:13384', '2021-01-06 23:20:57');
INSERT INTO `admin_log` VALUES ('352', '0', '', '/admin/dologin', '[::1]:10354', '2021-01-06 23:37:13');
INSERT INTO `admin_log` VALUES ('353', '1', 'root', '/admin/administrator', '[::1]:10354', '2021-01-06 23:37:13');
INSERT INTO `admin_log` VALUES ('354', '1', 'root', '/admin/administrator?username=pku', '[::1]:10354', '2021-01-06 23:37:18');
INSERT INTO `admin_log` VALUES ('355', '1', 'root', '/admin/administrator?username=', '[::1]:10354', '2021-01-06 23:37:20');
INSERT INTO `admin_log` VALUES ('356', '0', '', '/admin/dologin', '[::1]:12733', '2021-01-07 01:03:41');
INSERT INTO `admin_log` VALUES ('357', '1', 'root', '/admin/administrator', '[::1]:12733', '2021-01-07 01:03:42');
INSERT INTO `admin_log` VALUES ('358', '1', 'root', '/admin/log?page=3', '[::1]:12733', '2021-01-07 01:05:09');
INSERT INTO `admin_log` VALUES ('359', '1', 'root', '/admin/log?page=1', '[::1]:12733', '2021-01-07 01:05:10');
INSERT INTO `admin_log` VALUES ('360', '1', 'root', '/admin/log?keyword=xmz', '[::1]:12733', '2021-01-07 01:06:24');
INSERT INTO `admin_log` VALUES ('361', '0', '', '/admin/dologin', '[::1]:13390', '2021-01-07 01:12:16');
INSERT INTO `admin_log` VALUES ('362', '1', 'root', '/admin/log', '[::1]:13390', '2021-01-07 01:12:16');
INSERT INTO `admin_log` VALUES ('363', '1', 'root', '/admin/log', '[::1]:13390', '2021-01-07 01:13:58');
INSERT INTO `admin_log` VALUES ('364', '0', '', '/admin/dologin', '[::1]:13621', '2021-01-07 01:15:06');
INSERT INTO `admin_log` VALUES ('365', '1', 'root', '/admin/dsadasds', '[::1]:13621', '2021-01-07 01:16:21');
INSERT INTO `admin_log` VALUES ('366', '0', '', '/admin/dologin', '[::1]:7379', '2021-01-07 23:04:00');
INSERT INTO `admin_log` VALUES ('367', '1', 'root', '/admin/log', '[::1]:7379', '2021-01-07 23:04:01');
INSERT INTO `admin_log` VALUES ('368', '1', 'root', '/admin/administrator', '[::1]:7379', '2021-01-07 23:04:04');
INSERT INTO `admin_log` VALUES ('369', '1', 'root', '/admin/administrator', '[::1]:7379', '2021-01-07 23:04:51');
INSERT INTO `admin_log` VALUES ('370', '1', 'root', '/admin/administrator', '[::1]:7379', '2021-01-07 23:05:11');
INSERT INTO `admin_log` VALUES ('371', '1', 'root', '/admin/logout', '[::1]:7379', '2021-01-07 23:05:19');
INSERT INTO `admin_log` VALUES ('372', '0', '', '/admin/dologin', '[::1]:7379', '2021-01-07 23:05:26');
INSERT INTO `admin_log` VALUES ('373', '0', '', '/admin/dologin', '[::1]:7379', '2021-01-07 23:05:28');
INSERT INTO `admin_log` VALUES ('374', '4', 'xmzd', '/admin/administrator', '[::1]:7379', '2021-01-07 23:05:28');
INSERT INTO `admin_log` VALUES ('375', '4', 'xmzd', '/admin/auth_error', '[::1]:7379', '2021-01-07 23:05:28');
INSERT INTO `admin_log` VALUES ('376', '4', 'xmzd', '/admin/auth_error', '[::1]:7379', '2021-01-07 23:05:30');
INSERT INTO `admin_log` VALUES ('377', '4', 'xmzd', '/admin/administrator', '[::1]:7379', '2021-01-07 23:05:36');
INSERT INTO `admin_log` VALUES ('378', '4', 'xmzd', '/admin/auth_error', '[::1]:7379', '2021-01-07 23:05:36');
INSERT INTO `admin_log` VALUES ('379', '4', 'xmzd', '/admin/auth_error', '[::1]:7379', '2021-01-07 23:05:38');
INSERT INTO `admin_log` VALUES ('380', '4', 'xmzd', '/admin/logout', '[::1]:7379', '2021-01-07 23:05:43');
INSERT INTO `admin_log` VALUES ('381', '0', '', '/admin/dologin', '[::1]:7379', '2021-01-07 23:06:58');
INSERT INTO `admin_log` VALUES ('382', '6', 'sspku', '/admin/administrator', '[::1]:7379', '2021-01-07 23:07:02');
INSERT INTO `admin_log` VALUES ('383', '6', 'sspku', '/admin/logout', '[::1]:7379', '2021-01-07 23:11:27');
INSERT INTO `admin_log` VALUES ('384', '0', '', '/admin/dologin', '[::1]:7379', '2021-01-07 23:11:33');
INSERT INTO `admin_log` VALUES ('385', '4', 'xmzd', '/admin/administrator', '[::1]:7379', '2021-01-07 23:11:34');
INSERT INTO `admin_log` VALUES ('386', '4', 'xmzd', '/admin/auth_error', '[::1]:7379', '2021-01-07 23:11:34');
INSERT INTO `admin_log` VALUES ('387', '4', 'xmzd', '/admin/auth_error', '[::1]:7379', '2021-01-07 23:11:34');
INSERT INTO `admin_log` VALUES ('388', '0', '', '/admin/dologin', '[::1]:8242', '2021-01-07 23:13:33');
INSERT INTO `admin_log` VALUES ('389', '4', 'xmzd', '/admin/administrator', '[::1]:8242', '2021-01-07 23:13:38');
INSERT INTO `admin_log` VALUES ('390', '4', 'xmzd', '/admin/auth_error', '[::1]:8242', '2021-01-07 23:13:38');
INSERT INTO `admin_log` VALUES ('391', '4', 'xmzd', '/admin/auth_error', '[::1]:8242', '2021-01-07 23:13:38');
INSERT INTO `admin_log` VALUES ('392', '4', 'xmzd', '/admin/administrator/edit_page/4', '[::1]:8242', '2021-01-07 23:14:12');
INSERT INTO `admin_log` VALUES ('393', '4', 'xmzd', '/admin/administrator/update/4', '[::1]:8242', '2021-01-07 23:14:26');
INSERT INTO `admin_log` VALUES ('394', '4', 'xmzd', '/admin/administrator/edit_page/4', '[::1]:8242', '2021-01-07 23:15:18');
INSERT INTO `admin_log` VALUES ('395', '4', 'xmzd', '/admin/administrator', '[::1]:8242', '2021-01-07 23:15:21');
INSERT INTO `admin_log` VALUES ('396', '4', 'xmzd', '/admin/auth_error', '[::1]:8242', '2021-01-07 23:15:21');
INSERT INTO `admin_log` VALUES ('397', '4', 'xmzd', '/admin/auth_error', '[::1]:8242', '2021-01-07 23:15:23');
INSERT INTO `admin_log` VALUES ('398', '4', 'xmzd', '/admin/administrator', '[::1]:8242', '2021-01-07 23:15:30');
INSERT INTO `admin_log` VALUES ('399', '4', 'xmzd', '/admin/auth_error', '[::1]:8242', '2021-01-07 23:15:30');
INSERT INTO `admin_log` VALUES ('400', '4', 'xmzd', '/admin/auth_error', '[::1]:8242', '2021-01-07 23:15:30');
INSERT INTO `admin_log` VALUES ('401', '4', 'xmzd', '/admin/person', '[::1]:8242', '2021-01-07 23:15:34');
INSERT INTO `admin_log` VALUES ('402', '4', 'xmzd', '/admin/person', '[::1]:8242', '2021-01-07 23:15:35');
INSERT INTO `admin_log` VALUES ('403', '4', 'xmzd', '/admin/administrator', '[::1]:8242', '2021-01-07 23:15:37');
INSERT INTO `admin_log` VALUES ('404', '0', '', '/admin/dologin', '127.0.0.1:7903', '2021-01-08 00:09:33');
INSERT INTO `admin_log` VALUES ('405', '1', 'root', '/admin/administrator', '127.0.0.1:7903', '2021-01-08 00:09:35');
INSERT INTO `admin_log` VALUES ('406', '1', 'root', '/admin/administrator/edit_page/6', '127.0.0.1:7903', '2021-01-08 00:09:41');
INSERT INTO `admin_log` VALUES ('407', '1', 'root', '/admin/administrator/edit_page/4', '127.0.0.1:7903', '2021-01-08 00:09:45');
INSERT INTO `admin_log` VALUES ('408', '1', 'root', '/admin/administrator/update/4', '127.0.0.1:7903', '2021-01-08 00:09:46');
INSERT INTO `admin_log` VALUES ('409', '1', 'root', '/admin/administrator', '127.0.0.1:7903', '2021-01-08 00:09:47');
INSERT INTO `admin_log` VALUES ('410', '1', 'root', '/admin/person', '127.0.0.1:7903', '2021-01-08 00:09:51');
INSERT INTO `admin_log` VALUES ('411', '1', 'root', '/admin/administrator', '[::1]:7980', '2021-01-08 00:10:00');
INSERT INTO `admin_log` VALUES ('412', '1', 'root', '/admin/logout', '[::1]:7980', '2021-01-08 00:10:15');
INSERT INTO `admin_log` VALUES ('413', '0', '', '/admin/dologin', '[::1]:7980', '2021-01-08 00:10:21');
INSERT INTO `admin_log` VALUES ('414', '4', 'xmzd', '/admin/administrator', '127.0.0.1:7903', '2021-01-08 00:10:21');
INSERT INTO `admin_log` VALUES ('415', '4', 'xmzd', '/admin/auth_error', '[::1]:7980', '2021-01-08 00:10:21');
INSERT INTO `admin_log` VALUES ('416', '4', 'xmzd', '/admin/auth_error', '[::1]:7980', '2021-01-08 00:10:21');
INSERT INTO `admin_log` VALUES ('417', '4', 'xmzd', '/admin/person', '[::1]:7980', '2021-01-08 00:10:26');
INSERT INTO `admin_log` VALUES ('418', '4', 'xmzd', '/admin/auth_error', '[::1]:7980', '2021-01-08 00:10:29');
INSERT INTO `admin_log` VALUES ('419', '4', 'xmzd', '/admin/administrator', '[::1]:7980', '2021-01-08 00:10:30');
INSERT INTO `admin_log` VALUES ('420', '4', 'xmzd', '/admin/auth_error', '[::1]:7980', '2021-01-08 00:10:30');
INSERT INTO `admin_log` VALUES ('421', '4', 'xmzd', '/admin/administrator/edit_page/4', '[::1]:7980', '2021-01-08 00:12:39');
INSERT INTO `admin_log` VALUES ('422', '4', 'xmzd', '/admin/auth_error', '[::1]:7980', '2021-01-08 00:12:39');
INSERT INTO `admin_log` VALUES ('423', '4', 'xmzd', '/admin/administrator', '127.0.0.1:7903', '2021-01-08 00:12:43');
INSERT INTO `admin_log` VALUES ('424', '4', 'xmzd', '/admin/auth_error', '[::1]:7980', '2021-01-08 00:12:43');
INSERT INTO `admin_log` VALUES ('425', '4', 'xmzd', '/admin/auth_error', '[::1]:7980', '2021-01-08 00:12:43');
INSERT INTO `admin_log` VALUES ('426', '4', 'xmzd', '/admin/log?page=3', '[::1]:7980', '2021-01-08 00:13:04');
INSERT INTO `admin_log` VALUES ('427', '4', 'xmzd', '/admin/auth_error', '[::1]:7980', '2021-01-08 00:13:14');
INSERT INTO `admin_log` VALUES ('428', '4', 'xmzd', '/admin/administrator', '127.0.0.1:7903', '2021-01-08 00:13:19');
INSERT INTO `admin_log` VALUES ('429', '4', 'xmzd', '/admin/auth_error', '[::1]:7980', '2021-01-08 00:13:19');
INSERT INTO `admin_log` VALUES ('430', '4', 'xmzd', '/admin/auth_error', '[::1]:7980', '2021-01-08 00:13:20');
INSERT INTO `admin_log` VALUES ('431', '0', '', '/admin/dologin', '[::1]:8268', '2021-01-08 00:15:17');
INSERT INTO `admin_log` VALUES ('432', '4', 'xmzd', '/admin/auth_error', '[::1]:8268', '2021-01-08 00:15:18');
INSERT INTO `admin_log` VALUES ('433', '4', 'xmzd', '/admin/auth_error', '[::1]:8269', '2021-01-08 00:15:18');
INSERT INTO `admin_log` VALUES ('434', '0', '', '/admin/dologin', '[::1]:8863', '2021-01-08 00:28:18');
INSERT INTO `admin_log` VALUES ('435', '4', 'xmzd', '/admin/administrator', '[::1]:8864', '2021-01-08 00:28:19');
INSERT INTO `admin_log` VALUES ('436', '4', 'xmzd', '/admin/syslog', '[::1]:8863', '2021-01-08 00:28:19');
INSERT INTO `admin_log` VALUES ('437', '4', 'xmzd', '/admin/auth_error', '[::1]:8863', '2021-01-08 00:28:19');
INSERT INTO `admin_log` VALUES ('438', '4', 'xmzd', '/admin/auth_error', '[::1]:8863', '2021-01-08 00:28:19');
INSERT INTO `admin_log` VALUES ('439', '4', 'xmzd', '/admin/person', '[::1]:8863', '2021-01-08 00:28:38');
INSERT INTO `admin_log` VALUES ('440', '4', 'xmzd', '/admin/administrator', '[::1]:8863', '2021-01-08 00:28:45');
INSERT INTO `admin_log` VALUES ('441', '4', 'xmzd', '/admin/auth_error', '[::1]:8863', '2021-01-08 00:28:45');
INSERT INTO `admin_log` VALUES ('442', '4', 'xmzd', '/admin/administrator', '[::1]:8863', '2021-01-08 00:28:50');
INSERT INTO `admin_log` VALUES ('443', '4', 'xmzd', '/admin/auth_error', '[::1]:8863', '2021-01-08 00:28:50');
INSERT INTO `admin_log` VALUES ('444', '4', 'xmzd', '/admin/syslog', '[::1]:8863', '2021-01-08 00:29:16');
INSERT INTO `admin_log` VALUES ('445', '4', 'xmzd', '/admin/auth_error', '[::1]:8863', '2021-01-08 00:29:16');
INSERT INTO `admin_log` VALUES ('446', '0', '', '/admin/dologin', '[::1]:7396', '2021-01-08 16:45:30');
INSERT INTO `admin_log` VALUES ('447', '1', 'root', '/admin/goods', '[::1]:7396', '2021-01-08 16:45:33');
INSERT INTO `admin_log` VALUES ('448', '1', 'root', '/admin/administrator', '[::1]:7396', '2021-01-08 16:45:37');
INSERT INTO `admin_log` VALUES ('449', '1', 'root', '/admin/syslog', '[::1]:7396', '2021-01-08 16:45:51');
INSERT INTO `admin_log` VALUES ('450', '1', 'root', '/admin/goods?goods_name=%E8%BD%A6', '[::1]:7396', '2021-01-08 16:46:16');
INSERT INTO `admin_log` VALUES ('451', '1', 'root', '/admin/goods?goods_name=%E6%88%96', '[::1]:7396', '2021-01-08 16:46:20');
INSERT INTO `admin_log` VALUES ('452', '1', 'root', '/admin/goods?goods_name=', '[::1]:7396', '2021-01-08 16:46:22');
INSERT INTO `admin_log` VALUES ('453', '1', 'root', '/admin/syslog', '[::1]:7396', '2021-01-08 16:46:26');
INSERT INTO `admin_log` VALUES ('454', '1', 'root', '/admin/goods', '[::1]:7396', '2021-01-08 16:47:40');
INSERT INTO `admin_log` VALUES ('455', '1', 'root', '/admin/goods/add_page', '[::1]:7396', '2021-01-08 16:47:46');
INSERT INTO `admin_log` VALUES ('456', '1', 'root', '/admin/goods/edit_page/1', '[::1]:7396', '2021-01-08 16:47:48');
INSERT INTO `admin_log` VALUES ('457', '1', 'root', '/admin/goods/destroy/1', '[::1]:7396', '2021-01-08 16:47:52');
INSERT INTO `admin_log` VALUES ('458', '1', 'root', '/admin/syslog', '[::1]:7396', '2021-01-08 16:47:57');
INSERT INTO `admin_log` VALUES ('459', '1', 'root', '/admin/goods', '[::1]:7396', '2021-01-08 16:49:05');
INSERT INTO `admin_log` VALUES ('460', '1', 'root', '/admin/administrator', '[::1]:7396', '2021-01-08 16:49:08');
INSERT INTO `admin_log` VALUES ('461', '1', 'root', '/admin/logout', '[::1]:7396', '2021-01-08 16:49:13');
INSERT INTO `admin_log` VALUES ('462', '0', '', '/admin/dologin', '[::1]:7396', '2021-01-08 16:49:20');
INSERT INTO `admin_log` VALUES ('463', '6', 'sspku', '/admin/goods', '[::1]:7396', '2021-01-08 16:49:20');
INSERT INTO `admin_log` VALUES ('464', '6', 'sspku', '/admin/auth_error', '[::1]:7396', '2021-01-08 16:49:20');
INSERT INTO `admin_log` VALUES ('465', '6', 'sspku', '/admin/administrator', '[::1]:7606', '2021-01-08 16:49:20');
INSERT INTO `admin_log` VALUES ('466', '6', 'sspku', '/admin/syslog', '[::1]:7606', '2021-01-08 16:49:24');
INSERT INTO `admin_log` VALUES ('467', '6', 'sspku', '/admin/goods', '[::1]:7606', '2021-01-08 16:49:51');
INSERT INTO `admin_log` VALUES ('468', '6', 'sspku', '/admin/auth_error', '[::1]:7606', '2021-01-08 16:49:51');
INSERT INTO `admin_log` VALUES ('469', '6', 'sspku', '/admin/syslog', '[::1]:7606', '2021-01-08 16:49:58');
INSERT INTO `admin_log` VALUES ('470', '0', '', '/admin/dologin', '[::1]:12850', '2021-01-09 01:25:25');
INSERT INTO `admin_log` VALUES ('471', '1', 'root', '/admin/syslog', '[::1]:12862', '2021-01-09 01:25:26');
INSERT INTO `admin_log` VALUES ('472', '1', 'root', '/admin/goods', '[::1]:12862', '2021-01-09 01:25:32');
INSERT INTO `admin_log` VALUES ('473', '1', 'root', '/admin/goods/add_page', '[::1]:12853', '2021-01-09 01:25:32');
INSERT INTO `admin_log` VALUES ('474', '0', '', '/admin/dologin', '[::1]:12966', '2021-01-09 01:26:43');
INSERT INTO `admin_log` VALUES ('475', '1', 'root', '/admin/goods', '[::1]:12966', '2021-01-09 01:26:44');
INSERT INTO `admin_log` VALUES ('476', '1', 'root', '/admin/goods/add_page', '[::1]:12966', '2021-01-09 01:26:45');
INSERT INTO `admin_log` VALUES ('477', '1', 'root', '/admin/syslog', '[::1]:12966', '2021-01-09 01:27:03');
INSERT INTO `admin_log` VALUES ('478', '1', 'root', '/admin/administrator', '[::1]:12966', '2021-01-09 01:27:04');
INSERT INTO `admin_log` VALUES ('479', '1', 'root', '/admin/administrator/add_page', '[::1]:12966', '2021-01-09 01:27:04');
INSERT INTO `admin_log` VALUES ('480', '1', 'root', '/admin/syslog', '[::1]:12966', '2021-01-09 01:27:18');
INSERT INTO `admin_log` VALUES ('481', '1', 'root', '/admin/administrator/add_page', '[::1]:12966', '2021-01-09 01:27:22');
INSERT INTO `admin_log` VALUES ('482', '1', 'root', '/admin/goods', '[::1]:12966', '2021-01-09 01:27:27');
INSERT INTO `admin_log` VALUES ('483', '1', 'root', '/admin/goods/add_page', '[::1]:12966', '2021-01-09 01:27:28');
INSERT INTO `admin_log` VALUES ('484', '1', 'root', '/admin/goods', '[::1]:12966', '2021-01-09 01:28:15');
INSERT INTO `admin_log` VALUES ('485', '1', 'root', '/admin/goods/add_page', '[::1]:12966', '2021-01-09 01:28:16');
INSERT INTO `admin_log` VALUES ('486', '1', 'root', '/admin/goods', '[::1]:12966', '2021-01-09 01:29:24');
INSERT INTO `admin_log` VALUES ('487', '1', 'root', '/admin/goods/add_page', '[::1]:12966', '2021-01-09 01:29:26');
INSERT INTO `admin_log` VALUES ('488', '1', 'root', '/admin/goods', '[::1]:12966', '2021-01-09 01:30:04');
INSERT INTO `admin_log` VALUES ('489', '1', 'root', '/admin/goods/add_page', '[::1]:12966', '2021-01-09 01:30:05');
INSERT INTO `admin_log` VALUES ('490', '1', 'root', '/admin/goods', '[::1]:12966', '2021-01-09 01:30:24');
INSERT INTO `admin_log` VALUES ('491', '1', 'root', '/admin/goods/add_page', '[::1]:12966', '2021-01-09 01:30:25');
INSERT INTO `admin_log` VALUES ('492', '1', 'root', '/admin/goods', '[::1]:12966', '2021-01-09 01:30:44');
INSERT INTO `admin_log` VALUES ('493', '1', 'root', '/admin/goods/add_page', '[::1]:12966', '2021-01-09 01:30:45');
INSERT INTO `admin_log` VALUES ('494', '1', 'root', '/admin/goods/add_page', '[::1]:12966', '2021-01-09 01:31:00');
INSERT INTO `admin_log` VALUES ('495', '1', 'root', '/admin/goods', '[::1]:12966', '2021-01-09 01:31:03');
INSERT INTO `admin_log` VALUES ('496', '1', 'root', '/admin/goods/add_page', '[::1]:12966', '2021-01-09 01:31:03');
INSERT INTO `admin_log` VALUES ('497', '1', 'root', '/admin/goods', '[::1]:12966', '2021-01-09 01:31:26');
INSERT INTO `admin_log` VALUES ('498', '1', 'root', '/admin/goods/add_page', '[::1]:12966', '2021-01-09 01:31:27');
INSERT INTO `admin_log` VALUES ('499', '1', 'root', '/admin/syslog', '[::1]:12966', '2021-01-09 01:32:08');
INSERT INTO `admin_log` VALUES ('500', '1', 'root', '/admin/administrator', '[::1]:12966', '2021-01-09 01:32:09');
INSERT INTO `admin_log` VALUES ('501', '1', 'root', '/admin/administrator/add_page', '[::1]:12966', '2021-01-09 01:32:09');
INSERT INTO `admin_log` VALUES ('502', '1', 'root', '/admin/goods/add_page', '[::1]:12966', '2021-01-09 01:32:16');
INSERT INTO `admin_log` VALUES ('503', '1', 'root', '/admin/goods', '[::1]:12966', '2021-01-09 01:33:10');
INSERT INTO `admin_log` VALUES ('504', '1', 'root', '/admin/goods/add_page', '[::1]:12966', '2021-01-09 01:33:11');
INSERT INTO `admin_log` VALUES ('505', '1', 'root', '/admin/goods', '[::1]:13403', '2021-01-09 01:34:24');
INSERT INTO `admin_log` VALUES ('506', '1', 'root', '/admin/goods/add_page', '[::1]:13403', '2021-01-09 01:34:25');
INSERT INTO `admin_log` VALUES ('507', '1', 'root', '/admin/goods', '[::1]:13403', '2021-01-09 01:35:23');
INSERT INTO `admin_log` VALUES ('508', '1', 'root', '/admin/goods/add_page', '[::1]:13403', '2021-01-09 01:35:24');
INSERT INTO `admin_log` VALUES ('509', '1', 'root', '/admin/goods', '[::1]:13403', '2021-01-09 01:36:55');
INSERT INTO `admin_log` VALUES ('510', '1', 'root', '/admin/goods/add_page', '[::1]:13403', '2021-01-09 01:36:55');
INSERT INTO `admin_log` VALUES ('511', '1', 'root', '/admin/goods', '[::1]:13403', '2021-01-09 01:37:39');
INSERT INTO `admin_log` VALUES ('512', '1', 'root', '/admin/goods/add_page', '[::1]:13403', '2021-01-09 01:37:40');
INSERT INTO `admin_log` VALUES ('513', '0', '', '/admin/dologin', '[::1]:1111', '2021-01-09 10:11:38');
INSERT INTO `admin_log` VALUES ('514', '1', 'root', '/admin/goods', '[::1]:1111', '2021-01-09 10:11:39');
INSERT INTO `admin_log` VALUES ('515', '1', 'root', '/admin/goods/add_page', '[::1]:1111', '2021-01-09 10:11:40');
INSERT INTO `admin_log` VALUES ('516', '1', 'root', '/admin/goods/add', '[::1]:1111', '2021-01-09 10:11:57');
INSERT INTO `admin_log` VALUES ('517', '0', '', '/admin/dologin', '[::1]:1448', '2021-01-09 10:19:10');
INSERT INTO `admin_log` VALUES ('518', '1', 'root', '/admin/goods', '[::1]:1448', '2021-01-09 10:19:10');
INSERT INTO `admin_log` VALUES ('519', '1', 'root', '/admin/goods/add_page', '[::1]:1448', '2021-01-09 10:19:11');
INSERT INTO `admin_log` VALUES ('520', '1', 'root', '/admin/goods/add', '[::1]:1448', '2021-01-09 10:19:23');
INSERT INTO `admin_log` VALUES ('521', '0', '', '/admin/dologin', '[::1]:1822', '2021-01-09 10:24:40');
INSERT INTO `admin_log` VALUES ('522', '1', 'root', '/admin/goods', '[::1]:1822', '2021-01-09 10:24:41');
INSERT INTO `admin_log` VALUES ('523', '1', 'root', '/admin/goods/add_page', '[::1]:1822', '2021-01-09 10:24:42');
INSERT INTO `admin_log` VALUES ('524', '1', 'root', '/admin/goods/add', '[::1]:1822', '2021-01-09 10:24:54');
INSERT INTO `admin_log` VALUES ('525', '0', '', '/admin/dologin', '[::1]:1984', '2021-01-09 10:27:12');
INSERT INTO `admin_log` VALUES ('526', '4', 'xmzd', '/admin/goods', '[::1]:1984', '2021-01-09 10:27:12');
INSERT INTO `admin_log` VALUES ('527', '4', 'xmzd', '/admin/goods/add_page', '[::1]:1984', '2021-01-09 10:27:13');
INSERT INTO `admin_log` VALUES ('528', '4', 'xmzd', '/admin/goods/add', '[::1]:1984', '2021-01-09 10:27:32');
INSERT INTO `admin_log` VALUES ('529', '4', 'xmzd', '/admin/goods', '[::1]:1984', '2021-01-09 10:27:34');
INSERT INTO `admin_log` VALUES ('530', '4', 'xmzd', '/admin/goods', '[::1]:1984', '2021-01-09 10:28:13');
INSERT INTO `admin_log` VALUES ('531', '4', 'xmzd', '/admin/goods', '[::1]:1984', '2021-01-09 10:28:52');
INSERT INTO `admin_log` VALUES ('532', '0', '', '/admin/dologin', '[::1]:3357', '2021-01-09 10:52:14');
INSERT INTO `admin_log` VALUES ('533', '1', 'root', '/admin/goods', '[::1]:3357', '2021-01-09 10:52:15');
INSERT INTO `admin_log` VALUES ('534', '1', 'root', '/admin/goods/add_page', '[::1]:3357', '2021-01-09 10:52:16');
INSERT INTO `admin_log` VALUES ('535', '1', 'root', '/admin/goods/add', '[::1]:3357', '2021-01-09 10:52:40');
INSERT INTO `admin_log` VALUES ('536', '1', 'root', '/admin/goods/add', '[::1]:3357', '2021-01-09 10:53:16');
INSERT INTO `admin_log` VALUES ('537', '1', 'root', '/admin/goods/add', '[::1]:3357', '2021-01-09 10:53:51');
INSERT INTO `admin_log` VALUES ('538', '0', '', '/admin/dologin', '[::1]:3594', '2021-01-09 10:55:48');
INSERT INTO `admin_log` VALUES ('539', '1', 'root', '/admin/goods', '[::1]:3594', '2021-01-09 10:55:48');
INSERT INTO `admin_log` VALUES ('540', '1', 'root', '/admin/goods/add_page', '[::1]:3594', '2021-01-09 10:55:50');
INSERT INTO `admin_log` VALUES ('541', '1', 'root', '/admin/goods/add', '[::1]:3594', '2021-01-09 10:56:06');
INSERT INTO `admin_log` VALUES ('542', '0', '', '/admin/dologin', '[::1]:3898', '2021-01-09 11:00:12');
INSERT INTO `admin_log` VALUES ('543', '1', 'root', '/admin/goods', '[::1]:3898', '2021-01-09 11:00:12');
INSERT INTO `admin_log` VALUES ('544', '1', 'root', '/admin/goods/add_page', '[::1]:3898', '2021-01-09 11:00:13');
INSERT INTO `admin_log` VALUES ('545', '1', 'root', '/admin/goods/add', '[::1]:3898', '2021-01-09 11:00:24');
INSERT INTO `admin_log` VALUES ('546', '0', '', '/admin/dologin', '[::1]:4057', '2021-01-09 11:02:26');
INSERT INTO `admin_log` VALUES ('547', '1', 'root', '/admin/goods', '[::1]:4057', '2021-01-09 11:02:26');
INSERT INTO `admin_log` VALUES ('548', '1', 'root', '/admin/goods/add_page', '[::1]:4057', '2021-01-09 11:02:27');
INSERT INTO `admin_log` VALUES ('549', '1', 'root', '/admin/goods/add', '[::1]:4057', '2021-01-09 11:02:39');
INSERT INTO `admin_log` VALUES ('550', '0', '', '/admin/dologin', '[::1]:4230', '2021-01-09 11:04:16');
INSERT INTO `admin_log` VALUES ('551', '1', 'root', '/admin/goods', '[::1]:4230', '2021-01-09 11:04:16');
INSERT INTO `admin_log` VALUES ('552', '1', 'root', '/admin/goods/add_page', '[::1]:4230', '2021-01-09 11:04:17');
INSERT INTO `admin_log` VALUES ('553', '1', 'root', '/admin/goods/add', '[::1]:4230', '2021-01-09 11:04:33');
INSERT INTO `admin_log` VALUES ('554', '0', '', '/admin/dologin', '[::1]:4399', '2021-01-09 11:06:49');
INSERT INTO `admin_log` VALUES ('555', '1', 'root', '/admin/goods', '[::1]:4399', '2021-01-09 11:06:49');
INSERT INTO `admin_log` VALUES ('556', '1', 'root', '/admin/goods/add_page', '[::1]:4399', '2021-01-09 11:06:50');
INSERT INTO `admin_log` VALUES ('557', '1', 'root', '/admin/goods/add', '[::1]:4399', '2021-01-09 11:07:01');
INSERT INTO `admin_log` VALUES ('558', '0', '', '/admin/dologin', '[::1]:4542', '2021-01-09 11:08:23');
INSERT INTO `admin_log` VALUES ('559', '1', 'root', '/admin/goods', '[::1]:4542', '2021-01-09 11:08:23');
INSERT INTO `admin_log` VALUES ('560', '1', 'root', '/admin/goods/add_page', '[::1]:4542', '2021-01-09 11:08:26');
INSERT INTO `admin_log` VALUES ('561', '1', 'root', '/admin/goods/add', '[::1]:4542', '2021-01-09 11:08:40');
INSERT INTO `admin_log` VALUES ('562', '1', 'root', '/admin/goods', '[::1]:4542', '2021-01-09 11:08:43');
INSERT INTO `admin_log` VALUES ('563', '0', '', '/admin/dologin', '[::1]:5063', '2021-01-09 11:15:07');
INSERT INTO `admin_log` VALUES ('564', '1', 'root', '/admin/goods', '[::1]:5063', '2021-01-09 11:15:07');
INSERT INTO `admin_log` VALUES ('565', '1', 'root', '/admin/goods/add_page', '[::1]:5063', '2021-01-09 11:15:08');
INSERT INTO `admin_log` VALUES ('566', '1', 'root', '/admin/goods/add', '[::1]:5063', '2021-01-09 11:15:21');
INSERT INTO `admin_log` VALUES ('567', '1', 'root', '/admin/goods/add', '[::1]:5063', '2021-01-09 11:15:28');
INSERT INTO `admin_log` VALUES ('568', '1', 'root', '/admin/goods/add', '[::1]:5063', '2021-01-09 11:15:32');
INSERT INTO `admin_log` VALUES ('569', '1', 'root', '/admin/goods/add', '[::1]:5063', '2021-01-09 11:15:40');
INSERT INTO `admin_log` VALUES ('570', '1', 'root', '/admin/goods/add', '[::1]:5063', '2021-01-09 11:15:46');
INSERT INTO `admin_log` VALUES ('571', '1', 'root', '/admin/goods/add', '[::1]:5063', '2021-01-09 11:15:53');
INSERT INTO `admin_log` VALUES ('572', '1', 'root', '/admin/goods/add', '[::1]:5063', '2021-01-09 11:15:56');
INSERT INTO `admin_log` VALUES ('573', '1', 'root', '/admin/goods', '[::1]:5063', '2021-01-09 11:15:58');
INSERT INTO `admin_log` VALUES ('574', '1', 'root', '/admin/syslog', '[::1]:5063', '2021-01-09 11:16:51');
INSERT INTO `admin_log` VALUES ('575', '0', '', '/admin/dologin', '[::1]:5492', '2021-01-09 11:20:04');
INSERT INTO `admin_log` VALUES ('576', '1', 'root', '/admin/goods', '[::1]:5492', '2021-01-09 11:20:04');
INSERT INTO `admin_log` VALUES ('577', '1', 'root', '/admin/goods/add_page', '[::1]:5492', '2021-01-09 11:20:06');
INSERT INTO `admin_log` VALUES ('578', '1', 'root', '/admin/goods/add', '[::1]:5492', '2021-01-09 11:20:34');
INSERT INTO `admin_log` VALUES ('579', '1', 'root', '/admin/goods/add', '[::1]:5492', '2021-01-09 11:20:55');
INSERT INTO `admin_log` VALUES ('580', '1', 'root', '/admin/goods', '[::1]:5492', '2021-01-09 11:20:56');
INSERT INTO `admin_log` VALUES ('581', '1', 'root', '/admin/goods/destroy/3', '[::1]:5492', '2021-01-09 11:21:08');
INSERT INTO `admin_log` VALUES ('582', '0', '', '/admin/dologin', '[::1]:5774', '2021-01-09 11:23:04');
INSERT INTO `admin_log` VALUES ('583', '1', 'root', '/admin/goods', '[::1]:5774', '2021-01-09 11:23:04');
INSERT INTO `admin_log` VALUES ('584', '1', 'root', '/admin/goods/destroy/3', '[::1]:5774', '2021-01-09 11:23:07');
INSERT INTO `admin_log` VALUES ('585', '1', 'root', '/admin/goods/destroy/4', '[::1]:5774', '2021-01-09 11:23:16');
INSERT INTO `admin_log` VALUES ('586', '1', 'root', '/admin/administrator', '[::1]:5774', '2021-01-09 11:23:19');
INSERT INTO `admin_log` VALUES ('587', '1', 'root', '/admin/administrator/add_page', '[::1]:5774', '2021-01-09 11:23:25');
INSERT INTO `admin_log` VALUES ('588', '1', 'root', '/admin/administrator/add', '[::1]:5774', '2021-01-09 11:23:40');
INSERT INTO `admin_log` VALUES ('589', '1', 'root', '/admin/administrator', '[::1]:5774', '2021-01-09 11:23:41');
INSERT INTO `admin_log` VALUES ('590', '1', 'root', '/admin/administrator/destroy/7', '[::1]:5774', '2021-01-09 11:23:44');
INSERT INTO `admin_log` VALUES ('591', '0', '', '/admin/dologin', '[::1]:8473', '2021-01-09 12:03:08');
INSERT INTO `admin_log` VALUES ('592', '1', 'root', '/admin/goods', '[::1]:8473', '2021-01-09 12:03:08');
INSERT INTO `admin_log` VALUES ('593', '1', 'root', '/admin/administrator', '[::1]:8474', '2021-01-09 12:03:08');
INSERT INTO `admin_log` VALUES ('594', '1', 'root', '/admin/administrator/add_page', '[::1]:8474', '2021-01-09 12:03:10');
INSERT INTO `admin_log` VALUES ('595', '1', 'root', '/admin/goods/add_page', '[::1]:8474', '2021-01-09 12:03:15');
INSERT INTO `admin_log` VALUES ('596', '1', 'root', '/admin/goods/add', '[::1]:8474', '2021-01-09 12:03:33');
INSERT INTO `admin_log` VALUES ('597', '1', 'root', '/admin/goods/add', '[::1]:8474', '2021-01-09 12:03:41');
INSERT INTO `admin_log` VALUES ('598', '1', 'root', '/admin/goods', '[::1]:8474', '2021-01-09 12:03:42');
INSERT INTO `admin_log` VALUES ('599', '0', '', '/admin/dologin', '[::1]:2039', '2021-01-09 14:52:08');
INSERT INTO `admin_log` VALUES ('600', '1', 'root', '/admin/goods', '[::1]:2039', '2021-01-09 14:52:09');
INSERT INTO `admin_log` VALUES ('601', '1', 'root', '/admin/goods/edit_page/6', '[::1]:2039', '2021-01-09 14:52:11');
INSERT INTO `admin_log` VALUES ('602', '1', 'root', '/admin/goods/edit_page/6', '[::1]:2039', '2021-01-09 14:53:14');
INSERT INTO `admin_log` VALUES ('603', '1', 'root', '/admin/goods/edit_page/6', '[::1]:2039', '2021-01-09 14:53:29');
INSERT INTO `admin_log` VALUES ('604', '1', 'root', '/admin/goods/update/6', '[::1]:2039', '2021-01-09 14:53:41');
INSERT INTO `admin_log` VALUES ('605', '0', '', '/admin/dologin', '[::1]:2981', '2021-01-09 15:03:18');
INSERT INTO `admin_log` VALUES ('606', '1', 'root', '/admin/goods', '[::1]:2981', '2021-01-09 15:03:18');
INSERT INTO `admin_log` VALUES ('607', '1', 'root', '/admin/goods/edit_page/6', '[::1]:2981', '2021-01-09 15:03:20');
INSERT INTO `admin_log` VALUES ('608', '1', 'root', '/admin/goods/edit_page/1', '[::1]:2981', '2021-01-09 15:03:31');
INSERT INTO `admin_log` VALUES ('609', '1', 'root', '/admin/goods/edit_page/5', '[::1]:2981', '2021-01-09 15:03:34');
INSERT INTO `admin_log` VALUES ('610', '1', 'root', '/admin/goods/update/5', '[::1]:2981', '2021-01-09 15:03:38');
INSERT INTO `admin_log` VALUES ('611', '0', '', '/admin/dologin', '[::1]:4612', '2021-01-09 15:25:30');
INSERT INTO `admin_log` VALUES ('612', '1', 'root', '/admin/goods', '[::1]:4612', '2021-01-09 15:25:30');
INSERT INTO `admin_log` VALUES ('613', '1', 'root', '/admin/goods/edit_page/2', '[::1]:4612', '2021-01-09 15:25:35');
INSERT INTO `admin_log` VALUES ('614', '1', 'root', '/admin/goods/update/2', '[::1]:4612', '2021-01-09 15:25:36');
INSERT INTO `admin_log` VALUES ('615', '1', 'root', '/admin/goods/update/2', '[::1]:4612', '2021-01-09 15:25:44');
INSERT INTO `admin_log` VALUES ('616', '1', 'root', '/admin/goods/update/2', '[::1]:4612', '2021-01-09 15:25:53');
INSERT INTO `admin_log` VALUES ('617', '1', 'root', '/admin/goods', '[::1]:4612', '2021-01-09 15:25:54');
INSERT INTO `admin_log` VALUES ('618', '1', 'root', '/admin/goods/edit_page/1', '[::1]:4612', '2021-01-09 15:26:20');
INSERT INTO `admin_log` VALUES ('619', '1', 'root', '/admin/goods/update/1', '[::1]:4612', '2021-01-09 15:26:26');
INSERT INTO `admin_log` VALUES ('620', '1', 'root', '/admin/goods/update/1', '[::1]:4612', '2021-01-09 15:26:37');
INSERT INTO `admin_log` VALUES ('621', '1', 'root', '/admin/goods', '[::1]:4612', '2021-01-09 15:26:39');
INSERT INTO `admin_log` VALUES ('622', '0', '', '/admin/dologin', '[::1]:5571', '2021-01-09 15:37:04');
INSERT INTO `admin_log` VALUES ('623', '1', 'root', '/admin/goods', '[::1]:5571', '2021-01-09 15:37:04');
INSERT INTO `admin_log` VALUES ('624', '1', 'root', '/admin/goods?goods_name=%E5%AD%90', '[::1]:5571', '2021-01-09 15:37:10');
INSERT INTO `admin_log` VALUES ('625', '1', 'root', '/admin/goods?goods_name=%E8%BD%A6%E5%8E%98%E5%AD%90', '[::1]:5571', '2021-01-09 15:37:17');
INSERT INTO `admin_log` VALUES ('626', '1', 'root', '/admin/syslog', '[::1]:5571', '2021-01-09 15:37:25');
INSERT INTO `admin_log` VALUES ('627', '1', 'root', '/admin/goods?goods_name=', '[::1]:5571', '2021-01-09 15:37:33');
INSERT INTO `admin_log` VALUES ('628', '0', '', '/admin/dologin', '[::1]:5889', '2021-01-09 15:41:09');
INSERT INTO `admin_log` VALUES ('629', '4', 'xmzd', '/admin/administrator', '[::1]:5889', '2021-01-09 15:41:14');
INSERT INTO `admin_log` VALUES ('630', '4', 'xmzd', '/admin/auth_error', '[::1]:5889', '2021-01-09 15:41:14');
INSERT INTO `admin_log` VALUES ('631', '4', 'xmzd', '/admin/syslog', '[::1]:5889', '2021-01-09 15:41:17');
INSERT INTO `admin_log` VALUES ('632', '4', 'xmzd', '/admin/auth_error', '[::1]:5889', '2021-01-09 15:41:17');
INSERT INTO `admin_log` VALUES ('633', '4', 'xmzd', '/admin/goods', '[::1]:5889', '2021-01-09 15:41:20');
INSERT INTO `admin_log` VALUES ('634', '0', '', '/admin/dologin', '[::1]:10992', '2021-01-09 17:36:45');
INSERT INTO `admin_log` VALUES ('635', '4', 'xmzd', '/admin/customer', '[::1]:10992', '2021-01-09 17:36:47');
INSERT INTO `admin_log` VALUES ('636', '4', 'xmzd', '/admin/order', '[::1]:10992', '2021-01-09 17:36:48');
INSERT INTO `admin_log` VALUES ('637', '4', 'xmzd', '/admin/syslog', '[::1]:10992', '2021-01-09 17:36:53');
INSERT INTO `admin_log` VALUES ('638', '4', 'xmzd', '/admin/auth_error', '[::1]:10992', '2021-01-09 17:36:53');
INSERT INTO `admin_log` VALUES ('639', '4', 'xmzd', '/admin/customer/add_page', '[::1]:10992', '2021-01-09 17:36:55');
INSERT INTO `admin_log` VALUES ('640', '4', 'xmzd', '/admin/customer/add', '[::1]:10992', '2021-01-09 17:37:15');
INSERT INTO `admin_log` VALUES ('641', '4', 'xmzd', '/admin/customer/add', '[::1]:10992', '2021-01-09 17:37:18');
INSERT INTO `admin_log` VALUES ('642', '4', 'xmzd', '/admin/customer', '[::1]:10992', '2021-01-09 17:37:20');
INSERT INTO `admin_log` VALUES ('643', '4', 'xmzd', '/admin/customer/add_page', '[::1]:10992', '2021-01-09 17:38:15');
INSERT INTO `admin_log` VALUES ('644', '4', 'xmzd', '/admin/customer/add', '[::1]:10992', '2021-01-09 17:38:19');
INSERT INTO `admin_log` VALUES ('645', '0', '', '/admin/dologin', '[::1]:1276', '2021-01-09 18:38:49');
INSERT INTO `admin_log` VALUES ('646', '1', 'root', '/admin/customer', '[::1]:1276', '2021-01-09 18:38:50');
INSERT INTO `admin_log` VALUES ('647', '1', 'root', '/admin/customer?phone=123', '[::1]:1276', '2021-01-09 18:39:00');
INSERT INTO `admin_log` VALUES ('648', '1', 'root', '/admin/customer?phone=', '[::1]:1276', '2021-01-09 18:39:03');
INSERT INTO `admin_log` VALUES ('649', '1', 'root', '/admin/customer?phone=18801052280', '[::1]:1276', '2021-01-09 18:39:06');
INSERT INTO `admin_log` VALUES ('650', '1', 'root', '/admin/syslog', '[::1]:1276', '2021-01-09 18:39:16');
INSERT INTO `admin_log` VALUES ('651', '0', '', '/admin/dologin', '[::1]:2180', '2021-01-09 18:50:39');
INSERT INTO `admin_log` VALUES ('652', '1', 'root', '/admin/customer', '[::1]:2180', '2021-01-09 18:50:39');
INSERT INTO `admin_log` VALUES ('653', '1', 'root', '/admin/customer/add_page', '[::1]:2180', '2021-01-09 18:50:41');
INSERT INTO `admin_log` VALUES ('654', '1', 'root', '/admin/customer/add', '[::1]:2180', '2021-01-09 18:50:54');
INSERT INTO `admin_log` VALUES ('655', '1', 'root', '/admin/customer/add', '[::1]:2180', '2021-01-09 18:51:00');
INSERT INTO `admin_log` VALUES ('656', '1', 'root', '/admin/customer', '[::1]:2180', '2021-01-09 18:51:02');
INSERT INTO `admin_log` VALUES ('657', '1', 'root', '/admin/customer', '[::1]:2180', '2021-01-09 18:51:39');
INSERT INTO `admin_log` VALUES ('658', '1', 'root', '/admin/customer/add_page', '[::1]:2180', '2021-01-09 18:51:40');
INSERT INTO `admin_log` VALUES ('659', '0', '', '/admin/dologin', '[::1]:3749', '2021-01-09 22:44:10');
INSERT INTO `admin_log` VALUES ('660', '4', 'xmzd', '/admin/customer', '[::1]:3749', '2021-01-09 22:44:11');
INSERT INTO `admin_log` VALUES ('661', '4', 'xmzd', '/admin/order', '[::1]:3749', '2021-01-09 22:44:34');
INSERT INTO `admin_log` VALUES ('662', '4', 'xmzd', '/admin/order?start_time=&end_time=&phone=18801&goods_id=', '[::1]:3749', '2021-01-09 22:44:44');
INSERT INTO `admin_log` VALUES ('663', '4', 'xmzd', '/admin/order?start_time=&end_time=&phone=&goods_id=', '[::1]:3749', '2021-01-09 22:44:49');
INSERT INTO `admin_log` VALUES ('664', '4', 'xmzd', '/admin/order?start_time=&end_time=&phone=%0918801052281&goods_id=', '[::1]:3749', '2021-01-09 22:44:56');
INSERT INTO `admin_log` VALUES ('665', '4', 'xmzd', '/admin/order?start_time=&end_time=&phone=18801052281&goods_id=', '[::1]:3749', '2021-01-09 22:45:01');
INSERT INTO `admin_log` VALUES ('666', '4', 'xmzd', '/admin/order?start_time=&end_time=&phone=&goods_id=', '[::1]:3749', '2021-01-09 22:45:04');
INSERT INTO `admin_log` VALUES ('667', '4', 'xmzd', '/admin/order?start_time=&end_time=&phone=&goods_id=2', '[::1]:3749', '2021-01-09 22:45:07');
INSERT INTO `admin_log` VALUES ('668', '4', 'xmzd', '/admin/order?start_time=&end_time=&phone=&goods_id=', '[::1]:3749', '2021-01-09 22:45:10');
INSERT INTO `admin_log` VALUES ('669', '4', 'xmzd', '/admin/order?start_time=2021-01-09+22%3A45%3A12&end_time=2021-01-09+22%3A45%3A14&phone=&goods_id=', '[::1]:3749', '2021-01-09 22:45:15');
INSERT INTO `admin_log` VALUES ('670', '0', '', '/admin/dologin', '[::1]:4009', '2021-01-09 22:47:18');
INSERT INTO `admin_log` VALUES ('671', '1', 'root', '/admin/customer', '[::1]:4009', '2021-01-09 22:47:19');
INSERT INTO `admin_log` VALUES ('672', '1', 'root', '/admin/order', '[::1]:4053', '2021-01-09 22:47:19');
INSERT INTO `admin_log` VALUES ('673', '1', 'root', '/admin/order?start_time=2021-01-09+22%3A47%3A21&end_time=2021-01-09+22%3A47%3A23&phone=&goods_id=', '[::1]:4053', '2021-01-09 22:47:25');
INSERT INTO `admin_log` VALUES ('674', '1', 'root', '/admin/order?start_time=&end_time=2021-01-09+22%3A47%3A23&phone=&goods_id=', '[::1]:4053', '2021-01-09 22:47:30');
INSERT INTO `admin_log` VALUES ('675', '1', 'root', '/admin/syslog', '[::1]:4053', '2021-01-09 22:47:41');
INSERT INTO `admin_log` VALUES ('676', '0', '', '/admin/dologin', '[::1]:2132', '2021-01-09 23:34:45');
INSERT INTO `admin_log` VALUES ('677', '1', 'root', '/admin/syslog', '[::1]:2132', '2021-01-09 23:34:47');
INSERT INTO `admin_log` VALUES ('678', '1', 'root', '/admin/log?start_time=2021-01-09+23%3A34%3A52&end_time=&keyword=', '[::1]:2132', '2021-01-09 23:34:54');
INSERT INTO `admin_log` VALUES ('679', '1', 'root', '/admin/syslog', '[::1]:2132', '2021-01-09 23:35:16');
INSERT INTO `admin_log` VALUES ('680', '1', 'root', '/admin/syslog?start_time=2021-01-09+23%3A35%3A18&end_time=&keyword=', '[::1]:2132', '2021-01-09 23:35:20');
INSERT INTO `admin_log` VALUES ('681', '1', 'root', '/admin/syslog?start_time=&end_time=&keyword=xmzd', '[::1]:2132', '2021-01-09 23:35:30');
INSERT INTO `admin_log` VALUES ('682', '1', 'root', '/admin/syslog?start_time=&end_time=&keyword=xmzz', '[::1]:2132', '2021-01-09 23:35:34');
INSERT INTO `admin_log` VALUES ('683', '1', 'root', '/admin/syslog?start_time=&end_time=2021-01-06+00%3A00%3A00&keyword=xmzz', '[::1]:2132', '2021-01-09 23:35:42');
INSERT INTO `admin_log` VALUES ('684', '1', 'root', '/admin/syslog?start_time=2021-01-06+00%3A00%3A00&end_time=2021-01-06+00%3A00%3A00&keyword=xmzz', '[::1]:2132', '2021-01-09 23:36:13');
INSERT INTO `admin_log` VALUES ('685', '1', 'root', '/admin/syslog?start_time=2021-01-09+23%3A36%3A55&end_time=&keyword=xmzz', '[::1]:2132', '2021-01-09 23:36:56');
INSERT INTO `admin_log` VALUES ('686', '1', 'root', '/admin/syslog?start_time=2021-01-09+23%3A36%3A55&end_time=&keyword=', '[::1]:2132', '2021-01-09 23:37:02');
INSERT INTO `admin_log` VALUES ('687', '1', 'root', '/admin/syslog?start_time=2021-01-09+23%3A36%3A55&end_time=&keyword=root', '[::1]:2132', '2021-01-09 23:37:23');
INSERT INTO `admin_log` VALUES ('688', '1', 'root', '/admin/syslog?start_time=2021-01-09+23%3A36%3A55&end_time=&keyword=', '[::1]:2132', '2021-01-09 23:38:25');
INSERT INTO `admin_log` VALUES ('689', '1', 'root', '/admin/syslog?start_time=&end_time=2021-01-09+23%3A38%3A36&keyword=', '[::1]:2132', '2021-01-09 23:38:38');
INSERT INTO `admin_log` VALUES ('690', '1', 'root', '/admin/syslog?start_time=2021-01-08+00%3A00%3A00&end_time=2021-01-09+00%3A00%3A00&keyword=', '[::1]:2132', '2021-01-09 23:39:28');
INSERT INTO `admin_log` VALUES ('691', '1', 'root', '/admin/syslog?start_time=2021-01-08+00%3A00%3A00&end_time=2021-01-09+00%3A00%3A00&keyword=sspku', '[::1]:2132', '2021-01-09 23:39:37');
INSERT INTO `admin_log` VALUES ('692', '0', '', '/admin/dologin', '[::1]:2644', '2021-01-09 23:41:03');
INSERT INTO `admin_log` VALUES ('693', '1', 'root', '/admin/syslog', '[::1]:2644', '2021-01-09 23:41:03');
INSERT INTO `admin_log` VALUES ('694', '1', 'root', '/admin/syslog?start_time=2021-01-08+00%3A00%3A00&end_time=2021-01-09+23%3A41%3A09&keyword=sspku', '[::1]:2644', '2021-01-09 23:41:15');
INSERT INTO `admin_log` VALUES ('695', '1', 'root', '/admin/syslog?start_time=2021-01-08+00%3A00%3A00&end_time=2021-01-09+23%3A41%3A09&keyword=', '[::1]:2644', '2021-01-09 23:41:27');
INSERT INTO `admin_log` VALUES ('696', '1', 'root', '/admin/syslog?end_time=2021-01-09+23%3A41%3A09&keyword=&page=2&start_time=2021-01-08+00%3A00%3A00', '[::1]:2644', '2021-01-09 23:41:29');
INSERT INTO `admin_log` VALUES ('697', '1', 'root', '/admin/syslog?end_time=2021-01-09+23%3A41%3A09&keyword=&page=15&start_time=2021-01-08+00%3A00%3A00', '[::1]:2644', '2021-01-09 23:41:33');
INSERT INTO `admin_log` VALUES ('698', '1', 'root', '/admin/syslog?end_time=2021-01-09+23%3A41%3A09&keyword=&page=1&start_time=2021-01-08+00%3A00%3A00', '[::1]:2644', '2021-01-09 23:41:37');
INSERT INTO `admin_log` VALUES ('699', '0', '', '/admin/dologin', '[::1]:3201', '2021-01-09 23:48:12');
INSERT INTO `admin_log` VALUES ('700', '1', 'root', '/admin/syslog', '[::1]:3201', '2021-01-09 23:48:12');
INSERT INTO `admin_log` VALUES ('701', '1', 'root', '/admin/customer', '[::1]:3201', '2021-01-09 23:48:15');
INSERT INTO `admin_log` VALUES ('702', '1', 'root', '/admin/order', '[::1]:3201', '2021-01-09 23:48:17');
INSERT INTO `admin_log` VALUES ('703', '1', 'root', '/admin/syslog?start_time=2021-01-08+00%3A00%3A00&end_time=2021-01-09+23%3A48%3A40&keyword=xmzd', '[::1]:3201', '2021-01-09 23:48:46');
INSERT INTO `admin_log` VALUES ('704', '1', 'root', '/admin/syslog?end_time=2021-01-09+23%3A48%3A40&keyword=xmzd&page=4&start_time=2021-01-08+00%3A00%3A00', '[::1]:3201', '2021-01-09 23:48:51');
INSERT INTO `admin_log` VALUES ('705', '1', 'root', '/admin/syslog?end_time=2021-01-09+23%3A48%3A40&keyword=xmzd&page=1&start_time=2021-01-08+00%3A00%3A00', '[::1]:3201', '2021-01-09 23:48:54');
INSERT INTO `admin_log` VALUES ('706', '1', 'root', '/admin/syslog?start_time=2021-01-08+00%3A00%3A00&end_time=2021-01-09+23%3A48%3A40&keyword=xmz', '[::1]:3201', '2021-01-09 23:48:59');
INSERT INTO `admin_log` VALUES ('707', '1', 'root', '/admin/syslog?start_time=2021-01-08+00%3A00%3A00&end_time=2021-01-09+23%3A48%3A40&keyword=', '[::1]:3201', '2021-01-09 23:49:02');
INSERT INTO `admin_log` VALUES ('708', '1', 'root', '/admin/syslog?end_time=2021-01-09+23%3A48%3A40&keyword=&page=3&start_time=2021-01-08+00%3A00%3A00', '[::1]:3201', '2021-01-09 23:49:07');
INSERT INTO `admin_log` VALUES ('709', '1', 'root', '/admin/syslog', '[::1]:3201', '2021-01-09 23:49:31');
INSERT INTO `admin_log` VALUES ('710', '1', 'root', '/admin/customer', '[::1]:3201', '2021-01-09 23:49:38');
INSERT INTO `admin_log` VALUES ('711', '1', 'root', '/admin/order', '[::1]:3201', '2021-01-09 23:49:46');
INSERT INTO `admin_log` VALUES ('712', '1', 'root', '/admin/goods', '[::1]:3201', '2021-01-09 23:49:55');
INSERT INTO `admin_log` VALUES ('713', '1', 'root', '/admin/administrator', '[::1]:3201', '2021-01-09 23:49:59');
INSERT INTO `admin_log` VALUES ('714', '1', 'root', '/admin/syslog?start_time=&end_time=&keyword=sspku', '[::1]:3201', '2021-01-09 23:50:15');
INSERT INTO `admin_log` VALUES ('715', '1', 'root', '/admin/syslog?start_time=2021-01-09+00%3A00%3A00&end_time=&keyword=sspku', '[::1]:3201', '2021-01-09 23:50:22');
INSERT INTO `admin_log` VALUES ('716', '1', 'root', '/admin/administrator', '[::1]:3201', '2021-01-09 23:50:27');
INSERT INTO `admin_log` VALUES ('717', '1', 'root', '/admin/syslog', '[::1]:3201', '2021-01-09 23:50:28');
INSERT INTO `admin_log` VALUES ('718', '0', '', '/admin/dologin', '[::1]:7008', '2021-01-12 00:13:13');
INSERT INTO `admin_log` VALUES ('719', '1', 'root', '/admin/goods', '[::1]:7008', '2021-01-12 00:13:17');
INSERT INTO `admin_log` VALUES ('720', '1', 'root', '/admin/goods/add_page', '[::1]:7008', '2021-01-12 00:13:19');
INSERT INTO `admin_log` VALUES ('721', '1', 'root', '/admin/goods/add', '[::1]:7008', '2021-01-12 00:13:34');
INSERT INTO `admin_log` VALUES ('722', '1', 'root', '/admin/goods', '[::1]:7008', '2021-01-12 00:13:35');
INSERT INTO `admin_log` VALUES ('723', '0', '', '/admin/dologin', '[::1]:7089', '2021-01-12 00:14:33');
INSERT INTO `admin_log` VALUES ('724', '1', 'root', '/admin/goods', '[::1]:7089', '2021-01-12 00:14:34');
INSERT INTO `admin_log` VALUES ('725', '1', 'root', '/admin/syslog', '[::1]:7089', '2021-01-12 00:14:36');
INSERT INTO `admin_log` VALUES ('726', '1', 'root', '/admin/syslog', '[::1]:7089', '2021-01-12 00:14:48');
INSERT INTO `admin_log` VALUES ('727', '1', 'root', '/admin/syslog?page=4', '[::1]:7089', '2021-01-12 00:14:52');
INSERT INTO `admin_log` VALUES ('728', '1', 'root', '/admin/syslog?start_time=&end_time=&keyword=xmzd', '[::1]:7089', '2021-01-12 00:14:58');
INSERT INTO `admin_log` VALUES ('729', '1', 'root', '/admin/syslog?end_time=&keyword=xmzd&page=2&start_time=', '[::1]:7089', '2021-01-12 00:15:16');
INSERT INTO `admin_log` VALUES ('730', '1', 'root', '/admin/syslog?end_time=&keyword=xmzd&page=3&start_time=', '[::1]:7089', '2021-01-12 00:15:24');
INSERT INTO `admin_log` VALUES ('731', '1', 'root', '/admin/syslog?end_time=&keyword=xmzd&page=1&start_time=', '[::1]:7089', '2021-01-12 00:15:26');
INSERT INTO `admin_log` VALUES ('732', '1', 'root', '/admin/syslog?start_time=&end_time=&keyword=', '[::1]:7089', '2021-01-12 00:15:36');
INSERT INTO `admin_log` VALUES ('733', '1', 'root', '/admin/syslog?start_time=&end_time=&keyword=xmzd', '[::1]:7089', '2021-01-12 00:15:46');
INSERT INTO `admin_log` VALUES ('734', '0', '', '/admin/dologin', '[::1]:7375', '2021-01-12 00:21:14');
INSERT INTO `admin_log` VALUES ('735', '1', 'root', '/admin/goods', '[::1]:7375', '2021-01-12 00:21:15');
INSERT INTO `admin_log` VALUES ('736', '1', 'root', '/admin/syslog', '[::1]:7420', '2021-01-12 00:21:15');
INSERT INTO `admin_log` VALUES ('737', '1', 'root', '/admin/goods/add_page', '[::1]:7420', '2021-01-12 00:21:18');
INSERT INTO `admin_log` VALUES ('738', '1', 'root', '/admin/goods/add', '[::1]:7420', '2021-01-12 00:21:45');
INSERT INTO `admin_log` VALUES ('739', '1', 'root', '/admin/goods', '[::1]:7420', '2021-01-12 00:21:46');
INSERT INTO `admin_log` VALUES ('740', '0', '', '/admin/dologin', '[::1]:8779', '2021-01-12 19:50:12');
INSERT INTO `admin_log` VALUES ('741', '1', 'root', '/admin/goods', '[::1]:8779', '2021-01-12 19:50:13');
INSERT INTO `admin_log` VALUES ('742', '1', 'root', '/admin/goods/edit_page/8', '[::1]:8779', '2021-01-12 19:50:26');
INSERT INTO `admin_log` VALUES ('743', '1', 'root', '/admin/goods/update/8', '[::1]:8779', '2021-01-12 19:50:36');
INSERT INTO `admin_log` VALUES ('744', '1', 'root', '/admin/goods', '[::1]:8779', '2021-01-12 19:50:38');
INSERT INTO `admin_log` VALUES ('745', '0', '', '/admin/dologin', '[::1]:1474', '2021-01-12 20:02:00');
INSERT INTO `admin_log` VALUES ('746', '4', 'xmzd', '/admin/goods', '[::1]:1474', '2021-01-12 20:02:01');
INSERT INTO `admin_log` VALUES ('747', '4', 'xmzd', '/admin/administrator', '[::1]:1474', '2021-01-12 20:02:07');
INSERT INTO `admin_log` VALUES ('748', '4', 'xmzd', '/admin/auth_error', '[::1]:1474', '2021-01-12 20:02:07');
INSERT INTO `admin_log` VALUES ('749', '0', '', '/admin/dologin', '[::1]:8344', '2021-01-13 00:10:41');
INSERT INTO `admin_log` VALUES ('750', '1', 'root', '/admin/customer', '[::1]:8356', '2021-01-13 00:10:46');
INSERT INTO `admin_log` VALUES ('751', '1', 'root', '/admin/customer/add_page', '[::1]:8356', '2021-01-13 00:10:49');
INSERT INTO `admin_log` VALUES ('752', '1', 'root', '/admin/customer/add', '[::1]:8356', '2021-01-13 00:11:23');
INSERT INTO `admin_log` VALUES ('753', '1', 'root', '/admin/customer', '[::1]:8356', '2021-01-13 00:11:24');
INSERT INTO `admin_log` VALUES ('754', '1', 'root', '/admin/syslog', '[::1]:8356', '2021-01-13 00:11:31');
INSERT INTO `admin_log` VALUES ('755', '1', 'root', '/admin/administrator', '[::1]:8356', '2021-01-13 00:11:48');
INSERT INTO `admin_log` VALUES ('756', '0', '', '/admin/dologin', '[::1]:4744', '2021-01-13 00:19:16');
INSERT INTO `admin_log` VALUES ('757', '1', 'root', '/admin/customer', '[::1]:4744', '2021-01-13 00:19:16');
INSERT INTO `admin_log` VALUES ('758', '1', 'root', '/admin/administrator', '[::1]:4757', '2021-01-13 00:19:16');
INSERT INTO `admin_log` VALUES ('759', '1', 'root', '/admin/syslog', '[::1]:4743', '2021-01-13 00:19:16');
INSERT INTO `admin_log` VALUES ('760', '0', '', '/admin/dologin', '[::1]:5097', '2021-01-13 00:24:28');
INSERT INTO `admin_log` VALUES ('761', '4', 'xmzd', '/admin/customer', '[::1]:5097', '2021-01-13 00:24:28');
INSERT INTO `admin_log` VALUES ('762', '4', 'xmzd', '/admin/auth_error', '[::1]:5097', '2021-01-13 00:24:28');
INSERT INTO `admin_log` VALUES ('763', '4', 'xmzd', '/admin/administrator', '[::1]:5119', '2021-01-13 00:24:28');
INSERT INTO `admin_log` VALUES ('764', '4', 'xmzd', '/admin/syslog', '[::1]:5114', '2021-01-13 00:24:28');
INSERT INTO `admin_log` VALUES ('765', '4', 'xmzd', '/admin/auth_error', '[::1]:5119', '2021-01-13 00:24:28');
INSERT INTO `admin_log` VALUES ('766', '4', 'xmzd', '/admin/auth_error', '[::1]:5119', '2021-01-13 00:24:28');
INSERT INTO `admin_log` VALUES ('767', '4', 'xmzd', '/admin/goods', '[::1]:5119', '2021-01-13 00:24:34');
INSERT INTO `admin_log` VALUES ('768', '4', 'xmzd', '/admin/customer', '[::1]:5119', '2021-01-13 00:24:36');
INSERT INTO `admin_log` VALUES ('769', '4', 'xmzd', '/admin/auth_error', '[::1]:5119', '2021-01-13 00:24:36');
INSERT INTO `admin_log` VALUES ('770', '4', 'xmzd', '/admin/order', '[::1]:5119', '2021-01-13 00:24:43');
INSERT INTO `admin_log` VALUES ('771', '4', 'xmzd', '/admin/logout', '[::1]:5119', '2021-01-13 00:24:55');
INSERT INTO `admin_log` VALUES ('772', '0', '', '/admin/dologin', '[::1]:5119', '2021-01-13 00:25:01');
INSERT INTO `admin_log` VALUES ('773', '1', 'root', '/admin/customer', '[::1]:5119', '2021-01-13 00:25:02');
INSERT INTO `admin_log` VALUES ('774', '1', 'root', '/admin/administrator', '[::1]:5119', '2021-01-13 00:25:07');
INSERT INTO `admin_log` VALUES ('775', '1', 'root', '/admin/logout', '[::1]:5119', '2021-01-13 00:25:13');
INSERT INTO `admin_log` VALUES ('776', '0', '', '/admin/dologin', '[::1]:5119', '2021-01-13 00:25:18');
INSERT INTO `admin_log` VALUES ('777', '6', 'sspku', '/admin/customer', '[::1]:5119', '2021-01-13 00:25:18');
INSERT INTO `admin_log` VALUES ('778', '6', 'sspku', '/admin/administrator', '[::1]:5114', '2021-01-13 00:25:19');
INSERT INTO `admin_log` VALUES ('779', '6', 'sspku', '/admin/customer', '[::1]:5114', '2021-01-13 00:25:26');
INSERT INTO `admin_log` VALUES ('780', '6', 'sspku', '/admin/goods', '[::1]:5114', '2021-01-13 00:25:29');
INSERT INTO `admin_log` VALUES ('781', '6', 'sspku', '/admin/auth_error', '[::1]:5114', '2021-01-13 00:25:29');
INSERT INTO `admin_log` VALUES ('782', '6', 'sspku', '/admin/order', '[::1]:5114', '2021-01-13 00:25:34');
INSERT INTO `admin_log` VALUES ('783', '6', 'sspku', '/admin/customer', '[::1]:5114', '2021-01-13 00:26:04');
INSERT INTO `admin_log` VALUES ('784', '6', 'sspku', '/admin/customer', '[::1]:5114', '2021-01-13 00:26:07');
INSERT INTO `admin_log` VALUES ('785', '6', 'sspku', '/admin/syslog', '[::1]:5114', '2021-01-13 00:26:10');
INSERT INTO `admin_log` VALUES ('786', '0', '', '/admin/dologin', '[::1]:11148', '2021-01-14 00:06:48');
INSERT INTO `admin_log` VALUES ('787', '1', 'root', '/admin/syslog', '[::1]:11148', '2021-01-14 00:06:49');
INSERT INTO `admin_log` VALUES ('788', '1', 'root', '/admin/administrator', '[::1]:11148', '2021-01-14 00:06:52');
INSERT INTO `admin_log` VALUES ('789', '1', 'root', '/admin/customer', '[::1]:11148', '2021-01-14 00:06:56');
INSERT INTO `admin_log` VALUES ('790', '0', '', '/admin/dologin', '[::1]:8603', '2021-01-14 00:48:24');
INSERT INTO `admin_log` VALUES ('791', '1', 'root', '/admin/syslog', '[::1]:8603', '2021-01-14 00:48:24');
INSERT INTO `admin_log` VALUES ('792', '1', 'root', '/admin/administrator', '[::1]:8679', '2021-01-14 00:48:24');
INSERT INTO `admin_log` VALUES ('793', '1', 'root', '/admin/customer', '[::1]:8695', '2021-01-14 00:48:24');
INSERT INTO `admin_log` VALUES ('794', '1', 'root', '/admin/order', '[::1]:8695', '2021-01-14 00:48:26');
INSERT INTO `admin_log` VALUES ('795', '0', '', '/admin/dologin', '[::1]:10586', '2021-01-14 23:43:27');
INSERT INTO `admin_log` VALUES ('796', '1', 'root', '/admin/customer', '[::1]:10593', '2021-01-14 23:43:31');
INSERT INTO `admin_log` VALUES ('797', '0', '', '/admin/dologin', '[::1]:11045', '2021-01-14 23:53:38');
INSERT INTO `admin_log` VALUES ('798', '1', 'root', '/admin/customer', '[::1]:11045', '2021-01-14 23:53:39');
INSERT INTO `admin_log` VALUES ('799', '0', '', '/admin/dologin', '[::1]:11803', '2021-01-15 00:10:44');
INSERT INTO `admin_log` VALUES ('800', '1', 'root', '/admin/customer', '[::1]:11803', '2021-01-15 00:10:44');
INSERT INTO `admin_log` VALUES ('801', '1', 'root', '/admin/goods', '[::1]:11803', '2021-01-15 00:10:46');
INSERT INTO `admin_log` VALUES ('802', '1', 'root', '/admin/goods/edit_page/7', '[::1]:11803', '2021-01-15 00:10:49');
INSERT INTO `admin_log` VALUES ('803', '1', 'root', '/admin/goods/update/7', '[::1]:11803', '2021-01-15 00:10:54');
INSERT INTO `admin_log` VALUES ('804', '1', 'root', '/admin/goods', '[::1]:11803', '2021-01-15 00:10:55');
INSERT INTO `admin_log` VALUES ('805', '0', '', '/admin/dologin', '[::1]:7856', '2021-01-15 16:39:04');
INSERT INTO `admin_log` VALUES ('806', '0', '', '/admin/dologin', '[::1]:7856', '2021-01-15 16:39:13');
INSERT INTO `admin_log` VALUES ('807', '0', '', '/admin/dologin', '[::1]:7856', '2021-01-15 16:39:37');
INSERT INTO `admin_log` VALUES ('808', '0', '', '/admin/dologin', '[::1]:7856', '2021-01-15 16:39:43');
INSERT INTO `admin_log` VALUES ('809', '0', '', '/admin/dologin', '[::1]:8039', '2021-01-15 16:42:12');
INSERT INTO `admin_log` VALUES ('810', '0', '', '/admin/dologin', '[::1]:8343', '2021-01-15 16:46:34');
INSERT INTO `admin_log` VALUES ('811', '0', '', '/admin/dologin', '[::1]:8343', '2021-01-15 16:46:40');
INSERT INTO `admin_log` VALUES ('812', '0', '', '/admin/dologin', '[::1]:8691', '2021-01-15 16:50:46');
INSERT INTO `admin_log` VALUES ('813', '0', '', '/admin/dologin', '[::1]:8691', '2021-01-15 16:50:52');
INSERT INTO `admin_log` VALUES ('814', '0', '', '/admin/dologin', '[::1]:8691', '2021-01-15 16:50:58');
INSERT INTO `admin_log` VALUES ('815', '0', '', '/admin/dologin', '[::1]:2430', '2021-01-15 19:38:15');
INSERT INTO `admin_log` VALUES ('816', '0', '', '/admin/dologin', '[::1]:2430', '2021-01-15 19:38:31');
INSERT INTO `admin_log` VALUES ('817', '0', '', '/admin/dologin', '[::1]:2470', '2021-01-15 19:39:13');
INSERT INTO `admin_log` VALUES ('818', '0', '', '/admin/dologin', '[::1]:2470', '2021-01-15 19:39:20');
INSERT INTO `admin_log` VALUES ('819', '1', 'root', '/admin/customer', '[::1]:2470', '2021-01-15 19:39:21');
INSERT INTO `admin_log` VALUES ('820', '1', 'root', '/admin/goods', '[::1]:2472', '2021-01-15 19:39:21');
INSERT INTO `admin_log` VALUES ('821', '1', 'root', '/admin/person', '[::1]:2472', '2021-01-15 19:39:26');
INSERT INTO `admin_log` VALUES ('822', '1', 'root', '/admin/person', '[::1]:2472', '2021-01-15 19:39:39');
INSERT INTO `admin_log` VALUES ('823', '1', 'root', '/admin/administrator', '[::1]:2472', '2021-01-15 19:39:42');
INSERT INTO `admin_log` VALUES ('824', '1', 'root', '/admin/administrator/edit_page/4', '[::1]:2472', '2021-01-15 19:39:47');
INSERT INTO `admin_log` VALUES ('825', '1', 'root', '/admin/administrator/update/4', '[::1]:2472', '2021-01-15 19:39:58');
INSERT INTO `admin_log` VALUES ('826', '1', 'root', '/admin/administrator', '[::1]:2472', '2021-01-15 19:39:59');
INSERT INTO `admin_log` VALUES ('827', '1', 'root', '/admin/administrator/edit_page/6', '[::1]:2472', '2021-01-15 19:40:01');
INSERT INTO `admin_log` VALUES ('828', '1', 'root', '/admin/administrator/update/6', '[::1]:2472', '2021-01-15 19:40:11');
INSERT INTO `admin_log` VALUES ('829', '1', 'root', '/admin/administrator', '[::1]:2472', '2021-01-15 19:40:12');
INSERT INTO `admin_log` VALUES ('830', '0', '', '/admin/dologin', '[::1]:2673', '2021-01-15 19:44:28');
INSERT INTO `admin_log` VALUES ('831', '1', 'root', '/admin/administrator', '[::1]:2673', '2021-01-15 19:44:29');
INSERT INTO `admin_log` VALUES ('832', '1', 'root', '/admin/administrator/edit_page/6', '[::1]:2673', '2021-01-15 19:44:32');
INSERT INTO `admin_log` VALUES ('833', '1', 'root', '/admin/administrator/update/6', '[::1]:2673', '2021-01-15 19:44:45');
INSERT INTO `admin_log` VALUES ('834', '1', 'root', '/admin/person', '[::1]:2673', '2021-01-15 19:44:51');
INSERT INTO `admin_log` VALUES ('835', '1', 'root', '/admin/administrator/add_page', '[::1]:2673', '2021-01-15 19:45:17');
INSERT INTO `admin_log` VALUES ('836', '1', 'root', '/admin/administrator/add', '[::1]:2673', '2021-01-15 19:46:03');
INSERT INTO `admin_log` VALUES ('837', '1', 'root', '/admin/administrator/add', '[::1]:2673', '2021-01-15 19:46:19');
INSERT INTO `admin_log` VALUES ('838', '1', 'root', '/admin/administrator/add', '[::1]:2673', '2021-01-15 19:46:28');
INSERT INTO `admin_log` VALUES ('839', '1', 'root', '/admin/administrator/add', '[::1]:2673', '2021-01-15 19:46:34');
INSERT INTO `admin_log` VALUES ('840', '1', 'root', '/admin/administrator', '[::1]:2673', '2021-01-15 19:46:35');
INSERT INTO `admin_log` VALUES ('841', '1', 'root', '/admin/administrator/update_status/8', '[::1]:2673', '2021-01-15 19:46:40');
INSERT INTO `admin_log` VALUES ('842', '1', 'root', '/admin/logout', '[::1]:2673', '2021-01-15 19:46:47');
INSERT INTO `admin_log` VALUES ('843', '0', '', '/admin/dologin', '[::1]:2673', '2021-01-15 19:46:58');
INSERT INTO `admin_log` VALUES ('844', '0', '', '/admin/dologin', '[::1]:4067', '2021-01-15 20:54:20');
INSERT INTO `admin_log` VALUES ('845', '1', 'root', '/admin/administrator', '[::1]:4067', '2021-01-15 20:54:21');
INSERT INTO `admin_log` VALUES ('846', '1', 'root', '/admin/logout', '[::1]:6318', '2021-01-15 21:08:47');
INSERT INTO `admin_log` VALUES ('847', '0', '', '/admin/dologin', '[::1]:6318', '2021-01-15 21:09:23');
INSERT INTO `admin_log` VALUES ('848', '1', 'root', '/admin/person', '[::1]:6318', '2021-01-15 21:09:50');
INSERT INTO `admin_log` VALUES ('849', '1', 'root', '/admin/administrator', '[::1]:6318', '2021-01-15 21:11:17');
INSERT INTO `admin_log` VALUES ('850', '1', 'root', '/admin/administrator/edit_page/8', '[::1]:6318', '2021-01-15 21:13:26');
INSERT INTO `admin_log` VALUES ('851', '1', 'root', '/admin/person', '[::1]:6318', '2021-01-15 21:14:37');
INSERT INTO `admin_log` VALUES ('852', '1', 'root', '/admin/syslog', '[::1]:6318', '2021-01-15 21:15:17');
INSERT INTO `admin_log` VALUES ('853', '1', 'root', '/admin/goods', '[::1]:6318', '2021-01-15 21:16:32');
INSERT INTO `admin_log` VALUES ('854', '0', '', '/admin/dologin', '[::1]:2091', '2021-01-15 22:54:38');
INSERT INTO `admin_log` VALUES ('855', '1', 'root', '/admin/goods', '[::1]:2091', '2021-01-15 22:54:39');
INSERT INTO `admin_log` VALUES ('856', '1', 'root', '/admin/goods/edit_page/8', '[::1]:2091', '2021-01-15 22:54:40');
INSERT INTO `admin_log` VALUES ('857', '1', 'root', '/admin/customer', '[::1]:2091', '2021-01-15 22:55:45');
INSERT INTO `admin_log` VALUES ('858', '1', 'root', '/admin/customer/add_page', '[::1]:2091', '2021-01-15 22:57:55');
INSERT INTO `admin_log` VALUES ('859', '1', 'root', '/admin/order', '[::1]:2091', '2021-01-15 22:58:09');
INSERT INTO `admin_log` VALUES ('860', '1', 'root', '/admin/order?start_time=&end_time=&phone=&goods_id=8', '[::1]:2091', '2021-01-15 23:01:04');
INSERT INTO `admin_log` VALUES ('861', '1', 'root', '/admin/goods', '[::1]:2091', '2021-01-15 23:03:18');
INSERT INTO `admin_log` VALUES ('862', '1', 'root', '/admin/goods/add_page', '[::1]:2091', '2021-01-15 23:03:19');
INSERT INTO `admin_log` VALUES ('863', '1', 'root', '/admin/goods/add', '[::1]:2091', '2021-01-15 23:03:48');
INSERT INTO `admin_log` VALUES ('864', '1', 'root', '/admin/goods', '[::1]:2091', '2021-01-15 23:03:49');
INSERT INTO `admin_log` VALUES ('865', '0', '', '/admin/dologin', '[::1]:14823', '2021-01-18 19:04:26');
INSERT INTO `admin_log` VALUES ('866', '1', 'root', '/admin/goods', '[::1]:14823', '2021-01-18 19:04:26');
INSERT INTO `admin_log` VALUES ('867', '1', 'root', '/admin/customer', '[::1]:14823', '2021-01-18 19:05:00');
INSERT INTO `admin_log` VALUES ('868', '0', '', '/admin/dologin', '[::1]:1603', '2021-01-18 20:53:35');
INSERT INTO `admin_log` VALUES ('869', '1', 'root', '/admin/goods', '[::1]:1603', '2021-01-18 20:53:36');
INSERT INTO `admin_log` VALUES ('870', '1', 'root', '/admin/customer', '[::1]:1619', '2021-01-18 20:53:36');
INSERT INTO `admin_log` VALUES ('871', '1', 'root', '/admin/administrator', '[::1]:1619', '2021-01-18 20:53:40');
INSERT INTO `admin_log` VALUES ('872', '1', 'root', '/admin/syslog', '[::1]:1619', '2021-01-18 20:53:45');
INSERT INTO `admin_log` VALUES ('873', '1', 'root', '/admin/goods', '[::1]:1619', '2021-01-18 20:53:51');
INSERT INTO `admin_log` VALUES ('874', '1', 'root', '/admin/goods/add_page', '[::1]:1619', '2021-01-18 20:54:01');
INSERT INTO `admin_log` VALUES ('875', '1', 'root', '/admin/goods/add', '[::1]:1619', '2021-01-18 20:54:29');
INSERT INTO `admin_log` VALUES ('876', '1', 'root', '/admin/goods', '[::1]:1619', '2021-01-18 20:54:30');
INSERT INTO `admin_log` VALUES ('877', '1', 'root', '/admin/customer', '[::1]:1619', '2021-01-18 20:54:32');
INSERT INTO `admin_log` VALUES ('878', '1', 'root', '/admin/customer/add_page', '[::1]:1619', '2021-01-18 20:54:34');
INSERT INTO `admin_log` VALUES ('879', '1', 'root', '/admin/customer/add', '[::1]:1619', '2021-01-18 20:54:52');
INSERT INTO `admin_log` VALUES ('880', '1', 'root', '/admin/customer', '[::1]:1619', '2021-01-18 20:54:53');
INSERT INTO `admin_log` VALUES ('881', '1', 'root', '/admin/order', '[::1]:1619', '2021-01-18 20:54:56');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1', '超级管理员', '所有权限');
INSERT INTO `admin_role` VALUES ('2', '高级管理员', '系统管理');
INSERT INTO `admin_role` VALUES ('3', '商品管理员', '商品管理');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '这是状态字段',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'root', '1cfaff2bdf5ff9469f2299dcf3f364e9', '13691252188', '123@qq.edu.cn', '1', '1');
INSERT INTO `admin_user` VALUES ('4', 'xmzd', '1cfaff2bdf5ff9469f2299dcf3f364e9', '13691252188', 'xmz@pku.com', '1', '3');
INSERT INTO `admin_user` VALUES ('6', 'sspku', '1cfaff2bdf5ff9469f2299dcf3f364e9', '13691252188', 'adsasd@qq.com', '1', '2');
INSERT INTO `admin_user` VALUES ('8', 'zhou', '1cfaff2bdf5ff9469f2299dcf3f364e9', '13691252188', '561651@qq.com', '0', '2');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL DEFAULT '',
  `customer_name` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '18801052280', '张三', 'OCTCDIKE');
INSERT INTO `customer` VALUES ('3', '18801052281', '李四', 'YCDLUENX');
INSERT INTO `customer` VALUES ('4', '13691252188', '周星星', 'WALBIXZX');
INSERT INTO `customer` VALUES ('5', '18801100110', '老刘', 'QGKVJSUK');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) NOT NULL DEFAULT '',
  `goods_price` double NOT NULL DEFAULT '0',
  `goods_number` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '肉包子', '18', '100', '1', '2021-01-08 00:00:00', '2021-01-08 16:00:00');
INSERT INTO `goods` VALUES ('2', '车厘子', '19.8', '200', '4', '2021-01-09 10:27:16', '2021-01-09 15:25:51');
INSERT INTO `goods` VALUES ('5', '棒棒糖', '1', '100', '1', '2021-01-09 11:19:00', '2021-01-09 11:20:09');
INSERT INTO `goods` VALUES ('6', '栗子v2', '12.5', '1000', '1', '2021-01-09 00:00:00', '2021-01-09 12:03:18');
INSERT INTO `goods` VALUES ('7', '大米', '12', '994', '1', '2021-01-13 00:00:00', '2021-01-16 00:00:00');
INSERT INTO `goods` VALUES ('8', '小米', '9.8', '998', '1', '2021-01-12 00:00:00', '2021-01-12 22:00:00');
INSERT INTO `goods` VALUES ('9', '玉米', '6.8', '999', '1', '2021-01-16 00:00:00', '2021-01-30 00:00:00');
INSERT INTO `goods` VALUES ('10', '大葱', '4.4', '500', '1', '2021-01-25 00:00:00', '2021-02-05 00:00:00');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL DEFAULT '',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '18801052280', '1', '2021-01-09 22:39:44');
INSERT INTO `order` VALUES ('2', '18801052281', '2', '2021-01-08 22:40:15');
INSERT INTO `order` VALUES ('3', '18801052280', '8', '2021-01-12 21:53:16');
INSERT INTO `order` VALUES ('4', '18801052280', '8', '2021-01-12 22:02:02');
INSERT INTO `order` VALUES ('5', '13691252188', '7', '2021-01-13 00:12:21');
INSERT INTO `order` VALUES ('6', '13691252188', '7', '2021-01-14 00:47:30');
INSERT INTO `order` VALUES ('7', '18801052281', '7', '2021-01-14 23:44:05');
INSERT INTO `order` VALUES ('8', '13691252188', '7', '2021-01-14 23:54:00');
INSERT INTO `order` VALUES ('9', '13691252188', '7', '2021-01-14 23:54:36');
INSERT INTO `order` VALUES ('10', '13691252188', '7', '2021-01-14 23:57:23');
INSERT INTO `order` VALUES ('11', '18801052281', '9', '2021-01-18 19:05:49');
