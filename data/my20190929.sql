/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : dj_hospital

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-09-29 00:26:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dj_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `dj_admin_menu`;
CREATE TABLE `dj_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `controller` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器名',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '应用名',
  `action` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '额外参数',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台菜单表';

-- ----------------------------
-- Records of dj_admin_menu
-- ----------------------------
INSERT INTO `dj_admin_menu` VALUES ('1', '0', '0', 'Plugin', '插件中心', '0', '20', 'admin', 'default', '', 'cloud', '插件中心');
INSERT INTO `dj_admin_menu` VALUES ('2', '1', '1', 'Hook', '钩子管理', '1', '10000', 'admin', 'index', '', '', '钩子管理');
INSERT INTO `dj_admin_menu` VALUES ('3', '2', '1', 'Hook', '钩子插件管理', '0', '10000', 'admin', 'plugins', '', '', '钩子插件管理');
INSERT INTO `dj_admin_menu` VALUES ('4', '2', '2', 'Hook', '钩子插件排序', '0', '10000', 'admin', 'pluginListOrder', '', '', '钩子插件排序');
INSERT INTO `dj_admin_menu` VALUES ('5', '2', '1', 'Hook', '同步钩子', '0', '10000', 'admin', 'sync', '', '', '同步钩子');
INSERT INTO `dj_admin_menu` VALUES ('6', '0', '0', 'Setting', '系统管理', '1', '99', 'admin', 'default', '', 'cogs', '系统设置入口');
INSERT INTO `dj_admin_menu` VALUES ('7', '6', '1', 'Link', '友情链接', '0', '50', 'admin', 'index', '', '', '友情链接管理');
INSERT INTO `dj_admin_menu` VALUES ('8', '7', '1', 'Link', '添加友情链接', '0', '10000', 'admin', 'add', '', '', '添加友情链接');
INSERT INTO `dj_admin_menu` VALUES ('9', '7', '2', 'Link', '添加友情链接提交保存', '0', '10000', 'admin', 'addPost', '', '', '添加友情链接提交保存');
INSERT INTO `dj_admin_menu` VALUES ('10', '7', '1', 'Link', '编辑友情链接', '0', '10000', 'admin', 'edit', '', '', '编辑友情链接');
INSERT INTO `dj_admin_menu` VALUES ('11', '7', '2', 'Link', '编辑友情链接提交保存', '0', '10000', 'admin', 'editPost', '', '', '编辑友情链接提交保存');
INSERT INTO `dj_admin_menu` VALUES ('12', '7', '2', 'Link', '删除友情链接', '0', '10000', 'admin', 'delete', '', '', '删除友情链接');
INSERT INTO `dj_admin_menu` VALUES ('13', '7', '2', 'Link', '友情链接排序', '0', '10000', 'admin', 'listOrder', '', '', '友情链接排序');
INSERT INTO `dj_admin_menu` VALUES ('14', '7', '2', 'Link', '友情链接显示隐藏', '0', '10000', 'admin', 'toggle', '', '', '友情链接显示隐藏');
INSERT INTO `dj_admin_menu` VALUES ('15', '6', '1', 'Mailer', '邮箱配置', '0', '10', 'admin', 'index', '', '', '邮箱配置');
INSERT INTO `dj_admin_menu` VALUES ('16', '15', '2', 'Mailer', '邮箱配置提交保存', '0', '10000', 'admin', 'indexPost', '', '', '邮箱配置提交保存');
INSERT INTO `dj_admin_menu` VALUES ('17', '15', '1', 'Mailer', '邮件模板', '0', '10000', 'admin', 'template', '', '', '邮件模板');
INSERT INTO `dj_admin_menu` VALUES ('18', '15', '2', 'Mailer', '邮件模板提交', '0', '10000', 'admin', 'templatePost', '', '', '邮件模板提交');
INSERT INTO `dj_admin_menu` VALUES ('19', '15', '1', 'Mailer', '邮件发送测试', '0', '10000', 'admin', 'test', '', '', '邮件发送测试');
INSERT INTO `dj_admin_menu` VALUES ('20', '6', '1', 'Menu', '后台菜单', '0', '10000', 'admin', 'index', '', '', '后台菜单管理');
INSERT INTO `dj_admin_menu` VALUES ('21', '20', '1', 'Menu', '所有菜单', '0', '10000', 'admin', 'lists', '', '', '后台所有菜单列表');
INSERT INTO `dj_admin_menu` VALUES ('22', '20', '1', 'Menu', '后台菜单添加', '0', '10000', 'admin', 'add', '', '', '后台菜单添加');
INSERT INTO `dj_admin_menu` VALUES ('23', '20', '2', 'Menu', '后台菜单添加提交保存', '0', '10000', 'admin', 'addPost', '', '', '后台菜单添加提交保存');
INSERT INTO `dj_admin_menu` VALUES ('24', '20', '1', 'Menu', '后台菜单编辑', '0', '10000', 'admin', 'edit', '', '', '后台菜单编辑');
INSERT INTO `dj_admin_menu` VALUES ('25', '20', '2', 'Menu', '后台菜单编辑提交保存', '0', '10000', 'admin', 'editPost', '', '', '后台菜单编辑提交保存');
INSERT INTO `dj_admin_menu` VALUES ('26', '20', '2', 'Menu', '后台菜单删除', '0', '10000', 'admin', 'delete', '', '', '后台菜单删除');
INSERT INTO `dj_admin_menu` VALUES ('27', '20', '2', 'Menu', '后台菜单排序', '0', '10000', 'admin', 'listOrder', '', '', '后台菜单排序');
INSERT INTO `dj_admin_menu` VALUES ('28', '20', '1', 'Menu', '导入新后台菜单', '0', '10000', 'admin', 'getActions', '', '', '导入新后台菜单');
INSERT INTO `dj_admin_menu` VALUES ('29', '6', '1', 'Nav', '导航管理', '0', '30', 'admin', 'index', '', '', '导航管理');
INSERT INTO `dj_admin_menu` VALUES ('30', '29', '1', 'Nav', '添加导航', '0', '10000', 'admin', 'add', '', '', '添加导航');
INSERT INTO `dj_admin_menu` VALUES ('31', '29', '2', 'Nav', '添加导航提交保存', '0', '10000', 'admin', 'addPost', '', '', '添加导航提交保存');
INSERT INTO `dj_admin_menu` VALUES ('32', '29', '1', 'Nav', '编辑导航', '0', '10000', 'admin', 'edit', '', '', '编辑导航');
INSERT INTO `dj_admin_menu` VALUES ('33', '29', '2', 'Nav', '编辑导航提交保存', '0', '10000', 'admin', 'editPost', '', '', '编辑导航提交保存');
INSERT INTO `dj_admin_menu` VALUES ('34', '29', '2', 'Nav', '删除导航', '0', '10000', 'admin', 'delete', '', '', '删除导航');
INSERT INTO `dj_admin_menu` VALUES ('35', '29', '1', 'NavMenu', '导航菜单', '0', '10000', 'admin', 'index', '', '', '导航菜单');
INSERT INTO `dj_admin_menu` VALUES ('36', '35', '1', 'NavMenu', '添加导航菜单', '0', '10000', 'admin', 'add', '', '', '添加导航菜单');
INSERT INTO `dj_admin_menu` VALUES ('37', '35', '2', 'NavMenu', '添加导航菜单提交保存', '0', '10000', 'admin', 'addPost', '', '', '添加导航菜单提交保存');
INSERT INTO `dj_admin_menu` VALUES ('38', '35', '1', 'NavMenu', '编辑导航菜单', '0', '10000', 'admin', 'edit', '', '', '编辑导航菜单');
INSERT INTO `dj_admin_menu` VALUES ('39', '35', '2', 'NavMenu', '编辑导航菜单提交保存', '0', '10000', 'admin', 'editPost', '', '', '编辑导航菜单提交保存');
INSERT INTO `dj_admin_menu` VALUES ('40', '35', '2', 'NavMenu', '删除导航菜单', '0', '10000', 'admin', 'delete', '', '', '删除导航菜单');
INSERT INTO `dj_admin_menu` VALUES ('41', '35', '2', 'NavMenu', '导航菜单排序', '0', '10000', 'admin', 'listOrder', '', '', '导航菜单排序');
INSERT INTO `dj_admin_menu` VALUES ('42', '1', '1', 'Plugin', '插件列表', '1', '10000', 'admin', 'index', '', '', '插件列表');
INSERT INTO `dj_admin_menu` VALUES ('43', '42', '2', 'Plugin', '插件启用禁用', '0', '10000', 'admin', 'toggle', '', '', '插件启用禁用');
INSERT INTO `dj_admin_menu` VALUES ('44', '42', '1', 'Plugin', '插件设置', '0', '10000', 'admin', 'setting', '', '', '插件设置');
INSERT INTO `dj_admin_menu` VALUES ('45', '42', '2', 'Plugin', '插件设置提交', '0', '10000', 'admin', 'settingPost', '', '', '插件设置提交');
INSERT INTO `dj_admin_menu` VALUES ('46', '42', '2', 'Plugin', '插件安装', '0', '10000', 'admin', 'install', '', '', '插件安装');
INSERT INTO `dj_admin_menu` VALUES ('47', '42', '2', 'Plugin', '插件更新', '0', '10000', 'admin', 'update', '', '', '插件更新');
INSERT INTO `dj_admin_menu` VALUES ('48', '42', '2', 'Plugin', '卸载插件', '0', '10000', 'admin', 'uninstall', '', '', '卸载插件');
INSERT INTO `dj_admin_menu` VALUES ('49', '0', '0', 'User', '员工管理', '1', '98', 'admin', 'default', '', '', '管理组');
INSERT INTO `dj_admin_menu` VALUES ('50', '49', '1', 'Rbac', '角色管理', '1', '1', 'admin', 'index', '', '', '角色管理');
INSERT INTO `dj_admin_menu` VALUES ('51', '50', '1', 'Rbac', '添加角色', '1', '10000', 'admin', 'roleAdd', '', '', '添加角色');
INSERT INTO `dj_admin_menu` VALUES ('52', '50', '2', 'Rbac', '添加角色提交', '0', '10000', 'admin', 'roleAddPost', '', '', '添加角色提交');
INSERT INTO `dj_admin_menu` VALUES ('53', '50', '1', 'Rbac', '编辑角色', '1', '10000', 'admin', 'roleEdit', '', '', '编辑角色');
INSERT INTO `dj_admin_menu` VALUES ('54', '50', '2', 'Rbac', '编辑角色提交', '0', '10000', 'admin', 'roleEditPost', '', '', '编辑角色提交');
INSERT INTO `dj_admin_menu` VALUES ('55', '50', '2', 'Rbac', '删除角色', '1', '10000', 'admin', 'roleDelete', '', '', '删除角色');
INSERT INTO `dj_admin_menu` VALUES ('56', '50', '1', 'Rbac', '设置角色权限', '1', '10000', 'admin', 'authorize', '', '', '设置角色权限');
INSERT INTO `dj_admin_menu` VALUES ('57', '50', '2', 'Rbac', '角色授权提交', '0', '10000', 'admin', 'authorizePost', '', '', '角色授权提交');
INSERT INTO `dj_admin_menu` VALUES ('58', '0', '1', 'RecycleBin', '回收站', '0', '42', 'admin', 'index', '', '', '回收站');
INSERT INTO `dj_admin_menu` VALUES ('59', '58', '2', 'RecycleBin', '回收站还原', '0', '10000', 'admin', 'restore', '', '', '回收站还原');
INSERT INTO `dj_admin_menu` VALUES ('60', '58', '2', 'RecycleBin', '回收站彻底删除', '0', '10000', 'admin', 'delete', '', '', '回收站彻底删除');
INSERT INTO `dj_admin_menu` VALUES ('61', '6', '1', 'Route', 'URL美化', '0', '10000', 'admin', 'index', '', '', 'URL规则管理');
INSERT INTO `dj_admin_menu` VALUES ('62', '61', '1', 'Route', '添加路由规则', '0', '10000', 'admin', 'add', '', '', '添加路由规则');
INSERT INTO `dj_admin_menu` VALUES ('63', '61', '2', 'Route', '添加路由规则提交', '0', '10000', 'admin', 'addPost', '', '', '添加路由规则提交');
INSERT INTO `dj_admin_menu` VALUES ('64', '61', '1', 'Route', '路由规则编辑', '0', '10000', 'admin', 'edit', '', '', '路由规则编辑');
INSERT INTO `dj_admin_menu` VALUES ('65', '61', '2', 'Route', '路由规则编辑提交', '0', '10000', 'admin', 'editPost', '', '', '路由规则编辑提交');
INSERT INTO `dj_admin_menu` VALUES ('66', '61', '2', 'Route', '路由规则删除', '0', '10000', 'admin', 'delete', '', '', '路由规则删除');
INSERT INTO `dj_admin_menu` VALUES ('67', '61', '2', 'Route', '路由规则禁用', '0', '10000', 'admin', 'ban', '', '', '路由规则禁用');
INSERT INTO `dj_admin_menu` VALUES ('68', '61', '2', 'Route', '路由规则启用', '0', '10000', 'admin', 'open', '', '', '路由规则启用');
INSERT INTO `dj_admin_menu` VALUES ('69', '61', '2', 'Route', '路由规则排序', '0', '10000', 'admin', 'listOrder', '', '', '路由规则排序');
INSERT INTO `dj_admin_menu` VALUES ('70', '61', '1', 'Route', '选择URL', '0', '10000', 'admin', 'select', '', '', '选择URL');
INSERT INTO `dj_admin_menu` VALUES ('71', '6', '1', 'Setting', '系统设置', '1', '0', 'admin', 'site', '', '', '网站信息');
INSERT INTO `dj_admin_menu` VALUES ('72', '71', '2', 'Setting', '网站信息设置提交', '0', '10000', 'admin', 'sitePost', '', '', '网站信息设置提交');
INSERT INTO `dj_admin_menu` VALUES ('73', '6', '1', 'Setting', '密码修改', '1', '10000', 'admin', 'password', '', '', '密码修改');
INSERT INTO `dj_admin_menu` VALUES ('74', '73', '2', 'Setting', '密码修改提交', '0', '10000', 'admin', 'passwordPost', '', '', '密码修改提交');
INSERT INTO `dj_admin_menu` VALUES ('75', '6', '1', 'Setting', '上传设置', '0', '10000', 'admin', 'upload', '', '', '上传设置');
INSERT INTO `dj_admin_menu` VALUES ('76', '75', '2', 'Setting', '上传设置提交', '0', '10000', 'admin', 'uploadPost', '', '', '上传设置提交');
INSERT INTO `dj_admin_menu` VALUES ('77', '6', '1', 'Setting', '清除缓存', '0', '10000', 'admin', 'clearCache', '', '', '清除缓存');
INSERT INTO `dj_admin_menu` VALUES ('78', '6', '1', 'Slide', '幻灯片管理', '0', '40', 'admin', 'index', '', '', '幻灯片管理');
INSERT INTO `dj_admin_menu` VALUES ('79', '78', '1', 'Slide', '添加幻灯片', '0', '10000', 'admin', 'add', '', '', '添加幻灯片');
INSERT INTO `dj_admin_menu` VALUES ('80', '78', '2', 'Slide', '添加幻灯片提交', '0', '10000', 'admin', 'addPost', '', '', '添加幻灯片提交');
INSERT INTO `dj_admin_menu` VALUES ('81', '78', '1', 'Slide', '编辑幻灯片', '0', '10000', 'admin', 'edit', '', '', '编辑幻灯片');
INSERT INTO `dj_admin_menu` VALUES ('82', '78', '2', 'Slide', '编辑幻灯片提交', '0', '10000', 'admin', 'editPost', '', '', '编辑幻灯片提交');
INSERT INTO `dj_admin_menu` VALUES ('83', '78', '2', 'Slide', '删除幻灯片', '0', '10000', 'admin', 'delete', '', '', '删除幻灯片');
INSERT INTO `dj_admin_menu` VALUES ('84', '78', '1', 'SlideItem', '幻灯片页面列表', '0', '10000', 'admin', 'index', '', '', '幻灯片页面列表');
INSERT INTO `dj_admin_menu` VALUES ('85', '84', '1', 'SlideItem', '幻灯片页面添加', '0', '10000', 'admin', 'add', '', '', '幻灯片页面添加');
INSERT INTO `dj_admin_menu` VALUES ('86', '84', '2', 'SlideItem', '幻灯片页面添加提交', '0', '10000', 'admin', 'addPost', '', '', '幻灯片页面添加提交');
INSERT INTO `dj_admin_menu` VALUES ('87', '84', '1', 'SlideItem', '幻灯片页面编辑', '0', '10000', 'admin', 'edit', '', '', '幻灯片页面编辑');
INSERT INTO `dj_admin_menu` VALUES ('88', '84', '2', 'SlideItem', '幻灯片页面编辑提交', '0', '10000', 'admin', 'editPost', '', '', '幻灯片页面编辑提交');
INSERT INTO `dj_admin_menu` VALUES ('89', '84', '2', 'SlideItem', '幻灯片页面删除', '0', '10000', 'admin', 'delete', '', '', '幻灯片页面删除');
INSERT INTO `dj_admin_menu` VALUES ('90', '84', '2', 'SlideItem', '幻灯片页面隐藏', '0', '10000', 'admin', 'ban', '', '', '幻灯片页面隐藏');
INSERT INTO `dj_admin_menu` VALUES ('91', '84', '2', 'SlideItem', '幻灯片页面显示', '0', '10000', 'admin', 'cancelBan', '', '', '幻灯片页面显示');
INSERT INTO `dj_admin_menu` VALUES ('92', '84', '2', 'SlideItem', '幻灯片页面排序', '0', '10000', 'admin', 'listOrder', '', '', '幻灯片页面排序');
INSERT INTO `dj_admin_menu` VALUES ('93', '6', '1', 'Storage', '文件存储', '0', '10000', 'admin', 'index', '', '', '文件存储');
INSERT INTO `dj_admin_menu` VALUES ('94', '93', '2', 'Storage', '文件存储设置提交', '0', '10000', 'admin', 'settingPost', '', '', '文件存储设置提交');
INSERT INTO `dj_admin_menu` VALUES ('95', '6', '1', 'Theme', '模板管理', '0', '20', 'admin', 'index', '', '', '模板管理');
INSERT INTO `dj_admin_menu` VALUES ('96', '95', '1', 'Theme', '安装模板', '0', '10000', 'admin', 'install', '', '', '安装模板');
INSERT INTO `dj_admin_menu` VALUES ('97', '95', '2', 'Theme', '卸载模板', '0', '10000', 'admin', 'uninstall', '', '', '卸载模板');
INSERT INTO `dj_admin_menu` VALUES ('98', '95', '2', 'Theme', '模板安装', '0', '10000', 'admin', 'installTheme', '', '', '模板安装');
INSERT INTO `dj_admin_menu` VALUES ('99', '95', '2', 'Theme', '模板更新', '0', '10000', 'admin', 'update', '', '', '模板更新');
INSERT INTO `dj_admin_menu` VALUES ('100', '95', '2', 'Theme', '启用模板', '0', '10000', 'admin', 'active', '', '', '启用模板');
INSERT INTO `dj_admin_menu` VALUES ('101', '95', '1', 'Theme', '模板文件列表', '0', '10000', 'admin', 'files', '', '', '启用模板');
INSERT INTO `dj_admin_menu` VALUES ('102', '95', '1', 'Theme', '模板文件设置', '0', '10000', 'admin', 'fileSetting', '', '', '模板文件设置');
INSERT INTO `dj_admin_menu` VALUES ('103', '95', '1', 'Theme', '模板文件数组数据列表', '0', '10000', 'admin', 'fileArrayData', '', '', '模板文件数组数据列表');
INSERT INTO `dj_admin_menu` VALUES ('104', '95', '2', 'Theme', '模板文件数组数据添加编辑', '0', '10000', 'admin', 'fileArrayDataEdit', '', '', '模板文件数组数据添加编辑');
INSERT INTO `dj_admin_menu` VALUES ('105', '95', '2', 'Theme', '模板文件数组数据添加编辑提交保存', '0', '10000', 'admin', 'fileArrayDataEditPost', '', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO `dj_admin_menu` VALUES ('106', '95', '2', 'Theme', '模板文件数组数据删除', '0', '10000', 'admin', 'fileArrayDataDelete', '', '', '模板文件数组数据删除');
INSERT INTO `dj_admin_menu` VALUES ('107', '95', '2', 'Theme', '模板文件编辑提交保存', '0', '10000', 'admin', 'settingPost', '', '', '模板文件编辑提交保存');
INSERT INTO `dj_admin_menu` VALUES ('108', '95', '1', 'Theme', '模板文件设置数据源', '0', '10000', 'admin', 'dataSource', '', '', '模板文件设置数据源');
INSERT INTO `dj_admin_menu` VALUES ('109', '95', '1', 'Theme', '模板设计', '0', '10000', 'admin', 'design', '', '', '模板设计');
INSERT INTO `dj_admin_menu` VALUES ('110', '0', '0', 'AdminIndex', '客户管理', '1', '10', 'user', 'default', '', 'group', '用户管理');
INSERT INTO `dj_admin_menu` VALUES ('111', '49', '1', 'User', '员工查询', '1', '3', 'admin', 'index', '', '', '管理员管理');
INSERT INTO `dj_admin_menu` VALUES ('112', '49', '0', 'User', '新增员工', '1', '2', 'admin', 'add', '', '', '管理员添加');
INSERT INTO `dj_admin_menu` VALUES ('113', '111', '2', 'User', '管理员添加提交', '1', '10000', 'admin', 'addPost', '', '', '管理员添加提交');
INSERT INTO `dj_admin_menu` VALUES ('114', '111', '1', 'User', '管理员编辑', '1', '10000', 'admin', 'edit', '', '', '管理员编辑');
INSERT INTO `dj_admin_menu` VALUES ('115', '111', '2', 'User', '管理员编辑提交', '0', '10000', 'admin', 'editPost', '', '', '管理员编辑提交');
INSERT INTO `dj_admin_menu` VALUES ('116', '111', '1', 'User', '个人信息', '1', '10000', 'admin', 'userInfo', '', '', '管理员个人信息修改');
INSERT INTO `dj_admin_menu` VALUES ('117', '111', '2', 'User', '管理员个人信息修改提交', '0', '10000', 'admin', 'userInfoPost', '', '', '管理员个人信息修改提交');
INSERT INTO `dj_admin_menu` VALUES ('118', '111', '2', 'User', '管理员删除', '1', '10000', 'admin', 'delete', '', '', '管理员删除');
INSERT INTO `dj_admin_menu` VALUES ('119', '111', '2', 'User', '停用管理员', '1', '10000', 'admin', 'ban', '', '', '停用管理员');
INSERT INTO `dj_admin_menu` VALUES ('120', '111', '2', 'User', '启用管理员', '1', '10000', 'admin', 'cancelBan', '', '', '启用管理员');
INSERT INTO `dj_admin_menu` VALUES ('121', '0', '1', 'AdminAsset', '资源管理', '0', '9', 'user', 'index', '', 'file', '资源管理列表');
INSERT INTO `dj_admin_menu` VALUES ('122', '121', '2', 'AdminAsset', '删除文件', '0', '10000', 'user', 'delete', '', '', '删除文件');
INSERT INTO `dj_admin_menu` VALUES ('123', '110', '0', 'AdminIndex', '用户组', '0', '10000', 'user', 'default1', '', '', '用户组');
INSERT INTO `dj_admin_menu` VALUES ('124', '123', '1', 'AdminIndex', '本站用户', '1', '10000', 'user', 'index', '', '', '本站用户');
INSERT INTO `dj_admin_menu` VALUES ('125', '124', '2', 'AdminIndex', '本站用户拉黑', '0', '10000', 'user', 'ban', '', '', '本站用户拉黑');
INSERT INTO `dj_admin_menu` VALUES ('126', '124', '2', 'AdminIndex', '本站用户启用', '0', '10000', 'user', 'cancelBan', '', '', '本站用户启用');
INSERT INTO `dj_admin_menu` VALUES ('127', '123', '1', 'AdminOauth', '第三方用户', '1', '10000', 'user', 'index', '', '', '第三方用户');
INSERT INTO `dj_admin_menu` VALUES ('128', '127', '2', 'AdminOauth', '删除第三方用户绑定', '0', '10000', 'user', 'delete', '', '', '删除第三方用户绑定');
INSERT INTO `dj_admin_menu` VALUES ('129', '6', '0', 'RecordLog', '操作日志', '1', '10000', 'admin', 'index', '', '', '用户操作管理');
INSERT INTO `dj_admin_menu` VALUES ('130', '129', '1', 'AdminUserAction', '编辑用户操作', '0', '10000', 'user', 'edit', '', '', '编辑用户操作');
INSERT INTO `dj_admin_menu` VALUES ('131', '129', '2', 'AdminUserAction', '编辑用户操作提交', '0', '10000', 'user', 'editPost', '', '', '编辑用户操作提交');
INSERT INTO `dj_admin_menu` VALUES ('132', '129', '1', 'AdminUserAction', '同步用户操作', '0', '10000', 'user', 'sync', '', '', '同步用户操作');
INSERT INTO `dj_admin_menu` VALUES ('162', '0', '0', 'AdminIndex', '演示插件', '0', '0', 'plugin/Demo', 'default', '', 'dashboard', '演示插件入口');
INSERT INTO `dj_admin_menu` VALUES ('163', '162', '1', 'AdminIndex', '演示插件用户列表', '0', '10000', 'plugin/Demo', 'index', '', '', '演示插件用户列表');
INSERT INTO `dj_admin_menu` VALUES ('164', '163', '1', 'AdminIndex', '演示插件设置', '0', '10000', 'plugin/Demo', 'setting', '', '', '演示插件设置');
INSERT INTO `dj_admin_menu` VALUES ('165', '110', '0', 'Customer', '添加意向客户', '1', '10000', 'admin', 'add', '', 'plus', '');
INSERT INTO `dj_admin_menu` VALUES ('166', '110', '0', 'Customer', '报单', '1', '10000', 'admin', 'unindex', '', '', '');
INSERT INTO `dj_admin_menu` VALUES ('167', '110', '0', 'Customer', '客户查询', '1', '10000', 'admin', 'index', '', '', '');

-- ----------------------------
-- Table structure for dj_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `dj_auth_access`;
CREATE TABLE `dj_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of dj_auth_access
-- ----------------------------
INSERT INTO `dj_auth_access` VALUES ('1', '2', 'user/adminindex/default', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('2', '2', 'admin/customer/add', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('3', '2', 'admin/customer/unindex', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('4', '2', 'admin/customer/index', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('5', '2', 'admin/user/default', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('6', '2', 'admin/user/index', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('7', '2', 'admin/user/addpost', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('8', '2', 'admin/user/edit', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('9', '2', 'admin/user/editpost', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('10', '2', 'admin/user/userinfo', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('11', '2', 'admin/user/userinfopost', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('12', '2', 'admin/user/delete', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('13', '2', 'admin/user/ban', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('14', '2', 'admin/user/cancelban', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('15', '5', 'user/adminindex/default', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('16', '5', 'admin/customer/add', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('17', '6', 'admin/user/default', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('18', '6', 'admin/user/add', 'admin_url');

-- ----------------------------
-- Table structure for dj_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `dj_auth_rule`;
CREATE TABLE `dj_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限规则表';

-- ----------------------------
-- Records of dj_auth_rule
-- ----------------------------
INSERT INTO `dj_auth_rule` VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO `dj_auth_rule` VALUES ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO `dj_auth_rule` VALUES ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO `dj_auth_rule` VALUES ('4', '1', 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', '');
INSERT INTO `dj_auth_rule` VALUES ('5', '1', 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO `dj_auth_rule` VALUES ('6', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO `dj_auth_rule` VALUES ('7', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO `dj_auth_rule` VALUES ('8', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO `dj_auth_rule` VALUES ('9', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO `dj_auth_rule` VALUES ('10', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO `dj_auth_rule` VALUES ('11', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO `dj_auth_rule` VALUES ('12', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO `dj_auth_rule` VALUES ('13', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO `dj_auth_rule` VALUES ('14', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO `dj_auth_rule` VALUES ('15', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO `dj_auth_rule` VALUES ('16', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO `dj_auth_rule` VALUES ('17', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO `dj_auth_rule` VALUES ('18', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO `dj_auth_rule` VALUES ('19', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO `dj_auth_rule` VALUES ('20', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO `dj_auth_rule` VALUES ('21', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO `dj_auth_rule` VALUES ('22', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO `dj_auth_rule` VALUES ('23', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO `dj_auth_rule` VALUES ('24', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO `dj_auth_rule` VALUES ('25', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO `dj_auth_rule` VALUES ('26', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO `dj_auth_rule` VALUES ('27', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO `dj_auth_rule` VALUES ('28', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO `dj_auth_rule` VALUES ('29', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO `dj_auth_rule` VALUES ('30', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO `dj_auth_rule` VALUES ('31', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO `dj_auth_rule` VALUES ('32', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO `dj_auth_rule` VALUES ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO `dj_auth_rule` VALUES ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO `dj_auth_rule` VALUES ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO `dj_auth_rule` VALUES ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO `dj_auth_rule` VALUES ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO `dj_auth_rule` VALUES ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO `dj_auth_rule` VALUES ('39', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO `dj_auth_rule` VALUES ('40', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件中心', '');
INSERT INTO `dj_auth_rule` VALUES ('41', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO `dj_auth_rule` VALUES ('42', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO `dj_auth_rule` VALUES ('43', '1', 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO `dj_auth_rule` VALUES ('44', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO `dj_auth_rule` VALUES ('45', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO `dj_auth_rule` VALUES ('46', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO `dj_auth_rule` VALUES ('47', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO `dj_auth_rule` VALUES ('48', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO `dj_auth_rule` VALUES ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO `dj_auth_rule` VALUES ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO `dj_auth_rule` VALUES ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO `dj_auth_rule` VALUES ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO `dj_auth_rule` VALUES ('53', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO `dj_auth_rule` VALUES ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO `dj_auth_rule` VALUES ('55', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO `dj_auth_rule` VALUES ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO `dj_auth_rule` VALUES ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO `dj_auth_rule` VALUES ('58', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO `dj_auth_rule` VALUES ('59', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO `dj_auth_rule` VALUES ('60', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO `dj_auth_rule` VALUES ('61', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO `dj_auth_rule` VALUES ('62', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO `dj_auth_rule` VALUES ('63', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO `dj_auth_rule` VALUES ('64', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO `dj_auth_rule` VALUES ('65', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO `dj_auth_rule` VALUES ('66', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO `dj_auth_rule` VALUES ('67', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO `dj_auth_rule` VALUES ('68', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO `dj_auth_rule` VALUES ('69', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '系统管理', '');
INSERT INTO `dj_auth_rule` VALUES ('70', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '系统设置', '');
INSERT INTO `dj_auth_rule` VALUES ('71', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO `dj_auth_rule` VALUES ('72', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO `dj_auth_rule` VALUES ('73', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO `dj_auth_rule` VALUES ('74', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO `dj_auth_rule` VALUES ('75', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO `dj_auth_rule` VALUES ('76', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO `dj_auth_rule` VALUES ('77', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', '');
INSERT INTO `dj_auth_rule` VALUES ('78', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO `dj_auth_rule` VALUES ('79', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO `dj_auth_rule` VALUES ('80', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO `dj_auth_rule` VALUES ('81', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO `dj_auth_rule` VALUES ('82', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO `dj_auth_rule` VALUES ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO `dj_auth_rule` VALUES ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO `dj_auth_rule` VALUES ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO `dj_auth_rule` VALUES ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO `dj_auth_rule` VALUES ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO `dj_auth_rule` VALUES ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO `dj_auth_rule` VALUES ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO `dj_auth_rule` VALUES ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO `dj_auth_rule` VALUES ('91', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO `dj_auth_rule` VALUES ('92', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO `dj_auth_rule` VALUES ('93', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO `dj_auth_rule` VALUES ('94', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO `dj_auth_rule` VALUES ('95', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO `dj_auth_rule` VALUES ('96', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO `dj_auth_rule` VALUES ('97', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO `dj_auth_rule` VALUES ('98', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO `dj_auth_rule` VALUES ('99', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO `dj_auth_rule` VALUES ('100', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO `dj_auth_rule` VALUES ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO `dj_auth_rule` VALUES ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO `dj_auth_rule` VALUES ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO `dj_auth_rule` VALUES ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO `dj_auth_rule` VALUES ('105', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO `dj_auth_rule` VALUES ('106', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO `dj_auth_rule` VALUES ('107', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO `dj_auth_rule` VALUES ('108', '1', 'admin', 'admin_url', 'admin/Theme/design', '', '模板设计', '');
INSERT INTO `dj_auth_rule` VALUES ('109', '1', 'admin', 'admin_url', 'admin/User/default', '', '员工管理', '');
INSERT INTO `dj_auth_rule` VALUES ('110', '1', 'admin', 'admin_url', 'admin/User/index', '', '员工查询', '');
INSERT INTO `dj_auth_rule` VALUES ('111', '1', 'admin', 'admin_url', 'admin/User/add', '', '新增员工', '');
INSERT INTO `dj_auth_rule` VALUES ('112', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO `dj_auth_rule` VALUES ('113', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO `dj_auth_rule` VALUES ('114', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO `dj_auth_rule` VALUES ('115', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO `dj_auth_rule` VALUES ('116', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO `dj_auth_rule` VALUES ('117', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO `dj_auth_rule` VALUES ('118', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO `dj_auth_rule` VALUES ('119', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO `dj_auth_rule` VALUES ('120', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO `dj_auth_rule` VALUES ('121', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO `dj_auth_rule` VALUES ('122', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '客户管理', '');
INSERT INTO `dj_auth_rule` VALUES ('123', '1', 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', '');
INSERT INTO `dj_auth_rule` VALUES ('124', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', '');
INSERT INTO `dj_auth_rule` VALUES ('125', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO `dj_auth_rule` VALUES ('126', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO `dj_auth_rule` VALUES ('127', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO `dj_auth_rule` VALUES ('128', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO `dj_auth_rule` VALUES ('129', '1', 'admin', 'admin_url', 'admin/RecordLog/index', '', '操作日志', '');
INSERT INTO `dj_auth_rule` VALUES ('130', '1', 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', '');
INSERT INTO `dj_auth_rule` VALUES ('131', '1', 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', '');
INSERT INTO `dj_auth_rule` VALUES ('132', '1', 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');
INSERT INTO `dj_auth_rule` VALUES ('162', '1', 'plugin/Demo', 'admin_url', 'plugin/Demo/AdminIndex/default', '', '演示插件', '');
INSERT INTO `dj_auth_rule` VALUES ('163', '1', 'plugin/Demo', 'plugin_url', 'plugin/Demo/AdminIndex/index', '', '演示插件用户列表', '');
INSERT INTO `dj_auth_rule` VALUES ('164', '1', 'plugin/Demo', 'plugin_url', 'plugin/Demo/AdminIndex/setting', '', '演示插件设置', '');
INSERT INTO `dj_auth_rule` VALUES ('165', '1', 'admin', 'admin_url', 'admin/Customer/add', '', '添加意向客户', '');
INSERT INTO `dj_auth_rule` VALUES ('166', '1', 'admin', 'admin_url', 'admin/Customer/unindex', '', '报单', '');
INSERT INTO `dj_auth_rule` VALUES ('167', '1', 'admin', 'admin_url', 'admin/Customer/index', '', '客户查询', '');

-- ----------------------------
-- Table structure for dj_comment
-- ----------------------------
DROP TABLE IF EXISTS `dj_comment`;
CREATE TABLE `dj_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of dj_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dj_customer
-- ----------------------------
DROP TABLE IF EXISTS `dj_customer`;
CREATE TABLE `dj_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户姓名',
  `login_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sex` tinyint(2) DEFAULT NULL COMMENT '性别;0:保密,1:男,2:女',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `worker_uid` int(11) DEFAULT NULL COMMENT '所属员工',
  `check_uid` int(11) DEFAULT NULL COMMENT '审核管理员',
  `check_role_id` int(11) DEFAULT NULL COMMENT '用户角色ID',
  `qq` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `remark` text COLLATE utf8mb4_general_ci COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `user_status` tinyint(2) DEFAULT NULL COMMENT '状态：1.启用2.禁用',
  `check_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `check_status` tinyint(2) DEFAULT NULL COMMENT '客户审核状态：1.审核中，2.通过，3.驳回',
  `customer_pass` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录密码',
  PRIMARY KEY (`id`),
  KEY `user_status` (`user_status`) USING BTREE,
  KEY `check_uid` (`check_uid`),
  KEY `worker_uid` (`worker_uid`),
  KEY `check_status` (`check_status`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户列表';

-- ----------------------------
-- Records of dj_customer
-- ----------------------------
INSERT INTO `dj_customer` VALUES ('1', '客户张飞', null, null, null, null, null, '北京市-北京市市辖区-东城区', '发范德萨发范德萨飞洒', '3', '11', '4', null, null, null, '2019-09-18 22:21:44', '2019-09-18 22:21:44', '2', '2019-09-14 15:50:43', '3', null);
INSERT INTO `dj_customer` VALUES ('2', '373966902@qq.com', null, '1', null, null, '13558758764', '北京市-北京市市辖区-东城区', '四川省成都市', '17', '11', '4', '', '', '', '2019-09-19 20:01:51', '2019-09-19 20:01:51', '1', '2019-09-14 16:48:22', '2', null);
INSERT INTO `dj_customer` VALUES ('3', '客户张波', null, null, null, null, null, '江苏省-南京市-玄武区', '申达股份大概多少广泛大使馆的是是的广东省', '13', '6', '4', null, null, null, '2019-09-19 22:38:29', '2019-09-19 22:38:29', '1', '2019-09-14 16:48:58', '2', null);
INSERT INTO `dj_customer` VALUES ('5', '全册', null, null, null, null, null, '辽宁省-沈阳市-和平区', '发放大发送到', '1', '6', '4', null, null, null, '2019-09-26 20:38:11', '2019-09-26 20:38:11', '2', '2019-09-14 22:33:19', '2', null);
INSERT INTO `dj_customer` VALUES ('6', '发顺丰', null, null, null, null, null, '北京市-北京市市辖区-东城区', '发顺丰', '17', '6', '4', null, null, null, '2019-09-17 22:00:22', '2019-09-17 22:00:22', '2', '2019-09-14 23:04:57', '2', null);
INSERT INTO `dj_customer` VALUES ('7', '发顺丰111', '5d8b89323f154', null, null, 'http://b-ssl.duitang.com/uploads/item/201709/17/20170917214408_ixuY5.jpeg', null, '北京市-北京市市辖区-东城区', '发顺丰', '1', '6', '4', null, null, null, '2019-09-26 22:05:48', '2019-09-26 22:05:48', '2', '2019-09-14 23:05:09', '2', null);
INSERT INTO `dj_customer` VALUES ('8', '发顺丰333', null, null, null, null, null, '北京市-北京市市辖区-东城区', '发顺丰', '2', '6', '4', null, null, null, '2019-09-19 19:49:55', '2019-09-19 19:49:55', '2', '2019-09-14 23:05:33', '2', null);
INSERT INTO `dj_customer` VALUES ('9', '373966902@qq.com', '5d8e300516b49', '1', 'DJ20190914009', 'http://b-ssl.duitang.com/uploads/item/201411/08/20141108120536_NHtW2.jpeg', '13558758764', '北京市-北京市市辖区-东城区', '四川省成都市热风发发的发大水发所发生的发的发的发生大发斯蒂芬手打发发傻是的范德萨发撒的富士达发的发撒的发生发送到发生发', '1', '6', '4', '4354353', '373966902@qq.com', '郭德纲的方式国防生的观点发送到发生安防十大发送到法师打发发生发生发送到', '2019-09-27 23:51:33', '2019-09-27 23:51:33', '1', '2019-09-14 23:20:41', '2', '###51e3068a9000b7d103321d51be30a7f4');
INSERT INTO `dj_customer` VALUES ('10', '我是谁6666888', null, '1', 'DJ20190919010', null, '13558758764', '北京市-北京市市辖区-东城区', '四川省成都市', '13', '6', '4', '', '', '', '2019-09-19 20:38:39', '2019-09-19 20:38:39', '1', '2019-09-19 20:07:40', '1', '###51e3068a9000b7d103321d51be30a7f4');
INSERT INTO `dj_customer` VALUES ('12', '373966902@qq.com', '5d8b89323f15e', '1', 'DJ20190923012', null, '13558758764', '吉林省-长春市-南关区', '四川省成都市', '3', '6', '4', '', '', '', '2019-09-28 23:00:21', '2019-09-28 23:00:21', '1', '2019-09-23 22:19:21', '1', '###51e3068a9000b7d103321d51be30a7f4');

-- ----------------------------
-- Table structure for dj_district
-- ----------------------------
DROP TABLE IF EXISTS `dj_district`;
CREATE TABLE `dj_district` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='中国省市区乡镇数据表';

-- ----------------------------
-- Records of dj_district
-- ----------------------------

-- ----------------------------
-- Table structure for dj_hook
-- ----------------------------
DROP TABLE IF EXISTS `dj_hook`;
CREATE TABLE `dj_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统钩子表';

-- ----------------------------
-- Records of dj_hook
-- ----------------------------
INSERT INTO `dj_hook` VALUES ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO `dj_hook` VALUES ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO `dj_hook` VALUES ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO `dj_hook` VALUES ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO `dj_hook` VALUES ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO `dj_hook` VALUES ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO `dj_hook` VALUES ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO `dj_hook` VALUES ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO `dj_hook` VALUES ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO `dj_hook` VALUES ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO `dj_hook` VALUES ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO `dj_hook` VALUES ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO `dj_hook` VALUES ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO `dj_hook` VALUES ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO `dj_hook` VALUES ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO `dj_hook` VALUES ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO `dj_hook` VALUES ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO `dj_hook` VALUES ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO `dj_hook` VALUES ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO `dj_hook` VALUES ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO `dj_hook` VALUES ('22', '3', '1', '评论区', 'comment', '', '评论区');
INSERT INTO `dj_hook` VALUES ('23', '3', '1', '留言区', 'guestbook', '', '留言区');
INSERT INTO `dj_hook` VALUES ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO `dj_hook` VALUES ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO `dj_hook` VALUES ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO `dj_hook` VALUES ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO `dj_hook` VALUES ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO `dj_hook` VALUES ('29', '3', '0', '主要内容之后', 'after_content', '', '主要内容之后');
INSERT INTO `dj_hook` VALUES ('32', '2', '1', '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面');
INSERT INTO `dj_hook` VALUES ('33', '3', '0', '主要内容之前', 'before_content', 'cmf', '主要内容之前');
INSERT INTO `dj_hook` VALUES ('34', '1', '0', '日志写入完成', 'log_write_done', 'cmf', '日志写入完成');
INSERT INTO `dj_hook` VALUES ('35', '1', '1', '后台模板切换', 'switch_admin_theme', 'cmf', '后台模板切换');
INSERT INTO `dj_hook` VALUES ('36', '1', '1', '验证码图片', 'captcha_image', 'cmf', '验证码图片');
INSERT INTO `dj_hook` VALUES ('37', '2', '1', '后台模板设计界面', 'admin_theme_design_view', 'admin', '后台模板设计界面');
INSERT INTO `dj_hook` VALUES ('38', '2', '1', '后台设置网站信息界面', 'admin_setting_site_view', 'admin', '后台设置网站信息界面');
INSERT INTO `dj_hook` VALUES ('39', '2', '1', '后台清除缓存界面', 'admin_setting_clear_cache_view', 'admin', '后台清除缓存界面');
INSERT INTO `dj_hook` VALUES ('40', '2', '1', '后台导航管理界面', 'admin_nav_index_view', 'admin', '后台导航管理界面');
INSERT INTO `dj_hook` VALUES ('41', '2', '1', '后台友情链接管理界面', 'admin_link_index_view', 'admin', '后台友情链接管理界面');
INSERT INTO `dj_hook` VALUES ('42', '2', '1', '后台幻灯片管理界面', 'admin_slide_index_view', 'admin', '后台幻灯片管理界面');
INSERT INTO `dj_hook` VALUES ('43', '2', '1', '后台管理员列表界面', 'admin_user_index_view', 'admin', '后台管理员列表界面');
INSERT INTO `dj_hook` VALUES ('44', '2', '1', '后台角色管理界面', 'admin_rbac_index_view', 'admin', '后台角色管理界面');
INSERT INTO `dj_hook` VALUES ('49', '2', '1', '用户管理本站用户列表界面', 'user_admin_index_view', 'user', '用户管理本站用户列表界面');
INSERT INTO `dj_hook` VALUES ('50', '2', '1', '资源管理列表界面', 'user_admin_asset_index_view', 'user', '资源管理列表界面');
INSERT INTO `dj_hook` VALUES ('51', '2', '1', '用户管理第三方用户列表界面', 'user_admin_oauth_index_view', 'user', '用户管理第三方用户列表界面');
INSERT INTO `dj_hook` VALUES ('52', '2', '1', '后台首页界面', 'admin_index_index_view', 'admin', '后台首页界面');
INSERT INTO `dj_hook` VALUES ('53', '2', '1', '后台回收站界面', 'admin_recycle_bin_index_view', 'admin', '后台回收站界面');
INSERT INTO `dj_hook` VALUES ('54', '2', '1', '后台菜单管理界面', 'admin_menu_index_view', 'admin', '后台菜单管理界面');
INSERT INTO `dj_hook` VALUES ('55', '2', '1', '后台自定义登录是否开启钩子', 'admin_custom_login_open', 'admin', '后台自定义登录是否开启钩子');
INSERT INTO `dj_hook` VALUES ('64', '2', '1', '后台幻灯片页面列表界面', 'admin_slide_item_index_view', 'admin', '后台幻灯片页面列表界面');
INSERT INTO `dj_hook` VALUES ('65', '2', '1', '后台幻灯片页面添加界面', 'admin_slide_item_add_view', 'admin', '后台幻灯片页面添加界面');
INSERT INTO `dj_hook` VALUES ('66', '2', '1', '后台幻灯片页面编辑界面', 'admin_slide_item_edit_view', 'admin', '后台幻灯片页面编辑界面');
INSERT INTO `dj_hook` VALUES ('67', '2', '1', '后台管理员添加界面', 'admin_user_add_view', 'admin', '后台管理员添加界面');
INSERT INTO `dj_hook` VALUES ('68', '2', '1', '后台管理员编辑界面', 'admin_user_edit_view', 'admin', '后台管理员编辑界面');
INSERT INTO `dj_hook` VALUES ('69', '2', '1', '后台角色添加界面', 'admin_rbac_role_add_view', 'admin', '后台角色添加界面');
INSERT INTO `dj_hook` VALUES ('70', '2', '1', '后台角色编辑界面', 'admin_rbac_role_edit_view', 'admin', '后台角色编辑界面');
INSERT INTO `dj_hook` VALUES ('71', '2', '1', '后台角色授权界面', 'admin_rbac_authorize_view', 'admin', '后台角色授权界面');

-- ----------------------------
-- Table structure for dj_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dj_hook_plugin`;
CREATE TABLE `dj_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of dj_hook_plugin
-- ----------------------------
INSERT INTO `dj_hook_plugin` VALUES ('1', '10000', '1', 'footer_start', 'Demo');

-- ----------------------------
-- Table structure for dj_link
-- ----------------------------
DROP TABLE IF EXISTS `dj_link`;
CREATE TABLE `dj_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='友情链接表';

-- ----------------------------
-- Records of dj_link
-- ----------------------------
INSERT INTO `dj_link` VALUES ('1', '1', '1', '8', 'thinkcmf官网', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '');

-- ----------------------------
-- Table structure for dj_message
-- ----------------------------
DROP TABLE IF EXISTS `dj_message`;
CREATE TABLE `dj_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `user_type` tinyint(2) DEFAULT NULL COMMENT '发送者身份（1客服，2客户）',
  `from_uid` int(11) DEFAULT NULL COMMENT '发送人UID',
  `content` text COLLATE utf8mb4_general_ci COMMENT '操作人角色ID',
  `type` tinyint(2) NOT NULL COMMENT '类型:1文字，2文件',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '信息ID',
  `is_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '2' COMMENT '是否阅读（1已读2未读）',
  `c_month` int(11) DEFAULT NULL COMMENT '月份',
  `c_year` int(11) DEFAULT NULL COMMENT '年份',
  `c_day` date DEFAULT NULL COMMENT '年月日',
  `c_week` int(11) DEFAULT NULL COMMENT '一年的第几周',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `type` (`type`),
  KEY `c_month` (`c_month`),
  KEY `c_day` (`c_day`),
  KEY `user_type` (`user_type`),
  KEY `from_uid` (`from_uid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='聊天记录';

-- ----------------------------
-- Records of dj_message
-- ----------------------------
INSERT INTO `dj_message` VALUES ('1', '1', '2', '12', '我是客户11111', '1', '', '2', '9', '2019', '2019-09-25', '39', '2019-09-25 23:35:26');
INSERT INTO `dj_message` VALUES ('2', '1', '1', '9', '我是谁<div><br></div>', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 20:19:17');
INSERT INTO `dj_message` VALUES ('3', '9', '2', '1', '我的未来不是梦', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 22:06:29');
INSERT INTO `dj_message` VALUES ('4', '7', '2', '1', '我到底在哪儿', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 22:06:42');
INSERT INTO `dj_message` VALUES ('5', '7', '2', '1', '', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 22:06:46');
INSERT INTO `dj_message` VALUES ('6', '1', '1', '12', '我是什么人啊', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 22:18:18');
INSERT INTO `dj_message` VALUES ('7', '1', '1', '12', '', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 22:18:18');
INSERT INTO `dj_message` VALUES ('8', '1', '1', '12', '', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 22:18:19');
INSERT INTO `dj_message` VALUES ('9', '1', '1', '12', '范德萨', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 22:30:33');
INSERT INTO `dj_message` VALUES ('10', '12', '2', '1', '法守法发送到', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 22:33:22');
INSERT INTO `dj_message` VALUES ('11', '1', '1', '7', '<img src=\"assets/img/face/ee_18.png\" alt=\"表情18\">', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 22:42:33');
INSERT INTO `dj_message` VALUES ('12', '1', '1', '12', '6666', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 22:44:27');
INSERT INTO `dj_message` VALUES ('13', '1', '1', '9', 'fdasfasfafds', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 23:07:45');
INSERT INTO `dj_message` VALUES ('14', '9', '2', '1', '法法发多少', '1', '', '2', '9', '2019', '2019-09-27', '39', '2019-09-27 23:10:30');
INSERT INTO `dj_message` VALUES ('15', '9', '2', '1', 'fsdafsfsd', '1', '', '2', '9', '2019', '2019-09-27', '39', '2019-09-27 23:28:05');
INSERT INTO `dj_message` VALUES ('16', '9', '2', '1', '54544', '1', '', '2', '9', '2019', '2019-09-27', '39', '2019-09-27 23:29:15');
INSERT INTO `dj_message` VALUES ('17', '9', '2', '1', '432432', '1', '', '2', '9', '2019', '2019-09-27', '39', '2019-09-27 23:53:59');
INSERT INTO `dj_message` VALUES ('18', '1', '1', '9', '5555', '1', '', '2', '9', '2019', '2019-09-29', '39', '2019-09-29 00:02:14');

-- ----------------------------
-- Table structure for dj_nav
-- ----------------------------
DROP TABLE IF EXISTS `dj_nav`;
CREATE TABLE `dj_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='前台导航位置表';

-- ----------------------------
-- Records of dj_nav
-- ----------------------------
INSERT INTO `dj_nav` VALUES ('1', '1', '主导航', '主导航');
INSERT INTO `dj_nav` VALUES ('2', '0', '底部导航', '');

-- ----------------------------
-- Table structure for dj_nav_menu
-- ----------------------------
DROP TABLE IF EXISTS `dj_nav_menu`;
CREATE TABLE `dj_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='前台导航菜单表';

-- ----------------------------
-- Records of dj_nav_menu
-- ----------------------------
INSERT INTO `dj_nav_menu` VALUES ('1', '1', '0', '1', '0', '首页', '', 'home', '', '0-1');

-- ----------------------------
-- Table structure for dj_notice
-- ----------------------------
DROP TABLE IF EXISTS `dj_notice`;
CREATE TABLE `dj_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `role_id` tinyint(2) DEFAULT NULL COMMENT '操作人角色ID',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人名称',
  `type` tinyint(255) DEFAULT NULL COMMENT '操作类型（详见配置）',
  `info_id` int(11) DEFAULT NULL COMMENT '信息ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `c_month` int(11) DEFAULT NULL COMMENT '月份',
  `c_year` int(11) DEFAULT NULL COMMENT '年份',
  `c_day` date DEFAULT NULL COMMENT '年月日',
  `c_week` int(11) DEFAULT NULL COMMENT '一年的第几周',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `is_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '2' COMMENT '是否阅读（1已读2未读）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `type` (`type`),
  KEY `c_month` (`c_month`),
  KEY `c_year` (`c_year`),
  KEY `c_day` (`c_day`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='消息通知';

-- ----------------------------
-- Records of dj_notice
-- ----------------------------
INSERT INTO `dj_notice` VALUES ('3', '1', '2', '测试标题 哈哈', '25', '2', null, null, null, null, null, '2019-09-12 23:09:16', '2');
INSERT INTO `dj_notice` VALUES ('2', '1', '1', '今天天气摄氏温度', '2', '1', null, null, null, null, null, '2019-09-26 23:09:10', '2');

-- ----------------------------
-- Table structure for dj_option
-- ----------------------------
DROP TABLE IF EXISTS `dj_option`;
CREATE TABLE `dj_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of dj_option
-- ----------------------------
INSERT INTO `dj_option` VALUES ('1', '1', 'site_info', '{\"site_name\":\"\\u9f0e\\u5065\\u5ba2\\u6237\\u7ba1\\u7406\\u7cfb\\u7edf66\",\"site_seo_title\":\"\\u9f0e\\u5065\\u5ba2\\u6237\\u7ba1\\u7406\\u7cfb\\u7edf\",\"site_seo_keywords\":\"\\u9f0e\\u5065\\u5ba2\\u6237\\u7ba1\\u7406\\u7cfb\\u7edf,php\",\"site_seo_description\":\"\\u9f0e\\u5065\\u5ba2\\u6237\\u7ba1\\u7406\\u7cfb\\u7edf-\",\"forget_pwd\":\"\\u8bf7\\u8054\\u7cfb\\u7ba1\\u7406\\u5458\\u91cd\\u7f6e\\u5bc6\\u7801\\uff01\",\"site_icp\":\"\",\"site_gwa\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\",\"customer_default_pwd\":\"333\",\"worker_default_pwd\":\"123456\"}');
INSERT INTO `dj_option` VALUES ('2', '1', 'smtp_setting', '{\"from_name\":\"\\u5f20\\u4e09\",\"from\":\"373966902@qq.com\",\"host\":\"\",\"smtp_secure\":\"\",\"port\":\"\",\"username\":\"root\",\"password\":\"123123\"}');
INSERT INTO `dj_option` VALUES ('3', '1', 'cmf_settings', '{\"open_registration\":\"0\",\"banned_usernames\":\"\"}');
INSERT INTO `dj_option` VALUES ('4', '1', 'cdn_settings', '{\"cdn_static_root\":\"\"}');
INSERT INTO `dj_option` VALUES ('5', '1', 'admin_settings', '{\"admin_password\":\"\",\"admin_theme\":\"admin_simpleboot3\",\"admin_style\":\"simpleadmin\"}');

-- ----------------------------
-- Table structure for dj_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dj_plugin`;
CREATE TABLE `dj_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='插件表';

-- ----------------------------
-- Records of dj_plugin
-- ----------------------------
INSERT INTO `dj_plugin` VALUES ('1', '1', '1', '1', '0', 'Demo', '插件演示', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', '1.0', '插件演示', '{\"custom_config\":\"0\",\"text\":\"hello,ThinkCMF!\",\"password\":\"\",\"number\":\"1.0\",\"select\":\"1\",\"checkbox\":1,\"radio\":\"1\",\"radio2\":\"1\",\"textarea\":\"\\u8fd9\\u91cc\\u662f\\u4f60\\u8981\\u586b\\u5199\\u7684\\u5185\\u5bb9\",\"date\":\"2017-05-20\",\"datetime\":\"2017-05-20\",\"color\":\"#103633\",\"image\":\"\",\"file\":\"\",\"location\":\"\"}');
INSERT INTO `dj_plugin` VALUES ('2', '1', '1', '1', '0', 'ChatDemo', '聊天室demo', 'http://im.yyw66.cn', '', '小夏', 'http://www.thinkcmf.com', '1.0', '聊天室demo', '[]');

-- ----------------------------
-- Table structure for dj_plugin_chat_user
-- ----------------------------
DROP TABLE IF EXISTS `dj_plugin_chat_user`;
CREATE TABLE `dj_plugin_chat_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `chat_id` int(11) DEFAULT NULL COMMENT '聊天临时id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `type` tinyint(1) DEFAULT '1' COMMENT '1上线0下线',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dj_plugin_chat_user
-- ----------------------------

-- ----------------------------
-- Table structure for dj_record_log
-- ----------------------------
DROP TABLE IF EXISTS `dj_record_log`;
CREATE TABLE `dj_record_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `role_id` tinyint(2) DEFAULT NULL COMMENT '操作人角色ID',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人名称',
  `type` tinyint(255) DEFAULT NULL COMMENT '操作类型（详见配置）',
  `info_id` int(11) DEFAULT NULL COMMENT '信息ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `c_month` int(11) DEFAULT NULL COMMENT '月份',
  `c_year` int(11) DEFAULT NULL COMMENT '年份',
  `c_day` date DEFAULT NULL COMMENT '年月日',
  `c_week` int(11) DEFAULT NULL COMMENT '一年的第几周',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `type` (`type`),
  KEY `c_month` (`c_month`),
  KEY `c_year` (`c_year`),
  KEY `c_day` (`c_day`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='鼎健操作日志表';

-- ----------------------------
-- Records of dj_record_log
-- ----------------------------
INSERT INTO `dj_record_log` VALUES ('1', '1', '1', 'admin11', '28', '7', null, '9', '2019', '2019-09-19', '38', '2019-09-19 19:51:37');
INSERT INTO `dj_record_log` VALUES ('2', '3', '2', '员工李四', '28', '5', null, '9', '2019', '2019-09-19', '38', '2019-09-19 19:52:30');
INSERT INTO `dj_record_log` VALUES ('3', '1', '1', 'admin11', '27', '2', null, '9', '2019', '2019-09-19', '38', '2019-09-19 20:01:51');
INSERT INTO `dj_record_log` VALUES ('4', '1', '1', 'admin11', '21', '10', null, '9', '2019', '2019-09-19', '38', '2019-09-19 20:07:40');
INSERT INTO `dj_record_log` VALUES ('5', '1', '1', 'admin11', '24', '8', null, '9', '2019', '2019-09-19', '38', '2019-09-19 20:08:06');
INSERT INTO `dj_record_log` VALUES ('6', '1', '1', 'admin11', '25', '6', null, '9', '2019', '2019-09-19', '38', '2019-09-19 20:08:10');
INSERT INTO `dj_record_log` VALUES ('7', '1', '1', 'admin11', '27', '10', null, '9', '2019', '2019-09-19', '38', '2019-09-19 20:09:21');
INSERT INTO `dj_record_log` VALUES ('8', '1', '1', 'admin11', '27', '10', null, '9', '2019', '2019-09-19', '38', '2019-09-19 20:10:30');
INSERT INTO `dj_record_log` VALUES ('9', '1', '1', 'admin11', '22', '10', null, '9', '2019', '2019-09-19', '38', '2019-09-19 20:38:39');
INSERT INTO `dj_record_log` VALUES ('10', '1', '1', 'admin11', '21', '11', null, '9', '2019', '2019-09-19', '38', '2019-09-19 20:48:35');
INSERT INTO `dj_record_log` VALUES ('11', '1', '1', 'admin11', '6', null, null, '9', '2019', '2019-09-19', '38', '2019-09-19 20:57:00');
INSERT INTO `dj_record_log` VALUES ('12', '1', '1', 'admin11', '3', '5', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:04:53');
INSERT INTO `dj_record_log` VALUES ('13', '1', '1', 'admin11', '4', '5', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:05:53');
INSERT INTO `dj_record_log` VALUES ('14', '1', '1', 'admin11', '5', '5', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:06:46');
INSERT INTO `dj_record_log` VALUES ('15', '1', '1', 'admin11', '3', '1', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:07:33');
INSERT INTO `dj_record_log` VALUES ('16', '1', '1', 'admin11', '11', '18', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:13:07');
INSERT INTO `dj_record_log` VALUES ('17', '1', '1', 'admin11', '12', '18', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:13:40');
INSERT INTO `dj_record_log` VALUES ('18', '1', '1', 'admin11', '14', '18', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:13:55');
INSERT INTO `dj_record_log` VALUES ('19', '1', '1', 'admin11', '15', '18', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:14:00');
INSERT INTO `dj_record_log` VALUES ('20', '1', '1', 'admin11', '13', '18', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:15:00');
INSERT INTO `dj_record_log` VALUES ('21', null, null, null, '2', null, null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:39:09');
INSERT INTO `dj_record_log` VALUES ('22', null, null, null, '2', null, null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:40:03');
INSERT INTO `dj_record_log` VALUES ('23', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:41:13');
INSERT INTO `dj_record_log` VALUES ('24', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:42:09');
INSERT INTO `dj_record_log` VALUES ('25', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:42:17');
INSERT INTO `dj_record_log` VALUES ('26', '1', '1', 'admin11', '4', '6', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:51:31');
INSERT INTO `dj_record_log` VALUES ('27', '1', '1', 'admin11', '5', '6', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:52:26');
INSERT INTO `dj_record_log` VALUES ('28', '1', '1', 'admin11', '12', '11', null, '9', '2019', '2019-09-19', '38', '2019-09-19 21:57:33');
INSERT INTO `dj_record_log` VALUES ('29', '1', '1', 'admin11', '24', '3', null, '9', '2019', '2019-09-19', '38', '2019-09-19 22:38:29');
INSERT INTO `dj_record_log` VALUES ('30', '1', '1', 'admin11', '30', '11', null, '9', '2019', '2019-09-19', '38', '2019-09-19 22:58:08');
INSERT INTO `dj_record_log` VALUES ('31', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:36:17');
INSERT INTO `dj_record_log` VALUES ('32', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:36:43');
INSERT INTO `dj_record_log` VALUES ('33', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:37:52');
INSERT INTO `dj_record_log` VALUES ('34', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:38:18');
INSERT INTO `dj_record_log` VALUES ('35', '1', '1', 'admin11', '11', '19', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:47:40');
INSERT INTO `dj_record_log` VALUES ('36', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:52:21');
INSERT INTO `dj_record_log` VALUES ('37', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:52:29');
INSERT INTO `dj_record_log` VALUES ('38', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:57:09');
INSERT INTO `dj_record_log` VALUES ('39', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:57:17');
INSERT INTO `dj_record_log` VALUES ('40', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:57:29');
INSERT INTO `dj_record_log` VALUES ('41', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:57:36');
INSERT INTO `dj_record_log` VALUES ('42', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:58:54');
INSERT INTO `dj_record_log` VALUES ('43', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 22:58:59');
INSERT INTO `dj_record_log` VALUES ('44', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 23:00:36');
INSERT INTO `dj_record_log` VALUES ('45', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 23:00:52');
INSERT INTO `dj_record_log` VALUES ('46', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 23:02:30');
INSERT INTO `dj_record_log` VALUES ('47', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 23:02:45');
INSERT INTO `dj_record_log` VALUES ('48', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 23:06:45');
INSERT INTO `dj_record_log` VALUES ('49', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 23:10:50');
INSERT INTO `dj_record_log` VALUES ('50', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 23:18:20');
INSERT INTO `dj_record_log` VALUES ('51', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-20', '38', '2019-09-20 23:19:09');
INSERT INTO `dj_record_log` VALUES ('52', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-21', '38', '2019-09-21 20:22:46');
INSERT INTO `dj_record_log` VALUES ('53', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-21', '38', '2019-09-21 20:22:55');
INSERT INTO `dj_record_log` VALUES ('54', '1', '1', 'admin11', '21', '12', null, '9', '2019', '2019-09-23', '39', '2019-09-23 22:19:21');
INSERT INTO `dj_record_log` VALUES ('55', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-23', '39', '2019-09-23 22:23:42');
INSERT INTO `dj_record_log` VALUES ('56', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-23', '39', '2019-09-23 22:23:56');
INSERT INTO `dj_record_log` VALUES ('57', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-25', '39', '2019-09-25 22:59:49');
INSERT INTO `dj_record_log` VALUES ('58', '1', '1', 'admin11', '6', null, null, '9', '2019', '2019-09-27', '39', '2019-09-27 22:31:03');
INSERT INTO `dj_record_log` VALUES ('59', '1', '1', 'admin11', '12', '3', null, '9', '2019', '2019-09-28', '39', '2019-09-28 21:56:58');
INSERT INTO `dj_record_log` VALUES ('60', '1', '1', 'admin11', '12', '3', null, '9', '2019', '2019-09-28', '39', '2019-09-28 22:00:35');
INSERT INTO `dj_record_log` VALUES ('61', '1', '1', 'admin11', '22', '12', null, '9', '2019', '2019-09-28', '39', '2019-09-28 23:00:21');

-- ----------------------------
-- Table structure for dj_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `dj_recycle_bin`;
CREATE TABLE `dj_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT=' 回收站';

-- ----------------------------
-- Records of dj_recycle_bin
-- ----------------------------

-- ----------------------------
-- Table structure for dj_role
-- ----------------------------
DROP TABLE IF EXISTS `dj_role`;
CREATE TABLE `dj_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';

-- ----------------------------
-- Records of dj_role
-- ----------------------------
INSERT INTO `dj_role` VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `dj_role` VALUES ('2', '0', '1', '1329633709', '1329633709', '0', '普通员工', '系统员工');
INSERT INTO `dj_role` VALUES ('4', '0', '1', '0', '0', '0', '审核操作员', '审核操作员');
INSERT INTO `dj_role` VALUES ('5', '0', '1', '0', '0', '0', '客户管理员', '客户管理员');
INSERT INTO `dj_role` VALUES ('6', '0', '1', '0', '0', '0', '测试认识', '发送到');

-- ----------------------------
-- Table structure for dj_role_user
-- ----------------------------
DROP TABLE IF EXISTS `dj_role_user`;
CREATE TABLE `dj_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of dj_role_user
-- ----------------------------
INSERT INTO `dj_role_user` VALUES ('1', '2', '2');
INSERT INTO `dj_role_user` VALUES ('2', '2', '3');
INSERT INTO `dj_role_user` VALUES ('3', '2', '4');
INSERT INTO `dj_role_user` VALUES ('4', '2', '5');
INSERT INTO `dj_role_user` VALUES ('5', '2', '6');
INSERT INTO `dj_role_user` VALUES ('8', '2', '9');
INSERT INTO `dj_role_user` VALUES ('9', '2', '12');
INSERT INTO `dj_role_user` VALUES ('10', '2', '13');
INSERT INTO `dj_role_user` VALUES ('11', '5', '14');
INSERT INTO `dj_role_user` VALUES ('12', '4', '15');
INSERT INTO `dj_role_user` VALUES ('14', '2', '17');
INSERT INTO `dj_role_user` VALUES ('15', '2', '18');
INSERT INTO `dj_role_user` VALUES ('16', '2', '19');

-- ----------------------------
-- Table structure for dj_route
-- ----------------------------
DROP TABLE IF EXISTS `dj_route`;
CREATE TABLE `dj_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='url路由表';

-- ----------------------------
-- Records of dj_route
-- ----------------------------

-- ----------------------------
-- Table structure for dj_slide
-- ----------------------------
DROP TABLE IF EXISTS `dj_slide`;
CREATE TABLE `dj_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='幻灯片表';

-- ----------------------------
-- Records of dj_slide
-- ----------------------------

-- ----------------------------
-- Table structure for dj_slide_item
-- ----------------------------
DROP TABLE IF EXISTS `dj_slide_item`;
CREATE TABLE `dj_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '幻灯片内容',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`),
  KEY `slide_id` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='幻灯片子项表';

-- ----------------------------
-- Records of dj_slide_item
-- ----------------------------

-- ----------------------------
-- Table structure for dj_theme
-- ----------------------------
DROP TABLE IF EXISTS `dj_theme`;
CREATE TABLE `dj_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dj_theme
-- ----------------------------
INSERT INTO `dj_theme` VALUES ('1', '0', '0', '0', '0', 'default', 'default', '1.0.0', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF默认模板', 'ThinkCMF默认模板');

-- ----------------------------
-- Table structure for dj_theme_file
-- ----------------------------
DROP TABLE IF EXISTS `dj_theme_file`;
CREATE TABLE `dj_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dj_theme_file
-- ----------------------------

-- ----------------------------
-- Table structure for dj_third_party_user
-- ----------------------------
DROP TABLE IF EXISTS `dj_third_party_user`;
CREATE TABLE `dj_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方唯一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='第三方用户表';

-- ----------------------------
-- Records of dj_third_party_user
-- ----------------------------

-- ----------------------------
-- Table structure for dj_user
-- ----------------------------
DROP TABLE IF EXISTS `dj_user`;
CREATE TABLE `dj_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `login_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '身份验证的token',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性',
  `account` varchar(255) DEFAULT NULL COMMENT '账号',
  `card_type` tinyint(2) DEFAULT NULL COMMENT '证件类型',
  `card_id` varchar(255) DEFAULT NULL COMMENT '证件号码',
  `area` varchar(255) DEFAULT NULL COMMENT '区域/地址',
  `join_time` varchar(255) DEFAULT NULL COMMENT '入职时间',
  `qq` varchar(255) DEFAULT NULL,
  `remark` text COMMENT '备注',
  `role_id` tinyint(2) DEFAULT NULL COMMENT '角色ID',
  `status` tinyint(2) DEFAULT '1' COMMENT '员工状态（1正常，2停用）',
  `address` text,
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- ----------------------------
-- Records of dj_user
-- ----------------------------
INSERT INTO `dj_user` VALUES ('1', '1', '1', '-28800', '1569423589', '0', '0', '0.00', '1568300708', '1', 'admin', '###56520f0efb772db0f3f66a57f8831caa', 'admin11', '5d8b80e5028d8', '373966902@qq.com', '', '20190928/cb065891534bb03fbb87605b357f4467.jpg', '', '127.0.0.1', '', '13558758764', null, '03065c7f91586c87', '1', '', '北京市-北京市市辖区-东城区', '2019-09-14', '', '', '1', '1', null);
INSERT INTO `dj_user` VALUES ('2', '1', '1', '0', '1568730152', '0', '0', '0.00', '0', '2', 'zhangsan', '###c4f559e0c7959863d07634dde800e6b0', '员工张三', null, '123456@qq.com', '', '', '', '127.0.0.1', '', '', null, null, '1', null, null, null, null, null, '2', '2', null);
INSERT INTO `dj_user` VALUES ('3', '1', '1', '0', '1568893932', '0', '0', '0.00', '0', '1', 'lisi', '###c4f559e0c7959863d07634dde800e6b0', '员工李四', null, 'a@b.c', '', '', '', '127.0.0.1', '', '13558758764', null, '03065c7f91586c87', '1', '', '黑龙江省-哈尔滨市-道里区', '', '', '', '2', '2', '范address德萨范德萨发送到');
INSERT INTO `dj_user` VALUES ('6', '1', '1', '0', '1568813771', '0', '0', '0.00', '0', '1', 'zhangzhongqiang', '###c4f559e0c7959863d07634dde800e6b0', '审核张中强', null, '', '', '', '', '127.0.0.1', '', '13558758764', null, '03065c7f91586c87', '2', '', '北京市-北京市市辖区-东城区', '', '', '', '4', '1', null);
INSERT INTO `dj_user` VALUES ('11', '1', '2', '0', '0', '0', '0', '0.00', '0', '2', 'wujinz', '###c4f559e0c7959863d07634dde800e6b0', '审核吴金枝', null, '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '2', '', '北京市-北京市市辖区-东城区', '', '', '', '4', '1', null);
INSERT INTO `dj_user` VALUES ('12', '1', '1', '0', '0', '0', '0', '0.00', '0', '2', 'jinjinzi', '###c4f559e0c7959863d07634dde800e6b0', '员工金锦子', null, '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '1', '', '北京市-北京市市辖区-东城区', '', '', '', '2', '1', null);
INSERT INTO `dj_user` VALUES ('13', '1', '2', '0', '0', '0', '0', '0.00', '0', '1', 'wulian', '###c4f559e0c7959863d07634dde800e6b0', '员工吴莲', null, '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '1', '', '北京市-北京市市辖区-东城区', '', '', '', '2', '1', null);
INSERT INTO `dj_user` VALUES ('14', '1', '2', '0', '0', '0', '0', '0.00', '0', '2', '6666666', '###decec9d91fa1f687ba9834d2825f44ba', '', null, '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '1', '', '北京市-北京市市辖区-东城区', '2019-09-14', '', '', '5', '1', null);
INSERT INTO `dj_user` VALUES ('15', '1', '2', '0', '0', '0', '0', '0.00', '0', '1', 'liu', '###8aa4016567c438e463adc6a4c16d6a28', '客户管理员刘', null, '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '2', '', '北京市-北京市市辖区-东城区', '', '', '', '5', '1', null);
INSERT INTO `dj_user` VALUES ('17', '1', '2', '0', '0', '0', '0', '0.00', '0', '1', 'liuyi', '###c4f559e0c7959863d07634dde800e6b0', '员工刘一', null, '', '', '', '', '', '', '13558758764', null, '5454', '1', '', '北京市-北京市市辖区-东城区', '2019-09-17', '', '范德萨', '2', '1', null);
INSERT INTO `dj_user` VALUES ('18', '1', '1', '0', '0', '0', '0', '0.00', '0', '1', '发多少55', '###d5f9406fc191f9bcc4fa42ea77dfa5f3', '', null, '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '1', '', '北京市-北京市市辖区-东城区', '', '', '', '2', '1', null);
INSERT INTO `dj_user` VALUES ('19', '1', '1', '0', '0', '0', '0', '0.00', '0', '1', '登陆者哈哈', '###c4f559e0c7959863d07634dde800e6b0', '', '', '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '1', '', '北京市-北京市市辖区-东城区', '', '', '', '2', '1', null);

-- ----------------------------
-- Table structure for dj_user_action
-- ----------------------------
DROP TABLE IF EXISTS `dj_user_action`;
CREATE TABLE `dj_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户操作表';

-- ----------------------------
-- Records of dj_user_action
-- ----------------------------
INSERT INTO `dj_user_action` VALUES ('1', '1', '1', '1', '2', '1', '用户登录', 'login', 'user', '');

-- ----------------------------
-- Table structure for dj_user_action_log
-- ----------------------------
DROP TABLE IF EXISTS `dj_user_action_log`;
CREATE TABLE `dj_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='访问记录表';

-- ----------------------------
-- Records of dj_user_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for dj_user_token
-- ----------------------------
DROP TABLE IF EXISTS `dj_user_token`;
CREATE TABLE `dj_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of dj_user_token
-- ----------------------------
INSERT INTO `dj_user_token` VALUES ('1', '1', '1583853007', '1568301007', '19ac393665ff18bffcee15493ab3081fe1dee91b257d6b36e8dc1a509d0c1bd0', 'web');
INSERT INTO `dj_user_token` VALUES ('2', '2', '1584281899', '1568729899', '31d14971f5e1a1cf7a086be2343418c370a82e44a59c469d77edd974a3913d0a', 'web');
INSERT INTO `dj_user_token` VALUES ('3', '3', '1584283215', '1568731215', '87db81e8ba184ef3311fadb25aa611a134749298dabb79a534ddcb328efd7d27', 'web');
INSERT INTO `dj_user_token` VALUES ('4', '6', '1584364191', '1568812191', 'fb0b43e54746d4cd6961f0f922e82cec725738df0e5651835fad31aef6252585', 'web');

-- ----------------------------
-- Table structure for dj_worker
-- ----------------------------
DROP TABLE IF EXISTS `dj_worker`;
CREATE TABLE `dj_worker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户姓名',
  `sex` tinyint(2) DEFAULT NULL COMMENT '性别;0:保密,1:男,2:女',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账号',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `worker_uid` int(11) DEFAULT NULL COMMENT '所属员工',
  `check_uid` int(11) DEFAULT NULL COMMENT '审核管理员',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `card_type` tinyint(2) DEFAULT NULL COMMENT '证件类型（1.身份证）',
  `card_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '证件号码',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `join_time` int(10) DEFAULT '0' COMMENT '入职时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of dj_worker
-- ----------------------------
