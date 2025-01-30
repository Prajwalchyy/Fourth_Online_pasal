-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2025 at 04:46 AM
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
-- Database: `fourthproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `productId`, `user_id`, `quantity`) VALUES
(113, 40, 34, 2),
(114, 41, 34, 4),
(115, 43, 34, 1),
(116, 43, 40, 1),
(117, 41, 40, 5),
(118, 42, 34, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(3, 'fooding'),
(5, 'clothing'),
(6, 'Electronic');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_quantity` int(15) NOT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `productId`, `user_id`, `order_quantity`, `invoice_no`, `order_date`) VALUES
(7, 40, 46, 1, '657195046b5cc4.02189737', '2023-12-07 15:33:52'),
(8, 41, 46, 1, '657195046b5cc4.02189737', '2023-12-07 15:33:52');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productId` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `stock` int(150) NOT NULL,
  `size` varchar(50) NOT NULL,
  `used` varchar(50) NOT NULL,
  `productType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `user_id`, `productName`, `price`, `description`, `category`, `image`, `stock`, `size`, `used`, `productType`) VALUES
(40, 42, 'Head phone', '1500', 'This is a branded head phone with best quality sound.', 'electronic', '652d5d0f08313.jpeg', 10, '', '', 'new'),
(41, 42, 'Chocolate', '500', 'This chocolate are dark creamy chocolate and delicious to eat.', 'fooding', '652d5dd3d6cb1.jpeg', 20, '', '', 'new'),
(42, 42, 'Samsung Mobile', '7000', 'This mobile is used mobile and in fresh condition.', 'electronic', '652d5e624005d.png', 1, '', '5 month', 'old'),
(43, 40, 'Head phone', '2000', 'This is the original branded head phone with garenty 1 year', 'electronic', '652d5f7064bbc.jpg', 2, '', '', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` bigint(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_image` varchar(50) NOT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'user_type',
  `dt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`user_id`, `fname`, `email`, `phone`, `address`, `password`, `user_image`, `user_type`, `dt`) VALUES
(34, 'Niraj Chaudhary', 'nc72723@gmail.com', 9814372723, 'Duhabi-9', 'e1d655c1c671b30b9be1cd8e06b4bcd6', '656c857c3f8c1.jpg', 'Admin', '2023-12-03 13:41:16'),
(40, 'Prajwal Chaudhary', 'prajwal@gmail.com', 9812345611, 'Duhabi', '967454173c7637d071a8bd30224407e3', '656b543b43504.jpg', 'Seller', '2023-12-02 15:58:51'),
(41, 'Ram Chaudhary', 'ram@gmail.com', 9811154389, 'Biratnagar', '4641999a7679fcaef2df0e26d11e3c72', '', 'Buyer', '2023-10-16 15:25:38'),
(42, 'Ishan Rai', 'ishan@gmail.com', 9823456816, 'Ithari', '6f6a4b9e983c1de1ae719bb187de13c7', '', 'Seller', '2023-10-16 15:27:16'),
(43, 'Ritesh Shrestha', 'ritesh@gmail.com', 9876456356, 'Dharan', 'f4a13757ff626da555b27c9c1f82a01b', '652e0089a5963.jpg', 'Buyer', '2023-10-17 03:33:29'),
(44, 'Hello', 'hello@abc', 9823401928, 'brt', '900150983cd24fb0d6963f7d28e17f72', '', 'Seller', '2023-11-02 06:49:49'),
(46, 'Buyer', 'buyer1@gmail.com', 9812345678, 'duhabi', '827ccb0eea8a706c4c34a16891f84e7b', '', 'Buyer', '2023-12-07 09:47:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `productId` (`productId`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `signup` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `signup` (`user_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `signup` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
