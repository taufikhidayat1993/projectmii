/*
 Navicat Premium Data Transfer

 Source Server         : Koneksi Localhost
 Source Server Type    : MySQL
 Source Server Version : 50141
 Source Host           : localhost:3306
 Source Schema         : db_toko

 Target Server Type    : MySQL
 Target Server Version : 50141
 File Encoding         : 65001

 Date: 14/12/2018 16:57:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accgroup
-- ----------------------------
DROP TABLE IF EXISTS `accgroup`;
CREATE TABLE `accgroup`  (
  `groupid` int(10) NOT NULL AUTO_INCREMENT,
  `kode_group` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_group` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `modidate` datetime NOT NULL,
  `modiby` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`groupid`) USING BTREE,
  UNIQUE INDEX `id`(`groupid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for accheader
-- ----------------------------
DROP TABLE IF EXISTS `accheader`;
CREATE TABLE `accheader`  (
  `headerid` int(11) NOT NULL AUTO_INCREMENT,
  `kode_header` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_header` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_group` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `modiby` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `modidate` datetime NOT NULL,
  PRIMARY KEY (`headerid`) USING BTREE,
  UNIQUE INDEX `id`(`headerid`) USING BTREE,
  INDEX `id2`(`kode_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of accheader
-- ----------------------------
INSERT INTO `accheader` VALUES (1, '1-100', 'AKTIVA LANCAR', '1-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (2, '1-200', 'AKTIVA TETAP', '1-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (3, '1-300', 'AKTIVA LAIN-LAIN', '1-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (4, '2-100', 'KEWAJIBAN LANCAR', '2-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (5, '3-100', 'Modal Usaha', '3-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (6, '3-200', 'Laba Ditahan', '3-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (7, '4-100', 'Penjualan Barang', '4-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (8, '4-200', 'Retur Penjualan Barang', '4-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (9, '5-100', 'Pemakaian Bahan Baku', '5-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (10, '5-200', 'Tenaga Kerja Langsung', '5-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (11, '5-300', 'Biaya Overhead Pabrik', '5-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (12, '5-400', 'Persediaan Awal Barang dalam Proses', '5-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (13, '5-500', 'Persediaan Akhir Barang dalam Proses', '5-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (14, '5-600', 'Persediaan Awal Barang Jadi', '5-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (15, '5-700', 'Persediaan Akhir Barang Jadi', '5-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (16, '6-100', 'Raw Material', '6-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (17, '6-200', 'Glue', '6-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (18, '6-300', 'Labour', '6-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (19, '6-400', 'Main Material', '6-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (20, '6-500', 'Supllies', '6-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (21, '6-600', 'Electrical', '6-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (22, '6-700', 'Mantenance & Repair', '6-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (23, '6-800', 'Administration Expense', '6-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (24, '6-900', 'Boiler', '6-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (25, '7-100', 'Pendapatan Lain-lain Diluar Usaha', '7-000', NULL, '1', '2018-11-30 00:00:00');
INSERT INTO `accheader` VALUES (26, '7-200', 'Biaya Lain-lain Diluar Usaha', '7-000', NULL, '1', '2018-11-30 00:00:00');

-- ----------------------------
-- Table structure for accjurnal
-- ----------------------------
DROP TABLE IF EXISTS `accjurnal`;
CREATE TABLE `accjurnal`  (
  `kode_jurnal` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_po` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `automated` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `posted` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modiby` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modidate` datetime NOT NULL,
  PRIMARY KEY (`kode_jurnal`) USING BTREE,
  UNIQUE INDEX `id`(`kode_jurnal`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accjurnaldetail
-- ----------------------------
DROP TABLE IF EXISTS `accjurnaldetail`;
CREATE TABLE `accjurnaldetail`  (
  `id_jurnal` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `kode_account` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `source` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `source_no` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kurs` double(15, 2) NOT NULL,
  `debet` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kredit` double(15, 2) NOT NULL,
  `cek` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` int(11) NOT NULL,
  PRIMARY KEY (`id_jurnal`) USING BTREE,
  INDEX `id2`(`id_jurnal`, `kode_account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of accjurnaldetail
-- ----------------------------
INSERT INTO `accjurnaldetail` VALUES (16, '2018-12-14', '2-110', 'Purchase Order', 'PO/001/MII/XII/18', '', 0.00, '', 400000.00, '', '2018-12-14 14:44:33', 1);
INSERT INTO `accjurnaldetail` VALUES (17, '2018-12-14', '2-130', 'Purchase Order', 'PO/001/MII/XII/18', '', 0.00, '40000', 0.00, '', '2018-12-14 14:44:33', 1);
INSERT INTO `accjurnaldetail` VALUES (18, '2018-12-14', '2-110', 'Purchase Order', 'PO/001/MII/XII/18', '', 0.00, '', 40000.00, '', '2018-12-14 14:44:33', 1);
INSERT INTO `accjurnaldetail` VALUES (19, '2018-12-14', '6-599', 'Purchase Order', 'PO/001/MII/XII/18', '', 0.00, '200000', 0.00, '', '2018-12-14 14:44:33', 1);
INSERT INTO `accjurnaldetail` VALUES (20, '2018-12-14', '6-207', 'Purchase Order', 'PO/001/MII/XII/18', '', 0.00, '200000', 0.00, '', '2018-12-14 14:44:33', 1);
INSERT INTO `accjurnaldetail` VALUES (21, '2018-12-14', '2-110', '', 'PO/002/MII/XII/18', 'po sudah oke', 0.00, '', 160000.00, '', '2018-12-14 15:50:50', 1);
INSERT INTO `accjurnaldetail` VALUES (22, '2018-12-14', '2-130', '', 'PO/002/MII/XII/18', 'po sudah oke', 0.00, '16000', 0.00, '', '2018-12-14 15:50:50', 1);
INSERT INTO `accjurnaldetail` VALUES (23, '2018-12-14', '2-110', '', 'PO/002/MII/XII/18', 'po sudah oke', 0.00, '', 16000.00, '', '2018-12-14 15:50:50', 1);
INSERT INTO `accjurnaldetail` VALUES (24, '2018-12-14', '6-507', '', 'PO/002/MII/XII/18', 'po sudah oke', 0.00, '100000', 0.00, '', '2018-12-14 15:50:50', 1);
INSERT INTO `accjurnaldetail` VALUES (25, '2018-12-14', '6-412', '', 'PO/002/MII/XII/18', 'po sudah oke', 0.00, '60000', 0.00, '', '2018-12-14 15:50:50', 1);

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `kode_account` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama_account` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_header` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `matauangid` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipe` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modiby` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modidate` datetime NOT NULL,
  PRIMARY KEY (`kode_account`) USING BTREE,
  UNIQUE INDEX `id`(`kode_account`) USING BTREE,
  INDEX `id2`(`kode_header`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1-111', 'Kas Kecil', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-121', 'Bank BCA', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-122', 'Bank Bukopin', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-131', 'Piutang Dagang', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-132', 'Cadangan Kerugian Piutang', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-133', 'Piutang Karyawan', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-141', 'Persediaan Barang Jadi ', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-142', 'Persediaan Barang dalam Proses ', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-143', 'Persediaan Bahan Baku (Log)', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-144', 'Persediaan Bahan Penolong', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-145', 'Persediaan Barang/Spare Parts', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-146', 'Biaya Dibayar Dimuka', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-151', 'Sewa Dibayar Dimuka', '1-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-211', 'Tanah', '1-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-212', 'Bangunan', '1-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-213', 'Mesin', '1-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-214', 'Kendaraan', '1-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-215', 'Peralatan Kantor', '1-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-216', 'Akum. Penyusutan Bangunan', '1-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-217', 'Akum. Penyusutan Mesin', '1-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-218', 'Akum. Penyusutan Kendaraan', '1-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-219', 'Akum. Penyusutan Peralatan Kantor', '1-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-310', 'Bangunan Dalam Proses', '1-300', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-311', 'Pagar Pabrik', '1-300', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-312', 'Workshop', '1-300', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-313', 'Kantor', '1-300', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('1-314', 'Pabrik', '1-300', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('2-110', 'Hutang Dagang', '2-100', '', 'K', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('2-120', 'PPN Keluaran', '2-100', '', 'K', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('2-130', 'PPN Masukan', '2-100', '', 'K', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('2-140', 'Hutang Lancar Lainnya', '2-100', '', 'K', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('2-210', 'Hutang Jangka Panjang', '2-200', '', 'K', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('4-101', 'Plywood', '4-100', '', 'K', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('4-102', 'Veneer / Face Back', '4-100', '', 'K', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('4-103', 'Bare Core', '4-100', '', 'K', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('4-199', 'Lainnya', '4-100', '', 'K', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-101', 'Log', '6-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-102', 'Veneer / Face Back', '6-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-103', 'Bare Core', '6-100', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-201', 'Urea Resin', '6-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-202', 'Melamine Resin', '6-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-203', 'Phenol Resin', '6-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-204', 'Hardener', '6-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-205', 'Cather', '6-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-206', 'Tepung Industry', '6-200', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-207', 'Glue', '6-200', '', 'Debet', '1', '2018-12-13 14:53:22');
INSERT INTO `account` VALUES ('6-301', 'Gaji Karyawan', '6-300', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-302', 'THR', '6-300', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-303', 'Uang Lembur', '6-300', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-304', 'Biaya Makan Karyawan', '6-300', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-305', 'TK Borongan', '6-300', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-306', 'Biaya Pengobatan Karyawan', '6-300', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-399', 'Biaya Lainnya', '6-300', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-401', 'Spur Knife', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-402', 'Clipper Knife', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-403', 'Rotary Knife', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-404', 'Nose Bar', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-405', 'Diamond Wheel', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-406', 'Honing Stone', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-407', 'CB Knife', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-408', 'Tip.S.Joint SVC', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-409', 'Tip S.DS', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-410', 'Teteron String', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-411', 'Hotmelt', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-412', 'Amplas Scraf', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-413', 'Gummed Tape', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-414', 'Dempul', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-415', 'Amplas Sander', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-416', 'Contact Drum', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-417', 'Pinch Roll Sander', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-418', 'Rubber Roll', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-419', 'Doctor Roll', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-420', 'Solar', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-421', 'Softener Boiler', '6-400', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-501', 'ATK', '6-500', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-502', 'Alat Safety', '6-500', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-503', 'Alat Kerja Produksi', '6-500', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-504', 'Alat Packing', '6-500', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-505', 'Pelumas', '6-500', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-506', 'Spare Part', '6-500', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-507', 'Alat Pendukung Kerja Maintenace', '6-500', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-508', 'Instalasi Listrik', '6-500', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-599', 'Supplies', '6-500', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-601', 'PLN', '6-600', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-602', 'Genset', '6-600', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-701', 'Mantenance & Repair', '6-700', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-801', 'Transport / Perjalanan Dinas', '6-800', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-802', 'Telpon & Air', '6-800', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-803', 'Pemeliharaan & Perbaikan', '6-800', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-804', 'Penjualan & Pemasaran', '6-800', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-805', 'Jasa Pengiriman', '6-800', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-806', 'Cetak / Foto copy', '6-800', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-807', 'Jasa Pihak ketiga', '6-800', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-808', 'Sewa', '6-800', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-809', 'Pendidikan & Pelatihan', '6-800', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-810', 'Pajak (PBB, Pajak Kendaraan)', '6-800', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-811', 'BBM', '6-800', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-899', 'Lainnya', '6-800', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-901', 'Bahan Bakar', '6-900', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-902', 'Chemical', '6-900', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-903', 'Garam', '6-900', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-990', 'Penyusutan', '6-900', '', '', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-991', 'Penyusutan', '6-900', '', 'D', '1', '2018-11-30 00:00:00');
INSERT INTO `account` VALUES ('6-999', 'Lainnya', '6-900', '', 'D', '1', '2018-11-30 00:00:00');

-- ----------------------------
-- Table structure for brgkategori
-- ----------------------------
DROP TABLE IF EXISTS `brgkategori`;
CREATE TABLE `brgkategori`  (
  `kategori_id` int(30) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modiby` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modidate` datetime NOT NULL,
  PRIMARY KEY (`kategori_id`) USING BTREE,
  UNIQUE INDEX `id`(`kategori_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of brgkategori
-- ----------------------------
INSERT INTO `brgkategori` VALUES (1, 'Alat Tulis Kantor', '1', '2018-11-13 10:05:40');
INSERT INTO `brgkategori` VALUES (3, 'Bahan Baku', '1', '2018-11-14 08:56:05');

-- ----------------------------
-- Table structure for brgsatuan
-- ----------------------------
DROP TABLE IF EXISTS `brgsatuan`;
CREATE TABLE `brgsatuan`  (
  `satuan_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`satuan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of brgsatuan
-- ----------------------------
INSERT INTO `brgsatuan` VALUES (18, 'PCS', '2017-03-06 08:24:42', '');
INSERT INTO `brgsatuan` VALUES (19, 'SET', '2017-03-06 08:24:42', '');
INSERT INTO `brgsatuan` VALUES (20, 'BTL', '2017-03-06 08:24:42', '');
INSERT INTO `brgsatuan` VALUES (23, 'UNIT', '2017-03-06 08:32:26', '');
INSERT INTO `brgsatuan` VALUES (25, 'BUNGKUS', '2017-03-06 08:38:46', '');
INSERT INTO `brgsatuan` VALUES (26, 'BH', '2018-09-04 09:16:30', '');
INSERT INTO `brgsatuan` VALUES (27, 'PICK UP', '2018-09-24 16:25:38', '');
INSERT INTO `brgsatuan` VALUES (28, 'BELT', '2018-10-02 11:55:20', '');
INSERT INTO `brgsatuan` VALUES (29, 'LEMBAR', '2018-10-02 00:36:22', '');
INSERT INTO `brgsatuan` VALUES (30, 'ROLL', '2018-10-02 00:37:01', '');

-- ----------------------------
-- Table structure for detail_request_order
-- ----------------------------
DROP TABLE IF EXISTS `detail_request_order`;
CREATE TABLE `detail_request_order`  (
  `id_request_order` int(11) NOT NULL AUTO_INCREMENT,
  `kode_pr` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_barang` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_barang` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_request_order`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 45 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_request_order
-- ----------------------------
INSERT INTO `detail_request_order` VALUES (43, '20180003', 'H121-PPBS0006', 'Pipa Besi', 5, '23');
INSERT INTO `detail_request_order` VALUES (38, '20180002', 'BRG0000000001', 'semen gresik', 50, 'unit');
INSERT INTO `detail_request_order` VALUES (37, '20180002', 'BRG0000000002', 'semen surabaya', 50, 'unit');
INSERT INTO `detail_request_order` VALUES (44, '20180003', 'B1-ASV0001', 'Amplas Scraf Veneer', 6, '23');

-- ----------------------------
-- Table structure for request_order
-- ----------------------------
DROP TABLE IF EXISTS `request_order`;
CREATE TABLE `request_order`  (
  `id_request` int(11) NOT NULL AUTO_INCREMENT,
  `kode_pr` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_pr` date NOT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` int(11) NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_request`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 75 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of request_order
-- ----------------------------
INSERT INTO `request_order` VALUES (71, '20180002', '2018-10-29', 'dadadadada', '2018-10-29 15:35:04', 1, '0');
INSERT INTO `request_order` VALUES (74, '20180003', '2018-12-14', 'tolong di acc', '2018-12-14 15:48:27', 1, '1');
INSERT INTO `request_order` VALUES (73, '20180003', '2018-12-13', 'Request', '2018-12-13 12:56:52', 1, '1');

-- ----------------------------
-- Table structure for tb_barang
-- ----------------------------
DROP TABLE IF EXISTS `tb_barang`;
CREATE TABLE `tb_barang`  (
  `kode_barang` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `spek` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `merk` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `warna` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_input` date NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` double(10, 2) NOT NULL,
  `kategori_id` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_account` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jml_stok` int(11) NOT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_barang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_barang
-- ----------------------------
INSERT INTO `tb_barang` VALUES ('15-DCKP0001', 0, 'Document Keeper ', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('18-KST0001', 0, 'Keset', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('19-TAS0001', 0, 'Tas Samping', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('25-WDG0001', 0, 'Wedung Ret', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('56-PLK0001', 0, 'Plastik Kresek', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('61-RSP0001', 0, 'Resplang Garuda', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('70-STA0001', 0, 'Stempel Angka', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('77-ST0001', 0, 'Stempel', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('78-TTM0001', 0, 'Tali tampar', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('79-TSU0001', 0, 'Tissue', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('80-UU0001', 0, 'Umbul-Umbul Garuda', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('A1-GW0001', 0, 'Grinding Whell', '255x100x205', 'Takakura', '', '', '0000-00-00', 0, 0.00, '', '6-403', 0, '23');
INSERT INTO `tb_barang` VALUES ('A2-HS0001', 0, 'Honing Stone', '185x62x15 #8000', 'Sun Tiger', '', '', '0000-00-00', 0, 0.00, '', '6-406', 0, '23');
INSERT INTO `tb_barang` VALUES ('A2-HS0002', 0, 'Honing Stone', '207x66x32 #2500', 'King', '', '', '0000-00-00', 0, 0.00, '', '6-406', 0, '23');
INSERT INTO `tb_barang` VALUES ('A3-RTKN0001', 0, 'Rotary Knife Spindles', '1500x180x16', 'Lion', '', '', '0000-00-00', 0, 0.00, '', '6-403', 0, '23');
INSERT INTO `tb_barang` VALUES ('B1-ASV0001', 0, 'Amplas Scraf Veneer', '', 'Bigchampion', '', '', '0000-00-00', 0, 0.00, '', '6-412', 0, '23');
INSERT INTO `tb_barang` VALUES ('B1-ASV0002', 0, 'Amplas Scraf Veneer', '', 'Deerfos (P40)', '', '', '0000-00-00', 0, 0.00, '', '6-412', 0, '23');
INSERT INTO `tb_barang` VALUES ('B2-GMTP0001', 0, 'Gummed Tape', '', 'Green leaf', '', '', '0000-00-00', 0, 0.00, '', '6-413', 0, '23');
INSERT INTO `tb_barang` VALUES ('B3-HTML0001', 0, 'Hot Meal/Inmelt', '', ' 222', '', '', '0000-00-00', 0, 0.00, '', '6-412', 0, '23');
INSERT INTO `tb_barang` VALUES ('B4-TTS0001', 0, 'Tetoron String', 'BHT 1000-250-P Type 500Z', ' ', ' ', '', '0000-00-00', 0, 0.00, '', '6-412', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1 -SNPR00014', 0, 'Amplas X288', 'A100', 'Bigchampion', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR0001', 0, 'Amplas (sample)', 'A80 50,00mmx1220,00mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR00010', 0, 'Sand Paper ', 'F299 A0 A240 1350.00mm x 2800.00mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR00011', 0, 'Sand Paper ', 'P240 1350x2800', 'Deerfoss', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR00012', 0, 'Sand Paper ', 'F299 A0 A320 1350.00mm x 2800.00mm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR00013', 0, 'Sand Paper ', '320', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR0002', 0, 'Sand Paper ', 'F299 A0 A180 1350.00mm x 2800.00mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR0003', 0, 'Amplas Deer XA 345 (sample)', 'P180 1350x2800', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR0004', 0, 'Amplas F299', 'A180', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR0005', 0, 'Sand Paper ', 'P180 1350x2800', 'Deerfoss', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR0006', 0, 'Sand Paper ', 'F299 A0 A180 1350.00mm x 2800.00mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR0007', 0, 'Sand Paper (sander Finish)', '180', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR0008', 0, 'Sand Paper ', 'F299 A0 A240 1350.00mm x 2800.00mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C1-SNPR0009', 0, 'Amplas F299', 'A240', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23');
INSERT INTO `tb_barang` VALUES ('C2-AD0001', 0, 'Adhesive ', 'VA-0601', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-207', 0, '23');
INSERT INTO `tb_barang` VALUES ('C3-DMR0001', 0, 'Dempul Meranti', '', ' 2', 'Merah', '', '0000-00-00', 0, 0.00, '', '6-414', 0, '23');
INSERT INTO `tb_barang` VALUES ('C3-DMR0002', 0, 'Dempul Meranti', '', ' 22', 'Kuning', '', '0000-00-00', 0, 0.00, '', '6-414', 0, '23');
INSERT INTO `tb_barang` VALUES ('C4-ML0001', 0, 'Meal/Kalsium', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '', 0, '23');
INSERT INTO `tb_barang` VALUES ('C5-PPD0001', 0, 'Pigmen Powder', '', ' 2', 'Merah', '', '0000-00-00', 0, 0.00, '', '', 0, '23');
INSERT INTO `tb_barang` VALUES ('C5-PPD0002', 0, 'Pigmen Powder', '', ' 22', 'Hitam', '', '0000-00-00', 0, 0.00, '', '', 0, '23');
INSERT INTO `tb_barang` VALUES ('C6-CCP0001', 0, 'Tepung Batok (CCP)', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-206', 0, '23');
INSERT INTO `tb_barang` VALUES ('D1-AD0001', 0, 'Adhesive ', 'UA-125', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-207', 0, '23');
INSERT INTO `tb_barang` VALUES ('D1-AD0002', 0, 'Adhesive ', 'UA-125 R', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-207', 0, '23');
INSERT INTO `tb_barang` VALUES ('D1-AD0003', 0, 'Adhesive ', 'MA-204', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-207', 0, '23');
INSERT INTO `tb_barang` VALUES ('D2-HRD0001', 0, 'Hardener', 'HU-12', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-204', 0, '23');
INSERT INTO `tb_barang` VALUES ('D2-HRD0002', 0, 'Hardener', 'HU-200 (Catcher)', '', '', '', '0000-00-00', 0, 0.00, '', '6-204', 0, '23');
INSERT INTO `tb_barang` VALUES ('D2-HRD0003', 0, 'Hardener', 'HU-17', ' 222', '', '', '0000-00-00', 0, 0.00, '', '6-204', 0, '23');
INSERT INTO `tb_barang` VALUES ('D3-PWTX0001', 0, 'Pewarna Textile', '', 'Wantex', '', '', '0000-00-00', 0, 0.00, '', '', 0, '23');
INSERT INTO `tb_barang` VALUES ('D4-TEP0001', 0, 'Tepung Industri', '', 'Three Leaves', '', '', '0000-00-00', 0, 0.00, '', '6-206', 0, '23');
INSERT INTO `tb_barang` VALUES ('E1-KLG0001', 0, 'Klem Galvanis', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23');
INSERT INTO `tb_barang` VALUES ('E2-KLSG0001', 0, 'Klem Seng', '', ' 2222', '', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23');
INSERT INTO `tb_barang` VALUES ('E3-PLK0001', 0, 'Palet Kayu', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23');
INSERT INTO `tb_barang` VALUES ('E4-PLPE0001', 0, 'Plastik PE', '05x150x100mtr', ' 22', '', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23');
INSERT INTO `tb_barang` VALUES ('E5-PET0002', 0, 'Striping Band (Tali Packing)', '15.5 x 1mm', ' 2222222', 'Hijau', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23');
INSERT INTO `tb_barang` VALUES ('E6-LL0001', 0, 'Lilin', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23');
INSERT INTO `tb_barang` VALUES ('E7-SPH0001', 0, 'Siku Plastik Hitam', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23');
INSERT INTO `tb_barang` VALUES ('F1-EXL0001', 0, 'Excell Boiler Water', 'B200', '', '', '', '0000-00-00', 0, 0.00, '', '6-900', 0, '23');
INSERT INTO `tb_barang` VALUES ('F1-EXL0002', 0, 'Excell Boiler Water', 'B300', '', '', '', '0000-00-00', 0, 0.00, '', '6-900', 0, '23');
INSERT INTO `tb_barang` VALUES ('F1-EXL0003', 0, 'Excell Boiler Water', 'HL', '', '', '', '0000-00-00', 0, 0.00, '', '6-900', 0, '23');
INSERT INTO `tb_barang` VALUES ('F2-PLB0001', 0, 'Plibico', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-900', 0, '23');
INSERT INTO `tb_barang` VALUES ('F3-GRM0001', 0, 'Garam Boiler', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-900', 0, '23');
INSERT INTO `tb_barang` VALUES ('G1- SLR 0001', 0, 'SOLAR', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-420', 0, '23');
INSERT INTO `tb_barang` VALUES ('H1-AA0001', 0, 'Air Aki', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H10-BT0001', 0, 'Baut', 'M 14x40 (kunci 22)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H10-BT0002', 0, 'Baut', 'M 16x30 (K24)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H10-BT0003', 0, 'Baut', 'M 6x25', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H10-BT0004', 0, 'Baut', 'M 6x35 (K10)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H10-BT0005', 0, 'Baut', 'M 8x24 (K12)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H10-BT0006', 0, 'Baut', 'm10x65', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H10-BT0007', 0, 'Baut', '10x35', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H10-BT0008', 0, 'Baut', '8x35', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H10-BT0009', 0, 'Baut ', 'L 8x35', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H10-BT0010', 0, 'Baut ', 'M 10x25', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H10-BT0011', 0, 'Baut', '6x30', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H100-OVL0001', 0, 'Over Lood', '8', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H101-MCGK0001', 0, 'Mata Circle (Grenda Kayu)', 'F X 24T', 'Makita', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H102-MPJS0001', 0, 'Mata pisau jigsaw', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H103-MCB0001', 0, 'MCB ', '20 Ampere', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H103-MCB0002', 0, 'MCB ', 'NF63-CV', 'Mitsubshi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H104-MYRM0001', 0, 'Minyak Rem', '1000ml', 'Prestone', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H105-MTR0001', 0, 'Motor', '3HP 4P 3PHS', 'Teco', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H105-MTRS0001', 0, 'Motor Sirine', '220 V', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H106-OMM0001', 0, 'Outside Micrometer', '(0-25mm)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H107-MNT0001', 0, 'Mounting', 'C96SDB40-100', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H107-MNT0002', 0, 'Mounting', 'C96SDB50-100', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H107-MNT0003', 0, 'Mounting', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H107-MNTO0001', 0, 'Mounting Ocilation Sander Finish', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H108-MUR0001', 0, 'Mur', '10 (K14)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H108-MUR0002', 0, 'Mur', '14 (K22)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H108-MUR0003', 0, 'Mur', '16 (K24)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H108-MUR0004', 0, 'Mur', 'M24', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H108-MUR0005', 0, 'Mur ', 'M 10x1,5', ' ', 'Putih', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H108-MUR0006', 0, 'Mur ', 'M16', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H108-MURB0001', 0, 'Mur Baja', '10', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H108-MURB0002', 0, 'Mur Baja', 'M 16', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H109-PTSR0001', 0, 'Photo sensor', 'BRP 200', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H11-BFS0001', 0, 'Baut Fisher', 'K14', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H11-BFS0002', 0, 'Baut Fisher', 'K8', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H110-NPLG0001', 0, 'Naple Grease', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H111-OFL0001', 0, 'Offset Link', 'RS 50', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H111-OFL0002', 0, 'Offset Link ', 'rs 40', 'Hitachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H111-OFL0003', 0, 'Offset Link ', 'rs 60', 'Hitachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H111-OFL0004', 0, 'Offset Link ', 'rs 80', 'Hitachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H111-OFL0005', 0, 'Offset Link ', 'RS 35', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H112-OLI0001', 0, 'Oli', 'Turalic 52', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H112-OLI0002', 0, 'Oli', 'Meditran S', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H112-OLI0003', 0, 'Oli', '2T', 'Castrol', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H113-OVPL0001', 0, 'Over Plat ( Plat Kunci )', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H114-PBV0001', 0, 'P.B.Oval', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H115-PNB0001', 0, 'Panel box', '30x40x15', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H116-PHSC0001', 0, 'Pangkon holder Pisau SVC', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H117-PG0001', 0, 'Pegangan', '5\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H118-PLMG0001', 0, 'Pelampung', 'DP 90', 'Dupon', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H118-PLMG0002', 0, 'Pelampung', 'RD.99OR', 'JP', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H119-PSVL0001', 0, 'Pheumatic Selenoid Valve', 'N3V210-08 AC220V', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H12-BTL0001', 0, 'Baut L', 'M16x130', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H12-BTL0002', 0, 'Baut L', '8x100', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H12-BTL0003', 0, 'Baut L', '10x40', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H12-BTL0004', 0, 'Baut L', '8x35', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H12-BTL0005', 0, 'Baut L', '10x75', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H12-BTL0006', 0, 'Baut L', '16x90', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H12-BTLH0001', 0, 'Baut L (high tensile)', 'M 6x40', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H120-PLBK0001', 0, 'Pillow Block', 'UCF 206 dia 30', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H120-PLBK0002', 0, 'Pillow Block', 'UCF 210 dia 50', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H120-PLBK0003', 0, 'Pillow Block', 'UCP 206 dia 30', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H120-PLBK0004', 0, 'Pillow Block', 'UCFL 204 dia 20', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H120-PLBK0005', 0, 'Pillow Block', 'UCP 209 ', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H120-PLBK0006', 0, 'Pillow Block', 'UCF 209 ', 'FYN', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H120-PLBK0007', 0, 'Pillow Block', 'UCP 210 dia 50', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H120-PLBK0008', 0, 'Pillow Block', 'UCHA 206', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H120-PLBK0009', 0, 'Pillow Block', 'UCP205', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H120-PLBK0010', 0, 'Pillow Block', 'UCP 210 50mm', 'NIS', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H121-PPBS0001', 0, 'Pipa Besi', '1 1/2\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H121-PPBS0002', 0, 'Pipa Besi', '1\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H121-PPBS0003', 0, 'Pipa Besi', '1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H121-PPBS0004', 0, 'Pipa Besi', '2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H121-PPBS0005', 0, 'Pipa Besi', '3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H121-PPBS0006', 0, 'Pipa Besi', '4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H121-PPBS0007', 0, 'Pipa Besi', '4x6 mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H122-PPVC0001', 0, 'Pipa PVC', '1\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H122-PPVC0002', 0, 'Pipa PVC', '3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H122-PPVC0003', 0, 'Pipa PVC', '', 'Power Max', 'Putih', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H122-PPVC0004', 0, 'Pipa PVC', '2.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H123-PRTK0001', 0, 'Pir Tarik ', '22x15', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H124-PLTE0001', 0, 'Plat ezer', '1.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H124-PLTE0002', 0, 'Plat ezer', '1.2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H125-PLC0001', 0, 'PLC', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H126-PLG0001', 0, 'Plong', '12m', 'Prohex', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H127-PLU0001', 0, 'Plug', '1 1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H127-PLU0002', 0, 'Plug', '1\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H128-PBF0001', 0, 'Push button OFF', '25', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H128-PBO0001', 0, 'Push Button ON', '25', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H129-PSP0001', 0, 'Push selector power', '30 A/3P', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H13-FOC0001', 0, 'Filter Oli Compressor', 'Sullair', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H130-RNT0001', 0, 'Rantai', 'rs 40', 'sindo', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H130-RNT0002', 0, 'Rantai ', 'RS 50', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H130-RNT0003', 0, 'Rantai ', 'RS06 B 3R', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H131-RDS0001', 0, 'Reduser', '1 1/2 x 1', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H131-RDS0002', 0, 'Reduser', '1 1/4 x 1 1/2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H131-RDSL0001', 0, 'Reduser Las', '2x1,5 mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H131-RDSL0002', 0, 'Reduser Las', '2x1mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H131-RDSL0003', 0, 'Reduser Las', '4-2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H131-RDST0001', 0, 'Reduser drat', '1 1/2-1/2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H131-RDST0002', 0, 'Reduser drat', '1-1/2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H131-RDST0003', 0, 'Reduser drat', '2-3/4', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H131-RDST0004', 0, 'Reduser drat', '3-1', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H131-RDST0005', 0, 'Reduser drat', '1/2x1/4', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H132-RG0001', 0, 'Regulator', 'AW20-02-B+gauge', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H133-RC0001', 0, 'Roller Chain (triple Chain)', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H134-RLA0001', 0, 'Relay', 'MY 2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H134-RLA0002', 0, 'Relay', 'LY 2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H135-RTF0001', 0, 'Remes Teflon (Packing Pillar)', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H136-RSBN0001', 0, 'Resibon', '100x6x16 (4\")', 'Resibon', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H136-RSBN0002', 0, 'Resibon', '125x6x22 mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H137-RPR0001', 0, 'Ring Per', 'M14', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H137-RPR0002', 0, 'Ring Per', 'M16', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H137-RPR0003', 0, 'Ring Per', 'M6', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H137-RPR0004', 0, 'Ring Per', 'M8', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H137-RPR0005', 0, 'Ring Per', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H137-RPR0006', 0, 'Ring Per', 'M 18', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H138-RPL0001', 0, 'Ring Plat', 'm10', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H138-RPL0002', 0, 'Ring Plat', 'M12', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H138-RPL0003', 0, 'Ring Plat', 'M14', ' ', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H138-RPL0004', 0, 'Ring Plat', 'M16', ' ', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H138-RPL0005', 0, 'Ring Plat', 'M20', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H138-RPL0006', 0, 'Ring Plat', 'M30', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H138-RPL0007', 0, 'Ring Plat', 'M6', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H138-RPL0008', 0, 'Ring Plat', 'M8', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H138-RPL0009', 0, 'Ring Plat', 'M8', ' ', 'Kuningan', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H138-RPL0010', 0, 'Ring Plat', 'M 17', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H139-ROD0001', 0, 'Roda', '10', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTM0001', 0, 'Baut Mur', '12x40', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTM0002', 0, 'Baut Mur', 'M 16x60 (K24)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTM0003', 0, 'Baut Mur', 'M10x35', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTM0004', 0, 'Baut Mur', 'm14x50', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTM0005', 0, 'Baut Mur', 'm16x50', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTM0006', 0, 'Baut Mur', 'm6x35', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTM0007', 0, 'Baut Mur', 'M6 x 25', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTM0008', 0, 'Baut Mur', 'M8 x 25', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTM0009', 0, 'Baut Mur', 'M4x50', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTM0010', 0, 'Baut Mur', 'M12x130mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTM0011', 0, 'Baut Mur ', 'M12x40', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTMB0001', 0, 'Baut Mur (Baja)', 'm12x50', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H14-BTMH0001', 0, 'Baut Mur (High Tensile)', 'm16x80', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H140-RDM0001', 0, 'Roda Mati Arco', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H141-RLB0001', 0, 'Roll Bronz', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H142-MTRN0001', 0, 'Roll Meter (Meteran)', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H142-MTRN0002', 0, 'Roll Meter (Meteran)', '3 Meter', 'Tajima', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H142-MTRN0003', 0, 'Roll Meter (Meteran)', '7.5Meter', 'Sherlock', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H143-RLST0001', 0, 'Roll Sheet (Kertas Tally)', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H144-RLTF0001', 0, 'Roll Teflon', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H145-PLX0001', 0, 'Pylox (Cat semprot)', '', 'pylox', 'Putih', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H146-SLTP0002', 0, 'Seal Tape', '', 'Dcota', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H147-SGL0001', 0, 'Segel', 'M16', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H147-SGL0002', 0, 'Segel', 'M22', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H148-SKR0001', 0, 'Sekring', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H149-SLA0001', 0, 'Selang angin', '8,5x14', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H149-SLA0002', 0, 'Selang angin', '8x12mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H149-SLA0003', 0, 'Selang angin', '8x12mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H149-SLA0004', 0, 'Selang angin', '6.5x10', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H15-CBLT0001', 0, 'Cable Tie', '3,6x300', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H150-SGG0001', 0, 'Selang Grace Gun', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H151-BTL0001', 0, 'Belt Laching', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H152-SLL0001', 0, 'Selang L ', '1\"', '', 'Bening', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H153-SLR0001', 0, 'Selang rajut', '1\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H154-CTB0001', 0, 'Brown ', '', 'Impala', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H155-SSW0001', 0, 'Selector Switch', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H155-SSW0002', 0, 'Selector Switch', '2P', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H155-SSW0003', 0, 'Selector Switch', '3P', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H155-SSW0004', 0, 'Selector Switch', 'ON-OFF', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H156-SLI0001', 0, 'Seling', '10 mm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H157-SLRY0001', 0, 'Selot Rellay', '2Y', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H158 -SPN0001', 0, 'Seng Galvalum (Spandex)', '030x4000', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H159-SHA0001', 0, 'Shank Adaptor', '4 grove', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H16-BSH0001', 0, 'Besi Holo', '20x40x6000', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H16-BSH0002', 0, 'Besi Holo', '20x40', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H16-BSH0003', 0, 'Besi Holo', '40x40', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H16-BSH0004', 0, 'Besi Holo', '50x50', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H16-BSH0005', 0, 'Besi Holo', '5x5x1.8 Meter', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H16-BSH0006', 0, 'Besi Holo', '40x20', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H160-SHK0001', 0, 'Sheel karet', 'm60', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H161-SHB0001', 0, 'Sok Besi', '1\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H161-SHD0001', 0, 'Shok Drat', '1\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H161-SHD0002', 0, 'Shok Drat', '1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H161-SHVC0001', 0, 'Shok PVC', '1.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H161-SHVC0002', 0, 'Shok PVC', '3\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H161-SHVC0003', 0, 'sok PVC', '2.5', ' 22', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H162-ELD0001', 0, 'Electric Droping Stacker rotary', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H163-PLET0001', 0, 'Palet Kayu', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H164-SBJ0001', 0, 'Sikat Baja', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H164-SBJ0002', 0, 'Sikat Baja', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H164-SBJB0001', 0, 'Sikat Baja Bulat', '2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H164-SBJG0001', 0, 'Sikat Baja Gerinda', 'Dia. 4\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H165-KSN0001', 0, 'Kasa No Drop', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H166-OR0001', 0, 'O Ring', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H167-SKO0001', 0, 'Sikat Oval', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H168-SKLR0001', 0, 'Skakelar', '', 'OB Engkel', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H169-SKMT0001', 0, 'Sketmat', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H17-BTRD0001', 0, 'Baut Roda', 'HHR SS', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H170-SKUN0001', 0, 'Skun', '10', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H170-SKUN0002', 0, 'Skun', '25', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H170-SKUN0003', 0, 'Skun ', '16-8', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H172-SCKT0001', 0, 'Socket', 'MY', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H172-SCKT0002', 0, 'Socket', 'LY', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H173-BS0001', 0, 'Baut Stainliss+Mur', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H175-SPI0001', 0, 'Spei ', '8x50cm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H175-SPI0002', 0, 'Spie', '10x10x50cm', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H176-BSPR0001', 0, 'Baut Setting Pisau Rotary', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H177-SPTR0001', 0, 'Spring Tarik', '16x2x70mm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H177-SPTR0002', 0, 'Spring Tarik', '34x26x40mm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H177-SPTR0003', 0, 'Spring Tarik', '34x26x400mm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H178-STE0001', 0, 'Steker', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H179-STKN0001', 0, 'Stop Kontak ', 'tanam', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H179-STKN0002', 0, 'Stop Kontak ', '4 Lubang', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H18-BTS0001', 0, 'Baut seng', '6mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H180-STUD0001', 0, 'Stud', 'M24', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H180-STUD0002', 0, 'Stud', 'M 12 X 1 Meter', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H181-TVC0001', 0, 'Talang PVC', '20', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H181-TVCK0001', 0, 'Talang Kotak PVC', '', 'Maspion', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H182-TREQ0001', 0, 'Tali Treqdown', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H183-TGR0001', 0, 'Tang Rifet', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H184-TID0001', 0, 'Tee Drat', '1 1/2\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H184-TID0002', 0, 'Tee Drat', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H184-TID0003', 0, 'Tee Drat', '1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H184-TIL0001', 0, 'Tee Las', '1', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H184-TIL0002', 0, 'Tee Las', '1 1/2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H184-TIL0003', 0, 'Tee Las', '2-1 1/2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H184-TIVC0001', 0, 'Tee (pvc)', '1.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H184-TIVC0002', 0, 'TEE PVC', '1.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H184-TIVC0003', 0, 'Tee PVC ', '1\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H184-TIVC0004', 0, 'Tee PVC ', '(Drat Dalam) 3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H185-THN0001', 0, 'Thinner A', '5 liter', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H186-TRI0001', 0, 'Tire Infiator', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H187-TLEG0001', 0, 'Tombol Emergency', '25', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H188-VFA0001', 0, 'VFA3130-02', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H189-VNL0001', 0, 'Vynil', '1\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H189-VNL0002', 0, 'Vynil', '1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0001', 0, 'Bearing', '6308', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0002', 0, 'Bearing', '22210E', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0003', 0, 'Bearing', '6205', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0004', 0, 'Bearing', 'UCT 210', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0005', 0, 'Bearing', '620 42PS', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0007', 0, 'Bearing', '6306', 'NTN/Blank', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0008', 0, 'Bearing', '6203', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0009', 0, 'Bearing', '6305', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0010', 0, 'Bearing', '6208', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0011', 0, 'Bearing ', 'UCHA 206', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0012', 0, 'Bearing (klaker)', '6202', 'Koyo', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0013', 0, 'Bearing (klaker)', '6300', 'Koyo', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0014', 0, 'Bearing', '6000 z', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0015', 0, 'Bearing', '6206 C3', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H19-BRG0016', 0, 'Bearing', '6208 C3', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H190-WM0001', 0, 'Water Mur', '1 1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H190-WM0002', 0, 'Water Mur', '2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H190-WMVC0001', 0, 'Water Mur PVC', '1 1/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H190-WMVC0002', 0, 'Water Mur PVC', '1\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H191-OSK0001', 0, 'Obat sekur', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H192-WRC0001', 0, 'Wrc (Kunci Seling)', 'M12', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H192-WRC0002', 0, 'Wrc (Kunci Seling)', 'M20', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H192-WRC0003', 0, 'Wrc (Kunci Seling)', 'M8', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H192-WRC0004', 0, 'Wrc (Kunci Seling)', 'M6', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H193-KPF0001', 0, 'Kelep Flange', '2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H194-FHP0001', 0, 'Frame Holder Pisau SVC', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H195-TGG0001', 0, 'Tangga Aluminium', '3 Meter', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H196-TRP0001', 0, 'Tire Presure', '', 'Tekiro', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H197-CC0001', 0, 'Circle Clips', '10s', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H198-KBL0001', 0, 'Kabel ', '2x1.5', 'Externa', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H199-O20001', 0, 'Oksigen', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H2-AC0001', 0, 'Air Cilinder SMC', 'C96SDB32-50C', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H20-PXSW0001', 0, 'Proximity Switch', '8 DC', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H200-SBK0001', 0, 'Clips Board ( Papan sabak )', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H201-TSP0001', 0, 'Tespen ', '', 'Wipro', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H202-RING0001', 0, 'Ring', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H203-SEX0001', 0, 'Shaft Exentrik', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H204-PGS0001', 0, 'Pipa Gas SCH', '40/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H205-BBR0001', 0, 'Ball Bearing', '6000z', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H206-LDG0001', 0, 'Pipa Ledeng', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H207-DYNA0001', 0, 'Dyna Bolt', '12x99', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H208-NFB0001', 0, 'No Fuse Breaker (NFB)', '100 A', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H209-KTS0001', 0, 'Klem Tip Saw', 'Gambar A', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H209-KTS0002', 0, 'Klem Tip Saw', 'Gambar B', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H21-BTF0001', 0, 'Belt Fastener', '500-2x24\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H210-KOPI0001', 0, 'Kopi', '', 'Kapal api', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H211-SCS0001', 0, 'Shaft Circular Saw', '45x500mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H212-CS0001', 0, 'Cluth Spring', 'MS 2500000-997-5515', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H213-PLTR0001', 0, 'Plitur Kayu', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H214-RTR0001', 0, 'Retainer', 'MS 250 1127-162-3000', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H215-PKBT0001', 0, 'Paku Beton', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H216-SLG0001', 0, 'Selang', '3/4\"', 'Metalic', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H217-BNG0001', 0, 'Benang', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H217-BNG0002', 0, 'Benang Boll', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H218-CTDG0001', 0, 'Dana Gloss', '0020', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H218-CTDG0002', 0, 'Dana Gloss', '0001', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H218-CTDG0003', 0, 'V Dana Elash', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H219-RKRG0001', 0, 'Roll Kerokong', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H22-BSCNP0001', 0, 'Besi CNP', '100x2,3x6000', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H22-BSCNP0002', 0, 'Besi CNP', '100x5x2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H22-BSCNP0003', 0, 'Besi CNP', '150x2,3x6000', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H22-BSCNP0004', 0, 'Besi CNP', '80x30X6000', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H220-SLHX0001', 0, 'Selang Hiprex', '2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H221-SKTM0001', 0, 'Sikat Mangkok', '3\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H222-SMPR0001', 0, 'Semprotan ', '', ' 22', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H223-EAF0001', 0, 'Element, Air Filter', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H223-EFC0001', 0, 'Element, Filter Coreless', '2.5 Dia 6\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H224-FLD0001', 0, 'Fluid', 'SRF 1/4000', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H23-BSSK0001', 0, 'Besi Siku', '50x50', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H23-BSSK0002', 0, 'Besi Siku ', '30x30', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H24-BSUNP0001', 0, 'Besi UNP', '100', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H24-BSUNP0002', 0, 'Besi UNP', '200 Ks', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H24-BSUNP0003', 0, 'Besi UNP', '80', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H25-BRBS0001', 0, 'Bor besi', '14mm', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H26-BRBT0001', 0, 'Bor Beton', 'diameter 13', 'Krisbow', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H27-BT20001', 0, 'BT2', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H28-BSI0001', 0, 'busi', '', 'Bosch', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H29-CAK0001', 0, 'Cairan Anti Karat', '', 'WD', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H3-AR0001', 0, 'Air Radiator', '', 'Yamalube', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H30-CBR0001', 0, 'Carbon brush', '325', 'Makita', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H30-CBR0002', 0, 'Carbon Brush ', '', 'Hitachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H31-PSG0001', 0, 'Pressure Gauge', '16Kg', 'Wipro', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H32-CGCH0001', 0, 'Chain Coupling', 'KC 4016', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H32-CGCH0002', 0, 'Chain Coupling', 'KC 6018', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H33-CTL0001', 0, 'Connecting Link ', 'rs 40', 'sindo', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H33-CTL0002', 0, 'Connecting Link ', 'rs 60', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H33-CTL0003', 0, 'Connecting Link ', 'rs 80', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H33-CTL0004', 0, 'Connecting Link ', 'RS 35', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H33-CTL0005', 0, 'Connecting Link ', 'RS 50', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H34-CTCL0001', 0, 'Contact Cleaner', '', 'WD', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H35-CSA0001', 0, 'Cop Selang Angin ', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H36-CPLR0001', 0, 'Coupler', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H37-CWK0001', 0, 'Cutting Keramik', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H38-CWL0001', 0, 'Cutting Wheel', '105x1,2x16mm', 'WD', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H38-CWL0002', 0, 'Cutting Whell', '355x3x25.4', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H39-KBLS0001', 0, 'Kabel las ', '50', 'Superflx', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H4-AB0001', 0, 'Amplas Bulat', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H40-DLI0001', 0, 'Dial indikator', '(blank)', 'Wipro', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H41-DMPL0001', 0, 'Dempul Besi', '', 'Sanpolac', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H42-DMBL0001', 0, 'Diamond Blade', '5\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H43-DCM0001', 0, 'Digital Clamp Meter', '(blank)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H44-DLS0001', 0, 'Dol Slate ', '380/3,3', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H45-DPD0001', 0, 'Dop Drat', '1 1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H45-DPD0002', 0, 'Dop Drat', '1 1/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H45-DPD0003', 0, 'Dop Drat', '1\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H45-DPD0004', 0, 'Dop Drat', '2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H45-DPD0005', 0, 'Dop Drat', '3\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H46-DNPL0001', 0, 'Double Naple', '1 1/2\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H46-DNPL0002', 0, 'Double Naple', '1 1/4\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H46-DNPL0003', 0, 'Double Naple', '1/2\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H46-DNPL0004', 0, 'Double Naple', '1/4', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H46-DNPL0005', 0, 'Double Naple', '3/4\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H47-PLBC0001', 0, 'Plibico ALX-AB', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H48-PLS0001', 0, 'DL', '7.5x12', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H48-PLS0002', 0, 'Plat Strip ', '4x6', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H49-ELD0001', 0, 'Double Neple Oil', '1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H49-ELD0002', 0, 'Elbow Drat', '2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H5-AB0001', 0, 'As besi ', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H50-ELL0001', 0, 'Elbow Las', '1 1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H50-ELL0002', 0, 'Elbow Las', '1\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H50-ELL0003', 0, 'Elbow Las', '1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H50-ELL0004', 0, 'Elbow Las', '3\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H50-ELL0005', 0, 'Elbow Las', '3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H51-ESL0001', 0, 'Engsel', '5\"x3,0\"x3,0mm', 'oneo', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H51-ESLB0001', 0, 'Engsel Bubut', '20 mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H51-ESLG0001', 0, 'Engsel Gerbang', '1\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H52-FNBT0001', 0, 'Fanbelt', 'B 84', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H52-FNBT0002', 0, 'Fanbelt', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H52-FNBT0003', 0, 'Van Belt', 'A56', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H53-FSR0001', 0, 'Fisher ', 'S12', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H53-FSR0002', 0, 'Fisher ', 'S8', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H54-FFLC0001', 0, 'Fitting Flow Control', '10-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H55-FSPB0001', 0, 'Fitting', 'SPB08-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H55-FSPB0002', 0, 'Fitting', 'SPB 10-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H56-FSPC0001', 0, 'Fitting', 'SPC08-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H56-FSPC0002', 0, 'Fitting', 'SPC08-03', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H56-FSPC0003', 0, 'Fitting', 'SPC 10-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H56-FSPC0004', 0, 'Fitting', 'SPC 10-03', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H56-FSPC0005', 0, 'Fitting', 'SPC 10-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H56-FSPC0006', 0, 'Fitting', 'SPC 12-03', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H56-FSPC0007', 0, 'Fitting', 'SPC 12-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H56-FSPC0008', 0, 'Fitting', 'SPC 6-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H57-FSPE0001', 0, 'Fitting', 'SPE08', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H57-FSPE0002', 0, 'Fitting', 'SPE 10', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H58-FSPL0001', 0, 'Fitting', 'SPL08-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H58-FSPL0002', 0, 'Fitting', 'SPL08-03', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H58-FSPL0003', 0, 'Fitting', 'SPL 10-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H58-FSPL0004', 0, 'Fitting', 'SPL 10-03', 'in baru 28/08/17', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H58-FSPL0005', 0, 'Fitting', 'SPL 10-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H58-FSPL0006', 0, 'Fitting', 'SPL 12-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H58-FSPL0007', 0, 'Fitting', 'SPL 6-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H58-FSPL0008', 0, 'Fitting', 'SPL 8-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H59-FSPU0001', 0, 'Fitting', 'SPU08', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H59-FSPU0002', 0, 'Fitting', 'SPU 10', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H6-AS0001', 0, 'As Shaft ', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H60-FFLC0002', 0, 'Fitting Flow Control', '10-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H60-FFLC0003', 0, 'Fitting Flow Control', '06-01', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H60-FFLC0004', 0, 'Fitting Flow Control', '06-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H61-FTL0001', 0, 'Fitting Lampu', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H62-FLBE0001', 0, 'Flat Belt Endless (GT02)', '1 mm x 16 x 455 mm/endless', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H63-GLVM0001', 0, 'Galvalum', '035x400', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H64-GRM0001', 0, 'Gayung', '', 'Maspion', 'Orange', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H65-GMBK0001', 0, 'Gembok', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H66-GRC0001', 0, 'Gerenda Compressor', '100mm/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H67-GRSN0001', 0, 'Grinding Roll Contact Drum Sander', '320x1360 mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H68-JRM0001', 0, 'Jarum ', 'M 10', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H69-KCL0001', 0, 'Kaca las', 'Bening', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H69-KCL0002', 0, 'Kaca las', 'Hitam', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H7-BGM0001', 0, 'Baling-baling glue mixer', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H70-KNCS0001', 0, 'Kancing S', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H71-KPLM0001', 0, 'Kap Lampu', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H72-KPB0001', 0, 'Kapi Besi', '4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H72-KPL0001', 0, 'Kapi Plastik', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H73-KPRB0001', 0, 'Kapur Besi', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H74-KRSK0001', 0, 'Karet Skun', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H75-KSBT0001', 0, 'Kasibot', '4mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H75-KSBT0002', 0, 'Kasibot', '4x4x8', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H76-KWL0001', 0, 'Kawat Las', 'RB-26 (2,6mm)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H76-KWL0002', 0, 'Kawat Las', 'RB-26 (3,2mm)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H76-KWL0003', 0, 'Kawat Las C I -A 1', '3.2x350mm', 'Premiarc', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H76-KWL0004', 0, 'Kawat Las', 'LB 2.6', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H76-KWLS0001', 0, 'Kawat Las Stainless', '2,6x300mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H77-BTB0001', 0, 'Baut Baja ', 'M 12x45', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H78-BTBR0001', 0, 'Baut Borek', 'M10x1,5', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H79-CSTB0001', 0, 'Castable', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H8-FLG0001', 0, 'Flange', '2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H8-FLG0002', 0, 'Flange', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H80-KN0001', 0, 'Keni ', '1 1/2\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H80-KND0001', 0, 'Keni Drat', '1 1/2\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H80-KNVC0001', 0, 'keni pvc', '1.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H80-KNVC0002', 0, 'keni pvc', '1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H80-KNVC0003', 0, 'keni pvc', '3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H80-KNVC0004', 0, 'keni pvc', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H80-KNVCD0001', 0, 'keni pvc drat dalam', '3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H81-SDL0001', 0, 'SDL Pvc', '3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H82-SEAC0001', 0, 'Seahc', '65x90x10', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H83-SSPR0001', 0, 'Selang Spiral', '2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H83-SSPR0002', 0, 'Selang Spiral', '3\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H84-KRGS0001', 0, 'Kertas Gosok/Ampelas', 'ukuran 100', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H84-KRGS0002', 0, 'Kertas Gosok/Ampelas', 'Ukuran 60', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H85-KKW0001', 0, 'Klem Kawat', '4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H85-KLM0001', 0, 'Klem', '1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H85-KLM0002', 0, 'Klem', '5\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H85-KLP0001', 0, 'Klem pipa', '1 1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H85-KLPB0001', 0, 'Klem Pipa Besi', '1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H85-KLPB0002', 0, 'Klem Pipa Besi', '3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H85-KLPB0003', 0, 'Klem Pipa Besi', '1 3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H85-KLPK0001', 0, 'Klem Pipa Knalpot', '1 1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H85-KLPK0002', 0, 'Klem Pipa Knalpot', '1 1/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H85-KLPK0003', 0, 'Klem Pipa Knalpot', '3\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H85-KLSL0001', 0, 'Klem selang', '2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H85-KLSL0002', 0, 'Klem selang', '3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H86-STEM0001', 0, 'Selang Steam', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H86-STEM0002', 0, 'Selang Steam', 'UK. 1\"x1330mm Bengkok 90', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H86-STEM0003', 0, 'Selang Steam', 'UK. 1\"x1330mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H87-SLGT0001', 0, 'Selang Timbangan', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H88-SPGU0001', 0, 'Spray Gun', 'F 75 G', 'Sagola', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H89-SPRK0001', 0, 'Sproket', 'RS 40x16T', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H89-SPRK0002', 0, 'Sproket', 'RS 60/20 T/1', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H9-BV0001', 0, 'Ball Valve', '1 1/2\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H9-BV0002', 0, 'Ball Valve', '1\"', 'onda', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H9-BV0003', 0, 'Ball Valve', '1/2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H9-BV0004', 0, 'Ball Valve', '3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H9-BV0005', 0, 'Ball Valve', '2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H90-TCD0001', 0, 'Temperatur Control Disitel', '48x48+sensor', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H91-KRN0001', 0, 'Kran', '3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H92-KS0001', 0, 'Kuas', '2\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H92-KS0002', 0, 'Kuas ', '5\"', 'Eterna', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H92-KS0003', 0, 'Kuas', '3\"', 'Eterna', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H92-KS0004', 0, 'Kuas Roll', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H93-PTBA0001', 0, 'Pak TBA', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H94-KNRP0001', 0, 'Kunci Ring Pas', '24mm', 'Tekiro', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H95-LMP0001', 0, 'Lampu', '62 Watt', 'Hannochs', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H95-LMP0002', 0, 'Lampu', '11 Watt', 'Hannochs', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H95-LMP0003', 0, 'Lampu', '10 Watt', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H95-LMP0004', 0, 'Lampu', '36 Watt', 'Philips LED', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H95-LMP0005', 0, 'Lampu', '88 watt', 'Hannochs', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H95-LMP0006', 0, 'Lampu', '52 Watt', 'Philips', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H95-LMP0007', 0, 'Lampu ', '27 Watt', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H95-LMP0008', 0, 'Lampu', '30 Watt', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H95-LMP0009', 0, 'Lampu ', '27 Watt', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H96-LMB0001', 0, 'Lem Besi', '', 'Dextone', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H96-LMCT0001', 0, 'Lem Castol', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H97-LL0001', 0, 'Lem PVC', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H98-MTB0001', 0, 'Mata bor', '4mm', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H98-MTB0002', 0, 'Mata bor', 'D00290', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H98-MTB0003', 0, 'Mata bor', '3.5mm', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H98-MTB0004', 0, 'Mata Bor ', '12\"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H98-MTB0005', 0, 'Mata Bor', '8.5', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H98-MTB0006', 0, 'Mata Bor', '10.5', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H98-MTBB0001', 0, 'Mata Bor Besi', 'dia 15 mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H98-MTBT0001', 0, 'Mata Bor Beton', '12', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H98-MTBT0002', 0, 'Mata Bor Beton', '12mmx160', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H98-MTBT0003', 0, 'Mata Bor Beton', 'K2x160', 'Toho', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('H99-OVS0001', 0, 'Over Shok', '1\"x3/4\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('HI71-SKNG0001', 0, 'Skun Garpu', '1.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('HI71-SKNG0002', 0, 'Skun Garpu', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` VALUES ('I1-TR0001', 0, 'Tali Rafia ', '', 'Natural', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I10-CTGK0001', 0, 'Centong Kayu ', '', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I11-CKSG0001', 0, 'Cikrak Seng', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I12-CRKY0001', 0, 'Crayon Kayu', '', ' 22222', 'Biru', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I13-CTTR0001', 0, 'Cutter', 'L.500', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I14-DSTP0001', 0, 'Dispenser Tape', '', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I16-FMS0001', 0, 'Face Mask', '(blank)', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I17-FRM0001', 0, 'Form Bukti Pengeluaran Kas', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I17-FRM0002', 0, 'Form Permintaan Pembelian Barang', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I2-BS0001', 0, 'Bak Stampel', '', 'Artline', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I20-IBL0001', 0, 'Isi Bulpoin', '', 'Standart', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I21-ICT0001', 0, 'Isi Cutter', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I22-IST0001', 0, 'Isi Steaples ', 'besar', 'Max', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I22-IST0002', 0, 'Isi Steaples ', 'kecil', 'Max', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I23-ISTT0001', 0, 'Isi Steaples Tembak ', 'T3-10MB', 'Max', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I24-ISL0001', 0, 'Isolasi', 'Bening', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I24-ISL0002', 0, 'Isolasi', 'Bening', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I24-ISL0003', 0, 'Isolasi', 'Listrik', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I24-ISL0004', 0, 'Isolasi', 'Kertas', ' 2222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I24-ISL0005', 0, 'Isolasi', 'Bening (Kecil)', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I24-ISL0006', 0, 'Isolasi', 'Lakban Hitam', ' 222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I26-JSHJ0001', 0, 'Jas hujan', 'Baju+celana', 'Pinguin', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I27-KBPT0001', 0, 'Kabel Printer', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I28-KMJ0001', 0, 'Kain Majun ', '', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I29-KPL0001', 0, 'Kain Pel', '', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I3-BTR0001', 0, 'Battery', 'Kotak', ' 222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I3-BTR0002', 0, 'Battery', 'Kancing', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I3-BTR0003', 0, 'Battery', 'AA', 'Energizer', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I3-BTR0004', 0, 'Battery', 'AA', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I3-BTR0005', 0, 'Battery', 'AAA', 'Alkaline', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I3-BTR0006', 0, 'Battery', 'LR-44', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I3-BTR0007', 0, 'Battery', 'LR 1130', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I3-BTR0008', 0, 'Battery', '', 'ABC', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I30-KLTR0001', 0, 'Kalkulator', 'CT-555N', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I31-KMPR0001', 0, 'Kamper', '', 'Swallow', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I32-KRTS0001', 0, 'Kertas ', 'A4', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I32-KRTS0002', 0, 'Kertas ', 'F4', 'Sidu', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I33-KRB0001', 0, 'Kertas Bufallo', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I34-KYB0001', 0, 'Keyboard', '', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I35-PBJ0001', 0, 'Pisau Baja Kecil', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I35-PBJ0002', 0, 'Pisau Baja Tanggung', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I36-LMG0001', 0, 'Lem G', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I37-MSR0001', 0, 'Masker', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I37-MSR0002', 0, 'Masker', 'Kain', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I38-MOS0001', 0, 'Mouse', '(blank)', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I4-BNDR0001', 0, 'Bendera ', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I40-P3K0001', 0, 'Obat -Obatan', 'Kapas', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I40-P3K0002', 0, 'Obat -Obatan', 'Procold', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I40-P3K0003', 0, 'Obat -Obatan', 'Perban', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I40-P3K0004', 0, 'Obat -Obatan', 'Plester', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I40-P3K0005', 0, 'Obat -Obatan', 'Minyak kayu Putih', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I40-P3K0006', 0, 'Obat -Obatan', 'Rifanol', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I40-P3K0007', 0, 'Obat -Obatan', 'Betadine', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I40-P3K0008', 0, 'Obat -Obatan', 'Diapet', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I40-P3K0009', 0, 'Obat -Obatan', 'Hansaplast', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I40-P3K0010', 0, 'Obat -Obatan', 'Insto', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I41-OTN0001', 0, 'Otener', 'besar', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I41-OTN0002', 0, 'Otener', 'kecil', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I42-PK0001', 0, 'Paku', '2\"', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I42-PK0002', 0, 'Paku', '6cm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I42-PK0003', 0, 'Paku', '4x8', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I43-PK80001', 0, 'Paku 8', '', ' 222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I44-PKS0001', 0, 'Paku S', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I45-PLIT0001', 0, 'Peluit', '', 'ACME', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I46-PGRS0001', 0, 'Penggaris', 'Kotak', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I46-PGRS0002', 0, 'Penggaris', 'Segitiga', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I46-PGRS0003', 0, 'Penggaris', '60 Cm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I47- IDC0001', 0, 'Plastik ID Card + Tali', '', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I48-PLS0001', 0, 'Plastik', '0.4x150cmx25meter', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I48-PLS0002', 0, 'Plastik', '', 'Manjur', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I48-PLS0003', 0, 'Plastik', '30x45', ' 22', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I48-PLS0004', 0, 'Plastik', '9x20', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I49-PFR0001', 0, 'Plong-Plongan', '', 'Eagle', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I5-BKF0001', 0, 'Buku Folio', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I50-MAL0001', 0, 'PPM Liberty', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I51-SBN0001', 0, 'Sabun Cuci', '', 'Mama Lemon', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I51-SBN0002', 0, 'Sabun Cuci', '', 'Rinso', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I52-HLM0001', 0, 'Safety Helmet', '', ' 2222222', 'Hijau', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I53-SPI0001', 0, 'Sapu', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I53-SPL0002', 0, 'Sapu Ijuk', '', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I53-SPL0003', 0, 'Sapu Lidi', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I54-SRTK0001', 0, 'Sarung Tangan', 'Kain', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I54-SRTT0001', 0, 'Sarung Tangan', 'Karet', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I55-SKT0001', 0, 'Sikat', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I57-SKWC0001', 0, 'Sikat Kamar Mandi', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I58-SPDL0001', 0, 'Spidol', 'kecil', 'Artline', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I58-SPDL0002', 0, 'Spidol', 'Permanent', 'Snowman', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I58-SPDL0003', 0, 'Spidol', 'Board Marker', 'Snowman', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I59-STBL0001', 0, 'Stabilo', '', ' 2222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I6-BKQ0001', 0, 'Buku Quarto', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I60-STP0001', 0, 'Steaples', '', 'Max', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I60-STPT 0001', 0, 'steapless tembak', '', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I62-SUN0001', 0, 'Suntikan', '50ml', 'One Mad', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I63-TBN0001', 0, 'Tali Ban ( karet Ban )', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I64-TPL0001', 0, 'Terpal', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I64-TPL0002', 0, 'Terpal', '6x12', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I65-TMB0001', 0, 'Timba ', 'Besar', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I65-TMB0002', 0, 'Timba ', 'Kecil', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I65-TMB0003', 0, 'Timba ', '2 g', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I65-TMB0004', 0, 'Timba ', '3 g', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I66-TNSP0001', 0, 'Tinta Spidol Permanent', '', 'Snowman', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I66-TNSP0002', 0, 'Tinta Spidol Boardmarker', '', ' 2222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I66-TNSP0003', 0, 'Tinta Spidol Permanent', '', 'Snowman', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I67-TNST0001', 0, 'Tinta Stempel', '', ' 2222', 'Merah', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I67-TNST0002', 0, 'Tinta Stempel', '', ' 3', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I68-TIPX0001', 0, 'Tipe-x', '', 'kiriko', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I69-TP0001', 0, 'Topi', '(blank)', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I7-BLPN0001', 0, 'Bulpoin', '', 'Standart', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I7-BLPN0002', 0, 'Bulpoin Batik', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I7-BLPN0003', 0, 'Bulpoin zebra', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I71-KRK0001', 0, 'Kertas karton', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I72-KBS0001', 0, 'Kebus', '', ' 222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I73-CLK0001', 0, 'Celemek Kain', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I73-CLP0001', 0, 'Celemek Perlak/Apron', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I74-BKC0001', 0, 'Buku Kecil', '', 'KIKI', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I75-APL0001', 0, 'Amplop ', 'kecil', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I75-APL0002', 0, 'Amplop ', '', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I76-PWR0001', 0, 'Pewangi Ruangan', '', 'Glade', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I8-CPM0001', 0, 'Cairan Pembersih', '', 'Mr.Muscle', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I8-CPM0002', 0, 'Cairan Pembersih', '', 'Porstex', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I81-AM0001', 0, 'Air Minum', '', 'AQUA', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I82-ASP0001', 0, 'asahan panjang', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I83-BMB0001', 0, 'Bambu', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I84-BRS0001', 0, 'Beras', '', 'Kepompong', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I85-BKW0001', 0, 'Buku Kwitansi', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I86-GLP0001', 0, 'Gula Pasir', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I87-HT0001', 0, 'HT ', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I88-JM0001', 0, 'Jam Dinding', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I89-KPK0001', 0, 'Kapak besi', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I9-MAP0001', 0, 'Stop Map', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I90-KPR0001', 0, 'Kapur Tulis', '', '', 'Putih', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I91-KRJ0001', 0, 'Keranjang kecil', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I91-KRJ0002', 0, 'Keranjang besar', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');
INSERT INTO `tb_barang` VALUES ('I92-MTR0001', 0, 'Materai', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');

-- ----------------------------
-- Table structure for tb_barang_satuan
-- ----------------------------
DROP TABLE IF EXISTS `tb_barang_satuan`;
CREATE TABLE `tb_barang_satuan`  (
  `id_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_input` datetime NOT NULL,
  PRIMARY KEY (`id_satuan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_barang_satuan
-- ----------------------------
INSERT INTO `tb_barang_satuan` VALUES (18, 'pcs', '2017-03-06 08:24:42');
INSERT INTO `tb_barang_satuan` VALUES (19, 'SET', '2017-03-06 08:24:42');
INSERT INTO `tb_barang_satuan` VALUES (20, 'BTL', '2017-03-06 08:24:42');
INSERT INTO `tb_barang_satuan` VALUES (23, 'unit', '2017-03-06 08:32:26');
INSERT INTO `tb_barang_satuan` VALUES (25, 'BUNGKUS', '2017-03-06 08:38:46');
INSERT INTO `tb_barang_satuan` VALUES (26, 'BH', '2018-09-04 09:16:30');
INSERT INTO `tb_barang_satuan` VALUES (27, 'PICK UP', '2018-09-24 16:25:38');
INSERT INTO `tb_barang_satuan` VALUES (28, 'belt', '2018-10-02 11:55:20');
INSERT INTO `tb_barang_satuan` VALUES (29, 'lembar', '2018-10-02 00:36:22');
INSERT INTO `tb_barang_satuan` VALUES (30, 'roll', '2018-10-02 00:37:01');
INSERT INTO `tb_barang_satuan` VALUES (31, 'sasasasas', '2018-10-31 20:45:49');

-- ----------------------------
-- Table structure for tb_costumer
-- ----------------------------
DROP TABLE IF EXISTS `tb_costumer`;
CREATE TABLE `tb_costumer`  (
  `id_costumer` int(11) NOT NULL AUTO_INCREMENT,
  `kode_costumer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_costumer` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `telepon` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deskripsi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_costumer`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_costumer
-- ----------------------------
INSERT INTO `tb_costumer` VALUES (1, 'C0001', 'PT CAHYA UTAMA', '0897776666', 'Surabaya', '', '', '0000-00-00 00:00:00', '');

-- ----------------------------
-- Table structure for tb_detail_po
-- ----------------------------
DROP TABLE IF EXISTS `tb_detail_po`;
CREATE TABLE `tb_detail_po`  (
  `id_detailpo` int(11) NOT NULL AUTO_INCREMENT,
  `kode_po` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_barang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harga` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detailpo`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 78 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_detail_po
-- ----------------------------
INSERT INTO `tb_detail_po` VALUES (77, 'PO/002/MII/XII/18', 'B1-ASV0001', 6, '23', 10000);
INSERT INTO `tb_detail_po` VALUES (76, 'PO/002/MII/XII/18', 'H121-PPBS0006', 5, '23', 20000);
INSERT INTO `tb_detail_po` VALUES (75, 'PO/001/MII/XII/18', 'C2-AD0001', 10, '23', 20000);
INSERT INTO `tb_detail_po` VALUES (74, 'PO/001/MII/XII/18', '80-UU0001', 10, '23', 20000);

-- ----------------------------
-- Table structure for tb_po
-- ----------------------------
DROP TABLE IF EXISTS `tb_po`;
CREATE TABLE `tb_po`  (
  `id_po` int(11) NOT NULL AUTO_INCREMENT,
  `kode_po` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_po` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_pr` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_po` date NULL DEFAULT NULL,
  `kode_vendor` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `total_po` int(11) NULL DEFAULT NULL,
  `jatuh_tempo` date NULL DEFAULT NULL,
  `uang_muka` int(11) NULL DEFAULT NULL,
  `tunai` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `paid_amount` int(11) NOT NULL,
  `modiby` int(11) NULL DEFAULT NULL,
  `modidate` datetime NULL DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ketyer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_po`, `kode_po`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 69 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_po
-- ----------------------------
INSERT INTO `tb_po` VALUES (67, 'PO/001/MII/XII/18', '001', '20180003', '2018-12-14', 'S0003', 400000, '0000-00-00', NULL, NULL, 0, 1, '2018-12-14 14:44:33', '0', '', NULL);
INSERT INTO `tb_po` VALUES (68, 'PO/002/MII/XII/18', '002', '20180003', '2018-12-14', 'S0006', 176000, '0000-00-00', NULL, NULL, 0, 1, '2018-12-14 15:50:50', '0', 'po sudah oke', NULL);

-- ----------------------------
-- Table structure for tb_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tb_supplier`;
CREATE TABLE `tb_supplier`  (
  `id_vendor` int(11) NOT NULL AUTO_INCREMENT,
  `kode_vendor` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_vendor` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `telepon` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deskripsi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_vendor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_supplier
-- ----------------------------
INSERT INTO `tb_supplier` VALUES (4, 'S0001', 'Alwi', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (5, 'S0002', 'Bachtera Indoamplas Gemilang', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (6, 'S0003', 'Best Trans Material', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (7, 'S0004', 'Budiono', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (8, 'S0005', 'Delta Motor', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (9, 'S0006', 'Depo Cara', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (10, 'S0007', 'Eka Utama Jaya', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (11, 'S0008', 'Excellchem', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (12, 'S0009', 'Excelltech', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (13, 'S0010', 'Gunung Kawi', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (14, 'S0011', 'Herry & Co', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (15, 'S0012', 'Iswara', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (16, 'S0013', 'Jaya Mulya Diesel', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (17, 'S0014', 'Kanefusa Indonesia', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (18, 'S0015', 'PAI', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (19, 'S0016', 'Pakindo JP', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (20, 'S0017', 'Pancaputra MM', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (21, 'S0018', 'Plywood Kayu Lestari', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (22, 'S0019', 'Pranidhana Samartha Amudra', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (23, 'S0020', 'Pratama Adi Jaya', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (24, 'S0021', 'Prima Jaya Packindo', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (25, 'S0022', 'Rendi Manunggal', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (26, 'S0023', 'Samudra Indah Motor', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (27, 'S0024', 'Sandang Pangan', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (28, 'S0025', 'Semangat Duta Abadi', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (29, 'S0026', 'SMC', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (30, 'S0027', 'Sudjoni', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (31, 'S0028', 'Sugeng', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (32, 'S0029', 'Suhan', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (33, 'S0030', 'Sukses Duta Pratama', '', '', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (34, 'S0031', 'Sumber Berkat', 'Jl panglima sudirman no 55-57  surabaya jawa timur', '08233445589', '', '', '0000-00-00 00:00:00', '');
INSERT INTO `tb_supplier` VALUES (35, 'S0032', 'Surya Santoso', '', '', '', '', '0000-00-00 00:00:00', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usernm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `passwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `akses_master` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'ADMINISTRATOR', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '2018-10-30 23:53:36', '');
INSERT INTO `user` VALUES (2, 'User', 'user', '68663b31bfc72ddf7691787908b1bd2b', 'user', '2017-03-07 15:06:54', '');

-- ----------------------------
-- Triggers structure for table tb_po
-- ----------------------------
DROP TRIGGER IF EXISTS `update_request`;
delimiter ;;
CREATE TRIGGER `update_request` AFTER INSERT ON `tb_po` FOR EACH ROW BEGIN

update request_order
SET status='1'
where kode_pr=New.kode_pr;

end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
