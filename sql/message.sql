/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ticket

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 05/04/2021 02:05:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reply` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(255) NOT NULL COMMENT '状态  未回复  已回复',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `reply_time` timestamp(0) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (5, '风热', NULL, 0, '2021-04-04 21:04:22', NULL, 4);
INSERT INTO `message` VALUES (6, '如为供热', NULL, 0, '2021-04-04 21:05:16', NULL, 4);
INSERT INTO `message` VALUES (7, '个人五个人日外国人为', 'test', 1, '2021-04-04 21:05:47', '2021-04-05 01:04:22', 4);
INSERT INTO `message` VALUES (8, '分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维分为高位二个人grewGREGRE企鹅物管费二维', NULL, 0, '2021-04-05 00:55:17', NULL, 4);

SET FOREIGN_KEY_CHECKS = 1;
