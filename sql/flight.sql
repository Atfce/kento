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

 Date: 03/04/2021 04:55:42
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
  `scheduled_departure` timestamp(0) NOT NULL COMMENT '起飞时间',
  `scheduled_arrival` timestamp(0) NOT NULL COMMENT '到达时间',
  `departure_city` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '起飞城市',
  `arrival_city` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目的城市',
  `aircraft` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '飞机型号',
  `seat_total` int(11) NOT NULL COMMENT '座位数',
  `seat_empty` int(11) NULL DEFAULT 0 COMMENT '剩下的座位数',
  `amount` decimal(11, 0) NOT NULL COMMENT '价格',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '航班状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES (42, 'etwtew', '2021-04-02 19:03:00', '2021-04-02 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 1);
INSERT INTO `flight` VALUES (43, 'etwtew', '2021-04-03 19:03:00', '2021-04-03 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (44, 'etwtew', '2021-04-04 19:03:00', '2021-04-04 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (45, 'etwtew', '2021-04-05 19:03:00', '2021-04-05 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (46, 'etwtew', '2021-04-06 19:03:00', '2021-04-06 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (47, 'etwtew', '2021-04-07 19:03:00', '2021-04-07 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (48, 'etwtew', '2021-04-08 19:03:00', '2021-04-08 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (49, 'etwtew', '2021-04-09 19:03:00', '2021-04-09 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (50, 'etwtew', '2021-04-10 19:03:00', '2021-04-10 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (51, 'etwtew', '2021-04-11 19:03:00', '2021-04-11 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (52, 'etwtew', '2021-04-12 19:03:00', '2021-04-12 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (53, 'etwtew', '2021-04-13 19:03:00', '2021-04-13 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (54, 'etwtew', '2021-04-14 19:03:00', '2021-04-14 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (55, 'etwtew', '2021-04-15 19:03:00', '2021-04-15 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (56, 'etwtew', '2021-04-16 19:03:00', '2021-04-16 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (57, 'etwtew', '2021-04-17 19:03:00', '2021-04-17 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (58, 'etwtew', '2021-04-18 19:03:00', '2021-04-18 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (59, 'etwtew', '2021-04-19 19:03:00', '2021-04-19 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (60, 'etwtew', '2021-04-20 19:03:00', '2021-04-20 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (61, 'etwtew', '2021-04-21 19:03:00', '2021-04-21 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (62, 'etwtew', '2021-04-22 19:03:00', '2021-04-22 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (63, 'etwtew', '2021-04-23 19:03:00', '2021-04-23 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (64, 'etwtew', '2021-04-24 19:03:00', '2021-04-24 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (65, 'etwtew', '2021-04-25 19:03:00', '2021-04-25 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (66, 'etwtew', '2021-04-26 19:03:00', '2021-04-26 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (67, 'etwtew', '2021-03-09 02:00:13', '2021-03-09 06:32:13', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (68, 'etwtew', '2021-03-10 02:00:13', '2021-03-10 06:32:13', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (69, 'etwtew', '2021-03-11 02:00:13', '2021-03-11 06:32:13', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (70, 'etwtew', '2021-03-12 02:00:13', '2021-03-12 06:32:13', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (71, 'etwtew', '2021-03-13 02:00:13', '2021-03-13 06:32:13', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (72, 'etwtew', '2021-03-14 02:00:13', '2021-03-14 06:32:13', '广州', '湛江', 'wetwe', 123, 123, 342, 0);
INSERT INTO `flight` VALUES (73, 'etwtew', '2021-04-02 19:03:00', '2021-04-02 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, -2);
INSERT INTO `flight` VALUES (74, 'etwtew', '2021-04-02 19:03:00', '2021-04-02 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 3);
INSERT INTO `flight` VALUES (75, 'etwtew', '2021-03-14 02:00:13', '2021-03-14 06:32:13', '广州', '湛江', 'wetwe', 123, 123, 342, 2);
INSERT INTO `flight` VALUES (76, 'etwtew', '2021-04-02 19:03:00', '2021-04-02 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 342, 2);
INSERT INTO `flight` VALUES (77, 'etwtew', '2021-04-02 19:03:00', '2021-04-02 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 456, 0);
INSERT INTO `flight` VALUES (78, 'etwtew', '2021-04-02 19:03:00', '2021-04-02 23:35:00', '广州', '湛江', 'wetwe', 123, 123, 999, 0);
INSERT INTO `flight` VALUES (79, '3454355', '2021-04-02 23:35:00', '2021-04-02 20:47:00', '435', '435', '43543', 345, 100, 34543, 0);

SET FOREIGN_KEY_CHECKS = 1;
