-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 30 Agu 2024 pada 16.26
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-server`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `password`, `date_of_birth`, `phone_number`, `profile_picture`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', 'admin123', '1990-01-01', '1234567890', 'path/to/picture.jpg', '2024-08-29 20:36:39', '2024-08-29 20:36:39'),
(2, 'Admin1', 'admin1', 'admin1@gmail.com', '$2y$12$W0b9wtvHG9CFwsSA.ohBsOHz8HmDHvM4NYHksiIW6Lhu5d32SFgGS', '1990-01-01', '1234567890', 'path/to/picture.jpg', '2024-08-30 00:53:39', '2024-08-30 00:53:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `description`, `status`, `created_at`, `updated_at`) VALUES
(18, 'New Banner', 'banner_images/o6lTNx0H5J2yh54e46jiAKNhzgu6DL3Yc28ftTJH.png', 'Banner description', 'active', '2024-08-30 00:56:25', '2024-08-30 00:56:25'),
(19, 'New Banner', 'banner_images/RaVlNDws9VhvxLebnQLhEQYVkkWzJHbAanSilona.png', 'Banner description', 'active', '2024-08-30 03:40:54', '2024-08-30 03:40:54'),
(20, 'dsadasdsad', 'banner_images/041vOfu3VBloo7b2vcI8R9f0OaY8FCVbMtnt73mo.jpg', 'dasddsad', 'active', '2024-08-30 06:59:07', '2024-08-30 06:59:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `image`, `description`, `author`, `tags`, `created_at`, `updated_at`) VALUES
(18, 'New Blog', 'blog_images/tbVTNal0EhVIscGR5KxabvlozBu24zB3oqQ8vzOI.png', 'Blog description', 'John Doe', 'SEO,Marketing', '2024-08-30 01:03:22', '2024-08-30 01:03:22'),
(19, 'New Blog', 'blog_images/BsuSFvvcjpIIpderFHqWELk1P3yNr2cgER6phxhh.png', 'Blog description', 'John Doe', 'SEO,Marketing', '2024-08-30 04:01:22', '2024-08-30 04:01:22'),
(20, 'New Blog', 'blog_images/ccWax5oR6tjITT7TVmC1J9ak7sFGzgiki3eEZpXl.png', 'Blog description', 'John Doe', 'SEO,Marketing', '2024-08-30 04:01:31', '2024-08-30 04:01:31'),
(21, 'New Blog', 'blog_images/CL4rE2yW7GxlSdmSeTUB5SI3rcbGYvvwBXeAGnol.png', 'Blog descriptionss', 'John Doe', 'SEO,Marketing', '2024-08-30 04:01:36', '2024-08-30 04:01:36'),
(22, 'asdasddasd', 'blog_images/p2Wn1cr4SMpa4radjpdPJCSCeX535vUx5HzNMxNP.jpg', 'saddsa', 'dasdsadad', 'sdadsad', '2024-08-30 07:09:50', '2024-08-30 07:09:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `comment` text NOT NULL,
  `captcha` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `captchas`
--

CREATE TABLE `captchas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `captcha_code` varchar(255) NOT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `leaderboards`
--

CREATE TABLE `leaderboards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(12, '0001_01_01_000000_create_users_table', 2),
(13, '2024_08_30_024043_create_personal_access_tokens_table', 2),
(14, '2024_08_30_025722_blog_comments', 2),
(15, '2024_08_30_025841_captchas', 2),
(16, '2024_08_30_025859_banners', 2),
(17, '2024_08_30_025915_blogs', 2),
(18, '2024_08_30_025937_portfolios', 2),
(19, '2024_08_30_025959_leaderboards', 2),
(20, '2024_08_30_030339_admins', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'token', '36e3ebc7f66b3b2d8e8cb7fb00a2eb433ed1b2051f4c7015f229f61d39d7e38f', '[\"role:user\"]', NULL, NULL, '2024-08-30 00:43:25', '2024-08-30 00:43:25'),
(3, 'App\\Models\\Admin', 2, 'token', 'eadf5f221c40ae5c62e8114bb78e2dffa571e625a258a5208bd4a7c2fe476494', '[\"role:admin\"]', '2024-08-30 07:20:45', NULL, '2024-08-30 00:54:02', '2024-08-30 07:20:45'),
(4, 'App\\Models\\User', 5, 'token', '7c6a5904e1c4afd27a083f7aaa3b12bad705a6d18949174c15f6d796a70e9a45', '[\"role:user\"]', NULL, NULL, '2024-08-30 01:07:08', '2024-08-30 01:07:08'),
(5, 'App\\Models\\User', 3, 'token', 'a220481515944d3ab030e1c46ab3f7a3a00ec9fac7156121b658e5e3593fc1ae', '[\"role:user\"]', '2024-08-30 04:44:13', NULL, '2024-08-30 01:08:51', '2024-08-30 04:44:13'),
(6, 'App\\Models\\User', 6, 'token', '69868e6ce03a0b7e6a04c9c7c28a6347529ee41113a7a22c95f0eb0fb61c04a2', '[\"role:user\"]', NULL, NULL, '2024-08-30 05:46:22', '2024-08-30 05:46:22'),
(7, 'App\\Models\\User', 7, 'token', '511b5404cca41c434c3a0639e1534579db9806e561ee07a21afc093cf7b4b9cc', '[\"role:user\"]', NULL, NULL, '2024-08-30 05:50:42', '2024-08-30 05:50:42'),
(8, 'App\\Models\\User', 7, 'token', '233dc312f00caac8a4fa265f0f0807bce31d1bbb59b6e5c96052bb9637f98d77', '[\"role:user\"]', NULL, NULL, '2024-08-30 05:50:47', '2024-08-30 05:50:47'),
(9, 'App\\Models\\User', 7, 'token', '0f609f9f26c09493f7b5f627a1ff68881b63c63fb3111a0f80da3efbab52deed', '[\"role:user\"]', NULL, NULL, '2024-08-30 05:50:51', '2024-08-30 05:50:51'),
(10, 'App\\Models\\User', 7, 'token', '7bcc1d9318a6dd6e4f82bb694226cfad83dfa8ba2775d60839642a9190eb30eb', '[\"role:user\"]', NULL, NULL, '2024-08-30 05:52:09', '2024-08-30 05:52:09'),
(11, 'App\\Models\\Admin', 2, 'token', 'ccb899a5a8f780bc4248879a89ac3dbae8ce13b3e9fcbb317db1adf1bb28d088', '[\"role:admin\"]', '2024-08-30 07:22:55', NULL, '2024-08-30 05:59:14', '2024-08-30 07:22:55'),
(12, 'App\\Models\\User', 8, 'token', '2067bee0921865614bac02f58e7cf96802e4186a60b6c56febaa938b3726277b', '[\"role:user\"]', NULL, NULL, '2024-08-30 07:21:55', '2024-08-30 07:21:55'),
(13, 'App\\Models\\Admin', 2, 'token', 'a97e79856acb53994caf2ddffc05f56167fe54b6b0c275a11dea62a06a98fb08', '[\"role:admin\"]', NULL, NULL, '2024-08-30 07:23:14', '2024-08-30 07:23:14'),
(14, 'App\\Models\\User', 7, 'token', 'f2c58b4642fdcda2ba8998a39d1b759b1e762304e5fc344826e221c640c66a68', '[\"role:user\"]', NULL, NULL, '2024-08-30 07:23:32', '2024-08-30 07:23:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `portfolios`
--

INSERT INTO `portfolios` (`id`, `title`, `image`, `description`, `author`, `created_at`, `updated_at`) VALUES
(9, 'New Portfolio', 'portfolio_images/od9RKbvzeFGTcFgYn7PyS192q6xJJLRZrEgQA1kM.png', 'Portfolio description', 'Jane Doe', '2024-08-30 01:05:23', '2024-08-30 01:05:23'),
(10, 'New Portfolio', 'portfolio_images/3S0iMj7hcXy3xelq7bSG8GjcWN4U2xUG1hDcpZkw.png', 'Portfolio description', 'Jane Doe', '2024-08-30 04:27:16', '2024-08-30 04:27:16'),
(11, 'asdadasd', 'portfolio_images/Tqvmuxp5BZ9stHvHIy4hH97pb63eM8KGC2Z3f0Bp.jpg', 'sadasdsad', 'asdasd', '2024-08-30 07:13:34', '2024-08-30 07:13:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ZfyOr6pcZ3mhuT8mAtpWCxbDQOFLx7teDilleOe0', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielRsb1F1aFVTekxwaDB1MEhXclZiakp3Vm0zRW9sc2RvTmFqWEN3RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1725003375);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `date_of_birth`, `phone_number`, `profile_picture`, `created_at`, `updated_at`) VALUES
(7, 'John Doe', 'johndoe', 'johndoe@example.com', '$2y$12$4wOi6Jqw/hHMyegUio6/.ucdwiDU.i3VoM33eBEkIrT0rGGYDGOaS', '1990-01-01', '1234567890', NULL, '2024-08-30 05:50:42', '2024-08-30 05:50:42'),
(8, 'sdaadasdasd', 'sdadasd', 'user2@webtech.id', '$2y$12$DYe2I4iGQpMH6Mv9ifIYxOP.f6MJhwwihDEnRn5kj4L7W8Xahjz22', '2024-08-30', '21321331', 'profile_pictures/YHzM7GzwVaNpTJSPDYql5BhQVWFCTU2sXyS46bin.jpg', '2024-08-30 07:21:55', '2024-08-30 07:21:55');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indeks untuk tabel `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comments_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `captchas`
--
ALTER TABLE `captchas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `leaderboards`
--
ALTER TABLE `leaderboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaderboards_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `captchas`
--
ALTER TABLE `captchas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `leaderboards`
--
ALTER TABLE `leaderboards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `leaderboards`
--
ALTER TABLE `leaderboards`
  ADD CONSTRAINT `leaderboards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
