-- Complete database setup script
-- Run this entire script in phpMyAdmin SQL tab to create all tables and import data

SET FOREIGN_KEY_CHECKS = 0;

-- Drop existing tables if they exist (to avoid conflicts)
DROP TABLE IF EXISTS `branch_cutoffs`;
DROP TABLE IF EXISTS `colleges`;
DROP TABLE IF EXISTS `admin_users`;

-- Create colleges table
CREATE TABLE `colleges` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `slug` VARCHAR(120) NOT NULL UNIQUE,
    `name` VARCHAR(255) NOT NULL,
    `location` VARCHAR(120) NOT NULL,
    `fees` VARCHAR(50) NOT NULL,
    `website` VARCHAR(255) NOT NULL,
    `highest_package` VARCHAR(50) NOT NULL,
    `avg_package` VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create branch_cutoffs table
CREATE TABLE `branch_cutoffs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `college_id` INT NOT NULL,
    `branch` VARCHAR(20) NOT NULL,
    `category` VARCHAR(20) NOT NULL,
    `cutoff` INT NOT NULL,
    CONSTRAINT `fk_branch_college` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`id`) ON DELETE CASCADE,
    UNIQUE KEY `unique_branch_category` (`college_id`, `branch`, `category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create admin_users table
CREATE TABLE `admin_users` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password_hash` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `last_login` TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;

-- Insert admin user
-- Password: Cetnavigator@1234
INSERT INTO `admin_users` (`email`, `password_hash`) VALUES
('cetnavigator151@gmail.com', '$2y$10$hxSdh6WdHZr.Q.OXKF23uORTDDr6s40fjtnokvxyCKyPL.oD1BTzW')
ON DUPLICATE KEY UPDATE `password_hash` = VALUES(`password_hash`);

-- Note: After running this script, you need to import the colleges data
-- Go to phpMyAdmin -> Import tab -> Select colleges_schema.sql file
-- OR copy-paste the INSERT INTO colleges statements from colleges_schema.sql starting from line 42

