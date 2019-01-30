/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : thinkphp5

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-03-27 11:24:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oa_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `oa_admin_access`;
CREATE TABLE `oa_admin_access` (
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_admin_access
-- ----------------------------
INSERT INTO `oa_admin_access` VALUES ('2', '15');

-- ----------------------------
-- Table structure for oa_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `oa_admin_group`;
CREATE TABLE `oa_admin_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `rules` varchar(4000) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_admin_group
-- ----------------------------
INSERT INTO `oa_admin_group` VALUES ('15', '普通会员', '1,2,3,4,5,6,7,8,9,10,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,61,62,63,28,29', '0', '最厉害的组别', '1');

-- ----------------------------
-- Table structure for oa_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `oa_admin_menu`;
CREATE TABLE `oa_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '上级菜单ID',
  `title` varchar(32) DEFAULT '' COMMENT '菜单名称',
  `url` varchar(127) DEFAULT '' COMMENT '链接地址',
  `icon` varchar(64) DEFAULT '' COMMENT '图标',
  `menu_type` tinyint(4) DEFAULT NULL COMMENT '菜单类型',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `rule_id` int(11) DEFAULT NULL COMMENT '权限id',
  `module` varchar(50) DEFAULT NULL,
  `menu` varchar(50) DEFAULT NULL COMMENT '三级菜单吗',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='【配置】后台菜单表';

-- ----------------------------
-- Records of oa_admin_menu
-- ----------------------------
INSERT INTO `oa_admin_menu` VALUES ('52', '0', '管理', '', '', '1', '0', '1', '59', 'Administrative', '');
INSERT INTO `oa_admin_menu` VALUES ('53', '52', '系统配置', '', '', '1', '0', '1', '61', 'Administrative', '');
INSERT INTO `oa_admin_menu` VALUES ('54', '53', '菜单管理', '/home/menu/list', '', '1', '0', '1', '21', 'Administrative', 'menu');
INSERT INTO `oa_admin_menu` VALUES ('55', '53', '系统参数', '/home/config/add', '', '1', '0', '1', '29', 'Administrative', 'systemConfig');
INSERT INTO `oa_admin_menu` VALUES ('56', '53', '权限规则', '/home/rule/list', '', '1', '0', '1', '13', 'Administrative', 'rule');
INSERT INTO `oa_admin_menu` VALUES ('57', '52', '组织架构', '', '', '1', '0', '1', '63', 'Administrative', '');
INSERT INTO `oa_admin_menu` VALUES ('58', '57', '岗位管理', '/home/position/list', '', '1', '0', '1', '31', 'Administrative', 'position');
INSERT INTO `oa_admin_menu` VALUES ('59', '57', '部门管理', '/home/structures/list', '', '1', '0', '1', '39', 'Administrative', 'structures');
INSERT INTO `oa_admin_menu` VALUES ('60', '57', '用户组管理', '/home/groups/list', '', '1', '0', '1', '47', 'Administrative', 'groups');
INSERT INTO `oa_admin_menu` VALUES ('61', '52', '账户管理', '', '', '1', '0', '1', '62', 'Administrative', '');
INSERT INTO `oa_admin_menu` VALUES ('62', '61', '账户列表', '/home/users/list', '', '1', '0', '1', '55', 'Administrative', 'users');

-- ----------------------------
-- Table structure for oa_admin_post
-- ----------------------------
DROP TABLE IF EXISTS `oa_admin_post`;
CREATE TABLE `oa_admin_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '岗位备注',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `status` tinyint(5) DEFAULT '1' COMMENT '状态1启用,0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Records of oa_admin_post
-- ----------------------------
INSERT INTO `oa_admin_post` VALUES ('5', '后端开发工程师', '', '1484706862', '1');
INSERT INTO `oa_admin_post` VALUES ('6', '前端开发工程师', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('7', '设计师', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('11', '文案策划', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('12', '产品助理', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('15', '总经理', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('20', '项目经理', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('25', '职能', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('26', '项目助理', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('27', '测试工程师', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('28', '人事经理', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('29', 'CEO', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('30', '品牌策划', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('31', '前端研发工程师', '', '1484706863', '1');
INSERT INTO `oa_admin_post` VALUES ('32', '后端研发工程师', '', '1484706863', '1');

-- ----------------------------
-- Table structure for oa_admin_rule
-- ----------------------------
DROP TABLE IF EXISTS `oa_admin_rule`;
CREATE TABLE `oa_admin_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `name` varchar(100) DEFAULT '' COMMENT '定义',
  `level` tinyint(5) DEFAULT NULL COMMENT '级别。1模块,2控制器,3操作',
  `pid` int(11) DEFAULT '0' COMMENT '父id，默认0',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态，1启用，0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_admin_rule
-- ----------------------------
INSERT INTO `oa_admin_rule` VALUES ('10', '系统基础功能', 'admin', '1', '0', '1');
INSERT INTO `oa_admin_rule` VALUES ('11', '权限规则', 'rules', '2', '10', '1');
INSERT INTO `oa_admin_rule` VALUES ('13', '规则列表', 'index', '3', '11', '1');
INSERT INTO `oa_admin_rule` VALUES ('14', '权限详情', 'read', '3', '11', '1');
INSERT INTO `oa_admin_rule` VALUES ('15', '编辑权限', 'update', '3', '11', '1');
INSERT INTO `oa_admin_rule` VALUES ('16', '删除权限', 'delete', '3', '11', '1');
INSERT INTO `oa_admin_rule` VALUES ('17', '添加权限', 'save', '3', '11', '1');
INSERT INTO `oa_admin_rule` VALUES ('18', '批量删除权限', 'deletes', '3', '11', '1');
INSERT INTO `oa_admin_rule` VALUES ('19', '批量启用/禁用权限', 'enables', '3', '11', '1');
INSERT INTO `oa_admin_rule` VALUES ('20', '菜单管理', 'menus', '2', '10', '1');
INSERT INTO `oa_admin_rule` VALUES ('21', '菜单列表', 'index', '3', '20', '1');
INSERT INTO `oa_admin_rule` VALUES ('22', '添加菜单', 'save', '3', '20', '1');
INSERT INTO `oa_admin_rule` VALUES ('23', '菜单详情', 'read', '3', '20', '1');
INSERT INTO `oa_admin_rule` VALUES ('24', '编辑菜单', 'update', '3', '20', '1');
INSERT INTO `oa_admin_rule` VALUES ('25', '删除菜单', 'delete', '3', '20', '1');
INSERT INTO `oa_admin_rule` VALUES ('26', '批量删除菜单', 'deletes', '3', '20', '1');
INSERT INTO `oa_admin_rule` VALUES ('27', '批量启用/禁用菜单', 'enables', '3', '20', '1');
INSERT INTO `oa_admin_rule` VALUES ('28', '系统管理', 'systemConfigs', '2', '10', '1');
INSERT INTO `oa_admin_rule` VALUES ('29', '修改系统配置', 'save', '3', '28', '1');
INSERT INTO `oa_admin_rule` VALUES ('30', '岗位管理', 'posts', '2', '10', '1');
INSERT INTO `oa_admin_rule` VALUES ('31', '岗位列表', 'index', '3', '30', '1');
INSERT INTO `oa_admin_rule` VALUES ('32', '岗位详情', 'read', '3', '30', '1');
INSERT INTO `oa_admin_rule` VALUES ('33', '编辑岗位', 'update', '3', '30', '1');
INSERT INTO `oa_admin_rule` VALUES ('34', '删除岗位', 'delete', '3', '30', '1');
INSERT INTO `oa_admin_rule` VALUES ('35', '添加岗位', 'save', '3', '30', '1');
INSERT INTO `oa_admin_rule` VALUES ('36', '批量删除岗位', 'deletes', '3', '30', '1');
INSERT INTO `oa_admin_rule` VALUES ('37', '批量启用/禁用岗位', 'enables', '3', '30', '1');
INSERT INTO `oa_admin_rule` VALUES ('38', '部门管理', 'structures', '2', '10', '1');
INSERT INTO `oa_admin_rule` VALUES ('39', '部门列表', 'index', '3', '38', '1');
INSERT INTO `oa_admin_rule` VALUES ('40', '部门详情', 'read', '3', '38', '1');
INSERT INTO `oa_admin_rule` VALUES ('41', '编辑部门', 'update', '3', '38', '1');
INSERT INTO `oa_admin_rule` VALUES ('42', '删除部门', 'delete', '3', '38', '1');
INSERT INTO `oa_admin_rule` VALUES ('43', '添加部门', 'save', '3', '38', '1');
INSERT INTO `oa_admin_rule` VALUES ('44', '批量删除部门', 'deletes', '3', '38', '1');
INSERT INTO `oa_admin_rule` VALUES ('45', '批量启用/禁用部门', 'enables', '3', '38', '1');
INSERT INTO `oa_admin_rule` VALUES ('46', '用户组管理', 'groups', '2', '10', '1');
INSERT INTO `oa_admin_rule` VALUES ('47', '用户组列表', 'index', '3', '46', '1');
INSERT INTO `oa_admin_rule` VALUES ('48', '用户组详情', 'read', '3', '46', '1');
INSERT INTO `oa_admin_rule` VALUES ('49', '编辑用户组', 'update', '3', '46', '1');
INSERT INTO `oa_admin_rule` VALUES ('50', '删除用户组', 'delete', '3', '46', '1');
INSERT INTO `oa_admin_rule` VALUES ('51', '添加用户组', 'save', '3', '46', '1');
INSERT INTO `oa_admin_rule` VALUES ('52', '批量删除用户组', 'deletes', '3', '46', '1');
INSERT INTO `oa_admin_rule` VALUES ('53', '批量启用/禁用用户组', 'enables', '3', '46', '1');
INSERT INTO `oa_admin_rule` VALUES ('54', '成员管理', 'users', '2', '10', '1');
INSERT INTO `oa_admin_rule` VALUES ('55', '成员列表', 'index', '3', '54', '1');
INSERT INTO `oa_admin_rule` VALUES ('56', '成员详情', 'read', '3', '54', '1');
INSERT INTO `oa_admin_rule` VALUES ('57', '删除成员', 'delete', '3', '54', '1');
INSERT INTO `oa_admin_rule` VALUES ('59', '管理菜单', 'Adminstrative', '2', '10', '1');
INSERT INTO `oa_admin_rule` VALUES ('61', '系统管理二级菜单', 'systemConfig', '1', '59', '1');
INSERT INTO `oa_admin_rule` VALUES ('62', '账户管理二级菜单', 'personnel', '3', '59', '1');
INSERT INTO `oa_admin_rule` VALUES ('63', '组织架构二级菜单', 'structures', '3', '59', '1');

-- ----------------------------
-- Table structure for oa_admin_structure
-- ----------------------------
DROP TABLE IF EXISTS `oa_admin_structure`;
CREATE TABLE `oa_admin_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '',
  `pid` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_admin_structure
-- ----------------------------
INSERT INTO `oa_admin_structure` VALUES ('1', '广东洪睿信息科技有限公司', '0', '1');
INSERT INTO `oa_admin_structure` VALUES ('5', '设计部', '1', '1');
INSERT INTO `oa_admin_structure` VALUES ('6', '职能部', '1', '1');
INSERT INTO `oa_admin_structure` VALUES ('37', '总经办', '1', '1');
INSERT INTO `oa_admin_structure` VALUES ('52', '项目部', '1', '1');
INSERT INTO `oa_admin_structure` VALUES ('53', '测试部', '1', '1');
INSERT INTO `oa_admin_structure` VALUES ('54', '开发部', '1', '1');
INSERT INTO `oa_admin_structure` VALUES ('55', '市场部', '1', '1');
INSERT INTO `oa_admin_structure` VALUES ('56', '研发部', '1', '1');
INSERT INTO `oa_admin_structure` VALUES ('57', '企业微信', '0', '1');

-- ----------------------------
-- Table structure for oa_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `oa_admin_user`;
CREATE TABLE `oa_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) DEFAULT NULL COMMENT '管理后台账号',
  `password` varchar(100) DEFAULT NULL COMMENT '管理后台密码',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  `create_time` int(11) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `structure_id` int(11) DEFAULT NULL COMMENT '部门',
  `post_id` int(11) DEFAULT NULL COMMENT '岗位',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态,1启用0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_admin_user
-- ----------------------------
INSERT INTO `oa_admin_user` VALUES ('1', 'admin', 'd93a5def7511da3d0f2d171d9c344e91', '', null, '超级管理员', '1', '5', '1');
INSERT INTO `oa_admin_user` VALUES ('3', '用户AAAA', 'c78b6663d47cfbdb4d65ea51c104044e', '', '1487217060', '用户A', '5', '20', '1');

-- ----------------------------
-- Table structure for oa_base_companys
-- ----------------------------
DROP TABLE IF EXISTS `oa_base_companys`;
CREATE TABLE `oa_base_companys`  (
  `Id` bigint(17) UNSIGNED NOT NULL,
  `CreateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `CreateUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ParentId` bigint(17) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公司的上级集团',
  `CompanyCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司编号',
  `CompanyName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `CompanyStatus` tinyint(4) NOT NULL DEFAULT 1,
  `CompanyEnName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司英文名称',
  `CompanyWebsite` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司网站',
  `CompanyAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司地址',
  `IndustryId` int(11) NULL DEFAULT NULL COMMENT ' 基础资料中 国家的 ID',
  `CountryId` int(11) NULL DEFAULT NULL COMMENT ' 基础资料中 行业的 ID',
  `TypeId` int(11) NULL DEFAULT NULL COMMENT ' 基础资料中 企业类型的 ID',
  `FiscalMonth` tinyint(2) NULL DEFAULT NULL COMMENT '财年截至时间,只能保存 1~12，然后显示 *月底',
  `ContactPerson` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 公司对外联系人',
  `ContactEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 公司对外邮箱',
  `ContactPhone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 公司对外电话',
  `CompanyInfo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 备注信息',
  `Logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集团LOGO',
  `Email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通用买家发送邮件给供应商的邮箱',
  `Password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱密码',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_base_companys
-- ----------------------------
INSERT INTO `oa_base_companys` VALUES (25709385548300541, '2017-12-22 10:43:06', 'customer', 0, NULL, 'Early Bird', 1, 'Early Bird', 'None', 'None', 1, 44, 6, 3, '暂无', '暂无', '0755-12345678', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25709385548300542, '2017-12-22 10:43:33', 'admin', 0, NULL, 'Cosco Asia', 1, 'Cosco Asia', 'None', 'None', 1, 1, NULL, 3, '', '', '', '', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25709385548300543, '2017-12-22 10:43:33', 'admin', 0, NULL, 'Costco (Shenzhen) ', 1, 'Costco', 'None', 'None', 1, 1, NULL, 3, '', '', '', '', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25709385548300544, '2017-12-22 10:43:33', 'admin', 0, NULL, 'Generic Auto', 1, 'Generic Auto', 'None', 'None', 1, 1, NULL, 3, '', '', '', '', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25709385548300545, '2017-12-22 10:43:33', 'admin', 0, NULL, 'Early Bird (Global) ', 1, 'Early Bird (Global) ', 'None', 'None', 1, 1, NULL, 3, '', '', '', '', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25709385548300576, '2018-07-31 14:37:38', 'admin', 0, NULL, 'Tong Ju Ltd.co', 1, 'Tong Ju Ltd.co', 'None', 'None', 1, 1, NULL, 3, 'Jia yue ting', 'jia@tj-fo.com', '12345678', '', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256228, '2018-08-15 13:54:45', 'customer', 0, NULL, '测试公司', 1, '测试公司', 'http://www.baidu.com?ss=23d', '看电视咯我诶让我拉萨的房价', 2, 8, 2, 3, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256229, '2018-08-15 14:20:37', 'customer', 0, NULL, '测试公司333', 1, '测试公司333', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 60, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256230, '2018-08-15 15:04:04', 'customer', 0, NULL, '测试公司333', 1, '测试公司333', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 60, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256233, '2018-08-15 15:13:09', 'customer', 0, NULL, '测试公司333', 1, '测试公司333', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 60, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256238, '2018-08-15 15:20:38', 'customer', 0, NULL, '测试公司333', 1, '测试公司333', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 60, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256243, '2018-08-15 15:27:01', 'customer', 0, NULL, '测试公司333', 1, '测试公司333', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 60, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256244, '2018-08-15 15:37:11', 'customer', 0, NULL, '测试公司433', 1, '测试公司333', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 60, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256245, '2018-08-15 15:38:58', 'customer', 0, NULL, '测试公司433', 1, '测试公司333', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 60, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256250, '2018-08-15 15:51:39', 'customer', 0, NULL, '测试公司333', 1, '测试公司333', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 60, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256265, '2018-08-15 16:39:29', 'customer', 0, NULL, '中国高铁', 1, '中国高铁', 'http://www.baidu.com/map', '看电视咯我诶让我拉萨的房价', 1, 26, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256344, '2018-08-15 17:17:30', 'customer', 0, NULL, '中国电信', 1, '中国电信', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 1, 34, 3, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256349, '2018-08-15 17:19:37', 'customer', 0, NULL, '国家电网zzz', 1, '国家电网zzz', 'http://www.baidu.com/map', '看电视咯我诶让我拉萨的房价', 2, 1, 1, 4, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256383, '2018-08-16 09:52:33', 'customer', 0, NULL, '测试公司', 1, '测试公司', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 43, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256388, '2018-08-16 09:54:55', 'customer', 0, NULL, '测试公司3223', 1, '测试公司3223', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 14, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256393, '2018-08-16 10:03:39', 'customer', 0, NULL, 'kkkkk', 1, 'kkkkk', 'http://www.baidu.com', 'test address, test suite', 2, 10, 2, 4, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256398, '2018-08-16 10:06:32', 'customer', 0, NULL, '科沃尔', 1, '科沃尔', 'http://www.baidu.com', 'test address, test suite', 2, 37, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256403, '2018-08-16 10:08:44', 'customer', 0, '123', 'wew', 1, 'wew', 'http://www.baidu.com', '6465465465', 2, 48, 2, 3, '暂无', '暂无', '119', '暂无', '1545815769.jpg', 'cust1@ep-fo.com', '25d55ad283aa400af464c76d713c07ad');
INSERT INTO `oa_base_companys` VALUES (25733109320256408, '2018-08-16 10:32:14', 'customer', 0, NULL, '测试公司222', 1, '测试公司222', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 1, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256413, '2018-08-16 10:37:17', 'customer', 0, NULL, '测试公司ppp', 1, '测试公司ppp', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 11, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256418, '2018-08-16 11:10:07', 'customer', 0, NULL, '宝路公司', 1, '宝路公司', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 1, 2, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256436, '2018-08-16 11:37:51', 'customer', 0, NULL, '中国移动', 1, '中国移动', 'http://www.baidu.com', 'test address, test suite', 2, 2, 2, 1, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256503, '2018-08-17 14:16:49', 'customer', 0, NULL, '修改功能', 1, '修改功能', 'http://www.baidu.com', '看电视咯我诶让我拉萨的房价', 2, 44, 2, 5, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256506, '2018-08-17 14:21:21', 'customer', 0, NULL, '修改数据用123', 1, '修改数据用123', 'http://www.google.com', '解放路33', 3, 3, 1, 3, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25733109320256715, '2018-08-20 09:29:29', 'customer', 0, NULL, '新的公司123', 1, '新的公司123', 'http://www.google.com', 'test', 2, 44, 1, 2, '暂无', '暂无', '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25915147281236060, '2018-12-14 16:30:10', 'customer', 0, 'Tencent', '腾讯控股', 1, '腾讯控股', 'www.qq.com', '南山飞亚达', 4, 44, 2, 5, '暂无', '暂无', '119', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25915147281236066, '2018-12-14 16:30:26', 'customer', 25915147281236060, NULL, '王者荣耀', 1, 'king', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25915147281236067, '2018-12-14 16:30:37', 'customer', 25915147281236060, NULL, '泡泡堂', 1, 'ppt', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25915147281236071, '2018-12-14 16:52:23', 'customer', 25733109320256715, NULL, '新的公司', 1, 'new_company', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25923863514710023, '2018-12-19 16:03:01', 'customer', 0, '1', '1', 1, '1', '1', '1', 3, 1, 1, 1, '暂无', '暂无', '1', '暂无', '1545815919.jpg', 'cust1@ep-fo.com', '25d55ad283aa400af464c76d713c07ad');
INSERT INTO `oa_base_companys` VALUES (25923863514710030, '2018-12-21 17:03:06', 'customer', 25923863514710023, NULL, '234234', 1, '234234234', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (25923863514710031, '2018-12-21 17:03:52', 'customer', 25923863514710023, NULL, '09090909', 1, '131312', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227630, '2019-01-14 15:04:25', 'customer', 0, 'bianhao', 'ces.com', 1, 'ces.com', 'www.baidu.com', 'dizhi', 3, 4, 3, 3, '暂无', '暂无', 'zongji', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227639, '2019-01-15 10:17:04', 'customer', 98019142233227630, NULL, 'lly测试', 1, 'lly_en', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227649, '2019-01-17 14:37:15', 'customer', 98019142233227712, 'bianhao', 'ces.com', 1, 'ces.com', 'www.baidu.com', 'dizhi', 3, 4, 3, 3, '暂无', '暂无', 'zongji', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227654, '2019-01-17 14:37:38', 'customer', 98019142233227712, 'bianhao', 'ces.com', 1, 'ces.com', 'www.baidu.com', 'dizhi', 3, 4, 3, 3, '暂无', '暂无', 'zongji', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227659, '2019-01-17 14:43:13', 'customer', 98019142233227712, 'bianhao', 'ces.com', 1, 'ces.com', 'www.baidu.com', 'dizhi', 3, 4, 3, 3, '暂无', '暂无', 'zongji', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227664, '2019-01-17 14:45:55', 'customer', 98019142233227712, 'bianhao', 'ces.com', 1, 'ces.com', 'www.baidu.com', 'dizhi', 3, 4, 3, 3, '暂无', '暂无', 'zongji', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227669, '2019-01-17 15:42:20', 'customer', 98019142233227712, 'bianhao', 'ces.com', 1, 'ces.com', 'www.baidu.com', 'dizhi', 3, 4, 3, 3, '暂无', '暂无', 'zongji', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227674, '2019-01-17 15:57:59', 'customer', 98019142233227712, 'bianhao', 'ces.com', 1, 'ces.com', 'www.baidu.com', 'dizhi', 3, 4, 3, 3, '暂无', '暂无', 'zongji', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227679, '2019-01-17 16:05:55', 'customer', 98019142233227712, 'bianhao', 'ces.com', 1, 'ces.com', 'www.baidu.com', 'dizhi', 3, 4, 3, 3, '暂无', '暂无', 'zongji', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227684, '2019-01-17 16:08:07', 'customer', 98019142233227712, 'bianhao', 'ces.com', 1, 'ces.com', 'www.baidu.com', 'dizhi', 3, 4, 3, 3, '暂无', '暂无', 'zongji', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227689, '2019-01-17 16:16:02', 'customer', 98019142233227712, 'bianhao', 'ces.com', 1, 'ces.com', 'www.baidu.com', 'dizhi', 3, 4, 3, 3, '暂无', '暂无', 'zongji', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227706, '2019-01-17 17:21:44', 'customer', 98019142233227712, '0433', '思维', 1, '思维', 'www.qq.com', '万家灯火', 2, 2, 1, 1, '暂无', '暂无', '075523232323', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227709, '2019-01-17 17:24:20', 'customer', 98019142233227712, '0433', '早鸟', 1, '早鸟', 'www.qq.com', '万家灯火', 2, 2, 1, 1, '暂无', '暂无', '075523232323', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227712, '2019-01-17 18:16:39', 'customer', 98019142233227712, '1234', '麦当劳', 1, '麦当劳', 'www.bb.com', '福田', 1, 1, 2, 4, '暂无', '暂无', '075543434343', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227718, '2019-01-17 18:33:23', 'admin', 98019142233227712, NULL, '1', 1, '1', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227719, '2019-01-17 18:33:54', 'admin', 98019142233227712, NULL, '张', 1, 'z', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227720, '2019-01-17 18:47:17', 'admin', 98019142233227712, NULL, '1', 1, '1', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227728, '2019-01-17 19:07:49', 'admin', 98019142233227712, NULL, 'zzz', 1, 'zzz', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227733, '2019-01-17 19:18:49', 'admin', 98019142233227712, NULL, '1', 1, '1', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227734, '2019-01-17 19:21:17', 'admin', 98019142233227712, NULL, '3', 1, '3', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227736, '2019-01-18 13:34:13', 'admin', 98019142233227712, NULL, '肯德基', 1, 'CFK', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227737, '2019-01-18 14:27:54', 'customer', 0, '123456', '肯德基', 1, '肯德基', 'www.baidu.com', '福田保税', 2, 4, 4, 4, '暂无', '暂无', '075584339650', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227740, '2019-01-18 14:28:38', 'admin', 0, NULL, '啃啃啃', 1, 'KFC', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227741, '2019-01-18 14:53:34', 'customer', 0, '676712', 'UFO', 1, 'UFO', 'www.baidu.com', '龙岗双龙', 5, 5, 4, 2, '暂无', '暂无', '075545465555', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227744, '2019-01-18 14:54:14', 'admin', 98019142233227741, NULL, '张三', 1, 'abc', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227745, '2019-01-18 14:58:00', 'customer', 0, '5654543', '张三', 1, '张三', 'www.baidu.com', '坂田', 5, 4, 2, 4, '暂无', '暂无', '01021022', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227748, '2019-01-18 14:58:28', 'admin', 98019142233227745, NULL, '星火', 1, 'fire', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227749, '2019-01-18 15:04:43', 'customer', 0, '4531312', '万科星火', 1, '万科星火', 'www.baidu.com', '坂田', 2, 3, 1, 6, '暂无', '暂无', '075523232323', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227752, '2019-01-18 15:05:04', 'admin', 98019142233227749, NULL, '星火', 1, 'fire1', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227753, '2019-01-18 15:19:00', 'customer', 0, '542131', '奶茶', 1, '奶茶', 'www.baidu.com', '南山', 4, 5, 1, 6, '暂无', '暂无', '075523232323', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227757, '2019-01-18 15:22:09', 'customer', 0, '2311231', '电子公司', 1, '电子公司', 'www.hao123.com', '前海', 4, 3, 4, 5, '暂无', '暂无', '075584332695', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227760, '2019-01-18 15:22:47', 'admin', 98019142233227757, NULL, '白门电子', 1, 'electron', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227761, '2019-01-18 15:32:05', 'customer', 0, '12312312', '义乌', 1, '义乌', 'www.qinghai.com', '盐田', 3, 6, 5, 2, '暂无', '暂无', '075584332676', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227764, '2019-01-18 15:32:27', 'admin', 98019142233227761, NULL, '记录仪', 1, 'rememeber', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227765, '2019-01-18 15:33:27', 'admin', 98019142233227761, NULL, '青三', 1, 'abc', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227766, '2019-01-18 15:36:32', 'customer', 0, '2342321', '无敌12', 1, '无敌12', 'www.qinhai', '龙岗', 4, 4, 3, 5, '暂无', '暂无', '075523232323', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227771, '2019-01-18 15:46:29', 'customer', 0, '2323232', '张', 1, '张', 'www.baidu.com', '南山', 5, 4, 3, 2, '暂无', '暂无', '65777712', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227774, '2019-01-18 15:46:47', 'admin', 98019142233227771, NULL, '我啊', 1, 'abc', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227775, '2019-01-18 15:50:44', 'customer', 0, '123456', '吴', 1, '吴', 'www.baidu.com', '前海', 5, 5, 2, 4, '暂无', '暂无', '84332678', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227778, '2019-01-18 15:51:03', 'admin', 98019142233227775, NULL, '轻轨', 1, 'vvv', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227779, '2019-01-18 15:55:47', 'customer', 0, '454646', '钱凯', 1, '钱凯', 'www.qiankai.com', '前开', 1, 4, 4, 6, '暂无', '暂无', '23131231', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227782, '2019-01-18 15:55:59', 'admin', 98019142233227779, NULL, '唔哟', 1, 'fff', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227783, '2019-01-18 16:00:31', 'customer', 0, '54541231', '张恺', 1, '张恺', 'www.bai.com', '龙岗', 7, 3, 3, 6, '暂无', '暂无', '075584332659', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227786, '2019-01-18 16:00:44', 'admin', 98019142233227783, NULL, '隆重', 1, 'jfjfj', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227793, '2019-01-18 16:22:11', 'customer', 0, '8787', '思维', 1, '思维', 'www.baid.com', '福田', 1, 7, 6, 4, '暂无', '暂无', '075584338765', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227796, '2019-01-18 16:22:32', 'admin', 98019142233227793, NULL, '五三', 1, 'nini', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227797, '2019-01-18 16:34:02', 'customer', 0, '54235423', '无中生有', 1, '无中生有', 'www.123hao.com', '坂田', 4, 3, 4, 6, '暂无', '暂无', '075584332980', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227800, '2019-01-18 16:34:13', 'admin', 98019142233227797, NULL, '坏', 1, 'bbb', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227802, '2019-01-18 17:09:07', 'customer', 0, '6754', '前海小区', 1, '前海小区', 'www.baidu.com', '福田', 6, 6, 5, 2, '暂无', '暂无', '64332367', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227805, '2019-01-18 17:11:49', 'customer', 0, '6565', '福田校区', 1, '福田校区', 'www.baidu.com', '福田', 6, 6, 5, 4, '暂无', '暂无', '84332543', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227808, '2019-01-18 17:12:03', 'admin', 98019142233227805, NULL, '中国', 1, 'china', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227809, '2019-01-18 17:18:18', 'customer', 0, '5445', '张凯', 1, '张凯', 'www.baidu.com', '福田', 4, 4, 4, 2, '暂无', '暂无', '87878765', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227812, '2019-01-18 17:18:33', 'admin', 98019142233227809, NULL, '骑士', 1, 'jiji', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227813, '2019-01-18 17:25:05', 'customer', 0, '6544', '天华', 1, '天华', 'www.baidu.com', '福田', 1, 3, 2, 2, '暂无', '暂无', '86433360', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227816, '2019-01-18 17:25:21', 'admin', 98019142233227813, NULL, '你们在吗', 1, 'adjf', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227817, '2019-01-18 17:28:31', 'customer', 0, '5454', '积极', 1, '积极', 'www.baidu.com', '福田', 1, 3, 6, 5, '暂无', '暂无', '85446767', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227820, '2019-01-18 17:28:44', 'admin', 98019142233227817, NULL, '你不补', 1, 'gjiji', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227824, '2019-01-18 17:37:24', 'customer', 0, '12212', '2', 1, '2', 'www.baidu.com', '龙岗', 5, 3, 5, 2, '暂无', '暂无', '1212', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227827, '2019-01-18 17:37:33', 'admin', 98019142233227824, NULL, 'bubu', 1, '12312', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227829, '2019-01-18 17:42:40', 'customer', 0, '1', '2', 1, '2', '2', '1', 4, 4, 3, 1, '暂无', '暂无', '1', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227832, '2019-01-18 17:42:46', 'admin', 98019142233227829, NULL, '44', 1, '55', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227833, '2019-01-18 17:47:48', 'customer', 0, '1', '1', 1, '1', '1', '1', 5, 3, 4, 1, '暂无', '暂无', '1', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227836, '2019-01-18 17:47:55', 'admin', 98019142233227833, NULL, '21231', 1, '231231', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227838, '2019-01-18 17:51:40', 'customer', 0, '2121', '44', 1, '44', '11', '2421', 5, 2, 5, 4, '暂无', '暂无', '2211', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227841, '2019-01-18 17:51:47', 'admin', 98019142233227838, NULL, '4131', 1, '41312', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227843, '2019-01-18 17:59:49', 'customer', 0, '2323', '2', 1, '2', '3', '42132', 5, 3, 4, 12, '暂无', '暂无', '2423', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227846, '2019-01-18 17:59:55', 'admin', 98019142233227843, NULL, '41231', 1, '23131', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227848, '2019-01-18 18:07:41', 'customer', 0, '231', '44', 1, '44', '2321', '231', 1, 3, 6, 4, '暂无', '暂无', '413241', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227851, '2019-01-18 18:07:46', 'admin', 98019142233227848, NULL, '23123', 1, '23131', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227854, '2019-01-18 18:23:07', 'customer', 0, '2312321', '1412312', 1, '1412312', '2312312', '3114', 1, 1, 5, 2, '暂无', '暂无', '412313', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227857, '2019-01-18 18:23:13', 'admin', 98019142233227854, NULL, '32312', 1, '23131', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227858, '2019-01-18 18:24:23', 'customer', 0, '', '', 1, '', '', '', 0, 0, 0, 0, '暂无', '暂无', '', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227862, '2019-01-18 18:25:23', 'customer', 0, '312312', '24123', 1, '24123', '12312312', '3123123', 6, 3, 3, 2, '暂无', '暂无', '2312', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227865, '2019-01-18 18:25:29', 'admin', 98019142233227862, NULL, '421312', 1, '2312313', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227866, '2019-01-18 18:27:12', 'customer', 0, '31231', '2312', 1, '2312', '313123', '33123', 4, 5, 5, 3, '暂无', '暂无', '2312', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227869, '2019-01-18 18:28:39', 'customer', 0, '312', '23123', 1, '23123', '1231231', '321', 6, 5, 5, 2, '暂无', '暂无', '32111', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227872, '2019-01-18 18:28:51', 'admin', 98019142233227869, NULL, '4123', 1, '1231', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227874, '2019-01-18 18:33:05', 'customer', 0, '31231', '31231', 1, '31231', '3212312', '312', 5, 5, 3, 2, '暂无', '暂无', '231', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227877, '2019-01-18 18:33:10', 'admin', 98019142233227874, NULL, '2313', 1, '1313', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227881, '2019-01-18 18:37:53', 'customer', 0, '123123', '231', 1, '231', '312312', '3123', 5, 5, 3, 3, '暂无', '暂无', '2312', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98019142233227884, '2019-01-18 18:38:00', 'admin', 98019142233227881, NULL, '231', 1, '312313', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98029314963931136, '2019-01-22 14:15:57', 'customer', 0, '8989', '星光之约', 1, '星光之约', 'www.baidu.com', '深圳市坂田区星河world万家星火online6栋401', 4, 44, 4, 3, '暂无', '暂无', '84332695', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98029314963931139, '2019-01-22 14:16:22', 'admin', 98029314963931136, NULL, '星河world', 1, 'xinghe', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98029314963931141, '2019-01-22 14:52:27', 'customer', 0, '8989', 'QQ', 1, 'QQ', 'www.baidu.com', '南山区前海滨河大道', 4, 44, 4, 5, '暂无', '暂无', '26447676', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98029314963931144, '2019-01-22 14:52:54', 'admin', 98029314963931141, NULL, '腾讯', 1, 'QQQQ', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98029314963931146, '2019-01-22 15:19:03', 'customer', 0, '54523', 'abc', 1, 'abc', 'www.baidu.com', '福田', 1, 7, 6, 2, '暂无', '暂无', '5252412', '暂无', NULL, NULL, NULL);
INSERT INTO `oa_base_companys` VALUES (98029314963931149, '2019-01-22 15:20:27', 'admin', 98029314963931146, NULL, '比比', 1, 'BB', '暂无', '暂无', NULL, NULL, NULL, NULL, '暂无', NULL, '暂无', '暂无', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oa_base_country
-- ----------------------------
DROP TABLE IF EXISTS `oa_base_country`;
CREATE TABLE `oa_base_country`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sortname` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文显示',
  `cnname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简体中文显示',
  `twname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '繁体中文显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 247 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_base_country
-- ----------------------------
INSERT INTO `oa_base_country` VALUES (1, 'AF', 'Afghanistan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (2, 'AL', 'Albania', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (3, 'DZ', 'Algeria', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (4, 'AS', 'American Samoa', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (5, 'AD', 'Andorra', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (6, 'AO', 'Angola', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (7, 'AI', 'Anguilla', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (8, 'AQ', 'Antarctica', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (9, 'AG', 'Antigua And Barbuda', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (10, 'AR', 'Argentina', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (11, 'AM', 'Armenia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (12, 'AW', 'Aruba', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (13, 'AU', 'Australia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (14, 'AT', 'Austria', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (15, 'AZ', 'Azerbaijan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (16, 'BS', 'Bahamas The', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (17, 'BH', 'Bahrain', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (18, 'BD', 'Bangladesh', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (19, 'BB', 'Barbados', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (20, 'BY', 'Belarus', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (21, 'BE', 'Belgium', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (22, 'BZ', 'Belize', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (23, 'BJ', 'Benin', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (24, 'BM', 'Bermuda', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (25, 'BT', 'Bhutan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (26, 'BO', 'Bolivia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (27, 'BA', 'Bosnia and Herzegovina', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (28, 'BW', 'Botswana', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (29, 'BV', 'Bouvet Island', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (30, 'BR', 'Brazil', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (31, 'IO', 'British Indian Ocean Territory', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (32, 'BN', 'Brunei', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (33, 'BG', 'Bulgaria', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (34, 'BF', 'Burkina Faso', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (35, 'BI', 'Burundi', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (36, 'KH', 'Cambodia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (37, 'CM', 'Cameroon', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (38, 'CA', 'Canada', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (39, 'CV', 'Cape Verde', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (40, 'KY', 'Cayman Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (41, 'CF', 'Central African Republic', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (42, 'TD', 'Chad', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (43, 'CL', 'Chile', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (44, 'CN', 'China', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (45, 'CX', 'Christmas Island', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (47, 'CO', 'Colombia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (48, 'KM', 'Comoros', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (49, 'CG', 'Congo', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (50, 'CD', 'Congo The Democratic Republic Of The', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (51, 'CK', 'Cook Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (52, 'CR', 'Costa Rica', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (54, 'HR', 'Croatia (Hrvatska)', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (55, 'CU', 'Cuba', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (56, 'CY', 'Cyprus', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (57, 'CZ', 'Czech Republic', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (58, 'DK', 'Denmark', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (59, 'DJ', 'Djibouti', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (60, 'DM', 'Dominica', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (61, 'DO', 'Dominican Republic', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (62, 'TP', 'East Timor', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (63, 'EC', 'Ecuador', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (64, 'EG', 'Egypt', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (65, 'SV', 'El Salvador', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (66, 'GQ', 'Equatorial Guinea', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (67, 'ER', 'Eritrea', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (68, 'EE', 'Estonia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (69, 'ET', 'Ethiopia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (70, 'XA', 'External Territories of Australia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (71, 'FK', 'Falkland Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (72, 'FO', 'Faroe Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (73, 'FJ', 'Fiji Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (74, 'FI', 'Finland', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (75, 'FR', 'France', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (76, 'GF', 'French Guiana', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (77, 'PF', 'French Polynesia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (78, 'TF', 'French Southern Territories', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (79, 'GA', 'Gabon', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (80, 'GM', 'Gambia The', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (81, 'GE', 'Georgia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (82, 'DE', 'Germany', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (83, 'GH', 'Ghana', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (84, 'GI', 'Gibraltar', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (85, 'GR', 'Greece', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (86, 'GL', 'Greenland', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (87, 'GD', 'Grenada', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (88, 'GP', 'Guadeloupe', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (89, 'GU', 'Guam', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (90, 'GT', 'Guatemala', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (91, 'XU', 'Guernsey and Alderney', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (92, 'GN', 'Guinea', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (93, 'GW', 'Guinea-Bissau', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (94, 'GY', 'Guyana', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (95, 'HT', 'Haiti', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (96, 'HM', 'Heard and McDonald Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (97, 'HN', 'Honduras', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (98, 'HK', 'Hong Kong S.A.R.', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (99, 'HU', 'Hungary', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (100, 'IS', 'Iceland', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (101, 'IN', 'India', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (102, 'ID', 'Indonesia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (103, 'IR', 'Iran', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (104, 'IQ', 'Iraq', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (105, 'IE', 'Ireland', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (106, 'IL', 'Israel', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (107, 'IT', 'Italy', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (108, 'JM', 'Jamaica', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (109, 'JP', 'Japan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (110, 'XJ', 'Jersey', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (111, 'JO', 'Jordan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (112, 'KZ', 'Kazakhstan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (113, 'KE', 'Kenya', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (114, 'KI', 'Kiribati', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (115, 'KP', 'Korea North', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (116, 'KR', 'Korea South', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (117, 'KW', 'Kuwait', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (118, 'KG', 'Kyrgyzstan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (119, 'LA', 'Laos', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (120, 'LV', 'Latvia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (121, 'LB', 'Lebanon', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (122, 'LS', 'Lesotho', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (123, 'LR', 'Liberia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (124, 'LY', 'Libya', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (125, 'LI', 'Liechtenstein', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (126, 'LT', 'Lithuania', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (127, 'LU', 'Luxembourg', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (128, 'MO', 'Macau S.A.R.', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (129, 'MK', 'Macedonia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (130, 'MG', 'Madagascar', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (131, 'MW', 'Malawi', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (132, 'MY', 'Malaysia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (133, 'MV', 'Maldives', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (134, 'ML', 'Mali', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (135, 'MT', 'Malta', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (136, 'XM', 'Man (Isle of)', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (137, 'MH', 'Marshall Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (138, 'MQ', 'Martinique', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (139, 'MR', 'Mauritania', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (140, 'MU', 'Mauritius', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (141, 'YT', 'Mayotte', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (142, 'MX', 'Mexico', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (143, 'FM', 'Micronesia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (144, 'MD', 'Moldova', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (145, 'MC', 'Monaco', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (146, 'MN', 'Mongolia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (147, 'MS', 'Montserrat', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (148, 'MA', 'Morocco', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (149, 'MZ', 'Mozambique', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (150, 'MM', 'Myanmar', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (151, 'NA', 'Namibia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (152, 'NR', 'Nauru', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (153, 'NP', 'Nepal', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (154, 'AN', 'Netherlands Antilles', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (155, 'NL', 'Netherlands The', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (156, 'NC', 'New Caledonia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (157, 'NZ', 'New Zealand', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (158, 'NI', 'Nicaragua', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (159, 'NE', 'Niger', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (160, 'NG', 'Nigeria', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (161, 'NU', 'Niue', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (162, 'NF', 'Norfolk Island', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (163, 'MP', 'Northern Mariana Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (164, 'NO', 'Norway', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (165, 'OM', 'Oman', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (166, 'PK', 'Pakistan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (167, 'PW', 'Palau', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (168, 'PS', 'Palestinian Territory Occupied', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (169, 'PA', 'Panama', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (170, 'PG', 'Papua new Guinea', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (171, 'PY', 'Paraguay', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (172, 'PE', 'Peru', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (173, 'PH', 'Philippines', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (174, 'PN', 'Pitcairn Island', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (175, 'PL', 'Poland', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (176, 'PT', 'Portugal', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (177, 'PR', 'Puerto Rico', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (178, 'QA', 'Qatar', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (179, 'RE', 'Reunion', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (180, 'RO', 'Romania', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (181, 'RU', 'Russia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (182, 'RW', 'Rwanda', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (183, 'SH', 'Saint Helena', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (184, 'KN', 'Saint Kitts And Nevis', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (185, 'LC', 'Saint Lucia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (186, 'PM', 'Saint Pierre and Miquelon', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (187, 'VC', 'Saint Vincent And The Grenadines', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (188, 'WS', 'Samoa', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (189, 'SM', 'San Marino', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (190, 'ST', 'Sao Tome and Principe', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (191, 'SA', 'Saudi Arabia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (192, 'SN', 'Senegal', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (193, 'RS', 'Serbia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (194, 'SC', 'Seychelles', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (195, 'SL', 'Sierra Leone', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (196, 'SG', 'Singapore', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (197, 'SK', 'Slovakia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (198, 'SI', 'Slovenia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (199, 'XG', 'Smaller Territories of the UK', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (200, 'SB', 'Solomon Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (201, 'SO', 'Somalia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (202, 'ZA', 'South Africa', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (203, 'GS', 'South Georgia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (204, 'SS', 'South Sudan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (205, 'ES', 'Spain', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (206, 'LK', 'Sri Lanka', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (207, 'SD', 'Sudan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (208, 'SR', 'Suriname', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (209, 'SJ', 'Svalbard And Jan Mayen Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (210, 'SZ', 'Swaziland', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (211, 'SE', 'Sweden', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (212, 'CH', 'Switzerland', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (213, 'SY', 'Syria', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (214, 'TW', 'Taiwan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (215, 'TJ', 'Tajikistan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (216, 'TZ', 'Tanzania', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (217, 'TH', 'Thailand', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (218, 'TG', 'Togo', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (219, 'TK', 'Tokelau', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (220, 'TO', 'Tonga', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (221, 'TT', 'Trinidad And Tobago', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (222, 'TN', 'Tunisia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (223, 'TR', 'Turkey', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (224, 'TM', 'Turkmenistan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (225, 'TC', 'Turks And Caicos Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (226, 'TV', 'Tuvalu', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (227, 'UG', 'Uganda', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (228, 'UA', 'Ukraine', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (229, 'AE', 'United Arab Emirates', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (230, 'GB', 'United Kingdom', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (231, 'US', 'United States', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (232, 'UM', 'United States Minor Outlying Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (233, 'UY', 'Uruguay', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (234, 'UZ', 'Uzbekistan', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (235, 'VU', 'Vanuatu', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (236, 'VA', 'Vatican City State (Holy See)', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (237, 'VE', 'Venezuela', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (238, 'VN', 'Vietnam', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (239, 'VG', 'Virgin Islands (British)', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (240, 'VI', 'Virgin Islands (US)', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (241, 'WF', 'Wallis And Futuna Islands', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (242, 'EH', 'Western Sahara', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (243, 'YE', 'Yemen', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (244, 'YU', 'Yugoslavia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (245, 'ZM', 'Zambia', NULL, NULL, NULL);
INSERT INTO `oa_base_country` VALUES (246, 'ZW', 'Zimbabwe', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oa_base_currency
-- ----------------------------
DROP TABLE IF EXISTS `oa_base_currency`;
CREATE TABLE `oa_base_currency`  (
  `Id` int(41) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `CreateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `CreateUser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建用户',
  `CurrencySign` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币别标识符',
  `CurrencyName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币别名称',
  `enname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文显示',
  `cnname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简体中文显示',
  `twname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '繁体中文显示',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_base_currency
-- ----------------------------
INSERT INTO `oa_base_currency` VALUES (1, '2018-01-02 10:57:33', 'admin', '￥', 'RMB', NULL, '人民币', NULL);
INSERT INTO `oa_base_currency` VALUES (3, '2018-01-02 10:57:33', 'admin', '$', 'USD', NULL, '美元', NULL);
INSERT INTO `oa_base_currency` VALUES (4, '2018-08-27 15:24:21', 'admin', '￡', 'GBP', NULL, '英镑', NULL);
INSERT INTO `oa_base_currency` VALUES (5, '2018-08-27 15:38:54', 'admin', 'J￥', 'JPY', NULL, '日元', NULL);
INSERT INTO `oa_base_currency` VALUES (6, '2018-08-28 09:44:52', 'admin', '€', 'EUR', NULL, '欧元', NULL);

-- ----------------------------
-- Table structure for oa_base_industry
-- ----------------------------
DROP TABLE IF EXISTS `oa_base_industry`;
CREATE TABLE `oa_base_industry`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sortname` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文显示',
  `cnname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简体中文显示',
  `twname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '繁体中文显示',
  `Comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_base_industry
-- ----------------------------
INSERT INTO `oa_base_industry` VALUES (1, 'A', '快速消费型', NULL, '快速消费型', NULL, '快速消费备注');
INSERT INTO `oa_base_industry` VALUES (2, 'B', '设备生产型', NULL, '设备生产型', NULL, '设备生产性备注');
INSERT INTO `oa_base_industry` VALUES (3, 'C', '精密器件生产型', NULL, '精密器件生产型', NULL, NULL);
INSERT INTO `oa_base_industry` VALUES (4, 'D', '互联网类', NULL, '互联网类', NULL, NULL);
INSERT INTO `oa_base_industry` VALUES (5, 'E', '物流行业', NULL, '物流行业', NULL, '物流行业备注');
INSERT INTO `oa_base_industry` VALUES (6, 'F', '餐饮类', NULL, '餐饮类', NULL, NULL);
INSERT INTO `oa_base_industry` VALUES (7, 'G', '工程类', NULL, '工程类', NULL, NULL);
INSERT INTO `oa_base_industry` VALUES (8, 'H', '娱乐类', NULL, '娱乐类', NULL, NULL);
INSERT INTO `oa_base_industry` VALUES (9, 'I', '金融类', NULL, '金融类', NULL, NULL);
INSERT INTO `oa_base_industry` VALUES (10, 'J', '实体业', NULL, '实体业', NULL, NULL);
INSERT INTO `oa_base_industry` VALUES (11, 'K', '运输类', NULL, '运输类', NULL, '运输类备注');
INSERT INTO `oa_base_industry` VALUES (12, 'L', '制造业', NULL, '制造业', NULL, '制造业备注');
INSERT INTO `oa_base_industry` VALUES (13, '', '服务业', NULL, '服务业', NULL, '服务业备注');

-- ----------------------------
-- Table structure for oa_base_type
-- ----------------------------
DROP TABLE IF EXISTS `oa_base_type`;
CREATE TABLE `oa_base_type`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `sortname` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文显示',
  `cnname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简体中文显示',
  `twname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '繁体中文显示',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_base_type
-- ----------------------------
INSERT INTO `oa_base_type` VALUES (1, 'A', '股份制企业', NULL, '股份制企业', NULL);
INSERT INTO `oa_base_type` VALUES (2, 'B', '上市公司', NULL, '上市公司', NULL);
INSERT INTO `oa_base_type` VALUES (3, 'C', '大型国企', NULL, '大型国企', NULL);
INSERT INTO `oa_base_type` VALUES (4, 'D', '私营公司', NULL, '私营公司', NULL);
INSERT INTO `oa_base_type` VALUES (5, 'E', '外资企业', NULL, '外资企业', NULL);
INSERT INTO `oa_base_type` VALUES (6, 'F', '台资企业', NULL, '台资企业', NULL);

-- ----------------------------
-- Table structure for oa_base_volume
-- ----------------------------
DROP TABLE IF EXISTS `oa_base_volume`;
CREATE TABLE `oa_base_volume`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `volumetype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortname` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_base_volume
-- ----------------------------
INSERT INTO `oa_base_volume` VALUES (1, 'cash', '1', '1000万以内');
INSERT INTO `oa_base_volume` VALUES (2, 'cash', '2', '1000~5000万');
INSERT INTO `oa_base_volume` VALUES (3, 'cash', '3', '5000~10000万');
INSERT INTO `oa_base_volume` VALUES (4, 'cash', '4', '1~5亿');
INSERT INTO `oa_base_volume` VALUES (5, 'cash', '5', '5~10亿');
INSERT INTO `oa_base_volume` VALUES (6, 'cash', '6', '10亿以上');

-- ----------------------------
-- Table structure for oa_company_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_company_info`;
CREATE TABLE `oa_company_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司记录自增id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司的随机编码',
  `group_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司所属的集团编码对应oa_group_info表中的code字段',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司中文名称',
  `en_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司英文名称',
  `sync_type` tinyint(1) NULL DEFAULT 0 COMMENT '数据同步更新方式：1为自动;0为手动；用于判断是否需要配置接口授权信息',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '公司是否有效:1为有效,0为无效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE COMMENT '关联外部的索引'
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '集团公司基础信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_company_info
-- ----------------------------
INSERT INTO `oa_company_info` VALUES (1, 'gs_15488370176758973', 'jt_1548139507', '腾讯', 'tx', 1, '2019-01-30 16:30:17', 'admin', 1);
INSERT INTO `oa_company_info` VALUES (2, 'gs_15488370171166977', 'jt_1548139507', '百度', 'bd', 1, '2019-01-30 16:30:17', 'admin', 1);

-- ----------------------------
-- Table structure for oa_company_secrekey_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_company_secrekey_info`;
CREATE TABLE `oa_company_secrekey_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `company_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司的唯一编码',
  `app_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分配给AUTH服务的唯一标记符，用于对方调用接口认证授权使用',
  `app_secret` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分配给 app_id 的加密私钥',
  `api_uri` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分配给 app_id 可访问的接口URI地址',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `company_code`(`company_code`) USING BTREE COMMENT '关联外部的索引'
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司授权同步的密钥信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_company_secrekey_info
-- ----------------------------
INSERT INTO `oa_company_secrekey_info` VALUES (1, 'gs_15488370176758973', 'wxb11529c136998cb6', 'SKVvgKlpCGPID3J0zRBO72FLEht8xq1Xo4ukeQT6fZ', 'api.master.com', 'admin', '2019-01-30 16:30:17');
INSERT INTO `oa_company_secrekey_info` VALUES (2, 'gs_15488370171166977', 'wxb11529c136998cb6', 'SKn62tAh4QuB0NLkFTqYipgsKvcemlyDC38M5PgwOz', 'api.master.com', 'admin', '2019-01-30 17:07:20');

-- ----------------------------
-- Table structure for oa_customer_cashpool
-- ----------------------------
DROP TABLE IF EXISTS `oa_customer_cashpool`;
CREATE TABLE `oa_customer_cashpool`  (
  `Id` bigint(17) UNSIGNED NOT NULL,
  `CreateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `CreateUser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建用户',
  `CustomerId` bigint(17) UNSIGNED NULL DEFAULT NULL COMMENT '关联客户的全局ID',
  `CashpoolCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市场全局的唯一编号',
  `CompanyId` bigint(17) UNSIGNED NULL DEFAULT NULL,
  `CompanyDivision` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CurrencySign` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币别标识符',
  `CurrencyName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币别名称',
  `UserId` bigint(17) NULL DEFAULT NULL,
  `ReconciliationDate` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '企业发票对账日',
  `PaymentDay` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '早付周期日',
  `PaymentType` enum('day','week','month') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'month' COMMENT '早付方式：月付、周付、日付',
  `ReservePercent` decimal(5, 1) NULL DEFAULT 0.0,
  `SyncVendorDate` tinyint(4) NULL DEFAULT NULL COMMENT '自动更新同步供应端日期',
  `SyncVendorType` tinyint(1) NULL DEFAULT 0 COMMENT '是否自动更新同步发票',
  `SyncInvoiceDate` tinyint(4) NULL DEFAULT NULL COMMENT '自动更新同步发票日期',
  `SyncInvoiceType` tinyint(1) NULL DEFAULT 0 COMMENT '是否自动更新同步发票',
  `Memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `AutoSyncType` tinyint(1) NULL DEFAULT 0 COMMENT '是否自动更新同步发票',
  `MiniAPR` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '最小年化率',
  `ExpectAPR` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '期望年化率',
  `MarketStatus` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0: 正常，活跃\n1: 不活跃',
  `NextPaydate` date NULL DEFAULT NULL COMMENT '市场的下一支付日期',
  `AvailableAmount` decimal(18, 4) NOT NULL DEFAULT 0.0000 COMMENT '资金池资金',
  `AutoAmount` decimal(18, 4) NOT NULL DEFAULT 0.0000 COMMENT '当前可参与计算的资金',
  `ManualAmount` decimal(18, 4) NOT NULL DEFAULT 0.0000 COMMENT '当前可手工支付的资金',
  `AllocateId` bigint(17) UNSIGNED NULL DEFAULT NULL COMMENT '资金分配的ID',
  `LastUpdateTime` datetime(0) NULL DEFAULT NULL,
  `LastUpdateUser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GroupId` bigint(17) UNSIGNED NOT NULL DEFAULT 0,
  `company_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pool_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `uk_Customer_Cashpool_CashpoolCode`(`CashpoolCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_customer_cashpool
-- ----------------------------
INSERT INTO `oa_customer_cashpool` VALUES (25709385548300525, '2017-11-28 13:54:01', 'admin', NULL, 'xxxx-1-xxx', 25709385548300541, '深圳达克威铝材公司', '￥', 'RMB', 25733109320256730, 2, 3, 'day', 3.0, NULL, 0, NULL, 0, NULL, 0, 4.00, 8.00, 1, '2018-11-29', 10000000.0000, 10000000.0000, 300000.0000, 25850226686307357, NULL, NULL, 0, '', '', 'XXXXX');
INSERT INTO `oa_customer_cashpool` VALUES (25709385548300526, '2017-11-28 13:54:01', 'admin', NULL, 'xxxx-2-xxx', 25709385548300541, 'Asia-Pacific regional', '$', 'USD', 25733109320256730, 1, 4, 'week', 3.0, NULL, 0, NULL, 0, NULL, 0, 3.00, 7.00, 1, '2018-11-30', 2000000.0000, 2000000.0000, 60000.0000, 25850226686307786, NULL, NULL, 0, '', '', 'YYYYY');
INSERT INTO `oa_customer_cashpool` VALUES (25709385548300527, '2017-11-28 13:54:01', 'admin', NULL, 'xxxx-3-xxx', 25709385548300541, '上海石墨微磁公司', '￥', 'RMB', 25733109320256730, 1, 2, 'week', 3.0, NULL, 0, NULL, 0, NULL, 0, 7.00, 12.00, 1, '2018-11-28', 14000000.0000, 14000000.0000, 420000.0000, 25850226686307361, NULL, NULL, 0, '', '', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (25709385548300528, '2017-11-28 13:54:01', 'admin', NULL, 'xxxx-4-xxx', 25709385548300542, '深圳微图像识别科技公司', '￥', 'RMB', 25733109320256730, 1, 3, 'day', 3.0, NULL, 0, NULL, 0, NULL, 0, 7.00, 12.00, 1, '2018-11-29', 5420000.0000, 15420000.0000, 162600.0000, 25709385548300521, NULL, NULL, 0, '', '', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (25709385548300595, '2017-11-28 13:54:01', 'admin', NULL, 'xxxx-5-xxx', 25709385548300543, '深圳人工智能系统公司', '￥', 'RMB', 25733109320256730, 1, 3, 'day', 3.0, NULL, 0, NULL, 0, NULL, 0, 5.00, 11.00, 1, '2018-11-29', 450000.0000, 10450000.0000, 13500.0000, 25733109320565161, NULL, NULL, 0, '', '', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (25913707879989252, '2018-12-12 15:02:26', 'customer', NULL, 'xxxx-6-xxx', 25913707879989249, '1', '￥', 'RMB', 25733109320256723, 1, 1, 'month', 0.0, 1, 0, 1, 0, '111', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2018-12-12 15:02:26', 'customer', 0, '', '', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (25915147281236069, '2018-12-14 16:30:10', 'customer', NULL, 'xxxx-7-xxx', 25915147281236060, '王者前线', '$', 'USD', 25915147281236064, 2, 1, 'month', 0.0, 3, 0, 1, 0, '45', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-22 11:19:45', 'admin', 25915147281236060, '', '', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (25915147281236070, '2018-12-14 16:30:10', 'customer', NULL, 'xxxx-8-xxx', 25915147281236060, '泡泡部落', '￥', 'RMB', 25915147281236063, 6, 1, 'month', 0.0, 7, 0, 5, 0, '8', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-22 11:20:31', 'admin', 25915147281236060, '', '', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (25915147281236072, '2018-08-20 09:29:30', 'customer', NULL, 'xxxx-9-xxx', 25733109320256715, 'new coming', '￥', 'RMB', 25733109320256723, 2, 1, 'month', 0.0, 3, 0, 1, 0, '11111111111111111111111', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-22 11:43:00', 'admin', 25733109320256715, '', '', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (25923863514710021, '2018-12-14 16:30:10', 'customer', NULL, 'xxxx-10-xxx', 25915147281236060, '11', '￥', 'RMB', 25915147281236063, 1, 1, 'month', 0.0, 11, 0, 11, 0, '1', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-22 11:27:29', 'admin', 25915147281236060, '', '', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (25923863514710022, '2018-12-14 16:30:10', 'customer', NULL, 'xxxx-11-xxx', 25915147281236060, '3', '￥', 'RMB', 25915147281236063, 3, 1, 'month', 0.0, 3, 0, 3, 0, '4444', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-22 11:36:48', 'admin', 25915147281236060, '', '', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (25923863514710032, '2018-12-19 16:03:01', 'customer', NULL, 'xxxx-12-xxx', 25923863514710023, '大市场', '￥', 'RMB', 25923863514710026, 30, 1, 'month', 0.0, 10, 0, 20, 0, 'afafa', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-22 11:54:05', 'admin', 25923863514710023, '', '', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227645, '2018-12-14 16:30:10', 'customer', NULL, 'xxxx-13-xxx', 25915147281236060, '王者前线', '$', 'USD', 25915147281236064, 2, 1, 'month', 0.0, 3, 0, 1, 0, '45', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-22 11:28:39', 'admin', 25915147281236060, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227792, '2019-01-18 16:09:20', 'admin', NULL, 'xxxx-14-xxx', 0, '龙中', '', '￥', 0, 3, 1, 'month', 0.0, 2, 0, 1, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 16:09:20', 'admin', 0, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227801, '2019-01-18 16:35:02', 'admin', NULL, 'xxxx-15-xxx', 0, '中文', '', '￥', NULL, 5, 1, 'month', 0.0, 4, 0, 4, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 16:35:02', 'admin', 0, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227821, '2019-01-18 17:29:17', 'admin', NULL, 'xxxx-16-xxx', 0, '在威斯', '￥', 'RMB', NULL, 1, 1, 'month', 0.0, 12, 0, 12, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 17:29:17', 'admin', 0, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227822, '2019-01-18 17:29:27', 'admin', NULL, 'xxxx-17-xxx', 0, '在威斯', '￥', 'RMB', NULL, 1, 1, 'month', 0.0, 12, 0, 12, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 17:29:27', 'admin', 0, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227823, '2019-01-18 17:29:43', 'admin', NULL, 'xxxx-18-xxx', 0, '在威斯', '￥', 'RMB', NULL, 1, 1, 'month', 0.0, 12, 0, 12, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 17:29:43', 'admin', 0, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227828, '2019-01-18 17:38:00', 'admin', NULL, 'xxxx-19-xxx', NULL, '五三', '￥', 'RMB', NULL, 3, 1, 'month', 0.0, 2, 0, 2, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 17:38:00', 'admin', 98019142233227824, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227837, '2019-01-18 17:48:26', 'admin', NULL, 'xxxx-20-xxx', NULL, '532412', '￥', 'RMB', NULL, 2, 1, 'month', 0.0, 2, 0, 1, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 17:48:26', 'admin', 98019142233227833, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227842, '2019-01-18 17:52:07', 'admin', NULL, 'xxxx-21-xxx', NULL, 'f41212', '￥', 'RMB', NULL, 4, 1, 'month', 0.0, 2, 0, 2, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 17:52:07', 'admin', 98019142233227838, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227847, '2019-01-18 18:00:46', 'admin', NULL, 'xxxx-22-xxx', 98019142233227846, '1231', '￡', 'GBP', NULL, 2, 1, 'month', 0.0, 2, 0, 2, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 18:00:46', 'admin', 98019142233227843, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227852, '2019-01-18 18:08:11', 'admin', NULL, 'xxxx-23-xxx', 98019142233227851, '231', '￥', 'RMB', NULL, 11, 1, 'month', 0.0, 3, 0, 2, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 18:08:11', 'admin', 98019142233227848, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227853, '2019-01-18 18:08:59', 'admin', NULL, 'xxxx-24-xxx', 98019142233227851, '231312', '$', 'USD', NULL, 2, 1, 'month', 0.0, 1, 0, 1, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 18:08:59', 'admin', 98019142233227848, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227873, '2019-01-18 18:29:22', 'admin', NULL, 'xxxx-25-xxx', 98019142233227872, '23131', '￡', 'GBP', NULL, 2, 1, 'month', 0.0, 3, 0, 2, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 18:29:22', 'admin', 98019142233227869, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227878, '2019-01-18 18:33:30', 'admin', NULL, 'xxxx-26-xxx', 98019142233227877, '23123', '￥', 'RMB', NULL, 3, 1, 'month', 0.0, 2, 0, 2, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 18:33:30', 'admin', 98019142233227874, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227879, '2019-01-18 18:35:03', 'admin', NULL, 'xxxx-27-xxx', 0, '21312', '￡', 'JPY', NULL, 3, 1, 'month', 0.0, 2, 0, 2, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 18:35:03', 'admin', 0, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227880, '2019-01-18 18:36:55', 'admin', NULL, 'xxxx-28-xxx', 0, '1', '$', 'USD', NULL, 4, 1, 'month', 0.0, 2, 0, 2, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 18:36:55', 'admin', 0, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227885, '2019-01-18 18:38:20', 'admin', NULL, 'xxxx-29-xxx', 98019142233227884, '2312312', '￡', 'GBP', NULL, 3, 1, 'month', 0.0, 2, 0, 2, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 18:38:20', 'admin', 98019142233227881, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227886, '2019-01-18 18:40:16', 'admin', NULL, 'xxxx-30-xxx', 0, '11', '￡', 'GBP', NULL, 4, 1, 'month', 0.0, 3, 0, 2, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 18:40:16', 'admin', 0, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98019142233227887, '2019-01-18 18:43:30', 'admin', NULL, 'xxxx-31-xxx', 0, '2131', 'J￥', 'JPY', NULL, 3, 1, 'month', 0.0, 2, 0, 2, 0, '记录', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-18 18:43:30', 'admin', 0, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98029314963931140, '2019-01-22 14:17:26', 'admin', NULL, 'xxxx-32-xxx', 98029314963931139, '万家灯火', '￥', 'RMB', NULL, 5, 1, 'month', 0.0, 5, 0, 5, 0, '记录妮妮', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-22 14:17:26', 'admin', 98029314963931136, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98029314963931145, '2019-01-22 14:53:51', 'admin', NULL, 'xxxx-33-xxx', 98029314963931144, '英雄联盟', '￥', 'RMB', NULL, 2, 1, 'month', 0.0, 2, 0, 2, 0, '记录五九', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-22 14:53:51', 'admin', 98029314963931141, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98029314963931150, '2019-01-22 15:21:08', 'admin', NULL, 'xxxx-34-xxx', 98029314963931149, '前海舞蹈', '￥', 'RMB', NULL, 5, 1, 'month', 0.0, 4, 0, 4, 0, '且', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-22 15:21:08', 'admin', 98029314963931146, '暂无', '暂无', NULL);
INSERT INTO `oa_customer_cashpool` VALUES (98029314963931151, '2019-01-22 15:24:55', 'admin', NULL, 'xxxx-35-xxx', 98029314963931149, '福田跳伞', '$', 'USD', NULL, 6, 1, 'month', 0.0, 5, 0, 4, 0, '555555', 0, 0.00, 0.00, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, '2019-01-22 15:24:55', 'admin', 98029314963931146, '暂无', '暂无', NULL);

-- ----------------------------
-- Table structure for oa_customer_extra
-- ----------------------------
DROP TABLE IF EXISTS `oa_customer_extra`;
CREATE TABLE `oa_customer_extra`  (
  `Id` bigint(17) UNSIGNED NOT NULL,
  `CreateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `CreateUser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建用户',
  `CustomerId` bigint(17) UNSIGNED NULL DEFAULT NULL,
  `CompanyId` bigint(17) UNSIGNED NOT NULL COMMENT '每个市场的唯一ID',
  `SaleVolumeId` int(11) NULL DEFAULT NULL COMMENT '年销售额范围ID',
  `SaleVolume` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年销售额',
  `PurhchaseVolumeId` int(11) NULL DEFAULT NULL COMMENT '年采购额范围ID',
  `PurhchaseVolume` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年采购额',
  `CashflowVolumeId` int(11) NULL DEFAULT NULL COMMENT '资金流范围ID',
  `CashflowVolume` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资金流状况',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_customer_extra
-- ----------------------------
INSERT INTO `oa_customer_extra` VALUES (25733109320256237, '2018-08-15 15:13:09', 'customer', NULL, 0, 1, '333', 2, '2344', 3, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256242, '2018-08-15 15:20:38', 'customer', NULL, 0, 1, '333', 2, '2344', 3, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256254, '2018-08-15 15:51:39', 'customer', NULL, 25733109320256250, 1, '333', 2, '2344', 3, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256269, '2018-08-15 16:39:30', 'customer', NULL, 25733109320256265, 1, '333', 1, '2344', 1, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256348, '2018-08-15 17:17:30', 'customer', NULL, 25733109320256344, 1, '333', 1, '2344', 1, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256353, '2018-08-15 17:19:37', 'customer', NULL, 25733109320256349, 5, '3339', 3, '23449', 2, '2239');
INSERT INTO `oa_customer_extra` VALUES (25733109320256387, '2018-08-16 09:52:33', 'customer', NULL, 25733109320256383, 1, '333', 1, '2344', 1, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256392, '2018-08-16 09:54:55', 'customer', NULL, 25733109320256388, 1, '333', 1, '2344', 1, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256397, '2018-08-16 10:03:39', 'customer', NULL, 25733109320256393, 1, '333', 1, '2344', 1, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256402, '2018-08-16 10:06:32', 'customer', NULL, 25733109320256398, 1, '333', 1, '2344', 1, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256407, '2018-08-16 10:08:44', 'customer', NULL, 25733109320256403, 4, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25733109320256412, '2018-08-16 10:32:14', 'customer', NULL, 25733109320256408, 1, '333', 1, '2344', 1, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256417, '2018-08-16 10:37:18', 'customer', NULL, 25733109320256413, 1, '333', 1, '2344', 1, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256422, '2018-08-16 11:10:07', 'customer', NULL, 25733109320256418, 1, '333', 2, '2344', 3, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256440, '2018-08-16 11:37:52', 'customer', NULL, 25733109320256436, 1, '333', 1, '2344', 1, '223');
INSERT INTO `oa_customer_extra` VALUES (25733109320256510, '2018-08-17 14:21:21', 'customer', NULL, 25733109320256506, 1, '33355', 2, '2344955', 3, '22355');
INSERT INTO `oa_customer_extra` VALUES (25733109320256726, '2018-08-20 09:29:30', 'customer', NULL, 25733109320256715, 1, '333', 2, '23449', 3, '22355');
INSERT INTO `oa_customer_extra` VALUES (25900652404146190, '2018-12-04 15:35:21', 'customer', NULL, 25900652404146186, 1, '110', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25900652404146195, '2018-12-04 15:59:40', 'customer', NULL, 25900652404146191, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25900652404146200, '2018-12-04 16:05:06', 'customer', NULL, 25900652404146196, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25900652404146205, '2018-12-04 16:20:54', 'customer', NULL, 25900652404146201, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25900652404146210, '2018-12-04 16:37:16', 'customer', NULL, 25900652404146206, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25900652404146215, '2018-12-04 16:52:55', 'customer', NULL, 25900652404146211, 1, '100', 1, '123', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25900652404146220, '2018-12-04 16:56:45', 'customer', NULL, 25900652404146216, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25900652404146225, '2018-12-04 17:01:25', 'customer', NULL, 25900652404146221, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25900652404146296, '2018-12-05 10:36:17', 'customer', NULL, 25900652404146292, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25900652404146303, '2018-12-05 14:47:43', 'customer', NULL, 25900652404146299, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25905017735086122, '2018-12-07 12:04:41', 'customer', NULL, 25905017735086118, 1, '4', 1, '5', 1, '6');
INSERT INTO `oa_customer_extra` VALUES (25905017735086127, '2018-12-07 12:05:44', 'customer', NULL, 25905017735086123, 1, '123', 1, '123', 1, '123');
INSERT INTO `oa_customer_extra` VALUES (25915147281235988, '2018-12-13 13:56:29', 'customer', NULL, 25915147281235984, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25915147281235993, '2018-12-13 14:15:23', 'customer', NULL, 25915147281235989, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25915147281235998, '2018-12-13 14:17:40', 'customer', NULL, 25915147281235994, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25915147281236003, '2018-12-13 14:19:46', 'customer', NULL, 25915147281235999, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25915147281236037, '2018-12-14 11:26:25', 'customer', NULL, 25915147281236032, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25915147281236046, '2018-12-14 13:57:43', 'customer', NULL, 25915147281236041, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25915147281236055, '2018-12-14 14:40:50', 'customer', NULL, 25915147281236050, 1, '100', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (25915147281236065, '2018-12-14 16:30:10', 'customer', NULL, 25915147281236060, 1, '300', 1, '210', 1, '100');
INSERT INTO `oa_customer_extra` VALUES (25923863514710027, '2018-12-19 16:03:01', 'customer', NULL, 25923863514710023, 1, '110', 1, '200', 1, '300');
INSERT INTO `oa_customer_extra` VALUES (98019142233227634, '2019-01-14 15:04:25', 'customer', NULL, 98019142233227630, 2, '15554441', 1, '2222222', 3, '6222221');
INSERT INTO `oa_customer_extra` VALUES (98019142233227653, '2019-01-17 14:37:15', 'customer', NULL, 98019142233227649, 2, '15554441', 1, '2222222', 3, '6222221');
INSERT INTO `oa_customer_extra` VALUES (98019142233227658, '2019-01-17 14:37:38', 'customer', NULL, 98019142233227654, 2, '15554441', 1, '2222222', 3, '6222221');
INSERT INTO `oa_customer_extra` VALUES (98019142233227663, '2019-01-17 14:43:13', 'customer', NULL, 98019142233227659, 2, '15554441', 1, '2222222', 3, '6222221');
INSERT INTO `oa_customer_extra` VALUES (98019142233227668, '2019-01-17 14:45:55', 'customer', NULL, 98019142233227664, 2, '15554441', 1, '2222222', 3, '6222221');
INSERT INTO `oa_customer_extra` VALUES (98019142233227673, '2019-01-17 15:42:20', 'customer', NULL, 98019142233227669, 2, '15554441', 1, '2222222', 3, '6222221');
INSERT INTO `oa_customer_extra` VALUES (98019142233227678, '2019-01-17 15:57:59', 'customer', NULL, 98019142233227674, 2, '15554441', 1, '2222222', 3, '6222221');
INSERT INTO `oa_customer_extra` VALUES (98019142233227683, '2019-01-17 16:05:55', 'customer', NULL, 98019142233227679, 2, '15554441', 1, '2222222', 3, '6222221');
INSERT INTO `oa_customer_extra` VALUES (98019142233227688, '2019-01-17 16:08:07', 'customer', NULL, 98019142233227684, 2, '15554441', 1, '2222222', 3, '6222221');
INSERT INTO `oa_customer_extra` VALUES (98019142233227693, '2019-01-17 16:16:02', 'customer', NULL, 98019142233227689, 2, '15554441', 1, '2222222', 3, '6222221');
INSERT INTO `oa_customer_extra` VALUES (98019142233227708, '2019-01-17 17:21:44', 'customer', NULL, 98019142233227706, 1, '131313', 1, '131313', 1, '131313');
INSERT INTO `oa_customer_extra` VALUES (98019142233227711, '2019-01-17 17:24:20', 'customer', NULL, 98019142233227709, 1, '131313', 1, '131313', 1, '131313');
INSERT INTO `oa_customer_extra` VALUES (98019142233227714, '2019-01-17 18:16:39', 'customer', NULL, 98019142233227712, 1, '123456', 1, '123456', 1, '123456');
INSERT INTO `oa_customer_extra` VALUES (98019142233227739, '2019-01-18 14:27:54', 'customer', NULL, 98019142233227737, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227743, '2019-01-18 14:53:34', 'customer', NULL, 98019142233227741, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227747, '2019-01-18 14:58:00', 'customer', NULL, 98019142233227745, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227751, '2019-01-18 15:04:43', 'customer', NULL, 98019142233227749, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227755, '2019-01-18 15:19:00', 'customer', NULL, 98019142233227753, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227759, '2019-01-18 15:22:09', 'customer', NULL, 98019142233227757, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227763, '2019-01-18 15:32:05', 'customer', NULL, 98019142233227761, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227768, '2019-01-18 15:36:32', 'customer', NULL, 98019142233227766, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227773, '2019-01-18 15:46:29', 'customer', NULL, 98019142233227771, 1, '1', 1, '1', 1, '1');
INSERT INTO `oa_customer_extra` VALUES (98019142233227777, '2019-01-18 15:50:44', 'customer', NULL, 98019142233227775, 1, '123456', 1, '234567', 1, '334567');
INSERT INTO `oa_customer_extra` VALUES (98019142233227781, '2019-01-18 15:55:47', 'customer', NULL, 98019142233227779, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227785, '2019-01-18 16:00:31', 'customer', NULL, 98019142233227783, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227795, '2019-01-18 16:22:11', 'customer', NULL, 98019142233227793, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227799, '2019-01-18 16:34:02', 'customer', NULL, 98019142233227797, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227804, '2019-01-18 17:09:07', 'customer', NULL, 98019142233227802, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227807, '2019-01-18 17:11:49', 'customer', NULL, 98019142233227805, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227811, '2019-01-18 17:18:18', 'customer', NULL, 98019142233227809, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227815, '2019-01-18 17:25:05', 'customer', NULL, 98019142233227813, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227819, '2019-01-18 17:28:31', 'customer', NULL, 98019142233227817, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227826, '2019-01-18 17:37:24', 'customer', NULL, 98019142233227824, 1, '123456', 1, '234567', 1, '345678');
INSERT INTO `oa_customer_extra` VALUES (98019142233227831, '2019-01-18 17:42:40', 'customer', NULL, 98019142233227829, 1, '232', 1, '2323', 1, '2323');
INSERT INTO `oa_customer_extra` VALUES (98019142233227835, '2019-01-18 17:47:48', 'customer', NULL, 98019142233227833, 1, '2312', 1, '231312', 1, '21312');
INSERT INTO `oa_customer_extra` VALUES (98019142233227840, '2019-01-18 17:51:40', 'customer', NULL, 98019142233227838, 1, '12312', 1, '31231', 1, '43423');
INSERT INTO `oa_customer_extra` VALUES (98019142233227845, '2019-01-18 17:59:49', 'customer', NULL, 98019142233227843, 1, '12312', 1, '23123', 1, '31311');
INSERT INTO `oa_customer_extra` VALUES (98019142233227850, '2019-01-18 18:07:41', 'customer', NULL, 98019142233227848, 1, '123123', 1, '231311', 1, '231312');
INSERT INTO `oa_customer_extra` VALUES (98019142233227856, '2019-01-18 18:23:07', 'customer', NULL, 98019142233227854, 1, '23123123', 1, '23131313', 1, '23123123');
INSERT INTO `oa_customer_extra` VALUES (98019142233227861, '2019-01-18 18:24:23', 'customer', NULL, 98019142233227858, NULL, '', NULL, '', NULL, '');
INSERT INTO `oa_customer_extra` VALUES (98019142233227864, '2019-01-18 18:25:23', 'customer', NULL, 98019142233227862, 1, '23123', 1, '2131231', 1, '312331');
INSERT INTO `oa_customer_extra` VALUES (98019142233227868, '2019-01-18 18:27:12', 'customer', NULL, 98019142233227866, 1, '231', 1, '321', 1, '3123');
INSERT INTO `oa_customer_extra` VALUES (98019142233227871, '2019-01-18 18:28:39', 'customer', NULL, 98019142233227869, 1, '231', 1, '312', 1, '31311');
INSERT INTO `oa_customer_extra` VALUES (98019142233227876, '2019-01-18 18:33:05', 'customer', NULL, 98019142233227874, 1, '2313', 1, '21312', 1, '3123');
INSERT INTO `oa_customer_extra` VALUES (98019142233227883, '2019-01-18 18:37:53', 'customer', NULL, 98019142233227881, 1, '231', 1, '231223', 1, '23123');
INSERT INTO `oa_customer_extra` VALUES (98029314963931138, '2019-01-22 14:15:57', 'customer', NULL, 98029314963931136, 1, '23456', 1, '34567', 1, '45678');
INSERT INTO `oa_customer_extra` VALUES (98029314963931143, '2019-01-22 14:52:27', 'customer', NULL, 98029314963931141, 1, '23456', 1, '34567', 1, '45678');
INSERT INTO `oa_customer_extra` VALUES (98029314963931148, '2019-01-22 15:19:03', 'customer', NULL, 98029314963931146, 1, '23456', 1, '34567', 1, '45678');

-- ----------------------------
-- Table structure for oa_customer_user
-- ----------------------------
DROP TABLE IF EXISTS `oa_customer_user`;
CREATE TABLE `oa_customer_user`  (
  `Uid` bigint(17) UNSIGNED NOT NULL,
  `CreateUser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建用户',
  `CreateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `CustomerId` bigint(17) UNSIGNED NULL DEFAULT NULL,
  `CompanyId` bigint(17) UNSIGNED NOT NULL COMMENT '每个市场的唯一ID',
  `UserStatus` tinyint(2) NOT NULL DEFAULT 1 COMMENT '用户状态只有 1 才为有效',
  `UserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用来显示在业务数据的称呼',
  `FirstName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名字',
  `LastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓氏',
  `UserRole` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户角色( 企业负责人、财务负责人、清算负责人 分别对应 Enterprise、Financial、Charge )',
  `UserEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  `UserContact` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户联系电话',
  `UserPosition` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户职位',
  PRIMARY KEY (`Uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_customer_user
-- ----------------------------
INSERT INTO `oa_customer_user` VALUES (25733109320256231, 'customer', '2018-08-15 15:39:36', NULL, 0, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', 'manager');
INSERT INTO `oa_customer_user` VALUES (25733109320256234, 'customer', '2018-08-15 15:39:36', NULL, 0, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', 'manager');
INSERT INTO `oa_customer_user` VALUES (25733109320256235, 'customer', '2018-08-15 15:39:36', NULL, 0, 1, 'testF testL', 'testF', 'testL', 'Financial', 'ryan@larrweb.com', '9999999999', 'kklsd');
INSERT INTO `oa_customer_user` VALUES (25733109320256236, 'customer', '2018-08-15 15:39:36', NULL, 0, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256239, 'customer', '2018-08-15 15:39:36', NULL, 0, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', 'manager');
INSERT INTO `oa_customer_user` VALUES (25733109320256240, 'customer', '2018-08-15 15:39:36', NULL, 0, 1, 'testF testL', 'testF', 'testL', 'Financial', 'ryan@larrweb.com', '9999999999', 'kklsd');
INSERT INTO `oa_customer_user` VALUES (25733109320256241, 'customer', '2018-08-15 15:39:36', NULL, 0, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256251, 'customer', '2018-08-15 15:51:39', NULL, 25733109320256250, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', 'manager');
INSERT INTO `oa_customer_user` VALUES (25733109320256252, 'customer', '2018-08-15 15:51:39', NULL, 25733109320256250, 1, 'testF testL', 'testF', 'testL', 'Financial', 'ryan@larrweb.com', '9999999999', 'kklsd');
INSERT INTO `oa_customer_user` VALUES (25733109320256253, 'customer', '2018-08-15 15:51:39', NULL, 25733109320256250, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256266, 'customer', '2018-08-15 16:39:29', NULL, 25733109320256265, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', '死神镰刀');
INSERT INTO `oa_customer_user` VALUES (25733109320256267, 'customer', '2018-08-15 16:39:29', NULL, 25733109320256265, 1, 'Richard Yan', 'Richard', 'Yan', 'Financial', 'ryan@victtech.com', '5319468525', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256268, 'customer', '2018-08-15 16:39:29', NULL, 25733109320256265, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '死神镰刀');
INSERT INTO `oa_customer_user` VALUES (25733109320256345, 'customer', '2018-08-15 17:17:30', NULL, 25733109320256344, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', '死神镰刀');
INSERT INTO `oa_customer_user` VALUES (25733109320256346, 'customer', '2018-08-15 17:17:30', NULL, 25733109320256344, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@larrweb.com', '13551590990', 'kklsd');
INSERT INTO `oa_customer_user` VALUES (25733109320256347, 'customer', '2018-08-15 17:17:30', NULL, 25733109320256344, 1, 'testF testL', 'testF', 'testL', 'Charge', 'ryan@larrweb.com', '9999999999', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256350, 'customer', '2018-08-15 17:19:37', NULL, 25733109320256349, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256351, 'customer', '2018-08-15 17:19:37', NULL, 25733109320256349, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@larrweb.com', '13551590990', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256352, 'customer', '2018-08-15 17:19:37', NULL, 25733109320256349, 1, 'testF testL', 'testF', 'testL', 'Charge', 'ryan@larrweb.com', '9999999999', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256384, 'customer', '2018-08-16 09:52:33', NULL, 25733109320256383, 1, '试用户 测', '试用户', '测', 'Enterprise', 'ryan@larrweb.com', '13551590990', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256385, 'customer', '2018-08-16 09:52:33', NULL, 25733109320256383, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@larrweb.com', '13551590990', '死神镰刀zz');
INSERT INTO `oa_customer_user` VALUES (25733109320256386, 'customer', '2018-08-16 09:52:33', NULL, 25733109320256383, 1, 'testF testL', 'testF', 'testL', 'Charge', 'ryan@larrweb.com', '9999999999', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256389, 'customer', '2018-08-16 09:54:55', NULL, 25733109320256388, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', '1');
INSERT INTO `oa_customer_user` VALUES (25733109320256390, 'customer', '2018-08-16 09:54:55', NULL, 25733109320256388, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@larrweb.com', '13551590990', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256391, 'customer', '2018-08-16 09:54:55', NULL, 25733109320256388, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '3');
INSERT INTO `oa_customer_user` VALUES (25733109320256394, 'customer', '2018-08-16 10:03:39', NULL, 25733109320256393, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256395, 'customer', '2018-08-16 10:03:39', NULL, 25733109320256393, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@larrweb.com', '13551590990', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256396, 'customer', '2018-08-16 10:03:39', NULL, 25733109320256393, 1, '试用户 测', '试用户', '测', 'Charge', 'ryan@larrweb.com', '13551590990', '死神镰刀');
INSERT INTO `oa_customer_user` VALUES (25733109320256399, 'customer', '2018-08-16 10:06:32', NULL, 25733109320256398, 1, '试用户 测', '试用户', '测', 'Enterprise', 'ryan@larrweb.com', '13551590990', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256400, 'customer', '2018-08-16 10:06:32', NULL, 25733109320256398, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@victtech.com', '13551590990', '1');
INSERT INTO `oa_customer_user` VALUES (25733109320256401, 'customer', '2018-08-16 10:06:32', NULL, 25733109320256398, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256404, 'customer', '2018-08-16 10:08:44', NULL, 25733109320256403, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', '1');
INSERT INTO `oa_customer_user` VALUES (25733109320256405, 'customer', '2018-08-16 10:08:44', NULL, 25733109320256403, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@victtech.com', '13551590990', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256406, 'customer', '2018-08-16 10:08:44', NULL, 25733109320256403, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '4');
INSERT INTO `oa_customer_user` VALUES (25733109320256409, 'customer', '2018-08-16 10:32:14', NULL, 25733109320256408, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', '1');
INSERT INTO `oa_customer_user` VALUES (25733109320256410, 'customer', '2018-08-16 10:32:14', NULL, 25733109320256408, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@victtech.com', '13551590990', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256411, 'customer', '2018-08-16 10:32:14', NULL, 25733109320256408, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '死神镰刀');
INSERT INTO `oa_customer_user` VALUES (25733109320256414, 'customer', '2018-08-16 10:37:17', NULL, 25733109320256413, 1, '试用户 测', '试用户', '测', 'Enterprise', 'ryan@victtech.com', '13551590990', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256415, 'customer', '2018-08-16 10:37:17', NULL, 25733109320256413, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@larrweb.com', '13551590990', '2');
INSERT INTO `oa_customer_user` VALUES (25733109320256416, 'customer', '2018-08-16 10:37:18', NULL, 25733109320256413, 1, 'testF testL', 'testF', 'testL', 'Charge', 'ryan@larrweb.com', '9999999999', '1');
INSERT INTO `oa_customer_user` VALUES (25733109320256419, 'customer', '2018-08-16 11:10:07', NULL, 25733109320256418, 1, '张 三', '张', '三', 'Enterprise', 'xx@xx.com', '15200000000', '主任');
INSERT INTO `oa_customer_user` VALUES (25733109320256420, 'customer', '2018-08-16 11:10:07', NULL, 25733109320256418, 1, '李 四', '李', '四', 'Financial', 'cc@cc.com', '15300000000', '副主任');
INSERT INTO `oa_customer_user` VALUES (25733109320256421, 'customer', '2018-08-16 11:10:07', NULL, 25733109320256418, 1, '王 五', '王', '五', 'Charge', 'vv@vv.com', '15400000000', '副主任');
INSERT INTO `oa_customer_user` VALUES (25733109320256423, '', '2018-08-16 11:15:12', NULL, 25733109320256418, 1, '张 三风', '张', '三风', 'Enterprise', 'xx@xxx.com', '152000000001', '主任11');
INSERT INTO `oa_customer_user` VALUES (25733109320256424, 'customer', '2018-08-16 11:15:12', NULL, 25733109320256418, 1, '赵 二', '赵', '二', 'Enterprise', 'ww@sw.com', '15500000000', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256425, '', '2018-08-16 11:15:12', NULL, 25733109320256418, 1, '李 四机', '李', '四机', 'Financial', 'cc@cc.com', '15300000000', '副主任');
INSERT INTO `oa_customer_user` VALUES (25733109320256426, '', '2018-08-16 11:15:13', NULL, 25733109320256418, 1, '贾 六', '贾', '六', 'Financial', 'tt@xx.com', '15600000000', '副主任');
INSERT INTO `oa_customer_user` VALUES (25733109320256427, '', '2018-08-16 11:15:13', NULL, 25733109320256418, 1, '王 五各', '王', '五各', 'Charge', 'vv@vv.com', '15400000002', '副主任');
INSERT INTO `oa_customer_user` VALUES (25733109320256428, '', '2018-08-16 11:15:13', NULL, 25733109320256418, 1, '刘 七', '刘', '七', 'Charge', 'ii@ii.com', '15900000000', '科员');
INSERT INTO `oa_customer_user` VALUES (25733109320256429, 'customer', '2018-08-16 11:29:08', NULL, 25733109320256418, 1, '赵 二', '赵', '二', 'Enterprise', 'ww@sw.com', '15500000000', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256430, 'customer', '2018-08-16 11:30:17', NULL, 25733109320256418, 1, '张 三风2', '张', '三风2', 'Enterprise', 'xx@xxx.com', '152000000001', '主任11');
INSERT INTO `oa_customer_user` VALUES (25733109320256431, 'customer', '2018-08-16 11:30:17', NULL, 25733109320256418, 1, '赵 二3', '赵', '二3', 'Enterprise', 'ww@sw.com', '15500000000', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256432, 'customer', '2018-08-16 11:30:17', NULL, 25733109320256418, 1, '李 四机4', '李', '四机4', 'Financial', 'cc@cc.com', '15300000000', '副主任');
INSERT INTO `oa_customer_user` VALUES (25733109320256433, 'customer', '2018-08-16 11:30:17', NULL, 25733109320256418, 1, '贾 六5', '贾', '六5', 'Financial', 'tt@xx.com', '15600000000', '副主任');
INSERT INTO `oa_customer_user` VALUES (25733109320256434, 'customer', '2018-08-16 11:30:17', NULL, 25733109320256418, 1, '王 五各6', '王', '五各6', 'Charge', 'vv@vv.com', '15400000002', '副主任');
INSERT INTO `oa_customer_user` VALUES (25733109320256435, 'customer', '2018-08-16 11:30:17', NULL, 25733109320256418, 1, '刘 七7', '刘', '七7', 'Charge', 'ii@ii.com', '15900000000', '科员');
INSERT INTO `oa_customer_user` VALUES (25733109320256437, 'customer', '2018-08-16 11:37:52', NULL, 25733109320256436, -1, '试用户 11', '试用户', '11', 'Enterprise', 'ryan@victtech.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256438, 'customer', '2018-08-16 11:37:52', NULL, 25733109320256436, 1, '试用户 22', '试用户', '22', 'Charge', 'ryan@larrweb.com', '13551590990', '主任11');
INSERT INTO `oa_customer_user` VALUES (25733109320256439, 'customer', '2018-08-16 11:37:52', NULL, 25733109320256436, 1, '试用户 333', '试用户', '333', 'Charge', 'ryan@victtech.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256441, 'customer', '2018-08-16 11:40:41', NULL, 25733109320256436, 1, '试用户 4', '试用户', '4', 'Charge', 'ryan@larrweb.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256442, 'customer', '2018-08-16 11:40:41', NULL, 25733109320256436, 1, '试用户 5', '试用户', '5', 'Financial', 'ryan@larrweb.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256504, 'customer', '2018-08-17 14:17:51', NULL, 25733109320256503, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256505, 'customer', '2018-08-17 14:17:49', NULL, 25733109320256503, 1, '试用户 测', '试用户', '测', 'Enterprise', 'ryan@victtech.com', '13551590990', '主任11');
INSERT INTO `oa_customer_user` VALUES (25733109320256507, 'customer', '2018-08-17 14:21:21', NULL, 25733109320256506, 1, '试用户 测', '试用户', '测', 'Enterprise', 'ryan@larrweb.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256508, 'customer', '2018-08-17 14:21:21', NULL, 25733109320256506, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@larrweb.com', '13551590990', '主任11');
INSERT INTO `oa_customer_user` VALUES (25733109320256509, 'customer', '2018-08-17 14:21:21', NULL, 25733109320256506, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '主任11');
INSERT INTO `oa_customer_user` VALUES (25733109320256542, 'customer', '2018-08-17 15:17:20', NULL, 25733109320256506, 1, '修 改', '修', '改', 'Enterprise', 'ryan@larrweb.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256543, 'customer', '2018-08-17 15:17:20', NULL, 25733109320256506, 1, '100 Yan', '100', 'Yan', 'Financial', 'ryan@larrweb.com', '9999999999', '主任11');
INSERT INTO `oa_customer_user` VALUES (25733109320256603, 'customer', '2018-08-17 15:41:40', NULL, 25733109320256506, 1, '王 五', '王', '五', 'Charge', 'ryan@victtech.com', '5319468525', '主任11');
INSERT INTO `oa_customer_user` VALUES (25733109320256716, 'customer', '2018-08-20 09:29:29', NULL, 25733109320256715, 1, '李 一', '李', '一', 'Enterprise', 'ryan@victtech.com', '5319468525', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256717, 'customer', '2018-08-20 09:29:29', NULL, 25733109320256715, 1, '李 四', '李', '四', 'Enterprise', 'ryan@larrweb.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256718, 'customer', '2018-08-20 09:29:29', NULL, 25733109320256715, 1, '李 七', '李', '七', 'Enterprise', 'ryan@victtech.com', '5319468525', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256719, 'customer', '2018-08-20 09:29:29', NULL, 25733109320256715, 1, '李 十', '李', '十', 'Enterprise', 'ryan@larrweb.com', '13551590990', '科长');
INSERT INTO `oa_customer_user` VALUES (25733109320256720, 'customer', '2018-08-20 09:29:29', NULL, 25733109320256715, 1, '李 二', '李', '二', 'Financial', 'ryan@victtech.com', '5319468525', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320256721, 'customer', '2018-08-20 09:29:30', NULL, 25733109320256715, -1, '李 五', '李', '五', 'Financial', 'ryan@victtech.com', '5319468525', '主任11');
INSERT INTO `oa_customer_user` VALUES (25733109320256722, 'customer', '2018-08-20 09:29:30', NULL, 25733109320256715, 1, '李 八', '李', '八', 'Financial', 'ryan@victtech.com', '5319468525', '科长');
INSERT INTO `oa_customer_user` VALUES (25733109320256723, 'customer', '2018-08-20 09:29:30', NULL, 25733109320256715, 1, '李 三', '李', '三', 'Charge', 'ryan@larrweb.com', '9999999999', '主任11');
INSERT INTO `oa_customer_user` VALUES (25733109320256724, 'customer', '2018-08-20 09:29:30', NULL, 25733109320256715, 1, '李 六', '李', '六', 'Charge', 'ryan@larrweb.com', '13551590990', '主任11');
INSERT INTO `oa_customer_user` VALUES (25733109320256725, 'customer', '2018-08-20 09:29:30', NULL, 25733109320256715, 1, '李 九', '李', '九', 'Charge', 'ryan@victtech.com', '5319468525', '科长');
INSERT INTO `oa_customer_user` VALUES (25733109320256730, 'customer', '2018-08-20 09:32:55', NULL, 25709385548300541, 1, 'Jorden Michael', 'Jorden', 'Michael', 'Charge', 'cust1@ep-fo.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25733109320565296, 'customer', '2018-10-25 18:34:30', NULL, 25709385548300541, 1, 'Guo Ares', 'Guo', 'Ares', 'Enterprise', 'ares@ep-fo.com', '12345678', 'CEO');
INSERT INTO `oa_customer_user` VALUES (25733109320565297, 'customer', '2018-10-25 18:34:30', NULL, 25709385548300541, 1, 'Fiu Jenny', 'Fiu', 'Jenny', 'Financial', 'jenny@ep-fo.com', '12345678', 'Account');
INSERT INTO `oa_customer_user` VALUES (25733109320565298, 'customer', '2018-10-25 18:34:30', NULL, 25709385548300541, 1, 'Jams Kobe', 'Jams', 'Kobe', 'Charge', 'cust2@ep-fo.com', '12345678', 'CFO');
INSERT INTO `oa_customer_user` VALUES (25900652404146187, 'customer', '2018-12-04 15:35:21', NULL, 25900652404146186, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25900652404146188, 'customer', '2018-12-04 15:35:21', NULL, 25900652404146186, 1, '2 2', '2', '2', 'Financial', '22@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25900652404146189, 'customer', '2018-12-04 15:35:21', NULL, 25900652404146186, 1, '3 3', '3', '3', 'Charge', '3@qq.com', '3', '3');
INSERT INTO `oa_customer_user` VALUES (25900652404146192, 'customer', '2018-12-04 15:59:40', NULL, 25900652404146191, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25900652404146193, 'customer', '2018-12-04 15:59:40', NULL, 25900652404146191, 1, '2 2', '2', '2', 'Financial', '22@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25900652404146194, 'customer', '2018-12-04 15:59:40', NULL, 25900652404146191, 1, '333 3', '333', '3', 'Charge', '3@qq.com', '3', '3');
INSERT INTO `oa_customer_user` VALUES (25900652404146197, 'customer', '2018-12-04 16:05:06', NULL, 25900652404146196, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25900652404146198, 'customer', '2018-12-04 16:05:06', NULL, 25900652404146196, 1, '2 2', '2', '2', 'Financial', '22@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25900652404146199, 'customer', '2018-12-04 16:05:06', NULL, 25900652404146196, 1, '3 3', '3', '3', 'Charge', '3@qq.com', '3', '3');
INSERT INTO `oa_customer_user` VALUES (25900652404146202, 'customer', '2018-12-04 16:20:54', NULL, 25900652404146201, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25900652404146203, 'customer', '2018-12-04 16:20:54', NULL, 25900652404146201, 1, '2 2', '2', '2', 'Financial', '22@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25900652404146204, 'customer', '2018-12-04 16:20:54', NULL, 25900652404146201, 1, '3 3', '3', '3', 'Charge', '3@qq.com', '3', '3');
INSERT INTO `oa_customer_user` VALUES (25900652404146207, 'customer', '2018-12-04 16:37:16', NULL, 25900652404146206, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25900652404146208, 'customer', '2018-12-04 16:37:16', NULL, 25900652404146206, 1, '2 2', '2', '2', 'Financial', '22@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25900652404146209, 'customer', '2018-12-04 16:37:16', NULL, 25900652404146206, 1, '3 3', '3', '3', 'Charge', '3@qq.com', '3', '3');
INSERT INTO `oa_customer_user` VALUES (25900652404146212, 'customer', '2018-12-04 16:52:55', NULL, 25900652404146211, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25900652404146213, 'customer', '2018-12-04 16:52:55', NULL, 25900652404146211, 1, '2 2', '2', '2', 'Financial', '22@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25900652404146214, 'customer', '2018-12-04 16:52:55', NULL, 25900652404146211, 1, '3 3', '3', '3', 'Charge', '3@qq.com', '3', '3');
INSERT INTO `oa_customer_user` VALUES (25900652404146217, 'customer', '2018-12-04 16:56:45', NULL, 25900652404146216, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25900652404146218, 'customer', '2018-12-04 16:56:45', NULL, 25900652404146216, 1, '2 2', '2', '2', 'Financial', '2@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25900652404146219, 'customer', '2018-12-04 16:56:45', NULL, 25900652404146216, 1, '3 3', '3', '3', 'Charge', '3@qq.com', '3', '3');
INSERT INTO `oa_customer_user` VALUES (25900652404146222, 'customer', '2018-12-04 17:01:25', NULL, 25900652404146221, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25900652404146223, 'customer', '2018-12-04 17:01:25', NULL, 25900652404146221, 1, '2 2', '2', '2', 'Financial', '22@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25900652404146224, 'customer', '2018-12-04 17:01:25', NULL, 25900652404146221, 1, '3 3', '3', '3', 'Charge', '3@qq.com', '3', '3');
INSERT INTO `oa_customer_user` VALUES (25900652404146293, 'customer', '2018-12-05 10:36:17', NULL, 25900652404146292, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25900652404146294, 'customer', '2018-12-05 10:36:17', NULL, 25900652404146292, 1, '2 2', '2', '2', 'Financial', '22@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25900652404146295, 'customer', '2018-12-05 10:36:17', NULL, 25900652404146292, 1, '3 3', '3', '3', 'Charge', '3@qq.com', '3', '3');
INSERT INTO `oa_customer_user` VALUES (25900652404146300, 'customer', '2018-12-05 14:47:43', NULL, 25900652404146299, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25900652404146301, 'customer', '2018-12-05 14:47:43', NULL, 25900652404146299, 1, '2 2', '2', '2', 'Financial', '22@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25900652404146302, 'customer', '2018-12-05 14:47:43', NULL, 25900652404146299, 1, '333 3', '333', '3', 'Charge', '3@qq.com', '3', '3');
INSERT INTO `oa_customer_user` VALUES (25905017735086119, 'customer', '2018-12-07 12:04:41', NULL, 25905017735086118, 1, '1 1', '1', '1', 'Enterprise', '3@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25915147281236051, 'customer', '2018-12-14 14:40:50', NULL, 25915147281236050, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25915147281236052, 'customer', '2018-12-14 14:40:50', NULL, 25915147281236050, 1, '2 2', '2', '2', 'Financial', '2@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25915147281236053, 'customer', '2018-12-14 14:40:50', NULL, 25915147281236050, 1, '张 小龙', '张', '小龙', 'Charge', 'xiaolong@qq.com', '119', 'CTO');
INSERT INTO `oa_customer_user` VALUES (25915147281236054, 'customer', '2018-12-14 14:40:50', NULL, 25915147281236050, 1, '陈 一丹', '陈', '一丹', 'Charge', 'yidan@qq.com', '12306', 'CMO');
INSERT INTO `oa_customer_user` VALUES (25915147281236061, 'customer', '2018-12-14 16:30:10', NULL, 25915147281236060, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (25915147281236062, 'customer', '2018-12-14 16:30:10', NULL, 25915147281236060, 1, '2 2', '2', '2', 'Financial', '2@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25915147281236063, 'customer', '2018-12-14 16:30:10', NULL, 25915147281236060, 1, '陈 一丹', '陈', '一丹', 'Charge', 'yidan@qq.com', '119', 'CMO');
INSERT INTO `oa_customer_user` VALUES (25915147281236064, 'customer', '2018-12-14 16:30:10', NULL, 25915147281236060, 1, '张 小龙', '张', '小龙', 'Charge', 'xiaolong@qq.com', '12306', 'CMO');
INSERT INTO `oa_customer_user` VALUES (25923863514710024, 'customer', '2018-12-19 16:03:01', NULL, 25923863514710023, 1, '3 2', '3', '2', 'Enterprise', '6@qq.com', '5', '4');
INSERT INTO `oa_customer_user` VALUES (25923863514710025, 'customer', '2018-12-19 16:03:01', NULL, 25923863514710023, -1, '2 2', '2', '2', 'Financial', '2@qq.com', '2', '2');
INSERT INTO `oa_customer_user` VALUES (25923863514710026, 'customer', '2018-12-19 16:03:01', NULL, 25923863514710023, 1, '3 3', '3', '3', 'Charge', '3@qq.com', '3', '3');
INSERT INTO `oa_customer_user` VALUES (25932559766519808, 'customer', '2018-12-25 16:29:28', NULL, 25733109320256715, 1, '李 一', '李', '一', 'Enterprise', 'ryan@victtech.com', '5319468525', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519809, 'customer', '2018-12-25 16:29:28', NULL, 25733109320256715, 1, '李 四', '李', '四', 'Enterprise', 'ryan@larrweb.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519810, 'customer', '2018-12-25 16:29:28', NULL, 25733109320256715, 1, '李 七', '李', '七', 'Enterprise', 'ryan@victtech.com', '5319468525', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519811, 'customer', '2018-12-25 16:29:28', NULL, 25733109320256715, 1, '李 十', '李', '十', 'Enterprise', 'ryan@larrweb.com', '13551590990', '科长');
INSERT INTO `oa_customer_user` VALUES (25932559766519812, 'customer', '2018-12-25 16:29:28', NULL, 25733109320256715, 1, '李 二', '李', '二', 'Financial', 'ryan@victtech.com', '5319468525', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519813, 'customer', '2018-12-25 16:29:28', NULL, 25733109320256715, 1, '李 五', '李', '五', 'Financial', 'ryan@victtech.com', '5319468525', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519814, 'customer', '2018-12-25 16:29:28', NULL, 25733109320256715, 1, '李 八', '李', '八', 'Financial', 'ryan@victtech.com', '5319468525', '科长');
INSERT INTO `oa_customer_user` VALUES (25932559766519815, 'customer', '2018-12-25 16:29:28', NULL, 25733109320256715, 1, '李 三', '李', '三', 'Charge', 'ryan@larrweb.com', '9999999999', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519816, 'customer', '2018-12-25 16:29:28', NULL, 25733109320256715, 1, '李 六', '李', '六', 'Charge', 'ryan@larrweb.com', '13551590990', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519817, 'customer', '2018-12-25 16:29:28', NULL, 25733109320256715, 1, '李 九', '李', '九', 'Charge', 'ryan@victtech.com', '5319468525', '科长');
INSERT INTO `oa_customer_user` VALUES (25932559766519818, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 一', '李', '一', 'Enterprise', 'ryan@victtech.com', '5319468525', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519819, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 四', '李', '四', 'Enterprise', 'ryan@larrweb.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519820, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 七', '李', '七', 'Enterprise', 'ryan@victtech.com', '5319468525', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519821, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 十', '李', '十', 'Enterprise', 'ryan@larrweb.com', '13551590990', '科长');
INSERT INTO `oa_customer_user` VALUES (25932559766519822, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 一', '李', '一', 'Enterprise', 'ryan@victtech.com', '5319468525', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519823, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 四', '李', '四', 'Enterprise', 'ryan@larrweb.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519824, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 七', '李', '七', 'Enterprise', 'ryan@victtech.com', '5319468525', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519825, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 十', '李', '十', 'Enterprise', 'ryan@larrweb.com', '13551590990', '科长');
INSERT INTO `oa_customer_user` VALUES (25932559766519826, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 二', '李', '二', 'Financial', 'ryan@victtech.com', '5319468525', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519827, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 五', '李', '五', 'Financial', 'ryan@victtech.com', '5319468525', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519828, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 八', '李', '八', 'Financial', 'ryan@victtech.com', '5319468525', '科长');
INSERT INTO `oa_customer_user` VALUES (25932559766519829, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 二', '李', '二', 'Financial', 'ryan@victtech.com', '5319468525', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519830, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 五', '李', '五', 'Financial', 'ryan@victtech.com', '5319468525', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519831, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 八', '李', '八', 'Financial', 'ryan@victtech.com', '5319468525', '科长');
INSERT INTO `oa_customer_user` VALUES (25932559766519832, 'customer', '2018-12-25 16:30:19', NULL, 25733109320256715, 1, '李 三', '李', '三', 'Charge', 'ryan@larrweb.com', '9999999999', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519833, 'customer', '2018-12-25 16:30:20', NULL, 25733109320256715, 1, '李 六', '李', '六', 'Charge', 'ryan@larrweb.com', '13551590990', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519834, 'customer', '2018-12-25 16:30:20', NULL, 25733109320256715, 1, '李 九', '李', '九', 'Charge', 'ryan@victtech.com', '5319468525', '科长');
INSERT INTO `oa_customer_user` VALUES (25932559766519835, 'customer', '2018-12-25 16:30:20', NULL, 25733109320256715, 1, '李 三', '李', '三', 'Charge', 'ryan@larrweb.com', '9999999999', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519836, 'customer', '2018-12-25 16:30:20', NULL, 25733109320256715, 1, '李 六', '李', '六', 'Charge', 'ryan@larrweb.com', '13551590990', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519837, 'customer', '2018-12-25 16:30:20', NULL, 25733109320256715, 1, '李 九', '李', '九', 'Charge', 'ryan@victtech.com', '5319468525', '科长');
INSERT INTO `oa_customer_user` VALUES (25932559766519838, 'customer', '2018-12-25 16:43:21', NULL, 25733109320256506, 1, '试用户 测', '试用户', '测', 'Enterprise', 'ryan@larrweb.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519839, 'customer', '2018-12-25 16:43:21', NULL, 25733109320256506, 1, '修 改', '修', '改', 'Enterprise', 'ryan@larrweb.com', '13551590990', '经理');
INSERT INTO `oa_customer_user` VALUES (25932559766519840, 'customer', '2018-12-25 16:43:21', NULL, 25733109320256506, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@larrweb.com', '13551590990', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519841, 'customer', '2018-12-25 16:43:21', NULL, 25733109320256506, 1, '100 Yan', '100', 'Yan', 'Financial', 'ryan@larrweb.com', '9999999999', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519842, 'customer', '2018-12-25 16:43:21', NULL, 25733109320256506, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519843, 'customer', '2018-12-25 16:43:21', NULL, 25733109320256506, 1, '王 五', '王', '五', 'Charge', 'ryan@victtech.com', '5319468525', '主任11');
INSERT INTO `oa_customer_user` VALUES (25932559766519844, 'customer', '2018-12-25 16:43:44', NULL, 25733109320256403, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', '1');
INSERT INTO `oa_customer_user` VALUES (25932559766519845, 'customer', '2018-12-25 16:43:45', NULL, 25733109320256403, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@victtech.com', '13551590990', '2');
INSERT INTO `oa_customer_user` VALUES (25932559766519846, 'customer', '2018-12-25 16:43:45', NULL, 25733109320256403, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '4');
INSERT INTO `oa_customer_user` VALUES (25932559766519847, 'customer', '2018-12-25 16:48:18', NULL, 25733109320256403, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', '1');
INSERT INTO `oa_customer_user` VALUES (25932559766519848, 'customer', '2018-12-25 16:48:18', NULL, 25733109320256403, 1, 'testF testL', 'testF', 'testL', 'Enterprise', 'ryan@larrweb.com', '9999999999', '1');
INSERT INTO `oa_customer_user` VALUES (25932559766519849, 'customer', '2018-12-25 16:48:18', NULL, 25733109320256403, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@victtech.com', '13551590990', '2');
INSERT INTO `oa_customer_user` VALUES (25932559766519850, 'customer', '2018-12-25 16:48:18', NULL, 25733109320256403, 1, '试用户 测', '试用户', '测', 'Financial', 'ryan@victtech.com', '13551590990', '2');
INSERT INTO `oa_customer_user` VALUES (25932559766519851, 'customer', '2018-12-25 16:48:18', NULL, 25733109320256403, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '4');
INSERT INTO `oa_customer_user` VALUES (25932559766519852, 'customer', '2018-12-25 16:48:18', NULL, 25733109320256403, 1, 'Richard Yan', 'Richard', 'Yan', 'Charge', 'ryan@victtech.com', '5319468525', '4');
INSERT INTO `oa_customer_user` VALUES (25932559766519853, 'customer', '2018-12-26 11:16:05', NULL, 25923863514710023, 1, '1 1', '1', '1', 'Enterprise', '1@qq.com', '1', '1');
INSERT INTO `oa_customer_user` VALUES (98019142233227631, 'customer', '2019-01-14 15:04:25', NULL, 98019142233227630, 1, '刘 名', '刘', '名', 'Enterprise', '994233@qq.com', '18588209302', '工程师');
INSERT INTO `oa_customer_user` VALUES (98019142233227632, 'customer', '2019-01-14 15:04:25', NULL, 98019142233227630, 1, 'fas dsdfd', 'fas', 'dsdfd', 'Financial', '839432@qq.com', '18588209039', 'fdsf');
INSERT INTO `oa_customer_user` VALUES (98019142233227633, 'customer', '2019-01-14 15:04:25', NULL, 98019142233227630, 1, 'ewrew rwerw', 'ewrew', 'rwerw', 'Charge', '3243242@qq.com', '18690980918', 're');
INSERT INTO `oa_customer_user` VALUES (98019142233227650, 'customer', '2019-01-17 14:37:15', NULL, 98019142233227649, 1, '刘 名', '刘', '名', 'Enterprise', '994233@qq.com', '18588209302', '工程师');
INSERT INTO `oa_customer_user` VALUES (98019142233227651, 'customer', '2019-01-17 14:37:15', NULL, 98019142233227649, 1, 'fas dsdfd', 'fas', 'dsdfd', 'Financial', '839432@qq.com', '18588209039', 'fdsf');
INSERT INTO `oa_customer_user` VALUES (98019142233227652, 'customer', '2019-01-17 14:37:15', NULL, 98019142233227649, 1, 'ewrew rwerw', 'ewrew', 'rwerw', 'Charge', '3243242@qq.com', '18690980918', 're');
INSERT INTO `oa_customer_user` VALUES (98019142233227655, 'customer', '2019-01-17 14:37:38', NULL, 98019142233227654, 1, '刘 名', '刘', '名', 'Enterprise', '994233@qq.com', '18588209302', '工程师');
INSERT INTO `oa_customer_user` VALUES (98019142233227656, 'customer', '2019-01-17 14:37:38', NULL, 98019142233227654, 1, 'fas dsdfd', 'fas', 'dsdfd', 'Financial', '839432@qq.com', '18588209039', 'fdsf');
INSERT INTO `oa_customer_user` VALUES (98019142233227657, 'customer', '2019-01-17 14:37:38', NULL, 98019142233227654, 1, 'ewrew rwerw', 'ewrew', 'rwerw', 'Charge', '3243242@qq.com', '18690980918', 're');
INSERT INTO `oa_customer_user` VALUES (98019142233227660, 'customer', '2019-01-17 14:43:13', NULL, 98019142233227659, 1, '刘 名', '刘', '名', 'Enterprise', '994233@qq.com', '18588209302', '工程师');
INSERT INTO `oa_customer_user` VALUES (98019142233227661, 'customer', '2019-01-17 14:43:13', NULL, 98019142233227659, 1, 'fas dsdfd', 'fas', 'dsdfd', 'Financial', '839432@qq.com', '18588209039', 'fdsf');
INSERT INTO `oa_customer_user` VALUES (98019142233227662, 'customer', '2019-01-17 14:43:13', NULL, 98019142233227659, 1, 'ewrew rwerw', 'ewrew', 'rwerw', 'Charge', '3243242@qq.com', '18690980918', 're');
INSERT INTO `oa_customer_user` VALUES (98019142233227665, 'customer', '2019-01-17 14:45:55', NULL, 98019142233227664, 1, '刘 名', '刘', '名', 'Enterprise', '994233@qq.com', '18588209302', '工程师');
INSERT INTO `oa_customer_user` VALUES (98019142233227666, 'customer', '2019-01-17 14:45:55', NULL, 98019142233227664, 1, 'fas dsdfd', 'fas', 'dsdfd', 'Financial', '839432@qq.com', '18588209039', 'fdsf');
INSERT INTO `oa_customer_user` VALUES (98019142233227667, 'customer', '2019-01-17 14:45:55', NULL, 98019142233227664, 1, 'ewrew rwerw', 'ewrew', 'rwerw', 'Charge', '3243242@qq.com', '18690980918', 're');
INSERT INTO `oa_customer_user` VALUES (98019142233227670, 'customer', '2019-01-17 15:42:20', NULL, 98019142233227669, 1, '刘 名', '刘', '名', 'Enterprise', '994233@qq.com', '18588209302', '工程师');
INSERT INTO `oa_customer_user` VALUES (98019142233227671, 'customer', '2019-01-17 15:42:20', NULL, 98019142233227669, 1, 'fas dsdfd', 'fas', 'dsdfd', 'Financial', '839432@qq.com', '18588209039', 'fdsf');
INSERT INTO `oa_customer_user` VALUES (98019142233227672, 'customer', '2019-01-17 15:42:20', NULL, 98019142233227669, 1, 'ewrew rwerw', 'ewrew', 'rwerw', 'Charge', '3243242@qq.com', '18690980918', 're');
INSERT INTO `oa_customer_user` VALUES (98019142233227675, 'customer', '2019-01-17 15:57:59', NULL, 98019142233227674, 1, '刘 名', '刘', '名', 'Enterprise', '994233@qq.com', '18588209302', '工程师');
INSERT INTO `oa_customer_user` VALUES (98019142233227676, 'customer', '2019-01-17 15:57:59', NULL, 98019142233227674, 1, 'fas dsdfd', 'fas', 'dsdfd', 'Financial', '839432@qq.com', '18588209039', 'fdsf');
INSERT INTO `oa_customer_user` VALUES (98019142233227677, 'customer', '2019-01-17 15:57:59', NULL, 98019142233227674, 1, 'ewrew rwerw', 'ewrew', 'rwerw', 'Charge', '3243242@qq.com', '18690980918', 're');
INSERT INTO `oa_customer_user` VALUES (98019142233227680, 'customer', '2019-01-17 16:05:55', NULL, 98019142233227679, 1, '刘 名', '刘', '名', 'Enterprise', '994233@qq.com', '18588209302', '工程师');
INSERT INTO `oa_customer_user` VALUES (98019142233227681, 'customer', '2019-01-17 16:05:55', NULL, 98019142233227679, 1, 'fas dsdfd', 'fas', 'dsdfd', 'Financial', '839432@qq.com', '18588209039', 'fdsf');
INSERT INTO `oa_customer_user` VALUES (98019142233227682, 'customer', '2019-01-17 16:05:55', NULL, 98019142233227679, 1, 'ewrew rwerw', 'ewrew', 'rwerw', 'Charge', '3243242@qq.com', '18690980918', 're');
INSERT INTO `oa_customer_user` VALUES (98019142233227685, 'customer', '2019-01-17 16:08:07', NULL, 98019142233227684, 1, '刘 名', '刘', '名', 'Enterprise', '994233@qq.com', '18588209302', '工程师');
INSERT INTO `oa_customer_user` VALUES (98019142233227686, 'customer', '2019-01-17 16:08:07', NULL, 98019142233227684, 1, 'fas dsdfd', 'fas', 'dsdfd', 'Financial', '839432@qq.com', '18588209039', 'fdsf');
INSERT INTO `oa_customer_user` VALUES (98019142233227687, 'customer', '2019-01-17 16:08:07', NULL, 98019142233227684, 1, 'ewrew rwerw', 'ewrew', 'rwerw', 'Charge', '3243242@qq.com', '18690980918', 're');
INSERT INTO `oa_customer_user` VALUES (98019142233227690, 'customer', '2019-01-17 16:16:02', NULL, 98019142233227689, 1, '刘 名', '刘', '名', 'Enterprise', '994233@qq.com', '18588209302', '工程师');
INSERT INTO `oa_customer_user` VALUES (98019142233227691, 'customer', '2019-01-17 16:16:02', NULL, 98019142233227689, 1, 'fas dsdfd', 'fas', 'dsdfd', 'Financial', '839432@qq.com', '18588209039', 'fdsf');
INSERT INTO `oa_customer_user` VALUES (98019142233227692, 'customer', '2019-01-17 16:16:02', NULL, 98019142233227689, 1, 'ewrew rwerw', 'ewrew', 'rwerw', 'Charge', '3243242@qq.com', '18690980918', 're');
INSERT INTO `oa_customer_user` VALUES (98019142233227707, 'customer', '2019-01-17 17:21:44', NULL, 98019142233227706, 1, '张 用', '张', '用', 'Enterprise', '11@qq.com', '13682356682', '工程师');
INSERT INTO `oa_customer_user` VALUES (98019142233227710, 'customer', '2019-01-17 17:24:20', NULL, 98019142233227709, 1, '张 用', '张', '用', 'Enterprise', '11@qq.com', '13682356682', '工程师');
INSERT INTO `oa_customer_user` VALUES (98019142233227713, 'customer', '2019-01-17 18:16:39', NULL, 98019142233227712, 1, '白 起', '白', '起', 'Charge', '145@qq.com', '13423232323', '服务员');
INSERT INTO `oa_customer_user` VALUES (98019142233227738, 'customer', '2019-01-18 14:27:54', NULL, 98019142233227737, 1, '张 无', '张', '无', 'Charge', '12345@163.com', '13682356682', '保姆');
INSERT INTO `oa_customer_user` VALUES (98019142233227742, 'customer', '2019-01-18 14:53:34', NULL, 98019142233227741, 1, '陈 三', '陈', '三', 'Charge', '4511@164.com', '14513131313131', '设计师');
INSERT INTO `oa_customer_user` VALUES (98019142233227746, 'customer', '2019-01-18 14:58:00', NULL, 98019142233227745, 1, '李 四', '李', '四', 'Charge', '15151@163.com', '13414141414234', '设计师');
INSERT INTO `oa_customer_user` VALUES (98019142233227750, 'customer', '2019-01-18 15:04:43', NULL, 98019142233227749, 1, '白 起', '白', '起', 'Charge', '14512@163.com', '15323234545132', '设计师');
INSERT INTO `oa_customer_user` VALUES (98019142233227754, 'customer', '2019-01-18 15:19:00', NULL, 98019142233227753, 1, '王 中', '王', '中', 'Charge', '1514@163.com', '14124323123', '保镖');
INSERT INTO `oa_customer_user` VALUES (98019142233227758, 'customer', '2019-01-18 15:22:09', NULL, 98019142233227757, 1, '胡 喜洋', '胡', '喜洋', 'Charge', '178112@163.com', '13465657676', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227762, 'customer', '2019-01-18 15:32:05', NULL, 98019142233227761, 1, '记 录', '记', '录', 'Charge', 'a231@qq.com', '13456768987', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227767, 'customer', '2019-01-18 15:36:32', NULL, 98019142233227766, 1, '青 山', '青', '山', 'Charge', '123124@163.com', '12345678912', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227772, 'customer', '2019-01-18 15:46:29', NULL, 98019142233227771, 1, '张 永', '张', '永', 'Charge', '1231312@163.com', '12312323123', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227776, 'customer', '2019-01-18 15:50:44', NULL, 98019142233227775, 1, '张 三', '张', '三', 'Charge', '21314@163.com', '13682356682', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227780, 'customer', '2019-01-18 15:55:47', NULL, 98019142233227779, 1, '吴 海', '吴', '海', 'Charge', '132@163.com', '13457568989', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227784, 'customer', '2019-01-18 16:00:31', NULL, 98019142233227783, 1, '前 中', '前', '中', 'Charge', '1az@163.com', '13682356689', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227794, 'customer', '2019-01-18 16:22:11', NULL, 98019142233227793, 1, '白 吴', '白', '吴', 'Charge', '524321@163.com', '13682356682', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227798, 'customer', '2019-01-18 16:34:02', NULL, 98019142233227797, 1, '易 中', '易', '中', 'Charge', 'qwq123@163.com', '12346666232', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227803, 'customer', '2019-01-18 17:09:07', NULL, 98019142233227802, 1, '开 封', '开', '封', 'Charge', '123@163.com', '13682356682', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227806, 'customer', '2019-01-18 17:11:49', NULL, 98019142233227805, 1, '前 三', '前', '三', 'Charge', '14131@163.com', '13682366623', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227810, 'customer', '2019-01-18 17:18:18', NULL, 98019142233227809, 1, '吴 用', '吴', '用', 'Charge', '1qw@163.com', '13482556767', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227814, 'customer', '2019-01-18 17:25:05', NULL, 98019142233227813, 1, '你 好', '你', '好', 'Charge', '12413@163.com', '13777772222', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227818, 'customer', '2019-01-18 17:28:31', NULL, 98019142233227817, 1, '无 机', '无', '机', 'Charge', 'hhj@163.com', '15556789876', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227825, 'customer', '2019-01-18 17:37:24', NULL, 98019142233227824, 1, '4 5', '4', '5', 'Charge', '123@163.com', '1234423421', '总经理');
INSERT INTO `oa_customer_user` VALUES (98019142233227830, 'customer', '2019-01-18 17:42:40', NULL, 98019142233227829, 1, '3 3', '3', '3', 'Charge', '4', '3', '3');
INSERT INTO `oa_customer_user` VALUES (98019142233227834, 'customer', '2019-01-18 17:47:48', NULL, 98019142233227833, 1, '2 2', '2', '2', 'Charge', '5@11.com', '4', '3');
INSERT INTO `oa_customer_user` VALUES (98019142233227839, 'customer', '2019-01-18 17:51:40', NULL, 98019142233227838, 1, '12312 4341', '12312', '4341', 'Charge', '11@qq.com', '4332131', '2312');
INSERT INTO `oa_customer_user` VALUES (98019142233227844, 'customer', '2019-01-18 17:59:49', NULL, 98019142233227843, 1, '41231 2131', '41231', '2131', 'Charge', '31231', '4352', '2321');
INSERT INTO `oa_customer_user` VALUES (98019142233227849, 'customer', '2019-01-18 18:07:41', NULL, 98019142233227848, 1, '张 机', '张', '机', 'Charge', '111@qq.com', '231313', '31231');
INSERT INTO `oa_customer_user` VALUES (98019142233227855, 'customer', '2019-01-18 18:23:07', NULL, 98019142233227854, 1, '2312 2313', '2312', '2313', 'Charge', '2321', '22', '22');
INSERT INTO `oa_customer_user` VALUES (98019142233227859, 'customer', '2019-01-18 18:24:23', NULL, 98019142233227858, 1, '2312 2313', '2312', '2313', 'Charge', '2321', '22', '22');
INSERT INTO `oa_customer_user` VALUES (98019142233227860, 'customer', '2019-01-18 18:24:23', NULL, 98019142233227858, 1, '1 123123', '1', '123123', 'Charge', '312231', '12312', '31231');
INSERT INTO `oa_customer_user` VALUES (98019142233227863, 'customer', '2019-01-18 18:25:23', NULL, 98019142233227862, 1, '231 3123', '231', '3123', 'Charge', '23123', '231231', '31231');
INSERT INTO `oa_customer_user` VALUES (98019142233227867, 'customer', '2019-01-18 18:27:12', NULL, 98019142233227866, 1, '312321 32', '312321', '32', 'Charge', '231321', '23123', '212');
INSERT INTO `oa_customer_user` VALUES (98019142233227870, 'customer', '2019-01-18 18:28:39', NULL, 98019142233227869, 1, '534 12312', '534', '12312', 'Charge', '3231', '242', '232');
INSERT INTO `oa_customer_user` VALUES (98019142233227875, 'customer', '2019-01-18 18:33:05', NULL, 98019142233227874, 1, '2312 321313', '2312', '321313', 'Charge', '313', '312', '312');
INSERT INTO `oa_customer_user` VALUES (98019142233227882, 'customer', '2019-01-18 18:37:53', NULL, 98019142233227881, 1, '23123 1231', '23123', '1231', 'Charge', '1231', '12313', '3123');
INSERT INTO `oa_customer_user` VALUES (98029314963931137, 'customer', '2019-01-22 14:15:57', NULL, 98029314963931136, 1, '张 三', '张', '三', 'Charge', 'qiqi@163.com', '26558433', '总经理');
INSERT INTO `oa_customer_user` VALUES (98029314963931142, 'customer', '2019-01-22 14:52:27', NULL, 98029314963931141, 1, '张 四', '张', '四', 'Charge', 'nini@163.com', '13682356682', '总经理');
INSERT INTO `oa_customer_user` VALUES (98029314963931147, 'customer', '2019-01-22 15:19:03', NULL, 98029314963931146, 1, '李 五', '李', '五', 'Charge', 'aiai@163.com', '2313131', '总经理');

-- ----------------------------
-- Table structure for oa_group_extend_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_group_extend_info`;
CREATE TABLE `oa_group_extend_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '集团扩展信息记录的自增id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集团扩展信息的随机编码',
  `group_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '集团的唯一编码',
  `subdomain` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '二级域名',
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户使用的logo图',
  `group_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '授予集团的域名邮箱',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '用户是否有效:1为有效,0为无效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE COMMENT '关联外部的索引'
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '集团扩展信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_group_extend_info
-- ----------------------------
INSERT INTO `oa_group_extend_info` VALUES (1, 'ex_1548311813', 'jt_1548139507', 'newapi.master.com', '1', 'email.liuliny.com', 'admin', '2019-01-24 14:36:53', 1);

-- ----------------------------
-- Table structure for oa_group_finance_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_group_finance_info`;
CREATE TABLE `oa_group_finance_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '集团资金信息记录的自增id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资金信息的随机编码',
  `group_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '集团的唯一编码',
  `sale_volume_id` int(11) NULL DEFAULT NULL COMMENT '年销售额范围ID',
  `sale_volume` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年销售额',
  `purhchase_volume_id` int(11) NULL DEFAULT NULL COMMENT '年采购额范围ID',
  `purhchase_volume` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年采购额',
  `cashflow_volume_id` int(11) NULL DEFAULT NULL COMMENT '资金流范围ID',
  `cashflow_volume` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资金流状况',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '用户是否有效:1为有效,0为无效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE COMMENT '关联外部的索引'
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '集团资金相关信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_group_finance_info
-- ----------------------------
INSERT INTO `oa_group_finance_info` VALUES (1, 'cash_15483096291974', 'jt_1548139507', 1, '10001', 2, '20002', 3, '30003', 'admin', '2019-01-24 14:00:29', 0);
INSERT INTO `oa_group_finance_info` VALUES (2, 'f_98029314963931224', 'jt_98029314963931221', 1, '10000', 1, '20000', 1, '30000', 'admin', '2019-01-24 17:07:00', 1);
INSERT INTO `oa_group_finance_info` VALUES (3, 'f_98029314963931227', 'jt_98029314963931225', 1, '10000', 1, '20000', 1, '30000', 'admin', '2019-01-24 17:26:32', 1);
INSERT INTO `oa_group_finance_info` VALUES (4, 'f_98029314963931228', 'jt_98029314963931213', 1, '10000', 2, '20000', 3, '30000', 'admin', '2019-01-24 17:31:55', 1);
INSERT INTO `oa_group_finance_info` VALUES (5, 'f_98029314963931231', 'jt_98029314963931229', 1, '10000', 1, '20000', 1, '30000', 'admin', '2019-01-24 17:34:56', 1);
INSERT INTO `oa_group_finance_info` VALUES (6, 'f_98029314963931234', 'jt_98029314963931232', 1, '10000', 1, '20000', 1, '30000', 'admin', '2019-01-24 17:40:16', 1);
INSERT INTO `oa_group_finance_info` VALUES (7, 'f_98029314963931239', 'jt_98029314963931237', 1, '10000', 1, '20000', 1, '30000', 'admin', '2019-01-24 17:58:12', 1);
INSERT INTO `oa_group_finance_info` VALUES (8, 'f_98029314963931243', 'jt_98029314963931241', 1, '123456', 1, '234567', 1, '345678', 'admin', '2019-01-24 18:05:54', 1);
INSERT INTO `oa_group_finance_info` VALUES (9, 'f_98029314963931248', 'jt_98029314963931246', 1, '111111', 1, '222222', 1, '333333', 'admin', '2019-01-24 18:10:02', 1);

-- ----------------------------
-- Table structure for oa_group_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_group_info`;
CREATE TABLE `oa_group_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '集团记录自增id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集团的随机编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '集团名称',
  `web_site` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '集团网站',
  `group_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '集团编号',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '集团地址',
  `industry_id` int(11) NULL DEFAULT NULL COMMENT '所属行业(oa_base_industry表中行业的id)',
  `country_id` int(11) NULL DEFAULT NULL COMMENT '所属国家(oa_base_country表中的国家的id)',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '所属类型(oa_base_type表中企业类型的Id)',
  `contact_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 集团联系电话(总机)',
  `fiscal_month` tinyint(2) NULL DEFAULT NULL COMMENT '财年截至时间,只能保存 1~12，然后显示 *月底',
  `create_ime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '集团是否有效:1为有效,0为无效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE COMMENT '关联外部的索引'
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '集团基础信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_group_info
-- ----------------------------
INSERT INTO `oa_group_info` VALUES (1, 'jt_1548139507', '集团2', 'www.jt2.com', 'jituan013', '集团2的地址', 1, 2, 3, '18588209091', 4, '2019-01-22 14:45:07', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (2, 'jt_98029314963931152', '集团5', 'www.jt5.com', 'jituan005', '集团5的地址', 2, 3, 4, '18588209092', 5, '2019-01-22 15:55:16', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (3, 'jt_98029314963931153', '集团1', 'www.jt1.com', 'jituan001', '集团1的地址', 1, 2, 3, '18588209091', 4, '2019-01-22 16:01:16', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (4, 'jt_98029314963931154', '集团13', 'www.jt13.com', 'jituan013', '集团地址', 4, 3, 2, '18588209013', 1, '2019-01-22 17:13:31', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (5, 'jt_98029314963931171', '娃哈哈', 'www.wahaha.com', '7644', '广东深圳市龙岗区坂田街道办', 1, 3, 4, '86442890', 5, '2019-01-24 09:55:15', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (6, 'jt_98029314963931172', '娃哈哈', 'www.wahaha.com', '7878', '广东省深圳市龙岗区坂田街道办', 1, 44, 4, '0755-84332690', 1, '2019-01-24 10:14:12', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (7, 'jt_98029314963931173', '脉动', 'www.maidong.com', '9090', '深圳市南山区前海南新路口', 6, 44, 3, '0755-26447474', 11, '2019-01-24 14:02:44', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (8, 'jt_98029314963931174', '小米', 'www.xiaomi.com', '10029', '深圳市沙井大道', 12, 44, 5, '0755-26887575', 10, '2019-01-24 14:09:13', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (9, 'jt_98029314963931175', '爱疯', 'www.aifeng.com', '10212', '深圳市光明新区', 4, 44, 4, '0755-26998433', 12, '2019-01-24 14:13:05', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (10, 'jt_98029314963931176', '营养快线', 'www.happyline.com', '10112', '深圳市坂田街道办', 6, 44, 4, '0755-26774396', 10, '2019-01-24 14:20:28', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (11, 'jt_98029314963931177', '佳得乐', 'www.jiadele.com', '10321', '深圳罗湖', 6, 44, 4, '0755-26491122', 6, '2019-01-24 14:25:01', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (12, 'jt_98029314963931178', '可口可乐', 'www.kekoukele.com', '0909', '深圳福田', 6, 44, 4, '0755-26997321', 8, '2019-01-24 14:40:53', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (13, 'jt_98029314963931180', '芬达', 'www.fenda.com', '10990', '深圳福田', 6, 44, 4, '0755-26997422', 7, '2019-01-24 14:44:38', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (14, 'jt_98029314963931181', '美年达', 'www.meinianda.com', '10911', '深圳福田', 6, 44, 4, '0755-26887474', 5, '2019-01-24 14:48:01', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (15, 'jt_98029314963931182', '百事可乐', 'www.baishikele.com', '112233', '深圳福田', 6, 44, 4, '0755-84336690', 5, '2019-01-24 15:05:57', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (16, 'jt_98029314963931187', '华为', 'www.huawei.com', '10223', '深圳福田', 12, 44, 4, '0755-26997322', 6, '2019-01-24 15:15:26', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (17, 'jt_98029314963931191', '集团5', 'www.jt5.com', 'jituan005', '集团地址5', 1, 2, 3, '18588209095', 4, '2019-01-24 15:27:37', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (18, 'jt_98029314963931192', '绿箭', 'www.green.com', '27111', '深圳罗湖', 3, 4, 4, '0755-84337730', 6, '2019-01-24 15:28:26', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (19, 'jt_98029314963931194', '依依', 'www.yiyi.com', '1099', '深圳福田', 12, 44, 4, '0755-26771344', 5, '2019-01-24 15:32:12', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (20, 'jt_98029314963931196', '无敌', 'www.wudi.com', '10222', '深圳福田', 6, 44, 4, '0755-65448711', 6, '2019-01-24 15:59:36', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (21, 'jt_98029314963931198', '义乌九路', 'www.yiwu.com', '102234', '深圳福田', 1, 44, 4, '0755-29774412', 7, '2019-01-24 16:03:59', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (22, 'jt_98029314963931200', '齐天大圣', 'www.dasheng.com', '176622', '深圳福田', 6, 44, 4, '075584221788', 8, '2019-01-24 16:11:02', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (23, 'jt_98029314963931202', '青山', 'www.qingshan', '102256', '深圳福田', 1, 1, 4, '0755-28994513', 7, '2019-01-24 16:24:35', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (24, 'jt_98029314963931204', '影十三', 'www.shisan.com', '0911', '深圳福田', 1, 2, 4, '0755-16276623', 7, '2019-01-24 16:27:13', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (25, 'jt_98029314963931206', '血橙', 'www.xuecheng.com', '12331', '福田', 1, 1, 4, '0755-26559811', 4, '2019-01-24 16:46:11', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (26, 'jt_98029314963931208', '盛世美颜', 'www.meiyan.com', '13441', '深圳福田', 1, 1, 4, '07558722', 5, '2019-01-24 16:50:58', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (27, 'jt_98029314963931213', '横扫千军', 'www.qianjun.com', '12345', '深圳福田', 1, 1, 4, '0755-67112323', 7, '2019-01-24 16:53:49', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (28, 'jt_98029314963931221', '赫里卡姆', 'www.baidu.com', '145121', '深圳福田', 1, 2, 4, '0755-28777622', 6, '2019-01-24 17:01:09', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (29, 'jt_98029314963931225', '营销机构', 'www.yingxiao.com', '10223', '深圳福田', 1, 44, 4, '0755-23887621', 9, '2019-01-24 17:24:40', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (30, 'jt_98029314963931229', '网上银行', 'www.website.com', '10992', '福田', 4, 1, 4, '0755-26549898', 6, '2019-01-24 17:34:06', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (31, 'jt_98029314963931232', '冲浪', 'www.chonglang.com', '10223', '深圳福田', 1, 3, 4, '0755-26449812', 8, '2019-01-24 17:38:25', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (32, 'jt_98029314963931237', '乐视', 'www.leshi.com', '1022312', '深圳福田', 7, 44, 4, '0755-26732999', 6, '2019-01-24 17:57:32', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (33, 'jt_98029314963931241', '腾讯', 'www.qq.com', '1982211', '前海', 1, 44, 4, '0755-84332710', 8, '2019-01-24 18:05:08', 'admin', 1);
INSERT INTO `oa_group_info` VALUES (34, 'jt_98029314963931246', '阿里巴巴', 'www.alibaba.com', '19992323', '深圳福田', 4, 5, 2, '0755-26559191', 10, '2019-01-24 18:09:04', 'admin', 1);

-- ----------------------------
-- Table structure for oa_group_user_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_group_user_info`;
CREATE TABLE `oa_group_user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '联系人记录自增id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人随机编码',
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓氏',
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名字',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用来显示在业务数据的称呼(姓+名如张三)',
  `user_position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户职位',
  `user_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户联系电话',
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `is_enterprise` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否是企业负责人Enterprise',
  `is_financial` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否是财务负责人Financial',
  `is_charge` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否是清算负责人Charge',
  `group_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '集团的唯一编码',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '用户是否有效:1为有效,0为无效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE COMMENT '关联外部的索引'
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '集团联系人信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_group_user_info
-- ----------------------------
INSERT INTO `oa_group_user_info` VALUES (24, 'ct_1548383615', '刘', '林燕', '刘林燕', 'PHP研发', '18588209320', '939942478@qq.com', 0, 0, 1, 'jt_1548139507', 'admin', '2019-01-25 10:33:35', 0);
INSERT INTO `oa_group_user_info` VALUES (25, 'ct_98029314963931299', '王', '丽', '王丽', 'PHP研发', '18588209321', '123@qq.com', 1, 1, 1, 'jt_1548139507', 'admin', '2019-01-25 11:37:56', 1);
INSERT INTO `oa_group_user_info` VALUES (26, 'ct_98029314963931306', '李', '2', '李2', 'PHP研发', '18588209321', '125@qq.com', 1, 1, 1, 'jt_1548139507', 'admin', '2019-01-25 11:37:56', 1);

-- ----------------------------
-- Table structure for oa_market_authorized_book
-- ----------------------------
DROP TABLE IF EXISTS `oa_market_authorized_book`;
CREATE TABLE `oa_market_authorized_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权映射信息的随机编码',
  `market_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '市场的唯一编码',
  `book_set` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '买家财务系统账套标识编号，由实际客户提供该编号',
  `app_id` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分配给AUTH服务的唯一标记符，用于对方调用接口认证授权使用',
  `encrypt_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分配给 app_id 的加密私钥',
  `api_uri` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分配给 app_id 可访问的接口URI地址',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '授权状态; 1: 正常，已授权; 0:已取消授权(授权作废了)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE COMMENT '关联外部的索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '市场授权同步的财务账套信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_market_authorized_user
-- ----------------------------
DROP TABLE IF EXISTS `oa_market_authorized_user`;
CREATE TABLE `oa_market_authorized_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司市场信息记录的自增id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权映射信息的随机编码',
  `market_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '市场的唯一编码',
  `user_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '授权邮箱的用户编码',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '授权状态; 1: 正常，已授权; 0:已取消授权(授权作废了)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE COMMENT '关联外部的索引'
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '市场授权账号信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_market_authorized_user
-- ----------------------------
INSERT INTO `oa_market_authorized_user` VALUES (1, 'sq_15482320331838', 'mk_1548232033', '187@qq.com', 'admin', '2019-01-23 16:27:13', 1);
INSERT INTO `oa_market_authorized_user` VALUES (2, 'sq_15482320333662', 'mk_1548232033', '15@qq.com', 'admin', '2019-01-23 16:27:13', 0);
INSERT INTO `oa_market_authorized_user` VALUES (4, 'sq_98029314963931186', 'mk_98029314963931185', '15@qq.com', 'admin', '2019-01-24 15:12:41', 0);
INSERT INTO `oa_market_authorized_user` VALUES (5, 'sq_98029314963931190', 'mk_98029314963931185', '187@qq.com', 'admin', '2019-01-24 15:17:04', 0);

-- ----------------------------
-- Table structure for oa_market_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_market_info`;
CREATE TABLE `oa_market_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司市场信息记录的自增id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市场信息的随机编码',
  `group_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '集团的唯一编码',
  `company_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司的唯一编码',
  `market_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '市场名称',
  `currency_sign` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币别标识符',
  `currency_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币别名称',
  `sync_type` tinyint(1) NULL DEFAULT 0 COMMENT '数据同步更新方式：1为自动;0为手动；用于判断是否需要配置接口授权信息',
  `memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市场备注信息',
  `charge_user_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '清算负责人随机编码',
  `charge_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '清算负责人姓名',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `last_update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `last_update_time` timestamp(0) NOT NULL DEFAULT '2019-01-21 17:54:00' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '市场状态; 0: 正常，活跃\n1: 不活跃',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE COMMENT '关联外部的索引'
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '集团公司市场信息基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_market_info
-- ----------------------------
INSERT INTO `oa_market_info` VALUES (1, 'mk_1548232033', 'jt_1548139507', 'gs_1548153426', '第一个市场', '$', 'USD', 1, '1', 'ct_98029314963931168', '更新', 'admin', '2019-01-23 16:27:13', 'admin', '2019-01-24 09:14:59', 0);
INSERT INTO `oa_market_info` VALUES (2, 'mk_98029314963931185', 'jt_1548139507', 'gs_1548153426', '第一个市场', '$', 'USD', 1, '编辑的', 'ct_98029314963931168', '更新', 'admin', '2019-01-24 15:12:41', 'admin', '2019-01-24 15:22:31', 1);
INSERT INTO `oa_market_info` VALUES (3, 'mk_98029314963931245', 'jt_98029314963931241', 'gs_98029314963931244', '绝地求生刺激战场', '¥', 'RMB', 0, '模拟器', NULL, '', 'admin', '2019-01-24 18:06:43', 'admin', '2019-01-21 17:54:00', 0);
INSERT INTO `oa_market_info` VALUES (4, 'mk_98029314963931250', 'jt_98029314963931246', 'gs_98029314963931249', '青山不改', '¥', 'RMB', 0, '绿水长流', NULL, '', 'admin', '2019-01-24 18:10:31', 'admin', '2019-01-21 17:54:00', 0);

-- ----------------------------
-- Table structure for oa_system_config
-- ----------------------------
DROP TABLE IF EXISTS `oa_system_config`;
CREATE TABLE `oa_system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(50) DEFAULT '',
  `value` varchar(100) DEFAULT '' COMMENT '配置值',
  `group` tinyint(4) unsigned DEFAULT '0' COMMENT '配置分组',
  `need_auth` tinyint(4) DEFAULT '1' COMMENT '1需要登录后才能获取，0不需要登录即可获取',
  PRIMARY KEY (`id`),
  UNIQUE KEY `参数名` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='【配置】系统配置表';

-- ----------------------------
-- Records of oa_system_config
-- ----------------------------
INSERT INTO `oa_system_config` VALUES ('1', 'SYSTEM_NAME', 'VueThink通用后台登录', '0', '1');
INSERT INTO `oa_system_config` VALUES ('2', 'SYSTEM_LOGO', 'uploads\\20170219\\d9fe7b784e1b1f406234b7b301e627e8.png', '0', '1');
INSERT INTO `oa_system_config` VALUES ('3', 'LOGIN_SESSION_VALID', '1644', '0', '1');
INSERT INTO `oa_system_config` VALUES ('4', 'IDENTIFYING_CODE', '0', '0', '1');
