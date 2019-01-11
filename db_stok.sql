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

 Date: 03/01/2019 17:13:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ak_items`(`code`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, 'XMI4I', 'Siaomay Note Mi4i');
INSERT INTO `items` VALUES (2, 'IPN6S', 'IPhine 6S Minus');
INSERT INTO `items` VALUES (3, 'SAM7N', 'Slamdung Note 7+');

-- ----------------------------
-- Table structure for items_incoming
-- ----------------------------
DROP TABLE IF EXISTS `items_incoming`;
CREATE TABLE `items_incoming`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_num` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `trans_date` datetime NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15, 2) NULL DEFAULT 0.00,
  `remarks` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_items_incoming_items`(`item_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items_incoming
-- ----------------------------
INSERT INTO `items_incoming` VALUES (1, 'IN.001', '2016-01-10 00:00:00', 1, 20.00, 'Pembelian PURCH.001');
INSERT INTO `items_incoming` VALUES (2, 'IN.001', '2016-01-10 00:00:00', 2, 30.00, 'Pembelian PURCH.001');
INSERT INTO `items_incoming` VALUES (3, 'IN.002', '2016-01-15 00:00:00', 1, 10.00, 'Pembelian PURCH.002');
INSERT INTO `items_incoming` VALUES (4, 'IN.002', '2016-01-15 00:00:00', 2, 15.00, 'Pembelian PURCH.002');
INSERT INTO `items_incoming` VALUES (5, 'IN.002', '2016-01-15 00:00:00', 3, 20.00, 'Pembelian PURCH.002');
INSERT INTO `items_incoming` VALUES (6, 'IN.003', '2016-01-17 00:00:00', 3, 25.00, 'Pembelian PURCH.003');
INSERT INTO `items_incoming` VALUES (7, 'MASUK', '2016-01-10 00:00:00', 2, 30.00, 'V001');
INSERT INTO `items_incoming` VALUES (8, 'MASUK', '2016-01-15 00:00:00', 1, 10.00, 'V001');
INSERT INTO `items_incoming` VALUES (9, 'MASUK', '2016-01-15 00:00:00', 2, 15.00, 'V001');
INSERT INTO `items_incoming` VALUES (10, 'MASUK', '2016-01-15 00:00:00', 3, 20.00, 'V002');
INSERT INTO `items_incoming` VALUES (11, 'MASUK', '2016-01-17 00:00:00', 3, 25.00, 'V003');
INSERT INTO `items_incoming` VALUES (12, 'MASUK', '2016-01-10 00:00:00', 2, 30.00, 'V001');
INSERT INTO `items_incoming` VALUES (13, 'MASUK', '2016-01-15 00:00:00', 1, 10.00, 'V001');
INSERT INTO `items_incoming` VALUES (14, 'MASUK', '2016-01-15 00:00:00', 2, 15.00, 'V001');
INSERT INTO `items_incoming` VALUES (15, 'MASUK', '2016-01-15 00:00:00', 3, 20.00, 'V002');
INSERT INTO `items_incoming` VALUES (16, 'MASUK', '2016-01-17 00:00:00', 3, 25.00, 'V003');
INSERT INTO `items_incoming` VALUES (17, 'MASUK', '2016-01-10 00:00:00', 2, 30.00, 'V001');
INSERT INTO `items_incoming` VALUES (18, 'MASUK', '2016-01-15 00:00:00', 1, 10.00, 'V001');
INSERT INTO `items_incoming` VALUES (19, 'MASUK', '2016-01-15 00:00:00', 2, 15.00, 'V001');
INSERT INTO `items_incoming` VALUES (20, 'MASUK', '2016-01-15 00:00:00', 3, 20.00, 'V002');
INSERT INTO `items_incoming` VALUES (21, 'MASUK', '2016-01-17 00:00:00', 3, 25.00, 'V003');
INSERT INTO `items_incoming` VALUES (22, 'MASUK', '2016-01-10 00:00:00', 2, 30.00, 'V001');
INSERT INTO `items_incoming` VALUES (23, 'MASUK', '2016-01-15 00:00:00', 1, 10.00, 'V002');
INSERT INTO `items_incoming` VALUES (24, 'MASUK', '2016-01-15 00:00:00', 2, 15.00, 'V002');
INSERT INTO `items_incoming` VALUES (25, 'MASUK', '2016-01-15 00:00:00', 3, 20.00, 'V002');
INSERT INTO `items_incoming` VALUES (26, 'MASUK', '2016-01-17 00:00:00', 3, 25.00, 'V003');
INSERT INTO `items_incoming` VALUES (27, 'MASUK', '2016-01-10 00:00:00', 2, 30.00, 'V001');
INSERT INTO `items_incoming` VALUES (28, 'MASUK', '2016-01-10 00:00:00', 2, 30.00, 'V001');
INSERT INTO `items_incoming` VALUES (29, 'MASUK', '2016-01-15 00:00:00', 1, 10.00, 'V002');
INSERT INTO `items_incoming` VALUES (30, 'MASUK', '2016-01-15 00:00:00', 2, 15.00, 'V002');
INSERT INTO `items_incoming` VALUES (31, 'MASUK', '2016-01-15 00:00:00', 3, 20.00, 'V002');
INSERT INTO `items_incoming` VALUES (32, 'MASUK', '2016-01-17 00:00:00', 3, 25.00, 'V003');

-- ----------------------------
-- Table structure for items_outgoing
-- ----------------------------
DROP TABLE IF EXISTS `items_outgoing`;
CREATE TABLE `items_outgoing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_num` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `trans_date` datetime NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15, 2) NULL DEFAULT 0.00,
  `remarks` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_items_outgoing_items`(`item_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items_outgoing
-- ----------------------------
INSERT INTO `items_outgoing` VALUES (1, 'OUT.001', '2016-01-12 00:00:00', 1, 2.00, 'Penjualan INV.001');
INSERT INTO `items_outgoing` VALUES (2, 'OUT.002', '2016-01-13 00:00:00', 2, 3.00, 'Penjualan INV.002');
INSERT INTO `items_outgoing` VALUES (3, 'OUT.003', '2016-01-14 00:00:00', 1, 1.00, 'Penjualan INV.003');
INSERT INTO `items_outgoing` VALUES (4, 'OUT.004', '2016-01-15 00:00:00', 2, 5.00, 'Penjualan INV.004');
INSERT INTO `items_outgoing` VALUES (5, 'OUT.005', '2016-01-16 00:00:00', 3, 2.00, 'Penjualan INV.005');
INSERT INTO `items_outgoing` VALUES (6, 'OUT.006', '2016-01-17 00:00:00', 3, 2.00, 'Penjualan INV.006');
INSERT INTO `items_outgoing` VALUES (7, 'OUT.007', '2016-01-18 00:00:00', 2, 2.00, 'Penjualan INV.007');
INSERT INTO `items_outgoing` VALUES (8, 'OUT.008', '2016-01-19 00:00:00', 2, 3.00, 'Penjualan INV.008');
INSERT INTO `items_outgoing` VALUES (9, 'OUT.009', '2016-01-20 00:00:00', 1, 1.00, 'Penjualan INV.009');
INSERT INTO `items_outgoing` VALUES (10, 'OUT.010', '2016-01-21 00:00:00', 2, 3.00, 'Penjualan INV.010');
INSERT INTO `items_outgoing` VALUES (11, 'OUT.011', '2016-01-22 00:00:00', 3, 2.00, 'Penjualan INV.011');
INSERT INTO `items_outgoing` VALUES (12, 'OUT.012', '2016-01-23 00:00:00', 3, 2.00, 'Penjualan INV.012');

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

-- ----------------------------
-- Records of table_stock
-- ----------------------------
INSERT INTO `table_stock` VALUES (9, 'V001', NULL, 'Pembelian', 20, 1, '2016-01-10 00:00:00', 'MASUK');
INSERT INTO `table_stock` VALUES (10, 'V001', NULL, 'Pembelian', 30, 2, '2016-01-10 00:00:00', 'MASUK');
INSERT INTO `table_stock` VALUES (11, 'V002', NULL, 'Pembelian', 10, 1, '2016-01-15 00:00:00', 'MASUK');
INSERT INTO `table_stock` VALUES (12, 'V002', NULL, 'Pembelian', 10, 2, '2016-01-15 00:00:00', 'MASUK');
INSERT INTO `table_stock` VALUES (13, 'V002', NULL, 'Pembelian', 20, 3, '2016-01-15 00:00:00', 'MASUK');
INSERT INTO `table_stock` VALUES (14, 'V003', NULL, 'Pembelian', 25, 3, '2016-01-17 00:00:00', 'MASUK');

-- ----------------------------
-- Table structure for table_transaksi
-- ----------------------------
DROP TABLE IF EXISTS `table_transaksi`;
CREATE TABLE `table_transaksi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `trans_desc` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of table_transaksi
-- ----------------------------
INSERT INTO `table_transaksi` VALUES (1, 'V001', 'Pembelian');
INSERT INTO `table_transaksi` VALUES (2, 'V002', 'Pembelian');
INSERT INTO `table_transaksi` VALUES (3, 'V003', 'Pembelian');

SET FOREIGN_KEY_CHECKS = 1;
