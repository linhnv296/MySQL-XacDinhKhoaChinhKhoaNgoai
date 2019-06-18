-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th6 18, 2019 lúc 03:37 PM
-- Phiên bản máy phục vụ: 5.7.26-0ubuntu0.18.04.1
-- Phiên bản PHP: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `taikhoannganhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Accounts`
--

CREATE TABLE `Accounts` (
  `account_number` int(11) NOT NULL,
  `account_type` varchar(20) DEFAULT NULL,
  `openDate` date DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `customer_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Customers`
--

CREATE TABLE `Customers` (
  `customer_number` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE `transactions` (
  `tran_number` int(11) NOT NULL,
  `account_number` int(11) NOT NULL,
  `dateTranfer` date NOT NULL,
  `amounts` int(11) NOT NULL,
  `descriptions` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `Accounts`
--
ALTER TABLE `Accounts`
  ADD PRIMARY KEY (`account_number`),
  ADD KEY `customer_number` (`customer_number`);

--
-- Chỉ mục cho bảng `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`customer_number`);

--
-- Chỉ mục cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`tran_number`),
  ADD KEY `account_number` (`account_number`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `Accounts`
--
ALTER TABLE `Accounts`
  MODIFY `account_number` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `Customers`
--
ALTER TABLE `Customers`
  MODIFY `customer_number` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `transactions`
--
ALTER TABLE `transactions`
  MODIFY `tran_number` int(11) NOT NULL AUTO_INCREMENT;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `Accounts`
--
ALTER TABLE `Accounts`
  ADD CONSTRAINT `Accounts_ibfk_1` FOREIGN KEY (`customer_number`) REFERENCES `Customers` (`customer_number`);

--
-- Các ràng buộc cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `Accounts` (`account_number`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
