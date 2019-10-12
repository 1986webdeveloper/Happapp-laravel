-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 12, 2019 at 05:39 PM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `happyapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `category_color`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', '#a33636', 'category-1', '2019-06-04 04:00:34', '2019-06-14 06:32:19'),
(2, NULL, 1, 'Category 2', '#1b97fc', 'category-2', '2019-06-04 04:00:34', '2019-06-14 08:35:21');

-- --------------------------------------------------------

--
-- Table structure for table `comment_like_unlikes`
--

CREATE TABLE `comment_like_unlikes` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_like_unlikes`
--

INSERT INTO `comment_like_unlikes` (`id`, `comment_id`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 1, '2019-06-21 15:03:09', '2019-06-21 15:03:09'),
(2, 4, 19, 0, '2019-06-21 16:57:05', '2019-06-21 16:57:05'),
(3, 6, 19, 0, '2019-06-21 16:58:02', '2019-06-21 16:58:02'),
(4, 3, 19, 0, '2019-06-21 16:58:04', '2019-06-21 16:58:04'),
(5, 1, 12, 0, '2019-06-22 05:20:48', '2019-06-22 05:20:48'),
(6, 1, 19, 2, '2019-06-22 07:32:18', '2019-06-22 07:32:18'),
(7, 7, 7, 0, '2019-06-22 08:24:17', '2019-06-22 08:24:17'),
(8, 7, 19, 2, '2019-06-22 08:25:40', '2019-06-22 08:25:40'),
(9, 9, 12, 2, '2019-06-22 08:48:30', '2019-06-22 08:48:30'),
(10, 1, 20, 1, '2019-06-22 09:27:23', '2019-06-22 09:27:23'),
(11, 9, 20, 1, '2019-06-22 09:45:14', '2019-06-22 09:45:14'),
(12, 10, 7, 1, '2019-06-22 10:26:05', '2019-06-22 10:26:05'),
(13, 10, 20, 1, '2019-06-22 10:51:19', '2019-06-22 10:51:19'),
(14, 10, 11, 2, '2019-06-22 10:59:00', '2019-06-22 10:59:00'),
(15, 6, 11, 2, '2019-06-22 11:01:34', '2019-06-22 11:01:34'),
(16, 23, 11, 0, '2019-06-22 12:16:27', '2019-06-22 12:16:27'),
(17, 26, 7, 1, '2019-06-22 12:20:23', '2019-06-22 12:20:23'),
(18, 27, 20, 1, '2019-06-22 13:05:44', '2019-06-22 13:05:44'),
(19, 21, 20, 1, '2019-06-22 13:05:58', '2019-06-22 13:05:58'),
(20, 18, 20, 1, '2019-06-22 13:06:01', '2019-06-22 13:06:01'),
(21, 27, 21, 0, '2019-06-22 13:51:29', '2019-06-22 13:51:29'),
(22, 26, 21, 2, '2019-06-22 13:51:51', '2019-06-22 13:51:51'),
(23, 27, 17, 1, '2019-06-24 06:59:06', '2019-06-24 06:59:06'),
(24, 36, 11, 0, '2019-06-25 08:58:01', '2019-06-25 08:58:01'),
(25, 40, 21, 2, '2019-06-25 08:58:04', '2019-06-25 08:58:04'),
(26, 45, 21, 2, '2019-06-25 08:58:23', '2019-06-25 08:58:23'),
(27, 46, 11, 0, '2019-06-25 08:59:59', '2019-06-25 08:59:59'),
(28, 38, 11, 0, '2019-06-25 09:37:00', '2019-06-25 09:37:00'),
(29, 48, 11, 0, '2019-06-25 10:20:14', '2019-06-25 10:20:14'),
(30, 47, 11, 0, '2019-06-25 10:20:15', '2019-06-25 10:20:15'),
(31, 52, 18, 0, '2019-06-25 10:52:30', '2019-06-25 10:52:30'),
(32, 38, 18, 0, '2019-06-25 11:02:59', '2019-06-25 11:02:59'),
(33, 65, 17, 0, '2019-06-26 08:51:39', '2019-06-26 08:51:39'),
(34, 62, 18, 0, '2019-06-26 08:51:42', '2019-06-26 08:51:42'),
(35, 49, 18, 0, '2019-06-26 08:51:59', '2019-06-26 08:51:59'),
(36, 49, 17, 0, '2019-06-26 08:52:01', '2019-06-26 08:52:01'),
(37, 62, 17, 1, '2019-06-26 08:53:56', '2019-06-26 08:53:56'),
(38, 80, 24, 2, '2019-06-26 13:01:53', '2019-06-26 13:01:53'),
(39, 77, 17, 0, '2019-06-26 13:02:03', '2019-06-26 13:02:03'),
(40, 77, 24, 0, '2019-06-26 13:02:10', '2019-06-26 13:02:10'),
(41, 89, 24, 2, '2019-06-26 13:07:01', '2019-06-26 13:07:01'),
(42, 88, 24, 0, '2019-06-26 13:07:08', '2019-06-26 13:07:08'),
(43, 92, 25, 2, '2019-06-26 13:12:35', '2019-06-26 13:12:35'),
(44, 93, 25, 2, '2019-06-26 13:12:45', '2019-06-26 13:12:45'),
(45, 92, 7, 0, '2019-06-26 13:12:54', '2019-06-26 13:12:54'),
(46, 97, 25, 0, '2019-06-26 13:13:27', '2019-06-26 13:13:27'),
(47, 106, 24, 0, '2019-06-26 13:41:37', '2019-06-26 13:41:37'),
(48, 112, 25, 0, '2019-06-26 14:26:59', '2019-06-26 14:26:59'),
(49, 111, 27, 1, '2019-06-26 14:38:18', '2019-06-26 14:38:18'),
(50, 1, 18, 2, '2019-07-02 12:41:05', '2019-07-02 12:41:05'),
(51, 7, 17, 1, '2019-07-03 10:14:05', '2019-07-03 10:14:05'),
(52, 6, 17, 1, '2019-07-03 10:14:06', '2019-07-03 10:14:06'),
(53, 9, 30, 2, '2019-07-03 10:14:48', '2019-07-03 10:14:48'),
(54, 10, 30, 0, '2019-07-03 10:15:07', '2019-07-03 10:15:07'),
(55, 14, 30, 2, '2019-07-03 10:16:11', '2019-07-03 10:16:11'),
(56, 17, 30, 0, '2019-07-03 10:18:36', '2019-07-03 10:18:36'),
(57, 18, 30, 2, '2019-07-03 10:19:05', '2019-07-03 10:19:05'),
(58, 19, 30, 0, '2019-07-03 10:19:16', '2019-07-03 10:19:16'),
(59, 22, 26, 2, '2019-07-03 10:25:59', '2019-07-03 10:25:59'),
(60, 24, 30, 2, '2019-07-03 10:29:59', '2019-07-03 10:29:59'),
(61, 27, 31, 0, '2019-07-03 10:33:01', '2019-07-03 10:33:01'),
(62, 32, 26, 2, '2019-07-03 10:42:08', '2019-07-03 10:42:08'),
(63, 36, 26, 2, '2019-07-03 10:54:37', '2019-07-03 10:54:37'),
(64, 35, 26, 2, '2019-07-03 11:05:48', '2019-07-03 11:05:48'),
(65, 41, 26, 2, '2019-07-03 11:16:15', '2019-07-03 11:16:15'),
(66, 42, 26, 0, '2019-07-03 11:22:45', '2019-07-03 11:22:45'),
(67, 43, 26, 2, '2019-07-03 11:25:13', '2019-07-03 11:25:13'),
(68, 44, 26, 0, '2019-07-03 11:25:51', '2019-07-03 11:25:51'),
(69, 45, 26, 2, '2019-07-03 11:26:29', '2019-07-03 11:26:29'),
(70, 46, 26, 2, '2019-07-03 11:28:09', '2019-07-03 11:28:09'),
(71, 47, 26, 2, '2019-07-03 11:31:24', '2019-07-03 11:31:24'),
(72, 50, 17, 2, '2019-07-03 13:08:13', '2019-07-03 13:08:13'),
(73, 51, 17, 2, '2019-07-03 13:08:29', '2019-07-03 13:08:29'),
(74, 53, 17, 2, '2019-07-03 13:08:47', '2019-07-03 13:08:47'),
(75, 56, 17, 2, '2019-07-03 13:14:51', '2019-07-03 13:14:51'),
(76, 3, 7, 1, '2019-07-18 10:28:16', '2019-07-18 10:28:16');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please enter name.\"}}}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please enter email.\"}}}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please enter password.\"}}}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 0, 0, 0, 0, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 0, 0, 0, 0, 0, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please enter name.\"}}}', 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '{}', 2),
(31, 5, 'category_id', 'text', 'Category', 0, 0, 1, 1, 1, 0, '{}', 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please enter title.\"}}}', 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please enter video content.\"}}}', 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 0, 0, 0, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 0, 0, 0, 0, 0, 0, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 0, 0, 0, 0, 0, 0, '{}', 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 0, 0, 0, 0, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please enter Description.\"}}}', 10),
(39, 5, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Active\",\"options\":{\"Active\":\"Active\",\"Inactive\":\"Inactive\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 0, 0, 0, 0, 0, '{}', 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 0, 0, 0, 0, 0, '{}', 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '{}', 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please enter title.\"}}}', 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 0, 0, 0, 0, 0, 0, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please enter excerpt.\"}}}', 4),
(48, 6, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please enter page description.\"}}}', 5),
(49, 6, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 0, 0, 0, 0, 0, 0, '{}', 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 0, 0, 0, 0, '{}', 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 0, 0, 0, 0, 0, '{\"default\":\"Active\",\"options\":{\"Inactive\":\"Inactive\",\"Active\":\"Active\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(55, 6, 'image', 'image', 'Page Image', 0, 0, 0, 0, 0, 0, '{}', 12),
(56, 5, 'post_video', 'image', 'Post Video', 0, 0, 0, 0, 0, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please select video.\"}}}', 9),
(57, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(58, 7, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please enter name.\"}}}', 2),
(59, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(60, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(61, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(62, 8, 'video_id', 'text', 'Video Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(63, 8, 'favourite_type', 'text', 'Favourite Type', 0, 1, 1, 1, 1, 1, '{}', 3),
(64, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(65, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(66, 7, 'is_active', 'checkbox', 'Is Active', 1, 0, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"0\":\"0\",\"1\":\"1\"}}', 6),
(67, 7, 'founder_name', 'text', 'Founder Name', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Please enter founder name.\"}}}', 3),
(68, 4, 'category_color', 'color', 'Category Color', 0, 1, 1, 1, 1, 1, '{}', 5),
(69, 1, 'number', 'text', 'Number', 0, 1, 1, 1, 1, 1, '{}', 3),
(70, 1, 'facebook_id', 'text', 'Facebook Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(71, 1, 'twitter_id', 'text', 'Twitter Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(72, 1, 'google_id', 'text', 'Google Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(73, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 10),
(75, 5, 'post_video_thumb', 'text', 'Post Video Thumb', 1, 0, 0, 0, 0, 0, '{}', 10),
(76, 1, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 16),
(77, 5, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 18),
(78, 1, 'is_facebook', 'text', 'Is Facebook', 1, 1, 1, 1, 1, 1, '{}', 7),
(79, 1, 'is_twitter', 'text', 'Is Twitter', 1, 1, 1, 1, 1, 1, '{}', 8),
(80, 1, 'is_google', 'text', 'Is Google', 1, 1, 1, 1, 1, 1, '{}', 9),
(81, 5, 'start_date', 'date', 'Start Date', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|date|before:end_date\",\"messages\":{\"required\":\"Please enter start date.\"}}}', 16),
(82, 5, 'end_date', 'date', 'End Date', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|date|after:start_date\",\"messages\":{\"required\":\"Please enter end date.\"}}}', 17),
(83, 7, 'quotes_date', 'date', 'Quotes Date', 0, 1, 1, 1, 1, 1, '{}', 3);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'App\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-06-04 03:22:51', '2019-07-10 06:04:59'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-06-04 03:22:51', '2019-06-04 03:22:51'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-06-04 03:22:51', '2019-06-04 03:22:51'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-06-04 04:00:34', '2019-06-22 05:53:11'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'App\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-06-04 04:00:35', '2019-07-18 04:23:36'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-06-04 04:00:35', '2019-08-16 04:12:06'),
(7, 'quotes', 'quotes', 'Quote', 'Quotes', 'voyager-leaf', 'App\\Quote', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-06-07 01:09:26', '2019-07-18 05:47:45'),
(8, 'videofavourites', 'videofavourites', 'Videofavourite', 'Videofavourites', NULL, 'App\\Videofavourite', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-06-07 04:39:04', '2019-06-07 04:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `flag_comments`
--

CREATE TABLE `flag_comments` (
  `id` int(10) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flag_comments`
--

INSERT INTO `flag_comments` (`id`, `comment_id`, `user_id`, `created_at`, `updated_at`, `is_active`) VALUES
(3, 6, 7, '2019-06-20 09:27:36', '2019-06-20 09:27:36', 0),
(4, 4, 7, '2019-06-20 09:32:53', '2019-06-20 09:32:53', 0),
(5, 7, 7, '2019-06-20 10:26:27', '2019-06-20 10:26:27', 0),
(6, 3, 7, '2019-06-21 06:00:05', '2019-06-21 06:00:05', 0),
(7, 5, 7, '2019-06-21 06:20:12', '2019-06-21 06:20:12', 1),
(8, 3, 12, '2019-06-21 10:57:31', '2019-06-21 10:57:31', 1),
(9, 4, 12, '2019-06-21 10:57:34', '2019-06-21 10:57:34', 1),
(10, 6, 11, '2019-06-21 12:08:29', '2019-06-21 12:08:29', 1),
(11, 5, 11, '2019-06-21 12:08:31', '2019-06-21 12:08:31', 1),
(12, 6, 12, '2019-06-21 12:19:17', '2019-06-21 12:19:17', 0),
(13, 10, 12, '2019-06-21 14:18:31', '2019-06-21 14:18:31', 1),
(14, 4, 19, '2019-06-21 16:57:16', '2019-06-21 16:57:16', 0),
(15, 5, 19, '2019-06-21 16:57:18', '2019-06-21 16:57:18', 0),
(16, 1, 12, '2019-06-22 05:20:58', '2019-06-22 05:20:58', 1),
(17, 9, 12, '2019-06-22 08:48:22', '2019-06-22 08:48:22', 1),
(18, 1, 20, '2019-06-22 09:27:40', '2019-06-22 09:27:40', 0),
(19, 10, 20, '2019-06-22 10:51:40', '2019-06-22 10:51:40', 1),
(20, 13, 7, '2019-06-22 11:10:16', '2019-06-22 11:10:16', 1),
(21, 6, 20, '2019-06-22 11:31:28', '2019-06-22 11:31:28', 0),
(22, 3, 20, '2019-06-22 11:31:32', '2019-06-22 11:31:32', 1),
(23, 2, 20, '2019-06-22 11:31:39', '2019-06-22 11:31:39', 1),
(24, 23, 11, '2019-06-22 12:16:31', '2019-06-22 12:16:31', 1),
(25, 27, 11, '2019-06-22 12:31:10', '2019-06-22 12:31:10', 1),
(26, 27, 17, '2019-06-24 07:21:17', '2019-06-24 07:21:17', 0),
(27, 21, 17, '2019-06-24 07:21:37', '2019-06-24 07:21:37', 1),
(28, 36, 11, '2019-06-25 09:03:45', '2019-06-25 09:03:45', 1),
(29, 52, 18, '2019-06-26 05:27:19', '2019-06-26 05:27:19', 0),
(30, 51, 18, '2019-06-26 07:23:03', '2019-06-26 07:23:03', 0),
(31, 64, 18, '2019-06-26 07:23:05', '2019-06-26 07:23:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-06-04 03:22:52', '2019-06-04 03:22:52');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-06-04 03:22:52', '2019-06-04 03:22:52', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 8, '2019-06-04 03:22:52', '2019-06-07 08:13:13', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 2, '2019-06-04 03:22:52', '2019-06-07 08:12:59', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 3, '2019-06-04 03:22:52', '2019-06-07 08:12:59', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2019-06-04 03:22:52', '2019-06-07 08:13:13', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-06-04 03:22:52', '2019-06-07 05:40:33', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-06-04 03:22:52', '2019-06-07 05:40:33', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-06-04 03:22:52', '2019-06-07 05:40:33', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-06-04 03:22:52', '2019-06-07 05:40:33', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2019-06-04 03:22:52', '2019-06-07 08:13:13', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-06-04 03:22:54', '2019-06-07 05:40:33', 'voyager.hooks', NULL),
(12, 1, 'Video Categories', '', '_self', 'voyager-categories', '#000000', NULL, 5, '2019-06-04 04:00:34', '2019-06-07 08:13:05', 'voyager.categories.index', 'null'),
(13, 1, 'Video', '', '_self', 'voyager-news', '#000000', NULL, 4, '2019-06-04 04:00:35', '2019-06-07 08:13:02', 'voyager.posts.index', 'null'),
(14, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2019-06-04 04:00:36', '2019-06-07 08:13:16', 'voyager.pages.index', NULL),
(15, 1, 'Quotes', '', '_self', 'voyager-leaf', '#000000', NULL, 6, '2019-06-07 01:09:26', '2019-06-08 06:20:22', 'voyager.quotes.index', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2016_01_01_000000_create_pages_table', 2),
(24, '2016_01_01_000000_create_posts_table', 2),
(25, '2016_02_15_204651_create_categories_table', 2),
(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'About Us', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-06-04 04:00:36', '2019-06-04 04:30:17'),
(2, 1, 'Privacy & Policy', 'Privacy & Policy', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\"><span style=\"font-size: medium;\">Privacy &amp; Policy</span>&nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque cursus urna sit amet dignissim volutpat. Morbi orci magna, volutpat quis condimentum in, dictum eget elit. Phasellus vulputate lacus condimentum eros viverra rhoncus. Integer rhoncus tincidunt venenatis. Donec ac pharetra urna, sed condimentum nunc. In placerat finibus massa, sit amet imperdiet neque. Maecenas consequat felis vel eros pulvinar pharetra. Pellentesque eu pretium urna. Pellentesque non cursus turpis, ut fringilla purus. Ut venenatis tincidunt turpis non congue. Vivamus ultrices ullamcorper leo in auctor. Nulla volutpat malesuada lectus.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">Aliquam vitae diam dapibus, sagittis lectus sagittis, ultricies elit. Proin quis fringilla quam. Quisque accumsan porttitor dapibus. Donec risus augue, sollicitudin sed sem at, suscipit luctus metus. Nam efficitur, tellus in condimentum fermentum, mi tortor sollicitudin orci, et bibendum eros ex non nunc. Donec sagittis dui ullamcorper, sollicitudin diam sit amet, vestibulum neque. Aliquam nec ex quam. Praesent et risus aliquam, varius mi id, rhoncus ligula. Nulla facilisi. Fusce a diam ultricies, porta quam vitae, venenatis massa. Quisque euismod enim erat, a facilisis libero congue id. Nam at justo viverra, sagittis augue ullamcorper, blandit leo. Phasellus nisi diam, suscipit laoreet sodales vitae, aliquam eu nisi. Fusce blandit lorem nibh. Pellentesque mauris massa, tincidunt quis aliquet et, cursus in est. Proin feugiat odio neque, convallis volutpat orci accumsan at.</p>\r\n<p>&nbsp;</p>', NULL, 'privacy-and-policy', 'Privacy & Policy', 'Privacy & Policy', 'ACTIVE', '2019-06-04 04:30:36', '2019-08-16 05:27:24'),
(3, 1, 'Terms & Conditions', 'test', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">Terms &amp; Conditions Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi congue, libero quis ornare posuere, augue arcu blandit leo, non semper velit nisi porta lorem. Nullam ac orci vulputate felis tempus luctus. Pellentesque lorem arcu, accumsan vel fermentum vitae, sollicitudin ut augue. Nunc sollicitudin mollis vulputate. Nam augue lectus, rhoncus sit amet lorem non, laoreet rutrum mi. Maecenas fringilla ex vitae felis tincidunt placerat. Nulla facilisi. Phasellus luctus elit id mauris pellentesque, id vulputate orci imperdiet. Donec nec dapibus risus.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">Cras hendrerit ipsum vitae dolor gravida commodo. Quisque euismod sapien ante, eu tincidunt tellus efficitur at. Nullam eu nibh posuere dolor feugiat dapibus. Aliquam eu hendrerit leo. Quisque maximus rhoncus commodo. Morbi rutrum tempor pharetra. Donec vel mollis velit. Integer lobortis congue ipsum, vel sollicitudin nunc sodales sed. Maecenas tincidunt ante est, ut sagittis mauris sollicitudin eget. Curabitur quis accumsan mi. Mauris quis libero nunc.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">In hac habitasse platea dictumst. Ut condimentum consectetur ipsum, et aliquet arcu cursus ac. Nunc fringilla leo id lobortis semper. In a quam ut ante pellentesque laoreet nec rhoncus ligula. Curabitur nulla urna, auctor id lectus id, pellentesque mollis augue. In vehicula elit leo, ac pretium neque euismod et. Fusce blandit auctor aliquam. Phasellus gravida ligula nisi, id facilisis ante vehicula ut.</p>', NULL, 'terms-and-conditions', 'test', 'test', 'INACTIVE', '2019-06-04 04:30:46', '2019-08-16 04:41:52'),
(4, 4, 'Support', NULL, '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">Support Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi congue, libero quis ornare posuere, augue arcu blandit leo, non semper velit nisi porta lorem. Nullam ac orci vulputate felis tempus luctus. Pellentesque lorem arcu, accumsan vel fermentum vitae, sollicitudin ut augue. Nunc sollicitudin mollis vulputate. Nam augue lectus, rhoncus sit amet lorem non, laoreet rutrum mi. Maecenas fringilla ex vitae felis tincidunt placerat. Nulla facilisi. Phasellus luctus elit id mauris pellentesque, id vulputate orci imperdiet. Donec nec dapibus risus.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">Cras hendrerit ipsum vitae dolor gravida commodo. Quisque euismod sapien ante, eu tincidunt tellus efficitur at. Nullam eu nibh posuere dolor feugiat dapibus. Aliquam eu hendrerit leo. Quisque maximus rhoncus commodo. Morbi rutrum tempor pharetra. Donec vel mollis velit. Integer lobortis congue ipsum, vel sollicitudin nunc sodales sed. Maecenas tincidunt ante est, ut sagittis mauris sollicitudin eget. Curabitur quis accumsan mi. Mauris quis libero nunc.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">In hac habitasse platea dictumst. Ut condimentum consectetur ipsum, et aliquet arcu cursus ac. Nunc fringilla leo id lobortis semper. In a quam ut ante pellentesque laoreet nec rhoncus ligula. Curabitur nulla urna, auctor id lectus id, pellentesque mollis augue. In vehicula elit leo, ac pretium neque euismod et. Fusce blandit auctor aliquam. Phasellus gravida ligula nisi, id facilisis ante vehicula ut.</p>', NULL, 'support', NULL, NULL, 'INACTIVE', '2019-08-16 04:10:34', '2019-08-16 04:44:18'),
(5, 4, 'Marketing', NULL, '<div id=\"lipsum\" style=\"margin: 0px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">\r\n<p style=\"margin: 0px 0px 15px; padding: 0px;\">Marketing Aliquam maximus lectus et vulputate luctus. Integer quis feugiat orci, et vulputate metus. Vivamus facilisis ligula tortor. Nam blandit sodales turpis ac placerat. Etiam ullamcorper, ipsum ac posuere commodo, dui neque condimentum libero, quis tempus tortor nisl auctor elit. Sed malesuada imperdiet nisi sed facilisis. Vivamus non ullamcorper tellus. Vestibulum odio orci, laoreet id ipsum in, vulputate luctus sem. Pellentesque consectetur quis nulla eget convallis. Nunc odio elit, semper vitae consectetur sed, hendrerit id orci. Cras lectus diam, eleifend iaculis purus sed, laoreet commodo tellus. Aliquam vel nisi ac enim pellentesque posuere. Etiam blandit finibus mi, ac ultrices lectus interdum eu.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px;\">Integer tincidunt, massa ut pellentesque tempus, nisi metus pulvinar eros, vitae ultrices ligula nulla in leo. In fermentum condimentum erat, et iaculis nisl cursus molestie. Etiam id tristique urna, non semper nisi. Quisque eu bibendum risus, eu rutrum enim. Ut in venenatis neque, ut pharetra neque. Pellentesque sit amet dui justo. Phasellus sed ullamcorper est, ac congue sem. Ut blandit, turpis in venenatis pretium, elit eros fringilla ipsum, eget gravida turpis tellus in ligula.</p>\r\n<p>&nbsp;</p>\r\n</div>', NULL, 'marketing', NULL, NULL, 'INACTIVE', '2019-08-16 04:12:41', '2019-08-16 04:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(2, 'browse_bread', NULL, '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(3, 'browse_database', NULL, '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(4, 'browse_media', NULL, '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(5, 'browse_compass', NULL, '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(6, 'browse_menus', 'menus', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(7, 'read_menus', 'menus', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(8, 'edit_menus', 'menus', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(9, 'add_menus', 'menus', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(10, 'delete_menus', 'menus', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(11, 'browse_roles', 'roles', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(12, 'read_roles', 'roles', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(13, 'edit_roles', 'roles', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(14, 'add_roles', 'roles', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(15, 'delete_roles', 'roles', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(16, 'browse_users', 'users', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(17, 'read_users', 'users', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(18, 'edit_users', 'users', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(19, 'add_users', 'users', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(20, 'delete_users', 'users', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(21, 'browse_settings', 'settings', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(22, 'read_settings', 'settings', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(23, 'edit_settings', 'settings', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(24, 'add_settings', 'settings', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(25, 'delete_settings', 'settings', '2019-06-04 03:22:53', '2019-06-04 03:22:53'),
(26, 'browse_hooks', NULL, '2019-06-04 03:22:54', '2019-06-04 03:22:54'),
(27, 'browse_categories', 'categories', '2019-06-04 04:00:34', '2019-06-04 04:00:34'),
(28, 'read_categories', 'categories', '2019-06-04 04:00:34', '2019-06-04 04:00:34'),
(29, 'edit_categories', 'categories', '2019-06-04 04:00:34', '2019-06-04 04:00:34'),
(30, 'add_categories', 'categories', '2019-06-04 04:00:34', '2019-06-04 04:00:34'),
(31, 'delete_categories', 'categories', '2019-06-04 04:00:34', '2019-06-04 04:00:34'),
(32, 'browse_posts', 'posts', '2019-06-04 04:00:35', '2019-06-04 04:00:35'),
(33, 'read_posts', 'posts', '2019-06-04 04:00:35', '2019-06-04 04:00:35'),
(34, 'edit_posts', 'posts', '2019-06-04 04:00:35', '2019-06-04 04:00:35'),
(35, 'add_posts', 'posts', '2019-06-04 04:00:35', '2019-06-04 04:00:35'),
(36, 'delete_posts', 'posts', '2019-06-04 04:00:35', '2019-06-04 04:00:35'),
(37, 'browse_pages', 'pages', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(38, 'read_pages', 'pages', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(39, 'edit_pages', 'pages', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(40, 'add_pages', 'pages', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(41, 'delete_pages', 'pages', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(42, 'browse_quotes', 'quotes', '2019-06-07 01:09:26', '2019-06-07 01:09:26'),
(43, 'read_quotes', 'quotes', '2019-06-07 01:09:26', '2019-06-07 01:09:26'),
(44, 'edit_quotes', 'quotes', '2019-06-07 01:09:26', '2019-06-07 01:09:26'),
(45, 'add_quotes', 'quotes', '2019-06-07 01:09:26', '2019-06-07 01:09:26'),
(46, 'delete_quotes', 'quotes', '2019-06-07 01:09:26', '2019-06-07 01:09:26'),
(47, 'browse_videofavourites', 'videofavourites', '2019-06-07 04:39:04', '2019-06-07 04:39:04'),
(48, 'read_videofavourites', 'videofavourites', '2019-06-07 04:39:04', '2019-06-07 04:39:04'),
(49, 'edit_videofavourites', 'videofavourites', '2019-06-07 04:39:04', '2019-06-07 04:39:04'),
(50, 'add_videofavourites', 'videofavourites', '2019-06-07 04:39:04', '2019-06-07 04:39:04'),
(51, 'delete_videofavourites', 'videofavourites', '2019-06-07 04:39:04', '2019-06-07 04:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_video_thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `post_video`, `post_video_thumb`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `start_date`, `end_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(66, 4, 1, 'first video', NULL, NULL, '<p>When we first begin to read, we learn that certain symbols stand for concepts. We start by recognizing letters and associating the forms with the sounds they represent. Then we move to recognizing entire words and what they mean. Once we&rsquo;ve processed those individual words, we can move on to comprehension: Figuring out what the writer meant by stringing those words together. It&rsquo;s difficult work, particularly if you&rsquo;re just learning to read or you&rsquo;re one of the nearly <a href=\"http://www.nationmaster.com/graph/edu_lit_adu_at_low_lit_lev-education-literacy-adults-low-level\">50% of the population</a> who have low literacy skills.</p>', NULL, '1562136946.mp4', '1562136946_thumnail.jpg', NULL, NULL, NULL, 'Active', 0, '2019-07-18', '2019-07-31', '2019-06-26 08:07:38', '2019-07-18 03:58:43', NULL),
(67, 4, 1, 'video 2', NULL, NULL, '<p>When we first begin to read, we learn that certain symbols stand for concepts. We start by recognizing letters and associating the forms with the sounds they represent. Then we move to recognizing entire words and what they mean. Once we&rsquo;ve processed those individual words, we can move on to comprehension: Figuring out what the writer meant by stringing those words together. It&rsquo;s difficult work, particularly if you&rsquo;re just learning to read or you&rsquo;re one of the nearly <a href=\"http://www.nationmaster.com/graph/edu_lit_adu_at_low_lit_lev-education-literacy-adults-low-level\">50% of the population</a> who have low literacy skills.</p>', NULL, '1562136970.mp4', '1562136970_thumnail.jpg', NULL, NULL, NULL, 'Active', 0, NULL, NULL, '2019-06-26 08:08:03', '2019-06-26 08:08:03', NULL),
(83, 4, 1, 'Nature video Animation', NULL, NULL, '<p>This is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video example</p>', NULL, '1562137108.mp4', '1562137108_thumnail.jpg', NULL, NULL, NULL, 'Active', 0, NULL, NULL, '2019-07-02 00:59:04', '2019-07-02 00:59:04', NULL),
(84, 4, 1, 'Testing one video', NULL, NULL, '<p>This is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video exampleThis is for tesing video example</p>', NULL, '1562137132.mp4', '1562137132_thumnail.jpg', NULL, NULL, NULL, 'Active', 0, NULL, NULL, '2019-07-02 01:00:25', '2019-07-02 01:00:25', NULL),
(109, 4, 1, 'Playground Video', NULL, NULL, '<p>This video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purpose</p>', NULL, '1562136841.mp4', '1562136841_thumnail.jpg', NULL, NULL, NULL, 'Active', 0, NULL, NULL, '2019-07-02 06:28:49', '2019-07-02 06:28:49', NULL),
(110, 4, 1, 'Playground second video', NULL, NULL, '<p>This video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purposeThis video is only for testing purpose</p>', NULL, '1562136819.mp4', '1562136819_thumnail.jpg', NULL, NULL, NULL, 'Active', 0, NULL, NULL, '2019-07-02 06:29:19', '2019-07-02 06:29:19', NULL),
(111, 4, 1, 'Video 1', NULL, NULL, '<p><span style=\"caret-color: #222222; color: #222222; font-family: Georgia, Times, \'Times New Roman\', serif; font-size: 18px;\">Consider a health information site with two sets of fact sheets: A simplified version for the lay audience and a technical version for physicians. During testing, a physician participant reading the technical version stopped to say, &ldquo;Look. I have five minutes in between patients to get the gist of this information. I&rsquo;m not conducting research on the topic, I just want to learn enough to talk to my patients about it. If I can&rsquo;t figure it out quickly, I can&rsquo;t use it.&rdquo; We&rsquo;d made some incorrect assumptions about each audience&rsquo;s needs and we would have missed this important revelation had we not tested the content.</span></p>', NULL, '1562136779.mp4', '1562136779_thumnail.jpg', NULL, NULL, NULL, 'Active', 0, NULL, NULL, '2019-07-02 07:01:32', '2019-07-02 07:01:32', NULL),
(112, 4, 1, 'video 2', NULL, NULL, '<p><span style=\"caret-color: #222222; color: #222222; font-family: Georgia, Times, \'Times New Roman\', serif; font-size: 18px;\">Consider a health information site with two sets of fact sheets: A simplified version for the lay audience and a technical version for physicians. During testing, a physician participant reading the technical version stopped to say, &ldquo;Look. I have five minutes in between patients to get the gist of this information. I&rsquo;m not conducting research on the topic, I just want to learn enough to talk to my patients about it. If I can&rsquo;t figure it out quickly, I can&rsquo;t use it.&rdquo; We&rsquo;d made some incorrect assumptions about each audience&rsquo;s needs and we would have missed this important revelation had we not tested the content.</span><span style=\"caret-color: #222222; color: #222222; font-family: Georgia, Times, \'Times New Roman\', serif; font-size: 18px;\">Consider a health information site with two sets of fact sheets: A simplified version for the lay audience and a technical version for physicians. During testing, a physician participant reading the technical version stopped to say, &ldquo;Look. I have five minutes in between patients to get the gist of this information. I&rsquo;m not conducting research on the topic, I just want to learn enough to talk to my patients about it. If I can&rsquo;t figure it out quickly, I can&rsquo;t use it.&rdquo; We&rsquo;d made some incorrect assumptions about each audience&rsquo;s needs and we would have missed this important revelation had we not tested the content.</span></p>', NULL, '1562136802.mp4', '1562136802_thumnail.jpg', NULL, NULL, NULL, 'Active', 0, NULL, NULL, '2019-07-02 07:04:32', '2019-07-02 07:04:32', NULL),
(117, 4, 1, 'video 3', NULL, NULL, '<p style=\"box-sizing: inherit; margin-bottom: 1.5em; margin-top: 0px; caret-color: #222222; color: #222222; font-family: Georgia, Times, \'Times New Roman\', serif; font-size: 18px;\">Consider a health information site with two sets of fact sheets: A simplified version for the lay audience and a technical version for physicians. During testing, a physician participant reading the technical version stopped to say, &ldquo;Look. I have five minutes in between patients to get the gist of this information. I&rsquo;m not conducting research on the topic, I just want to learn enough to talk to my patients about it. If I can&rsquo;t figure it out quickly, I can&rsquo;t use it.&rdquo; We&rsquo;d made some incorrect assumptions about each audience&rsquo;s needs and we would have missed this important revelation had we not tested the content.</p>\r\n<p>&nbsp;</p>', NULL, '1562136621.mp4', '1562136621_thumnail.jpg', NULL, NULL, NULL, 'Active', 0, NULL, NULL, '2019-07-02 07:26:48', '2019-07-02 07:26:48', NULL),
(126, 4, 1, 'Video 4', NULL, NULL, '<p><span style=\"color: #222222; font-family: Georgia, Times, \'Times New Roman\', serif; font-size: 18px; caret-color: #222222;\">Consider a health information site with two sets of fact sheets: A simplified version for the lay audience and a technical version for physicians. During testing, a physician participant reading the technical version stopped to say, &ldquo;Look. I have five minutes in between patients to get the gist of this information. I&rsquo;m not conducting research on the topic, I just want to learn enough to talk to my patients about it. If I can&rsquo;t figure it out quickly, I can&rsquo;t use it.&rdquo; We&rsquo;d made some incorrect assumptions about each audience&rsquo;s needs and we would have missed this important revelation had we not tested the content.</span></p>', NULL, '1562143176.mp4', '1562143176_thumnail.jpg', NULL, NULL, NULL, 'Active', 0, '2019-07-18', '2019-07-20', '2019-07-03 03:09:36', '2019-07-18 04:38:52', NULL),
(128, 4, 1, 'video 5', NULL, NULL, '<p>Readability formulas measure the elements of writing that can be quantified, such as the length of words and sentences, to predict the skill level required to understand them. They can be a quick, easy, and cheap way to estimate whether a text will be too difficult for the intended audience. The results are easy to understand: many state the approximate U.S. grade level of the text.</p>', NULL, '1562146621.mp4', '1562146621_thumnail.jpg', NULL, NULL, NULL, 'Active', 0, '2019-07-18', '2019-07-18', '2019-07-03 04:06:42', '2019-07-18 04:38:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotes_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `founder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `name`, `quotes_date`, `created_at`, `updated_at`, `is_active`, `founder_name`) VALUES
(1, 'Character is like a tree and reputation like a shadow. The shadow is what we think of        it; the tree is the real thing.', NULL, '2019-06-07 01:17:39', '2019-06-22 07:00:30', 1, 'Abraham Lincoln'),
(2, 'Folks are usually about as happy as they make their minds up to be.', NULL, '2019-06-07 01:17:50', '2019-06-22 06:58:46', 1, 'Lincoln Lincoln'),
(3, 'Whatever you are, be a good one.', NULL, '2019-06-07 01:17:55', '2019-07-18 05:48:11', 1, 'Lincoln Abraham');

-- --------------------------------------------------------

--
-- Table structure for table `recommend_videos`
--

CREATE TABLE `recommend_videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recommend_videos`
--

INSERT INTO `recommend_videos` (`id`, `video_id`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 26, 22, 0, '2019-06-19 12:28:04', '2019-06-19 12:28:04'),
(3, 29, 22, 0, '2019-06-19 14:27:47', '2019-06-19 14:27:47'),
(4, 27, 22, 1, '2019-06-19 14:28:26', '2019-06-19 14:28:26'),
(5, 49, 7, 0, '2019-06-20 05:35:47', '2019-06-20 05:35:47'),
(6, 49, 12, 1, '2019-06-21 11:01:22', '2019-06-21 11:01:22'),
(7, 50, 9, 0, '2019-06-21 11:29:57', '2019-06-21 11:29:57'),
(8, 50, 12, 1, '2019-06-21 12:57:30', '2019-06-21 12:57:30'),
(9, 49, 19, 1, '2019-06-21 16:54:50', '2019-06-21 16:54:50'),
(10, 49, 21, 1, '2019-06-22 13:52:38', '2019-06-22 13:52:38'),
(11, 49, 17, 0, '2019-06-24 09:07:38', '2019-06-24 09:07:38'),
(12, 49, 11, 1, '2019-06-25 09:03:59', '2019-06-25 09:03:59'),
(13, 52, 18, 1, '2019-06-25 10:52:26', '2019-06-25 10:52:26'),
(14, 55, 18, 0, '2019-06-25 10:55:48', '2019-06-25 10:55:48'),
(15, 59, 7, 0, '2019-06-26 09:33:50', '2019-06-26 09:33:50'),
(16, 61, 17, 0, '2019-06-26 12:55:11', '2019-06-26 12:55:11'),
(17, 64, 24, 0, '2019-06-26 13:13:56', '2019-06-26 13:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-06-04 03:22:52', '2019-06-04 03:22:52'),
(2, 'user', 'User', '2019-06-04 03:22:53', '2019-06-04 03:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'HappApp', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'HappApp', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/July2019/mUF8GMPKiuuk21IeJpqV.png', '', 'image', 4, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 3, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/July2019/YxQVC7lCqO1r9V6QH2Hi.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'HappApp', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Powered by Acquaint SoftTech Private Limited', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings/July2019/ouJMZygdisxX2t4GeGEO.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/July2019/DxVgnXxW63BepboFa12F.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(22, 'menu_items', 'title', 13, 'pt', 'Publicações', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(24, 'menu_items', 'title', 12, 'pt', 'Categorias', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(25, 'menu_items', 'title', 14, 'pt', 'Páginas', '2019-06-04 04:00:36', '2019-06-04 04:00:36'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-06-04 04:00:37', '2019-06-04 04:00:37'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-06-04 04:00:37', '2019-06-04 04:00:37'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-06-04 04:00:37', '2019-06-04 04:00:37'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-06-04 04:00:37', '2019-06-04 04:00:37'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-06-04 04:00:37', '2019-06-04 04:00:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_facebook` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_twitter` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_google` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `number`, `facebook_id`, `twitter_id`, `google_id`, `is_facebook`, `is_twitter`, `is_google`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, NULL, NULL, NULL, NULL, '', '', '', 1, 'Admin', 'admin@admin.com', 'users/July2019/NKWc2woOu8cyhDByizgd.png', NULL, '$2y$10$hQOyKSqtBwB5YrJl4bKGD.oI6aVNiaUAijT5/zvIim9o9d2czGW.G', 'KfBgEKx0oL4mP7Z7xBWuwYqdfXr0eWwiRxwDL4exZXKqeJPcTWw7PzSM4yFT', '{\"locale\":\"en\"}', NULL, '2019-07-18 08:16:13', NULL),
(7, NULL, NULL, NULL, NULL, '0', '0', '0', 2, 'Logan Jack', 'jacklogan955@gmail.com', 'users/July2019/8q1vVJmcFBTNuqKQaldh.jpg', NULL, '$2y$10$4k6HziYQiLIk.8vS.cbUke5JHRsczKo5l.ame3LR/NmA0W8An2GaO', NULL, '{\"locale\":\"en\"}', NULL, '2019-07-10 06:05:14', NULL),
(8, NULL, '618526398628541', NULL, NULL, '0', '0', '0', 2, 'Felix Thomas', 'felixthomas727@gmail.com', 'https://graph.facebook.com/618526398628541/picture?width=500&height=500', NULL, '', NULL, NULL, NULL, '2019-07-04 00:30:31', NULL),
(17, NULL, NULL, NULL, '114313466094044102276', '0', '0', '0', 2, 'Thomas Felix', 'felixthomas727@gmail.com', 'http://mobiweb.biz/happyapp-web/public/uploads/profile_pic/1561552710.jpg', NULL, '', NULL, NULL, NULL, NULL, NULL),
(26, '1125225167', '618526398628541', '', '', '1', '0', '0', 2, 'dev', 'dev4@gmail.com', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=414716589119981&height=200&width=200&ext=1564146505&hash=AeQWp8mqUXKFbtCg', NULL, '', NULL, NULL, NULL, NULL, NULL),
(27, NULL, NULL, NULL, '103804546543672869420', '0', '0', '0', 2, 'Benjamin de Vera', 'ben@varfaj.com', 'https://lh6.googleusercontent.com/-sbYSbZ6lVAw/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3reIW_QPq62rob1FBQJ8xmMgpF08QA/s100/photo.jpg', NULL, '', NULL, NULL, NULL, NULL, NULL),
(28, NULL, '2294654640589431', NULL, NULL, '0', '0', '0', 2, 'Sanjeet Verma', 'sanjeet.verma3@hotmail.com', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=2294654640589431&height=200&width=200&ext=1564651456&hash=AeTKTYQ5b55qwLis', NULL, '', NULL, NULL, NULL, NULL, NULL),
(29, '1125225167', '618526398628541', '', '', '1', '0', '0', 2, 'dev', 'dev4@gmail.com', 'https://lh5.googleusercontent.com/-4FGTDNotfeE/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3rdXSu1y6gBtpXQQQiM37_SqghWVAg/s100/photo.jpg', NULL, '', NULL, NULL, NULL, NULL, NULL),
(30, NULL, NULL, NULL, '112038732723297332095', '0', '0', '0', 2, 'PATEL HETAL', 'patelhetal0517@gmail.com', 'http://mobiweb.biz/happyapp-web/public/uploads/profile_pic/1562146908.jpg', NULL, '', NULL, NULL, NULL, NULL, NULL),
(31, NULL, '420050858583413', NULL, NULL, '0', '0', '0', 2, 'Charles Samuel', 'charlessamuel733@gmail.com', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=420050858583413&height=200&width=200&ext=1564662324&hash=AeRFDztPoFCwyyeU', NULL, '', NULL, NULL, NULL, NULL, NULL),
(32, NULL, '131211113', '131211116', '131211118', '1', '1', '1', 2, 'deva1', 'dev2@gmail.com', 'test.png', NULL, '', NULL, NULL, NULL, NULL, NULL),
(33, NULL, '618526398628542', NULL, NULL, '0', '0', '0', 2, 'deva1', 'felixthomas727@gmail.com', 'test.png', NULL, '', NULL, NULL, NULL, NULL, NULL),
(34, NULL, '618526398628541', '618526398628541', '618526398628541', '1', '1', '1', 2, 'deva1', 'felixthomas737@gmail.com', 'test.png', NULL, '', NULL, NULL, NULL, NULL, NULL),
(35, NULL, '618526398628541', '', '', '1', '0', '0', 2, 'deva1', 'felixthomas7777@gmail.com', 'test.png', NULL, '', NULL, NULL, NULL, NULL, NULL),
(36, NULL, NULL, NULL, '131211118', '0', '0', '1', 2, 'deva1', 'dev3@gmail.com', 'test.png', NULL, '', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_comments`
--

CREATE TABLE `user_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_comments`
--

INSERT INTO `user_comments` (`id`, `video_id`, `user_id`, `parent_id`, `type`, `text`, `created_at`, `updated_at`, `is_active`) VALUES
(3, 117, 31, NULL, 0, 'Hiii', '2019-07-02 12:59:26', '2019-07-02 12:59:26', 0),
(4, 129, 31, NULL, 0, 'Hii', '2019-07-03 09:39:39', '2019-07-03 09:39:39', 0),
(5, 129, 30, NULL, 0, 'Hii', '2019-07-03 09:40:00', '2019-07-03 09:40:00', 0),
(6, 129, 17, NULL, 0, 'Hello', '2019-07-03 10:13:56', '2019-07-03 10:13:56', 1),
(7, 129, 17, NULL, 0, 'Hiii', '2019-07-03 10:14:02', '2019-07-03 10:14:02', 1),
(8, 129, 17, NULL, 0, 'Hiii', '2019-07-03 10:14:10', '2019-07-03 10:14:10', 1),
(9, 129, 30, NULL, 0, 'Hiii', '2019-07-03 10:14:42', '2019-07-03 10:14:42', 0),
(10, 129, 30, NULL, 0, 'Hii', '2019-07-03 10:14:53', '2019-07-03 10:14:53', 0),
(11, 129, 30, NULL, 0, 'Hii', '2019-07-03 10:15:02', '2019-07-03 10:15:02', 0),
(12, 129, 30, NULL, 0, 'Hii', '2019-07-03 10:15:17', '2019-07-03 10:15:17', 0),
(13, 129, 30, NULL, 0, 'Hii', '2019-07-03 10:15:25', '2019-07-03 10:15:25', 0),
(14, 128, 30, NULL, 0, 'Hiii', '2019-07-03 10:16:08', '2019-07-03 10:16:08', 0),
(15, 128, 30, NULL, 0, 'Hiii', '2019-07-03 10:16:14', '2019-07-03 10:16:14', 0),
(16, 128, 30, NULL, 0, 'Hiii', '2019-07-03 10:16:19', '2019-07-03 10:16:19', 0),
(17, 128, 30, NULL, 0, 'Hello', '2019-07-03 10:16:43', '2019-07-03 10:16:43', 0),
(18, 126, 30, NULL, 0, 'Hii', '2019-07-03 10:19:03', '2019-07-03 10:19:03', 1),
(19, 126, 30, NULL, 0, 'Hii', '2019-07-03 10:19:14', '2019-07-03 10:19:14', 1),
(20, 126, 30, NULL, 0, 'Hii', '2019-07-03 10:19:19', '2019-07-03 10:19:19', 1),
(21, 83, 30, NULL, 0, 'Hiii', '2019-07-03 10:22:24', '2019-07-03 10:22:24', 0),
(22, 126, 26, NULL, 0, 'Hello this is my first comment', '2019-07-03 10:25:41', '2019-07-03 10:25:41', 0),
(23, 126, 26, NULL, 0, 'Hello this is my second comment', '2019-07-03 10:26:52', '2019-07-03 10:26:52', 0),
(24, 83, 30, NULL, 0, 'Helllollollo', '2019-07-03 10:29:55', '2019-07-03 10:29:55', 0),
(25, 83, 30, NULL, 0, 'Hi', '2019-07-03 10:30:02', '2019-07-03 10:30:02', 0),
(26, 126, 30, NULL, 0, 'Hiii', '2019-07-03 10:32:29', '2019-07-03 10:32:29', 0),
(27, 84, 31, NULL, 0, 'Hey test', '2019-07-03 10:32:58', '2019-07-03 10:32:58', 1),
(28, 84, 31, NULL, 0, 'Hey', '2019-07-03 10:33:12', '2019-07-03 10:33:12', 1),
(29, 84, 31, NULL, 0, 'Hiii', '2019-07-03 10:33:20', '2019-07-03 10:33:20', 1),
(30, 110, 31, NULL, 0, 'Hello test', '2019-07-03 10:33:33', '2019-07-03 10:33:33', 1),
(31, 126, 26, NULL, 0, 'Hello this is my third comment', '2019-07-03 10:34:41', '2019-07-03 10:34:41', 0),
(32, 126, 26, NULL, 0, 'This is my fourth comment', '2019-07-03 10:41:46', '2019-07-03 10:41:46', 0),
(33, 126, 26, NULL, 0, 'This is my fifth comment', '2019-07-03 10:42:29', '2019-07-03 10:42:29', 0),
(34, 126, 26, NULL, 0, 'This is my sixth comment', '2019-07-03 10:44:45', '2019-07-03 10:44:45', 0),
(35, 126, 26, NULL, 0, 'This is my seventh comment', '2019-07-03 10:53:38', '2019-07-03 10:53:38', 0),
(36, 111, 26, NULL, 0, 'This is my first comment', '2019-07-03 10:54:33', '2019-07-03 10:54:33', 0),
(37, 111, 26, NULL, 0, 'This is my second comment', '2019-07-03 10:54:53', '2019-07-03 10:54:53', 0),
(38, 111, 26, NULL, 0, 'This is my third comment', '2019-07-03 10:56:48', '2019-07-03 10:56:48', 0),
(39, 111, 26, NULL, 0, 'This is my forth comment', '2019-07-03 10:58:51', '2019-07-03 10:58:51', 0),
(40, 126, 26, 35, 1, 'Reply on seventh comment', '2019-07-03 11:01:13', '2019-07-03 11:01:13', 0),
(41, 126, 26, NULL, 0, 'This is eight comment', '2019-07-03 11:10:49', '2019-07-03 11:10:49', 0),
(42, 126, 26, NULL, 0, 'This is nineth comment', '2019-07-03 11:22:33', '2019-07-03 11:22:33', 0),
(43, 110, 26, NULL, 0, 'This is first comment from my side', '2019-07-03 11:24:57', '2019-07-03 11:24:57', 0),
(44, 110, 26, NULL, 0, 'This is second comment', '2019-07-03 11:25:33', '2019-07-03 11:25:33', 0),
(45, 110, 26, NULL, 0, 'This is third comment', '2019-07-03 11:26:12', '2019-07-03 11:26:12', 0),
(46, 110, 26, NULL, 0, 'This is forth comment', '2019-07-03 11:26:59', '2019-07-03 11:26:59', 0),
(47, 110, 26, NULL, 0, 'This is fifth comment', '2019-07-03 11:30:44', '2019-07-03 11:30:44', 0),
(48, 110, 26, NULL, 0, 'This is sixth comment', '2019-07-03 11:31:40', '2019-07-03 11:31:40', 0),
(49, 126, 26, 42, 1, 'Reply of nineth comment', '2019-07-03 11:34:12', '2019-07-03 11:34:12', 0),
(50, 84, 17, NULL, 0, 'First comment', '2019-07-03 13:08:11', '2019-07-03 13:08:11', 0),
(51, 84, 17, NULL, 0, 'Second comment', '2019-07-03 13:08:23', '2019-07-03 13:08:23', 0),
(52, 84, 17, NULL, 0, 'Third comment', '2019-07-03 13:08:35', '2019-07-03 13:08:35', 0),
(53, 84, 17, 51, 1, 'Hello', '2019-07-03 13:08:42', '2019-07-03 13:08:42', 0),
(54, 84, 17, 51, 1, 'Hiii', '2019-07-03 13:08:55', '2019-07-03 13:08:55', 0),
(55, 83, 17, NULL, 0, 'Hii', '2019-07-03 13:14:46', '2019-07-03 13:14:46', 0),
(56, 83, 17, 55, 1, 'Hii', '2019-07-03 13:14:50', '2019-07-03 13:14:50', 0),
(57, 83, 17, 55, 1, 'Hello', '2019-07-03 13:14:54', '2019-07-03 13:14:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_feedbacks`
--

CREATE TABLE `user_feedbacks` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_feedbacks`
--

INSERT INTO `user_feedbacks` (`id`, `email`, `text`, `created_at`, `updated_at`) VALUES
(1, 'dev@yopmail.com', 'dev test', '2019-06-17 00:37:20', '2019-06-17 06:07:20'),
(2, 'dev@yopmail.com', 'dev test', '2019-06-17 00:37:40', '2019-06-17 06:07:40'),
(3, 'dev@yopmail.com', 'dev test', '2019-06-17 00:39:03', '2019-06-17 06:09:03'),
(4, 'devacs@yopmail.com', 'dev test', '2019-06-17 00:40:21', '2019-06-17 06:10:21'),
(5, 'chetan@yopmail.com', 'dev test', '2019-06-17 00:40:54', '2019-06-17 06:10:54'),
(6, 'chetan@yopmail.com', 'dev test', '2019-06-17 00:41:18', '2019-06-17 06:11:18'),
(7, 'chetan@yopmail.com', 'dev test', '2019-06-17 00:42:20', '2019-06-17 06:12:20'),
(8, 'chetan@yopmail.com', 'dev test', '2019-06-17 00:44:30', '2019-06-17 06:14:30'),
(9, 'chetan@yopmail.com', 'dev test', '2019-06-17 00:44:37', '2019-06-17 06:14:37'),
(10, 'chetan@yopmail.com', 'dev test', '2019-06-17 00:45:47', '2019-06-17 06:15:47'),
(11, 'chetan@yopmail.com', 'dev test', '2019-06-17 00:46:04', '2019-06-17 06:16:04'),
(12, 'chetan@yopmail.com', 'dev test', '2019-06-17 00:46:14', '2019-06-17 06:16:14'),
(13, 'chetan@yopmail.com', 'dev test', '2019-06-17 00:46:27', '2019-06-17 06:16:27'),
(14, 'chetan@yopmail.com', 'dev test', '2019-06-17 00:48:39', '2019-06-17 06:18:39'),
(15, 'test@gmail.com', 'test', '2019-06-17 00:50:46', '2019-06-17 06:20:46'),
(16, 'test@yopmail.com', 'testast assd', '2019-06-17 01:13:04', '2019-06-17 06:43:04'),
(17, 'test@gmail.com', 'test', '2019-06-17 01:13:27', '2019-06-17 06:43:27'),
(18, 'test@yopmail.com', 'awrwere erer', '2019-06-17 01:14:09', '2019-06-17 06:44:09'),
(19, 'test@yopmail.com', 'ate wewrw', '2019-06-17 01:17:07', '2019-06-17 06:47:07'),
(20, 'test@gmail.com', 'test', '2019-06-17 01:20:10', '2019-06-17 06:50:10'),
(21, 'test@gmail.com', 'feedback test', '2019-06-18 07:07:10', '2019-06-18 12:37:10'),
(22, 'test@gmail.com', 'feedback test', '2019-06-18 07:08:09', '2019-06-18 12:38:09'),
(23, 'test@yopmail.com', 'test', '2019-06-22 03:26:57', '2019-06-22 08:56:57'),
(24, 'test@yopmail.com', 'test', '2019-06-22 03:27:28', '2019-06-22 08:57:28'),
(25, 'test@yopmail.com', 'test', '2019-06-22 03:31:11', '2019-06-22 09:01:11'),
(26, 'test@yopmail.com', 'test', '2019-06-22 03:31:24', '2019-06-22 09:01:24'),
(27, 'test@yopmail.com', 'test', '2019-06-22 03:31:37', '2019-06-22 09:01:37'),
(28, 'test@yopmail.com', 'test', '2019-06-22 03:31:42', '2019-06-22 09:01:42'),
(29, 'test@yopmail.com', 'test', '2019-06-22 03:32:38', '2019-06-22 09:02:38'),
(30, 'test@yopmail.com', 'test', '2019-06-22 03:33:21', '2019-06-22 09:03:21'),
(31, 'test@yopmail.com', 'test', '2019-06-22 03:33:55', '2019-06-22 09:03:55'),
(32, 'test@yopmail.com', 'test', '2019-06-22 03:33:56', '2019-06-22 09:03:56'),
(33, 'test@yopmail.com', 'test', '2019-06-22 03:35:00', '2019-06-22 09:05:00'),
(34, 'test@yopmail.com', 'test', '2019-06-22 03:36:52', '2019-06-22 09:06:52'),
(35, 'test@yopmail.com', 'test', '2019-06-22 03:38:13', '2019-06-22 09:08:13'),
(36, 'test12@yopmail.com', 'test', '2019-06-22 03:40:22', '2019-06-22 09:10:22'),
(37, 'test@gmail.com', 'test', '2019-06-22 03:49:44', '2019-06-22 09:19:44'),
(38, 'test@yopmail.com', 'test', '2019-06-22 04:29:43', '2019-06-22 09:59:43'),
(39, 'test@yopmail.com', 'test', '2019-06-24 00:21:29', '2019-06-24 05:51:29'),
(40, 'test@yopmail.com', 'test', '2019-06-24 00:22:11', '2019-06-24 05:52:11'),
(41, 'test@yopmail.com', 'tesr', '2019-06-24 01:07:15', '2019-06-24 06:37:15'),
(42, 'test@yopmail.com', 'test', '2019-06-24 05:52:24', '2019-06-24 11:22:24'),
(43, 'jacklogan955@gmail.com', 'nice app', '2019-06-24 05:55:37', '2019-06-24 11:25:37'),
(44, 'jacklogan955@gmail.com', 'good app', '2019-06-24 06:43:09', '2019-06-24 12:13:09'),
(45, 'patelhetal0517@gmail.com', 'test', '2019-06-24 07:24:05', '2019-06-24 12:54:05'),
(46, 'jacklogan955@gmail.com', 'nice app', '2019-06-25 03:35:55', '2019-06-25 09:05:55'),
(47, 'test@yopmail.com', 'Test', '2019-06-26 01:32:28', '2019-06-26 07:02:28'),
(48, 'test13@yopmail.com', 'Test', '2019-06-26 03:42:27', '2019-06-26 09:12:27'),
(49, 'charlessamuel733@gmail.com', 'Test feedback', '2019-06-26 06:42:29', '2019-06-26 12:12:29'),
(50, 'felixthomas727@gmail.com', 'Test', '2019-06-26 07:06:06', '2019-06-26 12:36:06'),
(51, 'felixthomas727@gmail.com', 'test', '2019-06-26 07:48:29', '2019-06-26 13:18:29'),
(52, 'charlessamuel733@gmail.com', 'Test', '2019-06-26 07:48:40', '2019-06-26 13:18:40'),
(53, 'charlessamuel733@gmail.com', 'Test', '2019-06-26 08:58:13', '2019-06-26 14:28:13'),
(54, 'charlessamuel733@gmail.com', 'Yehsnjakan  !&.\'M\nM?&. \n\n \n\n \n \n \n \n \n \n Jabjs', '2019-07-02 07:42:27', '2019-07-02 13:12:27'),
(55, 'patelhetal0517@gmail.com', 'Huiiii', '2019-07-03 04:11:35', '2019-07-03 09:41:35');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `videofavourites`
--

CREATE TABLE `videofavourites` (
  `id` int(10) UNSIGNED NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `favourite_type` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videofavourites`
--

INSERT INTO `videofavourites` (`id`, `video_id`, `favourite_type`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2019-06-07 10:24:38', '2019-06-07 10:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `video_favourites`
--

CREATE TABLE `video_favourites` (
  `id` int(10) UNSIGNED NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_favourites`
--

INSERT INTO `video_favourites` (`id`, `video_id`, `user_id`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 67, 36, '2019-07-11 09:07:15', '2019-07-11 09:07:15', 0),
(2, 66, 36, '2019-07-11 09:07:30', '2019-07-11 09:07:30', 0),
(3, 26, 26, '2019-07-18 07:51:08', '2019-07-18 13:21:08', 0),
(4, 27, 26, '2019-07-18 07:51:08', '2019-07-18 13:21:08', 0);

-- --------------------------------------------------------

--
-- Table structure for table `video_viewers`
--

CREATE TABLE `video_viewers` (
  `id` int(10) UNSIGNED NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `user_id` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_viewers`
--

INSERT INTO `video_viewers` (`id`, `video_id`, `user_id`, `created_at`, `updated_at`, `device_id`, `is_active`) VALUES
(34, 49, '0', '2019-06-20 05:39:15', '2019-06-20 11:09:15', '252dbded3b2a1bcb', 0),
(35, 51, '0', '2019-06-20 07:01:07', '2019-06-20 12:31:07', '252dbded3b2a1bcb', 0),
(36, 50, '0', '2019-06-20 23:43:56', '2019-06-21 05:13:56', '252dbded3b2a1bcb', 0),
(37, 50, '0', '2019-06-20 23:50:21', '2019-06-21 05:20:21', 'aec9a1a3eb58cbf1', 0),
(38, 49, '0', '2019-06-20 23:52:42', '2019-06-21 05:22:42', 'aec9a1a3eb58cbf1', 0),
(39, 51, '0', '2019-06-22 02:55:29', '2019-06-22 08:25:29', 'aec9a1a3eb58cbf1', 0),
(40, 49, '0', '2019-06-23 23:17:45', '2019-06-24 04:47:45', 'd8053cbd5a487d58', 0),
(41, 51, '0', '2019-06-23 23:19:27', '2019-06-24 04:49:27', 'd8053cbd5a487d58', 0),
(42, 50, '0', '2019-06-23 23:19:30', '2019-06-24 04:49:30', 'd8053cbd5a487d58', 0),
(43, 54, '0', '2019-06-24 01:37:08', '2019-06-24 07:07:08', '252dbded3b2a1bcb', 0),
(44, 53, '0', '2019-06-24 01:39:46', '2019-06-24 07:09:46', 'd8053cbd5a487d58', 0),
(45, 54, '0', '2019-06-24 01:56:38', '2019-06-24 07:26:38', 'd8053cbd5a487d58', 0),
(46, 55, '0', '2019-06-24 02:00:46', '2019-06-24 07:30:46', 'd8053cbd5a487d58', 0),
(47, 53, '0', '2019-06-24 04:47:36', '2019-06-24 10:17:36', '252dbded3b2a1bcb', 0),
(52, 49, '0', '2019-06-25 00:05:41', '2019-06-25 05:35:41', '36b6b84b18a9daeb', 0),
(53, 52, '0', '2019-06-25 03:11:42', '2019-06-25 08:41:42', '252dbded3b2a1bcb', 0),
(54, 52, '0', '2019-06-25 04:07:54', '2019-06-25 09:37:54', 'd8053cbd5a487d58', 0),
(55, 55, '0', '2019-06-25 04:29:22', '2019-06-25 09:59:22', '252dbded3b2a1bcb', 0),
(56, 54, '18', '2019-06-25 06:07:11', '2019-06-25 11:37:11', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(57, 53, '18', '2019-06-25 06:09:17', '2019-06-25 11:39:17', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(58, 52, '18', '2019-06-25 06:09:41', '2019-06-25 11:39:41', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(59, 55, '18', '2019-06-25 06:09:57', '2019-06-25 11:39:57', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(60, 52, '0', '2019-06-25 22:56:15', '2019-06-26 04:26:15', 'BE622906-102E-4EC2-9145-C615443E1BFA', 0),
(61, 55, '0', '2019-06-25 23:20:14', '2019-06-26 04:50:14', 'BE622906-102E-4EC2-9145-C615443E1BFA', 0),
(62, 52, '0', '2019-06-26 01:23:31', '2019-06-26 06:53:31', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(63, 53, '17', '2019-06-26 01:25:28', '2019-06-26 06:55:28', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(64, 52, '17', '2019-06-26 01:28:07', '2019-06-26 06:58:07', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(65, 55, '17', '2019-06-26 01:31:52', '2019-06-26 07:01:52', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(66, 52, '18', '2019-06-26 01:47:14', '2019-06-26 07:17:14', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(67, 53, '18', '2019-06-26 01:48:44', '2019-06-26 07:18:44', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(68, 56, '18', '2019-06-26 01:57:44', '2019-06-26 07:27:44', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(69, 56, '0', '2019-06-26 01:57:57', '2019-06-26 07:27:57', 'd8053cbd5a487d58', 0),
(70, 57, '0', '2019-06-26 01:59:58', '2019-06-26 07:29:58', 'd8053cbd5a487d58', 0),
(71, 57, '18', '2019-06-26 02:00:10', '2019-06-26 07:30:10', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(73, 58, '0', '2019-06-26 03:08:52', '2019-06-26 08:38:52', 'd8053cbd5a487d58', 0),
(74, 54, '17', '2019-06-26 03:29:38', '2019-06-26 08:59:38', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(75, 59, '0', '2019-06-26 03:50:02', '2019-06-26 09:20:02', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(76, 59, '0', '2019-06-26 03:50:10', '2019-06-26 09:20:10', 'd8053cbd5a487d58', 0),
(78, 59, '17', '2019-06-26 04:21:22', '2019-06-26 09:51:22', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(79, 59, '0', '2019-06-26 04:28:13', '2019-06-26 09:58:13', 'd2e265178a8a2038', 0),
(80, 59, '0', '2019-06-26 04:28:54', '2019-06-26 09:58:54', '60DDB786-9DAA-46E9-8E6B-E1D6AE633722', 0),
(81, 59, '0', '2019-06-26 04:40:44', '2019-06-26 10:10:44', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(82, 59, '0', '2019-06-26 04:45:40', '2019-06-26 10:15:40', '252dbded3b2a1bcb', 0),
(83, 59, '25', '2019-06-26 05:01:14', '2019-06-26 10:31:14', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(84, 59, '0', '2019-06-26 06:38:45', '2019-06-26 12:08:45', 'd2e265178a8a2038a', 0),
(85, 59, '0', '2019-06-26 06:39:47', '2019-06-26 12:09:47', 'd2e265178a8a2038b', 0),
(86, 59, '0', '2019-06-26 06:40:05', '2019-06-26 12:10:05', 'd2e265178a8a2038d', 0),
(87, 59, '0', '2019-06-26 06:47:01', '2019-06-26 12:17:01', 'd2e265178a8a20383', 0),
(88, 59, '0', '2019-06-26 06:53:43', '2019-06-26 12:23:43', 'd2e265178a8a2038e', 0),
(89, 59, '0', '2019-06-26 06:56:03', '2019-06-26 12:26:03', 'd2e265178a8a2038f', 0),
(90, 59, '17', '2019-06-26 07:09:01', '2019-06-26 12:39:01', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(91, 60, '0', '2019-06-26 07:11:16', '2019-06-26 12:41:16', 'd2e265178a8a2038', 0),
(92, 60, '17', '2019-06-26 07:12:42', '2019-06-26 12:42:42', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(93, 61, '17', '2019-06-26 07:24:25', '2019-06-26 12:54:25', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(94, 61, '0', '2019-06-26 07:27:31', '2019-06-26 12:57:31', 'd8053cbd5a487d58', 0),
(95, 62, '17', '2019-06-26 07:34:41', '2019-06-26 13:04:41', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(96, 62, '0', '2019-06-26 07:35:18', '2019-06-26 13:05:18', 'd8053cbd5a487d58', 0),
(97, 61, '0', '2019-06-26 07:36:04', '2019-06-26 13:06:04', 'd2e265178a8a2038', 0),
(98, 63, '0', '2019-06-26 07:38:06', '2019-06-26 13:08:06', '60DDB786-9DAA-46E9-8E6B-E1D6AE633722', 0),
(99, 63, '0', '2019-06-26 07:38:07', '2019-06-26 13:08:07', 'd8053cbd5a487d58', 0),
(100, 64, '0', '2019-06-26 07:38:55', '2019-06-26 13:08:55', 'd8053cbd5a487d58', 0),
(101, 64, '17', '2019-06-26 07:39:06', '2019-06-26 13:09:06', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(102, 64, '25', '2019-06-26 07:39:50', '2019-06-26 13:09:50', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(103, 64, '0', '2019-06-26 07:40:22', '2019-06-26 13:10:22', 'd2e265178a8a2038', 0),
(104, 65, '0', '2019-06-26 07:41:07', '2019-06-26 13:11:07', 'd8053cbd5a487d58', 0),
(105, 65, '25', '2019-06-26 07:41:16', '2019-06-26 13:11:16', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(106, 64, '26', '2019-06-26 07:48:24', '2019-06-26 13:18:24', '60DDB786-9DAA-46E9-8E6B-E1D6AE633722', 0),
(107, 65, '26', '2019-06-26 07:48:34', '2019-06-26 13:18:34', '60DDB786-9DAA-46E9-8E6B-E1D6AE633722', 0),
(108, 65, '0', '2019-06-26 07:56:54', '2019-06-26 13:26:54', 'd2e265178a8a2038', 0),
(109, 66, '0', '2019-06-26 08:08:07', '2019-06-26 13:38:07', '4D39C462-6121-4CBE-ADB0-77EE603AFA20', 0),
(110, 66, '0', '2019-06-26 08:10:38', '2019-06-26 13:40:38', 'd8053cbd5a487d58', 0),
(111, 67, '0', '2019-06-26 08:13:36', '2019-06-26 13:43:36', 'd8053cbd5a487d58', 0),
(112, 66, '0', '2019-06-26 08:27:48', '2019-06-26 13:57:48', 'd2e265178a8a2038', 0),
(113, 66, '0', '2019-06-26 08:55:07', '2019-06-26 14:25:07', '7AE8E76C-CA8C-405B-A42E-FC894B2CB4C1', 0),
(114, 67, '0', '2019-06-26 08:55:11', '2019-06-26 14:25:11', '7AE8E76C-CA8C-405B-A42E-FC894B2CB4C1', 0),
(115, 67, '17', '2019-06-26 08:55:36', '2019-06-26 14:25:36', '7AE8E76C-CA8C-405B-A42E-FC894B2CB4C1', 0),
(116, 66, '17', '2019-06-26 08:55:51', '2019-06-26 14:25:51', '7AE8E76C-CA8C-405B-A42E-FC894B2CB4C1', 0),
(117, 66, '25', '2019-06-26 08:56:34', '2019-06-26 14:26:34', '7AE8E76C-CA8C-405B-A42E-FC894B2CB4C1', 0),
(118, 66, '0', '2019-06-26 09:04:15', '2019-06-26 14:34:15', '6650926C-E4D8-4125-90B8-9FF693752755', 0),
(119, 67, '0', '2019-06-26 09:05:36', '2019-06-26 14:35:36', '6650926C-E4D8-4125-90B8-9FF693752755', 0),
(120, 66, '27', '2019-06-26 09:08:02', '2019-06-26 14:38:02', '6650926C-E4D8-4125-90B8-9FF693752755', 0),
(121, 67, '27', '2019-06-26 10:40:19', '2019-06-26 16:10:19', '6650926C-E4D8-4125-90B8-9FF693752755', 0),
(122, 1, '0', '2019-07-01 05:46:56', '2019-07-01 11:16:56', '11111123', 0),
(123, 66, '0', '2019-07-01 05:48:20', '2019-07-01 11:18:20', '6D30D009-3FD1-47BF-B488-D60852C46AF7', 0),
(124, 68, '0', '2019-07-01 05:53:20', '2019-07-01 11:23:20', '6D30D009-3FD1-47BF-B488-D60852C46AF7', 0),
(125, 67, '0', '2019-07-01 05:57:07', '2019-07-01 11:27:07', '6D30D009-3FD1-47BF-B488-D60852C46AF7', 0),
(126, 69, '0', '2019-07-01 05:57:49', '2019-07-01 11:27:49', '6D30D009-3FD1-47BF-B488-D60852C46AF7', 0),
(127, 73, '0', '2019-07-01 06:10:40', '2019-07-01 11:40:40', '6D30D009-3FD1-47BF-B488-D60852C46AF7', 0),
(128, 72, '0', '2019-07-01 06:25:14', '2019-07-01 11:55:14', '92059715-3DCC-4B5F-B4FA-39C8E4A29756', 0),
(129, 72, '0', '2019-07-01 06:26:36', '2019-07-01 11:56:36', '6D30D009-3FD1-47BF-B488-D60852C46AF7', 0),
(130, 75, '0', '2019-07-01 07:22:21', '2019-07-01 12:52:21', '6D30D009-3FD1-47BF-B488-D60852C46AF7', 0),
(131, 76, '0', '2019-07-01 07:26:45', '2019-07-01 12:56:45', '2970C055-752F-42E6-93BD-577B6512DEEC', 0),
(132, 75, '0', '2019-07-01 07:59:56', '2019-07-01 13:29:56', '2970C055-752F-42E6-93BD-577B6512DEEC', 0),
(133, 68, '0', '2019-07-01 08:00:05', '2019-07-01 13:30:05', '2970C055-752F-42E6-93BD-577B6512DEEC', 0),
(134, 75, '0', '2019-07-01 08:07:35', '2019-07-01 13:37:35', 'B196E493-A7C1-4942-BF05-E81D1487A3EA', 0),
(135, 75, '26', '2019-07-01 08:22:08', '2019-07-01 13:52:08', 'E5C09F90-FD9D-47B6-B351-FF21AC397611', 0),
(136, 67, '26', '2019-07-01 08:26:40', '2019-07-01 13:56:40', 'E5C09F90-FD9D-47B6-B351-FF21AC397611', 0),
(137, 77, '26', '2019-07-01 08:42:06', '2019-07-01 14:12:06', 'E083F0A7-825D-4E30-84B4-7A0C542CC498', 0),
(138, 77, '0', '2019-07-01 23:07:55', '2019-07-02 04:37:55', 'E5C09F90-FD9D-47B6-B351-FF21AC397611', 0),
(139, 81, '0', '2019-07-02 00:59:55', '2019-07-02 06:29:55', 'E5C09F90-FD9D-47B6-B351-FF21AC397611', 0),
(140, 82, '0', '2019-07-02 01:01:53', '2019-07-02 06:31:53', 'E5C09F90-FD9D-47B6-B351-FF21AC397611', 0),
(141, 84, '0', '2019-07-02 01:30:02', '2019-07-02 07:00:02', 'E5C09F90-FD9D-47B6-B351-FF21AC397611', 0),
(142, 99, '0', '2019-07-02 02:06:40', '2019-07-02 07:36:40', 'E5C09F90-FD9D-47B6-B351-FF21AC397611', 0),
(143, 67, '0', '2019-07-02 02:50:17', '2019-07-02 08:20:17', '99B4C2D5-8830-4FC2-A9CB-211E368EA496', 0),
(144, 108, '26', '2019-07-02 03:23:39', '2019-07-02 08:53:39', '99B4C2D5-8830-4FC2-A9CB-211E368EA496', 0),
(145, 108, '0', '2019-07-02 03:29:42', '2019-07-02 08:59:42', 'E5C09F90-FD9D-47B6-B351-FF21AC397611', 0),
(146, 108, '28', '2019-07-02 03:57:13', '2019-07-02 09:27:13', '7B50708C-220B-46EF-AEF6-DD7AE0614BDC', 0),
(147, 108, '0', '2019-07-02 06:30:00', '2019-07-02 12:00:00', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(148, 84, '0', '2019-07-02 06:30:33', '2019-07-02 12:00:33', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(149, 83, '0', '2019-07-02 06:38:30', '2019-07-02 12:08:30', '7B50708C-220B-46EF-AEF6-DD7AE0614BDC', 0),
(150, 110, '0', '2019-07-02 06:39:10', '2019-07-02 12:09:10', '7B50708C-220B-46EF-AEF6-DD7AE0614BDC', 0),
(151, 66, '0', '2019-07-02 06:39:17', '2019-07-02 12:09:17', '7B50708C-220B-46EF-AEF6-DD7AE0614BDC', 0),
(152, 111, '18', '2019-07-02 07:06:59', '2019-07-02 12:36:59', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(153, 112, '18', '2019-07-02 07:07:03', '2019-07-02 12:37:03', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(154, 110, '18', '2019-07-02 07:07:30', '2019-07-02 12:37:30', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(155, 110, '0', '2019-07-02 07:20:57', '2019-07-02 12:50:57', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(156, 109, '0', '2019-07-02 07:23:12', '2019-07-02 12:53:12', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(157, 118, '0', '2019-07-02 07:28:23', '2019-07-02 12:58:23', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(158, 112, '0', '2019-07-02 07:28:40', '2019-07-02 12:58:40', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(159, 117, '0', '2019-07-02 07:29:00', '2019-07-02 12:59:00', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(160, 112, '31', '2019-07-02 07:30:00', '2019-07-02 13:00:00', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(161, 117, '31', '2019-07-02 07:30:47', '2019-07-02 13:00:47', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(162, 111, '31', '2019-07-02 07:31:01', '2019-07-02 13:01:01', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(163, 110, '31', '2019-07-02 07:31:06', '2019-07-02 13:01:06', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(164, 117, '0', '2019-07-02 07:31:23', '2019-07-02 13:01:23', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(165, 111, '0', '2019-07-02 07:33:38', '2019-07-02 13:03:38', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(166, 118, '31', '2019-07-02 07:40:35', '2019-07-02 13:10:35', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(167, 83, '31', '2019-07-02 07:41:58', '2019-07-02 13:11:58', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(168, 119, '0', '2019-07-02 07:43:23', '2019-07-02 13:13:23', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(169, 67, '0', '2019-07-02 07:44:57', '2019-07-02 13:14:57', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(170, 66, '0', '2019-07-02 07:50:11', '2019-07-02 13:20:11', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(171, 119, '0', '2019-07-02 07:57:33', '2019-07-02 13:27:33', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(172, 83, '0', '2019-07-02 08:13:15', '2019-07-02 13:43:15', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(173, 67, '0', '2019-07-02 08:13:32', '2019-07-02 13:43:32', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(174, 111, '0', '2019-07-02 08:20:05', '2019-07-02 13:50:05', '7B50708C-220B-46EF-AEF6-DD7AE0614BDC', 0),
(175, 109, '0', '2019-07-02 08:22:22', '2019-07-02 13:52:22', '7B50708C-220B-46EF-AEF6-DD7AE0614BDC', 0),
(176, 84, '0', '2019-07-02 08:23:28', '2019-07-02 13:53:28', '7B50708C-220B-46EF-AEF6-DD7AE0614BDC', 0),
(177, 67, '0', '2019-07-02 08:23:59', '2019-07-02 13:53:59', '7B50708C-220B-46EF-AEF6-DD7AE0614BDC', 0),
(178, 66, '0', '2019-07-03 01:28:27', '2019-07-03 06:58:27', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(179, 117, '0', '2019-07-03 01:46:24', '2019-07-03 07:16:24', '7B50708C-220B-46EF-AEF6-DD7AE0614BDC', 0),
(180, 120, '0', '2019-07-03 01:48:05', '2019-07-03 07:18:05', '7B50708C-220B-46EF-AEF6-DD7AE0614BDC', 0),
(181, 120, '0', '2019-07-03 01:54:12', '2019-07-03 07:24:12', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(182, 121, '0', '2019-07-03 01:58:01', '2019-07-03 07:28:01', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(183, 122, '0', '2019-07-03 02:04:30', '2019-07-03 07:34:30', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(184, 124, '0', '2019-07-03 02:08:09', '2019-07-03 07:38:09', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(185, 125, '0', '2019-07-03 02:29:30', '2019-07-03 07:59:30', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(186, 125, '26', '2019-07-03 02:32:33', '2019-07-03 08:02:33', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(187, 126, '0', '2019-07-03 03:09:57', '2019-07-03 08:39:57', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(188, 126, '31', '2019-07-03 03:41:24', '2019-07-03 09:11:24', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(189, 67, '31', '2019-07-03 03:56:25', '2019-07-03 09:26:25', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(190, 127, '31', '2019-07-03 04:05:39', '2019-07-03 09:35:39', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(191, 128, '31', '2019-07-03 04:07:58', '2019-07-03 09:37:58', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(192, 129, '0', '2019-07-03 04:08:59', '2019-07-03 09:38:59', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(193, 129, '0', '2019-07-03 04:09:26', '2019-07-03 09:39:26', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(194, 129, '31', '2019-07-03 04:09:35', '2019-07-03 09:39:35', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(195, 129, '30', '2019-07-03 04:09:57', '2019-07-03 09:39:57', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(196, 84, '30', '2019-07-03 04:10:09', '2019-07-03 09:40:09', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(197, 109, '30', '2019-07-03 04:10:11', '2019-07-03 09:40:11', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(198, 111, '30', '2019-07-03 04:10:21', '2019-07-03 09:40:21', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(199, 83, '32', '2019-07-03 04:24:44', '2019-07-03 09:54:44', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(200, 109, '32', '2019-07-03 04:24:48', '2019-07-03 09:54:48', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(201, 126, '32', '2019-07-03 04:25:01', '2019-07-03 09:55:01', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(202, 128, '30', '2019-07-03 04:31:20', '2019-07-03 10:01:20', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(203, 126, '30', '2019-07-03 04:31:24', '2019-07-03 10:01:24', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(204, 110, '32', '2019-07-03 04:32:44', '2019-07-03 10:02:44', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(205, 109, '17', '2019-07-03 04:33:38', '2019-07-03 10:03:38', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(206, 84, '17', '2019-07-03 04:33:41', '2019-07-03 10:03:41', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(207, 84, '31', '2019-07-03 04:37:02', '2019-07-03 10:07:02', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(208, 83, '17', '2019-07-03 04:39:12', '2019-07-03 10:09:12', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(209, 128, '17', '2019-07-03 04:43:48', '2019-07-03 10:13:48', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(210, 129, '17', '2019-07-03 04:43:52', '2019-07-03 10:13:52', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(211, 83, '30', '2019-07-03 04:52:19', '2019-07-03 10:22:19', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(212, 126, '26', '2019-07-03 04:55:14', '2019-07-03 10:25:14', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(213, 111, '26', '2019-07-03 05:24:21', '2019-07-03 10:54:21', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(214, 110, '26', '2019-07-03 05:54:37', '2019-07-03 11:24:37', '4C256647-03D7-48AF-870A-95C04A200BAB', 0),
(215, 109, '31', '2019-07-03 06:35:39', '2019-07-03 12:05:39', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(216, 117, '17', '2019-07-03 06:57:12', '2019-07-03 12:27:12', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0),
(217, 126, '17', '2019-07-03 07:01:33', '2019-07-03 12:31:33', '5B58DCB8-38ED-4C68-84A3-792ECE5D4FEC', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `comment_like_unlikes`
--
ALTER TABLE `comment_like_unlikes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `flag_comments`
--
ALTER TABLE `flag_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recommend_videos`
--
ALTER TABLE `recommend_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_comments`
--
ALTER TABLE `user_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_feedbacks`
--
ALTER TABLE `user_feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `videofavourites`
--
ALTER TABLE `videofavourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_favourites`
--
ALTER TABLE `video_favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_viewers`
--
ALTER TABLE `video_viewers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `comment_like_unlikes`
--
ALTER TABLE `comment_like_unlikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `flag_comments`
--
ALTER TABLE `flag_comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `recommend_videos`
--
ALTER TABLE `recommend_videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `user_comments`
--
ALTER TABLE `user_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `user_feedbacks`
--
ALTER TABLE `user_feedbacks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `videofavourites`
--
ALTER TABLE `videofavourites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `video_favourites`
--
ALTER TABLE `video_favourites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `video_viewers`
--
ALTER TABLE `video_viewers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
