-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 23, 2026 at 03:05 PM
-- Server version: 8.4.3
-- PHP Version: 8.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_mdeia_old`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_deletion_feedback`
--

CREATE TABLE `account_deletion_feedback` (
  `id` bigint UNSIGNED NOT NULL,
  `feedback_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `registered_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publications` int NOT NULL DEFAULT '0',
  `followers` int NOT NULL DEFAULT '0',
  `following` int NOT NULL DEFAULT '0',
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `cta_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_budget` decimal(10,2) NOT NULL DEFAULT '0.00',
  `spent_budget` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price_per_view` decimal(10,2) NOT NULL DEFAULT '0.01',
  `target_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `views_count` int NOT NULL DEFAULT '1',
  `last_show_at` timestamp NULL DEFAULT NULL,
  `last_charge_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `user_id`, `title`, `content`, `cta_text`, `status`, `type`, `total_budget`, `spent_budget`, `price_per_view`, `target_url`, `approval`, `views_count`, `last_show_at`, `last_charge_at`, `created_at`, `updated_at`) VALUES
(1, 16, 'Hello This is New Ad Head LIne', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#039;s standard dummy text ever since 1966, ', 'Order Now', 'published', NULL, 5.00, 0.22, 0.01, 'https://www.lipsum.com/', 'approved', 23, '2026-08-23 01:42:17', '2026-08-23 01:39:29', '2026-08-04 11:59:39', '2026-08-23 01:42:17'),
(2, 16, NULL, NULL, NULL, 'draft', NULL, 0.00, 0.00, 0.01, NULL, 'pending', 1, NULL, NULL, '2026-08-22 22:38:15', '2026-08-22 22:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `blacklists`
--

CREATE TABLE `blacklists` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blacklistable` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `added_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `bookmarkable_id` bigint UNSIGNED NOT NULL,
  `bookmarkable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_accounts`
--

CREATE TABLE `business_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `industry_id` int DEFAULT NULL,
  `business_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `business_accounts`
--

INSERT INTO `business_accounts` (`id`, `user_id`, `name`, `logo`, `description`, `industry_id`, `business_email`, `business_phone`, `address_line1`, `address_line2`, `city`, `state`, `postal_code`, `country`, `tax_number`, `billing_address`, `website`, `verified`, `is_reviewed`, `updated_at`) VALUES
(1, 1, 'Elon Musk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(2, 2, 'Taylor Otwell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(3, 3, 'Linus Torvalds', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(4, 4, 'Sundar Pichai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(5, 5, 'Mark Zuckerberg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(6, 6, 'Satya Nadella', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(7, 7, 'Tim Cook', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(8, 8, 'Jack Dorsey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(9, 9, 'Sam Altman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(10, 10, 'Pavel Durov', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(11, 11, 'Guido van Rossum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(12, 12, 'Evan You', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(13, 13, 'Brendan Eich', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(14, 14, 'Bjarne Stroustrup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(15, 15, 'Rasmus Lerdorf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL),
(16, 16, 'Jeff Bezos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localization` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `categorizable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `depth` int NOT NULL DEFAULT '1'
) ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `localization`, `parent_id`, `categorizable_type`, `depth`) VALUES
(1, 'Electronics', 'electronics', '[]', NULL, 'product', 1),
(2, 'Home & Garden', 'home-garden', '[]', NULL, 'product', 1),
(3, 'Vehicles', 'vehicles', '[]', NULL, 'product', 1),
(4, 'Property Rentals', 'property-rentals', '[]', NULL, 'product', 1),
(5, 'Apparel', 'apparel', '[]', NULL, 'product', 1),
(6, 'Classifieds', 'classifieds', '[]', NULL, 'product', 1),
(7, 'Entertainment', 'entertainment', '[]', NULL, 'product', 1),
(8, 'Family', 'family', '[]', NULL, 'product', 1),
(9, 'Free Stuff', 'free-stuff', '[]', NULL, 'product', 1),
(10, 'Garden & Outdoor', 'garden-outdoor', '[]', NULL, 'product', 1),
(11, 'Hobbies', 'hobbies', '[]', NULL, 'product', 1),
(12, 'Home Goods', 'home-goods', '[]', NULL, 'product', 1),
(13, 'Home Improvement Supplies', 'home-improvement-supplies', '[]', NULL, 'product', 1),
(14, 'Home Sales', 'home-sales', '[]', NULL, 'product', 1),
(15, 'Miscellaneous', 'miscellaneous', '[]', NULL, 'product', 1),
(16, 'Office Supplies', 'office-supplies', '[]', NULL, 'product', 1),
(17, 'Pet Supplies', 'pet-supplies', '[]', NULL, 'product', 1),
(18, 'Sporting Goods', 'sporting-goods', '[]', NULL, 'product', 1),
(19, 'Toys & Games', 'toys-games', '[]', NULL, 'product', 1),
(20, 'Pet Services', 'pet-services', '[]', NULL, 'product', 1),
(21, 'Deals', 'deals', '[]', NULL, 'product', 1),
(22, 'Musical Instruments', 'musical-instruments', '[]', NULL, 'product', 1),
(23, 'Health & Beauty', 'health-beauty', '[]', NULL, 'product', 1),
(24, 'Tickets', 'tickets', '[]', NULL, 'product', 1),
(25, 'Baby & Kids', 'baby-kids', '[]', NULL, 'product', 1),
(26, 'Antiques & Collectibles', 'antiques-collectibles', '[]', NULL, 'product', 1),
(27, 'Business Equipment', 'business-equipment', '[]', NULL, 'product', 1),
(28, 'Crafts', 'crafts', '[]', NULL, 'product', 1),
(29, 'Events', 'events', '[]', NULL, 'product', 1),
(30, 'Lost & Found', 'lost-found', '[]', NULL, 'product', 1),
(31, 'Manufactured Goods', 'manufactured-goods', '[]', NULL, 'product', 1),
(32, 'Tools', 'tools', '[]', NULL, 'product', 1),
(33, 'Seasonal & Holiday', 'seasonal-holiday', '[]', NULL, 'product', 1),
(34, 'Arts & Crafts', 'arts-crafts', '[]', NULL, 'product', 1),
(35, 'Education', 'education', '[]', NULL, 'product', 1),
(36, 'Accounting & Finance', 'accounting-finance', '[]', NULL, 'job', 1),
(37, 'Administration', 'administration', '[]', NULL, 'job', 1),
(38, 'Architecture', 'architecture', '[]', NULL, 'job', 1),
(39, 'Art & Design', 'art-design', '[]', NULL, 'job', 1),
(40, 'Banking', 'banking', '[]', NULL, 'job', 1),
(41, 'Business Development', 'business-development', '[]', NULL, 'job', 1),
(42, 'Construction', 'construction', '[]', NULL, 'job', 1),
(43, 'Consulting', 'consulting', '[]', NULL, 'job', 1),
(44, 'Customer Service', 'customer-service', '[]', NULL, 'job', 1),
(45, 'Education & Teaching', 'education-teaching', '[]', NULL, 'job', 1),
(46, 'Engineering', 'engineering', '[]', NULL, 'job', 1),
(47, 'Healthcare', 'healthcare', '[]', NULL, 'job', 1),
(48, 'Human Resources', 'human-resources', '[]', NULL, 'job', 1),
(49, 'Information Technology', 'information-technology', '[]', NULL, 'job', 1),
(50, 'Insurance', 'insurance', '[]', NULL, 'job', 1),
(51, 'Legal', 'legal', '[]', NULL, 'job', 1),
(52, 'Manufacturing', 'manufacturing', '[]', NULL, 'job', 1),
(53, 'Marketing', 'marketing', '[]', NULL, 'job', 1),
(54, 'Media & Communication', 'media-communication', '[]', NULL, 'job', 1),
(55, 'Project Management', 'project-management', '[]', NULL, 'job', 1),
(56, 'Real Estate', 'real-estate', '[]', NULL, 'job', 1),
(57, 'Research & Development', 'research-development', '[]', NULL, 'job', 1),
(58, 'Retail', 'retail', '[]', NULL, 'job', 1),
(59, 'Sales', 'sales', '[]', NULL, 'job', 1),
(60, 'Science', 'science', '[]', NULL, 'job', 1),
(61, 'Security', 'security', '[]', NULL, 'job', 1),
(62, 'Software Development', 'software-development', '[]', NULL, 'job', 1),
(63, 'Supply Chain', 'supply-chain', '[]', NULL, 'job', 1),
(64, 'Tourism & Hospitality', 'tourism-hospitality', '[]', NULL, 'job', 1),
(65, 'Transportation & Logistics', 'transportation-logistics', '[]', NULL, 'job', 1);

-- --------------------------------------------------------

--
-- Table structure for table `censors`
--

CREATE TABLE `censors` (
  `id` bigint UNSIGNED NOT NULL,
  `word` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'replaced'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint UNSIGNED NOT NULL,
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'direct',
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `chat_id`, `type`, `last_activity`, `created_at`) VALUES
(1, 'cd3de7e6-b601-4c7f-a577-0ba4b2ffa5c8', 'direct', NULL, '2026-08-04 12:57:08'),
(2, '1f3079eb-f971-4fda-baab-55af9e8f0da6', 'direct', '2026-08-04 13:02:59', '2026-08-04 13:01:00'),
(3, 'c2dd3920-4f2b-4577-ada0-81dc11c56609', 'direct', '2026-08-04 13:18:06', '2026-08-04 13:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `chat_participants`
--

CREATE TABLE `chat_participants` (
  `id` bigint UNSIGNED NOT NULL,
  `chat_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `last_read_message_id` int NOT NULL DEFAULT '0',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_read_at` timestamp NULL DEFAULT NULL,
  `joined_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `chat_participants`
--

INSERT INTO `chat_participants` (`id`, `chat_id`, `user_id`, `last_read_message_id`, `metadata`, `last_read_at`, `joined_at`) VALUES
(1, 1, 16, 0, '{\"color\":\"#CC5049\"}', NULL, '2026-08-04 12:57:08'),
(2, 1, 2, 0, '{\"color\":\"#CC5049\"}', NULL, '2026-08-04 12:57:08'),
(3, 2, 13, 1, '{\"color\":\"#C7508B\"}', '2026-08-04 13:02:58', '2026-08-04 13:01:00'),
(4, 2, 2, 0, '{\"color\":\"#309eba\"}', NULL, '2026-08-04 13:01:00'),
(5, 3, 13, 2, '{\"color\":\"#40a920\"}', '2026-08-04 13:15:07', '2026-08-04 13:14:16'),
(6, 3, 16, 3, '{\"color\":\"#309eba\"}', '2026-08-04 13:18:06', '2026-08-04 13:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `parent_id`, `content`, `text_language`, `created_at`, `updated_at`) VALUES
(1, 1, 16, NULL, 'Decentralization is the best part of crypto.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(2, 2, 9, NULL, 'Maybe aliens really helped build them.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(3, 2, 16, NULL, 'Those structures are too precise for the tools we know.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(4, 2, 1, NULL, 'I read they used wet sand to move the blocks.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(5, 2, 13, NULL, 'Visiting the pyramids is on my bucket list.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(6, 2, 15, NULL, 'The Great Pyramid’s alignment with stars is incredible.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(7, 3, 9, NULL, 'AI already writes better than some humans.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(8, 3, 1, NULL, 'I just want an AI that cooks for me.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(9, 3, 14, NULL, 'The ethical concerns around AI are huge though.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(10, 3, 10, NULL, 'Soon we’ll talk to machines like friends.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(11, 3, 13, NULL, 'GPT-5 is going to be absolutely insane.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(12, 3, 1, NULL, 'Imagine schooling powered entirely by AI tutors.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(13, 4, 9, NULL, 'Sunrise on a quiet lake is unmatched.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(14, 4, 1, NULL, 'Best stress relief in the world.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(15, 4, 3, NULL, 'I only fish to eat fresh, not for sport.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(16, 5, 13, NULL, 'Decentralized social networks sound amazing.', '', '2026-07-29 03:09:38', '2026-07-29 03:09:38'),
(17, 5, 10, NULL, 'No more centralized control? Sign me up.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(18, 5, 5, NULL, 'Will governments really let this happen though?', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(19, 5, 15, NULL, 'Ethereum smart contracts blew my mind.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(20, 5, 15, NULL, 'I’m waiting for a fully blockchain-powered browser.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(21, 6, 3, NULL, 'AI art is beautiful but kind of eerie.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(22, 6, 11, NULL, 'Can a machine ever really be creative?', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(23, 6, 9, NULL, 'Midjourney outputs are just stunning.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(24, 6, 9, NULL, 'I use AI to generate logos now.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(25, 6, 1, NULL, 'The tools are amazing for concept design.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(26, 6, 14, NULL, 'Still feels weird to call it “art” though.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(27, 7, 7, NULL, 'Digital nomad life is calling me.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(28, 7, 16, NULL, 'Why waste time commuting every day?', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(29, 7, 1, NULL, 'Working from a beach sounds great in theory.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(30, 7, 5, NULL, 'Companies need to trust remote workers more.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(31, 8, 11, NULL, 'The ocean is still full of mysteries.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(32, 8, 9, NULL, 'Imagine discovering a deep-sea civilization.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(33, 8, 11, NULL, 'Deep sea creatures are so alien-like.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(34, 8, 5, NULL, 'That’s why I never swim too far out.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(35, 9, 15, NULL, 'Would you trust AI with your kids in the car?', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(36, 9, 2, NULL, 'Insurance companies will hate this tech.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(37, 9, 4, NULL, 'I’m ready for naps on the way to work.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(38, 9, 7, NULL, 'It’ll take decades before full adoption.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(39, 10, 7, NULL, 'Can’t wait to take a selfie from space.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(40, 10, 13, NULL, 'The Moon hotel sounds insane!', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(41, 10, 4, NULL, 'What’s the ticket price? 200k?', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(42, 10, 6, NULL, 'SpaceX will probably be first.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(43, 10, 7, NULL, 'Earth from orbit must be humbling.', '', '2026-07-29 03:09:39', '2026-07-29 03:09:39'),
(44, 11, 1, NULL, 'Hello😄😄😄', 'nl', '2026-08-10 22:14:49', '2026-08-10 22:14:58');

-- --------------------------------------------------------

--
-- Table structure for table `confirmations`
--

CREATE TABLE `confirmations` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `alpha_3_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol_native` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `usage_count` int NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `alpha_3_code`, `name`, `symbol`, `symbol_native`, `status`, `usage_count`, `is_default`, `order`, `created_at`, `updated_at`) VALUES
(1, 'USD', 'United States dollar', '$', '$', 1, 0, 0, 1, '2026-07-29 03:09:18', '2026-07-29 03:09:18'),
(2, 'EUR', 'Euro', '€', '€', 1, 0, 0, 1, '2026-07-29 03:09:18', '2026-07-29 03:09:18'),
(3, 'RUB', 'Russian ruble', '₽', '₽', 1, 0, 0, 1, '2026-07-29 03:09:18', '2026-07-29 03:09:18'),
(4, 'TRY', 'Turkish lira', '₺', '₺', 1, 0, 0, 1, '2026-07-29 03:09:18', '2026-07-29 03:09:18'),
(5, 'CNY', 'Chinese yuan', '¥', '¥', 1, 0, 0, 1, '2026-07-29 03:09:18', '2026-07-29 03:09:18'),
(6, 'GBP', 'British pound', '£', '£', 1, 0, 0, 1, '2026-07-29 03:09:18', '2026-07-29 03:09:18'),
(7, 'JPY', 'Japanese yen', '¥', '¥', 1, 0, 0, 1, '2026-07-29 03:09:18', '2026-07-29 03:09:18'),
(8, 'KRW', 'South Korean won', '₩', '₩', 1, 0, 0, 1, '2026-07-29 03:09:18', '2026-07-29 03:09:18'),
(9, 'INR', 'Indian rupee', '₹', '₹', 1, 0, 0, 1, '2026-07-29 03:09:18', '2026-07-29 03:09:18'),
(10, 'BRL', 'Brazilian real', 'R$', 'R$', 1, 0, 0, 1, '2026-07-29 03:09:18', '2026-07-29 03:09:18');

-- --------------------------------------------------------

--
-- Table structure for table `data_stats`
--

CREATE TABLE `data_stats` (
  `id` bigint UNSIGNED NOT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_size` int NOT NULL DEFAULT '0',
  `content_items` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_stats`
--

INSERT INTO `data_stats` (`id`, `media_type`, `disk`, `content_size`, `content_items`, `created_at`, `updated_at`) VALUES
(1, 'image', 'public', 218938, 4, '2026-07-29 04:03:12', '2026-08-04 12:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `device_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'desktop',
  `last_online` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_terminated` tinyint(1) NOT NULL DEFAULT '0',
  `is_location_unknown` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `user_id`, `device_hash`, `session_id`, `platform`, `platform_version`, `browser`, `browser_version`, `ip_address`, `country`, `region`, `city`, `timezone`, `user_agent`, `platform_type`, `last_online`, `is_terminated`, `is_location_unknown`) VALUES
(1, 2, 'f6169f21bd260709da8d20db9c341f54ffbe79c6cc8e4625e25bd70943344802', 'KSKgDoDfiRssccSFU0oaYhlZPdb7PcR8HHtEg9q8', 'Windows', '10.0', 'Chrome', '150.0.0.0', '127.0.0.1', NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'desktop', '2026-07-29 10:36:08', 0, 1),
(2, 6, 'f6169f21bd260709da8d20db9c341f54ffbe79c6cc8e4625e25bd70943344802', '3AXIO8kr2utgma7GsC5pfaGXQdPlOpe8RLHWphOi', 'Windows', '10.0', 'Chrome', '150.0.0.0', '127.0.0.1', NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'desktop', '2026-07-29 10:00:21', 0, 1),
(3, 1, 'f6169f21bd260709da8d20db9c341f54ffbe79c6cc8e4625e25bd70943344802', '9JuIueDiKKTsNU6r2glz7LZ6y115sBt5AUJc7mWn', 'Windows', '10.0', 'Chrome', '150.0.0.0', '127.0.0.1', NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'desktop', '2026-07-29 10:38:35', 0, 1),
(4, 16, 'f6169f21bd260709da8d20db9c341f54ffbe79c6cc8e4625e25bd70943344802', 'cgFsX3u5CYlsYvKTZIkW0CVpCL2JkvUWgKOLaEuD', 'Windows', '10.0', 'Chrome', '150.0.0.0', '127.0.0.1', NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'desktop', '2026-08-04 20:05:11', 0, 1),
(5, 13, 'f6169f21bd260709da8d20db9c341f54ffbe79c6cc8e4625e25bd70943344802', 'j7cAMRQ7rtca7Y66B4IS323HRycQKkUXW6svOFE6', 'Windows', '10.0', 'Chrome', '150.0.0.0', '127.0.0.1', NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'desktop', '2026-08-04 20:07:54', 0, 1),
(6, 1, 'fc439482cd85fbd623b0d746b9b3be16e5d746026d0b16fa2ae398d4d5e7eca8', 'YxnkKmm7XFsFAv6sthtmkOsKTi1whSmDeHl4u2ZQ', 'Windows', '10.0', 'Chrome', '151.0.0.0', '127.0.0.1', NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'desktop', '2026-08-23 05:00:26', 0, 1),
(7, 13, 'fc439482cd85fbd623b0d746b9b3be16e5d746026d0b16fa2ae398d4d5e7eca8', 'T8LLbdcwU4layuPlrHOmGBvsGj0fikghP4l9V6Pn', 'Windows', '10.0', 'Chrome', '151.0.0.0', '127.0.0.1', NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'desktop', '2026-08-23 08:19:33', 0, 1),
(8, 16, 'fc439482cd85fbd623b0d746b9b3be16e5d746026d0b16fa2ae398d4d5e7eca8', 'Gcszy92hW9hk0gucSJZW4ulWA73xUfGCFDYk94wA', 'Windows', '10.0', 'Chrome', '151.0.0.0', '127.0.0.1', NULL, NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'desktop', '2026-08-23 08:19:38', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_confirmations`
--

CREATE TABLE `email_confirmations` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_confirmations`
--

INSERT INTO `email_confirmations` (`id`, `email`, `token`, `created_at`, `updated_at`) VALUES
(1, 'wytucsmb@gmail.com', 'b1e03973-965b-44cb-ad41-efeafade101c', '2026-07-29 03:22:20', '2026-07-29 03:22:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` bigint UNSIGNED NOT NULL,
  `follower_id` bigint UNSIGNED NOT NULL,
  `following_id` bigint UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'following',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`id`, `follower_id`, `following_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 10, 'following', '2026-07-29 03:43:42', '2026-07-29 03:43:42'),
(2, 2, 9, 'following', '2026-07-29 03:43:46', '2026-07-29 03:43:46'),
(3, 2, 1, 'following', '2026-07-29 03:44:00', '2026-07-29 03:44:00'),
(4, 2, 3, 'following', '2026-07-29 03:44:02', '2026-07-29 03:44:02'),
(5, 2, 4, 'following', '2026-07-29 03:44:04', '2026-07-29 03:44:04'),
(6, 2, 5, 'following', '2026-07-29 03:44:06', '2026-07-29 03:44:06'),
(7, 2, 6, 'following', '2026-07-29 03:44:12', '2026-07-29 03:44:12'),
(8, 2, 7, 'following', '2026-07-29 03:44:15', '2026-07-29 03:44:15'),
(9, 2, 8, 'following', '2026-07-29 03:44:16', '2026-07-29 03:44:16'),
(10, 2, 11, 'following', '2026-07-29 03:44:20', '2026-07-29 03:44:20'),
(11, 2, 12, 'following', '2026-07-29 03:44:22', '2026-07-29 03:44:22'),
(12, 2, 13, 'following', '2026-07-29 03:44:30', '2026-07-29 03:44:30'),
(13, 2, 14, 'following', '2026-07-29 03:44:32', '2026-07-29 03:44:32'),
(14, 2, 15, 'following', '2026-07-29 03:44:34', '2026-07-29 03:44:34'),
(15, 2, 16, 'following', '2026-07-29 03:44:36', '2026-07-29 03:44:36'),
(16, 1, 2, 'following', '2026-07-29 03:47:13', '2026-07-29 03:47:13'),
(17, 16, 2, 'following', '2026-08-04 12:48:41', '2026-08-04 12:48:41'),
(18, 16, 11, 'following', '2026-08-04 12:48:47', '2026-08-04 12:48:47'),
(19, 16, 5, 'following', '2026-08-04 12:48:51', '2026-08-04 12:48:51'),
(20, 16, 13, 'following', '2026-08-04 12:48:55', '2026-08-04 12:48:55'),
(21, 16, 1, 'following', '2026-08-04 12:48:58', '2026-08-04 12:48:58'),
(22, 13, 2, 'following', '2026-08-04 12:49:18', '2026-08-04 12:49:18'),
(23, 13, 8, 'following', '2026-08-04 12:49:22', '2026-08-04 12:49:22'),
(24, 13, 10, 'following', '2026-08-04 12:49:25', '2026-08-04 12:49:25'),
(25, 13, 14, 'following', '2026-08-04 12:49:31', '2026-08-04 12:49:31'),
(26, 13, 5, 'following', '2026-08-04 12:49:35', '2026-08-04 12:49:35'),
(27, 13, 11, 'following', '2026-08-04 12:52:10', '2026-08-04 12:52:10'),
(28, 13, 1, 'following', '2026-08-04 12:52:14', '2026-08-04 12:52:14'),
(29, 13, 7, 'following', '2026-08-04 12:52:17', '2026-08-04 12:52:17'),
(30, 13, 16, 'following', '2026-08-04 12:52:27', '2026-08-04 12:52:27'),
(31, 13, 3, 'following', '2026-08-04 12:52:30', '2026-08-04 12:52:30'),
(32, 16, 8, 'following', '2026-08-04 12:55:06', '2026-08-04 12:55:06'),
(33, 16, 14, 'following', '2026-08-04 12:55:08', '2026-08-04 12:55:08'),
(34, 16, 10, 'following', '2026-08-04 12:55:11', '2026-08-04 12:55:11'),
(35, 16, 3, 'following', '2026-08-04 12:55:14', '2026-08-04 12:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `hidden_chats`
--

CREATE TABLE `hidden_chats` (
  `id` bigint UNSIGNED NOT NULL,
  `chat_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'direct'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hidden_messages`
--

CREATE TABLE `hidden_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `message_id` bigint UNSIGNED NOT NULL,
  `chat_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"cff274e8-cc43-4e45-8d9a-a6636d274bf5\",\"displayName\":\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:34:\\\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\\\":3:{s:4:\\\"data\\\";a:2:{s:4:\\\"link\\\";s:78:\\\"http:\\/\\/127.0.0.1:8000\\/auth\\/confirm-signup\\/b1e03973-965b-44cb-ad41-efeafade101c\\\";s:5:\\\"title\\\";s:15:\\\"Hi, there! 👋\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"wytucsmb@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1785318742,\"nightwatch\":{\"job_id\":\"277cf407-313f-4a3f-b651-8b79ae570c06\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"f5b5527f-1417-47fc-83e5-ae3a59597e07\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:0:\\\"\\\";\"}},\"delay\":null}', 0, NULL, 1785318742, 1785318742),
(2, 'default', '{\"uuid\":\"9c201a16-7896-415e-b54a-5debaef2d02c\",\"displayName\":\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:34:\\\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\\\":3:{s:4:\\\"data\\\";a:2:{s:4:\\\"link\\\";s:78:\\\"http:\\/\\/127.0.0.1:8000\\/auth\\/confirm-signup\\/b1e03973-965b-44cb-ad41-efeafade101c\\\";s:5:\\\"title\\\";s:15:\\\"Hi, there! 👋\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"wytucsmb@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\",\"batchId\":null},\"createdAt\":1785318784,\"nightwatch\":{\"job_id\":\"0ef26fe9-53ab-4742-a1b7-2fc04a26cc7e\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"b407fe21-c85d-44a8-aaf5-e6526fec94d5\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:0:\\\"\\\";\"}},\"delay\":null}', 0, NULL, 1785318784, 1785318784),
(3, 'default', '{\"uuid\":\"b8bd010a-7eb9-4990-ac1d-7ff275bce1be\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:10:{i:0;i:10;i:1;i:2;i:2;i:1;i:3;i:8;i:4;i:5;i:5;i:9;i:6;i:7;i:7;i:4;i:8;i:6;i:9;i:3;}}}\",\"batchId\":null},\"createdAt\":1785319687,\"nightwatch\":{\"job_id\":\"b8b16463-1fab-473f-8232-28aab2ddc6ba\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"4fdde167-6cfc-4fc9-a7b3-2d93c5c2140a\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:1:\\\"2\\\";\"}},\"delay\":null}', 0, NULL, 1785319687, 1785319687),
(4, 'default', '{\"uuid\":\"a07ab811-8e53-4216-8c04-2498f9c1e1a3\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:1:{i:0;i:11;}}}\",\"batchId\":null},\"createdAt\":1785320009,\"nightwatch\":{\"job_id\":\"65af413f-d605-4b8d-b058-d3cc3d5f6214\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"58cda49a-cd0c-4c6f-b9b7-d6b9c3ce6ee4\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:1:\\\"2\\\";\"}},\"delay\":null}', 0, NULL, 1785320009, 1785320009),
(5, 'default', '{\"uuid\":\"5b70dbc7-0d7b-445f-b0cc-fbdea59d4521\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1785320185,\"nightwatch\":{\"job_id\":\"86c3f5d6-226f-4131-9dc3-98943ca811e9\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"884c272c-de8c-45ca-a137-15c6ab3e67c4\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:1:\\\"1\\\";\"}},\"delay\":null}', 0, NULL, 1785320185, 1785320185),
(6, 'default', '{\"uuid\":\"7d7e76a7-d431-4010-b0d7-f3ce39d10e51\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1785320734,\"nightwatch\":{\"job_id\":\"089efea8-4a2d-4cca-b06a-dc32c7b29abc\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"15f4cf2b-b71d-4c44-8923-189f0297ef22\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:1:\\\"2\\\";\"}},\"delay\":null}', 0, NULL, 1785320734, 1785320734),
(7, 'default', '{\"uuid\":\"0ea6cd05-0f33-43ba-915c-58478e94b59e\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1785321251,\"nightwatch\":{\"job_id\":\"d9f24d76-c4c5-48d3-8a20-e93336a629ac\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"a0652166-ead2-47e9-b96c-8b59dd7e9fda\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:1:\\\"1\\\";\"}},\"delay\":null}', 0, NULL, 1785321251, 1785321251),
(8, 'default', '{\"uuid\":\"d8b824cd-1f80-414c-901e-14fe448b601c\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1785865650,\"nightwatch\":{\"job_id\":\"9cab2a39-fbf8-45bd-963e-c5b44ac21f12\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"34828be6-bb03-439e-ba3a-d5a14041558d\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:2:\\\"16\\\";\"}},\"delay\":null}', 0, NULL, 1785865650, 1785865650),
(9, 'default', '{\"uuid\":\"3a8104ff-c2ea-4214-93b7-a37dfb6fa72f\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1785865900,\"nightwatch\":{\"job_id\":\"427eaf59-35d5-4989-bfaf-7839022f9e54\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"420bb906-6caa-4f1c-8f22-d2dea23c6faa\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:2:\\\"13\\\";\"}},\"delay\":null}', 0, NULL, 1785865900, 1785865900),
(10, 'default', '{\"uuid\":\"6e02aed0-9fdd-4c07-8cc8-2a62f87a2f1b\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1785866206,\"nightwatch\":{\"job_id\":\"6d30e0d1-258f-4faa-9c5c-8e5fbfe9cd0a\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"302222b0-c981-429f-a5c7-fa457db8eba7\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:2:\\\"16\\\";\"}},\"delay\":null}', 0, NULL, 1785866206, 1785866206),
(11, 'default', '{\"uuid\":\"511cf380-4272-4803-9aa0-ec1dc305d204\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1785866866,\"nightwatch\":{\"job_id\":\"9f7275b8-7d51-4f59-a6dd-2aca27f3ffa8\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"3464786e-473e-45aa-bf71-c397f9f40995\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:2:\\\"16\\\";\"}},\"delay\":null}', 0, NULL, 1785866866, 1785866866),
(12, 'default', '{\"uuid\":\"a341dfc4-7266-4c40-bf4a-9169cc74f035\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1785867163,\"nightwatch\":{\"job_id\":\"b61c1554-0628-48df-9923-01e5c021577a\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"4cd10229-9e11-4aae-8705-804991ae4aae\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:2:\\\"16\\\";\"}},\"delay\":null}', 0, NULL, 1785867163, 1785867163),
(13, 'default', '{\"uuid\":\"d8c90c0e-d4b3-465b-a981-64c8e87f475c\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1785867374,\"nightwatch\":{\"job_id\":\"0299be3d-7eb7-4dc9-ad27-0020b7cd96ae\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"0a15d079-59df-4a22-bd94-5f36da422063\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:2:\\\"16\\\";\"}},\"delay\":null}', 0, NULL, 1785867374, 1785867374),
(14, 'default', '{\"uuid\":\"1af32015-c73d-4a7b-9234-eed1bd6935f0\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:21:\\\"App\\\\Models\\\\JobListing\\\";a:1:{i:0;i:1;}}}\",\"batchId\":null},\"createdAt\":1785867927,\"nightwatch\":{\"job_id\":\"1a431035-25ee-4a83-9faa-0bcf6f87997a\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"e52e4aaa-b0a5-4e01-ad5c-b58f99a038be\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:2:\\\"16\\\";\"}},\"delay\":null}', 0, NULL, 1785867927, 1785867927),
(15, 'default', '{\"uuid\":\"b6f27c51-8755-4a00-bb4e-d1a7c2404a0f\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:1:{i:0;i:3;}}}\",\"batchId\":null},\"createdAt\":1785868137,\"nightwatch\":{\"job_id\":\"e604fb99-4098-4039-92e5-c7f2aec92a51\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"9cb8f2a6-ce5c-4217-a5b9-65009ebb7a44\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:2:\\\"13\\\";\"}},\"delay\":null}', 0, NULL, 1785868137, 1785868137),
(16, 'default', '{\"uuid\":\"7fdb2d41-24c0-4f84-90e7-d89ab6953d91\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1786423300,\"nightwatch\":{\"job_id\":\"ec63833b-e180-46dd-8292-8f7fd6c735a9\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"ad99701b-0163-4b93-a5fe-59f76b56e717\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:1:\\\"1\\\";\"}},\"delay\":null}', 0, NULL, 1786423300, 1786423300),
(17, 'default', '{\"uuid\":\"3791e66b-c8ea-45ee-8708-1b855efe5b36\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1787460228,\"nightwatch\":{\"job_id\":\"2c552746-eb0f-44f6-9fad-dc984b83f3c1\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"81820bd3-03f9-4c68-930f-57109e016e92\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:1:\\\"1\\\";\"}},\"delay\":null}', 0, NULL, 1787460228, 1787460228),
(18, 'default', '{\"uuid\":\"3b89a3dc-7d78-45b0-b33c-ea3ae45e9031\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1787460925,\"nightwatch\":{\"job_id\":\"46098027-4e62-499a-b6f5-b0bad965f1a9\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"038ce427-adfa-4dae-a60f-a3c4a30584a3\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:1:\\\"1\\\";\"}},\"delay\":null}', 0, NULL, 1787460925, 1787460925),
(19, 'default', '{\"uuid\":\"e2ab28ef-4dee-44b0-8b4c-28d5a7e8e3e6\",\"displayName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\\":1:{s:48:\\\"\\u0000App\\\\Jobs\\\\User\\\\Views\\\\RegisterResourceViews\\u0000views\\\";a:1:{s:15:\\\"App\\\\Models\\\\Post\\\";a:11:{i:0;i:11;i:1;i:10;i:2;i:2;i:3;i:1;i:4;i:8;i:5;i:5;i:6;i:9;i:7;i:7;i:8;i:4;i:9;i:6;i:10;i:3;}}}\",\"batchId\":null},\"createdAt\":1787468762,\"nightwatch\":{\"job_id\":\"b845b5b9-c411-461f-ae35-0b96d3e44f5b\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"53288704-d4b4-43a2-b584-cfccd2675e03\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:2:\\\"16\\\";\"}},\"delay\":null}', 0, NULL, 1787468762, 1787468762);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_listings`
--

CREATE TABLE `job_listings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `overview` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `views_count` int NOT NULL DEFAULT '0',
  `applications_count` int NOT NULL DEFAULT '0',
  `bookmarks_count` int NOT NULL DEFAULT '0',
  `income` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_start_income` tinyint(1) NOT NULL DEFAULT '0',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `approval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_remote` tinyint(1) NOT NULL DEFAULT '1',
  `is_urgent` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'vacancy',
  `last_contacted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_listings`
--

INSERT INTO `job_listings` (`id`, `user_id`, `category_id`, `title`, `overview`, `description`, `status`, `views_count`, `applications_count`, `bookmarks_count`, `income`, `is_start_income`, `currency`, `approval`, `location`, `is_remote`, `is_urgent`, `type`, `last_contacted_at`, `created_at`, `updated_at`) VALUES
(1, 16, 37, 'Hello Testing Job title', 'Hello tesing Job overview', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#039;s standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset&#039;s Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software like Aldus PageMaker and Microsoft Word including versions of Lorem Ipsum.', 'active', 0, 0, 0, '1200', 1, 'USD', 'pending', NULL, 1, 0, 'vacancy', NULL, '2026-08-04 11:55:21', '2026-08-04 11:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `link_snapshots`
--

CREATE TABLE `link_snapshots` (
  `id` bigint UNSIGNED NOT NULL,
  `linkable_id` bigint UNSIGNED NOT NULL,
  `linkable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `locales`
--

CREATE TABLE `locales` (
  `id` bigint UNSIGNED NOT NULL,
  `alpha_2_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `native_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `usage_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locales`
--

INSERT INTO `locales` (`id`, `alpha_2_code`, `name`, `native_name`, `flag_path`, `direction`, `order`, `status`, `is_default`, `usage_count`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'English', '', 'ltr', 1, 1, 1, 0, '2026-07-29 03:09:19', '2026-07-29 03:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `mediaable_id` bigint UNSIGNED NOT NULL,
  `mediaable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumbnail_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lqip_base64` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'processed',
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumbnail_disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `visibility` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'visible',
  `mime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumbnail_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order` int NOT NULL DEFAULT '0',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `mediaable_id`, `mediaable_type`, `source_path`, `thumbnail_path`, `lqip_base64`, `type`, `status`, `disk`, `thumbnail_disk`, `extension`, `visibility`, `mime`, `size`, `thumbnail_size`, `order`, `metadata`, `created_at`, `updated_at`) VALUES
(1, 1, 'App\\Models\\StoryFrame', 'uploads/stories/images/793c671a-a80a-4e50-b600-30804df9b870.webp', '', 'data:image/webp;base64,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', 'image', 'processed', 'public', '', 'jpg', 'visible', 'image/jpeg', '68334', '', 0, '[]', '2026-07-29 04:03:12', '2026-07-29 04:03:12'),
(2, 4, 'App\\Models\\StoryFrame', 'uploads/stories/images/46e69c1d-50d8-4034-987d-ad7b380a7ed0.webp', '', 'data:image/webp;base64,UklGRroPAABXRUJQVlA4IK4PAAAwhACdASoAATIBP83Y5Ge/v7+nrLXNC/A5iWxuulzdZQwA9qnDon1I/4/eTc6M+heLeTryQI7v2/+651er9xtMk3f5t9Mshv3rA/lrQDkH2j53ZDJ/7D6/FuBohtFIJDe/L73/2xiH56JA0VuP7RHqpmdB6mPwn+9gCIV1Dwyg3DbXAlYY56lm/l6AXy6+dtcfyKaQksuREJWF0cu73nywh7ghfYVGQa7ePnwEUA7jffLJb9Q4vauEF+Zu8LflOnG0ZzS4bBSkgdX/I457iftQKivos623U9BKJo+JG4NQENOHBoHvPCg76zpItXYun1vEv9vG65nlPD/DANEMwq45f0XEr9K+oFNE01SsGvuzFEKJ9OgtWriVJ8ZV8H+cToLdBhEdz2FyV2Jb8ZAUCArTgGq8ta+GXcPGeD0RrZz+1qaHJYbsJPZYbfRwsLuHymNZx80WO7PqMzIrKXHz7t+4wJDQ1JBQgokBYVG9h2Yd2jUoeChqYRFeVXkETSs/xcP2FUyx+mEU+AFlwpde99BjSzMgEqliCz5LFdgGf4pi6IGtyDjJSzBj8sJ2FCPZhufKUPlPqApUlhju2seV/5XZQMT3rI5yW/w2iBuGDLHcIUPAQsiB+NahbInTtDqEM2+r3o3A9fwaNCm4a9FVgtHJf4ZXjFeC5rfZp9hQ68vwOm43fSYq6Xuo8MUfEexFADhBSm92NZioVhDpJqMU1NkfcCeobZIf39eRc1sG4/WBh9XN4wgT7q0CeV+hqeG+fnj+cxocxLhzAwjAqZMSjq8YPPJB9nuX8LhQWXcxhXlcMtl7JYC1RvLt1Bhn/SR0tUbuIowyzJRwvOxFcljq24nDRVcq2pbgpeZa+WjK1cUWvZ/LgcIZ3SlNVuitE6m+758SLhY7mCFfayzGq4KS8/JtNOqzjn/d/IZLRRzSKv+IkVXgZk2o9aGpDYanFdw42VjAx/Db/UZ4uPPaI7hBpDL2ken51MfpcPLXC6C8hs47jbjXyUmJZl5XcW77rRw2kLv4th4XRyEMNEfzeUQua9Dx/mar9Se6goKadN1FedVD9C9xU4P7jkfbpKbJr1kOUJl90+wUqKFGAbJGcedarEPYWxWouQsGIXYKScMkk+yFYHwP8cV7yLh3VAsMhkcvoOy8CJDhRXV20kira+Fc/fF5/0ch3f7lJ6Wc4OXBjwzdeWqmpZ/wsJbmx1OYYmJQN6VtDSTzaoSaXZykqcZfk3VQUAb97q0DCPgNNl9p8dyC8T7ju0OUZHWdyfJcLcUFWfk31q2FzCP1BHV4PoGVyX8/QeRe1J1xRREKby4FbEHUTLnzORRkl1KsFzhq5iS3kdTqO7Lq2mrYLu3t6YAVfH38na8mWX/Hf91l/+8Ob19My/w/pmNwii+d9Tp9Da6QvTGY30Rnb4riMUlAAP7u5IE1eu13jQLpBiyD8QJPS3aE18w0n8OplRtWs11LwMmALvl1LWhLP+y+YL9pwsXvnY0/aTeK9xKoP84MNgYdu1B+HMXsgoRowBTYrD4LQWt7klNgrXPbF/tLKxaKri4/qFbe7qxVVQBICC1xNJgwdLWbBKli93bL8U+sfGPanNVLsoZm/N6FqUxc3trr2+Y3lV0VmfsYUOtYubFfhTTs4IerKrJEYscptOaLSC7tBfwSX+pqZSqJ/5wOSK3a69/qEiE4PJORqlQ40mNkqxiIM3sNuJqj7YC3gVeAnBo9N+TYb3soQD9Qwyg6eDgSRbDu3KoDwITCKz3wxbiRtSUMnz2EaXur7Wh/xgNiYdIT4+VZk+F0rJXHX0IsexFevgwPsYvlboBAGXbNI5qvHf9NUh/J9PdvU7k7BAxVegoP6x93LF01/LL6sHpTbQihej8ghOKj7kYESHieJXbnhgpu3R933UUlDjZrKVR1ejCqiwru15wRtxSEbHwyvRrEikcjolJKKeKFgzBsi4h/sg1Fh4odw6g/NZ4IwPUJTMnnkVf5B+GM4IwzrgMPIvPGVe3ElbTNxaU76Bk/rWTcZWM4zjPuo6gqn6Oemxbb6uCQ6Hrb8HER0Evhrk8gyeI96xPxKNJGHgwM1GIAsBHQwVQppF93M84ahjon+UZ9l0o35ILmxsQgxVoVXLuyfM3xM5XCzNi9GwlWr2CZ2U2i2mvTeVsy5HOl4SWLCE/j8Dlwe/EOE6QD14B1ACYrdflSK7S+zMJ4GA3DgyrV6dejmoDGqYXKq+tv8EagwdTNzaDph4f0z7Mkjmt4JjSXTb6HQ5EjqJWyX4Q3yvrOLQJHYuft4/zoBxK3pLQAFfm7IfnqkryZ8ZGhtem2g3mS4BFZEayA4FDulDjd2LL9bV4YSSgS2gcKBFLo+7/HTXr4SYHSKGMNI2kBKLxPrUiRCubQ+0+v3d7FZUyG8nfD4DIm6ce1pAH8x13QcfwBX9S0gLspSsq9paPlrQ+KBP+nzQzZQgEAinIalVyHxQf5XcnchgjFN3Tlze/0uBm4rEcVRQVDRav7DK1inQcwBPbAS6GYE5mvNaVBjRZ+bxixnWxorLQFaPd2r1Bi+ZrUEkEoSK2pqjfUXMDMtjzzpuUZUP4IKaS0o6JjFi4sA+ZpwxqjCUZSLt7tlgKr0sTn+ipP84K1YczWo0tcvn0/89pMmyKi/bXp2uGeGxBjgWZfdN3llLK7ADEo8MzQf0lq4GZG69fjZBtiJC314JgKtCDmo57qnediPtQxZmU+9GCYSBrgPERvZzm7a3Fa3xCnU6o1hbkk5I23FFKDj/gELhmVwLK5No6jFLI/XM2Xmuwu8AoBMoQhFPUtS6BdvDd5v9vBYfASo4T3d2n+rr63O6oFGOfEBp/tVFEkIFeYDM5eaQDA3qT8DDU5xR2hi5lQ6qIlAako7D153umqVDwuaY9TUmr+tCpp330/hZmMNF2oFDURuW05eCSiiMrSI2+2YByYzB10wn0YBptHY7e7s9FZASJD44PwESna6oGJHmkxSrgv3aHQhbPaRp/yZSrWbkuo6Z6BMJBuFUQ7lZ8K4aZJ5kkv4H3ZsqA55Tkc6ftaaAg7o8yVLOCpHGsBkg+EXjXDSJxNf9qzh4UYGnwLEVUKeosqhVuWwMgmHrwKCoBJgY3eXdplnV6RL/CX/kJ3QtoNiHQkfAmU569CA0bGQmPHj5gIikszihrad3eRr7+N21+34lRTtokcbY4ayPYSXsNXqTm9zJf9kM6CVe18FAarZ3YAaVoLTEmt6DgxezxJnM5USmV51kXSHbTs85rGtuVVq2/1RdGVP71MtjA0pnDhYaaisVyiZPmkrun9XmT3ABY7T9CVCMwS1SFRgeAuUl6csCXFbrFHESXwzFlJ+omTxSGg5x215vwjXNWQmy6Eq/emFdTmg9TCfWPuuRB7ikC7tpBSb0Q0CZYnk8Jz8ROPEleYWBIPDtUf50Rqm4GfOgPcIK+A96gA4eLSc9fplJzx7lazyISvu/2CzbBHtq45ePVhuI3IfysCwqTRyMp4dsZWkwImRTMhKYF6/foi7urmhj0NP1MJuXtPSeE7OAA3jdQE9o/cTobjEGHXXO10E9gRTJIqwVx5TiRk4CIPFStt/5tRQZUE7rYoS1szOoO7LADa3mfwYsNXzLreuxEf0SRDgeC1r/moljp59l64Q6RkVWSpiwaX5njqlpoy1bko4VldRZM/Z/BbTwKh3cBnTroKbWQ7+Orc6fb5Sj1J+5fyyCM3RoW8GZYgCaCUvtgfemqivSrScGfNTkrkrTj3bwOOcWwzaZjKdV8zW0+ZDzjuwR3YD5G+kt2E8Z+c6V5ysT1XTkU168qPbGNG14Cb52n8eSzl+RPQV4SPafYz/AnyGltsOqqwOZp+pN9okOipul0CQBPFg/2kaNKXwl2Q72ua7QPcgE8gZu+d1ZTaTp8+44BA2L15FJ8WGD6wV11MnaXTxwoloY6b8/HidJXYkBdjjJcRz6eM1xtIRdaGYbK+uvcBDCtAHvuUUBVugwWAbFUBPpXx3u+fB3m+RT6VXuhWmFljagJNPJJTU3TTnB/2UqRB7w9rTotLUSFFi8qMP12mQJyDnAY6WztVSQPZC8pBKWmpaGWd0B5OJ2VncDdIrlARShJmA6yW/rfIG11obUBk4VnOxdHjUwys+HYhlhdaiCNvLWaPbjVC5jyeHroHhZ6JSYGDaHFEKE8jkv8KeNFw5geLKHo3AeTIMebD1N7pi6cjk6/z1VMv6l1C6/FaA0KEfRjTf52oCZ6mLOifqrAz1vIvMeTjtxMEUpdNlVSfpOphly8IlVwYuM2pBBSoP70Eib6GNkbks2yVidy2q8m7nPsp+e0xFDlrjgfJi0b2qHklBcHEoolmiReLF+MVQK7Bc/XXZG9uXDhHot1SyeqSepyXn8qxFpmEyPB2FoZCCp6JBabM4wL20mK0GAih72D1rpQ88fDlL/hd2t5ZzyjfxSx3KIfg5b3Lq03H0fDL3hoTK+EG9ef9m18p3CStBHjV7oS0BCB/drtHUPmp0bD66WBhSkzcHE+aQrpTWsuF02b9R1qb355Jjo4ce+kYNjjgQ1zSbBeEdZlnvaerCB2QhVwOY1HdlAJMX4pfCW2MQPEIDRwRSNgk/C2cplo3AyMggVwE/5DPjYNc/jc2M7t3mu94/Qtuv3e0vTLhR4CbHN7rCwE6+51yfZqA9j52wkW9kw8UOQYi47yLibWePKsyJiPO1mJHU1F+Uoe7Z+I04fVnTS/wl6tN6aXOZyWIm64jsQu+hegRL7bRblu3p7ciqooEdqwaYJOIws9uYhHmFxsH4iI7UQtI6xFqs3DxKfhy/uI2W70LfCSSFrbGDDqWU6piz2aZW7w6YEZ6Z6enKCDgsmJQOJ//IIt2QxlF7z127xLZOrU81jA9Zwc2jzbuFLu1yqvl8wVqffRg7DCjSMmNGkYFbQStO2F42ZWXKuMfXzZr3zBJXwetCi/uCzELbU8shjQwQBgZI4BnVBtzvjCN/fzBFsw4XVjIq1k0YyjMqPKld50aYo9BWIyjiV+TDZ+9E0MLEQUhYQikV/ynbw624DPZdPBhKIZkt1ZAKjVABOCNNtrwASZzkfkhLoqIy0kSxFKa8cR846Bm9hkWhUQBwwQewZBWJqhcAIQDjy4Dsrs7sXYlQs5GfLKn1+del9hgZpFVWZyezYILFRbq1eoj2HE7vLHIWcB1dfbbS5aFrp8z1bUILgz4k+6+K/ACTGxVMYST2WJtnYAEWsvXyZxNQQD0JGIMpAsRhoB91D3iIIKRdHkzbh+tY+X2FCpJBevD0ob7/WYDqLXw1Vpl9Ad1rNv1pQbIfEhMPOAW3XD9adPmJKDQx5efvRrl5WZIdp2BwSJvIoAAAAAAABRUAAAAAAA=', 'image', 'processed', 'public', '', 'png', 'visible', 'image/png', '63660', '', 0, '[]', '2026-08-04 11:49:47', '2026-08-04 11:49:47'),
(3, 4, 'App\\Models\\StoryFrame', 'uploads/stories/images/d5bfd9a2-f982-47b6-82ec-a2da3cf0acd8.webp', '', 'data:image/webp;base64,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', 'image', 'processed', 'public', '', 'png', 'visible', 'image/png', '63660', '', 0, '[]', '2026-08-04 11:51:33', '2026-08-04 11:51:33'),
(5, 1, 'App\\Models\\Ad', 'uploads/ads/creatives/01b798c9-6861-446c-8085-f91d34edb286.webp', '', NULL, 'image', 'processed', 'public', '', 'png', 'visible', 'application/octet-stream', '23284', '', 0, '[]', '2026-08-04 12:44:58', '2026-08-04 12:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `chat_uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `participant_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `text_language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `chat_uuid`, `chat_id`, `user_id`, `participant_id`, `parent_id`, `content`, `is_deleted`, `text_language`, `created_at`, `updated_at`) VALUES
(1, '1f3079eb-f971-4fda-baab-55af9e8f0da6', 2, 13, 3, NULL, 'Hello Testing', 0, 'nl', '2026-08-04 13:02:58', '2026-08-04 13:02:58'),
(2, 'c2dd3920-4f2b-4577-ada0-81dc11c56609', 3, 13, 5, NULL, 'Hello Iam', 0, 'bi', '2026-08-04 13:15:07', '2026-08-04 13:15:07'),
(3, 'c2dd3920-4f2b-4577-ada0-81dc11c56609', 3, 16, 6, NULL, 'Hello Welcome', 0, 'bi', '2026-08-04 13:18:06', '2026-08-04 13:18:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_06_08_162017_create_posts_table', 1),
(5, '2024_07_25_174509_create_bookmarks_table', 1),
(6, '2024_07_25_174648_create_data_stats_table', 1),
(7, '2024_07_31_214941_create_personal_access_tokens_table', 1),
(8, '2024_10_13_084646_create_social_accounts_table', 1),
(9, '2024_10_14_064550_create_onboards_table', 1),
(10, '2024_10_22_091823_create_email_confirmations_table', 1),
(11, '2024_11_07_064800_create_media_table', 1),
(12, '2024_11_21_074255_create_post_polls_table', 1),
(13, '2024_12_18_124342_create_confirmations_table', 1),
(14, '2024_12_23_090312_create_devices_table', 1),
(15, '2024_12_29_075605_create_account_deletion_feedback_table', 1),
(16, '2025_01_13_072444_create_reactions_table', 1),
(17, '2025_01_14_081142_create_comments_table', 1),
(18, '2025_01_23_074231_create_follows_table', 1),
(19, '2025_01_28_123644_create_categories_table', 1),
(20, '2025_02_03_084633_create_wallets_table', 1),
(21, '2025_02_03_085638_create_wallet_transactions_table', 1),
(22, '2025_02_03_114539_create_business_accounts_table', 1),
(23, '2025_02_05_141922_create_stores_table', 1),
(24, '2025_02_06_175245_create_products_table', 1),
(25, '2025_02_11_164525_create_telegraph_bots_table', 1),
(26, '2025_02_11_164526_create_telegraph_chats_table', 1),
(27, '2025_02_12_074754_create_chats_table', 2),
(28, '2025_02_12_080638_create_chat_participants_table', 3),
(29, '2025_02_13_131121_create_messages_table', 3),
(30, '2025_02_15_141458_create_hidden_messages_table', 3),
(31, '2025_02_18_080650_create_blacklist_table', 3),
(32, '2025_02_18_150945_create_hidden_chats_table', 3),
(33, '2025_03_02_110717_create_stories_table', 3),
(34, '2025_03_02_141849_create_story_frames_table', 3),
(35, '2025_03_07_112332_create_story_views_table', 3),
(36, '2025_03_13_195529_create_notifications_table', 3),
(37, '2025_03_29_012810_create_reports_table', 3),
(38, '2025_04_04_053543_create_link_snapshots_table', 3),
(39, '2025_04_19_152453_create_jobs_table', 3),
(40, '2025_04_30_111234_create_payments_table', 3),
(41, '2025_05_12_083605_create_censors_table', 3),
(42, '2025_05_21_080048_create_ads_table', 3),
(43, '2025_05_23_070018_create_currencies_table', 3),
(44, '2025_05_23_085454_create_locales_table', 3),
(45, '2025_06_25_054317_create_social_links_table', 3),
(46, '2025_06_25_092802_create_user_privacy_settings_table', 3),
(47, '2025_06_25_120655_create_user_permit_settings_table', 3),
(48, '2025_06_25_123348_create_user_notification_settings_table', 3),
(49, '2025_06_25_130210_create_user_security_settings_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `onboards`
--

CREATE TABLE `onboards` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `step` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `payment_uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deposit',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `payment_uuid`, `reference_id`, `payment_type`, `payment_method`, `status`, `amount`, `currency`, `description`, `metadata`, `created_at`, `updated_at`) VALUES
(1, 16, '1', '12345', 'deposit', 'paypal', 'completed', '10000', 'USD', 'Hello ', NULL, '2026-08-04 18:45:30', '2026-08-04 18:45:30'),
(2, 1, '1', '12346', 'deposit', 'paypal', 'completed', '10000', 'USD', 'Hello ', NULL, '2026-08-04 18:45:30', '2026-08-04 18:45:30'),
(3, 2, '1', '12347', 'deposit', 'paypal', 'completed', '10000', 'USD', 'Hello ', NULL, '2026-08-04 18:45:30', '2026-08-04 18:45:30'),
(4, 3, '1', '12348', 'deposit', 'paypal', 'completed', '10000', 'USD', 'Hello ', NULL, '2026-08-04 18:45:30', '2026-08-04 18:45:30'),
(5, 4, '1', '12349', 'deposit', 'paypal', 'completed', '10000', 'USD', 'Hello ', NULL, '2026-08-04 18:45:30', '2026-08-04 18:45:30'),
(6, 5, '1', '12350', 'deposit', 'paypal', 'completed', '10000', 'USD', 'Hello ', NULL, '2026-08-04 18:45:30', '2026-08-04 18:45:30'),
(7, 6, '1', '12350', 'deposit', 'paypal', 'completed', '10000', 'USD', 'Hello ', NULL, '2026-08-04 18:45:30', '2026-08-04 18:45:30'),
(8, 7, '1', '12351', 'deposit', 'paypal', 'completed', '10000', 'USD', 'Hello ', NULL, '2026-08-04 18:45:30', '2026-08-04 18:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `quote_post_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text_language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `profile_pinned` tinyint(1) NOT NULL DEFAULT '0',
  `global_pinned` tinyint(1) NOT NULL DEFAULT '0',
  `is_sensitive` tinyint(1) NOT NULL DEFAULT '0',
  `is_ai_generated` tinyint(1) NOT NULL DEFAULT '0',
  `views_count` int NOT NULL DEFAULT '0',
  `comments_count` int NOT NULL DEFAULT '0',
  `shares_count` int NOT NULL DEFAULT '0',
  `bookmarks_count` int NOT NULL DEFAULT '0',
  `quotes_count` int NOT NULL DEFAULT '0',
  `preview_lqip_base64` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `quote_post_id`, `title`, `content`, `status`, `type`, `text_language`, `edited`, `profile_pinned`, `global_pinned`, `is_sensitive`, `is_ai_generated`, `views_count`, `comments_count`, `shares_count`, `bookmarks_count`, `quotes_count`, `preview_lqip_base64`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, '', 'Cryptocurrency is reshaping the global financial system by shifting control from centralized banks to individuals.\n\n        With decentralized finance (DeFi) platforms, people can lend, borrow, and trade without intermediaries, empowering users across the globe. As adoption grows, we might see government-backed digital currencies, like CBDCs, enter the mainstream.\n\n        🚀 Imagine buying coffee with Bitcoin or receiving your salary in Ethereum. \n        \n        It’s not just a trend—it’s a paradigm shift in how we perceive and use money. \n        \n        Check out https://defipulse.com for live DeFi stats. \n\n        #CryptoRevolution #DeFi #BlockchainFuture 💸📲', 'active', 'text', 'en', 0, 0, 0, 0, 0, 502022, 1, 0, 0, 0, NULL, '2026-07-23 03:09:38', '2026-07-29 03:09:38'),
(2, 3, NULL, '', 'The Egyptian pyramids remain one of the greatest architectural mysteries in human history.\n        \n        Built over 4,000 years ago, their perfect alignment with celestial bodies and the precision of the massive stone blocks raise questions historians and scientists are still trying to answer.\n        \n        Did they use advanced lost technology, massive manpower, or even extraterrestrial help? \n        \n        From wet sand transport theories to sonic levitation hypotheses, the debate is far from over. 👽\n        \n        A visit to the Giza Plateau is a journey back in time. \n        \n        Learn more at https://www.history.com/topics/ancient-history/pyramids-in-egypt \n        \n        #AncientMystery #Pyramids #HistoryLovers 🏺🔍', 'active', 'text', 'en', 0, 0, 0, 0, 0, 703137, 5, 0, 0, 0, NULL, '2026-07-24 03:09:38', '2026-07-29 03:09:38'),
(3, 15, NULL, '', 'Artificial Intelligence is transforming our world at lightning speed. \n        \n        From predictive healthcare and personalized learning to smart homes and digital assistants, AI is becoming part of our everyday lives. \n        \n        Imagine having an AI teacher for your kids, a personal assistant that manages your tasks, or a robot chef that cooks based on your health data! \n        \n        The potential is limitless, but so are the ethical concerns. \n        \n        What happens when machines surpass human intelligence?', 'active', 'text', 'en', 0, 0, 0, 0, 0, 208083, 6, 0, 0, 0, NULL, '2026-04-21 03:09:38', '2026-07-29 03:09:38'),
(4, 5, NULL, '', 'Fishing is more than just casting a line—it\'s a form of meditation, a bonding ritual, and a connection to nature.\n        \n        Whether you\'re standing knee-deep in a mountain stream or sitting quietly by a tranquil lake at dawn, the experience is timeless.\n        \n        It’s about patience, skill, and sometimes just enjoying the moment. Some fish for sport, others for sustenance, but all feel the joy of that first tug on the line. \n        \n        #FishingLife #OutdoorTherapy #CatchAndRelease 🐟🛶', 'active', 'text', 'en', 0, 0, 0, 0, 0, 114772, 3, 0, 0, 0, NULL, '2026-06-01 03:09:38', '2026-07-29 03:09:38'),
(5, 9, NULL, '', 'Blockchain isn’t just for cryptocurrency—it’s a revolutionary tech that could redefine how we verify trust, handle identities, and even govern societies.\n        \n        Imagine voting securely from your phone or owning digital assets no one can alter or seize.\n        \n        With the rise of decentralized applications (dApps), we might soon replace Facebook with a community-run alternative. \n        \n        It’s a shift from platform dependency to user empowerment. \n        \n        Explore the future on https://ethereum.org/en/dapps/.', 'active', 'text', 'en', 0, 0, 0, 0, 0, 203193, 5, 0, 0, 0, NULL, '2026-06-27 03:09:38', '2026-07-29 03:09:38'),
(6, 4, NULL, '', 'AI-generated art is shaking up the creative world. \n        \n        Tools like Midjourney and DALL·E allow anyone to create stunning visuals with just a few words.\n        \n        Artists are now collaborating with machines to produce hybrid masterpieces, fusing human vision with algorithmic precision.\n        \n        But can something generated by code be called “real” art?', 'active', 'text', 'en', 0, 0, 0, 0, 0, 223411, 6, 0, 0, 0, NULL, '2026-05-24 03:09:39', '2026-07-29 03:09:39'),
(7, 2, NULL, '', 'The traditional office is becoming obsolete. \n        \n        With remote work tools and digital collaboration platforms, work is now something you do—not a place you go.\n        \n        People are choosing locations based on lifestyle, not commutes.\n        \n        Work from a beach in Bali or a cabin in Norway? \n        \n        Yes, please. Tools like Notion, Slack, and Zoom have made it all possible.', 'active', 'text', 'en', 0, 0, 0, 0, 0, 631157, 4, 0, 0, 0, NULL, '2026-06-02 03:09:39', '2026-07-29 03:09:39'),
(8, 12, NULL, '', 'Despite covering over 70% of Earth’s surface, our oceans remain one of the least explored frontiers.\n        \n        We’ve mapped Mars more thoroughly than the ocean floor. \n        \n        What secrets lie beneath the waves? \n        \n        Unknown species, ancient shipwrecks, or perhaps underwater volcanoes still active today.\n        \n        With AI-powered submarines and robotics, we may finally uncover these mysteries. \n        \n        Dive into the unknown at https://oceanexplorer.noaa.gov. \n        \n        #DeepSea #OceanMysteries #BluePlanet 🚢🧭', 'active', 'text', 'en', 0, 0, 0, 0, 0, 796291, 4, 0, 0, 0, NULL, '2026-07-06 03:09:39', '2026-07-29 03:09:39'),
(9, 16, NULL, '', 'Self-driving cars aren’t science fiction anymore—they’re hitting real streets and changing how we move.\n        \n        Powered by AI, these vehicles could eliminate human error, reducing accidents and saving lives.\n        \n        But with autonomy comes new ethical questions: Who’s responsible in a crash? What decisions should AI make in emergencies?', 'active', 'text', 'en', 0, 0, 0, 0, 0, 955438, 4, 0, 0, 0, NULL, '2026-06-25 03:09:39', '2026-07-29 03:09:39'),
(10, 14, NULL, '', 'Space tourism is no longer a fantasy.\n        \n        With companies like SpaceX, Blue Origin, and Virgin Galactic pushing the boundaries, soon you might book a vacation *in orbit*.\n        \n        Imagine floating in zero gravity, watching Earth rise over the Moon, or checking into a lunar hotel.\n        Costs are high now, but competition will drive prices down. \n        \n        The final frontier is opening to us all.\n        \n        #SpaceTourism #FutureTravel #NextStopTheMoon 🌌🛰️', 'active', 'text', 'en', 0, 0, 0, 0, 0, 211373, 5, 0, 0, 0, NULL, '2026-07-25 03:09:39', '2026-07-29 03:09:39'),
(11, 2, NULL, '', 'Hello World', 'active', 'text', 'nl', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, '2026-07-29 03:43:29', '2026-08-10 22:14:58');

-- --------------------------------------------------------

--
-- Table structure for table `post_polls`
--

CREATE TABLE `post_polls` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `choices` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `votes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `is_cancellable` tinyint(1) NOT NULL DEFAULT '1',
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `store_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `approval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `stock_quantity` int NOT NULL DEFAULT '0',
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `views_count` int NOT NULL DEFAULT '0',
  `contacts_count` int NOT NULL DEFAULT '0',
  `reviews_count` int NOT NULL DEFAULT '0',
  `bookmarks_count` int NOT NULL DEFAULT '0',
  `last_contacted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `id` bigint UNSIGNED NOT NULL,
  `reactable_id` bigint UNSIGNED NOT NULL,
  `reactable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reactions_count` int NOT NULL DEFAULT '0',
  `unified_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `native_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `reactions`
--

INSERT INTO `reactions` (`id`, `reactable_id`, `reactable_type`, `reactions_count`, `unified_id`, `native_symbol`, `users`, `created_at`, `updated_at`) VALUES
(2, 11, 'App\\Models\\Post', 1, '1f601', NULL, '{\"1\":16}', '2026-07-29 04:09:35', '2026-08-10 22:13:53'),
(3, 11, 'App\\Models\\Post', 1, '1f603', NULL, '[13]', '2026-08-04 13:23:35', '2026-08-04 13:23:35'),
(4, 11, 'App\\Models\\Post', 1, '1f602', NULL, '[1]', '2026-08-10 22:13:53', '2026-08-10 22:13:53'),
(5, 44, 'App\\Models\\Comment', 1, '1f601', NULL, '[1]', '2026-08-10 22:15:51', '2026-08-10 22:15:51');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint UNSIGNED NOT NULL,
  `reporter_id` bigint UNSIGNED NOT NULL,
  `reportable_id` bigint UNSIGNED NOT NULL,
  `reportable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reason_index` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reporter_comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `provider_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` bigint UNSIGNED NOT NULL,
  `linkable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkable_id` bigint UNSIGNED NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `products_count` int NOT NULL DEFAULT '0',
  `reviews_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` bigint UNSIGNED NOT NULL,
  `story_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `story_uuid`, `user_id`, `updated_at`) VALUES
(1, '9d5c6980-a55b-4f7c-b7a9-ce77f25589bd', 2, '2026-07-29 04:03:12'),
(2, 'f45a12cc-cdab-4f15-af47-ab1e368d2b55', 1, '2026-07-29 10:16:19'),
(3, '912f2e5b-8930-47ff-a376-f6fb0d97fa9e', 16, '2026-08-04 11:51:33'),
(4, '811310b4-d3f7-4674-b0bd-b02c233d8d7d', 13, '2026-08-04 17:51:37');

-- --------------------------------------------------------

--
-- Table structure for table `story_frames`
--

CREATE TABLE `story_frames` (
  `id` bigint UNSIGNED NOT NULL,
  `story_id` bigint UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `privacy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `views_count` int NOT NULL DEFAULT '0',
  `is_highlight` tinyint(1) NOT NULL DEFAULT '0',
  `duration_seconds` int NOT NULL DEFAULT '0',
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `story_frames`
--

INSERT INTO `story_frames` (`id`, `story_id`, `content`, `status`, `type`, `privacy`, `views_count`, `is_highlight`, `duration_seconds`, `meta`, `created_at`, `expires_at`) VALUES
(1, 1, 'Hello World', 'active', 'image', 'all', 0, 0, 10, '[]', '2026-07-29 10:08:03', '2026-07-30 04:03:20'),
(2, 2, NULL, 'draft', 'image', 'all', 0, 0, 0, '[]', '2026-07-29 10:16:19', NULL),
(3, 1, NULL, 'draft', 'image', 'all', 0, 0, 0, '[]', '2026-07-29 10:37:58', NULL),
(4, 3, 'Hello world😘😘', 'active', 'image', 'all', 0, 0, 10, '[]', '2026-08-04 17:47:35', '2026-08-05 11:51:44'),
(5, 4, NULL, 'draft', 'image', 'all', 0, 0, 0, '[]', '2026-08-04 17:51:37', NULL),
(6, 3, NULL, 'draft', 'image', 'all', 0, 0, 0, '[]', '2026-08-04 18:36:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `story_views`
--

CREATE TABLE `story_views` (
  `id` bigint UNSIGNED NOT NULL,
  `story_frame_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telegraph_bots`
--

CREATE TABLE `telegraph_bots` (
  `id` bigint UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telegraph_chats`
--

CREATE TABLE `telegraph_chats` (
  `id` bigint UNSIGNED NOT NULL,
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegraph_bot_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `owner_account_id` bigint UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'onboarding',
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `verified_at` timestamp NULL DEFAULT NULL,
  `tips` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light',
  `publications_count` bigint UNSIGNED NOT NULL DEFAULT '0',
  `followers_count` bigint UNSIGNED NOT NULL DEFAULT '0',
  `following_count` bigint UNSIGNED NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `owner_account_id`, `first_name`, `status`, `last_name`, `username`, `caption`, `category`, `bio`, `country`, `city`, `birth_day`, `birth_month`, `birth_year`, `age`, `gender`, `email`, `phone`, `website`, `last_active`, `ip_address`, `language`, `avatar`, `cover`, `verified`, `verified_at`, `tips`, `email_verified_at`, `password`, `role`, `theme`, `publications_count`, `followers_count`, `following_count`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Elon', 'active', 'Musk', 'elon_musk', 'CEO of Tesla & SpaceX', NULL, 'Entrepreneur and engineer, CEO of SpaceX and Tesla, pushing the boundaries of technology and space.', NULL, 'Austin', '28', '6', '1971', NULL, 'male', 'elon.musk@example.com', '+15005550001', 'https://x.com', '2026-08-23 05:00:26', '127.0.0.1', 'en', 'uploads/users/avatars/3f845d3108f829237bf2e684895a7709747818c3.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$p8BuvuEBeIBkCmy/Z1dUwOu/ekTodkRCWtyQw9rGpAhg87ynG5slG', 'user', 'light', 0, 3, 1, 'UJmrAu9zVTKkM69af4CEfgPjKJWKvFgccV8Fp5AuUEy87lw21xPZbN9EPRgn', NULL, '2026-07-29 03:09:20', '2026-08-22 22:30:26'),
(2, NULL, 'Taylor', 'active', 'Otwell', 'taylor_otwell', 'Creator of Laravel', NULL, 'Creator of Laravel, passionate about elegant PHP development and open-source contribution.', NULL, 'Little Rock', '28', '4', '1986', NULL, 'male', 'taylor.otwell@example.com', '+15005550002', 'https://laravel.com', '2026-07-29 10:36:08', '127.0.0.1', 'en', 'uploads/users/avatars/9ef108747801ab81bb2d8e005fae8389a7b48b17.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$MMdEcKUN0WNOSUgWY3YVJujcZ8D2Mwb4V7giqlSoZif5FIG8Zz/Ee', 'user', 'light', 1, 3, 15, 'kt9jmOht8BK8qJTD1G8bZktNyds4jhccywghhTph0K516iddc3hFlTnye6Ww', NULL, '2026-07-29 03:09:22', '2026-08-04 12:49:18'),
(3, NULL, 'Linus', 'active', 'Torvalds', 'linus_torvalds', 'Creator of Linux Kernel', NULL, 'Father of Linux and Git. Advocate for open source and developer freedom in the software world.', NULL, 'Portland', '28', '12', '1969', NULL, 'male', 'linus.torvalds@example.com', '+15005550003', 'https://kernel.org', '2026-07-29 09:39:23', '127.0.0.1', 'en', 'uploads/users/avatars/46124315650417f8aac3061c0774e0e256a6df23.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$tOmGp.Fs3BbNhpC0TSYGaO94vsgem.joVHwgMDqCkVUixEd.5GUqy', 'user', 'light', 0, 3, 0, NULL, NULL, '2026-07-29 03:09:23', '2026-08-04 12:55:14'),
(4, NULL, 'Sundar', 'active', 'Pichai', 'sundar_pichai', 'CEO of Google', NULL, 'CEO of Google and Alphabet, shaping the future of AI, search, and global digital innovation.', NULL, 'Mountain View', '12', '7', '1972', NULL, 'male', 'sundar.pichai@example.com', '+15005550005', 'https://about.google', '2026-07-29 09:39:24', '127.0.0.1', 'en', 'uploads/users/avatars/3064d860697891024456258d343b109b395267f6.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$30ehUrcMYO6gb8T6eT63mOtGcxrACeRXmLOLHrraCaVcnvCoOpGb6', 'user', 'light', 0, 1, 0, NULL, NULL, '2026-07-29 03:09:24', '2026-07-29 03:44:04'),
(5, NULL, 'Mark', 'active', 'Zuckerberg', 'mark_zuck', 'Founder of Facebook', NULL, 'Founder and CEO of Meta. Building the metaverse and rethinking social media.', NULL, 'Palo Alto', '14', '5', '1984', NULL, 'male', 'mark.zuck@example.com', '+15005550006', 'https://meta.com', '2026-07-29 09:39:25', '127.0.0.1', 'en', 'uploads/users/avatars/030531134cbeb3d03bd40c86e1a4e71f9825b1db.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$SnvrA2RUQHzK3sPHfJMaF.fNH/ffBjA6146fisa2naHBN9mXNu7Ye', 'user', 'light', 0, 3, 0, NULL, NULL, '2026-07-29 03:09:25', '2026-08-04 12:49:35'),
(6, NULL, 'Satya', 'active', 'Nadella', 'satya_nadella', 'CEO of Microsoft', NULL, 'CEO of Microsoft, transforming the company with cloud-first and AI-focused innovation.', NULL, 'Redmond', '19', '8', '1967', NULL, 'male', 'satya.nadella@example.com', '+15005550007', 'https://microsoft.com', '2026-07-29 10:00:21', '127.0.0.1', 'en', 'uploads/users/avatars/e9614b2ffa1a2db8de78052ab7ad4f4ae95e391d.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$6uCEEVQttNy08KSa1Lj6NeN5BxUqzwJktq0cFzo/O9pet3j3b3i6u', 'user', 'light', 0, 1, 0, '5J7jIPdMKV85KvktEoGjlLbdgFNR4CaY4t9YcPhPbPdKXqAS7VMKBRn67wN1', NULL, '2026-07-29 03:09:27', '2026-07-29 03:44:12'),
(7, NULL, 'Tim', 'active', 'Cook', 'tim_cook', 'CEO of Apple', NULL, 'CEO of Apple, leading innovation in consumer electronics and privacy-focused tech.', NULL, 'Cupertino', '1', '11', '1960', NULL, 'male', 'tim.cook@example.com', '+15005550009', 'https://apple.com', '2026-07-29 09:39:28', '127.0.0.1', 'en', 'uploads/users/avatars/2444ff44ac534753f7c5b96bf5d14b4dab441688.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$n8RG3osMItdqXb69apRbK.50M.ILhpLg8nomJghDteYzCGE5H/6IC', 'user', 'light', 0, 2, 0, NULL, NULL, '2026-07-29 03:09:28', '2026-08-04 12:52:17'),
(8, NULL, 'Jack', 'active', 'Dorsey', 'jack_dorsey', 'Co-founder of Twitter & Block', NULL, 'Co-founder of Twitter and Square, working on decentralized tech and Bitcoin apps.', NULL, 'San Francisco', '19', '11', '1976', NULL, 'male', 'jack.dorsey@example.com', '+15005550010', 'https://block.xyz', '2026-07-29 09:39:29', '127.0.0.1', 'en', 'uploads/users/avatars/9e4fe804d530e3522030df366a4ff29fe24894f3.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$xEYV/5qdx3qIkCz27GqZDuGAOfeXHjgMcI4bsorAuDz2BksJR3NpK', 'user', 'light', 0, 3, 0, NULL, NULL, '2026-07-29 03:09:29', '2026-08-04 12:55:06'),
(9, NULL, 'Sam', 'active', 'Altman', 'sam_altman', 'CEO of OpenAI', NULL, 'CEO of OpenAI, pushing boundaries in artificial general intelligence and responsible AI development.', NULL, 'San Francisco', '22', '4', '1985', NULL, 'male', 'sam.altman@example.com', '+15005550011', 'https://openai.com', '2026-07-29 09:39:30', '127.0.0.1', 'en', 'uploads/users/avatars/6368325d1a651d32889d8ba1583fb79ddfeac73a.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$75z4MDF2CAEutgF7yHDFVOuyZrFobd8MkNj9qqMmPer421HL.oIQe', 'user', 'light', 0, 1, 0, NULL, NULL, '2026-07-29 03:09:30', '2026-07-29 03:43:46'),
(10, NULL, 'Pavel', 'active', 'Durov', 'pavel_durov', 'Founder of Telegram', NULL, 'Founder of Telegram and VKontakte, advocate for user privacy, freedom, and encrypted messaging.', NULL, 'Dubai', '10', '10', '1984', NULL, 'male', 'pavel.durov@example.com', '+15005550012', 'https://telegram.org', '2026-07-29 09:39:31', '127.0.0.1', 'en', 'uploads/users/avatars/51cc937f7e9930c815a1dcc18e3025eefbf819b0.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$LdO2jty5mDmNnNRsM81QtOFLvx9SbbXmtcZ/997Njp090mnXiTgey', 'user', 'dark', 0, 3, 0, NULL, NULL, '2026-07-29 03:09:31', '2026-08-04 12:55:11'),
(11, NULL, 'Guido', 'active', 'van Rossum', 'guido_python', 'Creator of Python', NULL, 'Inventor of Python, committed to readable code and making programming more accessible.', NULL, 'Belmont', '31', '1', '1956', NULL, 'male', 'guido.rossum@example.com', '+15005550016', 'https://python.org', '2026-07-29 09:39:33', '127.0.0.1', 'en', 'uploads/users/avatars/22e7ec5687fe20bb6c3b6f9c7a4606a6daa9d0ff.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$NppQpwn9ifpDxsT7KX0D6.A..TMH6O1R5Qrq9WJ.gE1T3Kx/ky89i', 'user', 'dark', 0, 3, 0, NULL, NULL, '2026-07-29 03:09:33', '2026-08-04 12:52:10'),
(12, NULL, 'Evan', 'active', 'You', 'evan_you_vue', 'Creator of Vue.js', NULL, 'Creator of Vue.js, passionate about progressive JavaScript and simplicity in web development.', NULL, 'Singapore', '14', '8', '1987', NULL, 'male', 'evan.you@example.com', '+15005550015', 'https://vuejs.org', '2026-07-29 09:39:34', '127.0.0.1', 'en', 'uploads/users/avatars/cc0241392d7e3e5f3fd15891384b8108acbe0aa1.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$giScPdAEcBkQTOnxtUf6xeE/dXHcmZmqgXgaILKAIE16cfGsuyXvK', 'user', 'dark', 0, 1, 0, NULL, NULL, '2026-07-29 03:09:34', '2026-07-29 03:44:22'),
(13, NULL, 'Brendan', 'active', 'Eich', 'brendan_js', 'Creator of JavaScript', NULL, 'Inventor of JavaScript and co-founder of Mozilla and Brave. Advocate of web freedom and security.', NULL, 'San Francisco', '4', '7', '1961', NULL, 'male', 'brendan.eich@example.com', '+15005550017', 'https://brave.com', '2026-08-23 08:19:33', '127.0.0.1', 'en', 'uploads/users/avatars/fc36c4d3bef98b0535ddfe511873a77491537f0b.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$gVCtzAqvn6kfNnItRwFScOLfmntFBrypHFR1hezBIUzVJbsqGVmiO', 'admin', 'light', 0, 2, 10, 'zfq8OL3QCR3T5EC8DSurDiPNzW9Pem8VBm1FFx3w9a6vu6aRtiuU3n9Iw9zY', NULL, '2026-07-29 03:09:35', '2026-08-23 01:49:33'),
(14, NULL, 'Bjarne', 'active', 'Stroustrup', 'bjarne_cpp', 'Creator of C++', NULL, 'Designer and original implementer of C++, focused on performance, systems programming and design.', NULL, 'New York', '30', '12', '1950', NULL, 'male', 'bjarne.stroustrup@example.com', '+15005550018', 'https://isocpp.org', '2026-07-29 09:39:36', '127.0.0.1', 'en', 'uploads/users/avatars/4bef47c4e09d7e45dfdd9f059dc58a85bf6d9f3f.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$kFTEGh..bXldvpSkY1N.6OU7j3CuLDtswBH69MSp1.DHI.kJ.wHsG', 'user', 'dark', 0, 3, 0, NULL, NULL, '2026-07-29 03:09:36', '2026-08-04 12:55:08'),
(15, NULL, 'Rasmus', 'active', 'Lerdorf', 'rasmus_php', 'Creator of PHP', NULL, 'Inventor of PHP, helped shape the web by making server-side scripting accessible to everyone.', NULL, 'Greenland', '22', '11', '1968', NULL, 'male', 'rasmus.lerdorf@example.com', '+15005550019', 'https://php.net', '2026-07-29 09:39:36', '127.0.0.1', 'en', 'uploads/users/avatars/632d3bb0fec859f11687571e1ecdabfc2e8a78f8.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$95iROi28Cu2U28yPA3QxyO976PK/o7iY5e5o.9wdRbextcn1MIzrW', 'user', 'dark', 0, 1, 0, NULL, NULL, '2026-07-29 03:09:36', '2026-07-29 03:44:34'),
(16, NULL, 'Jeff', 'active', 'Bezos', 'jeff_bezos', 'Founder of Amazon', NULL, 'Founder of Amazon and Blue Origin, passionate about innovation and space travel.', NULL, 'Seattle', '12', '1', '1964', NULL, 'male', 'jeff.bezos@example.com', '+15005550008', 'https://amazon.com', '2026-08-23 08:19:38', '127.0.0.1', 'en', 'uploads/users/avatars/1ba50fa33b93182bb273fb001703f0548e772d41.png', 'assets/covers/default-cover.png', 1, NULL, '[]', NULL, '$2y$12$mvYND0jAXy3Bcsgy8M8I.utO2oZttDrERgobmmUt6RHIB55y6M3tS', 'user', 'light', 0, 2, 9, 'Ne2JgEL8CpokMy7I2xmywVvtyBuklb0bRS1RxkTuucvXOnhE2eBxlIWpW54T', NULL, '2026-07-29 03:09:38', '2026-08-23 01:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_notification_settings`
--

CREATE TABLE `user_notification_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direct_messages` tinyint(1) NOT NULL DEFAULT '0',
  `reactions` tinyint(1) NOT NULL DEFAULT '0',
  `comments` tinyint(1) NOT NULL DEFAULT '0',
  `shared_posts` tinyint(1) NOT NULL DEFAULT '0',
  `followers` tinyint(1) NOT NULL DEFAULT '0',
  `follow_request` tinyint(1) NOT NULL DEFAULT '0',
  `mentions` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notification_settings`
--

INSERT INTO `user_notification_settings` (`id`, `user_id`, `type`, `direct_messages`, `reactions`, `comments`, `shared_posts`, `followers`, `follow_request`, `mentions`) VALUES
(1, 1, 'email', 0, 0, 0, 0, 0, 0, 0),
(2, 1, 'push', 0, 0, 0, 0, 0, 0, 0),
(3, 2, 'email', 0, 0, 0, 0, 0, 0, 0),
(4, 2, 'push', 0, 0, 0, 0, 0, 0, 0),
(5, 3, 'email', 0, 0, 0, 0, 0, 0, 0),
(6, 3, 'push', 0, 0, 0, 0, 0, 0, 0),
(7, 4, 'email', 0, 0, 0, 0, 0, 0, 0),
(8, 4, 'push', 0, 0, 0, 0, 0, 0, 0),
(9, 5, 'email', 0, 0, 0, 0, 0, 0, 0),
(10, 5, 'push', 0, 0, 0, 0, 0, 0, 0),
(11, 6, 'email', 0, 0, 0, 0, 0, 0, 0),
(12, 6, 'push', 0, 0, 0, 0, 0, 0, 0),
(13, 7, 'email', 0, 0, 0, 0, 0, 0, 0),
(14, 7, 'push', 0, 0, 0, 0, 0, 0, 0),
(15, 8, 'email', 0, 0, 0, 0, 0, 0, 0),
(16, 8, 'push', 0, 0, 0, 0, 0, 0, 0),
(17, 9, 'email', 0, 0, 0, 0, 0, 0, 0),
(18, 9, 'push', 0, 0, 0, 0, 0, 0, 0),
(19, 10, 'email', 0, 0, 0, 0, 0, 0, 0),
(20, 10, 'push', 0, 0, 0, 0, 0, 0, 0),
(21, 11, 'email', 0, 0, 0, 0, 0, 0, 0),
(22, 11, 'push', 0, 0, 0, 0, 0, 0, 0),
(23, 12, 'email', 0, 0, 0, 0, 0, 0, 0),
(24, 12, 'push', 0, 0, 0, 0, 0, 0, 0),
(25, 13, 'email', 0, 0, 0, 0, 0, 0, 0),
(26, 13, 'push', 0, 0, 0, 0, 0, 0, 0),
(27, 14, 'email', 0, 0, 0, 0, 0, 0, 0),
(28, 14, 'push', 0, 0, 0, 0, 0, 0, 0),
(29, 15, 'email', 0, 0, 0, 0, 0, 0, 0),
(30, 15, 'push', 0, 0, 0, 0, 0, 0, 0),
(31, 16, 'email', 0, 0, 0, 0, 0, 0, 0),
(32, 16, 'push', 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_permit_settings`
--

CREATE TABLE `user_permit_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `mentions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `followers` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `direct_messages` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `story_replies` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `group_invites` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `payment_transfers` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_permit_settings`
--

INSERT INTO `user_permit_settings` (`id`, `user_id`, `mentions`, `followers`, `direct_messages`, `story_replies`, `group_invites`, `payment_transfers`) VALUES
(1, 1, 'all', 'all', 'all', 'all', 'all', 'all'),
(2, 2, 'all', 'all', 'all', 'all', 'all', 'all'),
(3, 3, 'all', 'all', 'all', 'all', 'all', 'all'),
(4, 4, 'all', 'all', 'all', 'all', 'all', 'all'),
(5, 5, 'all', 'all', 'all', 'all', 'all', 'all'),
(6, 6, 'all', 'all', 'all', 'all', 'all', 'all'),
(7, 7, 'all', 'all', 'all', 'all', 'all', 'all'),
(8, 8, 'all', 'all', 'all', 'all', 'all', 'all'),
(9, 9, 'all', 'all', 'all', 'all', 'all', 'all'),
(10, 10, 'all', 'all', 'all', 'all', 'all', 'all'),
(11, 11, 'all', 'all', 'all', 'all', 'all', 'all'),
(12, 12, 'all', 'all', 'all', 'all', 'all', 'all'),
(13, 13, 'all', 'all', 'all', 'all', 'all', 'all'),
(14, 14, 'all', 'all', 'all', 'all', 'all', 'all'),
(15, 15, 'all', 'all', 'all', 'all', 'all', 'all'),
(16, 16, 'all', 'all', 'all', 'all', 'all', 'all');

-- --------------------------------------------------------

--
-- Table structure for table `user_privacy_settings`
--

CREATE TABLE `user_privacy_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `email_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `phone_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `birthdate_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `country_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `city_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `gender_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `online_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `last_seen_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `search_privacy` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_privacy_settings`
--

INSERT INTO `user_privacy_settings` (`id`, `user_id`, `email_privacy`, `phone_privacy`, `birthdate_privacy`, `country_privacy`, `city_privacy`, `gender_privacy`, `online_privacy`, `last_seen_privacy`, `search_privacy`) VALUES
(1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_security_settings`
--

CREATE TABLE `user_security_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `2fa` tinyint(1) NOT NULL DEFAULT '0',
  `2fa_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  `login_notification` tinyint(1) NOT NULL DEFAULT '0',
  `login_notification_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_security_settings`
--

INSERT INTO `user_security_settings` (`id`, `user_id`, `2fa`, `2fa_type`, `login_notification`, `login_notification_type`) VALUES
(1, 1, 0, 'email', 0, 'email'),
(2, 2, 0, 'email', 0, 'email'),
(3, 3, 0, 'email', 0, 'email'),
(4, 4, 0, 'email', 0, 'email'),
(5, 5, 0, 'email', 0, 'email'),
(6, 6, 0, 'email', 0, 'email'),
(7, 7, 0, 'email', 0, 'email'),
(8, 8, 0, 'email', 0, 'email'),
(9, 9, 0, 'email', 0, 'email'),
(10, 10, 0, 'email', 0, 'email'),
(11, 11, 0, 'email', 0, 'email'),
(12, 12, 0, 'email', 0, 'email'),
(13, 13, 0, 'email', 0, 'email'),
(14, 14, 0, 'email', 0, 'email'),
(15, 15, 0, 'email', 0, 'email'),
(16, 16, 0, 'email', 0, 'email');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `wallet_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `balance`, `currency`, `wallet_number`) VALUES
(1, 1, 10000.00, 'USD', 'CLB-V2XCLUSA7NWZSW8G'),
(2, 2, 10000.00, 'USD', 'CLB-8IYMYVMAGR0TO7OR'),
(3, 3, 10000.00, 'USD', 'CLB-UTFSVYMNNBAT0QPV'),
(4, 4, 10000.00, 'USD', 'CLB-VFCJY3DVCJQWS6RV'),
(5, 5, 10000.00, 'USD', 'CLB-4KQBDWIAYL5DNIXI'),
(6, 6, 10000.00, 'USD', 'CLB-INA1J3JBDBNRLDYD'),
(7, 7, 10000.00, 'USD', 'CLB-BY5DQUELLT71UZVE'),
(8, 8, 10000.00, 'USD', 'CLB-U95S6XHYOBHBNR7U'),
(9, 9, 10000.00, 'USD', 'CLB-LQ7RLH5RVU27ZPC3'),
(10, 10, 10000.00, 'USD', 'CLB-HQFUUQNSRMTHXVPS'),
(11, 11, 10000.00, 'USD', 'CLB-ZVRNDWGOMS4XR7XW'),
(12, 12, 10000.00, 'USD', 'CLB-4VXJKKPCCI49EXQY'),
(13, 13, 10000.00, 'USD', 'CLB-RJMRIAJIQVSBUW8Z'),
(14, 14, 10000.00, 'USD', 'CLB-IXXQLXPVWDUBWFC5'),
(15, 15, 10000.00, 'USD', 'CLB-FSCHLD51S4J5PLZW'),
(16, 16, 9995.00, 'USD', 'CLB-MWTPAOCKEXUGWJYS');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `wallet_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `commission` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `transaction_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deposit',
  `is_internal` tinyint(1) NOT NULL DEFAULT '0',
  `direction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'incoming',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `wallet_id`, `amount`, `commission`, `currency`, `transaction_type`, `is_internal`, `direction`, `status`, `metadata`, `created_at`, `updated_at`) VALUES
(1, 16, 10000.00, 1.00, 'USD', 'deposit', 1, 'incoming', 'completed', '{\"source\":\"paypal\"}', '2026-08-04 18:59:15', '2026-08-05 18:59:15'),
(2, 16, 5.00, 0.00, 'USD', 'advertising', 0, 'outgoing', 'completed', '{\"ad_id\":1,\"source\":{\"name\":\"ColibriAds\"}}', '2026-08-04 12:46:09', '2026-08-04 12:46:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_deletion_feedback`
--
ALTER TABLE `account_deletion_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ads_user_id_foreign` (`user_id`);

--
-- Indexes for table `blacklists`
--
ALTER TABLE `blacklists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blacklists_blacklistable_unique` (`blacklistable`),
  ADD KEY `blacklists_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_bookmark_unique` (`user_id`,`bookmarkable_id`,`bookmarkable_type`);

--
-- Indexes for table `business_accounts`
--
ALTER TABLE `business_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `censors`
--
ALTER TABLE `censors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_participants`
--
ALTER TABLE `chat_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_participants_chat_id_foreign` (`chat_id`),
  ADD KEY `chat_participants_user_id_foreign` (`user_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `confirmations`
--
ALTER TABLE `confirmations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `confirmations_user_id_foreign` (`user_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_stats`
--
ALTER TABLE `data_stats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_stats_media_type_disk_unique` (`media_type`,`disk`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devices_user_id_foreign` (`user_id`);

--
-- Indexes for table `email_confirmations`
--
ALTER TABLE `email_confirmations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_follow` (`follower_id`,`following_id`),
  ADD KEY `follows_following_id_foreign` (`following_id`);

--
-- Indexes for table `hidden_chats`
--
ALTER TABLE `hidden_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hidden_chats_chat_id_foreign` (`chat_id`),
  ADD KEY `hidden_chats_user_id_foreign` (`user_id`);

--
-- Indexes for table `hidden_messages`
--
ALTER TABLE `hidden_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hidden_messages_chat_id_foreign` (`chat_id`),
  ADD KEY `hidden_messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_listings`
--
ALTER TABLE `job_listings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_listings_user_id_foreign` (`user_id`),
  ADD KEY `job_listings_category_id_foreign` (`category_id`);

--
-- Indexes for table `link_snapshots`
--
ALTER TABLE `link_snapshots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_chat_id_foreign` (`chat_id`),
  ADD KEY `messages_user_id_foreign` (`user_id`),
  ADD KEY `messages_parent_id_foreign` (`parent_id`),
  ADD KEY `messages_participant_id_foreign` (`participant_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `onboards`
--
ALTER TABLE `onboards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_quote_post_id_foreign` (`quote_post_id`);

--
-- Indexes for table `post_polls`
--
ALTER TABLE `post_polls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_polls_post_id_foreign` (`post_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_store_id_foreign` (`store_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_reporter_id_foreign` (`reporter_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stores_user_id_foreign` (`user_id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stories_user_id_foreign` (`user_id`);

--
-- Indexes for table `story_frames`
--
ALTER TABLE `story_frames`
  ADD PRIMARY KEY (`id`),
  ADD KEY `story_frames_story_id_foreign` (`story_id`);

--
-- Indexes for table `story_views`
--
ALTER TABLE `story_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `story_views_story_frame_id_foreign` (`story_frame_id`),
  ADD KEY `story_views_user_id_foreign` (`user_id`);

--
-- Indexes for table `telegraph_bots`
--
ALTER TABLE `telegraph_bots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telegraph_bots_token_unique` (`token`);

--
-- Indexes for table `telegraph_chats`
--
ALTER TABLE `telegraph_chats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telegraph_chats_chat_id_telegraph_bot_id_unique` (`chat_id`,`telegraph_bot_id`),
  ADD KEY `telegraph_chats_telegraph_bot_id_foreign` (`telegraph_bot_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notification_settings`
--
ALTER TABLE `user_notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notification_settings_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_permit_settings`
--
ALTER TABLE `user_permit_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_permit_settings_user_id_unique` (`user_id`);

--
-- Indexes for table `user_privacy_settings`
--
ALTER TABLE `user_privacy_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_privacy_settings_user_id_unique` (`user_id`);

--
-- Indexes for table `user_security_settings`
--
ALTER TABLE `user_security_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_security_settings_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallets_user_id_wallet_number_unique` (`user_id`,`wallet_number`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_deletion_feedback`
--
ALTER TABLE `account_deletion_feedback`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blacklists`
--
ALTER TABLE `blacklists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_accounts`
--
ALTER TABLE `business_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `censors`
--
ALTER TABLE `censors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chat_participants`
--
ALTER TABLE `chat_participants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `confirmations`
--
ALTER TABLE `confirmations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `data_stats`
--
ALTER TABLE `data_stats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_confirmations`
--
ALTER TABLE `email_confirmations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `hidden_chats`
--
ALTER TABLE `hidden_chats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hidden_messages`
--
ALTER TABLE `hidden_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `job_listings`
--
ALTER TABLE `job_listings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `link_snapshots`
--
ALTER TABLE `link_snapshots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locales`
--
ALTER TABLE `locales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `onboards`
--
ALTER TABLE `onboards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post_polls`
--
ALTER TABLE `post_polls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `story_frames`
--
ALTER TABLE `story_frames`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `story_views`
--
ALTER TABLE `story_views`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telegraph_bots`
--
ALTER TABLE `telegraph_bots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telegraph_chats`
--
ALTER TABLE `telegraph_chats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_notification_settings`
--
ALTER TABLE `user_notification_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user_permit_settings`
--
ALTER TABLE `user_permit_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_privacy_settings`
--
ALTER TABLE `user_privacy_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_security_settings`
--
ALTER TABLE `user_security_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blacklists`
--
ALTER TABLE `blacklists`
  ADD CONSTRAINT `blacklists_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_accounts`
--
ALTER TABLE `business_accounts`
  ADD CONSTRAINT `business_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_participants`
--
ALTER TABLE `chat_participants`
  ADD CONSTRAINT `chat_participants_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `confirmations`
--
ALTER TABLE `confirmations`
  ADD CONSTRAINT `confirmations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `follows_following_id_foreign` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hidden_chats`
--
ALTER TABLE `hidden_chats`
  ADD CONSTRAINT `hidden_chats_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hidden_chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hidden_messages`
--
ALTER TABLE `hidden_messages`
  ADD CONSTRAINT `hidden_messages_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hidden_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_listings`
--
ALTER TABLE `job_listings`
  ADD CONSTRAINT `job_listings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_listings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `chat_participants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_quote_post_id_foreign` FOREIGN KEY (`quote_post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_polls`
--
ALTER TABLE `post_polls`
  ADD CONSTRAINT `post_polls_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_reporter_id_foreign` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `stories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `story_frames`
--
ALTER TABLE `story_frames`
  ADD CONSTRAINT `story_frames_story_id_foreign` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `story_views`
--
ALTER TABLE `story_views`
  ADD CONSTRAINT `story_views_story_frame_id_foreign` FOREIGN KEY (`story_frame_id`) REFERENCES `story_frames` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `story_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `telegraph_chats`
--
ALTER TABLE `telegraph_chats`
  ADD CONSTRAINT `telegraph_chats_telegraph_bot_id_foreign` FOREIGN KEY (`telegraph_bot_id`) REFERENCES `telegraph_bots` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_notification_settings`
--
ALTER TABLE `user_notification_settings`
  ADD CONSTRAINT `user_notification_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_permit_settings`
--
ALTER TABLE `user_permit_settings`
  ADD CONSTRAINT `user_permit_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_privacy_settings`
--
ALTER TABLE `user_privacy_settings`
  ADD CONSTRAINT `user_privacy_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_security_settings`
--
ALTER TABLE `user_security_settings`
  ADD CONSTRAINT `user_security_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
