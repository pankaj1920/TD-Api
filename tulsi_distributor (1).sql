-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2021 at 02:11 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tulsi_distributor`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(234) DEFAULT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `phone_number` double DEFAULT NULL,
  `alternate_number` varchar(234) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `aadhar_number` varchar(234) DEFAULT NULL,
  `aadhar_image` varchar(234) DEFAULT NULL,
  `profile` varchar(250) DEFAULT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `role` varchar(250) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_join` date DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `emp_id`, `first_name`, `last_name`, `email`, `phone_number`, `alternate_number`, `address`, `aadhar_number`, `aadhar_image`, `profile`, `company_name`, `logo`, `role`, `date_of_birth`, `date_of_join`, `password`) VALUES
(1, NULL, 'admin', 'g', 'admin@gmail.com', 7760994989, '9448551256', 'mysore', '1478529630123', NULL, 'Capture over.PNG', 'designurway', NULL, 'admin', '1997-05-26', NULL, '123');

-- --------------------------------------------------------

--
-- Table structure for table `admin_brands`
--

CREATE TABLE `admin_brands` (
  `id` int(11) NOT NULL,
  `distributor_id` int(11) DEFAULT NULL,
  `brand_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_brands`
--

INSERT INTO `admin_brands` (`id`, `distributor_id`, `brand_name`) VALUES
(1, 1, 'HAIER'),
(2, 1, 'ONIDA'),
(3, 2, 'BOSCH'),
(4, 2, 'Voltas'),
(5, 3, 'GIZMORE'),
(6, 3, 'JBL');

-- --------------------------------------------------------

--
-- Table structure for table `admin_product_details`
--

CREATE TABLE `admin_product_details` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `product_name` varchar(250) DEFAULT NULL,
  `basic_amount` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_image` varchar(250) DEFAULT NULL,
  `description` varchar(2500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_product_details`
--

INSERT INTO `admin_product_details` (`id`, `brand_id`, `product_name`, `basic_amount`, `tax`, `total_amount`, `status`, `quantity`, `product_image`, `description`) VALUES
(1, 1, 'HR AC 1.5T 3* HS 18T-NCS3B - IDU', 1500, 18, 1770, 'Instock', 250, NULL, 'HR AC 1.5T 3* HS 18T-NCS3B - IDU'),
(2, 3, 'BOSCH FRONT LOAD 7KG WAJ 24262 IN', 1500, 18, 1770, 'outofstack', 250, NULL, 'BOSCH FRONT LOAD 7KG WAJ 24262 IN');

-- --------------------------------------------------------

--
-- Table structure for table `dealer_brand`
--

CREATE TABLE `dealer_brand` (
  `id` int(23) NOT NULL,
  `sales_executive_id` int(23) DEFAULT NULL,
  `dealer_id` int(23) DEFAULT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dealer_brand`
--

INSERT INTO `dealer_brand` (`id`, `sales_executive_id`, `dealer_id`, `product_id`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dealer_details`
--

CREATE TABLE `dealer_details` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `shop_name` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `pincode` varchar(234) DEFAULT NULL,
  `phone_number` varchar(23) DEFAULT NULL,
  `profile` varchar(250) NOT NULL,
  `tele_number` varchar(21) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `gst_no` varchar(201) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `dealer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dealer_details`
--

INSERT INTO `dealer_details` (`id`, `name`, `shop_name`, `address`, `pincode`, `phone_number`, `profile`, `tele_number`, `email`, `gst_no`, `latitude`, `longitude`, `dealer_id`) VALUES
(1, 'COORG REFRIGERATION & SALES CORPORATION', 'COORG REFRIGERATION & SALES CORPORATION', 'Showroom Address: 192, B Block, 10th Cross,Akkamahadevi Rd, opp. Police Station, Block A, JP Nagar,Mysuru, Karnataka 570008', '571234', '9449530106', '', '08276 271266', 'COORGREFSALESCORP@GMAIL.COM', NULL, NULL, NULL, 0),
(2, 'GANAPATHY DISTRIBUTORS - MYS', 'GANAPATHY DISTRIBUTORS - MYS', '#944/1D, 2ND MAIN LAKSHMIPURAM\r\nCHAMARAJAMOHALLA\r\nOPP LAKSHMIPURAM POST OFFICE\r\nMYSURU - 570004', '570004', '9108959988', '', '9900114340', '', '29AJXPG8502H1ZQ', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

CREATE TABLE `demo` (
  `id` int(11) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `demo`
--

INSERT INTO `demo` (`id`, `address`, `pincode`) VALUES
(4, 'Uttrakhand', '262309'),
(5, 'Delhi', '12346566'),
(6, 'Banglore', '789654');

-- --------------------------------------------------------

--
-- Table structure for table `demo2`
--

CREATE TABLE `demo2` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `age` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `demo2`
--

INSERT INTO `demo2` (`id`, `name`, `age`) VALUES
(2, 'Pankaj', '25');

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `id` int(11) NOT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `phone_number` double DEFAULT NULL,
  `alternate_number` varchar(234) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `aadhar_number` varchar(234) DEFAULT NULL,
  `aadhar_image` varchar(234) DEFAULT NULL,
  `profile` varchar(250) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `role` varchar(250) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_join` date DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `alternate_number`, `address`, `aadhar_number`, `aadhar_image`, `profile`, `logo`, `role`, `date_of_birth`, `date_of_join`, `password`) VALUES
(1, 'TULSI MARKETING', 'TULSI MARKETING', 'tddistributor@gmail.com', 8799663311, '96325896325', 'bangalore', '963258963258', NULL, NULL, NULL, 'distributor', NULL, NULL, '123'),
(2, 'PCUBE', 'PCUBE', 'tdpcubeor@gmail.com', 8799663311, '96325896325', 'bangalore', '963258963258', NULL, NULL, NULL, 'distributor', NULL, NULL, '123'),
(3, 'GUGLIYA DISTRIBUTING CO ', 'GUGLIYA DISTRIBUTING CO ', 'gugliya@gmail.com', 8799663311, '96325896325', 'bangalore', '963258963258', NULL, NULL, NULL, 'distributor', NULL, NULL, '123');

-- --------------------------------------------------------

--
-- Table structure for table `emp_login_deatils`
--

CREATE TABLE `emp_login_deatils` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(234) NOT NULL,
  `sales_executive_id` varchar(114) NOT NULL,
  `profile` varchar(250) NOT NULL,
  `login_date` varchar(234) NOT NULL,
  `login_time` time NOT NULL DEFAULT current_timestamp(),
  `logout_time` time NOT NULL DEFAULT current_timestamp(),
  `latitude` varchar(80) NOT NULL,
  `longitude` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_login_deatils`
--

INSERT INTO `emp_login_deatils` (`id`, `emp_id`, `sales_executive_id`, `profile`, `login_date`, `login_time`, `logout_time`, `latitude`, `longitude`) VALUES
(26, 'TD001', '1', '1617086618.jpg', '22-03-2021', '12:13:38', '12:13:38', '53152', '6666'),
(27, '1', 'TD001', '1617086655.jpg', '09-03-2021', '12:14:15', '12:14:15', '53152', '6666'),
(28, '1', 'TD001', '1617090129.jpg', '30-3-2021', '13:12:09', '13:12:09', '12.2640248', '76.6444704'),
(29, '1', 'TD001', '1617095952.jpg', '30-3-2021', '14:49:12', '14:49:12', '12.2640347', '76.6444353'),
(30, '1', 'TD001', '1617095953.jpg', '30-3-2021', '14:49:13', '14:49:13', '12.2640206', '76.6444794'),
(31, '1', 'TD001', '1617096219.jpg', '30-3-2021', '14:53:39', '14:53:39', '12.2640415', '76.6444253'),
(32, '1', 'TD001', '1617184125.jpg', '31-3-2021', '15:18:45', '15:18:45', 'null', 'null'),
(33, '1', 'TD001', '1617185273.jpg', '31-3-2021', '15:37:53', '15:37:53', 'null', 'null'),
(34, '1', 'TD001', '1617185737.jpg', '31-3-2021', '15:45:37', '15:45:37', 'null', 'null'),
(35, '1', 'TD001', '1617185781.jpg', '31-3-2021', '15:46:21', '15:46:21', 'null', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `executive_notification`
--

CREATE TABLE `executive_notification` (
  `id` int(23) NOT NULL,
  `emp_id` varchar(234) DEFAULT NULL,
  `route_assigned_id` int(23) DEFAULT NULL,
  `title` varchar(233) DEFAULT NULL,
  `body` varchar(233) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `executive_notification`
--

INSERT INTO `executive_notification` (`id`, `emp_id`, `route_assigned_id`, `title`, `body`, `created_date`) VALUES
(1, 'TD001', 1, 'New Task', '#191, Suswani Towers,\r\n3rd floor, B Block, 1st stage,\r\nC-Block, JP Nagar, Mysuru', '2021-03-10 07:26:14'),
(2, 'TD001', 2, 'New Task', '#191, Suswani Towers,\r\n3rd floor, B Block, 1st stage,\r\nC-Block, JP Nagar, Mysuru', '2021-03-16 07:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `notification_token`
--

CREATE TABLE `notification_token` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(100) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification_token`
--

INSERT INTO `notification_token` (`id`, `emp_id`, `token`) VALUES
(1, 'TD001', 'cTdU4mIxTBOnsTbLbhBXpS:APA91bFD7OR5ZvwQl8E5m0lNSKDSKSAm7vZ_YRaZGFPrBbF9LNafvVlyd0JCaskPrs9s6Bzmf7PO4JR0jh0TXSvZh-Dw7j6T7MvCs5qhmr3WWfY-V-UJCEFt9lWzw4_NBZeYMdaPjrJG');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `sales_executive_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `ref_no` varchar(200) DEFAULT NULL,
  `dealer_id` int(11) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `order_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `sales_executive_id`, `product_id`, `ref_no`, `dealer_id`, `stock_quantity`, `order_quantity`) VALUES
(24, 1, 1, 'Refno516241', 1, 59, 0),
(32, 1, 1, 'Refno818554', 1, 59, 67),
(33, 1, 2, 'Refno818554', 1, 59, 60),
(34, 1, 1, 'Refno680726', 1, 59, 0),
(35, 1, 2, 'Refno680726', 1, 59, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `id` int(23) NOT NULL,
  `reference_id` varchar(233) DEFAULT NULL,
  `dealer_id` varchar(233) DEFAULT NULL,
  `total_amount` varchar(233) DEFAULT NULL,
  `pending_amount` varchar(233) DEFAULT NULL,
  `advance_amount` varchar(233) DEFAULT NULL,
  `due_date` date DEFAULT current_timestamp(),
  `purchase_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`id`, `reference_id`, `dealer_id`, `total_amount`, `pending_amount`, `advance_amount`, `due_date`, `purchase_date`) VALUES
(1, '111', '5', '1000', '500', '100', '2021-03-29', '2021-03-29'),
(19, 'Refno545906', '1', '127500', '500', '100', '2021-03-29', '2021-03-29'),
(20, 'Refno545906', '1', '180000', '500', '100', '2021-03-29', '2021-03-29'),
(21, 'Refno545906', '1', '165000', '500', '100', '2021-03-29', '2021-03-29'),
(22, 'Refno818554', '1', '571500', '500', '100', '2021-03-29', '2021-03-29'),
(23, 'Refno680726', '1', '3000', '500', '100', '2021-03-30', '2021-03-30');

-- --------------------------------------------------------

--
-- Table structure for table `routing`
--

CREATE TABLE `routing` (
  `id` int(11) NOT NULL,
  `distributor_id` int(11) DEFAULT NULL,
  `sale_executive_id` int(11) DEFAULT NULL,
  `dealer_id` int(111) DEFAULT NULL,
  `order_status` varchar(250) DEFAULT NULL,
  `date` date NOT NULL,
  `login_time` time NOT NULL DEFAULT current_timestamp(),
  `logout_time` time DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routing`
--

INSERT INTO `routing` (`id`, `distributor_id`, `sale_executive_id`, `dealer_id`, `order_status`, `date`, `login_time`, `logout_time`) VALUES
(1, 1, 1, 1, 'completed', '2021-03-16', '09:47:04', '09:47:04'),
(2, 5, 1, 1, 'pending', '2021-03-17', '12:41:53', '12:41:53'),
(3, 2, 1, 0, 'pending', '2021-03-16', '12:43:01', '12:43:01'),
(4, 0, 0, 0, 'pending', '2021-03-16', '13:00:36', '13:00:36');

-- --------------------------------------------------------

--
-- Table structure for table `sales_executive`
--

CREATE TABLE `sales_executive` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(100) DEFAULT NULL,
  `distributor_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `phone_number` double DEFAULT NULL,
  `otp` varchar(234) NOT NULL,
  `alter_number` double DEFAULT NULL,
  `device_id` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `profile` varchar(250) DEFAULT NULL,
  `role` varchar(234) DEFAULT NULL,
  `aadhar_number` int(36) DEFAULT NULL,
  `aadhar_image` varchar(250) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_executive`
--

INSERT INTO `sales_executive` (`id`, `emp_id`, `distributor_id`, `brand_id`, `first_name`, `last_name`, `email`, `phone_number`, `otp`, `alter_number`, `device_id`, `address`, `profile`, `role`, `aadhar_number`, `aadhar_image`, `date_of_birth`, `date_of_joining`, `password`) VALUES
(1, 'TD001', 1, 2, 'Pankaj', 'g', 'sale1@gmail.com', 8171831066, '8078', 9448551256, 'fdsg', 'dfdfdfd', 'new-bmw-x3-front-profile.jpg', 'SalesExecutive', 2147483647, 'arms.PNG', '1997-05-23', '2021-03-16', '123456'),
(2, 'SR025', 1, 1, 'Pankyttaj', 'g', 'sale@gmail.com', 8755420120, '1924', 9448551256, NULL, 'sdsdsd', 'images/QYvtA7c56BbBKudaBenSjkA2Oro6PxXYzpTa3Zqw.png', 'SalesExecutive', 2147483647, 'Capturedd.PNG', '2000-05-14', '2021-03-11', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` int(23) NOT NULL,
  `emp_id` varchar(233) DEFAULT NULL,
  `query` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`id`, `emp_id`, `query`) VALUES
(6, 'TD001', 'ghshhs'),
(7, 'TD001', 'ghshhs'),
(8, 'TD001', 'hdhdb'),
(9, 'TD001', 'hello');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_brands`
--
ALTER TABLE `admin_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_product_details`
--
ALTER TABLE `admin_product_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dealer_brand`
--
ALTER TABLE `dealer_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dealer_details`
--
ALTER TABLE `dealer_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `demo`
--
ALTER TABLE `demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `demo2`
--
ALTER TABLE `demo2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_login_deatils`
--
ALTER TABLE `emp_login_deatils`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `executive_notification`
--
ALTER TABLE `executive_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_token`
--
ALTER TABLE `notification_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routing`
--
ALTER TABLE `routing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_executive`
--
ALTER TABLE `sales_executive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_brands`
--
ALTER TABLE `admin_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_product_details`
--
ALTER TABLE `admin_product_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dealer_brand`
--
ALTER TABLE `dealer_brand`
  MODIFY `id` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dealer_details`
--
ALTER TABLE `dealer_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `demo`
--
ALTER TABLE `demo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `demo2`
--
ALTER TABLE `demo2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `emp_login_deatils`
--
ALTER TABLE `emp_login_deatils`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `executive_notification`
--
ALTER TABLE `executive_notification`
  MODIFY `id` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification_token`
--
ALTER TABLE `notification_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `routing`
--
ALTER TABLE `routing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales_executive`
--
ALTER TABLE `sales_executive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
