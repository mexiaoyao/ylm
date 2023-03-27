/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : ylm

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 21/03/2023 18:16:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_finance_intro
-- ----------------------------
DROP TABLE IF EXISTS `t_finance_intro`;
CREATE TABLE `t_finance_intro`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid32位',
  `index_type` tinyint(1) UNSIGNED NOT NULL COMMENT '类型[1:沪指SH,2:深指SZ]',
  `code_number` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '股票代码',
  `shares_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '股票名称',
  `shares_alise` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '股票别名',
  `shares_total_number` bigint(11) NULL DEFAULT NULL COMMENT '股票总股数',
  `shares_allow_total_number` bigint(11) NULL DEFAULT NULL COMMENT '可流动股票股数',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态[1:上线,2:下线]',
  `load_time` datetime NULL DEFAULT NULL COMMENT '最后更新',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_finance_intro
-- ----------------------------
INSERT INTO `t_finance_intro` VALUES ('51ce42bcb938abcee267ae5ce075ed10', 2, '002400', '省广集团', '广东省广告集团股份有限公司', 1743337128, 1687189081, 1, '2022-10-24 17:26:56', '2022-10-24 17:26:56', '2022-10-27 17:02:06', '品牌管理、媒介代理和自有媒体等');
INSERT INTO `t_finance_intro` VALUES ('8e4dce1946ec36b04260e2642154ca56', 1, '600518', '贵州茅台', '贵州茅台酒股份有限公司', 1256197800, 1256197800, 2, '2022-10-24 17:30:34', '2022-10-24 17:30:34', '2022-10-31 19:20:04', '贵州茅台酒系列产品的生产与销售,饮料、食品、包装材料的生产与');

-- ----------------------------
-- Table structure for t_finance_update
-- ----------------------------
DROP TABLE IF EXISTS `t_finance_update`;
CREATE TABLE `t_finance_update`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid32位',
  `shares_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '股票ID-对应t_finance_intro的id',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态[1:成功,2:失败]',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `fail_num` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_finance_update
-- ----------------------------
INSERT INTO `t_finance_update` VALUES ('1', '51ce42bcb938abcee267ae5ce075ed10', 1, '2022-10-24 17:49:45', '1', 0);
INSERT INTO `t_finance_update` VALUES ('10', '51ce42bcb938abcee267ae5ce075ed10', 1, '2022-10-25 17:49:45', '1', 0);
INSERT INTO `t_finance_update` VALUES ('11', '51ce42bcb938abcee267ae5ce075ed10', 1, '2022-10-24 17:49:45', '1', 0);
INSERT INTO `t_finance_update` VALUES ('12', '51ce42bcb938abcee267ae5ce075ed10', 1, '2022-10-24 17:49:45', '-', 0);
INSERT INTO `t_finance_update` VALUES ('13', '51ce42bcb938abcee267ae5ce075ed10', 1, '2022-10-24 17:49:45', '-', 0);
INSERT INTO `t_finance_update` VALUES ('14', '51ce42bcb938abcee267ae5ce075ed10', 1, '2022-10-25 17:49:45', '1', 0);
INSERT INTO `t_finance_update` VALUES ('15', '51ce42bcb938abcee267ae5ce075ed10', 1, '2022-10-25 17:49:45', '1', 0);
INSERT INTO `t_finance_update` VALUES ('2', '51ce42bcb938abcee267ae5ce075ed10', 2, '2022-10-24 17:49:45', '1', 0);
INSERT INTO `t_finance_update` VALUES ('3', '51ce42bcb938abcee267ae5ce075ed10', 2, '2022-10-24 17:49:45', '1', 0);
INSERT INTO `t_finance_update` VALUES ('4', '51ce42bcb938abcee267ae5ce075ed10', 1, '2022-10-25 17:49:45', '1', 0);
INSERT INTO `t_finance_update` VALUES ('5', '51ce42bcb938abcee267ae5ce075ed10', 1, '2022-10-25 17:49:45', '1', 0);
INSERT INTO `t_finance_update` VALUES ('6', '51ce42bcb938abcee267ae5ce075ed10', 1, '2022-10-24 17:49:45', '1', 0);
INSERT INTO `t_finance_update` VALUES ('7', '51ce42bcb938abcee267ae5ce075ed10', 2, '2022-10-24 17:49:45', '1', 0);
INSERT INTO `t_finance_update` VALUES ('8', '51ce42bcb938abcee267ae5ce075ed10', 2, '2022-10-24 17:49:45', '1', 0);
INSERT INTO `t_finance_update` VALUES ('9', '51ce42bcb938abcee267ae5ce075ed10', 2, '2022-10-26 17:49:45', '执行失败', 2);

-- ----------------------------
-- Table structure for t_grade_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_grade_dict`;
CREATE TABLE `t_grade_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '状态[1:考题类型,2:考题来源,3:所属年级]',
  `dict_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_grade_dict
-- ----------------------------
INSERT INTO `t_grade_dict` VALUES (1, 1, '语文', 0, '2022-12-08 21:49:54', '2022-12-08 21:49:54', 'admin');
INSERT INTO `t_grade_dict` VALUES (2, 1, '数学', 0, '2022-12-08 21:50:07', '2022-12-08 21:50:07', 'admin');
INSERT INTO `t_grade_dict` VALUES (3, 1, '英语', 0, '2022-12-08 21:50:25', '2022-12-08 21:50:25', 'admin');
INSERT INTO `t_grade_dict` VALUES (4, 2, '一年级', 0, '2022-12-08 21:50:38', '2022-12-08 21:50:38', 'admin');
INSERT INTO `t_grade_dict` VALUES (5, 2, '二年级', 0, '2022-12-08 21:50:44', '2022-12-08 21:50:44', 'admin');
INSERT INTO `t_grade_dict` VALUES (6, 2, '三年级', 0, '2022-12-08 21:50:50', '2022-12-08 21:50:50', 'admin');
INSERT INTO `t_grade_dict` VALUES (7, 2, '四年级', 0, '2022-12-08 21:50:56', '2022-12-08 21:50:56', 'admin');
INSERT INTO `t_grade_dict` VALUES (8, 2, '五年级', 0, '2022-12-08 21:51:03', '2022-12-08 21:51:03', 'admin');
INSERT INTO `t_grade_dict` VALUES (9, 3, '苏教版', 0, '2022-12-08 21:52:00', '2022-12-08 21:52:00', 'admin');
INSERT INTO `t_grade_dict` VALUES (10, 3, '人教版', 0, '2022-12-08 21:52:07', '2022-12-08 21:52:07', 'admin');
INSERT INTO `t_grade_dict` VALUES (11, 3, '江苏省沭阳县北丁集乡中心小学', 0, '2022-12-08 21:52:47', '2022-12-08 21:52:47', 'admin');
INSERT INTO `t_grade_dict` VALUES (12, 3, '一年级', 11, '2022-12-08 21:52:57', '2022-12-08 21:52:57', 'admin');
INSERT INTO `t_grade_dict` VALUES (13, 3, '二年级', 11, '2022-12-08 21:53:06', '2022-12-08 21:53:06', 'admin');
INSERT INTO `t_grade_dict` VALUES (14, 3, '三年级', 11, '2022-12-08 21:53:15', '2022-12-08 21:53:15', 'admin');
INSERT INTO `t_grade_dict` VALUES (15, 3, '四年级', 11, '2022-12-08 21:53:23', '2022-12-08 21:53:23', 'admin');
INSERT INTO `t_grade_dict` VALUES (16, 3, '期中考试', 15, '2022-12-08 21:53:52', '2022-12-08 21:53:52', 'admin');
INSERT INTO `t_grade_dict` VALUES (17, 3, '期末考试', 15, '2022-12-08 21:54:00', '2022-12-08 21:54:00', 'admin');
INSERT INTO `t_grade_dict` VALUES (18, 4, '填空题', 0, '2022-12-08 21:54:36', '2022-12-23 16:13:50', 'admin');
INSERT INTO `t_grade_dict` VALUES (19, 4, '看拼音写词语', 0, '2022-12-08 21:54:47', '2022-12-26 16:08:15', 'admin');
INSERT INTO `t_grade_dict` VALUES (20, 4, '三题', 0, '2022-12-08 21:55:00', '2022-12-08 21:55:00', 'admin');
INSERT INTO `t_grade_dict` VALUES (21, 4, '四题', 0, '2022-12-08 21:55:21', '2022-12-08 21:55:21', 'admin');
INSERT INTO `t_grade_dict` VALUES (22, 4, '五题', 0, '2022-12-08 21:55:33', '2022-12-08 21:55:33', 'admin');
INSERT INTO `t_grade_dict` VALUES (24, 3, '网络采集', 0, '2022-12-26 16:26:53', '2022-12-26 16:26:53', 'admin');

-- ----------------------------
-- Table structure for t_grade_question
-- ----------------------------
DROP TABLE IF EXISTS `t_grade_question`;
CREATE TABLE `t_grade_question`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid32位（年级ID）',
  `dict_task_path` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典ID-试卷种类，对应t_grade_dict的id，例如：0,1,3,t_grade_dict中id',
  `dict_task_path_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典ID-试卷种类，对应t_grade_dict的id，例如：0,1,3,t_grade_dict中id',
  `dict_grade_path` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典ID-答题年级，对应t_grade_dict的id，例如：0,1,3,t_grade_dict中id',
  `dict_grade_path_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典ID-答题年级，对应t_grade_dict的id，例如：0,1,3,t_grade_dict中id',
  `dict_source_path` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典ID-答题来源，对应t_grade_dict的id，例如：0,1,3,t_grade_dict中id',
  `dict_source_path_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典ID-答题来源，对应t_grade_dict的id，例如：0,1,3,t_grade_dict中id',
  `dict_type_path` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典ID-答题类型，对应t_grade_dict的id，例如：0,1,3,t_grade_dict中dict_name',
  `dict_type_path_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典ID-答题类型，对应t_grade_dict的id，例如：0,1,3,t_grade_dict中dict_name',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `question` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问题',
  `answers` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '答案',
  `answer_right` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正确答案',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '状态[1:根据拼音写汉字,2:看汉字写拼音]',
  `used_num` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000000 COMMENT '使用次数',
  `good_num` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000000 COMMENT '点赞数',
  `poor_num` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000000 COMMENT '踩数',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `share_num` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000000 COMMENT '分享次数',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `create_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_grade_question
-- ----------------------------
INSERT INTO `t_grade_question` VALUES ('0117830c2bd84b0bad327098ffd892c9', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, 'áng', '昂', '昂', 1, 00000000000, 00000000000, 00000000000, '2022-12-09 23:01:20', '2022-12-09 23:01:20', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('03edc16e6f6c44dd8da15cabefc314d9', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, 'yì', '屹', '屹', 1, 00000000000, 00000000000, 00000000000, '2022-12-09 23:01:20', '2022-12-09 23:01:20', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('1e9fe1ab583e446692f26706111ba55f', '1', '语文', '6', '三年级', '24', '网络采集', '19', '看拼音写词语', NULL, 'zhuī zhú', NULL, '追逐', 1, 00000000000, 00000000000, 00000000000, '2022-12-26 17:31:56', '2022-12-26 17:31:56', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('288fa19b0ab340cea81b68121c5dd1f0', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, '浩', 'hào', 'hào', 2, 00000000000, 00000000000, 00000000000, '2022-12-09 23:02:42', '2022-12-09 23:02:42', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('338cd1d9fa9c4da0bba388af2f4817af', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, '霎', 'shà', 'shà', 2, 00000000000, 00000000000, 00000000000, '2022-12-09 23:02:42', '2022-12-09 23:02:42', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('38ade71db0574a8bb1ddadbb43849557', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, 'zhèn', '震', '震', 1, 00000000000, 00000000000, 00000000000, '2022-12-09 23:01:20', '2022-12-09 23:01:20', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('5196e95e2f8c4c49a889ab50d5e32f2f', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, 'guàn', '贯', '贯', 1, 00000000000, 00000000000, 00000000000, '2022-12-09 23:01:20', '2022-12-09 23:01:20', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('539f9cf609244516b5ca0396efc36bea', '1', '语文', '6', '三年级', '24', '网络采集', '19', '看拼音写词语', NULL, 'piān pánɡ', NULL, '偏旁', 1, 00000000000, 00000000000, 00000000000, '2022-12-26 17:31:56', '2022-12-26 17:31:56', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('5475049e594f4bb58f10ffd2811a71e0', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, 'bó', '薄', '薄', 1, 00000000000, 00000000000, 00000000000, '2022-12-09 23:01:20', '2022-12-09 23:01:20', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('5905d541538649deabddcbcc9ab7b846', '1', '语文', '6', '三年级', '24', '网络采集', '19', '看拼音写词语', NULL, 'ɡùxi ānɡ', NULL, '故乡', 1, 00000000000, 00000000000, 00000000000, '2022-12-26 17:31:56', '2022-12-26 17:31:56', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('67e241905b1441f4aa7602fb9e64b6c0', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, 'fèi', '沸', '沸', 1, 00000000000, 00000000000, 00000000000, '2022-12-09 23:01:20', '2022-12-09 23:01:20', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('75245d80335c488088fd8fefe25293c0', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, '屹', 'yì', 'yì', 2, 00000000000, 00000000000, 00000000000, '2022-12-09 23:02:42', '2022-12-09 23:02:42', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('77d9fc90c8d4465ea37933b0e9c4e3e0', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, '鼎', 'dǐng', 'dǐng', 2, 00000000000, 00000000000, 00000000000, '2022-12-09 23:02:42', '2022-12-09 23:02:42', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('798205878e7343f9a41f723d644bb719', '1', '语文', '6', '三年级', '24', '网络采集', '19', '看拼音写词语', NULL, 'shén zhōu', NULL, '神州', 1, 00000000000, 00000000000, 00000000000, '2022-12-26 17:31:56', '2022-12-26 17:31:56', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('84a51f7a6c2f469b929099195d8cf321', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, '薄', 'bó', 'bó', 2, 00000000000, 00000000000, 00000000000, '2022-12-09 23:02:42', '2022-12-09 23:02:42', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('929b53aaf3134d2281fb42455630ee24', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, '余', 'yú', 'yú', 2, 00000000000, 00000000000, 00000000000, '2022-12-09 23:02:42', '2022-12-09 23:02:42', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('93d17f44cc3a4b3e84a5b0d241f66d51', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, 'dǐng', '鼎', '鼎', 1, 00000000000, 00000000000, 00000000000, '2022-12-09 23:01:20', '2022-12-09 23:01:20', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('9442adb89e5142dba0310cf104376478', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, '震', 'zhèn', 'zhèn', 2, 00000000000, 00000000000, 00000000000, '2022-12-09 23:02:42', '2022-12-09 23:02:42', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('9d5640a156044c93b0a2e5db609a833b', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, '沸', 'fèi', 'fèi', 2, 00000000000, 00000000000, 00000000000, '2022-12-09 23:02:42', '2022-12-09 23:02:42', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('9ec3a399228648a7a2f1a04f93b8efa2', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, '贯', 'guàn', 'guàn', 2, 00000000000, 00000000000, 00000000000, '2022-12-09 23:02:42', '2022-12-09 23:02:42', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('ad4d1e7936d6499e9c955c93396b945e', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, '昂', 'áng', 'áng', 2, 00000000000, 00000000000, 00000000000, '2022-12-09 23:02:42', '2022-12-09 23:02:42', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('afc4a6c2d9144cb889e3d06b1aed19b8', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, 'yán', '盐', '盐', 1, 00000000000, 00000000000, 00000000000, '2022-12-09 23:01:20', '2022-12-09 23:01:20', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('c508fab6cd6146ea89e5043084bca795', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, 'yú', '余', '余', 1, 00000000000, 00000000000, 00000000000, '2022-12-09 23:01:20', '2022-12-09 23:01:20', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('c9713e1e16824f3a8bfcd84035b718a1', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, '盐', 'yán', 'yán', 2, 00000000000, 00000000000, 00000000000, '2022-12-09 23:02:42', '2022-12-09 23:02:42', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('d1a307e2e3a049e7b331323c6ce70464', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, 'bēng', '崩', '崩', 1, 00000000000, 00000000000, 00000000000, '2022-12-09 23:01:20', '2022-12-09 23:01:20', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('e295a70f4eec45f18d60dba7767186dc', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, '崩', 'bēng', 'bēng', 2, 00000000000, 00000000000, 00000000000, '2022-12-09 23:02:42', '2022-12-09 23:02:42', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('e6e0241235e24763930819f59513b49e', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, 'shà', '霎', '霎', 1, 00000000000, 00000000000, 00000000000, '2022-12-09 23:01:20', '2022-12-09 23:01:20', 00000000000, NULL, 'admin', NULL);
INSERT INTO `t_grade_question` VALUES ('ea17e8f176f74cfcaecc1b72e7bd45a0', '1', '语文', '6', '三年级', '9,24,25', '苏教版/第一课/课外汉字', '18', '填空题', NULL, 'hào', '浩', '浩', 1, 00000000000, 00000000000, 00000000000, '2022-12-09 23:01:20', '2022-12-09 23:01:20', 00000000000, NULL, 'admin', NULL);

-- ----------------------------
-- Table structure for t_shares_002400_sz
-- ----------------------------
DROP TABLE IF EXISTS `t_shares_002400_sz`;
CREATE TABLE `t_shares_002400_sz`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid32位',
  `shares_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '股票id对应t_finance_intro的id',
  `shares_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '股票名字',
  `code_number` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '股票编码',
  `today_open_price` double(6, 2) NULL DEFAULT NULL COMMENT '今日开盘价',
  `yesterday_close_price` double(6, 2) NULL DEFAULT NULL COMMENT '昨日收盘价',
  `today_max_price` double(6, 2) NULL DEFAULT NULL COMMENT '今日最高价',
  `today_min_price` double(6, 2) NULL DEFAULT NULL COMMENT '今日最低价',
  `today_average_price` double(6, 2) NULL DEFAULT NULL COMMENT '今日平均价',
  `deal_amount` bigint(11) NULL DEFAULT NULL COMMENT '成交金额',
  `source` tinyint(1) UNSIGNED NOT NULL COMMENT '数据来源[1:定时器,2:导入,3:手动添加]',
  `shares_total_number` bigint(11) NULL DEFAULT NULL COMMENT '股票总数',
  `shares_allow_total_number` bigint(11) NULL DEFAULT NULL COMMENT '可流动股票总数',
  `deal_shares_number` bigint(11) NULL DEFAULT NULL COMMENT '成交的股票数',
  `shares_date` date NULL DEFAULT NULL COMMENT '记录时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_shares_002400_sz
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_permission`;
CREATE TABLE `t_sys_permission`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `parent_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_permission
-- ----------------------------
INSERT INTO `t_sys_permission` VALUES (1, '用户管理', 'menu', 'userInfo/userList', 'userInfo:view', 0, '0/', 0);
INSERT INTO `t_sys_permission` VALUES (2, '用户添加', 'button', 'userInfo/userAdd', 'userInfo:add', 1, '0/1', 0);
INSERT INTO `t_sys_permission` VALUES (3, '用户删除', 'button', 'userInfo/userDel', 'userInfo:del', 1, '0/1', 0);

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role`  (
  `id` int(11) NOT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES (1, 'admin', '管理员', 0);
INSERT INTO `t_sys_role` VALUES (2, 'vip', 'VIP会员', 0);
INSERT INTO `t_sys_role` VALUES (3, 'test', 'test', 1);

-- ----------------------------
-- Table structure for t_sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_permission`;
CREATE TABLE `t_sys_role_permission`  (
  `permission_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_role_permission
-- ----------------------------
INSERT INTO `t_sys_role_permission` VALUES (1, 1);
INSERT INTO `t_sys_role_permission` VALUES (1, 1);
INSERT INTO `t_sys_role_permission` VALUES (2, 1);
INSERT INTO `t_sys_role_permission` VALUES (3, 2);

-- ----------------------------
-- Table structure for t_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role`  (
  `role_id` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------
INSERT INTO `t_sys_user_role` VALUES (1, 1);

-- ----------------------------
-- Table structure for t_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info`  (
  `uid` int(32) NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` tinyint(1) NULL DEFAULT NULL,
  `roles` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` date NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `last_time` datetime NULL DEFAULT NULL,
  `parms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_info
-- ----------------------------
INSERT INTO `t_user_info` VALUES (1, 'admin', '管理员', '456', '8d78869f470951332959580424d4bf4f', 0, NULL, NULL, NULL, NULL, 'add,update');
INSERT INTO `t_user_info` VALUES (2, '测试员', '管理员', '123', '8d78869f470951332959580424d4bf4f', 0, NULL, NULL, NULL, NULL, 'update');

SET FOREIGN_KEY_CHECKS = 1;
