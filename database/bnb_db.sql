-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2023 at 01:23 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eas_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `username` char(6) NOT NULL,
  `employee_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `department_id` char(3) NOT NULL,
  `shift_id` int(1) NOT NULL,
  `location_id` int(1) NOT NULL,
  `in_time` int(11) NOT NULL,
  `notes` varchar(120) NOT NULL,
  `image` varchar(50) NOT NULL,
  `lack_of` varchar(11) NOT NULL,
  `in_status` varchar(15) NOT NULL,
  `out_time` int(11) NOT NULL,
  `out_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `username`, `employee_id`, `department_id`, `shift_id`, `location_id`, `in_time`, `notes`, `image`, `lack_of`, `in_status`, `out_time`, `out_status`) VALUES
(72, 'BnB032', 032, 'BnB', 1, 1, 1692242386, 'bobo', '', 'None,image', 'Late', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` char(3) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
('BnB', 'Bits and Bytes'),
('CRS', 'Computer Shop'),
('LNY', 'Laundry');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(128) NOT NULL,
  `gender` char(1) NOT NULL,
  `image` varchar(128) NOT NULL,
  `birth_date` date NOT NULL,
  `hire_date` date NOT NULL,
  `shift_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `gender`, `image`, `birth_date`, `hire_date`, `shift_id`) VALUES
(025, 'Admin ', 'admin@admin.com', 'M', 'default.png', '0000-00-00', '0000-00-00', 0),
(032, 'Loid Bedaña', 'lans.bedana@gmail.com', 'M', 'item-230829-5aeb37e37a.jpg', '1996-09-19', '2023-08-16', 1),
(033, 'Paul', 'pol@gmail.com', 'M', 'item-230816-919dc2215e.JPG', '2002-01-01', '2023-08-16', 1),
(034, 'Alyza Cardel', 'alyza@gmail.com', 'F', 'item-230816-a211e83e9a.png', '1998-11-14', '2023-08-16', 2),
(035, 'Vlanchy Baleda', 'vb@mail.com', 'F', 'item-230816-ac243eec98.png', '1998-06-01', '2023-08-16', 2),
(036, 'rose', 'rose@mail.com', 'F', 'default.png', '2002-01-01', '2023-08-22', 2);

-- --------------------------------------------------------

--
-- Table structure for table `employee_allowances`
--

CREATE TABLE `employee_allowances` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `allowance_id` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Monthly, 2= Semi-Montly, 3 = once',
  `amount` float NOT NULL,
  `effective_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_allowances`
--

INSERT INTO `employee_allowances` (`id`, `employee_id`, `allowance_id`, `type`, `amount`, `effective_date`, `date_created`) VALUES
(1, 9, 4, 1, 1000, '0000-00-00', '2020-09-29 11:20:04'),
(3, 9, 3, 2, 300, '0000-00-00', '2020-09-29 11:37:31'),
(5, 9, 1, 3, 1000, '2020-09-16', '2020-09-29 11:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `employee_deductions`
--

CREATE TABLE `employee_deductions` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `deduction_id` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Monthly, 2= Semi-Montly, 3 = once',
  `amount` float NOT NULL,
  `effective_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_deductions`
--

INSERT INTO `employee_deductions` (`id`, `employee_id`, `deduction_id`, `type`, `amount`, `effective_date`, `date_created`) VALUES
(2, 9, 3, 2, 500, '0000-00-00', '2020-09-29 11:52:46'),
(3, 9, 1, 3, 1500, '2020-09-16', '2020-09-29 11:53:27');

-- --------------------------------------------------------

--
-- Table structure for table `employee_department`
--

CREATE TABLE `employee_department` (
  `id` int(3) NOT NULL,
  `employee_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `department_id` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employee_department`
--

INSERT INTO `employee_department` (`id`, `employee_id`, `department_id`) VALUES
(1, 001, 'BNB'),
(2, 002, 'LNY'),
(3, 003, 'CRS'),
(31, 032, 'BnB'),
(32, 033, 'CRS'),
(33, 034, 'LNY'),
(34, 035, 'BnB'),
(35, 036, 'BnB');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(1) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`) VALUES
(1, 'Bits and Bytes'),
(2, 'Laundry'),
(3, 'Computer Shop');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = monthly ,2 semi-monthly',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 =New,1 = computed',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`id`, `ref_no`, `date_from`, `date_to`, `type`, `status`, `date_created`) VALUES
(1, '2020-3543', '2020-09-16', '2020-09-30', 2, 1, '2020-09-29 15:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_items`
--

CREATE TABLE `payroll_items` (
  `id` int(30) NOT NULL,
  `payroll_id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `present` int(30) NOT NULL,
  `absent` int(10) NOT NULL,
  `late` text NOT NULL,
  `salary` double NOT NULL,
  `allowance_amount` double NOT NULL,
  `allowances` text NOT NULL,
  `deduction_amount` double NOT NULL,
  `deductions` text NOT NULL,
  `net` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_items`
--

INSERT INTO `payroll_items` (`id`, `payroll_id`, `employee_id`, `present`, `absent`, `late`, `salary`, `allowance_amount`, `allowances`, `deduction_amount`, `deductions`, `net`, `date_created`) VALUES
(11, 1, 9, 1, 10, '0', 30000, 1300, '[{\"aid\":\"3\",\"amount\":\"300\"},{\"aid\":\"1\",\"amount\":\"1000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"500\"},{\"did\":\"1\",\"amount\":\"1500\"}]', 664, '2023-08-23 21:04:25'),
(13, 2, 9, 0, 22, '0', 30000, 1000, '[{\"aid\":\"4\",\"amount\":\"1000\"}]', 0, '[]', 1000, '2023-08-23 21:15:47'),
(14, 3, 9, 0, 11, '0', 30000, 300, '[{\"aid\":\"3\",\"amount\":\"300\"}]', 500, '[{\"did\":\"3\",\"amount\":\"500\"}]', -200, '2023-08-23 21:16:24');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` int(1) NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id`, `start`, `end`) VALUES
(1, '08:00:00', '16:00:00'),
(2, '13:00:00', '18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` char(6) NOT NULL,
  `password` varchar(128) NOT NULL,
  `employee_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `role_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `employee_id`, `role_id`) VALUES
('admin', '$2y$10$tG8hnh7w.yiJL7fjlRCmkuHBwi0QI6DHFXmc1s6X3cAFuw5pRfO/O', 025, 1),
('BnB032', '$2y$10$yoGihou/SKh/X4YEgKbiXuH2PMWsEvL6hZoIWvfA3EzdirKOR5Q/2', 032, 2),
('BnB035', '$2y$10$yXs4aICMDqhGMSRERFxGful3RT.hQaRG4jRLntk.A3Ni90.FO3HRS', 035, 2),
('CRS033', '$2y$10$YPwnFnqheY/c3pp5cTy7i.ZsKSMrB4nSr1EAqRtHVJykE80lnc0AO', 033, 2),
('LNY034', '$2y$10$9Jz.UyqStYKj.a1PHVpWne.XF.L04EGwej9WISJupPJ3pRzMzD0Ka', 034, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_access`
--

CREATE TABLE `user_access` (
  `id` int(2) NOT NULL,
  `role_id` int(1) NOT NULL,
  `menu_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_access`
--

INSERT INTO `user_access` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(2) NOT NULL,
  `menu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'Master'),
(3, 'Attendance'),
(4, 'Profile'),
(5, 'Report');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(1) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `user_submenu`
--

CREATE TABLE `user_submenu` (
  `id` int(2) NOT NULL,
  `menu_id` int(2) NOT NULL,
  `title` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_submenu`
--

INSERT INTO `user_submenu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'Department', 'master', 'fas fa-fw fa-building', 1),
(3, 2, 'Shift', 'master/shift', 'fas fa-fw fa-exchange-alt', 1),
(4, 2, 'Employee', 'master/employee', 'fas fa-fw fa-id-badge', 1),
(5, 2, 'Location', 'master/location', 'fas fa-fw fa-map-marker-alt', 1),
(6, 3, 'Attendance Form', 'attendance', 'fas fa-fw fa-clipboard-list', 1),
(7, 3, 'Statistics', 'attendance/stats', 'fas fa-fw fa-chart-pie', 0),
(8, 4, 'My Profile', 'profile', 'fas fa-fw fa-id-card', 1),
(9, 2, 'Users', 'master/users', 'fas fa-fw fa-users', 1),
(11, 5, 'Print Report', 'report', 'fas fa-fw fa-paste', 1),
(12, 3, 'History', 'attendance/history', 'fas fa-fw fa-th-list', 1),
(13, 2, 'Payroll', 'master/payroll', 'fa fa-credit-card', 1),
(14, 2, 'Promotions', 'Promotion', 'fa fa-chevron-up', 1),
(15, 2, 'Recruitment', 'Recruitment', 'fa fa-briefcase', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `shift_id` (`shift_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shift_id_fk_e` (`shift_id`);

--
-- Indexes for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_deductions`
--
ALTER TABLE `employee_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_department`
--
ALTER TABLE `employee_department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_department_ibfk_1` (`employee_id`),
  ADD KEY `employee_department_ibfk_2` (`department_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_items`
--
ALTER TABLE `payroll_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_access`
--
ALTER TABLE `user_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_submenu`
--
ALTER TABLE `user_submenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_deductions`
--
ALTER TABLE `employee_deductions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_department`
--
ALTER TABLE `employee_department`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payroll_items`
--
ALTER TABLE `payroll_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_access`
--
ALTER TABLE `user_access`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_submenu`
--
ALTER TABLE `user_submenu`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_access`
--
ALTER TABLE `user_access`
  ADD CONSTRAINT `user_access_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `user_menu` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_access_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_submenu`
--
ALTER TABLE `user_submenu`
  ADD CONSTRAINT `user_submenu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `user_menu` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
