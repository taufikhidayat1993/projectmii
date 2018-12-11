-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Des 2018 pada 06.40
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `accgroup`
--

CREATE TABLE `accgroup` (
  `groupid` int(10) NOT NULL,
  `kode_group` varchar(100) NOT NULL,
  `nama_group` varchar(100) NOT NULL DEFAULT '',
  `modidate` datetime NOT NULL,
  `modiby` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `accgroup`
--

INSERT INTO `accgroup` (`groupid`, `kode_group`, `nama_group`, `modidate`, `modiby`) VALUES
(1, '1-000', 'AKTIVA', '2018-11-30 00:00:00', '1'),
(2, '2-000', 'KEWAJIBAN', '2018-11-30 00:00:00', '1'),
(3, '3-000', 'EKUITAS', '2018-11-30 00:00:00', '1'),
(4, '4-000', 'PENDAPATAN', '2018-11-30 00:00:00', '1'),
(5, '5-000', 'HARGA POKOK PENJUALAN & PRODUKSI', '2018-11-30 00:00:00', '1'),
(6, '6-000', 'BIAYA USAHA', '2018-11-30 00:00:00', '1'),
(7, '7-000', 'PENDAPATAN & BIAYA LAIN-LAIN', '2018-11-30 00:00:00', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `accheader`
--

CREATE TABLE `accheader` (
  `headerid` int(11) NOT NULL,
  `kode_header` varchar(10) NOT NULL,
  `nama_header` varchar(300) NOT NULL,
  `kode_group` varchar(8) NOT NULL,
  `keterangan` varchar(300) DEFAULT NULL,
  `modiby` varchar(30) DEFAULT NULL,
  `modidate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `accheader`
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
-- Struktur dari tabel `account`
--

CREATE TABLE `account` (
  `kode_account` varchar(30) NOT NULL DEFAULT '',
  `nama_account` varchar(300) NOT NULL,
  `kode_header` varchar(30) NOT NULL,
  `matauangid` varchar(30) NOT NULL,
  `tipe` varchar(10) NOT NULL,
  `modiby` varchar(30) NOT NULL,
  `modidate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `account`
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
('2-120', 'PPN Keluaran', '2-100', '', 'K', '1', '2018-11-30 00:00:00'),
('2-130', 'PPN Masukan', '2-100', '', 'K', '1', '2018-11-30 00:00:00'),
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
('6-599', 'Lainnya', '6-500', '', 'D', '1', '2018-11-30 00:00:00'),
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
-- Struktur dari tabel `brgkategori`
--

CREATE TABLE `brgkategori` (
  `kategori_id` int(30) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `modiby` varchar(30) NOT NULL,
  `modidate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `brgkategori`
--

INSERT INTO `brgkategori` (`kategori_id`, `nama_kategori`, `modiby`, `modidate`) VALUES
(1, 'Alat Tulis Kantor', '1', '2018-11-13 10:05:40'),
(3, 'Bahan Baku', '1', '2018-11-14 08:56:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `brgsatuan`
--

CREATE TABLE `brgsatuan` (
  `satuan_id` int(11) NOT NULL,
  `nama_satuan` varchar(10) NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `brgsatuan`
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
-- Struktur dari tabel `detail_request_order`
--

CREATE TABLE `detail_request_order` (
  `id_request_order` int(11) NOT NULL,
  `kode_pr` varchar(10) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `qty` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `detail_request_order`
--

INSERT INTO `detail_request_order` (`id_request_order`, `kode_pr`, `kode_barang`, `nama_barang`, `qty`, `satuan`) VALUES
(40, '20180003', '', 'Mouse', 4, 'pcs'),
(39, '20180003', '', 'komputer', 3, 'pcs'),
(38, '20180002', 'BRG0000000001', 'semen gresik', 50, 'unit'),
(37, '20180002', 'BRG0000000002', 'semen surabaya', 50, 'unit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `request_order`
--

CREATE TABLE `request_order` (
  `id_request` int(11) NOT NULL,
  `kode_pr` varchar(10) NOT NULL,
  `tgl_pr` date NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `status_po` enum('0','1') NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `request_order`
--

INSERT INTO `request_order` (`id_request`, `kode_pr`, `tgl_pr`, `keterangan`, `status_po`, `modidate`, `modiby`) VALUES
(71, '20180002', '2018-10-29', 'dadadadada', '0', '2018-10-29 15:35:04', 1),
(72, '20180003', '2018-11-22', 'assdsdssd', '0', '2018-11-22 12:48:53', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
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
  `kode_subakun` varchar(10) NOT NULL,
  `jml_stok` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `id_barang`, `nama_barang`, `spek`, `merk`, `warna`, `deskripsi`, `tgl_input`, `harga_beli`, `harga_jual`, `kategori_id`, `kode_subakun`, `jml_stok`, `satuan`) VALUES
('BRG0000000001', 0, 'Baterai Laptop HP 14 Notebook PC', '', '', '', 'Baterai Laptop', '2017-08-24', 495000, 550000.00, 'K0001', '6-507', 0, 'PCS'),
('BRG0000000002', 0, 'Install Ulang Komputer/Laptop', '', '', '', '', '2017-08-24', 0, 50000.00, 'K0001', '', 1000, 'UNIT'),
('BRG0000000003', 0, 'Pangkon Holder Pisau SVC', '', '', '', 'fsfsfsf', '2018-08-24', 40000, 40000.00, 'K0001', '', 20, 'UNIT'),
('BRG0000000004', 0, 'Frame Holder Pisau PVC', '', '', '', 'SDSDSDS', '2018-08-24', 13750000, 13750000.00, 'K0001', '6-507', 10, 'UNIT'),
('BRG0000000005', 0, 'coba tes', '', '', '', 'jgjgjgj', '2018-08-28', 0, 0.00, '', '6-101', 10, 'PCS'),
('BRG0000000006', 0, 'KERTAS', '', '', '', '', '0000-00-00', 0, 0.00, '', '6-501', 0, 'RIM'),
('BRG0000000007', 0, 'KAYU', '', '', '', '', '0000-00-00', 0, 0.00, '', '', 0, 'TRUK'),
('BRG0000000008', 0, 'OLI', '', '', '', '', '0000-00-00', 0, 0.00, '', '', 0, 'DRIM'),
('BRG0000000009', 0, 'gelas kayu', '', '', '', '', '0000-00-00', 0, 0.00, '', '', 0, 'UNIT'),
('BRG0000000010', 0, 'Monitor Komputer', '', '', '', '', '0000-00-00', 0, 0.00, '', '', 0, 'UNIT'),
('BRG0000000011', 0, 'Meja Kantor', '', '', '', '', '0000-00-00', 0, 0.00, '', '', 0, 'UNIT'),
('BRG0000000012', 0, 'Print Canon', '', '', '', '', '0000-00-00', 0, 0.00, '', '', 0, 'UNIT'),
('BRG0000000013', 0, 'PASIR', '', '', '', '', '0000-00-00', 0, 0.00, '', '1-145', 0, 'PICK UP'),
('BRG0000000014', 0, 'Sand Paper ', 'F299 A0 A240 1350.00mm x 2800.00mm', '', '', 'oke', '0000-00-00', 88900, 0.00, '', '6-102', 0, 'BELT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang_satuan`
--

CREATE TABLE `tb_barang_satuan` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(10) NOT NULL,
  `tgl_input` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_barang_satuan`
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
-- Struktur dari tabel `tb_costumer`
--

CREATE TABLE `tb_costumer` (
  `id_costumer` int(11) NOT NULL,
  `kode_costumer` varchar(20) NOT NULL,
  `nama_costumer` varchar(50) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_costumer`
--

INSERT INTO `tb_costumer` (`id_costumer`, `kode_costumer`, `nama_costumer`, `telepon`, `alamat`, `email`, `deskripsi`, `modidate`, `modiby`) VALUES
(1, 'C0001', 'PT CAHYA UTAMA', '0897776666', 'Surabaya', '', '', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_po`
--

CREATE TABLE `tb_detail_po` (
  `id_detailpo` int(11) NOT NULL,
  `kode_po` varchar(20) NOT NULL,
  `kode_barang` varchar(15) NOT NULL,
  `qty` int(11) NOT NULL,
  `qty_receive` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `harga` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `vat_receive` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_detail_po`
--

INSERT INTO `tb_detail_po` (`id_detailpo`, `kode_po`, `kode_barang`, `qty`, `qty_receive`, `satuan`, `harga`, `vat`, `vat_receive`) VALUES
(23, 'PO/001/MII/IX/18', 'BRG0000000004', 10, 10, '', 500000, 0, 0),
(22, 'PO/001/MII/IX/18', 'BRG0000000001', 10, 10, '', 1300000, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurnal`
--

CREATE TABLE `tb_jurnal` (
  `id_jurnal` int(11) NOT NULL,
  `kode_jurnal` varchar(20) NOT NULL,
  `tanggal_jurnal` date NOT NULL,
  `qty` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `uraian` varchar(100) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `akun_debet` varchar(10) NOT NULL,
  `akun_kredit` varchar(10) NOT NULL,
  `jumlah_debet` int(11) NOT NULL,
  `jumlah_kredit` int(11) NOT NULL,
  `transaksi` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_jurnal`
--

INSERT INTO `tb_jurnal` (`id_jurnal`, `kode_jurnal`, `tanggal_jurnal`, `qty`, `satuan`, `uraian`, `supplier`, `akun_debet`, `akun_kredit`, `jumlah_debet`, `jumlah_kredit`, `transaksi`) VALUES
(2, 'SA/IX/18/00001', '2018-09-28', 0, '', 'Saldo Awal Rekening BCA', '', '1-121', '', 20000000, 0, 'SA'),
(5, 'HU/IX/18/00002', '2018-09-28', 0, '', 'HUTANG INV/100/IX/18', 'S0031', '1-121', '2-110', 18000000, 0, 'HU'),
(6, 'PB/IX/18/00003', '2018-09-28', 0, '', 'Pembayaran Termin 1 INV/100/IX/18', 'S0031', '2-110', '1-121', 0, 8000000, 'HU'),
(7, 'PB/IX/18/00004', '2018-09-28', 0, '', 'Pembayaran Termin 2 INV/100/IX/18', 'S0031', '2-110', '1-121', 0, 5000000, 'HU');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_po`
--

CREATE TABLE `tb_po` (
  `id_po` int(11) NOT NULL,
  `kode_po` varchar(20) NOT NULL,
  `no_po` varchar(3) NOT NULL,
  `kode_pr` varchar(20) NOT NULL,
  `tgl_po` date NOT NULL,
  `kode_vendor` varchar(20) NOT NULL,
  `total_po` int(11) NOT NULL,
  `jatuh_tempo` date NOT NULL,
  `uang_muka` int(11) NOT NULL,
  `tunai` enum('0','1') NOT NULL,
  `modiby` int(11) NOT NULL,
  `modidate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_po`
--

INSERT INTO `tb_po` (`id_po`, `kode_po`, `no_po`, `kode_pr`, `tgl_po`, `kode_vendor`, `total_po`, `jatuh_tempo`, `uang_muka`, `tunai`, `modiby`, `modidate`) VALUES
(30, 'PO/001/MII/IX/18', '001', '001', '2018-09-28', 'S0031', 18000000, '0000-00-00', 0, '0', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id_vendor` int(11) NOT NULL,
  `kode_vendor` varchar(10) NOT NULL,
  `nama_vendor` varchar(50) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `modidate` datetime NOT NULL,
  `modiby` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_supplier`
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
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(45) NOT NULL,
  `usernm` varchar(20) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL,
  `last_login` datetime NOT NULL,
  `akses_master` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `usernm`, `passwd`, `level`, `last_login`, `akses_master`) VALUES
(1, 'ADMINISTRATOR', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '2018-10-30 23:53:36', ''),
(2, 'User', 'user', '68663b31bfc72ddf7691787908b1bd2b', 'user', '2017-03-07 15:06:54', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `accgroup`
--
ALTER TABLE `accgroup`
  ADD PRIMARY KEY (`groupid`) USING BTREE,
  ADD UNIQUE KEY `id` (`groupid`) USING BTREE;

--
-- Indeks untuk tabel `accheader`
--
ALTER TABLE `accheader`
  ADD PRIMARY KEY (`headerid`) USING BTREE,
  ADD UNIQUE KEY `id` (`headerid`) USING BTREE,
  ADD KEY `id2` (`kode_group`) USING BTREE;

--
-- Indeks untuk tabel `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`kode_account`) USING BTREE,
  ADD UNIQUE KEY `id` (`kode_account`) USING BTREE,
  ADD KEY `id2` (`kode_header`) USING BTREE;

--
-- Indeks untuk tabel `brgkategori`
--
ALTER TABLE `brgkategori`
  ADD PRIMARY KEY (`kategori_id`) USING BTREE,
  ADD UNIQUE KEY `id` (`kategori_id`) USING BTREE;

--
-- Indeks untuk tabel `brgsatuan`
--
ALTER TABLE `brgsatuan`
  ADD PRIMARY KEY (`satuan_id`) USING BTREE;

--
-- Indeks untuk tabel `detail_request_order`
--
ALTER TABLE `detail_request_order`
  ADD PRIMARY KEY (`id_request_order`) USING BTREE;

--
-- Indeks untuk tabel `request_order`
--
ALTER TABLE `request_order`
  ADD PRIMARY KEY (`id_request`) USING BTREE;

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`) USING BTREE;

--
-- Indeks untuk tabel `tb_barang_satuan`
--
ALTER TABLE `tb_barang_satuan`
  ADD PRIMARY KEY (`id_satuan`) USING BTREE;

--
-- Indeks untuk tabel `tb_costumer`
--
ALTER TABLE `tb_costumer`
  ADD PRIMARY KEY (`id_costumer`) USING BTREE;

--
-- Indeks untuk tabel `tb_detail_po`
--
ALTER TABLE `tb_detail_po`
  ADD PRIMARY KEY (`id_detailpo`) USING BTREE;

--
-- Indeks untuk tabel `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  ADD PRIMARY KEY (`id_jurnal`) USING BTREE;

--
-- Indeks untuk tabel `tb_po`
--
ALTER TABLE `tb_po`
  ADD PRIMARY KEY (`id_po`) USING BTREE;

--
-- Indeks untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id_vendor`) USING BTREE;

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `accgroup`
--
ALTER TABLE `accgroup`
  MODIFY `groupid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `accheader`
--
ALTER TABLE `accheader`
  MODIFY `headerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `brgkategori`
--
ALTER TABLE `brgkategori`
  MODIFY `kategori_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `brgsatuan`
--
ALTER TABLE `brgsatuan`
  MODIFY `satuan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `detail_request_order`
--
ALTER TABLE `detail_request_order`
  MODIFY `id_request_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `request_order`
--
ALTER TABLE `request_order`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT untuk tabel `tb_barang_satuan`
--
ALTER TABLE `tb_barang_satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `tb_costumer`
--
ALTER TABLE `tb_costumer`
  MODIFY `id_costumer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_detail_po`
--
ALTER TABLE `tb_detail_po`
  MODIFY `id_detailpo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  MODIFY `id_jurnal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_po`
--
ALTER TABLE `tb_po`
  MODIFY `id_po` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id_vendor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
