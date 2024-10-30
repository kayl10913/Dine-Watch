-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2024 at 12:25 AM
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
-- Database: `dine-watch`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `log_id` int(11) NOT NULL,
  `action_by` int(11) DEFAULT NULL,
  `action_type` enum('Login','Logout','Create Reservation','Update Reservation','Cancel Reservation','Order Placed','Order Updated','Order Canceled','Add Product','Update Product','Delete Product') DEFAULT NULL,
  `action_details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`log_id`, `action_by`, `action_type`, `action_details`, `created_at`) VALUES
(205, 12, 'Login', 'user1 logged in', '2024-10-27 11:00:43'),
(206, 12, 'Logout', 'user1 logged out', '2024-10-27 11:00:48'),
(207, 10, 'Login', 'jcaringal logged in', '2024-10-27 11:00:54'),
(208, 10, 'Logout', 'jcaringal logged out', '2024-10-27 11:10:49'),
(209, 10, 'Login', 'jcaringal logged in', '2024-10-27 11:10:57'),
(210, 10, 'Login', 'jcaringal logged in', '2024-10-28 00:18:16'),
(211, 10, 'Logout', 'jcaringal logged out', '2024-10-28 00:20:39'),
(212, 10, 'Login', 'jcaringal logged in', '2024-10-28 00:20:46'),
(213, 10, 'Logout', 'jcaringal logged out', '2024-10-28 01:19:21'),
(214, 10, 'Login', 'jcaringal logged in', '2024-10-28 01:19:32'),
(215, 10, 'Logout', 'jcaringal logged out', '2024-10-28 01:20:35'),
(216, 10, 'Login', 'jcaringal logged in', '2024-10-28 01:22:57'),
(217, 10, 'Logout', 'jcaringal logged out', '2024-10-28 01:59:45'),
(218, 10, 'Login', 'jcaringal logged in', '2024-10-28 02:06:58'),
(219, 10, 'Logout', 'jcaringal logged out', '2024-10-28 02:07:28'),
(220, 12, 'Add Product', 'Added a new product: Pizzasdf (Category ID: 1)', '2024-10-29 03:29:08'),
(221, 28, 'Login', 'hdsaa logged in', '2024-10-29 03:49:07'),
(222, 12, 'Add Product', 'Added a new product: Black Coffee (S) (Category ID: 4)', '2024-10-29 04:12:37'),
(223, 12, 'Add Product', 'Added a new product: Pizzasd (Category ID: 2)', '2024-10-29 04:14:56'),
(224, 12, 'Logout', 'user1 logged out', '2024-10-29 04:30:06'),
(225, 10, 'Login', 'jcaringal logged in', '2024-10-29 04:30:12'),
(226, 10, 'Logout', 'jcaringal logged out', '2024-10-29 04:30:34'),
(227, 12, 'Login', 'user1 logged in', '2024-10-29 04:30:43'),
(228, 28, 'Login', 'hdsaa logged in', '2024-10-29 06:19:38'),
(229, 28, 'Login', 'hdsaa logged in', '2024-10-29 06:24:22'),
(230, 28, 'Login', 'hdsaa logged in', '2024-10-29 06:24:30'),
(231, 28, 'Login', 'hdsaa logged in', '2024-10-29 07:11:16'),
(232, 28, 'Login', 'hdsaa logged in', '2024-10-29 07:42:34'),
(233, 28, 'Login', 'hdsaa logged in', '2024-10-29 08:00:46'),
(234, 1, 'Login', 'mcaringal logged in', '2024-10-29 12:15:26'),
(235, 1, 'Login', 'mcaringal logged in', '2024-10-29 23:20:50');

-- --------------------------------------------------------

--
-- Table structure for table `error_logs`
--

CREATE TABLE `error_logs` (
  `log_id` int(11) NOT NULL,
  `error_message` text DEFAULT NULL,
  `error_type` varchar(100) DEFAULT NULL,
  `occurred_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `feedback_text` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `order_details` text DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `order_time` datetime DEFAULT current_timestamp(),
  `status` enum('Pending','In-Progress','Completed','Canceled') DEFAULT 'Pending',
  `feedback` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_method` varchar(50) DEFAULT 'Credit Card'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `reservation_id`, `order_details`, `total_amount`, `order_time`, `status`, `feedback`, `created_at`, `updated_at`, `payment_method`) VALUES
(1, 2, 1, 'Burger - 1, Fries - 1, Coke - 1', 45.50, '2024-10-08 18:30:00', 'Pending', NULL, '2024-10-10 02:37:23', '2024-10-28 01:59:00', 'Credit Card'),
(2, 2, 1, NULL, 45.50, '2024-10-10 09:50:08', 'In-Progress', NULL, '2024-10-10 02:37:23', '2024-10-25 09:55:57', 'Credit Card');

-- --------------------------------------------------------

--
-- Table structure for table `order_cancellations`
--

CREATE TABLE `order_cancellations` (
  `cancellation_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `cancellation_reason` text DEFAULT NULL,
  `canceled_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalprice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `user_id`, `product_id`, `quantity`, `totalprice`) VALUES
(17, 1, 12, 4, 4, 80.00),
(20, 1, 12, 1, 4, 240.00),
(22, 1, 12, 3, 4, 48.00),
(23, 1, 28, 1, 2, 60.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`category_id`, `category_name`) VALUES
(1, 'Meal'),
(2, 'Drink'),
(3, 'drinks'),
(4, 'addons');

-- --------------------------------------------------------

--
-- Table structure for table `product_items`
--

CREATE TABLE `product_items` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `special_instructions` text DEFAULT NULL,
  `product_image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quantity` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_items`
--

INSERT INTO `product_items` (`product_id`, `product_name`, `price`, `special_instructions`, `product_image`, `created_at`, `updated_at`, `quantity`, `category_id`) VALUES
(1, 'Black Coffee', 60.00, 'Coffee brewed in a large batch using hot water and ground KAPENG BARAKO beans.', '../Uploads/671458170c418_images.jpg', '2024-10-07 10:35:00', '2024-10-23 03:45:42', 20, 2),
(2, 'Bacon Cheeseburger The BCB (M)', 249.00, 'House marinara, mozzarella cheese, special cheese sauce, bell pepper, onions, ground beef, and bacon.', '../Uploads/671458be593cc_images (1).jpg', '2024-10-07 10:35:00', '2024-10-19 17:27:25', 20, 2),
(3, 'Pizzasdf', 12.00, '', '../Uploads/67205684a0d61_marvelous-city-skyline.jpg', '2024-10-29 03:29:08', '2024-10-29 03:29:08', 1234567, 1),
(4, 'Black Coffee (S)', 20.00, 'matapang', '../Uploads/672060b50f618_images.jpg', '2024-10-29 04:12:37', '2024-10-29 04:12:37', 3, 4),
(5, 'Pizzasd', 290.00, '290', '../Uploads/6720614004731_images (2).jpg', '2024-10-29 04:14:56', '2024-10-29 04:14:56', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `reservation_time` time DEFAULT NULL,
  `status` enum('Pending','Confirmed','Canceled','Rescheduled') DEFAULT 'Pending',
  `custom_note` varchar(255) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `user_id`, `table_id`, `reservation_date`, `reservation_time`, `status`, `custom_note`, `feedback`, `created_at`, `updated_at`) VALUES
(2, 2, 1, '2024-10-10', '19:00:00', 'Rescheduled', 'Please prepare the table for a birthday.', 'Looking forward to a good meal.', '2024-10-09 08:13:16', '2024-10-28 00:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_reschedule`
--

CREATE TABLE `reservation_reschedule` (
  `reschedule_id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `old_reservation_time` datetime DEFAULT NULL,
  `new_reservation_time` datetime DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `session_token`, `created_at`, `expires_at`) VALUES
(1, 2, 'random_secure_token_123', '2024-10-09 08:13:26', '2024-12-10 19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `table_id` int(11) NOT NULL,
  `table_number` int(11) NOT NULL,
  `seating_capacity` int(11) NOT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `area` enum('Indoor','Outdoor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`table_id`, `table_number`, `seating_capacity`, `is_available`, `area`) VALUES
(1, 9, 4, 1, 'Outdoor'),
(2, 2, 6, 1, 'Outdoor'),
(3, 3, 2, 1, 'Indoor'),
(27, 1, 2, 1, 'Outdoor'),
(28, 3, 1, 1, 'Outdoor');

-- --------------------------------------------------------

--
-- Table structure for table `table_images`
--

CREATE TABLE `table_images` (
  `image_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `position` enum('back view','left view','right view','front view') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_images`
--

INSERT INTO `table_images` (`image_id`, `table_id`, `image_path`, `uploaded_at`, `position`) VALUES
(1, 1, '../uploads/67161da98506b_images (2).jpg', '2024-10-18 11:00:41', 'back view'),
(2, 1, '../uploads/671871c0da28a_images (2).jpg', '2024-10-18 11:00:41', 'front view'),
(3, 2, '../uploads/671871dfb1037_images (2).jpg', '2024-10-18 11:00:41', 'back view'),
(33, 1, '../uploads/6716192d7c308_image.jpg', '2024-10-21 08:43:41', 'left view'),
(34, 2, '../uploads/671e06a31346a_GyulaiSausage.jpg', '2024-10-27 09:21:25', 'left view'),
(35, 2, '../uploads/671e069749121_images.jpg', '2024-10-27 09:23:35', 'right view');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_initial` char(1) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip_code` char(5) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('Owner','Admin','Staff','General User') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `middle_initial`, `last_name`, `suffix`, `contact_number`, `email`, `address`, `zip_code`, `username`, `password_hash`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mark Laurence', 'l', 'caringal', 'wq', '12345678901', 'ha1@gmail.com', 'place', '1234', 'mcaringal', '$2y$10$rXv6Cf2lAyz8v6iW.VI0Yeg06J013.ee2YQH/UiHr6s1.A6IeLPJq', 'General User', '2024-10-08 14:42:51', '2024-10-10 02:55:27', NULL),
(2, 'Mark Laurence1', 'l', 'caringal1', 'wq', '12345678901', 'ha2@gmail.com', 'place', '1234', 'mcaringal1', '$2y$10$QGqVj62jsTWdoBykgGQ7Oud.BcYJb.H2sWyB0.OgAqMTYKVwA4k5S', 'General User', '2024-10-08 14:47:12', '2024-10-08 14:47:12', NULL),
(4, 'Jhon Carl1', '', 'last2', '', '09999999999', 'as22@gmail.com', '', '', 'jlast2', '$2y$10$xc3ncPQ6b73XHDhGRhUhJOtG3VpdieA9wxWJWjKI4QOlZ53XI9oHi', 'Staff', '2024-10-19 09:44:43', '2024-10-25 09:52:11', NULL),
(5, 'Mark james', 'l', 'last3', '', '12345678908', 'haha1@gmail.com', 'place', '45345', 'mlast3', '$2y$10$mMacmmxWCYvFDcnJWrRh.Oka5uaIcGGWaDIQBdcf9hMbJw.QjYIWW', 'General User', '2024-10-19 11:04:08', '2024-10-19 11:04:08', NULL),
(6, 'Jack', 'N', 'Jill', '', '12345678901', 'Jack@gmail.com', 'place', '1234', 'jjill', '$2y$10$3bQxRoIXBSv5SUm05bH3luhvlCzHzAkvwtkk/i7BBWh5jeVeKO/3C', 'General User', '2024-10-20 22:57:10', '2024-10-20 22:57:10', NULL),
(9, 'Jack', 'N', 'Jill', 'jr', '12345678901', 'ha@gmail.com', 'place', '1234', 'jjill2', '$2y$10$WCeduJTp2/rnAYOb6fxiZuTB0zbO25tbUpUWXKe4uKoRYHQWIvrBO', 'General User', '2024-10-20 23:05:58', '2024-10-20 23:05:58', NULL),
(10, 'Jack ja', 'l', 'caringal', '', '12345678901', 'ha22@gmail.com', 'place', '1234', 'jcaringal', '$2y$10$s6yPImq4oGkVTK5M0mn6ru2BwvADYTkNAiX7FlsV0IycOYmfdsmb.', 'Owner', '2024-10-21 03:31:27', '2024-10-25 02:43:31', NULL),
(12, 'Mark Laurence', NULL, 'Caringal', NULL, '09999999999', 'mk12@gmail.com', NULL, NULL, 'user1', '$2y$10$9r7ey09l5HQpu9vx8HG2LuE.0gw3076KS.s0pp0rFiEFwv5oEJHY6', 'Admin', '2024-10-25 03:58:06', '2024-10-27 09:45:24', NULL),
(24, 'Mark Laurence', NULL, 'Caringal', NULL, '09999999999', 'hatdog11@gmail.com', NULL, NULL, 'user11', '$2y$10$FjHm53884HxQgj8YmboVU.ZshiOxJnoH8SrheUJxToXEiZGBM.xBq', 'Staff', '2024-10-25 08:27:51', '2024-10-25 08:27:51', NULL),
(25, 'Mark Laurence', 'l', 'caringal', 'jr', '346', 'ha11@gmail.com', 'place', '1234', 'mcaringal3', '$2y$10$QiWhXKiBjCe.Lg51N0Wx1OD1HK/koDR0tA8vJm2yKOujhIFy4Bdi6', 'General User', '2024-10-28 01:22:11', '2024-10-28 01:22:11', NULL),
(27, 'Mark Laurence', 'l', 'caringal', 'wq', '09345678901', 'ha121@gmail.com', 'place', '1234', 'mcaringal4', '$2y$10$LNnmuf/OolCYLsoH/wGH.e2uVTJkvKTxj49.aR2xafDryhLk2ZaXK', 'General User', '2024-10-28 02:14:56', '2024-10-28 02:14:56', NULL),
(28, 'hala', 's', 'dsaa', 'sad', '09876543231', 'jen@gmail.com', 'asd', '1231', 'hdsaa', '$2y$10$U8F0Kl8CU7Y8RHbJtZULOOrZQ2Gl70Up1429ZXLMwPjTjGU2mI09S', 'General User', '2024-10-29 03:48:59', '2024-10-29 03:48:59', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `action_by` (`action_by`);

--
-- Indexes for table `error_logs`
--
ALTER TABLE `error_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_cancellations`
--
ALTER TABLE `order_cancellations`
  ADD PRIMARY KEY (`cancellation_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `product_items`
--
ALTER TABLE `product_items`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `table_id` (`table_id`),
  ADD KEY `idx_reservations_date` (`reservation_date`);

--
-- Indexes for table `reservation_reschedule`
--
ALTER TABLE `reservation_reschedule`
  ADD PRIMARY KEY (`reschedule_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `table_images`
--
ALTER TABLE `table_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `table_id` (`table_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `error_logs`
--
ALTER TABLE `error_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_cancellations`
--
ALTER TABLE `order_cancellations`
  MODIFY `cancellation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `product_items`
--
ALTER TABLE `product_items`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation_reschedule`
--
ALTER TABLE `reservation_reschedule`
  MODIFY `reschedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `table_images`
--
ALTER TABLE `table_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`action_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET NULL;

--
-- Constraints for table `order_cancellations`
--
ALTER TABLE `order_cancellations`
  ADD CONSTRAINT `order_cancellations_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_items`
--
ALTER TABLE `product_items`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`category_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
