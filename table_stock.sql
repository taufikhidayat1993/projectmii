/*
 Navicat Premium Data Transfer

 Source Server         : Koneksi Localhost
 Source Server Type    : MySQL
 Source Server Version : 50141
 Source Host           : localhost:3306
 Source Schema         : db_stok

 Target Server Type    : MySQL
 Target Server Version : 50141
 File Encoding         : 65001

 Date: 04/01/2019 14:31:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for table_stock
-- ----------------------------
DROP TABLE IF EXISTS `table_stock`;
CREATE TABLE `table_stock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `to_date` datetime NULL DEFAULT NULL,
  `trans_description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `item_id` int(11) NULL DEFAULT NULL,
  `trans_date` datetime NULL DEFAULT NULL,
  `trans_type` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
