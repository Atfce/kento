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

 Date: 05/04/2021 02:05:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `pay_time` timestamp(0) NULL DEFAULT NULL COMMENT '订单支付时间',
  `finished_time` timestamp(0) NULL DEFAULT NULL COMMENT '订单完成时间',
  `status` tinyint(3) NOT NULL COMMENT '订单状态   待支付 已支付 已完成  已取消',
  `flight_id` int(11) NOT NULL COMMENT '航班id',
  `cost` decimal(10, 2) NOT NULL COMMENT '花费金额',
  `traveler_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_card` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('03fab1bdcfbdd942eb7a129a648fa522', '2021-04-04 20:20:46', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('4466ee2f941ef6b66d8e5cb81033c1a0', '2021-04-04 20:20:44', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('4bb93a211c52e273e9f9db518ea889a8', '2021-04-04 01:00:19', NULL, NULL, -1, 43, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('4d6d8c890deeccd43b1453de11b65902', '2021-04-04 01:45:56', NULL, NULL, -1, 82, 111.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('515bbd9a01e25af7ba389d6f652ed1f0', '2021-04-04 20:21:15', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('53f82023d26cfa61604b0eea368ec6d7', '2021-04-04 01:58:49', '2021-04-04 01:58:52', NULL, 1, 82, 111.00, '余海东HandsomeDong', '440881200002134631', '18814215402', 4);
INSERT INTO `ticket` VALUES ('5a40ed80f7e38d6a5cfa569a50c097b8', '2021-04-04 01:36:33', NULL, NULL, -1, 82, 111.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('65be74e1134389895129b15d8d80b0df', '2021-04-04 20:21:18', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('673838a5a10b7c5b96ca87039091b87e', '2021-04-04 20:20:53', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('67f5bc73bb5cd18144ec1bf5d55dd7c6', '2021-04-04 20:21:32', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('763e8f02612f1f563578c6b45ecbce66', '2021-04-04 01:18:19', NULL, NULL, -1, 43, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('77039cda0cb3d7d13a9fe07a30933d6b', '2021-04-04 20:20:51', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('8867f744173d9d5bc6f9eff26f0e1e9b', '2021-04-04 01:57:28', '2021-04-04 09:57:40', NULL, 1, 82, 111.00, '余海东HandsomeDong', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('903363b2d864908b610a98ce3c85cc71', '2021-04-04 00:58:53', '2021-04-03 16:58:53', NULL, 1, 43, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('9385c2c1e54a341abef83b4608520bd0', '2021-04-04 20:21:17', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('93fd7cc5e04bf8dc4495fefe093d2b5b', '2021-04-04 01:43:54', NULL, NULL, -1, 82, 111.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('993f0f4b0b9e2963db6006d127ca6969', '2021-04-04 20:20:39', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('99e71eaf2ceb6090032d1d59396292c2', '2021-04-04 16:43:59', NULL, NULL, -1, 82, 111.00, '帅比东11', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('9aef6a66008758b07b6e619e4e205878', '2021-04-04 20:21:06', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('9f9cc21bf83c969ad2973ca4c304f1a7', '2021-04-04 01:18:19', NULL, NULL, -1, 43, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('a61a7c54ec3d9bc3ce9cedc7ceeb46ec', '2021-04-04 20:20:49', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('aa7eb7a87c687e12958b1f90199a40df', '2021-04-03 17:20:47', '2021-04-04 01:20:50', NULL, 1, 60, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('ad153bf49df73fded286851dfe0ee9f3', '2021-04-04 20:21:08', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('b2b30694bb71a55805a08429ee7f5e7b', '2021-04-04 20:21:15', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('b9215d38ef13c6a4c9ed76cf53f52aad', '2021-04-04 01:18:19', NULL, NULL, -1, 43, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('bae5990cf3f14c891b2d3abf564ad98c', '2021-04-04 20:21:20', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('ce19c16a842828308566a11ed4d42afc', '2021-04-04 01:18:19', NULL, NULL, -1, 43, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('cf4d2c254a09eb4e3ca90a0d3e164856', '2021-04-03 17:28:40', '2021-04-03 17:28:43', NULL, 1, 81, 213.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('d1af366842a121521624f9bd38c42d93', '2021-04-03 17:32:48', NULL, NULL, -1, 81, 213.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('d3e237ee1af3f95ce4cf458944519bd6', '2021-04-04 20:21:29', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('d492af3874bd0ae3fdec0ee8c344f653', '2021-04-04 01:13:38', '2021-04-04 01:13:39', NULL, 1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('def947fe23df057999df9fd39a37ace3', '2021-04-04 01:08:37', '2021-04-03 17:07:24', NULL, 1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('fa63bde06279f6655afa7fe2e9e462dd', '2021-04-04 20:21:17', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('fc1808782bd36562ccd4f6410e0f5d80', '2021-04-04 20:21:20', NULL, NULL, -1, 44, 342.00, '余海东', '440881199702134631', '18814215401', 4);
INSERT INTO `ticket` VALUES ('fc7ab1eb0b7ff9fd3ae748411953cc89', '2021-04-04 01:00:19', NULL, NULL, 2, 43, 342.00, '余海东', '440881199702134631', '18814215401', 4);

SET FOREIGN_KEY_CHECKS = 1;