-- Simple fix for admin_users tablespace issue
-- Run this step by step in phpMyAdmin SQL tab

-- Step 1: Drop the broken table
DROP TABLE IF EXISTS `admin_users`;

-- Step 2: Create the table fresh (if Step 1 worked, this should work)
CREATE TABLE `admin_users` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password_hash` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `last_login` TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Step 3: Insert admin user
-- Password: Cetnavigator@1234
INSERT INTO `admin_users` (`email`, `password_hash`) VALUES
('cetnavigator151@gmail.com', '$2y$10$hxSdh6WdHZr.Q.OXKF23uORTDDr6s40fjtnokvxyCKyPL.oD1BTzW');


