/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 50649
 Source Host           : localhost:3306
 Source Schema         : ticket

 Target Server Type    : MySQL
 Target Server Version : 50649
 File Encoding         : 65001

 Date: 02/04/2021 18:24:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for province_info
-- ----------------------------
DROP TABLE IF EXISTS `province_info`;
CREATE TABLE `province_info`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of province_info
-- ----------------------------
INSERT INTO `province_info` VALUES (1, '北京市', '1');
INSERT INTO `province_info` VALUES (2, '天津市', '2');
INSERT INTO `province_info` VALUES (3, '上海市', '3');
INSERT INTO `province_info` VALUES (4, '重庆市', '4');
INSERT INTO `province_info` VALUES (5, '河北省', '5');
INSERT INTO `province_info` VALUES (6, '山西省', '6');
INSERT INTO `province_info` VALUES (7, '台湾省', '34');
INSERT INTO `province_info` VALUES (8, '辽宁省', '7');
INSERT INTO `province_info` VALUES (9, '吉林省', '8');
INSERT INTO `province_info` VALUES (10, '黑龙江省', '9');
INSERT INTO `province_info` VALUES (11, '江苏省', '10');
INSERT INTO `province_info` VALUES (12, '浙江省', '11');
INSERT INTO `province_info` VALUES (13, '安徽省', '12');
INSERT INTO `province_info` VALUES (14, '福建省', '13');
INSERT INTO `province_info` VALUES (15, '江西省', '14');
INSERT INTO `province_info` VALUES (16, '山东省', '15');
INSERT INTO `province_info` VALUES (17, '河南省', '16');
INSERT INTO `province_info` VALUES (18, '湖北省', '17');
INSERT INTO `province_info` VALUES (19, '湖南省', '18');
INSERT INTO `province_info` VALUES (20, '广东省', '19');
INSERT INTO `province_info` VALUES (21, '甘肃省', '20');
INSERT INTO `province_info` VALUES (22, '四川省', '21');
INSERT INTO `province_info` VALUES (23, '贵州省', '22');
INSERT INTO `province_info` VALUES (24, '海南省', '23');
INSERT INTO `province_info` VALUES (25, '云南省', '24');
INSERT INTO `province_info` VALUES (26, '青海省', '25');
INSERT INTO `province_info` VALUES (27, '陕西省', '26');
INSERT INTO `province_info` VALUES (28, '广西壮族自治区', '27');
INSERT INTO `province_info` VALUES (29, '西藏自治区', '28');
INSERT INTO `province_info` VALUES (30, '宁夏回族自治区', '29');
INSERT INTO `province_info` VALUES (31, '新疆维吾尔自治区', '30');
INSERT INTO `province_info` VALUES (32, '内蒙古自治区', '31');
INSERT INTO `province_info` VALUES (33, '澳门特别行政区', '32');
INSERT INTO `province_info` VALUES (34, '香港特别行政区', '33');

SET FOREIGN_KEY_CHECKS = 1;
