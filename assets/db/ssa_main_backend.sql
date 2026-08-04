-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 25, 2026 at 03:26 PM
-- Server version: 11.5.2-MariaDB-ubu2404
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ssa_main_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_tokens`
--

CREATE TABLE `api_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `revoked_at` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `api_tokens`
--

INSERT INTO `api_tokens` (`id`, `user_id`, `token`, `created_at`, `revoked_at`) VALUES
(1, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IlNTQSJ9.eyJzdWIiOiIxIiwiZXhwIjoyNTI0NjA4MDAwfQ.lgt3R4dJJJFti940kblDtvZ18vXGffhZQmWFUPPzgSY', '2026-02-28 07:00:00.000', NULL),
(2, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IlNTQSJ9.eyJzdWIiOiIyIiwiZXhwIjoyNTI0NjA4MDAwfQ.6Lt_jGPt_UynC0zWBk0dvoDMCSNyoHUGtnWMRcWgF8A', '2026-02-26 07:00:00.000', '2026-02-26 08:00:00.000'),
(3, 3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IlNTQSJ9.eyJzdWIiOiIzIiwiZXhwIjoyNTI0NjA4MDAwfQ.IJjmibsIf_2iGrP7_AKPjeVZjpy_ehoHDMKchSts-YI', '2026-02-26 07:00:00.000', NULL),
(4, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IlNTQSJ9.eyJzdWIiOiI0IiwiZXhwIjoyNTI0NjA4MDAwfQ.wrjfNf_TibjOgnORMKbMUNG29zOpJUSP3Hi7RultiqI', '2026-02-25 07:00:00.000', NULL),
(5, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IlNTQSJ9.eyJzdWIiOiI1IiwiZXhwIjoyNTI0NjA4MDAwfQ.1_4jPbvH3YYLmXGznHkj9WzoNIcWjGayWMDbEr5ifyI', '2026-02-24 07:00:00.000', NULL),
(6, 6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IlNTQSJ9.eyJzdWIiOiI2IiwiZXhwIjoyNTI0NjA4MDAwfQ.PZLOm5NRIoRo4j88m_iUyKksgtb-ETbEfFyRxJ_CLuA', '2026-02-23 07:00:00.000', NULL),
(7, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IlNTQSJ9.eyJzdWIiOiI3IiwiZXhwIjoyNTI0NjA4MDAwfQ.0XsV9TXTkQ5ObuyQCXv6FNrn1Wos1PLqjygdWW1_Wvs', '2026-02-22 07:00:00.000', '2026-02-22 08:00:00.000'),
(8, 8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IlNTQSJ9.eyJzdWIiOiI4IiwiZXhwIjoyNTI0NjA4MDAwfQ.cmB8jIQewSTPNFG0lg_7MBd0EZST8lYbybQhafZ6mU0', '2026-02-21 07:00:00.000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chapter_completions`
--

CREATE TABLE `chapter_completions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL,
  `credits_earned` int(11) NOT NULL DEFAULT 0,
  `completed_at` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chapter_completions`
--

INSERT INTO `chapter_completions` (`id`, `user_id`, `chapter_id`, `credits_earned`, `completed_at`) VALUES
(1, 1, 1, 4, '2026-02-27 09:00:00.000'),
(2, 1, 2, 4, '2026-02-27 11:00:00.000'),
(3, 1, 12, 3, '2026-02-27 13:00:00.000'),
(4, 2, 1, 4, '2026-02-27 10:00:00.000'),
(5, 3, 7, 5, '2026-02-27 12:00:00.000'),
(6, 3, 22, 5, '2026-02-27 14:00:00.000'),
(7, 5, 1, 4, '2026-02-27 15:00:00.000'),
(8, 5, 2, 4, '2026-02-27 16:00:00.000'),
(9, 5, 3, 5, '2026-02-27 17:00:00.000'),
(10, 7, 26, 4, '2026-02-27 18:00:00.000'),
(11, 8, 1, 4, '2026-02-27 19:00:00.000');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `enrolled_at` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `course_id`, `enrolled_at`) VALUES
(1, 1, 1, '2026-02-10 08:00:00.000'),
(2, 1, 3, '2026-02-10 08:15:00.000'),
(3, 1, 6, '2026-02-10 08:30:00.000'),
(4, 2, 1, '2026-02-10 09:00:00.000'),
(5, 2, 4, '2026-02-10 09:15:00.000'),
(6, 3, 2, '2026-02-10 10:00:00.000'),
(7, 3, 5, '2026-02-10 10:15:00.000'),
(8, 3, 9, '2026-02-10 10:30:00.000'),
(9, 4, 7, '2026-02-10 11:00:00.000'),
(10, 4, 8, '2026-02-10 11:15:00.000'),
(11, 5, 1, '2026-02-10 12:00:00.000'),
(12, 5, 2, '2026-02-10 12:15:00.000'),
(13, 5, 3, '2026-02-10 12:30:00.000'),
(14, 7, 6, '2026-02-10 13:00:00.000'),
(15, 7, 14, '2026-02-10 13:15:00.000'),
(16, 8, 1, '2026-02-10 14:00:00.000'),
(17, 8, 17, '2026-02-10 14:15:00.000');

-- --------------------------------------------------------

--
-- Table structure for table `mentor_sessions`
--

CREATE TABLE `mentor_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mentor_name` varchar(255) NOT NULL,
  `expertise` varchar(255) NOT NULL,
  `experience_level` enum('junior','mid','senior') NOT NULL DEFAULT 'mid',
  `session_date` datetime(3) NOT NULL,
  `duration_minutes` int(11) NOT NULL DEFAULT 60,
  `credit_cost` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mentor_sessions`
--

INSERT INTO `mentor_sessions` (`id`, `mentor_name`, `expertise`, `experience_level`, `session_date`, `duration_minutes`, `credit_cost`, `is_available`, `created_at`) VALUES
(1, 'Sarah Johnson', 'Frontend Development', 'senior', '2026-02-26 07:00:00.000', 60, 15, 0, '2026-02-26 07:00:00.000'),
(2, 'Michael Brown', 'Backend Development', 'senior', '2026-02-25 10:00:00.000', 60, 14, 0, '2026-02-25 07:00:00.000'),
(3, 'Lisa Wang', 'UI/UX Design', 'mid', '2026-02-24 12:00:00.000', 60, 12, 0, '2026-02-24 07:00:00.000'),
(4, 'David Rodriguez', 'DevOps', 'senior', '2026-02-24 08:00:00.000', 60, 15, 0, '2026-02-28 07:00:00.000'),
(5, 'Emma Chen', 'Data Science', 'mid', '2026-02-23 13:00:00.000', 60, 13, 0, '2026-02-23 07:00:00.000'),
(6, 'Sarah Johnson', 'Frontend Development', 'senior', '2026-03-22 13:00:00.000', 60, 15, 1, '2026-03-22 07:00:00.000'),
(7, 'Michael Brown', 'Backend Development', 'senior', '2026-03-21 09:00:00.000', 60, 14, 1, '2026-03-21 07:00:00.000'),
(8, 'Lisa Wang', 'UI/UX Design', 'mid', '2026-03-20 14:00:00.000', 60, 12, 1, '2026-03-20 07:00:00.000'),
(9, 'James Wilson', 'Mobile Development', 'mid', '2026-03-19 09:00:00.000', 60, 12, 1, '2026-03-19 07:00:00.000'),
(10, 'Maria Garcia', 'Machine Learning', 'senior', '2026-03-18 10:00:00.000', 60, 15, 1, '2026-03-18 07:00:00.000'),
(11, 'Alex Kim', 'Cybersecurity', 'mid', '2026-03-17 12:00:00.000', 60, 13, 1, '2026-03-17 07:00:00.000'),
(12, 'Jennifer Lee', 'Cloud Architecture', 'senior', '2026-03-16 14:00:00.000', 60, 14, 1, '2026-03-16 07:00:00.000'),
(13, 'Robert Taylor', 'JavaScript', 'junior', '2026-03-15 09:00:00.000', 60, 8, 1, '2026-03-15 07:00:00.000'),
(14, 'Amanda Davis', 'Python Development', 'mid', '2026-03-14 13:00:00.000', 60, 11, 1, '2026-03-14 07:00:00.000'),
(15, 'Thomas Anderson', 'API Development', 'senior', '2026-03-13 08:00:00.000', 60, 14, 1, '2026-03-13 07:00:00.000');

-- --------------------------------------------------------

--
-- Table structure for table `session_bookings`
--

CREATE TABLE `session_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','confirmed','rejected','completed','cancelled') NOT NULL DEFAULT 'pending',
  `credits_paid` int(11) NOT NULL,
  `booked_at` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session_bookings`
--

INSERT INTO `session_bookings` (`id`, `user_id`, `session_id`, `status`, `credits_paid`, `booked_at`) VALUES
(1, 1, 1, 'completed', 15, '2026-02-10 08:00:00.000'),
(2, 3, 2, 'completed', 14, '2026-02-10 09:00:00.000'),
(3, 5, 6, 'confirmed', 15, '2026-02-18 10:00:00.000'),
(4, 2, 13, 'pending', 8, '2026-02-18 11:00:00.000'),
(5, 7, 8, 'confirmed', 12, '2026-02-18 12:00:00.000'),
(6, 8, 14, 'pending', 11, '2026-02-18 13:00:00.000');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('learner','mentor','admin') NOT NULL DEFAULT 'learner',
  `credit_balance` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `credit_balance`, `created_at`, `updated_at`) VALUES
(1, 'Alice Johnson', 'alice@example.com', '$2b$10$5aNFo7Wszw5VwWOJRuzHqOE4kbopzOBWcTpEZSd92TzVIcAhQANO.', 'learner', 45, '2026-02-28 07:00:00.000', '2026-03-25 15:20:07.422'),
(2, 'Bob Smith', 'bob@example.com', '$2b$10$5aNFo7Wszw5VwWOJRuzHqOE4kbopzOBWcTpEZSd92TzVIcAhQANO.', 'learner', 23, '2026-02-27 07:00:00.000', '2026-03-25 15:20:07.422'),
(3, 'Carol Davis', 'carol@example.com', '$2b$10$5aNFo7Wszw5VwWOJRuzHqOE4kbopzOBWcTpEZSd92TzVIcAhQANO.', 'learner', 67, '2026-02-26 07:00:00.000', '2026-03-25 15:20:07.422'),
(4, 'David Wilson', 'david@example.com', '$2b$10$5aNFo7Wszw5VwWOJRuzHqOE4kbopzOBWcTpEZSd92TzVIcAhQANO.', 'mentor', 12, '2026-02-25 07:00:00.000', '2026-03-25 15:20:07.422'),
(5, 'Eva Rodriguez', 'eva@example.com', '$2b$10$5aNFo7Wszw5VwWOJRuzHqOE4kbopzOBWcTpEZSd92TzVIcAhQANO.', 'learner', 89, '2026-02-24 07:00:00.000', '2026-03-25 15:20:07.422'),
(6, 'Frank Chen', 'frank@example.com', '$2b$10$5aNFo7Wszw5VwWOJRuzHqOE4kbopzOBWcTpEZSd92TzVIcAhQANO.', 'admin', 150, '2026-02-23 07:00:00.000', '2026-03-25 15:20:07.422'),
(7, 'Grace Kim', 'grace@example.com', '$2b$10$5aNFo7Wszw5VwWOJRuzHqOE4kbopzOBWcTpEZSd92TzVIcAhQANO.', 'learner', 34, '2026-02-22 07:00:00.000', '2026-03-25 15:20:07.422'),
(8, 'Henry Taylor', 'henry@example.com', '$2b$10$5aNFo7Wszw5VwWOJRuzHqOE4kbopzOBWcTpEZSd92TzVIcAhQANO.', 'learner', 8, '2026-02-21 07:00:00.000', '2026-03-25 15:20:07.422');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('5278a5e2-c5de-4580-9634-f6c4b4dd243d', 'f3a684050e14b580464806ad4137ac4c084bea1daedaa399f91cc7f77188e07a', '2026-03-25 15:19:54.132', '20250816184119_init', NULL, NULL, '2026-03-25 15:19:54.125', 1),
('e26ce7ca-e425-4c8f-ad18-f55f843b044c', '2745f591a14d2eb6477aeed92e7914c22df089dc8388a8d7d538a17f47d244f0', '2026-03-25 15:19:54.124', '20250816160842_init', NULL, NULL, '2026-03-25 15:19:54.057', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_tokens`
--
ALTER TABLE `api_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_tokens_token_key` (`token`),
  ADD KEY `api_tokens_user_id_idx` (`user_id`),
  ADD KEY `api_tokens_revoked_at_idx` (`revoked_at`);

--
-- Indexes for table `chapter_completions`
--
ALTER TABLE `chapter_completions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chapter_completions_user_id_chapter_id_key` (`user_id`,`chapter_id`),
  ADD KEY `chapter_completions_user_id_idx` (`user_id`),
  ADD KEY `chapter_completions_chapter_id_idx` (`chapter_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enrollments_user_id_course_id_key` (`user_id`,`course_id`),
  ADD KEY `enrollments_user_id_idx` (`user_id`),
  ADD KEY `enrollments_course_id_idx` (`course_id`);

--
-- Indexes for table `mentor_sessions`
--
ALTER TABLE `mentor_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mentor_sessions_session_date_idx` (`session_date`),
  ADD KEY `mentor_sessions_is_available_idx` (`is_available`),
  ADD KEY `mentor_sessions_expertise_idx` (`expertise`);

--
-- Indexes for table `session_bookings`
--
ALTER TABLE `session_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_bookings_user_id_idx` (`user_id`),
  ADD KEY `session_bookings_status_idx` (`status`),
  ADD KEY `session_bookings_session_id_fkey` (`session_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_key` (`email`),
  ADD KEY `users_email_idx` (`email`),
  ADD KEY `users_role_idx` (`role`),
  ADD KEY `users_credit_balance_idx` (`credit_balance`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_tokens`
--
ALTER TABLE `api_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `chapter_completions`
--
ALTER TABLE `chapter_completions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `mentor_sessions`
--
ALTER TABLE `mentor_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `session_bookings`
--
ALTER TABLE `session_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_tokens`
--
ALTER TABLE `api_tokens`
  ADD CONSTRAINT `api_tokens_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chapter_completions`
--
ALTER TABLE `chapter_completions`
  ADD CONSTRAINT `chapter_completions_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session_bookings`
--
ALTER TABLE `session_bookings`
  ADD CONSTRAINT `session_bookings_session_id_fkey` FOREIGN KEY (`session_id`) REFERENCES `mentor_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `session_bookings_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
