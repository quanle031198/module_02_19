-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th4 29, 2021 lúc 11:42 AM
-- Phiên bản máy phục vụ: 10.3.25-MariaDB-0ubuntu0.20.04.1
-- Phiên bản PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demo`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`phpmyadmin`@`localhost` PROCEDURE `delProduct` (IN `proId` INT(11))  DELETE FROM products WHERE id = proId$$

CREATE DEFINER=`phpmyadmin`@`localhost` PROCEDURE `getALlproduct` ()  BEGIN 
SELECT *FROM products;
END$$

CREATE DEFINER=`phpmyadmin`@`localhost` PROCEDURE `insertProduct` (IN `proC` VARCHAR(10), IN `proN` VARCHAR(20), IN `proPri` FLOAT, IN `ProAmo` INT(10), IN `proSta` VARCHAR(10))  BEGIN
INSERT INTO products(`productCode`,`productName`,`productPrice`,`productAmount`,`productStatus`) VALUE (proC,proN,proPri,proAmo,proSta);
END$$

CREATE DEFINER=`phpmyadmin`@`localhost` PROCEDURE `updateProducts` (IN `proId` INT(10), IN `proC` VARCHAR(10), IN `proN` VARCHAR(20), IN `proPri` FLOAT, IN `proAmo` INT(10), IN `proDesc` VARCHAR(30), IN `prosta` VARCHAR(10))  UPDATE products
SET  productCode = proC , productName = proN, productPrice = proPri, productAmount = proAmo, productDescription = proDesc, productStatus = prosta
WHERE id = proId$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `productCode` varchar(10) NOT NULL,
  `productName` varchar(25) NOT NULL,
  `productPrice` float NOT NULL,
  `productAmount` int(10) NOT NULL,
  `productDescription` varchar(25) DEFAULT NULL,
  `productStatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`) VALUES
(1, 'PD001', 'Supar 1998', 10000000000, 25, NULL, '1'),
(2, 'PD002', 'skyline', 10000000, 25, NULL, '1'),
(3, 'PD003', 'bmw', 1000000, 21, NULL, '1'),
(4, 'PD004', 'lambor', 1000000, 25, NULL, '1'),
(5, 'PD005', 'agera KIng', 10000, 10, NULL, '1'),
(6, 'PD006', 'ferrari', 5000000, 4, NULL, '1'),
(7, 'PD007', 'mustang', 35000000000, 6, NULL, '1'),
(8, 'PD008', 'ford', 8523, 22, NULL, '1');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_productCode` (`productCode`),
  ADD KEY `index_proName_proPrice` (`productName`,`productPrice`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
