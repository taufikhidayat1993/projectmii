-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 19, 2018 at 01:36 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `accgroup`
--

CREATE TABLE IF NOT EXISTS `accgroup` (
  `groupid` int(10) NOT NULL AUTO_INCREMENT,
  `kode_group` varchar(100) NOT NULL,
  `nama_group` varchar(100) NOT NULL DEFAULT '',
  `modidate` datetime NOT NULL,
  `modiby` varchar(10) NOT NULL,
  PRIMARY KEY (`groupid`) USING BTREE,
  UNIQUE KEY `id` (`groupid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Dumping data for table `accgroup`
--


-- --------------------------------------------------------

--
-- Table structure for table `accheader`
--

CREATE TABLE IF NOT EXISTS `accheader` (
  `headerid` int(11) NOT NULL AUTO_INCREMENT,
  `kode_header` varchar(10) NOT NULL,
  `nama_header` varchar(300) NOT NULL,
  `kode_group` varchar(8) NOT NULL,
  `keterangan` varchar(300) DEFAULT NULL,
  `modiby` varchar(30) DEFAULT NULL,
  `modidate` datetime NOT NULL,
  PRIMARY KEY (`headerid`) USING BTREE,
  UNIQUE KEY `id` (`headerid`) USING BTREE,
  KEY `id2` (`kode_group`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=27 ;

--
-- Dumping data for table `accheader`
--

INSERT INTO `accheader` (`headerid`, `kode_header`, `nama_header`, `kode_group`, `keterangan`, `modiby`, `modidate`) VALUES
(1, '1-100', 'AKTIVA LANCAR', '1-000', NULL, '1', '2018-11-30 00:00:00'),
(2, '1-200', 'AKTIVA TETAP', '1-000', NULL, '1', '2018-11-30 00:00:00'),
(3, '1-300', 'AKTIVA LAIN-LAIN', '1-000', NULL, '1', '2018-11-30 00:00:00'),
(4, '2-100', 'KEWAJIBAN LANCAR', '2-000', NULL, '1', '2018-11-30 00:00:00'),
(5, '3-100', 'Modal Usaha', '3-000', NULL, '1', '2018-11-30 00:00:00'),
(6, '3-200', 'Laba Ditahan', '3-000', NULL, '1', '2018-11-30 00:00:00'),
(7, '4-100', 'Penjualan Barang', '4-000', NULL, '1', '2018-11-30 00:00:00'),
(8, '4-200', 'Retur Penjualan Barang', '4-000', NULL, '1', '2018-11-30 00:00:00'),
(9, '5-100', 'Pemakaian Bahan Baku', '5-000', NULL, '1', '2018-11-30 00:00:00'),
(10, '5-200', 'Tenaga Kerja Langsung', '5-000', NULL, '1', '2018-11-30 00:00:00'),
(11, '5-300', 'Biaya Overhead Pabrik', '5-000', NULL, '1', '2018-11-30 00:00:00'),
(12, '5-400', 'Persediaan Awal Barang dalam Proses', '5-000', NULL, '1', '2018-11-30 00:00:00'),
(13, '5-500', 'Persediaan Akhir Barang dalam Proses', '5-000', NULL, '1', '2018-11-30 00:00:00'),
(14, '5-600', 'Persediaan Awal Barang Jadi', '5-000', NULL, '1', '2018-11-30 00:00:00'),
(15, '5-700', 'Persediaan Akhir Barang Jadi', '5-000', NULL, '1', '2018-11-30 00:00:00'),
(16, '6-100', 'Raw Material', '6-000', NULL, '1', '2018-11-30 00:00:00'),
(17, '6-200', 'Glue', '6-000', NULL, '1', '2018-11-30 00:00:00'),
(18, '6-300', 'Labour', '6-000', NULL, '1', '2018-11-30 00:00:00'),
(19, '6-400', 'Main Material', '6-000', NULL, '1', '2018-11-30 00:00:00'),
(20, '6-500', 'Supllies', '6-000', NULL, '1', '2018-11-30 00:00:00'),
(21, '6-600', 'Electrical', '6-000', NULL, '1', '2018-11-30 00:00:00'),
(22, '6-700', 'Mantenance & Repair', '6-000', NULL, '1', '2018-11-30 00:00:00'),
(23, '6-800', 'Administration Expense', '6-000', NULL, '1', '2018-11-30 00:00:00'),
(24, '6-900', 'Boiler', '6-000', NULL, '1', '2018-11-30 00:00:00'),
(25, '7-100', 'Pendapatan Lain-lain Diluar Usaha', '7-000', NULL, '1', '2018-11-30 00:00:00'),
(26, '7-200', 'Biaya Lain-lain Diluar Usaha', '7-000', NULL, '1', '2018-11-30 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `accjurnal`
--

CREATE TABLE IF NOT EXISTS `accjurnal` (
  `kode_jurnal` varchar(30) NOT NULL DEFAULT '',
  `no_po` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `automated` char(1) NOT NULL,
  `posted` char(1) NOT NULL,
  `modiby` varchar(30) NOT NULL,
  `modidate` datetime NOT NULL,
  PRIMARY KEY (`kode_jurnal`),
  UNIQUE KEY `id` (`kode_jurnal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accjurnal`
--


-- --------------------------------------------------------

--
-- Table structure for table `accjurnaldetail`
--

CREATE TABLE IF NOT EXISTS `accjurnaldetail` (
  `id_jurnal` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `kode_account` varchar(30) NOT NULL,
  `source` varchar(40) NOT NULL,
  `source_no` varchar(20) NOT NULL,
  `keterangan` varchar(300) NOT NULL DEFAULT '',
  `kurs` double(15,2) NOT NULL,
  `debet` int(8) NOT NULL,
  `kredit` int(10) NOT NULL,
  `cek` char(1) NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` int(11) NOT NULL,
  PRIMARY KEY (`id_jurnal`),
  KEY `id2` (`id_jurnal`,`kode_account`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=102 ;

--
-- Dumping data for table `accjurnaldetail`
--

INSERT INTO `accjurnaldetail` (`id_jurnal`, `tanggal`, `kode_account`, `source`, `source_no`, `keterangan`, `kurs`, `debet`, `kredit`, `cek`, `modidate`, `modiby`) VALUES
(97, '2018-12-19', '6-403', 'PI', 'PI-002-MII-XII-18', '--', 0.00, 2500000, 0, '', '2018-12-19 09:22:28', 1),
(98, '2018-12-19', '6-507', 'PI', 'PI-002-MII-XII-18', '--', 0.00, 3000000, 0, '', '2018-12-19 09:22:28', 1),
(99, '2018-12-19', '2-110', 'PI', 'PI-002-MII-XII-18', '--', 0.00, 0, 5500000, '', '2018-12-19 09:22:29', 1),
(100, '2018-12-19', '2-130', 'PI', 'PI-002-MII-XII-18', '--', 0.00, 550000, 0, '', '2018-12-19 09:22:29', 1),
(101, '2018-12-19', '2-120', 'PI', 'PI-002-MII-XII-18', '--', 0.00, 0, 550000, '', '2018-12-19 09:22:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `kode_account` varchar(30) NOT NULL DEFAULT '',
  `nama_account` varchar(300) NOT NULL,
  `kode_header` varchar(30) NOT NULL,
  `matauangid` varchar(30) NOT NULL,
  `tipe` varchar(10) NOT NULL,
  `modiby` varchar(30) NOT NULL,
  `modidate` datetime NOT NULL,
  PRIMARY KEY (`kode_account`) USING BTREE,
  UNIQUE KEY `id` (`kode_account`) USING BTREE,
  KEY `id2` (`kode_header`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`kode_account`, `nama_account`, `kode_header`, `matauangid`, `tipe`, `modiby`, `modidate`) VALUES
('1-111', 'Kas Kecil', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-121', 'Bank BCA', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-122', 'Bank Bukopin', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-131', 'Piutang Dagang', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-132', 'Cadangan Kerugian Piutang', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-133', 'Piutang Karyawan', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-141', 'Persediaan Barang Jadi ', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-142', 'Persediaan Barang dalam Proses ', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-143', 'Persediaan Bahan Baku (Log)', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-144', 'Persediaan Bahan Penolong', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-145', 'Persediaan Barang/Spare Parts', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-146', 'Biaya Dibayar Dimuka', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-151', 'Sewa Dibayar Dimuka', '1-100', '', 'D', '1', '2018-11-30 00:00:00'),
('1-211', 'Tanah', '1-200', '', 'D', '1', '2018-11-30 00:00:00'),
('1-212', 'Bangunan', '1-200', '', 'D', '1', '2018-11-30 00:00:00'),
('1-213', 'Mesin', '1-200', '', 'D', '1', '2018-11-30 00:00:00'),
('1-214', 'Kendaraan', '1-200', '', 'D', '1', '2018-11-30 00:00:00'),
('1-215', 'Peralatan Kantor', '1-200', '', 'D', '1', '2018-11-30 00:00:00'),
('1-216', 'Akum. Penyusutan Bangunan', '1-200', '', 'D', '1', '2018-11-30 00:00:00'),
('1-217', 'Akum. Penyusutan Mesin', '1-200', '', 'D', '1', '2018-11-30 00:00:00'),
('1-218', 'Akum. Penyusutan Kendaraan', '1-200', '', 'D', '1', '2018-11-30 00:00:00'),
('1-219', 'Akum. Penyusutan Peralatan Kantor', '1-200', '', 'D', '1', '2018-11-30 00:00:00'),
('1-310', 'Bangunan Dalam Proses', '1-300', '', 'D', '1', '2018-11-30 00:00:00'),
('1-311', 'Pagar Pabrik', '1-300', '', 'D', '1', '2018-11-30 00:00:00'),
('1-312', 'Workshop', '1-300', '', 'D', '1', '2018-11-30 00:00:00'),
('1-313', 'Kantor', '1-300', '', 'D', '1', '2018-11-30 00:00:00'),
('1-314', 'Pabrik', '1-300', '', 'D', '1', '2018-11-30 00:00:00'),
('2-110', 'Hutang Dagang', '2-100', '', 'K', '1', '2018-11-30 00:00:00'),
('2-120', 'Hutang Pajak', '1', '', 'Kredit', '1', '2018-11-30 00:00:00'),
('2-130', 'PPN Masukan', '1', '', 'Debet', '1', '2018-11-30 00:00:00'),
('2-140', 'Hutang Lancar Lainnya', '2-100', '', 'K', '1', '2018-11-30 00:00:00'),
('2-210', 'Hutang Jangka Panjang', '2-200', '', 'K', '1', '2018-11-30 00:00:00'),
('4-101', 'Plywood', '4-100', '', 'K', '1', '2018-11-30 00:00:00'),
('4-102', 'Veneer / Face Back', '4-100', '', 'K', '1', '2018-11-30 00:00:00'),
('4-103', 'Bare Core', '4-100', '', 'K', '1', '2018-11-30 00:00:00'),
('4-199', 'Lainnya', '4-100', '', 'K', '1', '2018-11-30 00:00:00'),
('6-101', 'Log', '6-100', '', 'D', '1', '2018-11-30 00:00:00'),
('6-102', 'Veneer / Face Back', '6-100', '', 'D', '1', '2018-11-30 00:00:00'),
('6-103', 'Bare Core', '6-100', '', 'D', '1', '2018-11-30 00:00:00'),
('6-201', 'Urea Resin', '6-200', '', 'D', '1', '2018-11-30 00:00:00'),
('6-202', 'Melamine Resin', '6-200', '', 'D', '1', '2018-11-30 00:00:00'),
('6-203', 'Phenol Resin', '6-200', '', 'D', '1', '2018-11-30 00:00:00'),
('6-204', 'Hardener', '6-200', '', 'D', '1', '2018-11-30 00:00:00'),
('6-205', 'Cather', '6-200', '', 'D', '1', '2018-11-30 00:00:00'),
('6-206', 'Tepung Industry', '6-200', '', 'D', '1', '2018-11-30 00:00:00'),
('6-207', 'Glue', '6-200', '', 'Debet', '1', '2018-12-13 14:53:22'),
('6-301', 'Gaji Karyawan', '6-300', '', 'D', '1', '2018-11-30 00:00:00'),
('6-302', 'THR', '6-300', '', 'D', '1', '2018-11-30 00:00:00'),
('6-303', 'Uang Lembur', '6-300', '', 'D', '1', '2018-11-30 00:00:00'),
('6-304', 'Biaya Makan Karyawan', '6-300', '', 'D', '1', '2018-11-30 00:00:00'),
('6-305', 'TK Borongan', '6-300', '', 'D', '1', '2018-11-30 00:00:00'),
('6-306', 'Biaya Pengobatan Karyawan', '6-300', '', 'D', '1', '2018-11-30 00:00:00'),
('6-399', 'Biaya Lainnya', '6-300', '', 'D', '1', '2018-11-30 00:00:00'),
('6-401', 'Spur Knife', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-402', 'Clipper Knife', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-403', 'Rotary Knife', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-404', 'Nose Bar', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-405', 'Diamond Wheel', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-406', 'Honing Stone', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-407', 'CB Knife', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-408', 'Tip.S.Joint SVC', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-409', 'Tip S.DS', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-410', 'Teteron String', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-411', 'Hotmelt', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-412', 'Amplas Scraf', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-413', 'Gummed Tape', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-414', 'Dempul', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-415', 'Amplas Sander', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-416', 'Contact Drum', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-417', 'Pinch Roll Sander', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-418', 'Rubber Roll', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-419', 'Doctor Roll', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-420', 'Solar', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-421', 'Softener Boiler', '6-400', '', 'D', '1', '2018-11-30 00:00:00'),
('6-501', 'ATK', '6-500', '', 'D', '1', '2018-11-30 00:00:00'),
('6-502', 'Alat Safety', '6-500', '', 'D', '1', '2018-11-30 00:00:00'),
('6-503', 'Alat Kerja Produksi', '6-500', '', 'D', '1', '2018-11-30 00:00:00'),
('6-504', 'Alat Packing', '6-500', '', 'D', '1', '2018-11-30 00:00:00'),
('6-505', 'Pelumas', '6-500', '', 'D', '1', '2018-11-30 00:00:00'),
('6-506', 'Spare Part', '6-500', '', 'D', '1', '2018-11-30 00:00:00'),
('6-507', 'Alat Pendukung Kerja Maintenace', '6-500', '', 'D', '1', '2018-11-30 00:00:00'),
('6-508', 'Instalasi Listrik', '6-500', '', 'D', '1', '2018-11-30 00:00:00'),
('6-599', 'Supplies', '6-500', '', 'D', '1', '2018-11-30 00:00:00'),
('6-601', 'PLN', '6-600', '', 'D', '1', '2018-11-30 00:00:00'),
('6-602', 'Genset', '6-600', '', 'D', '1', '2018-11-30 00:00:00'),
('6-701', 'Mantenance & Repair', '6-700', '', 'D', '1', '2018-11-30 00:00:00'),
('6-801', 'Transport / Perjalanan Dinas', '6-800', '', 'D', '1', '2018-11-30 00:00:00'),
('6-802', 'Telpon & Air', '6-800', '', 'D', '1', '2018-11-30 00:00:00'),
('6-803', 'Pemeliharaan & Perbaikan', '6-800', '', 'D', '1', '2018-11-30 00:00:00'),
('6-804', 'Penjualan & Pemasaran', '6-800', '', 'D', '1', '2018-11-30 00:00:00'),
('6-805', 'Jasa Pengiriman', '6-800', '', 'D', '1', '2018-11-30 00:00:00'),
('6-806', 'Cetak / Foto copy', '6-800', '', 'D', '1', '2018-11-30 00:00:00'),
('6-807', 'Jasa Pihak ketiga', '6-800', '', 'D', '1', '2018-11-30 00:00:00'),
('6-808', 'Sewa', '6-800', '', 'D', '1', '2018-11-30 00:00:00'),
('6-809', 'Pendidikan & Pelatihan', '6-800', '', 'D', '1', '2018-11-30 00:00:00'),
('6-810', 'Pajak (PBB, Pajak Kendaraan)', '6-800', '', 'D', '1', '2018-11-30 00:00:00'),
('6-811', 'BBM', '6-800', '', 'D', '1', '2018-11-30 00:00:00'),
('6-899', 'Lainnya', '6-800', '', 'D', '1', '2018-11-30 00:00:00'),
('6-901', 'Bahan Bakar', '6-900', '', 'D', '1', '2018-11-30 00:00:00'),
('6-902', 'Chemical', '6-900', '', 'D', '1', '2018-11-30 00:00:00'),
('6-903', 'Garam', '6-900', '', 'D', '1', '2018-11-30 00:00:00'),
('6-990', 'Penyusutan', '6-900', '', '', '1', '2018-11-30 00:00:00'),
('6-991', 'Penyusutan', '6-900', '', 'D', '1', '2018-11-30 00:00:00'),
('6-999', 'Lainnya', '6-900', '', 'D', '1', '2018-11-30 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `accsource`
--

CREATE TABLE IF NOT EXISTS `accsource` (
  `kode_source` varchar(10) NOT NULL,
  `nama_source` varchar(100) NOT NULL,
  PRIMARY KEY (`kode_source`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accsource`
--

INSERT INTO `accsource` (`kode_source`, `nama_source`) VALUES
('PI', 'Purchase Invoice'),
('PP', 'Purchase Payment');

-- --------------------------------------------------------

--
-- Table structure for table `brgkategori`
--

CREATE TABLE IF NOT EXISTS `brgkategori` (
  `kategori_id` int(30) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) NOT NULL,
  `modiby` varchar(30) NOT NULL,
  `modidate` datetime NOT NULL,
  PRIMARY KEY (`kategori_id`) USING BTREE,
  UNIQUE KEY `id` (`kategori_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- Dumping data for table `brgkategori`
--

INSERT INTO `brgkategori` (`kategori_id`, `nama_kategori`, `modiby`, `modidate`) VALUES
(1, 'Alat Tulis Kantor', '1', '2018-11-13 10:05:40'),
(3, 'Bahan Baku', '1', '2018-11-14 08:56:05');

-- --------------------------------------------------------

--
-- Table structure for table `brgsatuan`
--

CREATE TABLE IF NOT EXISTS `brgsatuan` (
  `satuan_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(10) NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` varchar(50) NOT NULL,
  PRIMARY KEY (`satuan_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=31 ;

--
-- Dumping data for table `brgsatuan`
--

INSERT INTO `brgsatuan` (`satuan_id`, `nama_satuan`, `modidate`, `modiby`) VALUES
(18, 'PCS', '2017-03-06 08:24:42', ''),
(19, 'SET', '2017-03-06 08:24:42', ''),
(20, 'BTL', '2017-03-06 08:24:42', ''),
(23, 'UNIT', '2017-03-06 08:32:26', ''),
(25, 'BUNGKUS', '2017-03-06 08:38:46', ''),
(26, 'BH', '2018-09-04 09:16:30', ''),
(27, 'PICK UP', '2018-09-24 16:25:38', ''),
(28, 'BELT', '2018-10-02 11:55:20', ''),
(29, 'LEMBAR', '2018-10-02 00:36:22', ''),
(30, 'ROLL', '2018-10-02 00:37:01', '');

-- --------------------------------------------------------

--
-- Table structure for table `detail_request_order`
--

CREATE TABLE IF NOT EXISTS `detail_request_order` (
  `id_request_order` int(11) NOT NULL AUTO_INCREMENT,
  `kode_pr` varchar(10) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `qty` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  PRIMARY KEY (`id_request_order`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=45 ;

--
-- Dumping data for table `detail_request_order`
--

INSERT INTO `detail_request_order` (`id_request_order`, `kode_pr`, `kode_barang`, `nama_barang`, `qty`, `satuan`) VALUES
(43, '20180003', 'H121-PPBS0006', 'Pipa Besi', 5, '23'),
(38, '20180002', 'BRG0000000001', 'semen gresik', 50, 'unit'),
(37, '20180002', 'BRG0000000002', 'semen surabaya', 50, 'unit'),
(44, '20180003', 'B1-ASV0001', 'Amplas Scraf Veneer', 6, '23');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payment`
--

CREATE TABLE IF NOT EXISTS `purchase_payment` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `no_pi` varchar(30) NOT NULL DEFAULT '',
  `form_no` int(5) NOT NULL,
  `kode_vendor` varchar(30) NOT NULL DEFAULT '',
  `total_payment` int(11) NOT NULL,
  `keterangan` varchar(300) NOT NULL DEFAULT '',
  `cetak` char(1) NOT NULL DEFAULT '',
  `modiby` varchar(30) NOT NULL DEFAULT '',
  `modidate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_payment`
--


-- --------------------------------------------------------

--
-- Table structure for table `request_order`
--

CREATE TABLE IF NOT EXISTS `request_order` (
  `id_request` int(11) NOT NULL AUTO_INCREMENT,
  `kode_pr` varchar(10) NOT NULL,
  `tgl_pr` date NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id_request`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=75 ;

--
-- Dumping data for table `request_order`
--

INSERT INTO `request_order` (`id_request`, `kode_pr`, `tgl_pr`, `keterangan`, `modidate`, `modiby`, `status`) VALUES
(71, '20180002', '2018-10-29', 'dadadadada', '2018-10-29 15:35:04', 1, '0'),
(74, '20180003', '2018-12-14', 'tolong di acc', '2018-12-14 15:48:27', 1, '1'),
(73, '20180003', '2018-12-13', 'Request', '2018-12-13 12:56:52', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE IF NOT EXISTS `tb_barang` (
  `kode_barang` varchar(30) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `spek` varchar(70) NOT NULL,
  `merk` varchar(70) NOT NULL,
  `warna` varchar(20) NOT NULL,
  `deskripsi` text NOT NULL,
  `tgl_input` date NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` double(10,2) NOT NULL,
  `kategori_id` char(5) NOT NULL,
  `kode_account` varchar(10) NOT NULL,
  `jml_stok` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  PRIMARY KEY (`kode_barang`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `id_barang`, `nama_barang`, `spek`, `merk`, `warna`, `deskripsi`, `tgl_input`, `harga_beli`, `harga_jual`, `kategori_id`, `kode_account`, `jml_stok`, `satuan`) VALUES
('15-DCKP0001', 0, 'Document Keeper ', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('18-KST0001', 0, 'Keset', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('19-TAS0001', 0, 'Tas Samping', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('25-WDG0001', 0, 'Wedung Ret', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('56-PLK0001', 0, 'Plastik Kresek', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('61-RSP0001', 0, 'Resplang Garuda', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('70-STA0001', 0, 'Stempel Angka', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('77-ST0001', 0, 'Stempel', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('78-TTM0001', 0, 'Tali tampar', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('79-TSU0001', 0, 'Tissue', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('80-UU0001', 0, 'Umbul-Umbul Garuda', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('A1-GW0001', 0, 'Grinding Whell', '255x100x205', 'Takakura', '', '', '0000-00-00', 0, 0.00, '', '6-403', 0, '23'),
('A2-HS0001', 0, 'Honing Stone', '185x62x15 #8000', 'Sun Tiger', '', '', '0000-00-00', 0, 0.00, '', '6-406', 0, '23'),
('A2-HS0002', 0, 'Honing Stone', '207x66x32 #2500', 'King', '', '', '0000-00-00', 0, 0.00, '', '6-406', 0, '23'),
('A3-RTKN0001', 0, 'Rotary Knife Spindles', '1500x180x16', 'Lion', '', '', '0000-00-00', 0, 0.00, '', '6-403', 0, '23'),
('B1-ASV0001', 0, 'Amplas Scraf Veneer', '', 'Bigchampion', '', '', '0000-00-00', 0, 0.00, '', '6-412', 0, '23'),
('B1-ASV0002', 0, 'Amplas Scraf Veneer', '', 'Deerfos (P40)', '', '', '0000-00-00', 0, 0.00, '', '6-412', 0, '23'),
('B2-GMTP0001', 0, 'Gummed Tape', '', 'Green leaf', '', '', '0000-00-00', 0, 0.00, '', '6-413', 0, '23'),
('B3-HTML0001', 0, 'Hot Meal/Inmelt', '', ' 222', '', '', '0000-00-00', 0, 0.00, '', '6-412', 0, '23'),
('B4-TTS0001', 0, 'Tetoron String', 'BHT 1000-250-P Type 500Z', ' ', ' ', '', '0000-00-00', 0, 0.00, '', '6-412', 0, '23'),
('C1 -SNPR00014', 0, 'Amplas X288', 'A100', 'Bigchampion', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR0001', 0, 'Amplas (sample)', 'A80 50,00mmx1220,00mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR00010', 0, 'Sand Paper ', 'F299 A0 A240 1350.00mm x 2800.00mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR00011', 0, 'Sand Paper ', 'P240 1350x2800', 'Deerfoss', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR00012', 0, 'Sand Paper ', 'F299 A0 A320 1350.00mm x 2800.00mm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR00013', 0, 'Sand Paper ', '320', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR0002', 0, 'Sand Paper ', 'F299 A0 A180 1350.00mm x 2800.00mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR0003', 0, 'Amplas Deer XA 345 (sample)', 'P180 1350x2800', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR0004', 0, 'Amplas F299', 'A180', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR0005', 0, 'Sand Paper ', 'P180 1350x2800', 'Deerfoss', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR0006', 0, 'Sand Paper ', 'F299 A0 A180 1350.00mm x 2800.00mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR0007', 0, 'Sand Paper (sander Finish)', '180', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR0008', 0, 'Sand Paper ', 'F299 A0 A240 1350.00mm x 2800.00mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C1-SNPR0009', 0, 'Amplas F299', 'A240', '', '', '', '0000-00-00', 0, 0.00, '', '6-415', 0, '23'),
('C2-AD0001', 0, 'Adhesive ', 'VA-0601', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-207', 0, '23'),
('C3-DMR0001', 0, 'Dempul Meranti', '', ' 2', 'Merah', '', '0000-00-00', 0, 0.00, '', '6-414', 0, '23'),
('C3-DMR0002', 0, 'Dempul Meranti', '', ' 22', 'Kuning', '', '0000-00-00', 0, 0.00, '', '6-414', 0, '23'),
('C4-ML0001', 0, 'Meal/Kalsium', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '', 0, '23'),
('C5-PPD0001', 0, 'Pigmen Powder', '', ' 2', 'Merah', '', '0000-00-00', 0, 0.00, '', '', 0, '23'),
('C5-PPD0002', 0, 'Pigmen Powder', '', ' 22', 'Hitam', '', '0000-00-00', 0, 0.00, '', '', 0, '23'),
('C6-CCP0001', 0, 'Tepung Batok (CCP)', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-206', 0, '23'),
('D1-AD0001', 0, 'Adhesive ', 'UA-125', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-207', 0, '23'),
('D1-AD0002', 0, 'Adhesive ', 'UA-125 R', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-207', 0, '23'),
('D1-AD0003', 0, 'Adhesive ', 'MA-204', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-207', 0, '23'),
('D2-HRD0001', 0, 'Hardener', 'HU-12', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-204', 0, '23'),
('D2-HRD0002', 0, 'Hardener', 'HU-200 (Catcher)', '', '', '', '0000-00-00', 0, 0.00, '', '6-204', 0, '23'),
('D2-HRD0003', 0, 'Hardener', 'HU-17', ' 222', '', '', '0000-00-00', 0, 0.00, '', '6-204', 0, '23'),
('D3-PWTX0001', 0, 'Pewarna Textile', '', 'Wantex', '', '', '0000-00-00', 0, 0.00, '', '', 0, '23'),
('D4-TEP0001', 0, 'Tepung Industri', '', 'Three Leaves', '', '', '0000-00-00', 0, 0.00, '', '6-206', 0, '23'),
('E1-KLG0001', 0, 'Klem Galvanis', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23'),
('E2-KLSG0001', 0, 'Klem Seng', '', ' 2222', '', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23'),
('E3-PLK0001', 0, 'Palet Kayu', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23'),
('E4-PLPE0001', 0, 'Plastik PE', '05x150x100mtr', ' 22', '', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23'),
('E5-PET0002', 0, 'Striping Band (Tali Packing)', '15.5 x 1mm', ' 2222222', 'Hijau', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23'),
('E6-LL0001', 0, 'Lilin', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23'),
('E7-SPH0001', 0, 'Siku Plastik Hitam', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-504', 0, '23'),
('F1-EXL0001', 0, 'Excell Boiler Water', 'B200', '', '', '', '0000-00-00', 0, 0.00, '', '6-900', 0, '23'),
('F1-EXL0002', 0, 'Excell Boiler Water', 'B300', '', '', '', '0000-00-00', 0, 0.00, '', '6-900', 0, '23'),
('F1-EXL0003', 0, 'Excell Boiler Water', 'HL', '', '', '', '0000-00-00', 0, 0.00, '', '6-900', 0, '23'),
('F2-PLB0001', 0, 'Plibico', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-900', 0, '23'),
('F3-GRM0001', 0, 'Garam Boiler', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-900', 0, '23'),
('G1- SLR 0001', 0, 'SOLAR', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-420', 0, '23'),
('H1-AA0001', 0, 'Air Aki', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H10-BT0001', 0, 'Baut', 'M 14x40 (kunci 22)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H10-BT0002', 0, 'Baut', 'M 16x30 (K24)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H10-BT0003', 0, 'Baut', 'M 6x25', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H10-BT0004', 0, 'Baut', 'M 6x35 (K10)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H10-BT0005', 0, 'Baut', 'M 8x24 (K12)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H10-BT0006', 0, 'Baut', 'm10x65', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H10-BT0007', 0, 'Baut', '10x35', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H10-BT0008', 0, 'Baut', '8x35', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H10-BT0009', 0, 'Baut ', 'L 8x35', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H10-BT0010', 0, 'Baut ', 'M 10x25', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H10-BT0011', 0, 'Baut', '6x30', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H100-OVL0001', 0, 'Over Lood', '8', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H101-MCGK0001', 0, 'Mata Circle (Grenda Kayu)', 'F X 24T', 'Makita', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H102-MPJS0001', 0, 'Mata pisau jigsaw', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H103-MCB0001', 0, 'MCB ', '20 Ampere', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H103-MCB0002', 0, 'MCB ', 'NF63-CV', 'Mitsubshi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H104-MYRM0001', 0, 'Minyak Rem', '1000ml', 'Prestone', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H105-MTR0001', 0, 'Motor', '3HP 4P 3PHS', 'Teco', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H105-MTRS0001', 0, 'Motor Sirine', '220 V', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H106-OMM0001', 0, 'Outside Micrometer', '(0-25mm)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H107-MNT0001', 0, 'Mounting', 'C96SDB40-100', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H107-MNT0002', 0, 'Mounting', 'C96SDB50-100', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H107-MNT0003', 0, 'Mounting', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H107-MNTO0001', 0, 'Mounting Ocilation Sander Finish', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H108-MUR0001', 0, 'Mur', '10 (K14)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H108-MUR0002', 0, 'Mur', '14 (K22)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H108-MUR0003', 0, 'Mur', '16 (K24)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H108-MUR0004', 0, 'Mur', 'M24', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H108-MUR0005', 0, 'Mur ', 'M 10x1,5', ' ', 'Putih', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H108-MUR0006', 0, 'Mur ', 'M16', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H108-MURB0001', 0, 'Mur Baja', '10', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H108-MURB0002', 0, 'Mur Baja', 'M 16', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H109-PTSR0001', 0, 'Photo sensor', 'BRP 200', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H11-BFS0001', 0, 'Baut Fisher', 'K14', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H11-BFS0002', 0, 'Baut Fisher', 'K8', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H110-NPLG0001', 0, 'Naple Grease', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H111-OFL0001', 0, 'Offset Link', 'RS 50', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H111-OFL0002', 0, 'Offset Link ', 'rs 40', 'Hitachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H111-OFL0003', 0, 'Offset Link ', 'rs 60', 'Hitachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H111-OFL0004', 0, 'Offset Link ', 'rs 80', 'Hitachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H111-OFL0005', 0, 'Offset Link ', 'RS 35', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H112-OLI0001', 0, 'Oli', 'Turalic 52', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H112-OLI0002', 0, 'Oli', 'Meditran S', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H112-OLI0003', 0, 'Oli', '2T', 'Castrol', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H113-OVPL0001', 0, 'Over Plat ( Plat Kunci )', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H114-PBV0001', 0, 'P.B.Oval', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H115-PNB0001', 0, 'Panel box', '30x40x15', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H116-PHSC0001', 0, 'Pangkon holder Pisau SVC', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H117-PG0001', 0, 'Pegangan', '5"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H118-PLMG0001', 0, 'Pelampung', 'DP 90', 'Dupon', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H118-PLMG0002', 0, 'Pelampung', 'RD.99OR', 'JP', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H119-PSVL0001', 0, 'Pheumatic Selenoid Valve', 'N3V210-08 AC220V', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H12-BTL0001', 0, 'Baut L', 'M16x130', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H12-BTL0002', 0, 'Baut L', '8x100', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H12-BTL0003', 0, 'Baut L', '10x40', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H12-BTL0004', 0, 'Baut L', '8x35', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H12-BTL0005', 0, 'Baut L', '10x75', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H12-BTL0006', 0, 'Baut L', '16x90', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H12-BTLH0001', 0, 'Baut L (high tensile)', 'M 6x40', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H120-PLBK0001', 0, 'Pillow Block', 'UCF 206 dia 30', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H120-PLBK0002', 0, 'Pillow Block', 'UCF 210 dia 50', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H120-PLBK0003', 0, 'Pillow Block', 'UCP 206 dia 30', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H120-PLBK0004', 0, 'Pillow Block', 'UCFL 204 dia 20', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H120-PLBK0005', 0, 'Pillow Block', 'UCP 209 ', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H120-PLBK0006', 0, 'Pillow Block', 'UCF 209 ', 'FYN', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H120-PLBK0007', 0, 'Pillow Block', 'UCP 210 dia 50', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H120-PLBK0008', 0, 'Pillow Block', 'UCHA 206', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H120-PLBK0009', 0, 'Pillow Block', 'UCP205', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H120-PLBK0010', 0, 'Pillow Block', 'UCP 210 50mm', 'NIS', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H121-PPBS0001', 0, 'Pipa Besi', '1 1/2"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H121-PPBS0002', 0, 'Pipa Besi', '1"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H121-PPBS0003', 0, 'Pipa Besi', '1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H121-PPBS0004', 0, 'Pipa Besi', '2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H121-PPBS0005', 0, 'Pipa Besi', '3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H121-PPBS0006', 0, 'Pipa Besi', '4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H121-PPBS0007', 0, 'Pipa Besi', '4x6 mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H122-PPVC0001', 0, 'Pipa PVC', '1"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H122-PPVC0002', 0, 'Pipa PVC', '3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H122-PPVC0003', 0, 'Pipa PVC', '', 'Power Max', 'Putih', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H122-PPVC0004', 0, 'Pipa PVC', '2.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H123-PRTK0001', 0, 'Pir Tarik ', '22x15', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H124-PLTE0001', 0, 'Plat ezer', '1.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H124-PLTE0002', 0, 'Plat ezer', '1.2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H125-PLC0001', 0, 'PLC', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H126-PLG0001', 0, 'Plong', '12m', 'Prohex', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H127-PLU0001', 0, 'Plug', '1 1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H127-PLU0002', 0, 'Plug', '1"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H128-PBF0001', 0, 'Push button OFF', '25', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H128-PBO0001', 0, 'Push Button ON', '25', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H129-PSP0001', 0, 'Push selector power', '30 A/3P', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H13-FOC0001', 0, 'Filter Oli Compressor', 'Sullair', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H130-RNT0001', 0, 'Rantai', 'rs 40', 'sindo', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H130-RNT0002', 0, 'Rantai ', 'RS 50', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H130-RNT0003', 0, 'Rantai ', 'RS06 B 3R', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H131-RDS0001', 0, 'Reduser', '1 1/2 x 1', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H131-RDS0002', 0, 'Reduser', '1 1/4 x 1 1/2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H131-RDSL0001', 0, 'Reduser Las', '2x1,5 mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H131-RDSL0002', 0, 'Reduser Las', '2x1mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H131-RDSL0003', 0, 'Reduser Las', '4-2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H131-RDST0001', 0, 'Reduser drat', '1 1/2-1/2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H131-RDST0002', 0, 'Reduser drat', '1-1/2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H131-RDST0003', 0, 'Reduser drat', '2-3/4', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H131-RDST0004', 0, 'Reduser drat', '3-1', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H131-RDST0005', 0, 'Reduser drat', '1/2x1/4', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H132-RG0001', 0, 'Regulator', 'AW20-02-B+gauge', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H133-RC0001', 0, 'Roller Chain (triple Chain)', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H134-RLA0001', 0, 'Relay', 'MY 2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H134-RLA0002', 0, 'Relay', 'LY 2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H135-RTF0001', 0, 'Remes Teflon (Packing Pillar)', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H136-RSBN0001', 0, 'Resibon', '100x6x16 (4")', 'Resibon', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H136-RSBN0002', 0, 'Resibon', '125x6x22 mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H137-RPR0001', 0, 'Ring Per', 'M14', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H137-RPR0002', 0, 'Ring Per', 'M16', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H137-RPR0003', 0, 'Ring Per', 'M6', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H137-RPR0004', 0, 'Ring Per', 'M8', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H137-RPR0005', 0, 'Ring Per', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H137-RPR0006', 0, 'Ring Per', 'M 18', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H138-RPL0001', 0, 'Ring Plat', 'm10', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H138-RPL0002', 0, 'Ring Plat', 'M12', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H138-RPL0003', 0, 'Ring Plat', 'M14', ' ', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H138-RPL0004', 0, 'Ring Plat', 'M16', ' ', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H138-RPL0005', 0, 'Ring Plat', 'M20', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H138-RPL0006', 0, 'Ring Plat', 'M30', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H138-RPL0007', 0, 'Ring Plat', 'M6', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H138-RPL0008', 0, 'Ring Plat', 'M8', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H138-RPL0009', 0, 'Ring Plat', 'M8', ' ', 'Kuningan', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H138-RPL0010', 0, 'Ring Plat', 'M 17', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H139-ROD0001', 0, 'Roda', '10', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTM0001', 0, 'Baut Mur', '12x40', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTM0002', 0, 'Baut Mur', 'M 16x60 (K24)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTM0003', 0, 'Baut Mur', 'M10x35', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTM0004', 0, 'Baut Mur', 'm14x50', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTM0005', 0, 'Baut Mur', 'm16x50', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTM0006', 0, 'Baut Mur', 'm6x35', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTM0007', 0, 'Baut Mur', 'M6 x 25', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTM0008', 0, 'Baut Mur', 'M8 x 25', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTM0009', 0, 'Baut Mur', 'M4x50', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTM0010', 0, 'Baut Mur', 'M12x130mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTM0011', 0, 'Baut Mur ', 'M12x40', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTMB0001', 0, 'Baut Mur (Baja)', 'm12x50', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H14-BTMH0001', 0, 'Baut Mur (High Tensile)', 'm16x80', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H140-RDM0001', 0, 'Roda Mati Arco', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H141-RLB0001', 0, 'Roll Bronz', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H142-MTRN0001', 0, 'Roll Meter (Meteran)', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H142-MTRN0002', 0, 'Roll Meter (Meteran)', '3 Meter', 'Tajima', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H142-MTRN0003', 0, 'Roll Meter (Meteran)', '7.5Meter', 'Sherlock', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H143-RLST0001', 0, 'Roll Sheet (Kertas Tally)', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H144-RLTF0001', 0, 'Roll Teflon', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H145-PLX0001', 0, 'Pylox (Cat semprot)', '', 'pylox', 'Putih', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H146-SLTP0002', 0, 'Seal Tape', '', 'Dcota', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H147-SGL0001', 0, 'Segel', 'M16', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H147-SGL0002', 0, 'Segel', 'M22', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H148-SKR0001', 0, 'Sekring', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H149-SLA0001', 0, 'Selang angin', '8,5x14', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H149-SLA0002', 0, 'Selang angin', '8x12mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H149-SLA0003', 0, 'Selang angin', '8x12mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H149-SLA0004', 0, 'Selang angin', '6.5x10', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H15-CBLT0001', 0, 'Cable Tie', '3,6x300', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H150-SGG0001', 0, 'Selang Grace Gun', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H151-BTL0001', 0, 'Belt Laching', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H152-SLL0001', 0, 'Selang L ', '1"', '', 'Bening', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H153-SLR0001', 0, 'Selang rajut', '1"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H154-CTB0001', 0, 'Brown ', '', 'Impala', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H155-SSW0001', 0, 'Selector Switch', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H155-SSW0002', 0, 'Selector Switch', '2P', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H155-SSW0003', 0, 'Selector Switch', '3P', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H155-SSW0004', 0, 'Selector Switch', 'ON-OFF', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H156-SLI0001', 0, 'Seling', '10 mm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H157-SLRY0001', 0, 'Selot Rellay', '2Y', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H158 -SPN0001', 0, 'Seng Galvalum (Spandex)', '030x4000', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H159-SHA0001', 0, 'Shank Adaptor', '4 grove', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H16-BSH0001', 0, 'Besi Holo', '20x40x6000', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H16-BSH0002', 0, 'Besi Holo', '20x40', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H16-BSH0003', 0, 'Besi Holo', '40x40', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H16-BSH0004', 0, 'Besi Holo', '50x50', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H16-BSH0005', 0, 'Besi Holo', '5x5x1.8 Meter', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H16-BSH0006', 0, 'Besi Holo', '40x20', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H160-SHK0001', 0, 'Sheel karet', 'm60', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H161-SHB0001', 0, 'Sok Besi', '1"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H161-SHD0001', 0, 'Shok Drat', '1"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H161-SHD0002', 0, 'Shok Drat', '1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H161-SHVC0001', 0, 'Shok PVC', '1.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H161-SHVC0002', 0, 'Shok PVC', '3"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H161-SHVC0003', 0, 'sok PVC', '2.5', ' 22', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H162-ELD0001', 0, 'Electric Droping Stacker rotary', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H163-PLET0001', 0, 'Palet Kayu', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H164-SBJ0001', 0, 'Sikat Baja', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H164-SBJ0002', 0, 'Sikat Baja', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H164-SBJB0001', 0, 'Sikat Baja Bulat', '2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H164-SBJG0001', 0, 'Sikat Baja Gerinda', 'Dia. 4"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H165-KSN0001', 0, 'Kasa No Drop', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H166-OR0001', 0, 'O Ring', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H167-SKO0001', 0, 'Sikat Oval', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H168-SKLR0001', 0, 'Skakelar', '', 'OB Engkel', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H169-SKMT0001', 0, 'Sketmat', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H17-BTRD0001', 0, 'Baut Roda', 'HHR SS', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H170-SKUN0001', 0, 'Skun', '10', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H170-SKUN0002', 0, 'Skun', '25', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H170-SKUN0003', 0, 'Skun ', '16-8', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H172-SCKT0001', 0, 'Socket', 'MY', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H172-SCKT0002', 0, 'Socket', 'LY', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H173-BS0001', 0, 'Baut Stainliss+Mur', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H175-SPI0001', 0, 'Spei ', '8x50cm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H175-SPI0002', 0, 'Spie', '10x10x50cm', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H176-BSPR0001', 0, 'Baut Setting Pisau Rotary', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H177-SPTR0001', 0, 'Spring Tarik', '16x2x70mm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H177-SPTR0002', 0, 'Spring Tarik', '34x26x40mm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H177-SPTR0003', 0, 'Spring Tarik', '34x26x400mm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H178-STE0001', 0, 'Steker', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H179-STKN0001', 0, 'Stop Kontak ', 'tanam', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H179-STKN0002', 0, 'Stop Kontak ', '4 Lubang', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H18-BTS0001', 0, 'Baut seng', '6mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H180-STUD0001', 0, 'Stud', 'M24', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H180-STUD0002', 0, 'Stud', 'M 12 X 1 Meter', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H181-TVC0001', 0, 'Talang PVC', '20', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H181-TVCK0001', 0, 'Talang Kotak PVC', '', 'Maspion', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H182-TREQ0001', 0, 'Tali Treqdown', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H183-TGR0001', 0, 'Tang Rifet', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H184-TID0001', 0, 'Tee Drat', '1 1/2"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H184-TID0002', 0, 'Tee Drat', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H184-TID0003', 0, 'Tee Drat', '1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H184-TIL0001', 0, 'Tee Las', '1', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H184-TIL0002', 0, 'Tee Las', '1 1/2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H184-TIL0003', 0, 'Tee Las', '2-1 1/2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H184-TIVC0001', 0, 'Tee (pvc)', '1.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H184-TIVC0002', 0, 'TEE PVC', '1.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H184-TIVC0003', 0, 'Tee PVC ', '1"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H184-TIVC0004', 0, 'Tee PVC ', '(Drat Dalam) 3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H185-THN0001', 0, 'Thinner A', '5 liter', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H186-TRI0001', 0, 'Tire Infiator', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H187-TLEG0001', 0, 'Tombol Emergency', '25', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H188-VFA0001', 0, 'VFA3130-02', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H189-VNL0001', 0, 'Vynil', '1"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H189-VNL0002', 0, 'Vynil', '1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0001', 0, 'Bearing', '6308', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0002', 0, 'Bearing', '22210E', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0003', 0, 'Bearing', '6205', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0004', 0, 'Bearing', 'UCT 210', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0005', 0, 'Bearing', '620 42PS', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0007', 0, 'Bearing', '6306', 'NTN/Blank', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0008', 0, 'Bearing', '6203', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0009', 0, 'Bearing', '6305', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0010', 0, 'Bearing', '6208', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0011', 0, 'Bearing ', 'UCHA 206', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0012', 0, 'Bearing (klaker)', '6202', 'Koyo', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0013', 0, 'Bearing (klaker)', '6300', 'Koyo', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0014', 0, 'Bearing', '6000 z', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0015', 0, 'Bearing', '6206 C3', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H19-BRG0016', 0, 'Bearing', '6208 C3', 'SKF', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H190-WM0001', 0, 'Water Mur', '1 1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H190-WM0002', 0, 'Water Mur', '2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H190-WMVC0001', 0, 'Water Mur PVC', '1 1/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H190-WMVC0002', 0, 'Water Mur PVC', '1"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H191-OSK0001', 0, 'Obat sekur', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H192-WRC0001', 0, 'Wrc (Kunci Seling)', 'M12', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H192-WRC0002', 0, 'Wrc (Kunci Seling)', 'M20', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H192-WRC0003', 0, 'Wrc (Kunci Seling)', 'M8', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H192-WRC0004', 0, 'Wrc (Kunci Seling)', 'M6', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H193-KPF0001', 0, 'Kelep Flange', '2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H194-FHP0001', 0, 'Frame Holder Pisau SVC', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H195-TGG0001', 0, 'Tangga Aluminium', '3 Meter', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H196-TRP0001', 0, 'Tire Presure', '', 'Tekiro', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H197-CC0001', 0, 'Circle Clips', '10s', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H198-KBL0001', 0, 'Kabel ', '2x1.5', 'Externa', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H199-O20001', 0, 'Oksigen', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H2-AC0001', 0, 'Air Cilinder SMC', 'C96SDB32-50C', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H20-PXSW0001', 0, 'Proximity Switch', '8 DC', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H200-SBK0001', 0, 'Clips Board ( Papan sabak )', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H201-TSP0001', 0, 'Tespen ', '', 'Wipro', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H202-RING0001', 0, 'Ring', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H203-SEX0001', 0, 'Shaft Exentrik', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H204-PGS0001', 0, 'Pipa Gas SCH', '40/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H205-BBR0001', 0, 'Ball Bearing', '6000z', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H206-LDG0001', 0, 'Pipa Ledeng', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H207-DYNA0001', 0, 'Dyna Bolt', '12x99', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H208-NFB0001', 0, 'No Fuse Breaker (NFB)', '100 A', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H209-KTS0001', 0, 'Klem Tip Saw', 'Gambar A', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H209-KTS0002', 0, 'Klem Tip Saw', 'Gambar B', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H21-BTF0001', 0, 'Belt Fastener', '500-2x24"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H210-KOPI0001', 0, 'Kopi', '', 'Kapal api', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H211-SCS0001', 0, 'Shaft Circular Saw', '45x500mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H212-CS0001', 0, 'Cluth Spring', 'MS 2500000-997-5515', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H213-PLTR0001', 0, 'Plitur Kayu', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H214-RTR0001', 0, 'Retainer', 'MS 250 1127-162-3000', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H215-PKBT0001', 0, 'Paku Beton', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H216-SLG0001', 0, 'Selang', '3/4"', 'Metalic', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H217-BNG0001', 0, 'Benang', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H217-BNG0002', 0, 'Benang Boll', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H218-CTDG0001', 0, 'Dana Gloss', '0020', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H218-CTDG0002', 0, 'Dana Gloss', '0001', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H218-CTDG0003', 0, 'V Dana Elash', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H219-RKRG0001', 0, 'Roll Kerokong', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H22-BSCNP0001', 0, 'Besi CNP', '100x2,3x6000', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H22-BSCNP0002', 0, 'Besi CNP', '100x5x2', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H22-BSCNP0003', 0, 'Besi CNP', '150x2,3x6000', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H22-BSCNP0004', 0, 'Besi CNP', '80x30X6000', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H220-SLHX0001', 0, 'Selang Hiprex', '2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H221-SKTM0001', 0, 'Sikat Mangkok', '3"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H222-SMPR0001', 0, 'Semprotan ', '', ' 22', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H223-EAF0001', 0, 'Element, Air Filter', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H223-EFC0001', 0, 'Element, Filter Coreless', '2.5 Dia 6"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H224-FLD0001', 0, 'Fluid', 'SRF 1/4000', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H23-BSSK0001', 0, 'Besi Siku', '50x50', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H23-BSSK0002', 0, 'Besi Siku ', '30x30', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H24-BSUNP0001', 0, 'Besi UNP', '100', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H24-BSUNP0002', 0, 'Besi UNP', '200 Ks', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H24-BSUNP0003', 0, 'Besi UNP', '80', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H25-BRBS0001', 0, 'Bor besi', '14mm', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H26-BRBT0001', 0, 'Bor Beton', 'diameter 13', 'Krisbow', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H27-BT20001', 0, 'BT2', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H28-BSI0001', 0, 'busi', '', 'Bosch', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H29-CAK0001', 0, 'Cairan Anti Karat', '', 'WD', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H3-AR0001', 0, 'Air Radiator', '', 'Yamalube', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H30-CBR0001', 0, 'Carbon brush', '325', 'Makita', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H30-CBR0002', 0, 'Carbon Brush ', '', 'Hitachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H31-PSG0001', 0, 'Pressure Gauge', '16Kg', 'Wipro', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H32-CGCH0001', 0, 'Chain Coupling', 'KC 4016', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H32-CGCH0002', 0, 'Chain Coupling', 'KC 6018', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H33-CTL0001', 0, 'Connecting Link ', 'rs 40', 'sindo', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H33-CTL0002', 0, 'Connecting Link ', 'rs 60', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H33-CTL0003', 0, 'Connecting Link ', 'rs 80', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H33-CTL0004', 0, 'Connecting Link ', 'RS 35', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H33-CTL0005', 0, 'Connecting Link ', 'RS 50', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H34-CTCL0001', 0, 'Contact Cleaner', '', 'WD', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H35-CSA0001', 0, 'Cop Selang Angin ', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H36-CPLR0001', 0, 'Coupler', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H37-CWK0001', 0, 'Cutting Keramik', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H38-CWL0001', 0, 'Cutting Wheel', '105x1,2x16mm', 'WD', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H38-CWL0002', 0, 'Cutting Whell', '355x3x25.4', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H39-KBLS0001', 0, 'Kabel las ', '50', 'Superflx', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H4-AB0001', 0, 'Amplas Bulat', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H40-DLI0001', 0, 'Dial indikator', '(blank)', 'Wipro', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H41-DMPL0001', 0, 'Dempul Besi', '', 'Sanpolac', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H42-DMBL0001', 0, 'Diamond Blade', '5"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H43-DCM0001', 0, 'Digital Clamp Meter', '(blank)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H44-DLS0001', 0, 'Dol Slate ', '380/3,3', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H45-DPD0001', 0, 'Dop Drat', '1 1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H45-DPD0002', 0, 'Dop Drat', '1 1/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H45-DPD0003', 0, 'Dop Drat', '1"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H45-DPD0004', 0, 'Dop Drat', '2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H45-DPD0005', 0, 'Dop Drat', '3"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H46-DNPL0001', 0, 'Double Naple', '1 1/2"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H46-DNPL0002', 0, 'Double Naple', '1 1/4"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H46-DNPL0003', 0, 'Double Naple', '1/2"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H46-DNPL0004', 0, 'Double Naple', '1/4', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H46-DNPL0005', 0, 'Double Naple', '3/4"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H47-PLBC0001', 0, 'Plibico ALX-AB', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H48-PLS0001', 0, 'DL', '7.5x12', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H48-PLS0002', 0, 'Plat Strip ', '4x6', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H49-ELD0001', 0, 'Double Neple Oil', '1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H49-ELD0002', 0, 'Elbow Drat', '2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H5-AB0001', 0, 'As besi ', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H50-ELL0001', 0, 'Elbow Las', '1 1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H50-ELL0002', 0, 'Elbow Las', '1"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H50-ELL0003', 0, 'Elbow Las', '1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H50-ELL0004', 0, 'Elbow Las', '3"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H50-ELL0005', 0, 'Elbow Las', '3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H51-ESL0001', 0, 'Engsel', '5"x3,0"x3,0mm', 'oneo', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H51-ESLB0001', 0, 'Engsel Bubut', '20 mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H51-ESLG0001', 0, 'Engsel Gerbang', '1"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H52-FNBT0001', 0, 'Fanbelt', 'B 84', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H52-FNBT0002', 0, 'Fanbelt', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H52-FNBT0003', 0, 'Van Belt', 'A56', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H53-FSR0001', 0, 'Fisher ', 'S12', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H53-FSR0002', 0, 'Fisher ', 'S8', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H54-FFLC0001', 0, 'Fitting Flow Control', '10-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H55-FSPB0001', 0, 'Fitting', 'SPB08-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H55-FSPB0002', 0, 'Fitting', 'SPB 10-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H56-FSPC0001', 0, 'Fitting', 'SPC08-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H56-FSPC0002', 0, 'Fitting', 'SPC08-03', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H56-FSPC0003', 0, 'Fitting', 'SPC 10-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H56-FSPC0004', 0, 'Fitting', 'SPC 10-03', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H56-FSPC0005', 0, 'Fitting', 'SPC 10-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H56-FSPC0006', 0, 'Fitting', 'SPC 12-03', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H56-FSPC0007', 0, 'Fitting', 'SPC 12-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H56-FSPC0008', 0, 'Fitting', 'SPC 6-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H57-FSPE0001', 0, 'Fitting', 'SPE08', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H57-FSPE0002', 0, 'Fitting', 'SPE 10', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H58-FSPL0001', 0, 'Fitting', 'SPL08-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H58-FSPL0002', 0, 'Fitting', 'SPL08-03', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H58-FSPL0003', 0, 'Fitting', 'SPL 10-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H58-FSPL0004', 0, 'Fitting', 'SPL 10-03', 'in baru 28/08/17', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H58-FSPL0005', 0, 'Fitting', 'SPL 10-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H58-FSPL0006', 0, 'Fitting', 'SPL 12-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H58-FSPL0007', 0, 'Fitting', 'SPL 6-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H58-FSPL0008', 0, 'Fitting', 'SPL 8-04', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H59-FSPU0001', 0, 'Fitting', 'SPU08', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H59-FSPU0002', 0, 'Fitting', 'SPU 10', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H6-AS0001', 0, 'As Shaft ', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H60-FFLC0002', 0, 'Fitting Flow Control', '10-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H60-FFLC0003', 0, 'Fitting Flow Control', '06-01', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H60-FFLC0004', 0, 'Fitting Flow Control', '06-02', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H61-FTL0001', 0, 'Fitting Lampu', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H62-FLBE0001', 0, 'Flat Belt Endless (GT02)', '1 mm x 16 x 455 mm/endless', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H63-GLVM0001', 0, 'Galvalum', '035x400', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H64-GRM0001', 0, 'Gayung', '', 'Maspion', 'Orange', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H65-GMBK0001', 0, 'Gembok', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H66-GRC0001', 0, 'Gerenda Compressor', '100mm/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H67-GRSN0001', 0, 'Grinding Roll Contact Drum Sander', '320x1360 mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H68-JRM0001', 0, 'Jarum ', 'M 10', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H69-KCL0001', 0, 'Kaca las', 'Bening', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H69-KCL0002', 0, 'Kaca las', 'Hitam', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H7-BGM0001', 0, 'Baling-baling glue mixer', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H70-KNCS0001', 0, 'Kancing S', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H71-KPLM0001', 0, 'Kap Lampu', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H72-KPB0001', 0, 'Kapi Besi', '4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H72-KPL0001', 0, 'Kapi Plastik', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H73-KPRB0001', 0, 'Kapur Besi', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H74-KRSK0001', 0, 'Karet Skun', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H75-KSBT0001', 0, 'Kasibot', '4mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H75-KSBT0002', 0, 'Kasibot', '4x4x8', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H76-KWL0001', 0, 'Kawat Las', 'RB-26 (2,6mm)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H76-KWL0002', 0, 'Kawat Las', 'RB-26 (3,2mm)', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H76-KWL0003', 0, 'Kawat Las C I -A 1', '3.2x350mm', 'Premiarc', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H76-KWL0004', 0, 'Kawat Las', 'LB 2.6', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H76-KWLS0001', 0, 'Kawat Las Stainless', '2,6x300mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H77-BTB0001', 0, 'Baut Baja ', 'M 12x45', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H78-BTBR0001', 0, 'Baut Borek', 'M10x1,5', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H79-CSTB0001', 0, 'Castable', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H8-FLG0001', 0, 'Flange', '2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H8-FLG0002', 0, 'Flange', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H80-KN0001', 0, 'Keni ', '1 1/2"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H80-KND0001', 0, 'Keni Drat', '1 1/2"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H80-KNVC0001', 0, 'keni pvc', '1.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H80-KNVC0002', 0, 'keni pvc', '1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H80-KNVC0003', 0, 'keni pvc', '3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H80-KNVC0004', 0, 'keni pvc', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H80-KNVCD0001', 0, 'keni pvc drat dalam', '3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H81-SDL0001', 0, 'SDL Pvc', '3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H82-SEAC0001', 0, 'Seahc', '65x90x10', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H83-SSPR0001', 0, 'Selang Spiral', '2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H83-SSPR0002', 0, 'Selang Spiral', '3"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23');
INSERT INTO `tb_barang` (`kode_barang`, `id_barang`, `nama_barang`, `spek`, `merk`, `warna`, `deskripsi`, `tgl_input`, `harga_beli`, `harga_jual`, `kategori_id`, `kode_account`, `jml_stok`, `satuan`) VALUES
('H84-KRGS0001', 0, 'Kertas Gosok/Ampelas', 'ukuran 100', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H84-KRGS0002', 0, 'Kertas Gosok/Ampelas', 'Ukuran 60', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H85-KKW0001', 0, 'Klem Kawat', '4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H85-KLM0001', 0, 'Klem', '1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H85-KLM0002', 0, 'Klem', '5"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H85-KLP0001', 0, 'Klem pipa', '1 1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H85-KLPB0001', 0, 'Klem Pipa Besi', '1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H85-KLPB0002', 0, 'Klem Pipa Besi', '3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H85-KLPB0003', 0, 'Klem Pipa Besi', '1 3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H85-KLPK0001', 0, 'Klem Pipa Knalpot', '1 1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H85-KLPK0002', 0, 'Klem Pipa Knalpot', '1 1/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H85-KLPK0003', 0, 'Klem Pipa Knalpot', '3"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H85-KLSL0001', 0, 'Klem selang', '2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H85-KLSL0002', 0, 'Klem selang', '3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H86-STEM0001', 0, 'Selang Steam', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H86-STEM0002', 0, 'Selang Steam', 'UK. 1"x1330mm Bengkok 90', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H86-STEM0003', 0, 'Selang Steam', 'UK. 1"x1330mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H87-SLGT0001', 0, 'Selang Timbangan', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H88-SPGU0001', 0, 'Spray Gun', 'F 75 G', 'Sagola', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H89-SPRK0001', 0, 'Sproket', 'RS 40x16T', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H89-SPRK0002', 0, 'Sproket', 'RS 60/20 T/1', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H9-BV0001', 0, 'Ball Valve', '1 1/2"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H9-BV0002', 0, 'Ball Valve', '1"', 'onda', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H9-BV0003', 0, 'Ball Valve', '1/2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H9-BV0004', 0, 'Ball Valve', '3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H9-BV0005', 0, 'Ball Valve', '2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H90-TCD0001', 0, 'Temperatur Control Disitel', '48x48+sensor', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H91-KRN0001', 0, 'Kran', '3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H92-KS0001', 0, 'Kuas', '2"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H92-KS0002', 0, 'Kuas ', '5"', 'Eterna', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H92-KS0003', 0, 'Kuas', '3"', 'Eterna', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H92-KS0004', 0, 'Kuas Roll', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H93-PTBA0001', 0, 'Pak TBA', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H94-KNRP0001', 0, 'Kunci Ring Pas', '24mm', 'Tekiro', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H95-LMP0001', 0, 'Lampu', '62 Watt', 'Hannochs', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H95-LMP0002', 0, 'Lampu', '11 Watt', 'Hannochs', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H95-LMP0003', 0, 'Lampu', '10 Watt', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H95-LMP0004', 0, 'Lampu', '36 Watt', 'Philips LED', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H95-LMP0005', 0, 'Lampu', '88 watt', 'Hannochs', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H95-LMP0006', 0, 'Lampu', '52 Watt', 'Philips', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H95-LMP0007', 0, 'Lampu ', '27 Watt', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H95-LMP0008', 0, 'Lampu', '30 Watt', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H95-LMP0009', 0, 'Lampu ', '27 Watt', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H96-LMB0001', 0, 'Lem Besi', '', 'Dextone', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H96-LMCT0001', 0, 'Lem Castol', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H97-LL0001', 0, 'Lem PVC', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H98-MTB0001', 0, 'Mata bor', '4mm', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H98-MTB0002', 0, 'Mata bor', 'D00290', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H98-MTB0003', 0, 'Mata bor', '3.5mm', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H98-MTB0004', 0, 'Mata Bor ', '12"', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H98-MTB0005', 0, 'Mata Bor', '8.5', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H98-MTB0006', 0, 'Mata Bor', '10.5', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H98-MTBB0001', 0, 'Mata Bor Besi', 'dia 15 mm', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H98-MTBT0001', 0, 'Mata Bor Beton', '12', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H98-MTBT0002', 0, 'Mata Bor Beton', '12mmx160', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H98-MTBT0003', 0, 'Mata Bor Beton', 'K2x160', 'Toho', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('H99-OVS0001', 0, 'Over Shok', '1"x3/4"', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('HI71-SKNG0001', 0, 'Skun Garpu', '1.5', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('HI71-SKNG0002', 0, 'Skun Garpu', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-507', 0, '23'),
('I1-TR0001', 0, 'Tali Rafia ', '', 'Natural', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I10-CTGK0001', 0, 'Centong Kayu ', '', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I11-CKSG0001', 0, 'Cikrak Seng', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I12-CRKY0001', 0, 'Crayon Kayu', '', ' 22222', 'Biru', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I13-CTTR0001', 0, 'Cutter', 'L.500', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I14-DSTP0001', 0, 'Dispenser Tape', '', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I16-FMS0001', 0, 'Face Mask', '(blank)', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I17-FRM0001', 0, 'Form Bukti Pengeluaran Kas', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I17-FRM0002', 0, 'Form Permintaan Pembelian Barang', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I2-BS0001', 0, 'Bak Stampel', '', 'Artline', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I20-IBL0001', 0, 'Isi Bulpoin', '', 'Standart', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I21-ICT0001', 0, 'Isi Cutter', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I22-IST0001', 0, 'Isi Steaples ', 'besar', 'Max', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I22-IST0002', 0, 'Isi Steaples ', 'kecil', 'Max', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I23-ISTT0001', 0, 'Isi Steaples Tembak ', 'T3-10MB', 'Max', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I24-ISL0001', 0, 'Isolasi', 'Bening', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I24-ISL0002', 0, 'Isolasi', 'Bening', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I24-ISL0003', 0, 'Isolasi', 'Listrik', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I24-ISL0004', 0, 'Isolasi', 'Kertas', ' 2222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I24-ISL0005', 0, 'Isolasi', 'Bening (Kecil)', 'Nachi', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I24-ISL0006', 0, 'Isolasi', 'Lakban Hitam', ' 222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I26-JSHJ0001', 0, 'Jas hujan', 'Baju+celana', 'Pinguin', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I27-KBPT0001', 0, 'Kabel Printer', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I28-KMJ0001', 0, 'Kain Majun ', '', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I29-KPL0001', 0, 'Kain Pel', '', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I3-BTR0001', 0, 'Battery', 'Kotak', ' 222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I3-BTR0002', 0, 'Battery', 'Kancing', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I3-BTR0003', 0, 'Battery', 'AA', 'Energizer', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I3-BTR0004', 0, 'Battery', 'AA', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I3-BTR0005', 0, 'Battery', 'AAA', 'Alkaline', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I3-BTR0006', 0, 'Battery', 'LR-44', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I3-BTR0007', 0, 'Battery', 'LR 1130', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I3-BTR0008', 0, 'Battery', '', 'ABC', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I30-KLTR0001', 0, 'Kalkulator', 'CT-555N', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I31-KMPR0001', 0, 'Kamper', '', 'Swallow', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I32-KRTS0001', 0, 'Kertas ', 'A4', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I32-KRTS0002', 0, 'Kertas ', 'F4', 'Sidu', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I33-KRB0001', 0, 'Kertas Bufallo', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I34-KYB0001', 0, 'Keyboard', '', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I35-PBJ0001', 0, 'Pisau Baja Kecil', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I35-PBJ0002', 0, 'Pisau Baja Tanggung', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I36-LMG0001', 0, 'Lem G', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I37-MSR0001', 0, 'Masker', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I37-MSR0002', 0, 'Masker', 'Kain', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I38-MOS0001', 0, 'Mouse', '(blank)', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I4-BNDR0001', 0, 'Bendera ', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I40-P3K0001', 0, 'Obat -Obatan', 'Kapas', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I40-P3K0002', 0, 'Obat -Obatan', 'Procold', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I40-P3K0003', 0, 'Obat -Obatan', 'Perban', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I40-P3K0004', 0, 'Obat -Obatan', 'Plester', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I40-P3K0005', 0, 'Obat -Obatan', 'Minyak kayu Putih', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I40-P3K0006', 0, 'Obat -Obatan', 'Rifanol', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I40-P3K0007', 0, 'Obat -Obatan', 'Betadine', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I40-P3K0008', 0, 'Obat -Obatan', 'Diapet', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I40-P3K0009', 0, 'Obat -Obatan', 'Hansaplast', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I40-P3K0010', 0, 'Obat -Obatan', 'Insto', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I41-OTN0001', 0, 'Otener', 'besar', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I41-OTN0002', 0, 'Otener', 'kecil', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I42-PK0001', 0, 'Paku', '2"', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I42-PK0002', 0, 'Paku', '6cm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I42-PK0003', 0, 'Paku', '4x8', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I43-PK80001', 0, 'Paku 8', '', ' 222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I44-PKS0001', 0, 'Paku S', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I45-PLIT0001', 0, 'Peluit', '', 'ACME', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I46-PGRS0001', 0, 'Penggaris', 'Kotak', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I46-PGRS0002', 0, 'Penggaris', 'Segitiga', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I46-PGRS0003', 0, 'Penggaris', '60 Cm', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I47- IDC0001', 0, 'Plastik ID Card + Tali', '', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I48-PLS0001', 0, 'Plastik', '0.4x150cmx25meter', ' 2222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I48-PLS0002', 0, 'Plastik', '', 'Manjur', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I48-PLS0003', 0, 'Plastik', '30x45', ' 22', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I48-PLS0004', 0, 'Plastik', '9x20', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I49-PFR0001', 0, 'Plong-Plongan', '', 'Eagle', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I5-BKF0001', 0, 'Buku Folio', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I50-MAL0001', 0, 'PPM Liberty', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I51-SBN0001', 0, 'Sabun Cuci', '', 'Mama Lemon', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I51-SBN0002', 0, 'Sabun Cuci', '', 'Rinso', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I52-HLM0001', 0, 'Safety Helmet', '', ' 2222222', 'Hijau', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I53-SPI0001', 0, 'Sapu', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I53-SPL0002', 0, 'Sapu Ijuk', '', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I53-SPL0003', 0, 'Sapu Lidi', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I54-SRTK0001', 0, 'Sarung Tangan', 'Kain', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I54-SRTT0001', 0, 'Sarung Tangan', 'Karet', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I55-SKT0001', 0, 'Sikat', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I57-SKWC0001', 0, 'Sikat Kamar Mandi', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I58-SPDL0001', 0, 'Spidol', 'kecil', 'Artline', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I58-SPDL0002', 0, 'Spidol', 'Permanent', 'Snowman', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I58-SPDL0003', 0, 'Spidol', 'Board Marker', 'Snowman', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I59-STBL0001', 0, 'Stabilo', '', ' 2222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I6-BKQ0001', 0, 'Buku Quarto', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I60-STP0001', 0, 'Steaples', '', 'Max', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I60-STPT 0001', 0, 'steapless tembak', '', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I62-SUN0001', 0, 'Suntikan', '50ml', 'One Mad', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I63-TBN0001', 0, 'Tali Ban ( karet Ban )', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I64-TPL0001', 0, 'Terpal', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I64-TPL0002', 0, 'Terpal', '6x12', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I65-TMB0001', 0, 'Timba ', 'Besar', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I65-TMB0002', 0, 'Timba ', 'Kecil', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I65-TMB0003', 0, 'Timba ', '2 g', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I65-TMB0004', 0, 'Timba ', '3 g', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I66-TNSP0001', 0, 'Tinta Spidol Permanent', '', 'Snowman', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I66-TNSP0002', 0, 'Tinta Spidol Boardmarker', '', ' 2222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I66-TNSP0003', 0, 'Tinta Spidol Permanent', '', 'Snowman', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I67-TNST0001', 0, 'Tinta Stempel', '', ' 2222', 'Merah', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I67-TNST0002', 0, 'Tinta Stempel', '', ' 3', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I68-TIPX0001', 0, 'Tipe-x', '', 'kiriko', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I69-TP0001', 0, 'Topi', '(blank)', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I7-BLPN0001', 0, 'Bulpoin', '', 'Standart', 'Hitam', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I7-BLPN0002', 0, 'Bulpoin Batik', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I7-BLPN0003', 0, 'Bulpoin zebra', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I71-KRK0001', 0, 'Kertas karton', '', ' ', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I72-KBS0001', 0, 'Kebus', '', ' 222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I73-CLK0001', 0, 'Celemek Kain', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I73-CLP0001', 0, 'Celemek Perlak/Apron', '', ' 2', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I74-BKC0001', 0, 'Buku Kecil', '', 'KIKI', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I75-APL0001', 0, 'Amplop ', 'kecil', ' 22222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I75-APL0002', 0, 'Amplop ', '', ' 222222', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I76-PWR0001', 0, 'Pewangi Ruangan', '', 'Glade', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I8-CPM0001', 0, 'Cairan Pembersih', '', 'Mr.Muscle', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I8-CPM0002', 0, 'Cairan Pembersih', '', 'Porstex', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I81-AM0001', 0, 'Air Minum', '', 'AQUA', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I82-ASP0001', 0, 'asahan panjang', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I83-BMB0001', 0, 'Bambu', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I84-BRS0001', 0, 'Beras', '', 'Kepompong', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I85-BKW0001', 0, 'Buku Kwitansi', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I86-GLP0001', 0, 'Gula Pasir', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I87-HT0001', 0, 'HT ', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I88-JM0001', 0, 'Jam Dinding', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I89-KPK0001', 0, 'Kapak besi', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I9-MAP0001', 0, 'Stop Map', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I90-KPR0001', 0, 'Kapur Tulis', '', '', 'Putih', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I91-KRJ0001', 0, 'Keranjang kecil', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I91-KRJ0002', 0, 'Keranjang besar', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23'),
('I92-MTR0001', 0, 'Materai', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-599', 0, '23');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_satuan`
--

CREATE TABLE IF NOT EXISTS `tb_barang_satuan` (
  `id_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(10) NOT NULL,
  `tgl_input` datetime NOT NULL,
  PRIMARY KEY (`id_satuan`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=32 ;

--
-- Dumping data for table `tb_barang_satuan`
--

INSERT INTO `tb_barang_satuan` (`id_satuan`, `nama_satuan`, `tgl_input`) VALUES
(18, 'pcs', '2017-03-06 08:24:42'),
(19, 'SET', '2017-03-06 08:24:42'),
(20, 'BTL', '2017-03-06 08:24:42'),
(23, 'unit', '2017-03-06 08:32:26'),
(25, 'BUNGKUS', '2017-03-06 08:38:46'),
(26, 'BH', '2018-09-04 09:16:30'),
(27, 'PICK UP', '2018-09-24 16:25:38'),
(28, 'belt', '2018-10-02 11:55:20'),
(29, 'lembar', '2018-10-02 00:36:22'),
(30, 'roll', '2018-10-02 00:37:01'),
(31, 'sasasasas', '2018-10-31 20:45:49');

-- --------------------------------------------------------

--
-- Table structure for table `tb_costumer`
--

CREATE TABLE IF NOT EXISTS `tb_costumer` (
  `id_costumer` int(11) NOT NULL AUTO_INCREMENT,
  `kode_costumer` varchar(20) NOT NULL,
  `nama_costumer` varchar(50) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` varchar(10) NOT NULL,
  PRIMARY KEY (`id_costumer`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tb_costumer`
--

INSERT INTO `tb_costumer` (`id_costumer`, `kode_costumer`, `nama_costumer`, `telepon`, `alamat`, `email`, `deskripsi`, `modidate`, `modiby`) VALUES
(1, 'C0001', 'PT CAHYA UTAMA', '0897776666', 'Surabaya', '', '', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_po`
--

CREATE TABLE IF NOT EXISTS `tb_detail_po` (
  `id_detailpo` int(11) NOT NULL AUTO_INCREMENT,
  `kode_po` varchar(20) DEFAULT NULL,
  `kode_barang` varchar(15) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detailpo`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=100 ;

--
-- Dumping data for table `tb_detail_po`
--

INSERT INTO `tb_detail_po` (`id_detailpo`, `kode_po`, `kode_barang`, `qty`, `satuan`, `harga`) VALUES
(98, 'PO-002-MII-XII-18', 'A3-RTKN0001', 10, '23', 250000),
(99, 'PO-002-MII-XII-18', 'H80-KNVCD0001', 10, '23', 300000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pi`
--

CREATE TABLE IF NOT EXISTS `tb_pi` (
  `id_pi` int(11) NOT NULL AUTO_INCREMENT,
  `kode_po` varchar(20) NOT NULL,
  `no_pi` varchar(3) DEFAULT NULL,
  `kode_pi` varchar(20) DEFAULT NULL,
  `inv_no` varchar(20) NOT NULL,
  `tgl_pi` date DEFAULT NULL,
  `kode_vendor` varchar(20) DEFAULT NULL,
  `total_pi` int(11) DEFAULT NULL,
  `ppn` varchar(1) NOT NULL,
  `total_ppn` int(11) NOT NULL,
  `jatuh_tempo` date DEFAULT NULL,
  `uang_muka` int(11) DEFAULT NULL,
  `tunai` enum('0','1') DEFAULT NULL,
  `paid_amount` int(11) NOT NULL,
  `modiby` int(11) DEFAULT NULL,
  `modidate` datetime DEFAULT NULL,
  `status` enum('0','1') NOT NULL,
  `keterangan` varchar(150) DEFAULT NULL,
  `ketyer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pi`,`kode_po`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=89 ;

--
-- Dumping data for table `tb_pi`
--

INSERT INTO `tb_pi` (`id_pi`, `kode_po`, `no_pi`, `kode_pi`, `inv_no`, `tgl_pi`, `kode_vendor`, `total_pi`, `ppn`, `total_ppn`, `jatuh_tempo`, `uang_muka`, `tunai`, `paid_amount`, `modiby`, `modidate`, `status`, `keterangan`, `ketyer`) VALUES
(88, 'PO-002-MII-XII-18', NULL, 'PI-002-MII-XII-18', '119', '2018-12-19', 'S0003', 5500000, '1', 550000, '2018-12-19', NULL, NULL, 0, 1, '2018-12-19 09:22:28', '0', '--', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pi_detail`
--

CREATE TABLE IF NOT EXISTS `tb_pi_detail` (
  `id_pi_detail` int(11) NOT NULL AUTO_INCREMENT,
  `kode_pi` varchar(20) DEFAULT NULL,
  `kode_barang` varchar(15) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pi_detail`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=106 ;

--
-- Dumping data for table `tb_pi_detail`
--

INSERT INTO `tb_pi_detail` (`id_pi_detail`, `kode_pi`, `kode_barang`, `qty`, `satuan`, `harga`) VALUES
(89, 'PI-001-MII-XII-18', 'H116-PHSC0001', 10, '23', 2000000),
(88, 'PI-001-MII-XII-18', 'A3-RTKN0001', 10, '23', 200000),
(97, 'PI-002-MII-XII-18', 'H80-KNVCD0001', 10, '23', 300000),
(96, 'PI-002-MII-XII-18', 'A3-RTKN0001', 10, '23', 250000),
(95, 'PI-002-MII-XII-18', 'H80-KNVCD0001', 10, '23', 300000),
(94, 'PI-002-MII-XII-18', 'A3-RTKN0001', 10, '23', 250000),
(98, 'PI-002-MII-XII-18', 'A3-RTKN0001', 10, '23', 250000),
(99, 'PI-002-MII-XII-18', 'H80-KNVCD0001', 10, '23', 300000),
(100, 'PI-002-MII-XII-18', 'A3-RTKN0001', 10, '23', 250000),
(101, 'PI-002-MII-XII-18', 'H80-KNVCD0001', 10, '23', 300000),
(102, 'PI-002-MII-XII-18', 'A3-RTKN0001', 10, '23', 250000),
(103, 'PI-002-MII-XII-18', 'H80-KNVCD0001', 10, '23', 300000),
(104, 'PI-002-MII-XII-18', 'A3-RTKN0001', 10, '23', 250000),
(105, 'PI-002-MII-XII-18', 'H80-KNVCD0001', 10, '23', 300000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_po`
--

CREATE TABLE IF NOT EXISTS `tb_po` (
  `id_po` int(11) NOT NULL AUTO_INCREMENT,
  `kode_po` varchar(20) NOT NULL,
  `no_po` varchar(3) DEFAULT NULL,
  `kode_pr` varchar(20) DEFAULT NULL,
  `tgl_po` date DEFAULT NULL,
  `kode_vendor` varchar(20) DEFAULT NULL,
  `total_po` int(11) DEFAULT NULL,
  `ppn` varchar(1) NOT NULL,
  `total_ppn` int(11) NOT NULL,
  `jatuh_tempo` date DEFAULT NULL,
  `uang_muka` int(11) DEFAULT NULL,
  `tunai` enum('0','1') DEFAULT NULL,
  `paid_amount` int(11) NOT NULL,
  `modiby` int(11) DEFAULT NULL,
  `modidate` datetime DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `keterangan` varchar(150) DEFAULT NULL,
  `ketyer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_po`,`kode_po`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=95 ;

--
-- Dumping data for table `tb_po`
--

INSERT INTO `tb_po` (`id_po`, `kode_po`, `no_po`, `kode_pr`, `tgl_po`, `kode_vendor`, `total_po`, `ppn`, `total_ppn`, `jatuh_tempo`, `uang_muka`, `tunai`, `paid_amount`, `modiby`, `modidate`, `status`, `keterangan`, `ketyer`) VALUES
(94, 'PO-002-MII-XII-18', '002', '', '2018-12-18', 'S0003', 5500000, '1', 550000, NULL, NULL, NULL, 0, 1, '2018-12-18 16:47:04', '', '-', NULL),
(92, 'PO-001-MII-XII-18', '001', '', '2018-12-18', 'S0001', 4500000, '1', 450000, NULL, NULL, NULL, 0, 1, '2018-12-18 14:39:44', '', '-', NULL);

--
-- Triggers `tb_po`
--
DROP TRIGGER IF EXISTS `update_request`;
DELIMITER //
CREATE TRIGGER `update_request` AFTER INSERT ON `tb_po`
 FOR EACH ROW BEGIN

update request_order
SET status='1'
where kode_pr=New.kode_pr;

end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_supplier`
--

CREATE TABLE IF NOT EXISTS `tb_supplier` (
  `id_vendor` int(11) NOT NULL AUTO_INCREMENT,
  `kode_vendor` varchar(10) NOT NULL,
  `nama_vendor` varchar(50) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` varchar(10) NOT NULL,
  PRIMARY KEY (`id_vendor`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=36 ;

--
-- Dumping data for table `tb_supplier`
--

INSERT INTO `tb_supplier` (`id_vendor`, `kode_vendor`, `nama_vendor`, `alamat`, `telepon`, `email`, `deskripsi`, `modidate`, `modiby`) VALUES
(4, 'S0001', 'Alwi', '', '', '', '', '0000-00-00 00:00:00', ''),
(5, 'S0002', 'Bachtera Indoamplas Gemilang', '', '', '', '', '0000-00-00 00:00:00', ''),
(6, 'S0003', 'Best Trans Material', '', '', '', '', '0000-00-00 00:00:00', ''),
(7, 'S0004', 'Budiono', '', '', '', '', '0000-00-00 00:00:00', ''),
(8, 'S0005', 'Delta Motor', '', '', '', '', '0000-00-00 00:00:00', ''),
(9, 'S0006', 'Depo Cara', '', '', '', '', '0000-00-00 00:00:00', ''),
(10, 'S0007', 'Eka Utama Jaya', '', '', '', '', '0000-00-00 00:00:00', ''),
(11, 'S0008', 'Excellchem', '', '', '', '', '0000-00-00 00:00:00', ''),
(12, 'S0009', 'Excelltech', '', '', '', '', '0000-00-00 00:00:00', ''),
(13, 'S0010', 'Gunung Kawi', '', '', '', '', '0000-00-00 00:00:00', ''),
(14, 'S0011', 'Herry & Co', '', '', '', '', '0000-00-00 00:00:00', ''),
(15, 'S0012', 'Iswara', '', '', '', '', '0000-00-00 00:00:00', ''),
(16, 'S0013', 'Jaya Mulya Diesel', '', '', '', '', '0000-00-00 00:00:00', ''),
(17, 'S0014', 'Kanefusa Indonesia', '', '', '', '', '0000-00-00 00:00:00', ''),
(18, 'S0015', 'PAI', '', '', '', '', '0000-00-00 00:00:00', ''),
(19, 'S0016', 'Pakindo JP', '', '', '', '', '0000-00-00 00:00:00', ''),
(20, 'S0017', 'Pancaputra MM', '', '', '', '', '0000-00-00 00:00:00', ''),
(21, 'S0018', 'Plywood Kayu Lestari', '', '', '', '', '0000-00-00 00:00:00', ''),
(22, 'S0019', 'Pranidhana Samartha Amudra', '', '', '', '', '0000-00-00 00:00:00', ''),
(23, 'S0020', 'Pratama Adi Jaya', '', '', '', '', '0000-00-00 00:00:00', ''),
(24, 'S0021', 'Prima Jaya Packindo', '', '', '', '', '0000-00-00 00:00:00', ''),
(25, 'S0022', 'Rendi Manunggal', '', '', '', '', '0000-00-00 00:00:00', ''),
(26, 'S0023', 'Samudra Indah Motor', '', '', '', '', '0000-00-00 00:00:00', ''),
(27, 'S0024', 'Sandang Pangan', '', '', '', '', '0000-00-00 00:00:00', ''),
(28, 'S0025', 'Semangat Duta Abadi', '', '', '', '', '0000-00-00 00:00:00', ''),
(29, 'S0026', 'SMC', '', '', '', '', '0000-00-00 00:00:00', ''),
(30, 'S0027', 'Sudjoni', '', '', '', '', '0000-00-00 00:00:00', ''),
(31, 'S0028', 'Sugeng', '', '', '', '', '0000-00-00 00:00:00', ''),
(32, 'S0029', 'Suhan', '', '', '', '', '0000-00-00 00:00:00', ''),
(33, 'S0030', 'Sukses Duta Pratama', '', '', '', '', '0000-00-00 00:00:00', ''),
(34, 'S0031', 'Sumber Berkat', 'Jl panglima sudirman no 55-57  surabaya jawa timur', '08233445589', '', '', '0000-00-00 00:00:00', ''),
(35, 'S0032', 'Surya Santoso', '', '', '', '', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(45) NOT NULL,
  `usernm` varchar(20) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL,
  `last_login` datetime NOT NULL,
  `akses_master` text NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `usernm`, `passwd`, `level`, `last_login`, `akses_master`) VALUES
(1, 'ADMINISTRATOR', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '2018-10-30 23:53:36', ''),
(2, 'User', 'user', '68663b31bfc72ddf7691787908b1bd2b', 'user', '2017-03-07 15:06:54', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
