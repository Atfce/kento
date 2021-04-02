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

 Date: 02/04/2021 22:29:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flight_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '航班编号',
  `scheduled_departure` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '起飞时间',
  `scheduled_arrival` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '到达时间',
  `departure_city` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '起飞城市',
  `arrival_city` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目的城市',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '航班状态  售票  停止售票  检票  飞行中  完成  延误  取消',
  `aircraft` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '飞机型号',
  `seat_total` int(11) NOT NULL COMMENT '座位数',
  `seat_empty` int(11) NULL DEFAULT 0 COMMENT '剩下的座位数',
  `amount` decimal(11, 0) NOT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES (1, '1', '2021-04-02 20:43:36', '2021-04-29 20:43:38', '2', '3', '4', '5', 611, 67, 7);
INSERT INTO `flight` VALUES (2, 'fweqf', '2021-04-02 14:06:00', '2021-04-24 07:55:00', 'wq', '213', '售票中', '12few', 324, 0, 32);

SET FOREIGN_KEY_CHECKS = 1;
