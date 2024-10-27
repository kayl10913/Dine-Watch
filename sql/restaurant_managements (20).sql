-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2024 at 10:06 AM
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
-- Database: `restaurant_managements`
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
(1, 1, 'Logout', 'mcaringal logged out', '2024-10-09 11:24:26'),
(2, 1, 'Login', 'mcaringal logged in', '2024-10-09 11:24:34'),
(3, 1, 'Logout', 'mcaringal logged out', '2024-10-09 13:32:45'),
(4, 1, 'Login', 'mcaringal logged in', '2024-10-09 13:32:58'),
(5, 1, 'Login', 'mcaringal logged in', '2024-10-09 13:35:04'),
(6, 3, 'Login', 'hdsaa logged in', '2024-10-09 22:38:59'),
(7, 3, 'Login', 'hdsaa logged in', '2024-10-09 22:40:02'),
(8, 3, 'Order Placed', 'Added a new product: da', '2024-10-10 01:33:13'),
(9, 3, 'Add Product', 'Added a new product: dsf (Category: Dessert)', '2024-10-10 01:39:52'),
(10, 3, 'Update Product', 'Updated product: pizza kingdf (Category: Meal)', '2024-10-10 01:43:40'),
(11, 3, 'Delete Product', 'Deleted product: dsf', '2024-10-10 01:43:49'),
(12, 3, 'Update Product', 'Updated product: Coke (Category: Drink)', '2024-10-10 02:05:06'),
(13, 3, 'Update Product', 'Updated product: pizza kingdf (Category: Meal)', '2024-10-10 02:08:14'),
(14, 3, 'Logout', 'hdsaa logged out', '2024-10-10 02:43:36'),
(15, 3, 'Login', 'hdsaa logged in', '2024-10-10 02:43:39'),
(16, 3, 'Login', 'hdsaa logged in', '2024-10-13 07:43:57'),
(17, 3, 'Update Product', 'Updated product: pizza kingdf (Category: Meal)', '2024-10-13 07:47:43'),
(18, 3, 'Add Product', 'Added a new product: vvvvvvvvb (Category: Drink)', '2024-10-13 09:35:21'),
(19, 3, 'Login', 'hdsaa logged in', '2024-10-13 12:42:11'),
(20, 3, 'Login', 'hdsaa logged in', '2024-10-13 12:42:11'),
(21, 3, 'Login', 'hdsaa logged in', '2024-10-15 03:58:36'),
(22, 3, 'Update Product', 'Updated product: pizza kingdf (Category: Meal)', '2024-10-15 04:28:41'),
(23, 3, 'Login', 'hdsaa logged in', '2024-10-15 04:34:11'),
(24, 3, 'Login', 'hdsaa logged in', '2024-10-15 04:42:38'),
(25, 3, 'Login', 'hdsaa logged in', '2024-10-18 01:56:48'),
(26, 3, 'Login', 'hdsaa logged in', '2024-10-19 00:20:39'),
(27, 3, 'Login', 'hdsaa logged in', '2024-10-19 00:38:33'),
(28, 3, 'Logout', 'hdsaa logged out', '2024-10-19 01:43:01'),
(29, 3, 'Login', 'hdsaa logged in', '2024-10-19 01:43:08'),
(30, 3, 'Logout', 'hdsaa logged out', '2024-10-19 03:48:03'),
(31, 3, 'Login', 'hdsaa logged in', '2024-10-19 03:48:10'),
(32, 4, 'Login', 'jlast2 logged in', '2024-10-19 09:45:26'),
(33, 4, 'Login', 'jlast2 logged in', '2024-10-19 09:46:03'),
(34, 4, 'Logout', 'jlast2 logged out', '2024-10-19 09:47:08'),
(35, 4, 'Login', 'jlast2 logged in', '2024-10-19 09:55:47'),
(36, 4, 'Login', 'jlast2 logged in', '2024-10-19 10:24:08'),
(37, 4, 'Logout', 'jlast2 logged out', '2024-10-19 10:34:40'),
(38, 4, 'Login', 'jlast2 logged in', '2024-10-19 11:02:34'),
(39, 3, 'Login', 'hdsaa logged in', '2024-10-19 22:42:55'),
(40, 3, 'Login', 'hdsaa logged in', '2024-10-20 01:05:21'),
(41, 3, 'Delete Product', 'Deleted product: vvvvvvvvb', '2024-10-20 01:05:31'),
(42, 3, 'Delete Product', 'Deleted product: da', '2024-10-20 01:05:34'),
(43, 3, 'Delete Product', 'Deleted product: dsf', '2024-10-20 01:05:42'),
(44, 3, 'Update Product', 'Updated product:  Black Coffee (Category: Meal)', '2024-10-20 01:08:39'),
(45, 3, 'Update Product', 'Updated product:  Black Coffee (Category: Drink)', '2024-10-20 01:08:48'),
(46, 3, 'Update Product', 'Updated product: Bacon Cheeseburger The &quot;BCB&quot; (M) (Category: Drink)', '2024-10-20 01:11:26'),
(47, 3, 'Update Product', 'Updated product: Hungarian Sausage  (60g) (Category: Add-on)', '2024-10-20 01:13:43'),
(48, 3, 'Update Product', 'Updated product: Bacon Cheeseburger The BCB (M) (Category: Drink)', '2024-10-20 01:27:00'),
(49, 3, 'Update Product', 'Updated product: Bacon Cheeseburger The BCB (M) (Category: Meal)', '2024-10-20 01:27:25'),
(50, 3, 'Logout', 'hdsaa logged out', '2024-10-20 01:32:24'),
(51, 3, 'Login', 'hdsaa logged in', '2024-10-20 02:37:26'),
(52, 3, '', 'Updated table ID: 1', '2024-10-20 05:27:32'),
(53, 3, '', 'Updated table ID: 1', '2024-10-20 05:27:38'),
(54, 3, '', 'Updated table ID: 1', '2024-10-20 05:28:05'),
(55, 3, '', 'Updated table ID: 1', '2024-10-20 05:28:08'),
(56, 3, '', 'Updated table ID: 1', '2024-10-20 05:28:21'),
(57, 3, '', 'Updated table ID: 1', '2024-10-20 05:28:27'),
(58, 3, 'Add Product', 'Added a new product: Pizzasdf (Category: Drink)', '2024-10-20 07:36:40'),
(59, 3, 'Logout', 'hdsaa logged out', '2024-10-20 07:47:33'),
(60, 3, 'Login', 'hdsaa logged in', '2024-10-20 07:47:59'),
(61, 3, 'Update Product', 'Updated product:  Black Coffee (Category: Drink)', '2024-10-20 07:54:06');

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
(1, 2, 1, 'Burger - 1, Fries - 1, Coke - 1', 45.50, '2024-10-08 18:30:00', 'Completed', NULL, '2024-10-10 02:37:23', '2024-10-10 02:37:23', 'Credit Card'),
(2, 2, 1, NULL, 45.50, '2024-10-10 09:50:08', 'Pending', NULL, '2024-10-10 02:37:23', '2024-10-10 02:37:23', 'Credit Card');

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
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 1, 1, 60.00),
(2, 1, 2, 1, 249.00),
(3, 1, 3, 1, 50.00),
(4, 2, 1, 1, 60.00),
(5, 2, 2, 1, 249.00),
(6, 2, 3, 1, 50.00),
(7, 3, 1, 2, 60.00),
(8, 3, 2, 3, 249.00),
(9, 1, 1, 1, 60.00),
(10, 1, 2, 1, 249.00),
(11, 1, 3, 1, 50.00),
(12, 2, 1, 1, 60.00),
(13, 2, 2, 1, 249.00),
(14, 2, 3, 1, 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_items`
--

CREATE TABLE `product_items` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `category` enum('Drink','Meal','Dessert','Add-on') NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `special_instructions` text DEFAULT NULL,
  `product_image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_items`
--

INSERT INTO `product_items` (`product_id`, `product_name`, `category`, `price`, `special_instructions`, `product_image`, `created_at`, `updated_at`, `quantity`, `category_id`) VALUES
(1, ' Black Coffee', 'Drink', 60.00, 'Coffee brewed in a large batch using hot water and ground KAPENG BARAKO beans.\r\n', '../Uploads/671458170c418_images.jpg', '2024-10-07 18:35:00', '2024-10-20 07:54:06', 20, NULL),
(2, 'Bacon Cheeseburger The BCB (M)', 'Meal', 249.00, 'House marinara, mozzarella cheese, special cheese sauce, bell pepper, onions, ground beef, and bacon.', '../Uploads/671458be593cc_images (1).jpg', '2024-10-07 18:35:00', '2024-10-20 01:27:25', 20, NULL),
(3, 'Hungarian Sausage  (60g)', 'Add-on', 50.00, '', '../Uploads/67145947c35ea_GyulaiSausage.jpg', '2024-10-07 18:35:00', '2024-10-20 01:13:43', 150, NULL),
(4, 'Pizzasdf', 'Drink', 0.04, 'details', '../Uploads/6714b3089144f_images.jpg', '2024-10-20 07:36:40', '2024-10-20 07:36:40', 2, NULL);

--
-- Triggers `product_items`
--
DELIMITER $$
CREATE TRIGGER `update_order_items_price` AFTER UPDATE ON `product_items` FOR EACH ROW BEGIN
    -- Only update if the price has actually changed
    IF NEW.price <> OLD.price THEN
        UPDATE order_items
        SET price = NEW.price
        WHERE product_id = NEW.product_id;
    END IF;
END
$$
DELIMITER ;

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
(2, 2, 1, '2024-10-10', '19:00:00', 'Rescheduled', 'Please prepare the table for a birthday.', 'Looking forward to a good meal.', '2024-10-09 08:13:16', '2024-10-19 10:30:03');

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
(1, 8, 4, 1, 'Outdoor'),
(2, 2, 6, 1, 'Outdoor'),
(3, 3, 2, 1, 'Indoor'),
(4, 6, 4, 1, 'Outdoor'),
(5, 12, 12, 1, 'Outdoor'),
(6, 31, 1, 1, 'Outdoor'),
(11, 2, 2, 1, 'Indoor'),
(12, 3, 2, 1, 'Outdoor'),
(13, 231, 123, 1, 'Outdoor'),
(14, 32, 11, 1, 'Indoor'),
(15, 123, 3, 1, 'Indoor'),
(16, 3, 3, 1, 'Indoor');

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
(1, 1, '671494f56ecf7_370249953_1774860426363616_6080510073952012735_n.png', '2024-10-18 19:00:41', 'back view'),
(2, 1, '/uploads/table1_image2.jpg', '2024-10-18 19:00:41', 'back view'),
(3, 2, '/uploads/table2_image1.jpg', '2024-10-18 19:00:41', 'back view'),
(4, 4, '../uploads/6713336b6f52e_2022-01-13_205111.jpg', '2024-10-18 20:19:55', 'back view'),
(5, 5, '../uploads/671333988813d_429313029_742582880936669_5473808888799433966_n.jpg', '2024-10-18 20:20:40', 'back view'),
(6, 5, '../uploads/67133398893f9_store.png', '2024-10-18 20:20:40', 'back view'),
(7, 6, '../uploads/671333f016306_Caringal, Mark Laurence L...png', '2024-10-18 20:22:08', 'back view'),
(8, 6, '../uploads/671333f016d42_Untitled.png', '2024-10-18 20:22:08', 'back view'),
(9, 13, '../uploads/671389cbbd30f_Caringal, Mark Laurence L._BSIT 2103..jpg', '2024-10-19 02:28:27', 'back view'),
(10, 14, '../uploads/671389fa019e3_429313029_742582880936669_5473808888799433966_n.jpg', '2024-10-19 02:29:14', 'back view'),
(11, 15, '../uploads/6713b9528b2ef_page1.png', '2024-10-19 05:51:14', 'back view'),
(12, 15, '../uploads/6713b9528c43d_Caringal, Mark Laurence L...png', '2024-10-19 05:51:14', 'back view');

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
(3, 'hala', 's', 'dsaa', 'sad', '23123', 'g@gmail.com', 'asd', '123', 'hdsaa', '$2y$10$X1qAS79RP2D.8qTITLYK5.TkspivdGWsQNltEoFzB0j9daprPGIXG', 'Admin', '2024-10-09 22:38:48', '2024-10-09 22:39:45', NULL),
(4, 'Jhon Carl', 'l', 'last2', '', '12345678908', 'as22@gmail.com', 'place', '45345', 'jlast2', '$2y$10$xc3ncPQ6b73XHDhGRhUhJOtG3VpdieA9wxWJWjKI4QOlZ53XI9oHi', 'Admin', '2024-10-19 09:44:43', '2024-10-19 09:45:53', NULL),
(5, 'Mark james', 'l', 'last3', '', '12345678908', 'haha1@gmail.com', 'place', '45345', 'mlast3', '$2y$10$mMacmmxWCYvFDcnJWrRh.Oka5uaIcGGWaDIQBdcf9hMbJw.QjYIWW', 'General User', '2024-10-19 11:04:08', '2024-10-19 11:04:08', NULL);

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
  ADD KEY `product_items_ibfk_3` (`category_id`);

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
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

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
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_items`
--
ALTER TABLE `product_items`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `table_images`
--
ALTER TABLE `table_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_items` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_items`
--
ALTER TABLE `product_items`
  ADD CONSTRAINT `product_items_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`category_id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`table_id`) REFERENCES `tables` (`table_id`) ON DELETE CASCADE;

--
-- Constraints for table `reservation_reschedule`
--
ALTER TABLE `reservation_reschedule`
  ADD CONSTRAINT `reservation_reschedule_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `table_images`
--
ALTER TABLE `table_images`
  ADD CONSTRAINT `table_images_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `tables` (`table_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
