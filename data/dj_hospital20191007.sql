/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : dj_hospital

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-10-07 07:40:47
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
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器名',
  `is_auth` tinyint(2) DEFAULT NULL COMMENT '标识是否出现在权限选择列表',
  `action` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `controller` (`controller`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='后台菜单表';

-- ----------------------------
-- Records of dj_admin_menu
-- ----------------------------
INSERT INTO `dj_admin_menu` VALUES ('1', '0', '0', '0', '20', 'admin', 'Plugin', null, 'default', '', '插件中心', 'cloud', '插件中心');
INSERT INTO `dj_admin_menu` VALUES ('2', '1', '1', '1', '10000', 'admin', 'Hook', null, 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO `dj_admin_menu` VALUES ('3', '2', '1', '0', '10000', 'admin', 'Hook', null, 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO `dj_admin_menu` VALUES ('4', '2', '2', '0', '10000', 'admin', 'Hook', null, 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO `dj_admin_menu` VALUES ('5', '2', '1', '0', '10000', 'admin', 'Hook', null, 'sync', '', '同步钩子', '', '同步钩子');
INSERT INTO `dj_admin_menu` VALUES ('6', '0', '0', '1', '99', 'admin', 'Setting', '1', 'default', '', '系统管理', 'cogs', '系统设置入口');
INSERT INTO `dj_admin_menu` VALUES ('7', '6', '1', '0', '50', 'admin', 'Link', null, 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `dj_admin_menu` VALUES ('8', '7', '1', '0', '10000', 'admin', 'Link', null, 'add', '', '添加友情链接', '', '添加友情链接');
INSERT INTO `dj_admin_menu` VALUES ('9', '7', '2', '0', '10000', 'admin', 'Link', null, 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存');
INSERT INTO `dj_admin_menu` VALUES ('10', '7', '1', '0', '10000', 'admin', 'Link', null, 'edit', '', '编辑友情链接', '', '编辑友情链接');
INSERT INTO `dj_admin_menu` VALUES ('11', '7', '2', '0', '10000', 'admin', 'Link', null, 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存');
INSERT INTO `dj_admin_menu` VALUES ('12', '7', '2', '0', '10000', 'admin', 'Link', null, 'delete', '', '删除友情链接', '', '删除友情链接');
INSERT INTO `dj_admin_menu` VALUES ('13', '7', '2', '0', '10000', 'admin', 'Link', null, 'listOrder', '', '友情链接排序', '', '友情链接排序');
INSERT INTO `dj_admin_menu` VALUES ('14', '7', '2', '0', '10000', 'admin', 'Link', null, 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏');
INSERT INTO `dj_admin_menu` VALUES ('15', '6', '1', '0', '10', 'admin', 'Mailer', null, 'index', '', '邮箱配置', '', '邮箱配置');
INSERT INTO `dj_admin_menu` VALUES ('16', '15', '2', '0', '10000', 'admin', 'Mailer', null, 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存');
INSERT INTO `dj_admin_menu` VALUES ('17', '15', '1', '0', '10000', 'admin', 'Mailer', null, 'template', '', '邮件模板', '', '邮件模板');
INSERT INTO `dj_admin_menu` VALUES ('18', '15', '2', '0', '10000', 'admin', 'Mailer', null, 'templatePost', '', '邮件模板提交', '', '邮件模板提交');
INSERT INTO `dj_admin_menu` VALUES ('19', '15', '1', '0', '10000', 'admin', 'Mailer', null, 'test', '', '邮件发送测试', '', '邮件发送测试');
INSERT INTO `dj_admin_menu` VALUES ('20', '6', '1', '0', '10000', 'admin', 'Menu', null, 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO `dj_admin_menu` VALUES ('21', '20', '1', '0', '10000', 'admin', 'Menu', null, 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO `dj_admin_menu` VALUES ('22', '20', '1', '0', '10000', 'admin', 'Menu', null, 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO `dj_admin_menu` VALUES ('23', '20', '2', '0', '10000', 'admin', 'Menu', null, 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO `dj_admin_menu` VALUES ('24', '20', '1', '0', '10000', 'admin', 'Menu', null, 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO `dj_admin_menu` VALUES ('25', '20', '2', '0', '10000', 'admin', 'Menu', null, 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO `dj_admin_menu` VALUES ('26', '20', '2', '0', '10000', 'admin', 'Menu', null, 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO `dj_admin_menu` VALUES ('27', '20', '2', '0', '10000', 'admin', 'Menu', null, 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO `dj_admin_menu` VALUES ('28', '20', '1', '0', '10000', 'admin', 'Menu', null, 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO `dj_admin_menu` VALUES ('29', '6', '1', '0', '30', 'admin', 'Nav', null, 'index', '', '导航管理', '', '导航管理');
INSERT INTO `dj_admin_menu` VALUES ('30', '29', '1', '0', '10000', 'admin', 'Nav', null, 'add', '', '添加导航', '', '添加导航');
INSERT INTO `dj_admin_menu` VALUES ('31', '29', '2', '0', '10000', 'admin', 'Nav', null, 'addPost', '', '添加导航提交保存', '', '添加导航提交保存');
INSERT INTO `dj_admin_menu` VALUES ('32', '29', '1', '0', '10000', 'admin', 'Nav', null, 'edit', '', '编辑导航', '', '编辑导航');
INSERT INTO `dj_admin_menu` VALUES ('33', '29', '2', '0', '10000', 'admin', 'Nav', null, 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存');
INSERT INTO `dj_admin_menu` VALUES ('34', '29', '2', '0', '10000', 'admin', 'Nav', null, 'delete', '', '删除导航', '', '删除导航');
INSERT INTO `dj_admin_menu` VALUES ('35', '29', '1', '0', '10000', 'admin', 'NavMenu', null, 'index', '', '导航菜单', '', '导航菜单');
INSERT INTO `dj_admin_menu` VALUES ('36', '35', '1', '0', '10000', 'admin', 'NavMenu', null, 'add', '', '添加导航菜单', '', '添加导航菜单');
INSERT INTO `dj_admin_menu` VALUES ('37', '35', '2', '0', '10000', 'admin', 'NavMenu', null, 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存');
INSERT INTO `dj_admin_menu` VALUES ('38', '35', '1', '0', '10000', 'admin', 'NavMenu', null, 'edit', '', '编辑导航菜单', '', '编辑导航菜单');
INSERT INTO `dj_admin_menu` VALUES ('39', '35', '2', '0', '10000', 'admin', 'NavMenu', null, 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存');
INSERT INTO `dj_admin_menu` VALUES ('40', '35', '2', '0', '10000', 'admin', 'NavMenu', null, 'delete', '', '删除导航菜单', '', '删除导航菜单');
INSERT INTO `dj_admin_menu` VALUES ('41', '35', '2', '0', '10000', 'admin', 'NavMenu', null, 'listOrder', '', '导航菜单排序', '', '导航菜单排序');
INSERT INTO `dj_admin_menu` VALUES ('42', '1', '1', '1', '10000', 'admin', 'Plugin', null, 'index', '', '插件列表', '', '插件列表');
INSERT INTO `dj_admin_menu` VALUES ('43', '42', '2', '0', '10000', 'admin', 'Plugin', null, 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO `dj_admin_menu` VALUES ('44', '42', '1', '0', '10000', 'admin', 'Plugin', null, 'setting', '', '插件设置', '', '插件设置');
INSERT INTO `dj_admin_menu` VALUES ('45', '42', '2', '0', '10000', 'admin', 'Plugin', null, 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO `dj_admin_menu` VALUES ('46', '42', '2', '0', '10000', 'admin', 'Plugin', null, 'install', '', '插件安装', '', '插件安装');
INSERT INTO `dj_admin_menu` VALUES ('47', '42', '2', '0', '10000', 'admin', 'Plugin', null, 'update', '', '插件更新', '', '插件更新');
INSERT INTO `dj_admin_menu` VALUES ('48', '42', '2', '0', '10000', 'admin', 'Plugin', null, 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO `dj_admin_menu` VALUES ('49', '0', '0', '1', '98', 'admin', 'User', '1', 'default', '', '员工管理', '', '管理组');
INSERT INTO `dj_admin_menu` VALUES ('50', '49', '1', '1', '1', 'admin', 'Rbac', null, 'index', '', '角色管理', '', '角色管理');
INSERT INTO `dj_admin_menu` VALUES ('51', '50', '1', '0', '10000', 'admin', 'Rbac', null, 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO `dj_admin_menu` VALUES ('52', '50', '2', '0', '10000', 'admin', 'Rbac', null, 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO `dj_admin_menu` VALUES ('53', '50', '1', '0', '10000', 'admin', 'Rbac', null, 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO `dj_admin_menu` VALUES ('54', '50', '2', '0', '10000', 'admin', 'Rbac', null, 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO `dj_admin_menu` VALUES ('55', '50', '2', '0', '10000', 'admin', 'Rbac', null, 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO `dj_admin_menu` VALUES ('56', '50', '1', '0', '10000', 'admin', 'Rbac', null, 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO `dj_admin_menu` VALUES ('57', '50', '2', '0', '10000', 'admin', 'Rbac', null, 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO `dj_admin_menu` VALUES ('58', '0', '0', '1', '42', 'admin', 'Customer', '1', 'default', '', '客户管理', '', '回收站');
INSERT INTO `dj_admin_menu` VALUES ('59', '58', '2', '0', '10000', 'admin', 'RecycleBin', null, 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO `dj_admin_menu` VALUES ('60', '58', '2', '0', '10000', 'admin', 'RecycleBin', null, 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO `dj_admin_menu` VALUES ('61', '6', '1', '0', '10000', 'admin', 'Route', null, 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO `dj_admin_menu` VALUES ('62', '61', '1', '0', '10000', 'admin', 'Route', null, 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO `dj_admin_menu` VALUES ('63', '61', '2', '0', '10000', 'admin', 'Route', null, 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO `dj_admin_menu` VALUES ('64', '61', '1', '0', '10000', 'admin', 'Route', null, 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO `dj_admin_menu` VALUES ('65', '61', '2', '0', '10000', 'admin', 'Route', null, 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO `dj_admin_menu` VALUES ('66', '61', '2', '0', '10000', 'admin', 'Route', null, 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO `dj_admin_menu` VALUES ('67', '61', '2', '0', '10000', 'admin', 'Route', null, 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO `dj_admin_menu` VALUES ('68', '61', '2', '0', '10000', 'admin', 'Route', null, 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO `dj_admin_menu` VALUES ('69', '61', '2', '0', '10000', 'admin', 'Route', null, 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO `dj_admin_menu` VALUES ('70', '61', '1', '0', '10000', 'admin', 'Route', null, 'select', '', '选择URL', '', '选择URL');
INSERT INTO `dj_admin_menu` VALUES ('71', '6', '1', '1', '0', 'admin', 'Setting', '1', 'site', '', '系统设置', '', '网站信息');
INSERT INTO `dj_admin_menu` VALUES ('72', '71', '2', '0', '10000', 'admin', 'Setting', null, 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO `dj_admin_menu` VALUES ('73', '6', '1', '0', '10000', 'admin', 'Setting', null, 'password', '', '密码修改', '', '密码修改');
INSERT INTO `dj_admin_menu` VALUES ('74', '73', '2', '0', '10000', 'admin', 'Setting', null, 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO `dj_admin_menu` VALUES ('75', '6', '1', '0', '10000', 'admin', 'Setting', null, 'upload', '', '上传设置', '', '上传设置');
INSERT INTO `dj_admin_menu` VALUES ('76', '75', '2', '0', '10000', 'admin', 'Setting', null, 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO `dj_admin_menu` VALUES ('77', '6', '1', '0', '10000', 'admin', 'Setting', null, 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO `dj_admin_menu` VALUES ('78', '6', '1', '0', '40', 'admin', 'Slide', null, 'index', '', '幻灯片管理', '', '幻灯片管理');
INSERT INTO `dj_admin_menu` VALUES ('79', '78', '1', '0', '10000', 'admin', 'Slide', null, 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO `dj_admin_menu` VALUES ('80', '78', '2', '0', '10000', 'admin', 'Slide', null, 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO `dj_admin_menu` VALUES ('81', '78', '1', '0', '10000', 'admin', 'Slide', null, 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO `dj_admin_menu` VALUES ('82', '78', '2', '0', '10000', 'admin', 'Slide', null, 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO `dj_admin_menu` VALUES ('83', '78', '2', '0', '10000', 'admin', 'Slide', null, 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO `dj_admin_menu` VALUES ('84', '78', '1', '0', '10000', 'admin', 'SlideItem', null, 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO `dj_admin_menu` VALUES ('85', '84', '1', '0', '10000', 'admin', 'SlideItem', null, 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO `dj_admin_menu` VALUES ('86', '84', '2', '0', '10000', 'admin', 'SlideItem', null, 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO `dj_admin_menu` VALUES ('87', '84', '1', '0', '10000', 'admin', 'SlideItem', null, 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO `dj_admin_menu` VALUES ('88', '84', '2', '0', '10000', 'admin', 'SlideItem', null, 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO `dj_admin_menu` VALUES ('89', '84', '2', '0', '10000', 'admin', 'SlideItem', null, 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO `dj_admin_menu` VALUES ('90', '84', '2', '0', '10000', 'admin', 'SlideItem', null, 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO `dj_admin_menu` VALUES ('91', '84', '2', '0', '10000', 'admin', 'SlideItem', null, 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO `dj_admin_menu` VALUES ('92', '84', '2', '0', '10000', 'admin', 'SlideItem', null, 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO `dj_admin_menu` VALUES ('93', '6', '1', '0', '10000', 'admin', 'Storage', null, 'index', '', '文件存储', '', '文件存储');
INSERT INTO `dj_admin_menu` VALUES ('94', '93', '2', '0', '10000', 'admin', 'Storage', null, 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO `dj_admin_menu` VALUES ('95', '6', '1', '0', '20', 'admin', 'Theme', null, 'index', '', '模板管理', '', '模板管理');
INSERT INTO `dj_admin_menu` VALUES ('96', '95', '1', '0', '10000', 'admin', 'Theme', null, 'install', '', '安装模板', '', '安装模板');
INSERT INTO `dj_admin_menu` VALUES ('97', '95', '2', '0', '10000', 'admin', 'Theme', null, 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO `dj_admin_menu` VALUES ('98', '95', '2', '0', '10000', 'admin', 'Theme', null, 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO `dj_admin_menu` VALUES ('99', '95', '2', '0', '10000', 'admin', 'Theme', null, 'update', '', '模板更新', '', '模板更新');
INSERT INTO `dj_admin_menu` VALUES ('100', '95', '2', '0', '10000', 'admin', 'Theme', null, 'active', '', '启用模板', '', '启用模板');
INSERT INTO `dj_admin_menu` VALUES ('101', '95', '1', '0', '10000', 'admin', 'Theme', null, 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO `dj_admin_menu` VALUES ('102', '95', '1', '0', '10000', 'admin', 'Theme', null, 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO `dj_admin_menu` VALUES ('103', '95', '1', '0', '10000', 'admin', 'Theme', null, 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO `dj_admin_menu` VALUES ('104', '95', '2', '0', '10000', 'admin', 'Theme', null, 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO `dj_admin_menu` VALUES ('105', '95', '2', '0', '10000', 'admin', 'Theme', null, 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO `dj_admin_menu` VALUES ('106', '95', '2', '0', '10000', 'admin', 'Theme', null, 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO `dj_admin_menu` VALUES ('107', '95', '2', '0', '10000', 'admin', 'Theme', null, 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO `dj_admin_menu` VALUES ('108', '95', '1', '0', '10000', 'admin', 'Theme', null, 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO `dj_admin_menu` VALUES ('109', '95', '1', '0', '10000', 'admin', 'Theme', null, 'design', '', '模板设计', '', '模板设计');
INSERT INTO `dj_admin_menu` VALUES ('110', '0', '0', '0', '10', 'admin', 'Customer', null, 'default', '', '客户管理', 'group', '用户管理');
INSERT INTO `dj_admin_menu` VALUES ('111', '49', '1', '1', '3', 'admin', 'User', '0', 'index', '', '员工查询', '', '管理员管理');
INSERT INTO `dj_admin_menu` VALUES ('112', '49', '0', '1', '2', 'admin', 'User', '1', 'add', '', '新增员工', '', '管理员添加');
INSERT INTO `dj_admin_menu` VALUES ('113', '49', '2', '0', '10000', 'admin', 'User', null, 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO `dj_admin_menu` VALUES ('114', '49', '1', '0', '10000', 'admin', 'User', '1', 'edit', '', '修改员工信息', '', '管理员编辑');
INSERT INTO `dj_admin_menu` VALUES ('115', '49', '2', '0', '10000', 'admin', 'User', null, 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO `dj_admin_menu` VALUES ('116', '49', '1', '0', '10000', 'admin', 'User', null, 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO `dj_admin_menu` VALUES ('117', '49', '2', '0', '10000', 'admin', 'User', null, 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO `dj_admin_menu` VALUES ('118', '49', '2', '0', '10000', 'admin', 'User', null, 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO `dj_admin_menu` VALUES ('119', '49', '2', '0', '10000', 'admin', 'User', null, 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO `dj_admin_menu` VALUES ('120', '49', '2', '0', '10000', 'admin', 'User', null, 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO `dj_admin_menu` VALUES ('121', '0', '1', '0', '9', 'user', 'AdminAsset', null, 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO `dj_admin_menu` VALUES ('122', '121', '2', '0', '10000', 'user', 'AdminAsset', null, 'delete', '', '删除文件', '', '删除文件');
INSERT INTO `dj_admin_menu` VALUES ('123', '110', '0', '0', '10000', 'user', 'AdminIndex', null, 'default1', '', '用户组', '', '用户组');
INSERT INTO `dj_admin_menu` VALUES ('124', '123', '1', '1', '10000', 'user', 'AdminIndex', null, 'index', '', '本站用户', '', '本站用户');
INSERT INTO `dj_admin_menu` VALUES ('125', '124', '2', '0', '10000', 'user', 'AdminIndex', null, 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO `dj_admin_menu` VALUES ('126', '124', '2', '0', '10000', 'user', 'AdminIndex', null, 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `dj_admin_menu` VALUES ('127', '123', '1', '1', '10000', 'user', 'AdminOauth', null, 'index', '', '第三方用户', '', '第三方用户');
INSERT INTO `dj_admin_menu` VALUES ('128', '127', '2', '0', '10000', 'user', 'AdminOauth', null, 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定');
INSERT INTO `dj_admin_menu` VALUES ('129', '6', '0', '1', '10000', 'admin', 'RecordLog', '1', 'index', '', '操作日志', '', '用户操作管理');
INSERT INTO `dj_admin_menu` VALUES ('130', '129', '1', '0', '10000', 'user', 'AdminUserAction', null, 'edit', '', '编辑用户操作', '', '编辑用户操作');
INSERT INTO `dj_admin_menu` VALUES ('131', '129', '2', '0', '10000', 'user', 'AdminUserAction', null, 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交');
INSERT INTO `dj_admin_menu` VALUES ('132', '129', '1', '0', '10000', 'user', 'AdminUserAction', null, 'sync', '', '同步用户操作', '', '同步用户操作');
INSERT INTO `dj_admin_menu` VALUES ('162', '0', '0', '0', '0', 'plugin/Demo', 'AdminIndex', null, 'default', '', '演示插件', 'dashboard', '演示插件入口');
INSERT INTO `dj_admin_menu` VALUES ('163', '162', '1', '0', '10000', 'plugin/Demo', 'AdminIndex', null, 'index', '', '演示插件用户列表', '', '演示插件用户列表');
INSERT INTO `dj_admin_menu` VALUES ('164', '163', '1', '0', '10000', 'plugin/Demo', 'AdminIndex', null, 'setting', '', '演示插件设置', '', '演示插件设置');
INSERT INTO `dj_admin_menu` VALUES ('165', '58', '0', '1', '10000', 'admin', 'Customer', '1', 'add', '', '添加意向客户', 'plus', '');
INSERT INTO `dj_admin_menu` VALUES ('166', '58', '0', '1', '10000', 'admin', 'Customer', '1', 'unindex', '', '报单', '', '');
INSERT INTO `dj_admin_menu` VALUES ('167', '58', '0', '1', '10000', 'admin', 'Customer', null, 'index', '', '客户查询', '', '');
INSERT INTO `dj_admin_menu` VALUES ('168', '0', '1', '0', '10000', 'admin', 'Message', '0', 'notice', '', '通知管理', '', '');
INSERT INTO `dj_admin_menu` VALUES ('169', '0', '1', '0', '10000', 'admin', 'Message', null, 'search', '', '聊天记录管理', '', '');
INSERT INTO `dj_admin_menu` VALUES ('170', '58', '0', '0', '10000', 'admin', 'Customer', '1', 'check', '', '审核意向客户', '', '');
INSERT INTO `dj_admin_menu` VALUES ('171', '58', '0', '0', '10000', 'admin', 'Customer', '1', 'edit', '', '注册客户', '', '');
INSERT INTO `dj_admin_menu` VALUES ('172', '58', '0', '0', '10000', 'admin', 'Customer', '1', 'edit', '', '修改客户资料', '', '');
INSERT INTO `dj_admin_menu` VALUES ('173', '58', '0', '0', '10000', 'admin', 'Customer', '1', 'changestatus', '', '启用/停用客户', '', '');
INSERT INTO `dj_admin_menu` VALUES ('174', '58', '0', '0', '10000', 'admin', 'Customer', '1', 'dialog', '', '更改客户所属员工', '', '');
INSERT INTO `dj_admin_menu` VALUES ('175', '58', '0', '0', '10000', 'admin', 'Customer', '1', 'info', '', '查看客户资料', '', '');
INSERT INTO `dj_admin_menu` VALUES ('176', '49', '0', '0', '10000', 'admin', 'User', '1', 'resetpwd', '', '重置员工密码', '', '');
INSERT INTO `dj_admin_menu` VALUES ('177', '49', '0', '0', '10000', 'admin', 'User', '1', 'ban', '', '启用/停用员工', '', '');

-- ----------------------------
-- Table structure for dj_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `dj_auth_access`;
CREATE TABLE `dj_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限授权表';

-- ----------------------------
-- Records of dj_auth_access
-- ----------------------------
INSERT INTO `dj_auth_access` VALUES ('1', '5', 'admin/customer/default', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('2', '5', 'admin/customer/edit', 'admin_url');
INSERT INTO `dj_auth_access` VALUES ('3', '5', 'admin/customer/edit', 'admin_url');

-- ----------------------------
-- Table structure for dj_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `dj_auth_rule`;
CREATE TABLE `dj_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='权限规则表';

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
INSERT INTO `dj_auth_rule` VALUES ('168', '1', 'admin', 'admin_url', 'admin/Message/notice', '', '通知管理', '');
INSERT INTO `dj_auth_rule` VALUES ('169', '1', 'admin', 'admin_url', 'admin/Message/search', '', '聊天记录管理', '');
INSERT INTO `dj_auth_rule` VALUES ('170', '1', 'admin', 'admin_url', 'admin/Customer/check', '', '审核意向客户', '');
INSERT INTO `dj_auth_rule` VALUES ('171', '1', 'admin', 'admin_url', 'admin/Customer/edit', '', '注册客户', '');
INSERT INTO `dj_auth_rule` VALUES ('172', '1', 'admin', 'admin_url', 'admin/Customer/default', '', '客户管理', '');

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
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '原文地址',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `table_id_status` (`table_name`,`object_id`,`status`) USING BTREE,
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论表';

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
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `sex` tinyint(2) DEFAULT NULL COMMENT '性别;0:保密,1:男,2:女',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账号',
  `login_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `worker_uid` int(11) DEFAULT NULL COMMENT '所属员工',
  `check_uid` int(11) DEFAULT NULL COMMENT '审核管理员',
  `check_role_id` int(11) DEFAULT NULL COMMENT '用户角色ID',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `user_status` tinyint(2) DEFAULT NULL COMMENT '状态：1.启用2.禁用',
  `check_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `check_status` tinyint(2) DEFAULT NULL COMMENT '客户审核状态：1.审核中，2.通过，3.驳回',
  `customer_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录密码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_status` (`user_status`) USING BTREE,
  KEY `check_uid` (`check_uid`) USING BTREE,
  KEY `worker_uid` (`worker_uid`) USING BTREE,
  KEY `check_status` (`check_status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='客户列表';

-- ----------------------------
-- Records of dj_customer
-- ----------------------------
INSERT INTO `dj_customer` VALUES ('1', '郭斐斐', '20190928\\720868e46e13ea5c81062fb2d2be7646.jpg', null, null, '5d8f1d8648e2e', null, '北京市-北京市市辖区-东城区', '发范德萨发范德萨飞洒', '15', '11', '4', null, null, null, '2019-09-30 15:21:11', '2019-09-30 15:21:11', '1', '2019-09-14 15:50:43', '3', null);
INSERT INTO `dj_customer` VALUES ('2', '鲜露', null, null, null, '5d8f1d8748e2e', null, '江西省-南昌市-东湖区', '展览地址展览地址展览地址', '17', '11', '4', null, null, null, '2019-09-30 15:21:04', '2019-09-30 15:21:04', '2', '2019-09-14 16:48:22', '2', null);
INSERT INTO `dj_customer` VALUES ('3', '张波', null, null, null, '5d8f1d8p48e2e', null, '江苏省-南京市-玄武区', '申达股份大概多少广泛大使馆的是是的广东省', '13', '6', '4', null, null, null, '2019-09-30 15:20:54', '2019-09-30 15:20:54', '1', '2019-09-14 16:48:58', '1', null);
INSERT INTO `dj_customer` VALUES ('5', '刘全明', null, null, null, '5d8f1d8548e2e', null, '辽宁省-沈阳市-和平区', '发放大发送到', '3', '6', '4', null, null, null, '2019-09-30 15:20:38', '2019-09-30 15:20:38', '2', '2019-09-14 22:33:19', '2', null);
INSERT INTO `dj_customer` VALUES ('6', '郭婷', null, null, null, '5d8fwd8648e2e', null, '北京市-北京市市辖区-东城区', '发顺丰', '15', '6', '4', null, null, null, '2019-09-30 15:20:32', '2019-09-30 15:20:32', '1', '2019-09-14 23:04:57', '2', null);
INSERT INTO `dj_customer` VALUES ('7', '王菲', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1624240531,2195794812&fm=26&gp=0.jpg', null, null, '5ddf1d8648e2e', null, '北京市-北京市市辖区-东城区', '发顺丰', '1', '6', '4', null, null, null, '2019-09-30 15:20:29', '2019-09-30 15:20:29', '2', '2019-09-14 23:05:09', '1', null);
INSERT INTO `dj_customer` VALUES ('8', '张杰', null, null, 'DJ20190923008', '5d92199f49453', null, '北京市-北京市市辖区-东城区', '发顺丰', '1', '6', '4', null, null, null, '2019-09-30 23:05:03', '2019-09-30 23:05:03', '1', '2019-09-14 23:05:33', '1', '###51e3068a9000b7d103321d51be30a7f4');
INSERT INTO `dj_customer` VALUES ('9', '孙俪', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=443974585,2422984981&fm=26&gp=0.jpg', '1', 'DJ20190914009', '5d921bcc0b3b2', '13558758764', '北京市-北京市市辖区-东城区', '四川省成都市热风发发的发大水发所发生的发的发的发生大发斯蒂芬手打发发傻是的范德萨发撒的富士达发的发撒的发生发送到发生发', '1', '6', '4', '4354353', '373966902@qq.com', '郭德纲的方式国防生的观点发送到发生安防十大发送到法师打发发生发生发送到', '2019-09-30 23:14:20', '2019-09-30 23:14:20', '1', '2019-09-14 23:20:41', '2', '###51e3068a9000b7d103321d51be30a7f4');

-- ----------------------------
-- Table structure for dj_district
-- ----------------------------
DROP TABLE IF EXISTS `dj_district`;
CREATE TABLE `dj_district` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='中国省市区乡镇数据表';

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
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统钩子表';

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
  `hook` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统钩子插件表';

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
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='友情链接表';

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
  `user_type` tinyint(2) DEFAULT NULL COMMENT '发送者身份（1客服，2客户）',
  `uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `from_uid` int(11) DEFAULT NULL COMMENT '发送人UID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '操作人角色ID',
  `type` tinyint(2) NOT NULL COMMENT '类型:1文字，2文件',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '信息ID',
  `is_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '2' COMMENT '是否阅读（1已读2未读）',
  `c_month` int(11) DEFAULT NULL COMMENT '月份',
  `c_year` int(11) DEFAULT NULL COMMENT '年份',
  `c_day` date DEFAULT NULL COMMENT '年月日',
  `c_week` int(11) DEFAULT NULL COMMENT '一年的第几周',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `sender_avatar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发送者头像',
  `sender_nickname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发送者昵称',
  `accepter_avatar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '接收者头像',
  `accepter_nickname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '接收者昵称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `c_month` (`c_month`) USING BTREE,
  KEY `c_year` (`c_year`) USING BTREE,
  KEY `c_day` (`c_day`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='聊天记录';

-- ----------------------------
-- Records of dj_message
-- ----------------------------
INSERT INTO `dj_message` VALUES ('1', '2', '9', '1', '我是客户<div><br></div>', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 10:22:53', null, null, null, null);
INSERT INTO `dj_message` VALUES ('2', '1', '1', '9', '我是客服', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 10:23:10', null, null, null, null);
INSERT INTO `dj_message` VALUES ('3', '1', '1', '9', '1111', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 10:24:53', null, null, null, null);
INSERT INTO `dj_message` VALUES ('4', '2', '9', '1', '2222', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 10:25:01', null, null, null, null);
INSERT INTO `dj_message` VALUES ('5', '1', '1', '9', '3333', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 10:25:09', null, null, null, null);
INSERT INTO `dj_message` VALUES ('6', '2', '9', '1', '4444', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 10:25:15', null, null, null, null);
INSERT INTO `dj_message` VALUES ('7', '2', '9', '1', '5555', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 10:26:04', null, null, null, null);
INSERT INTO `dj_message` VALUES ('8', '1', '1', '9', '6666', '1', '', '1', '9', '2019', '2019-09-26', '39', '2019-09-26 12:28:12', null, null, null, null);
INSERT INTO `dj_message` VALUES ('9', '2', '9', '1', 'fdsa&nbsp;', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 17:37:36', null, null, null, null);
INSERT INTO `dj_message` VALUES ('10', '1', '9', '1', 'fdsfsfs', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-30 08:11:35', null, null, null, null);
INSERT INTO `dj_message` VALUES ('11', '2', '9', '1', 'fdsfdsfds', '1', '', '2', '9', '2019', '2019-09-26', '39', '2019-09-26 18:33:34', null, null, null, null);
INSERT INTO `dj_message` VALUES ('12', '1', '1', '9', 'fdsf dsf', '1', '', '2', '9', '2019', '2019-09-28', '39', '2019-09-28 16:47:50', null, null, null, null);
INSERT INTO `dj_message` VALUES ('13', '1', '1', '3', '<img src=\"assets/img/face/ee_19.png\" alt=\"表情19\">', '1', '', '2', '9', '2019', '2019-09-29', '39', '2019-09-29 22:41:13', null, null, null, null);
INSERT INTO `dj_message` VALUES ('14', '1', '1', '3', '<img src=\"assets/img/face/ee_14.png\" alt=\"表情14\">', '1', '', '2', '9', '2019', '2019-09-29', '39', '2019-09-29 22:41:34', null, null, null, null);
INSERT INTO `dj_message` VALUES ('15', '1', '1', '3', 'fdasfdasfdsa', '1', '', '2', '9', '2019', '2019-09-29', '39', '2019-09-29 22:50:51', null, null, null, null);
INSERT INTO `dj_message` VALUES ('16', '1', '1', '9', 'ppppp', '1', '', '2', '9', '2019', '2019-09-29', '39', '2019-09-29 22:51:09', null, null, null, null);
INSERT INTO `dj_message` VALUES ('17', '1', '1', '9', '你的5555', '1', '', '2', '9', '2019', '2019-09-29', '39', '2019-09-29 22:52:06', null, null, null, null);
INSERT INTO `dj_message` VALUES ('18', '1', '1', '1', '9999999999999999999999999999999999999', '1', '', '2', '9', '2019', '2019-09-29', '39', '2019-09-29 23:17:55', null, null, null, null);
INSERT INTO `dj_message` VALUES ('19', '1', '1', '1', '888888888888888', '1', '', '2', '9', '2019', '2019-09-29', '39', '2019-09-29 23:18:58', null, null, null, null);
INSERT INTO `dj_message` VALUES ('20', '1', '1', '3', '555555555555555', '1', '', '2', '9', '2019', '2019-09-29', '39', '2019-09-29 23:20:45', null, null, null, null);
INSERT INTO `dj_message` VALUES ('21', '2', '8', '1', '法守法防守打法当时是多少', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 15:12:49', null, null, null, null);
INSERT INTO `dj_message` VALUES ('22', '2', '8', '1', '66666', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 15:53:42', null, null, null, null);
INSERT INTO `dj_message` VALUES ('23', '2', '8', '1', '66677777', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 15:54:41', null, null, null, null);
INSERT INTO `dj_message` VALUES ('24', '2', '8', '1', '9999999', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 15:57:56', null, null, null, null);
INSERT INTO `dj_message` VALUES ('25', '2', '8', '1', '676766', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 15:58:36', null, null, null, null);
INSERT INTO `dj_message` VALUES ('26', '2', '8', '1', '防守打法胜多负少', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:00:42', null, null, null, null);
INSERT INTO `dj_message` VALUES ('27', '2', '8', '1', '公司大股东是刚发的', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:00:52', null, null, null, null);
INSERT INTO `dj_message` VALUES ('28', '2', '8', '1', '法法师打发大水发送到', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:01:13', null, null, null, null);
INSERT INTO `dj_message` VALUES ('29', '2', '8', '1', '发大是非得失发多少', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:02:39', null, null, null, null);
INSERT INTO `dj_message` VALUES ('30', '2', '8', '1', '共和国官方第三个刚发的', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:02:53', null, null, null, null);
INSERT INTO `dj_message` VALUES ('31', '2', '8', '1', '发送到发送到', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:05:03', null, null, null, null);
INSERT INTO `dj_message` VALUES ('32', '2', '8', '1', '666565656', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:05:36', null, null, null, null);
INSERT INTO `dj_message` VALUES ('33', '2', '8', '1', '法师法师', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:07:38', null, null, null, null);
INSERT INTO `dj_message` VALUES ('34', '2', '8', '1', '发生大法师打发', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:07:58', null, null, null, null);
INSERT INTO `dj_message` VALUES ('35', '2', '8', '1', '法法师打', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:10:13', null, null, null, null);
INSERT INTO `dj_message` VALUES ('36', '2', '8', '1', '发送到发送到', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:11:58', null, null, null, null);
INSERT INTO `dj_message` VALUES ('37', '2', '8', '1', '发送到发送到', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:12:04', null, null, null, null);
INSERT INTO `dj_message` VALUES ('38', '2', '8', '1', '防守打法当时发发发', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:12:28', null, null, null, null);
INSERT INTO `dj_message` VALUES ('39', '2', '8', '1', '88888', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:12:33', null, null, null, null);
INSERT INTO `dj_message` VALUES ('40', '2', '8', '1', '878787', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 16:14:41', null, null, null, null);
INSERT INTO `dj_message` VALUES ('41', '2', '8', '1', '我是最后一条<div><br></div>', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 21:02:06', null, null, null, null);
INSERT INTO `dj_message` VALUES ('42', '2', '8', '1', '真的吗？<div><br></div>', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 21:34:50', null, null, null, null);
INSERT INTO `dj_message` VALUES ('43', '2', '8', '1', '<img src=\"assets/img/face/ee_35.png\" alt=\"表情35\">', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:00:22', null, null, null, null);
INSERT INTO `dj_message` VALUES ('44', '2', '8', '1', 'fsdfds&nbsp;', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:05:01', null, null, null, null);
INSERT INTO `dj_message` VALUES ('45', '2', '8', '1', '<img src=\"assets/img/face/ee_20.png\" alt=\"表情20\">', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:05:05', null, null, null, null);
INSERT INTO `dj_message` VALUES ('46', '2', '8', '1', 'fdsafsdfsd', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:05:57', null, null, null, null);
INSERT INTO `dj_message` VALUES ('47', '2', '8', '1', '<img src=\"assets/img/face/ee_19.png\" alt=\"表情19\">', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:06:00', null, null, null, null);
INSERT INTO `dj_message` VALUES ('48', '2', '8', '1', 'fsdfdsfsdf', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:06:49', null, null, null, null);
INSERT INTO `dj_message` VALUES ('49', '2', '8', '1', '<img src=\"assets/img/face/ee_19.png\" alt=\"表情19\">', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:06:52', null, null, null, null);
INSERT INTO `dj_message` VALUES ('50', '2', '8', '1', 'fsdfsdfsd', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:08:39', null, null, null, null);
INSERT INTO `dj_message` VALUES ('51', '2', '8', '1', '<img src=\"assets/img/face/ee_20.png\" alt=\"表情20\">', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:08:43', null, null, null, null);
INSERT INTO `dj_message` VALUES ('52', '2', '8', '1', '<img src=\"assets/img/face/ee_31.png\" alt=\"表情31\">', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:08:52', null, null, null, null);
INSERT INTO `dj_message` VALUES ('53', '2', '8', '1', 'fdsfsdfsd', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:11:08', null, null, null, null);
INSERT INTO `dj_message` VALUES ('54', '2', '8', '1', '<img src=\"assets/img/face/ee_18.png\" alt=\"表情18\">', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:11:11', null, null, null, null);
INSERT INTO `dj_message` VALUES ('55', '2', '8', '1', 'fsfsfds', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:11:42', null, null, null, null);
INSERT INTO `dj_message` VALUES ('56', '2', '8', '1', '<img src=\"assets/img/face/ee_17.png\" alt=\"表情17\">', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:11:45', null, null, null, null);
INSERT INTO `dj_message` VALUES ('57', '2', '8', '1', 'fdsfsdfsd', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:13:06', null, null, null, null);
INSERT INTO `dj_message` VALUES ('58', '2', '8', '1', '<img src=\"assets/img/face/ee_10.png\" alt=\"表情10\">', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:13:09', null, null, null, null);
INSERT INTO `dj_message` VALUES ('59', '2', '8', '1', 'fdsafadsfds', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:14:00', null, null, null, null);
INSERT INTO `dj_message` VALUES ('60', '2', '8', '1', '<img src=\"assets/img/face/ee_12.png\" alt=\"表情12\">', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 22:14:04', null, null, null, null);
INSERT INTO `dj_message` VALUES ('61', '2', '8', '1', 'fasdfafasfasdfdsa', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 23:09:07', null, '张杰', '20190929/a892039fd455cba1cd7aad7408dac70d.jpg', 'admin11');
INSERT INTO `dj_message` VALUES ('62', '2', '8', '1', '你的ixn情地点', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 23:12:54', null, '张杰', '20190929/a892039fd455cba1cd7aad7408dac70d.jpg', 'admin11');
INSERT INTO `dj_message` VALUES ('63', '2', '9', '1', '你好&nbsp; 我是孙俪', '1', '', '2', '9', '2019', '2019-09-30', '40', '2019-09-30 23:15:47', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=443974585,2422984981&fm=26&gp=0.jpg', '孙俪', '20190929/a892039fd455cba1cd7aad7408dac70d.jpg', 'admin11');
INSERT INTO `dj_message` VALUES ('64', '1', '1', '9', '你到底是谁', '1', '', '2', '10', '2019', '2019-10-01', '40', '2019-10-01 00:34:44', '20190929/a892039fd455cba1cd7aad7408dac70d.jpg', 'admin11', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=443974585,2422984981&fm=26&gp=0.jpg', '孙俪');
INSERT INTO `dj_message` VALUES ('65', '1', '1', '9', '你到底是谁', '1', '', '2', '10', '2019', '2019-10-01', '40', '2019-10-01 00:35:05', '20190929/a892039fd455cba1cd7aad7408dac70d.jpg', 'admin11', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=443974585,2422984981&fm=26&gp=0.jpg', '孙俪');

-- ----------------------------
-- Table structure for dj_nav
-- ----------------------------
DROP TABLE IF EXISTS `dj_nav`;
CREATE TABLE `dj_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='前台导航位置表';

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
  `target` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='前台导航菜单表';

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
  `is_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否阅读（1已读2未读）',
  `is_customer` tinyint(2) DEFAULT NULL COMMENT '是否是客户（1客服2客户）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `c_month` (`c_month`) USING BTREE,
  KEY `c_year` (`c_year`) USING BTREE,
  KEY `c_day` (`c_day`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='消息通知';

-- ----------------------------
-- Records of dj_notice
-- ----------------------------
INSERT INTO `dj_notice` VALUES ('1', '1', '1', '张大龙', '4', null, '', '9', null, null, null, '2019-09-19 13:33:19', null, null);
INSERT INTO `dj_notice` VALUES ('2', '2', '2', '员工张三', '24', null, '', '7', null, null, null, '2019-09-26 15:51:00', null, null);
INSERT INTO `dj_notice` VALUES ('3', '2', null, '员工张三', '5', null, '', '5', null, null, null, '2019-09-19 13:33:17', null, null);
INSERT INTO `dj_notice` VALUES ('7', '1', '1', 'cesh', '22', null, null, null, null, null, null, '2019-09-26 15:51:02', null, null);
INSERT INTO `dj_notice` VALUES ('21', '1', '1', 'cesh', '5', null, null, null, null, null, null, '2019-09-26 15:51:22', null, null);
INSERT INTO `dj_notice` VALUES ('20', '1', '1', 'cesh', '4', null, null, null, null, null, null, '2019-09-26 15:51:20', null, null);
INSERT INTO `dj_notice` VALUES ('10', '1', '1', 'cesh', '8', null, null, null, null, null, null, '2019-09-26 15:50:51', null, null);
INSERT INTO `dj_notice` VALUES ('11', '1', '1', 'cesh', '7', null, null, null, null, null, null, '2019-09-26 15:50:50', null, null);
INSERT INTO `dj_notice` VALUES ('19', '1', '1', 'cesh', '8', null, null, null, null, null, null, '2019-09-26 15:51:23', null, null);
INSERT INTO `dj_notice` VALUES ('13', '1', '1', 'cesh', '5', null, null, null, null, null, null, '2019-09-26 15:50:48', null, null);
INSERT INTO `dj_notice` VALUES ('14', '1', '1', 'cesh', '8', null, null, null, null, null, null, '2019-09-26 15:50:35', null, null);
INSERT INTO `dj_notice` VALUES ('15', '1', '1', 'cesh', '5', null, null, null, null, null, null, '2019-09-30 09:35:53', '2', null);
INSERT INTO `dj_notice` VALUES ('16', '1', '1', 'cesh', '22', null, null, null, null, null, null, '2019-09-30 09:35:56', '1', null);
INSERT INTO `dj_notice` VALUES ('17', '1', '1', 'cesh', '29', null, null, null, null, null, null, '2019-09-26 15:40:02', null, null);
INSERT INTO `dj_notice` VALUES ('18', '1', '1', 'cesh', '28', null, null, null, null, null, null, '2019-09-26 15:40:00', null, null);
INSERT INTO `dj_notice` VALUES ('22', '1', '1', 'cesh', '9', null, null, null, null, null, null, '2019-09-26 15:51:24', null, null);
INSERT INTO `dj_notice` VALUES ('23', '1', '1', 'cesh', '14', null, null, null, null, null, null, '2019-09-26 15:51:49', null, null);
INSERT INTO `dj_notice` VALUES ('24', '1', '1', 'cesh', '22', null, null, null, null, null, null, '2019-09-26 15:51:25', null, null);
INSERT INTO `dj_notice` VALUES ('25', '1', '1', 'cesh', '23', null, null, null, null, null, null, '2019-09-26 15:51:26', null, null);
INSERT INTO `dj_notice` VALUES ('26', '1', '1', 'cesh', '25', null, null, null, null, null, null, '2019-09-26 15:51:27', null, null);
INSERT INTO `dj_notice` VALUES ('27', '1', '1', 'cesh', '27', null, null, null, null, null, null, '2019-09-26 15:51:28', null, null);
INSERT INTO `dj_notice` VALUES ('28', '1', '1', 'cesh', '22', null, null, null, null, null, null, '2019-09-26 15:51:29', null, null);
INSERT INTO `dj_notice` VALUES ('29', '1', '1', 'cesh', '24', null, null, null, null, null, null, '2019-09-26 15:51:34', null, null);
INSERT INTO `dj_notice` VALUES ('30', '1', '1', 'cesh', '12', null, null, null, null, null, null, '2019-09-26 15:51:36', null, null);

-- ----------------------------
-- Table structure for dj_option
-- ----------------------------
DROP TABLE IF EXISTS `dj_option`;
CREATE TABLE `dj_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `option_name` (`option_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of dj_option
-- ----------------------------
INSERT INTO `dj_option` VALUES ('1', '1', 'site_info', '{\"site_name\":\"\\u9f0e\\u5065\\u5ba2\\u6237\\u7ba1\\u7406\\u7cfb\\u7edf\",\"site_seo_title\":\"\\u9f0e\\u5065\\u5ba2\\u6237\\u7ba1\\u7406\\u7cfb\\u7edf\",\"site_seo_keywords\":\"\\u9f0e\\u5065\\u5ba2\\u6237\\u7ba1\\u7406\\u7cfb\\u7edf,php\",\"site_seo_description\":\"\\u9f0e\\u5065\\u5ba2\\u6237\\u7ba1\\u7406\\u7cfb\\u7edf-\",\"forget_pwd\":\"\\u8bf7\\u4e0e\\u7ba1\\u7406\\u5458\\u8054\\u7cfb\\uff0c\\u8c22\\u8c22\\uff01\",\"site_icp\":\"\",\"site_gwa\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\",\"customer_default_pwd\":\"333\",\"worker_default_pwd\":\"123456\"}');
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
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '插件描述',
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '插件配置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='插件表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

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
  `is_customer` tinyint(2) DEFAULT NULL COMMENT '是否是客户（1客服，2客户）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `c_month` (`c_month`) USING BTREE,
  KEY `c_year` (`c_year`) USING BTREE,
  KEY `c_day` (`c_day`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='鼎健操作日志表';

-- ----------------------------
-- Records of dj_record_log
-- ----------------------------
INSERT INTO `dj_record_log` VALUES ('1', '1', '1', '张大龙', '4', null, '', '9', null, null, null, '2019-09-19 13:33:19', null);
INSERT INTO `dj_record_log` VALUES ('2', '2', '2', '员工张三', null, null, '', '7', null, null, null, '2019-09-19 13:48:46', null);
INSERT INTO `dj_record_log` VALUES ('3', '2', null, '员工张三', '5', null, '', '5', null, null, null, '2019-09-19 13:33:17', null);
INSERT INTO `dj_record_log` VALUES ('4', '1', '1', 'admin11', '28', '6', null, '9', '2019', '2019-09-19', '38', '2019-09-19 12:27:01', null);
INSERT INTO `dj_record_log` VALUES ('5', '1', '1', 'admin11', '28', '9', null, '9', '2019', '2019-09-19', '38', '2019-09-19 12:39:53', null);
INSERT INTO `dj_record_log` VALUES ('6', '1', '1', 'admin11', '29', '6', null, '9', '2019', '2019-09-19', '38', '2019-09-19 13:49:40', null);
INSERT INTO `dj_record_log` VALUES ('7', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-24', '39', '2019-09-24 09:50:15', null);
INSERT INTO `dj_record_log` VALUES ('8', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-24', '39', '2019-09-24 09:53:01', null);
INSERT INTO `dj_record_log` VALUES ('9', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-24', '39', '2019-09-24 09:53:21', null);
INSERT INTO `dj_record_log` VALUES ('10', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-28', '39', '2019-09-28 11:15:53', null);
INSERT INTO `dj_record_log` VALUES ('11', '1', '1', 'admin11', '6', null, null, '9', '2019', '2019-09-28', '39', '2019-09-28 11:16:46', null);
INSERT INTO `dj_record_log` VALUES ('12', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-28', '39', '2019-09-28 16:23:47', null);
INSERT INTO `dj_record_log` VALUES ('13', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-28', '39', '2019-09-28 16:38:34', null);
INSERT INTO `dj_record_log` VALUES ('14', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-28', '39', '2019-09-28 16:47:39', null);
INSERT INTO `dj_record_log` VALUES ('15', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-29', '39', '2019-09-29 10:09:58', null);
INSERT INTO `dj_record_log` VALUES ('16', '1', '1', 'admin11', '5', '5', null, '9', '2019', '2019-09-29', '39', '2019-09-29 15:54:39', null);
INSERT INTO `dj_record_log` VALUES ('17', '1', '1', 'admin11', '14', '13', null, '9', '2019', '2019-09-29', '39', '2019-09-29 16:04:43', null);
INSERT INTO `dj_record_log` VALUES ('18', '1', '1', 'admin11', '15', '13', null, '9', '2019', '2019-09-29', '39', '2019-09-29 16:04:47', null);
INSERT INTO `dj_record_log` VALUES ('19', '1', '1', 'admin11', '12', '11', null, '9', '2019', '2019-09-29', '39', '2019-09-29 16:20:54', null);
INSERT INTO `dj_record_log` VALUES ('20', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-29', '39', '2019-09-29 16:38:13', null);
INSERT INTO `dj_record_log` VALUES ('21', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-29', '39', '2019-09-29 16:38:37', null);
INSERT INTO `dj_record_log` VALUES ('22', '1', '1', 'admin11', '2', '1', null, '9', '2019', '2019-09-30', '40', '2019-09-30 11:20:45', '1');
INSERT INTO `dj_record_log` VALUES ('23', '1', '1', 'admin11', '1', '1', null, '9', '2019', '2019-09-30', '40', '2019-09-30 11:20:58', '1');
INSERT INTO `dj_record_log` VALUES ('24', '8', null, '张杰', '41', null, null, '9', '2019', '2019-09-30', '40', '2019-09-30 15:26:29', '2');
INSERT INTO `dj_record_log` VALUES ('25', '8', null, '张杰', '41', null, null, '9', '2019', '2019-09-30', '40', '2019-09-30 15:26:29', '2');
INSERT INTO `dj_record_log` VALUES ('26', '8', null, '张杰', '41', null, null, '9', '2019', '2019-09-30', '40', '2019-09-30 15:28:14', '2');
INSERT INTO `dj_record_log` VALUES ('27', '8', null, '张杰', '41', null, null, '9', '2019', '2019-09-30', '40', '2019-09-30 15:28:14', '2');
INSERT INTO `dj_record_log` VALUES ('28', '8', null, '张杰', '41', null, null, '9', '2019', '2019-09-30', '40', '2019-09-30 15:31:38', '2');
INSERT INTO `dj_record_log` VALUES ('29', '8', null, '张杰', '41', null, null, '9', '2019', '2019-09-30', '40', '2019-09-30 15:31:38', '2');
INSERT INTO `dj_record_log` VALUES ('30', '8', null, '张杰', '41', null, null, '9', '2019', '2019-09-30', '40', '2019-09-30 22:00:36', '2');
INSERT INTO `dj_record_log` VALUES ('31', '8', null, '张杰', '41', null, null, '9', '2019', '2019-09-30', '40', '2019-09-30 22:00:36', '2');

-- ----------------------------
-- Table structure for dj_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `dj_recycle_bin`;
CREATE TABLE `dj_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT=' 回收站';

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
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of dj_role
-- ----------------------------
INSERT INTO `dj_role` VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `dj_role` VALUES ('2', '0', '1', '1329633709', '1329633709', '0', '普通员工', '系统员工');
INSERT INTO `dj_role` VALUES ('4', '0', '1', '0', '0', '0', '审核操作员', '审核操作员');
INSERT INTO `dj_role` VALUES ('5', '0', '1', '0', '0', '0', '客户管理员', '客户管理员');

-- ----------------------------
-- Table structure for dj_role_user
-- ----------------------------
DROP TABLE IF EXISTS `dj_role_user`;
CREATE TABLE `dj_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色对应表';

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

-- ----------------------------
-- Table structure for dj_route
-- ----------------------------
DROP TABLE IF EXISTS `dj_route`;
CREATE TABLE `dj_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='url路由表';

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='幻灯片表';

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
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '幻灯片内容',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展信息',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `slide_id` (`slide_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='幻灯片子项表';

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
  `theme` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
  `theme` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方唯一码',
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='第三方用户表';

-- ----------------------------
-- Records of dj_third_party_user
-- ----------------------------

-- ----------------------------
-- Table structure for dj_user
-- ----------------------------
DROP TABLE IF EXISTS `dj_user`;
CREATE TABLE `dj_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
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
  `user_pass` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '扩展属性',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账号',
  `card_type` tinyint(2) DEFAULT NULL COMMENT '证件类型',
  `card_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '证件号码',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域/地址',
  `join_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '入职时间',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '备注',
  `role_id` tinyint(2) DEFAULT NULL COMMENT '角色ID',
  `status` tinyint(2) DEFAULT '1' COMMENT '员工状态（1正常，2停用）',
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_login` (`user_login`) USING BTREE,
  KEY `user_nickname` (`user_nickname`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of dj_user
-- ----------------------------
INSERT INTO `dj_user` VALUES ('1', '5d91749a99aa9', '1', '0', '-28800', '1569813658', '0', '0', '0.00', '1568300708', '1', 'admin', '###56520f0efb772db0f3f66a57f8831caa', 'admin11', '373966902@qq.com', '', '20190929/a892039fd455cba1cd7aad7408dac70d.jpg', '', '127.0.0.1', '', '13558758764', null, '03065c7f91586c87', '1', '', '北京市-北京市市辖区-东城区', '2019-09-14', '', '', '1', '1', null);
INSERT INTO `dj_user` VALUES ('2', null, '1', '0', '0', '0', '0', '0', '0.00', '0', '2', 'zhangsan', '###c4f559e0c7959863d07634dde800e6b0', '员工张三', '123456@qq.com', '', '', '', '', '', '', null, null, null, null, null, null, null, null, '2', '2', null);
INSERT INTO `dj_user` VALUES ('3', null, '1', '0', '0', '0', '0', '0', '0.00', '0', '1', 'lisi', '###c4f559e0c7959863d07634dde800e6b0', '员工李四', 'a@b.c', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', null, '', '北京市-北京市市辖区-东城区', '', '', '', '2', '2', null);
INSERT INTO `dj_user` VALUES ('6', null, '1', '1', '0', '0', '0', '0', '0.00', '0', '1', 'zhangzhongqiang', '###c4f559e0c7959863d07634dde800e6b0', '审核张中强', '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '2', '', '北京市-北京市市辖区-东城区', '', '', '', '4', '1', null);
INSERT INTO `dj_user` VALUES ('11', null, '1', '2', '0', '0', '0', '0', '0.00', '0', '2', 'wujinzi', '###c4f559e0c7959863d07634dde800e6b0', '审核吴金枝', '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '2', '', '辽宁省-沈阳市-和平区', '', '', '', '4', '1', '');
INSERT INTO `dj_user` VALUES ('12', null, '1', '1', '0', '0', '0', '0', '0.00', '0', '2', '员工金锦子', '###c4f559e0c7959863d07634dde800e6b0', '员工金锦子', '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '1', '', '北京市-北京市市辖区-东城区', '', '', '', '2', '1', null);
INSERT INTO `dj_user` VALUES ('13', null, '1', '2', '0', '0', '0', '0', '0.00', '0', '1', '员工吴莲', '###c4f559e0c7959863d07634dde800e6b0', '员工吴莲', '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '1', '', '北京市-北京市市辖区-东城区', '', '', '', '2', '1', null);
INSERT INTO `dj_user` VALUES ('14', null, '1', '2', '0', '0', '0', '0', '0.00', '0', '1', '6666666', '###decec9d91fa1f687ba9834d2825f44ba', '6666666', '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '1', '', '北京市-北京市市辖区-东城区', '2019-09-14', '', '', '5', '1', null);
INSERT INTO `dj_user` VALUES ('15', null, '1', '2', '0', '0', '0', '0', '0.00', '0', '1', '玩啊的', '###8aa4016567c438e463adc6a4c16d6a28', '玩啊的', '', '', '', '', '', '', '13558758764', null, '03065c7f91586c87', '2', '', '北京市-北京市市辖区-东城区', '', '', '', '5', '1', null);
INSERT INTO `dj_user` VALUES ('17', null, '1', '2', '0', '0', '0', '0', '0.00', '0', '1', '测试啊啊', '###c4f559e0c7959863d07634dde800e6b0', '测试啊啊', '', '', '', '', '', '', '13558758764', null, '5454', '1', '', '北京市-北京市市辖区-东城区', '2019-09-17', '', '范德萨', '2', '1', null);

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
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '执行操作的url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户操作表';

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
  `object` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_object_action` (`user_id`,`object`,`action`) USING BTREE,
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='访问记录表';

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
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of dj_user_token
-- ----------------------------
INSERT INTO `dj_user_token` VALUES ('1', '1', '1583853007', '1568301007', '19ac393665ff18bffcee15493ab3081fe1dee91b257d6b36e8dc1a509d0c1bd0', 'web');

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
  `card_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '证件号码',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `join_time` int(10) DEFAULT '0' COMMENT '入职时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dj_worker
-- ----------------------------
