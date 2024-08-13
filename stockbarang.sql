-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2024 at 10:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stockbarang`
--

-- --------------------------------------------------------

--
-- Table structure for table `keluar`
--

CREATE TABLE `keluar` (
  `idkeluar` int(11) NOT NULL,
  `idbarang` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `pengirim` varchar(25) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keluar`
--

INSERT INTO `keluar` (`idkeluar`, `idbarang`, `tanggal`, `pengirim`, `qty`) VALUES
(3, 4, '2024-07-30 07:06:13', 'depon', 7),
(12, 2, '2024-08-01 06:24:31', 'ifkar', 15),
(15, 1, '2024-08-01 07:18:44', 'ifkar', 85),
(21, 2, '2024-08-02 06:57:10', 'ifkar', 23),
(22, 13, '2024-08-05 07:05:17', 'Elga', 5),
(23, 9, '2024-08-05 07:37:32', 'ifkar', 150);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `iduser` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`iduser`, `email`, `password`) VALUES
(4, 'ifkararfian@gmail.com', '123'),
(6, 'ifkararfian11@gmail.com', '1234'),
(8, 'xyuraa11@gmail.com', '1234'),
(9, 'xyuraa12@gmail.com', '1234'),
(12, 'yura@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `masuk`
--

CREATE TABLE `masuk` (
  `idmasuk` int(11) NOT NULL,
  `idbarang` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `penerima` varchar(25) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masuk`
--

INSERT INTO `masuk` (`idmasuk`, `idbarang`, `tanggal`, `penerima`, `qty`) VALUES
(12, 9, '2024-07-31 07:21:33', 'Depon', 100),
(16, 2, '2024-08-01 02:49:59', 'Xyuraa', 35),
(17, 1, '2024-08-01 03:27:43', 'Rasyad', 22),
(20, 1, '2024-08-01 06:09:13', 'Xyuraa', 10),
(21, 3, '2024-08-01 06:17:56', 'Depon', 10),
(22, 2, '2024-08-01 06:19:18', 'ipkar', 10),
(23, 9, '2024-08-01 06:20:45', 'Rasyad', 100),
(26, 11, '2024-08-02 06:43:34', 'Depon', 10),
(29, 13, '2024-08-05 07:00:33', 'Xyuraa', 10);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `idpeminjaman` int(11) NOT NULL,
  `idbarang` int(11) NOT NULL,
  `tanggalpinjam` timestamp NOT NULL DEFAULT current_timestamp(),
  `qty` int(11) NOT NULL,
  `peminjam` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Dipinjam'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`idpeminjaman`, `idbarang`, `tanggalpinjam`, `qty`, `peminjam`, `status`) VALUES
(1, 9, '2024-08-08 06:32:41', 50, 'Depon', 'Kembali'),
(2, 3, '2024-08-08 07:03:44', 10, 'Depon', 'Kembali'),
(3, 9, '2024-08-08 08:06:30', 50, 'Depon', 'Kembali'),
(4, 2, '2024-08-08 08:20:04', 10, 'Depon', 'Kembali'),
(5, 2, '2024-08-08 08:21:12', 10, 'Xyuraa', 'Kembali'),
(6, 2, '2024-08-09 06:39:21', 10, 'Xyuraa', 'Dipinjam'),
(7, 9, '2024-08-09 06:39:37', 50, 'Elga', 'Kembali'),
(8, 1, '2024-08-12 04:54:58', 10, 'Depon', 'Kembali'),
(9, 9, '2024-08-12 05:01:21', 50, 'Xyuraa', 'Dipinjam');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `idbarang` int(11) NOT NULL,
  `namabarang` varchar(25) NOT NULL,
  `deskripsi` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`idbarang`, `namabarang`, `deskripsi`, `stock`, `image`) VALUES
(1, 'Poco X3 Pro', 'Sebuah Handphone Product Xiaomi', 0, '9458f86387ed07022e6fe469846261b7.png'),
(2, 'Iphone 13 Pro Max', 'Sebuah Handphone', 30, 'bf8558011e663316fc886b3dc7b048af.jpg'),
(3, 'Nike', 'Sebuah Sepatu', 52, 'e28deb7af13fd0fbb002ab600a8e2a62.jpg'),
(4, 'Gas LPG 3KG', 'gas buat masak', 35, '047c67b326e5f59df86399870d1f82f8.jpeg'),
(9, 'Indomie Goreng', 'Mie goreng instant', 200, '115be5fb2654d254053390b900dbcb9d.jpg'),
(11, 'Indomie rebus', 'Mie kuah instant', 45, 'ae3f1cb5016a8c2038115bee42918852.jpeg'),
(12, 'Adidas', 'Sepatu', 35, 'f30c12e6c82618d95e146b7a2319b80a.jpg'),
(13, 'Lenovo Ideapad Gaming 3', 'Laptop Gaming', 15, 'c8a8026bfe102d02a9353364910db257.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keluar`
--
ALTER TABLE `keluar`
  ADD PRIMARY KEY (`idkeluar`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `masuk`
--
ALTER TABLE `masuk`
  ADD PRIMARY KEY (`idmasuk`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`idpeminjaman`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`idbarang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keluar`
--
ALTER TABLE `keluar`
  MODIFY `idkeluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `masuk`
--
ALTER TABLE `masuk`
  MODIFY `idmasuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `idpeminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `idbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
