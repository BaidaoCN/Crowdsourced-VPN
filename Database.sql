-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 产生时间： 2026-04-27 10:24:23
-- 服务器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- 数据表结构 `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- 倾印数据表的资料 `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"vpn_platform\",\"table\":\"routers\"},{\"db\":\"vpn_platform\",\"table\":\"pending_routers\"},{\"db\":\"vpn_platform\",\"table\":\"messages\"},{\"db\":\"vpn_platform\",\"table\":\"access_logs\"}]');

-- --------------------------------------------------------

--
-- 数据表结构 `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- 倾印数据表的资料 `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-04-27 08:23:20', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"zh_TW\"}');

-- --------------------------------------------------------

--
-- 数据表结构 `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- 数据表结构 `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- 已倾印数据表的索引
--

--
-- 数据表索引 `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- 数据表索引 `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- 数据表索引 `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- 数据表索引 `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- 数据表索引 `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- 数据表索引 `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- 数据表索引 `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- 数据表索引 `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- 数据表索引 `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- 数据表索引 `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- 数据表索引 `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- 数据表索引 `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- 数据表索引 `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- 数据表索引 `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- 数据表索引 `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- 数据表索引 `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- 数据表索引 `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- 数据表索引 `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- 数据表索引 `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- 在倾印的数据表使用自动递增(AUTO_INCREMENT)
--

--
-- 使用数据表自动递增(AUTO_INCREMENT) `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用数据表自动递增(AUTO_INCREMENT) `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用数据表自动递增(AUTO_INCREMENT) `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用数据表自动递增(AUTO_INCREMENT) `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用数据表自动递增(AUTO_INCREMENT) `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用数据表自动递增(AUTO_INCREMENT) `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 数据库： `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- 数据库： `vpn_platform`
--
CREATE DATABASE IF NOT EXISTS `vpn_platform` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vpn_platform`;

-- --------------------------------------------------------

--
-- 数据表结构 `access_logs`
--

CREATE TABLE `access_logs` (
  `id` int(11) NOT NULL,
  `router_id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `assigned_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 倾印数据表的资料 `access_logs`
--

INSERT INTO `access_logs` (`id`, `router_id`, `username`, `assigned_at`) VALUES
(1, 1, 'vpn_b980a39ddf4c', '2026-04-09 05:19:01'),
(2, 1, 'vpn_3c1b631cad30', '2026-04-09 05:20:18'),
(3, 1, 'vpn_801fcf3d249d', '2026-04-09 05:20:20'),
(4, 1, 'vpn_891b025b304a', '2026-04-09 05:20:21'),
(5, 1, 'vpn_573ac250794a', '2026-04-09 05:22:24'),
(6, 1, 'vpn_4025e3ff496a', '2026-04-09 05:24:52'),
(7, 1, 'vpn_1f59faa4214a', '2026-04-09 05:58:20'),
(8, 1, 'vpn_bc5cf9330e00', '2026-04-09 06:20:09'),
(9, 1, 'vpn_4b3443c12768', '2026-04-09 13:57:13'),
(10, 1, 'vpn_6c37c122dc50', '2026-04-09 13:57:28'),
(11, 1, 'vpn_ce4af7b1ba3f', '2026-04-09 19:17:16'),
(12, 1, 'vpn_173e17c4090d', '2026-04-09 23:23:24'),
(13, 1, 'vpn_880be86e98bc', '2026-04-09 23:37:52'),
(14, 1, 'vpn_11e6540bb61e', '2026-04-09 23:38:04'),
(15, 1, 'vpn_c809f7f695bd', '2026-04-10 01:41:29'),
(16, 1, 'vpn_92ebfffb102a', '2026-04-10 01:42:04'),
(17, 1, 'vpn_ae359b1d659b', '2026-04-10 02:12:49'),
(18, 1, 'vpn_6d396dea36f3', '2026-04-10 02:58:52');

-- --------------------------------------------------------

--
-- 数据表结构 `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 倾印数据表的资料 `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `message`, `created_at`, `is_read`) VALUES
(1, 'Zoe', 'example@outlook.com', 'Help. I cannot get it work.\nI wait for your email reply!!!!', '2026-04-09 11:00:47', 0),
(2, 'Betty', 'example2@outlook.com', 'I mistakenly added my item. Could you remove it for me?\nRouter Name: Betty (Hangzhou)', '2026-04-09 11:03:23', 0),
(3, 'Pinky', 'example3@outlook.com', 'I have difficulty setting up. Could you help me remote setting through SSH?', '2026-04-09 11:05:16', 0),
(4, 'Olivia', 'example@outlook.com', 'Demonstrating my contribution', '2026-04-09 18:17:32', 0),
(5, 'Olivia', 'example@outlook.com', 'I need help!!!!', '2026-04-09 19:03:44', 0);

-- --------------------------------------------------------

--
-- 数据表结构 `pending_routers`
--

CREATE TABLE `pending_routers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `ssh_port` int(11) DEFAULT 22,
  `openvpn_port` int(11) DEFAULT 1194,
  `ssh_password` varchar(255) NOT NULL,
  `client_config` text DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','denied') DEFAULT 'pending',
  `approved_at` datetime DEFAULT NULL,
  `denied_at` datetime DEFAULT NULL,
  `contributor_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 倾印数据表的资料 `pending_routers`
--

INSERT INTO `pending_routers` (`id`, `name`, `country`, `ip_address`, `ssh_port`, `openvpn_port`, `ssh_password`, `client_config`, `submitted_at`, `status`, `approved_at`, `denied_at`, `contributor_password`) VALUES
(2, 'Shanghai China Mobile', 'China', '101.202.10.2', 22, 1194, '1234%^&*ab', 'user nobody\ngroup nogroup\ndev tun\nnobind\nclient\nremote 192.168.1.1 1194 udp\nauth-user-pass\nauth-nocache\nremote-cert-tls server\n<tls-crypt-v2>\n-----BEGIN OpenVPN tls-crypt-v2 client key-----\nmN8Vce0R3MReyjQOFphxJTBIVIROunmODVVCVlYd4H0pLtSWUaaTDUs3tYc/0J5s\nvPntIqBLHO2hJsgmg7BdZe/qnXCbL/Hfe3frcxF1GhrosXoxjp8uw9KaT0kpUwoY\nzLoEDoddlxpcYlahfKtztIRkrn2h7hYZaNuhScLlCIMs8Kg5Hq+duaeSbhvt2w+m\nM9cgD2/PxW6TLg8NACNAFSjVdtNmJ1lk+w3DYa21aJc3NJajM/IdtrkAcR+p6gU+\nssOVC1vNeNjdLnGm0c5nKqNcmY9+uS0RU8+DKOGbBK7dnozMYqcvib8L8co2Om56\n5ASiLiOnNpttbSpbn9UK2JvgHoLQoG5ImjpmuPJc9t787+AaE56Q79FURuXbIvyb\n1bBBe1Q4VgR7KLl326df6LqY6/48TL7ELoS+5/744VVlrd4FNuF7ktPC7Wt8Nu23\n1iYSXynjPnrlRauXJ83qEuB0kzxSdrWQhdZx4Y8RU7XUgbqkaKGxEvzLCN/iXg/G\nZ5lSkMVd4yzsYGOGwWdl9cxyHRnEHGOTakNmEwBzFAaTFZazOSm02SJ7GnugE4PF\nKeZz8Uk4ujKz3SJRJFHVe6G3n9qwcEa1fx3i5dYYKvnmKpnExdTMWN6IOAOFuM6R\nkDJcAwrt1bMpGBwdAkALEiqCFFrRkOZCwSHSwOMzP6f27mkHqALo4PVaGO+gO+cD\nwnC+W4FXCgtDS1qZwv2wM0Ye+2vSAM1iaQEr\n-----END OpenVPN tls-crypt-v2 client key-----\n</tls-crypt-v2>\n<key>\n-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDnI4l3rsJXwcyg\nAcCpC+U94Z+84sx8YD7JDP2PiwmqCI7V8XXSkXiExrFQTKTMepE/ZzSxV4Cz2+Es\nExr3r8qAA3qGBHW31CdYd662TVWG+Swyeb5l2EVUB4fEfpN4hUOXZdTYj73VfVFJ\nwshnCVncAQrjuWEh5yZKwvvSJaVn+bpBK2C8ObspqsouUGH3IjRpdIugNbI3r6+b\nnECqFuZW5hKomUEv+U8eBnFtBN/FegtehdMgh1vFiOGxO0m84/o3WlUhhu78y8Wn\nyKH6cONiaaW9HZjWOigzzY/UGFg8+xRCe8LxdqU4u5Qul7vqn5qmKNsb3PxkUSnk\nijj85a6pAgMBAAECggEABDbuq8MBAi6jd4twouR3oqA5lG0iQ2ZR3sKg4PwtCe+s\nAxSrDFLgurMQyqELJDtb6KcOG+m3jBAHVBFpHXkUHS9zDXyJVPfGW+OayPIyDAsB\nFk6H/T1rTjPw8tFICRuM9vbBYc2FLZ5iXBD0LITMIanXM/3OWprnZNeXVeaf1Hx9\nWz1bXB77N5Yt14tMntK+WXolHcX+/sC2fscKSo/imYWZ5hK6qHcHSd3QzZa5x4uz\nXjte6eTqMCggKZpkRGPjY+y5Og4k3Jk4vXYm8m2Niq39IOeLvBhKJAg4j1MMj2gF\nunua4q0a47qyX1APiIZoo9VB3JhprJqRAFKS7AuVAQKBgQD85Jhp2GUDrHFiDqpS\nl64DgHcG6Wxl6kOk9dCkfnrw7NpNQI/dEG609DOQGRA6fDqAb5dxgoSGlpjJMeuE\ngp4NWAoxY8p+KgE/soglzVen/+0IKX6FJ1IaZOqc8o99Kk1GPvw3WtPmk5jCtmt2\nxZf32vqJAtG6SIYqSl0YRxDi4QKBgQDp+oUgIhj7fcg0IELWk6Wj5vTSftlqIjYA\n5wUCA0wEiX6BkQiXfvBpjnzVB8rK7occ1ew1NzgoSaYejcKfkhKO3gDX89sXwrTQ\nXL8BTOlAefAf2VCIg2nTCpP8nln3CfwuvE3EFXWi1Mhko/8Z9bLEYBcJFA7Xon1R\nrLDTByEMyQKBgENg0G7a9cbtyeO7Tovk17sdHhlcVcItkUpBKA67mBvarysH+YyH\nlUdnDNnmo5lBggC4OpxGjvKg6yInx70tY9jgTQ7trITCwkRrV7Tiqekb2dZj386w\nNELOAmhAhBRwEdiWbXJ+I5j6WCgAnE8vxBaIZFnew2wjaIOZ/oW6YXhhAoGBALAC\neKqXe9uT30r3CdCI+Q2262x9Z+fjHGTJZIcDG+g91iB5jdEI+KkvOtC2L+NAU/tp\nIWtWwrPr0z8gvMt1AujeMBxDoQjau1ISssyzorOSBwSuYVqQIMdVKcXbCSpBJKez\nl3xt+DQphSXQCFLq9TOsZSe7Iv8riMIr+kiFEGOhAoGAcVTHoaG6i/iXXx2Z2JcL\nPFKGQcskoz8c6gsOoM9ZEWrMMOT4Ncl5QzN7wh1wLTHde8ZOI07dGVDmCFWG5CKC\n5cVYRCS1wqoXUNC6+hrOupWfdjZSqKzvVXpVf5MN6W0wGbRaS1ar2XrkorILE4kI\nhY2QR3w1ZQaijJ2cBtEC50I=\n-----END PRIVATE KEY-----\n</key>\n<cert>\n-----BEGIN CERTIFICATE-----\nMIIDVDCCAjygAwIBAgIQNfGOo3TLWR7CIymZqG91gjANBgkqhkiG9w0BAQsFADAW\nMRQwEgYDVQQDDAtFYXN5LVJTQSBDQTAeFw0yNjA0MDgxNzU1MDhaFw0zNjA0MDUx\nNzU1MDhaMBExDzANBgNVBAMMBmNsaWVudDCCASIwDQYJKoZIhvcNAQEBBQADggEP\nADCCAQoCggEBAOcjiXeuwlfBzKABwKkL5T3hn7zizHxgPskM/Y+LCaoIjtXxddKR\neITGsVBMpMx6kT9nNLFXgLPb4SwTGvevyoADeoYEdbfUJ1h3rrZNVYb5LDJ5vmXY\nRVQHh8R+k3iFQ5dl1NiPvdV9UUnCyGcJWdwBCuO5YSHnJkrC+9IlpWf5ukErYLw5\nuymqyi5QYfciNGl0i6A1sjevr5ucQKoW5lbmEqiZQS/5Tx4GcW0E38V6C16F0yCH\nW8WI4bE7Sbzj+jdaVSGG7vzLxafIofpw42Jppb0dmNY6KDPNj9QYWDz7FEJ7wvF2\npTi7lC6Xu+qfmqYo2xvc/GRRKeSKOPzlrqkCAwEAAaOBojCBnzAJBgNVHRMEAjAA\nMB0GA1UdDgQWBBQ/o7QsXtLbIUscEMwi2YvpfD1wyjBRBgNVHSMESjBIgBQaT5bg\n3GwqT1XA80RUnO1pfcDeFKEapBgwFjEUMBIGA1UEAwwLRWFzeS1SU0EgQ0GCFARS\nUDhdErRd8p3pGZTlAWsFy02uMBMGA1UdJQQMMAoGCCsGAQUFBwMCMAsGA1UdDwQE\nAwIHgDANBgkqhkiG9w0BAQsFAAOCAQEAvzr7kO4+UUilil3xnOm++y8dIa66vlgi\nn8UG4mL3YQvO8SvcIHMUCHHJEVF4GuZcqF1iFB8vF8HCPRnyR9OMBzhRkzbwTDLT\n+gj/STUheylKPTUa935EIJI4vl78Zs1j+/5NNPGqZOkmRoqD18lvXm/1o3w4PSug\n6JpZg92ep1/Y45Q42RbFrcfWuIs7KjEUIY7q1Y/+OGR9jbyc4vcQ7feUOe2DfrQO\nqZ9/s5PXc4iekEzGnva+CpQlf2znju0K70idZnW495g/XLjayoryA4LkrJqmGgoH\ng7QqkbcL59j8jPGKqHlq7twHgUHFtw1QfGyQx9y7Yvs8HDqzbybNbQ==\n-----END CERTIFICATE-----\n</cert>\n<ca>\n-----BEGIN CERTIFICATE-----\nMIIDSzCCAjOgAwIBAgIUBFJQOF0StF3ynekZlOUBawXLTa4wDQYJKoZIhvcNAQEL\nBQAwFjEUMBIGA1UEAwwLRWFzeS1SU0EgQ0EwHhcNMjYwNDA4MTc1NDExWhcNMzYw\nNDA1MTc1NDExWjAWMRQwEgYDVQQDDAtFYXN5LVJTQSBDQTCCASIwDQYJKoZIhvcN\nAQEBBQADggEPADCCAQoCggEBANyQHqOMvzPdH6HeSO/6ajgMK6PFBTaBbpUpnZIS\nixVDzt04KFpO3dxw1FEyYy39a9KhspfRR6iPhRBQTaVzq/sjE7Z3pHZj2+5snoXH\nqoz3pJwl814Ui1ej17/AXELEjg+FSwsa0m+1uQsDBBYxji7TtKDEHfJZD+fKbCyW\nqeTkLcZmhxk7Fluf02Ks/+mZiGa/Tx5YM5HLsuT0Kb3D3KyD2RQKb+6l8ilGE5Gh\nhJANpNKOPPe3pzdO1tMRLcJITwMdb1aeaYk7I40D0FNmK+2e65L4tvR2cZjebmzF\nUVP38hrJtgL/CfD6yi2kWI5J9zE68D9A9dUwoHuNo6YQkuUCAwEAAaOBkDCBjTAM\nBgNVHRMEBTADAQH/MB0GA1UdDgQWBBQaT5bg3GwqT1XA80RUnO1pfcDeFDBRBgNV\nHSMESjBIgBQaT5bg3GwqT1XA80RUnO1pfcDeFKEapBgwFjEUMBIGA1UEAwwLRWFz\neS1SU0EgQ0GCFARSUDhdErRd8p3pGZTlAWsFy02uMAsGA1UdDwQEAwIBBjANBgkq\nhkiG9w0BAQsFAAOCAQEAco8oYfoBgEBAwbq5kB7JfaVjpqCoUcmP+ysKBWwhMrhj\nvsb3WCL7zBeSYJb8+unp1y0De+J0u1yHrkR59bxGTVKHVGcM7t2NovtGTYyW7pph\nk8ElS9eZuic8xr7gEW04tDp74+/PN+gl5B4CZ6JPJqFIyF7eSnhsFZ/MNcTqDpTY\n7A8vqHTfjwGo5vqFwNxMa18Mee0U227mWXXI8jYwAo5qaxynCnFRalUxS1wCctFb\nLLxdbJnxIJvTuQFxcHtzhAjagBzeJH2WFO3uVt9oia95r3rzDOO4oZFPgWy3I7fS\nTUKZ9s2VBDJSLaux5kmF3yffraqQ7ZM4o/Gw2oUsBA==\n-----END CERTIFICATE-----\n</ca>\n', '2026-04-09 06:40:25', 'approved', '2026-04-09 14:42:01', '2026-04-09 14:41:29', '1234'),
(3, 'Zoe\'s Home in Hangzhou', 'China', 'example1.freedns.org', 22, 1194, '1234%^&*ab', 'client\ndev tun\nproto udp\nremote china.privacy.network 1197\nresolv-retry infinite\nnobind\npersist-key\npersist-tun\ncipher aes-256-cbc\nauth sha256\ntls-client\nremote-cert-tls server\n\nauth-user-pass\ncompress\nverb 1\nreneg-sec 0\n\n<ca>\n-----BEGIN CERTIFICATE-----\nMIIHqzCCBZOgAwIBAgIJAJ0u+vODZJntMA0GCSqGSIb3DQEBDQUAMIHoMQswCQYD\nVQQGEwJVUzELMAkGA1UECBMCQ0ExEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNV\nBAoTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIElu\ndGVybmV0IEFjY2VzczEgMB4GA1UEAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3Mx\nIDAeBgNVBCkTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkB\nFiBzZWN1cmVAcHJpdmF0ZWludGVybmV0YWNjZXNzLmNvbTAeFw0xNDA0MTcxNzQw\nMzNaFw0zNDA0MTIxNzQwMzNaMIHoMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0Ex\nEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNVBAoTF1ByaXZhdGUgSW50ZXJuZXQg\nQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UE\nAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3MxIDAeBgNVBCkTF1ByaXZhdGUgSW50\nZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkBFiBzZWN1cmVAcHJpdmF0ZWludGVy\nbmV0YWNjZXNzLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALVk\nhjumaqBbL8aSgj6xbX1QPTfTd1qHsAZd2B97m8Vw31c/2yQgZNf5qZY0+jOIHULN\nDe4R9TIvyBEbvnAg/OkPw8n/+ScgYOeH876VUXzjLDBnDb8DLr/+w9oVsuDeFJ9K\nV2UFM1OYX0SnkHnrYAN2QLF98ESK4NCSU01h5zkcgmQ+qKSfA9Ny0/UpsKPBFqsQ\n25NvjDWFhCpeqCHKUJ4Be27CDbSl7lAkBuHMPHJs8f8xPgAbHRXZOxVCpayZ2SND\nfCwsnGWpWFoMGvdMbygngCn6jA/W1VSFOlRlfLuuGe7QFfDwA0jaLCxuWt/BgZyl\np7tAzYKR8lnWmtUCPm4+BtjyVDYtDCiGBD9Z4P13RFWvJHw5aapx/5W/CuvVyI7p\nKwvc2IT+KPxCUhH1XI8ca5RN3C9NoPJJf6qpg4g0rJH3aaWkoMRrYvQ+5PXXYUzj\ntRHImghRGd/ydERYoAZXuGSbPkm9Y/p2X8unLcW+F0xpJD98+ZI+tzSsI99Zs5wi\njSUGYr9/j18KHFTMQ8n+1jauc5bCCegN27dPeKXNSZ5riXFL2XX6BkY68y58UaNz\nmeGMiUL9BOV1iV+PMb7B7PYs7oFLjAhh0EdyvfHkrh/ZV9BEhtFa7yXp8XR0J6vz\n1YV9R6DYJmLjOEbhU8N0gc3tZm4Qz39lIIG6w3FDAgMBAAGjggFUMIIBUDAdBgNV\nHQ4EFgQUrsRtyWJftjpdRM0+925Y6Cl08SUwggEfBgNVHSMEggEWMIIBEoAUrsRt\nyWJftjpdRM0+925Y6Cl08SWhge6kgeswgegxCzAJBgNVBAYTAlVTMQswCQYDVQQI\nEwJDQTETMBEGA1UEBxMKTG9zQW5nZWxlczEgMB4GA1UEChMXUHJpdmF0ZSBJbnRl\ncm5ldCBBY2Nlc3MxIDAeBgNVBAsTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAw\nHgYDVQQDExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UEKRMXUHJpdmF0\nZSBJbnRlcm5ldCBBY2Nlc3MxLzAtBgkqhkiG9w0BCQEWIHNlY3VyZUBwcml2YXRl\naW50ZXJuZXRhY2Nlc3MuY29tggkAnS7684Nkme0wDAYDVR0TBAUwAwEB/zANBgkq\nhkiG9w0BAQ0FAAOCAgEAJsfhsPk3r8kLXLxY+v+vHzbr4ufNtqnL9/1Uuf8NrsCt\npXAoyZ0YqfbkWx3NHTZ7OE9ZRhdMP/RqHQE1p4N4Sa1nZKhTKasV6KhHDqSCt/dv\nEm89xWm2MVA7nyzQxVlHa9AkcBaemcXEiyT19XdpiXOP4Vhs+J1R5m8zQOxZlV1G\ntF9vsXmJqWZpOVPmZ8f35BCsYPvv4yMewnrtAC8PFEK/bOPeYcKN50bol22QYaZu\nLfpkHfNiFTnfMh8sl/ablPyNY7DUNiP5DRcMdIwmfGQxR5WEQoHL3yPJ42LkB5zs\n6jIm26DGNXfwura/mi105+ENH1CaROtRYwkiHb08U6qLXXJz80mWJkT90nr8Asj3\n5xN2cUppg74nG3YVav/38P48T56hG1NHbYF5uOCske19F6wi9maUoto/3vEr0rnX\nJUp2KODmKdvBI7co245lHBABWikk8VfejQSlCtDBXn644ZMtAdoxKNfR2WTFVEwJ\niyd1Fzx0yujuiXDROLhISLQDRjVVAvawrAtLZWYK31bY7KlezPlQnl/D9Asxe85l\n8jO5+0LdJ6VyOs/Hd4w52alDW/MFySDZSfQHMTIc30hLBJ8OnCEIvluVQQ2UQvoW\n+no177N9L2Y+M9TcTA62ZyMXShHQGeh20rb4kK8f+iFX8NxtdHVSkxMEFSfDDyQ=\n-----END CERTIFICATE-----\n</ca>\n\ndisable-occ\n', '2026-04-09 11:00:23', 'pending', NULL, NULL, '1234'),
(4, 'Betty (Nanchang)', 'China', '101.202.10.2', 22, 1194, '1234%^&*ac', 'client\ndev tun\nproto udp\nremote china.privacy.network 1197\nresolv-retry infinite\nnobind\npersist-key\npersist-tun\ncipher aes-256-cbc\nauth sha256\ntls-client\nremote-cert-tls server\n\nauth-user-pass\ncompress\nverb 1\nreneg-sec 0\n\n<ca>\n-----BEGIN CERTIFICATE-----\nMIIHqzCCBZOgAwIBAgIJAJ0u+vODZJntMA0GCSqGSIb3DQEBDQUAMIHoMQswCQYD\nVQQGEwJVUzELMAkGA1UECBMCQ0ExEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNV\nBAoTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIElu\ndGVybmV0IEFjY2VzczEgMB4GA1UEAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3Mx\nIDAeBgNVBCkTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkB\nFiBzZWN1cmVAcHJpdmF0ZWludGVybmV0YWNjZXNzLmNvbTAeFw0xNDA0MTcxNzQw\nMzNaFw0zNDA0MTIxNzQwMzNaMIHoMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0Ex\nEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNVBAoTF1ByaXZhdGUgSW50ZXJuZXQg\nQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UE\nAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3MxIDAeBgNVBCkTF1ByaXZhdGUgSW50\nZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkBFiBzZWN1cmVAcHJpdmF0ZWludGVy\nbmV0YWNjZXNzLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALVk\nhjumaqBbL8aSgj6xbX1QPTfTd1qHsAZd2B97m8Vw31c/2yQgZNf5qZY0+jOIHULN\nDe4R9TIvyBEbvnAg/OkPw8n/+ScgYOeH876VUXzjLDBnDb8DLr/+w9oVsuDeFJ9K\nV2UFM1OYX0SnkHnrYAN2QLF98ESK4NCSU01h5zkcgmQ+qKSfA9Ny0/UpsKPBFqsQ\n25NvjDWFhCpeqCHKUJ4Be27CDbSl7lAkBuHMPHJs8f8xPgAbHRXZOxVCpayZ2SND\nfCwsnGWpWFoMGvdMbygngCn6jA/W1VSFOlRlfLuuGe7QFfDwA0jaLCxuWt/BgZyl\np7tAzYKR8lnWmtUCPm4+BtjyVDYtDCiGBD9Z4P13RFWvJHw5aapx/5W/CuvVyI7p\nKwvc2IT+KPxCUhH1XI8ca5RN3C9NoPJJf6qpg4g0rJH3aaWkoMRrYvQ+5PXXYUzj\ntRHImghRGd/ydERYoAZXuGSbPkm9Y/p2X8unLcW+F0xpJD98+ZI+tzSsI99Zs5wi\njSUGYr9/j18KHFTMQ8n+1jauc5bCCegN27dPeKXNSZ5riXFL2XX6BkY68y58UaNz\nmeGMiUL9BOV1iV+PMb7B7PYs7oFLjAhh0EdyvfHkrh/ZV9BEhtFa7yXp8XR0J6vz\n1YV9R6DYJmLjOEbhU8N0gc3tZm4Qz39lIIG6w3FDAgMBAAGjggFUMIIBUDAdBgNV\nHQ4EFgQUrsRtyWJftjpdRM0+925Y6Cl08SUwggEfBgNVHSMEggEWMIIBEoAUrsRt\nyWJftjpdRM0+925Y6Cl08SWhge6kgeswgegxCzAJBgNVBAYTAlVTMQswCQYDVQQI\nEwJDQTETMBEGA1UEBxMKTG9zQW5nZWxlczEgMB4GA1UEChMXUHJpdmF0ZSBJbnRl\ncm5ldCBBY2Nlc3MxIDAeBgNVBAsTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAw\nHgYDVQQDExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UEKRMXUHJpdmF0\nZSBJbnRlcm5ldCBBY2Nlc3MxLzAtBgkqhkiG9w0BCQEWIHNlY3VyZUBwcml2YXRl\naW50ZXJuZXRhY2Nlc3MuY29tggkAnS7684Nkme0wDAYDVR0TBAUwAwEB/zANBgkq\nhkiG9w0BAQ0FAAOCAgEAJsfhsPk3r8kLXLxY+v+vHzbr4ufNtqnL9/1Uuf8NrsCt\npXAoyZ0YqfbkWx3NHTZ7OE9ZRhdMP/RqHQE1p4N4Sa1nZKhTKasV6KhHDqSCt/dv\nEm89xWm2MVA7nyzQxVlHa9AkcBaemcXEiyT19XdpiXOP4Vhs+J1R5m8zQOxZlV1G\ntF9vsXmJqWZpOVPmZ8f35BCsYPvv4yMewnrtAC8PFEK/bOPeYcKN50bol22QYaZu\nLfpkHfNiFTnfMh8sl/ablPyNY7DUNiP5DRcMdIwmfGQxR5WEQoHL3yPJ42LkB5zs\n6jIm26DGNXfwura/mi105+ENH1CaROtRYwkiHb08U6qLXXJz80mWJkT90nr8Asj3\n5xN2cUppg74nG3YVav/38P48T56hG1NHbYF5uOCske19F6wi9maUoto/3vEr0rnX\nJUp2KODmKdvBI7co245lHBABWikk8VfejQSlCtDBXn644ZMtAdoxKNfR2WTFVEwJ\niyd1Fzx0yujuiXDROLhISLQDRjVVAvawrAtLZWYK31bY7KlezPlQnl/D9Asxe85l\n8jO5+0LdJ6VyOs/Hd4w52alDW/MFySDZSfQHMTIc30hLBJ8OnCEIvluVQQ2UQvoW\n+no177N9L2Y+M9TcTA62ZyMXShHQGeh20rb4kK8f+iFX8NxtdHVSkxMEFSfDDyQ=\n-----END CERTIFICATE-----\n</ca>\n\ndisable-occ\n', '2026-04-09 11:01:29', 'pending', NULL, NULL, '1234'),
(5, 'Pinky', 'Taiwan, China', '123.254.12.1', 22, 1194, '1234%^&*ac', 'client\ndev tun\nproto udp\nremote china.privacy.network 1197\nresolv-retry infinite\nnobind\npersist-key\npersist-tun\ncipher aes-256-cbc\nauth sha256\ntls-client\nremote-cert-tls server\n\nauth-user-pass\ncompress\nverb 1\nreneg-sec 0\n\n<ca>\n-----BEGIN CERTIFICATE-----\nMIIHqzCCBZOgAwIBAgIJAJ0u+vODZJntMA0GCSqGSIb3DQEBDQUAMIHoMQswCQYD\nVQQGEwJVUzELMAkGA1UECBMCQ0ExEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNV\nBAoTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIElu\ndGVybmV0IEFjY2VzczEgMB4GA1UEAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3Mx\nIDAeBgNVBCkTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkB\nFiBzZWN1cmVAcHJpdmF0ZWludGVybmV0YWNjZXNzLmNvbTAeFw0xNDA0MTcxNzQw\nMzNaFw0zNDA0MTIxNzQwMzNaMIHoMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0Ex\nEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNVBAoTF1ByaXZhdGUgSW50ZXJuZXQg\nQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UE\nAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3MxIDAeBgNVBCkTF1ByaXZhdGUgSW50\nZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkBFiBzZWN1cmVAcHJpdmF0ZWludGVy\nbmV0YWNjZXNzLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALVk\nhjumaqBbL8aSgj6xbX1QPTfTd1qHsAZd2B97m8Vw31c/2yQgZNf5qZY0+jOIHULN\nDe4R9TIvyBEbvnAg/OkPw8n/+ScgYOeH876VUXzjLDBnDb8DLr/+w9oVsuDeFJ9K\nV2UFM1OYX0SnkHnrYAN2QLF98ESK4NCSU01h5zkcgmQ+qKSfA9Ny0/UpsKPBFqsQ\n25NvjDWFhCpeqCHKUJ4Be27CDbSl7lAkBuHMPHJs8f8xPgAbHRXZOxVCpayZ2SND\nfCwsnGWpWFoMGvdMbygngCn6jA/W1VSFOlRlfLuuGe7QFfDwA0jaLCxuWt/BgZyl\np7tAzYKR8lnWmtUCPm4+BtjyVDYtDCiGBD9Z4P13RFWvJHw5aapx/5W/CuvVyI7p\nKwvc2IT+KPxCUhH1XI8ca5RN3C9NoPJJf6qpg4g0rJH3aaWkoMRrYvQ+5PXXYUzj\ntRHImghRGd/ydERYoAZXuGSbPkm9Y/p2X8unLcW+F0xpJD98+ZI+tzSsI99Zs5wi\njSUGYr9/j18KHFTMQ8n+1jauc5bCCegN27dPeKXNSZ5riXFL2XX6BkY68y58UaNz\nmeGMiUL9BOV1iV+PMb7B7PYs7oFLjAhh0EdyvfHkrh/ZV9BEhtFa7yXp8XR0J6vz\n1YV9R6DYJmLjOEbhU8N0gc3tZm4Qz39lIIG6w3FDAgMBAAGjggFUMIIBUDAdBgNV\nHQ4EFgQUrsRtyWJftjpdRM0+925Y6Cl08SUwggEfBgNVHSMEggEWMIIBEoAUrsRt\nyWJftjpdRM0+925Y6Cl08SWhge6kgeswgegxCzAJBgNVBAYTAlVTMQswCQYDVQQI\nEwJDQTETMBEGA1UEBxMKTG9zQW5nZWxlczEgMB4GA1UEChMXUHJpdmF0ZSBJbnRl\ncm5ldCBBY2Nlc3MxIDAeBgNVBAsTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAw\nHgYDVQQDExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UEKRMXUHJpdmF0\nZSBJbnRlcm5ldCBBY2Nlc3MxLzAtBgkqhkiG9w0BCQEWIHNlY3VyZUBwcml2YXRl\naW50ZXJuZXRhY2Nlc3MuY29tggkAnS7684Nkme0wDAYDVR0TBAUwAwEB/zANBgkq\nhkiG9w0BAQ0FAAOCAgEAJsfhsPk3r8kLXLxY+v+vHzbr4ufNtqnL9/1Uuf8NrsCt\npXAoyZ0YqfbkWx3NHTZ7OE9ZRhdMP/RqHQE1p4N4Sa1nZKhTKasV6KhHDqSCt/dv\nEm89xWm2MVA7nyzQxVlHa9AkcBaemcXEiyT19XdpiXOP4Vhs+J1R5m8zQOxZlV1G\ntF9vsXmJqWZpOVPmZ8f35BCsYPvv4yMewnrtAC8PFEK/bOPeYcKN50bol22QYaZu\nLfpkHfNiFTnfMh8sl/ablPyNY7DUNiP5DRcMdIwmfGQxR5WEQoHL3yPJ42LkB5zs\n6jIm26DGNXfwura/mi105+ENH1CaROtRYwkiHb08U6qLXXJz80mWJkT90nr8Asj3\n5xN2cUppg74nG3YVav/38P48T56hG1NHbYF5uOCske19F6wi9maUoto/3vEr0rnX\nJUp2KODmKdvBI7co245lHBABWikk8VfejQSlCtDBXn644ZMtAdoxKNfR2WTFVEwJ\niyd1Fzx0yujuiXDROLhISLQDRjVVAvawrAtLZWYK31bY7KlezPlQnl/D9Asxe85l\n8jO5+0LdJ6VyOs/Hd4w52alDW/MFySDZSfQHMTIc30hLBJ8OnCEIvluVQQ2UQvoW\n+no177N9L2Y+M9TcTA62ZyMXShHQGeh20rb4kK8f+iFX8NxtdHVSkxMEFSfDDyQ=\n-----END CERTIFICATE-----\n</ca>\n\ndisable-occ\n', '2026-04-09 11:02:12', 'pending', NULL, NULL, '1234'),
(6, 'Guangzhou Home', 'China', 'example1.freedns.org', 22, 1194, '1234', 'client\ndev tun\nproto udp\nremote china.privacy.network 1197\nresolv-retry infinite\nnobind\npersist-key\npersist-tun\ncipher aes-256-cbc\nauth sha256\ntls-client\nremote-cert-tls server\n\nauth-user-pass\ncompress\nverb 1\nreneg-sec 0\n\n<ca>\n-----BEGIN CERTIFICATE-----\nMIIHqzCCBZOgAwIBAgIJAJ0u+vODZJntMA0GCSqGSIb3DQEBDQUAMIHoMQswCQYD\nVQQGEwJVUzELMAkGA1UECBMCQ0ExEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNV\nBAoTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIElu\ndGVybmV0IEFjY2VzczEgMB4GA1UEAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3Mx\nIDAeBgNVBCkTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkB\nFiBzZWN1cmVAcHJpdmF0ZWludGVybmV0YWNjZXNzLmNvbTAeFw0xNDA0MTcxNzQw\nMzNaFw0zNDA0MTIxNzQwMzNaMIHoMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0Ex\nEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNVBAoTF1ByaXZhdGUgSW50ZXJuZXQg\nQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UE\nAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3MxIDAeBgNVBCkTF1ByaXZhdGUgSW50\nZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkBFiBzZWN1cmVAcHJpdmF0ZWludGVy\nbmV0YWNjZXNzLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALVk\nhjumaqBbL8aSgj6xbX1QPTfTd1qHsAZd2B97m8Vw31c/2yQgZNf5qZY0+jOIHULN\nDe4R9TIvyBEbvnAg/OkPw8n/+ScgYOeH876VUXzjLDBnDb8DLr/+w9oVsuDeFJ9K\nV2UFM1OYX0SnkHnrYAN2QLF98ESK4NCSU01h5zkcgmQ+qKSfA9Ny0/UpsKPBFqsQ\n25NvjDWFhCpeqCHKUJ4Be27CDbSl7lAkBuHMPHJs8f8xPgAbHRXZOxVCpayZ2SND\nfCwsnGWpWFoMGvdMbygngCn6jA/W1VSFOlRlfLuuGe7QFfDwA0jaLCxuWt/BgZyl\np7tAzYKR8lnWmtUCPm4+BtjyVDYtDCiGBD9Z4P13RFWvJHw5aapx/5W/CuvVyI7p\nKwvc2IT+KPxCUhH1XI8ca5RN3C9NoPJJf6qpg4g0rJH3aaWkoMRrYvQ+5PXXYUzj\ntRHImghRGd/ydERYoAZXuGSbPkm9Y/p2X8unLcW+F0xpJD98+ZI+tzSsI99Zs5wi\njSUGYr9/j18KHFTMQ8n+1jauc5bCCegN27dPeKXNSZ5riXFL2XX6BkY68y58UaNz\nmeGMiUL9BOV1iV+PMb7B7PYs7oFLjAhh0EdyvfHkrh/ZV9BEhtFa7yXp8XR0J6vz\n1YV9R6DYJmLjOEbhU8N0gc3tZm4Qz39lIIG6w3FDAgMBAAGjggFUMIIBUDAdBgNV\nHQ4EFgQUrsRtyWJftjpdRM0+925Y6Cl08SUwggEfBgNVHSMEggEWMIIBEoAUrsRt\nyWJftjpdRM0+925Y6Cl08SWhge6kgeswgegxCzAJBgNVBAYTAlVTMQswCQYDVQQI\nEwJDQTETMBEGA1UEBxMKTG9zQW5nZWxlczEgMB4GA1UEChMXUHJpdmF0ZSBJbnRl\ncm5ldCBBY2Nlc3MxIDAeBgNVBAsTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAw\nHgYDVQQDExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UEKRMXUHJpdmF0\nZSBJbnRlcm5ldCBBY2Nlc3MxLzAtBgkqhkiG9w0BCQEWIHNlY3VyZUBwcml2YXRl\naW50ZXJuZXRhY2Nlc3MuY29tggkAnS7684Nkme0wDAYDVR0TBAUwAwEB/zANBgkq\nhkiG9w0BAQ0FAAOCAgEAJsfhsPk3r8kLXLxY+v+vHzbr4ufNtqnL9/1Uuf8NrsCt\npXAoyZ0YqfbkWx3NHTZ7OE9ZRhdMP/RqHQE1p4N4Sa1nZKhTKasV6KhHDqSCt/dv\nEm89xWm2MVA7nyzQxVlHa9AkcBaemcXEiyT19XdpiXOP4Vhs+J1R5m8zQOxZlV1G\ntF9vsXmJqWZpOVPmZ8f35BCsYPvv4yMewnrtAC8PFEK/bOPeYcKN50bol22QYaZu\nLfpkHfNiFTnfMh8sl/ablPyNY7DUNiP5DRcMdIwmfGQxR5WEQoHL3yPJ42LkB5zs\n6jIm26DGNXfwura/mi105+ENH1CaROtRYwkiHb08U6qLXXJz80mWJkT90nr8Asj3\n5xN2cUppg74nG3YVav/38P48T56hG1NHbYF5uOCske19F6wi9maUoto/3vEr0rnX\nJUp2KODmKdvBI7co245lHBABWikk8VfejQSlCtDBXn644ZMtAdoxKNfR2WTFVEwJ\niyd1Fzx0yujuiXDROLhISLQDRjVVAvawrAtLZWYK31bY7KlezPlQnl/D9Asxe85l\n8jO5+0LdJ6VyOs/Hd4w52alDW/MFySDZSfQHMTIc30hLBJ8OnCEIvluVQQ2UQvoW\n+no177N9L2Y+M9TcTA62ZyMXShHQGeh20rb4kK8f+iFX8NxtdHVSkxMEFSfDDyQ=\n-----END CERTIFICATE-----\n</ca>\n\ndisable-occ\n', '2026-04-09 17:45:59', 'denied', NULL, '2026-04-10 01:47:00', '1234'),
(7, 'Olivia Lanzhou', 'China', 'example1.freedns.org', 22, 1194, '1234', 'client\ndev tun\nproto udp\nremote china.privacy.network 1197\nresolv-retry infinite\nnobind\npersist-key\npersist-tun\ncipher aes-256-cbc\nauth sha256\ntls-client\nremote-cert-tls server\n\nauth-user-pass\ncompress\nverb 1\nreneg-sec 0\n\n<ca>\n-----BEGIN CERTIFICATE-----\nMIIHqzCCBZOgAwIBAgIJAJ0u+vODZJntMA0GCSqGSIb3DQEBDQUAMIHoMQswCQYD\nVQQGEwJVUzELMAkGA1UECBMCQ0ExEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNV\nBAoTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIElu\ndGVybmV0IEFjY2VzczEgMB4GA1UEAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3Mx\nIDAeBgNVBCkTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkB\nFiBzZWN1cmVAcHJpdmF0ZWludGVybmV0YWNjZXNzLmNvbTAeFw0xNDA0MTcxNzQw\nMzNaFw0zNDA0MTIxNzQwMzNaMIHoMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0Ex\nEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNVBAoTF1ByaXZhdGUgSW50ZXJuZXQg\nQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UE\nAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3MxIDAeBgNVBCkTF1ByaXZhdGUgSW50\nZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkBFiBzZWN1cmVAcHJpdmF0ZWludGVy\nbmV0YWNjZXNzLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALVk\nhjumaqBbL8aSgj6xbX1QPTfTd1qHsAZd2B97m8Vw31c/2yQgZNf5qZY0+jOIHULN\nDe4R9TIvyBEbvnAg/OkPw8n/+ScgYOeH876VUXzjLDBnDb8DLr/+w9oVsuDeFJ9K\nV2UFM1OYX0SnkHnrYAN2QLF98ESK4NCSU01h5zkcgmQ+qKSfA9Ny0/UpsKPBFqsQ\n25NvjDWFhCpeqCHKUJ4Be27CDbSl7lAkBuHMPHJs8f8xPgAbHRXZOxVCpayZ2SND\nfCwsnGWpWFoMGvdMbygngCn6jA/W1VSFOlRlfLuuGe7QFfDwA0jaLCxuWt/BgZyl\np7tAzYKR8lnWmtUCPm4+BtjyVDYtDCiGBD9Z4P13RFWvJHw5aapx/5W/CuvVyI7p\nKwvc2IT+KPxCUhH1XI8ca5RN3C9NoPJJf6qpg4g0rJH3aaWkoMRrYvQ+5PXXYUzj\ntRHImghRGd/ydERYoAZXuGSbPkm9Y/p2X8unLcW+F0xpJD98+ZI+tzSsI99Zs5wi\njSUGYr9/j18KHFTMQ8n+1jauc5bCCegN27dPeKXNSZ5riXFL2XX6BkY68y58UaNz\nmeGMiUL9BOV1iV+PMb7B7PYs7oFLjAhh0EdyvfHkrh/ZV9BEhtFa7yXp8XR0J6vz\n1YV9R6DYJmLjOEbhU8N0gc3tZm4Qz39lIIG6w3FDAgMBAAGjggFUMIIBUDAdBgNV\nHQ4EFgQUrsRtyWJftjpdRM0+925Y6Cl08SUwggEfBgNVHSMEggEWMIIBEoAUrsRt\nyWJftjpdRM0+925Y6Cl08SWhge6kgeswgegxCzAJBgNVBAYTAlVTMQswCQYDVQQI\nEwJDQTETMBEGA1UEBxMKTG9zQW5nZWxlczEgMB4GA1UEChMXUHJpdmF0ZSBJbnRl\ncm5ldCBBY2Nlc3MxIDAeBgNVBAsTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAw\nHgYDVQQDExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UEKRMXUHJpdmF0\nZSBJbnRlcm5ldCBBY2Nlc3MxLzAtBgkqhkiG9w0BCQEWIHNlY3VyZUBwcml2YXRl\naW50ZXJuZXRhY2Nlc3MuY29tggkAnS7684Nkme0wDAYDVR0TBAUwAwEB/zANBgkq\nhkiG9w0BAQ0FAAOCAgEAJsfhsPk3r8kLXLxY+v+vHzbr4ufNtqnL9/1Uuf8NrsCt\npXAoyZ0YqfbkWx3NHTZ7OE9ZRhdMP/RqHQE1p4N4Sa1nZKhTKasV6KhHDqSCt/dv\nEm89xWm2MVA7nyzQxVlHa9AkcBaemcXEiyT19XdpiXOP4Vhs+J1R5m8zQOxZlV1G\ntF9vsXmJqWZpOVPmZ8f35BCsYPvv4yMewnrtAC8PFEK/bOPeYcKN50bol22QYaZu\nLfpkHfNiFTnfMh8sl/ablPyNY7DUNiP5DRcMdIwmfGQxR5WEQoHL3yPJ42LkB5zs\n6jIm26DGNXfwura/mi105+ENH1CaROtRYwkiHb08U6qLXXJz80mWJkT90nr8Asj3\n5xN2cUppg74nG3YVav/38P48T56hG1NHbYF5uOCske19F6wi9maUoto/3vEr0rnX\nJUp2KODmKdvBI7co245lHBABWikk8VfejQSlCtDBXn644ZMtAdoxKNfR2WTFVEwJ\niyd1Fzx0yujuiXDROLhISLQDRjVVAvawrAtLZWYK31bY7KlezPlQnl/D9Asxe85l\n8jO5+0LdJ6VyOs/Hd4w52alDW/MFySDZSfQHMTIc30hLBJ8OnCEIvluVQQ2UQvoW\n+no177N9L2Y+M9TcTA62ZyMXShHQGeh20rb4kK8f+iFX8NxtdHVSkxMEFSfDDyQ=\n-----END CERTIFICATE-----\n</ca>\n\ndisable-occ\n', '2026-04-09 18:17:06', 'approved', '2026-04-10 02:19:45', '2026-04-10 02:19:30', '1234'),
(8, 'Olivia Nanchong', 'China', 'example1.freedns.org', 22, 1194, '1234', 'client\ndev tun\nproto udp\nremote china.privacy.network 1197\nresolv-retry infinite\nnobind\npersist-key\npersist-tun\ncipher aes-256-cbc\nauth sha256\ntls-client\nremote-cert-tls server\n\nauth-user-pass\ncompress\nverb 1\nreneg-sec 0\n\n<ca>\n-----BEGIN CERTIFICATE-----\nMIIHqzCCBZOgAwIBAgIJAJ0u+vODZJntMA0GCSqGSIb3DQEBDQUAMIHoMQswCQYD\nVQQGEwJVUzELMAkGA1UECBMCQ0ExEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNV\nBAoTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIElu\ndGVybmV0IEFjY2VzczEgMB4GA1UEAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3Mx\nIDAeBgNVBCkTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkB\nFiBzZWN1cmVAcHJpdmF0ZWludGVybmV0YWNjZXNzLmNvbTAeFw0xNDA0MTcxNzQw\nMzNaFw0zNDA0MTIxNzQwMzNaMIHoMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0Ex\nEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNVBAoTF1ByaXZhdGUgSW50ZXJuZXQg\nQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UE\nAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3MxIDAeBgNVBCkTF1ByaXZhdGUgSW50\nZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkBFiBzZWN1cmVAcHJpdmF0ZWludGVy\nbmV0YWNjZXNzLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALVk\nhjumaqBbL8aSgj6xbX1QPTfTd1qHsAZd2B97m8Vw31c/2yQgZNf5qZY0+jOIHULN\nDe4R9TIvyBEbvnAg/OkPw8n/+ScgYOeH876VUXzjLDBnDb8DLr/+w9oVsuDeFJ9K\nV2UFM1OYX0SnkHnrYAN2QLF98ESK4NCSU01h5zkcgmQ+qKSfA9Ny0/UpsKPBFqsQ\n25NvjDWFhCpeqCHKUJ4Be27CDbSl7lAkBuHMPHJs8f8xPgAbHRXZOxVCpayZ2SND\nfCwsnGWpWFoMGvdMbygngCn6jA/W1VSFOlRlfLuuGe7QFfDwA0jaLCxuWt/BgZyl\np7tAzYKR8lnWmtUCPm4+BtjyVDYtDCiGBD9Z4P13RFWvJHw5aapx/5W/CuvVyI7p\nKwvc2IT+KPxCUhH1XI8ca5RN3C9NoPJJf6qpg4g0rJH3aaWkoMRrYvQ+5PXXYUzj\ntRHImghRGd/ydERYoAZXuGSbPkm9Y/p2X8unLcW+F0xpJD98+ZI+tzSsI99Zs5wi\njSUGYr9/j18KHFTMQ8n+1jauc5bCCegN27dPeKXNSZ5riXFL2XX6BkY68y58UaNz\nmeGMiUL9BOV1iV+PMb7B7PYs7oFLjAhh0EdyvfHkrh/ZV9BEhtFa7yXp8XR0J6vz\n1YV9R6DYJmLjOEbhU8N0gc3tZm4Qz39lIIG6w3FDAgMBAAGjggFUMIIBUDAdBgNV\nHQ4EFgQUrsRtyWJftjpdRM0+925Y6Cl08SUwggEfBgNVHSMEggEWMIIBEoAUrsRt\nyWJftjpdRM0+925Y6Cl08SWhge6kgeswgegxCzAJBgNVBAYTAlVTMQswCQYDVQQI\nEwJDQTETMBEGA1UEBxMKTG9zQW5nZWxlczEgMB4GA1UEChMXUHJpdmF0ZSBJbnRl\ncm5ldCBBY2Nlc3MxIDAeBgNVBAsTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAw\nHgYDVQQDExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UEKRMXUHJpdmF0\nZSBJbnRlcm5ldCBBY2Nlc3MxLzAtBgkqhkiG9w0BCQEWIHNlY3VyZUBwcml2YXRl\naW50ZXJuZXRhY2Nlc3MuY29tggkAnS7684Nkme0wDAYDVR0TBAUwAwEB/zANBgkq\nhkiG9w0BAQ0FAAOCAgEAJsfhsPk3r8kLXLxY+v+vHzbr4ufNtqnL9/1Uuf8NrsCt\npXAoyZ0YqfbkWx3NHTZ7OE9ZRhdMP/RqHQE1p4N4Sa1nZKhTKasV6KhHDqSCt/dv\nEm89xWm2MVA7nyzQxVlHa9AkcBaemcXEiyT19XdpiXOP4Vhs+J1R5m8zQOxZlV1G\ntF9vsXmJqWZpOVPmZ8f35BCsYPvv4yMewnrtAC8PFEK/bOPeYcKN50bol22QYaZu\nLfpkHfNiFTnfMh8sl/ablPyNY7DUNiP5DRcMdIwmfGQxR5WEQoHL3yPJ42LkB5zs\n6jIm26DGNXfwura/mi105+ENH1CaROtRYwkiHb08U6qLXXJz80mWJkT90nr8Asj3\n5xN2cUppg74nG3YVav/38P48T56hG1NHbYF5uOCske19F6wi9maUoto/3vEr0rnX\nJUp2KODmKdvBI7co245lHBABWikk8VfejQSlCtDBXn644ZMtAdoxKNfR2WTFVEwJ\niyd1Fzx0yujuiXDROLhISLQDRjVVAvawrAtLZWYK31bY7KlezPlQnl/D9Asxe85l\n8jO5+0LdJ6VyOs/Hd4w52alDW/MFySDZSfQHMTIc30hLBJ8OnCEIvluVQQ2UQvoW\n+no177N9L2Y+M9TcTA62ZyMXShHQGeh20rb4kK8f+iFX8NxtdHVSkxMEFSfDDyQ=\n-----END CERTIFICATE-----\n</ca>\n\ndisable-occ\n', '2026-04-09 19:03:24', 'approved', '2026-04-10 03:04:57', '2026-04-10 03:04:45', '1234');

-- --------------------------------------------------------

--
-- 数据表结构 `routers`
--

CREATE TABLE `routers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `ssh_port` int(11) DEFAULT 22,
  `openvpn_port` int(11) DEFAULT 1194,
  `last_seen` datetime DEFAULT NULL,
  `current_speed_mbps` decimal(8,2) DEFAULT 0.00,
  `is_online` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ssh_password` varchar(255) NOT NULL DEFAULT '',
  `client_config` text DEFAULT NULL,
  `contributor_password` varchar(255) DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL,
  `removed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 倾印数据表的资料 `routers`
--

INSERT INTO `routers` (`id`, `name`, `country`, `ip_address`, `ssh_port`, `openvpn_port`, `last_seen`, `current_speed_mbps`, `is_online`, `created_at`, `ssh_password`, `client_config`, `contributor_password`, `suspended_until`, `removed`) VALUES
(1, 'Server 1 (Hong Kong, China)', 'Hong Kong, China', '192.168.1.1', 22, 1194, '2026-04-27 16:24:21', 0.00, 1, '2026-04-08 19:34:52', '1234%^&*ab', 'user nobody\ngroup nogroup\ndev tun\nnobind\nclient\nremote 192.168.1.1 1194 udp\nauth-user-pass\nauth-nocache\nremote-cert-tls server\n<tls-crypt-v2>\n-----BEGIN OpenVPN tls-crypt-v2 client key-----\nmN8Vce0R3MReyjQOFphxJTBIVIROunmODVVCVlYd4H0pLtSWUaaTDUs3tYc/0J5s\nvPntIqBLHO2hJsgmg7BdZe/qnXCbL/Hfe3frcxF1GhrosXoxjp8uw9KaT0kpUwoY\nzLoEDoddlxpcYlahfKtztIRkrn2h7hYZaNuhScLlCIMs8Kg5Hq+duaeSbhvt2w+m\nM9cgD2/PxW6TLg8NACNAFSjVdtNmJ1lk+w3DYa21aJc3NJajM/IdtrkAcR+p6gU+\nssOVC1vNeNjdLnGm0c5nKqNcmY9+uS0RU8+DKOGbBK7dnozMYqcvib8L8co2Om56\n5ASiLiOnNpttbSpbn9UK2JvgHoLQoG5ImjpmuPJc9t787+AaE56Q79FURuXbIvyb\n1bBBe1Q4VgR7KLl326df6LqY6/48TL7ELoS+5/744VVlrd4FNuF7ktPC7Wt8Nu23\n1iYSXynjPnrlRauXJ83qEuB0kzxSdrWQhdZx4Y8RU7XUgbqkaKGxEvzLCN/iXg/G\nZ5lSkMVd4yzsYGOGwWdl9cxyHRnEHGOTakNmEwBzFAaTFZazOSm02SJ7GnugE4PF\nKeZz8Uk4ujKz3SJRJFHVe6G3n9qwcEa1fx3i5dYYKvnmKpnExdTMWN6IOAOFuM6R\nkDJcAwrt1bMpGBwdAkALEiqCFFrRkOZCwSHSwOMzP6f27mkHqALo4PVaGO+gO+cD\nwnC+W4FXCgtDS1qZwv2wM0Ye+2vSAM1iaQEr\n-----END OpenVPN tls-crypt-v2 client key-----\n</tls-crypt-v2>\n<key>\n-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDnI4l3rsJXwcyg\nAcCpC+U94Z+84sx8YD7JDP2PiwmqCI7V8XXSkXiExrFQTKTMepE/ZzSxV4Cz2+Es\nExr3r8qAA3qGBHW31CdYd662TVWG+Swyeb5l2EVUB4fEfpN4hUOXZdTYj73VfVFJ\nwshnCVncAQrjuWEh5yZKwvvSJaVn+bpBK2C8ObspqsouUGH3IjRpdIugNbI3r6+b\nnECqFuZW5hKomUEv+U8eBnFtBN/FegtehdMgh1vFiOGxO0m84/o3WlUhhu78y8Wn\nyKH6cONiaaW9HZjWOigzzY/UGFg8+xRCe8LxdqU4u5Qul7vqn5qmKNsb3PxkUSnk\nijj85a6pAgMBAAECggEABDbuq8MBAi6jd4twouR3oqA5lG0iQ2ZR3sKg4PwtCe+s\nAxSrDFLgurMQyqELJDtb6KcOG+m3jBAHVBFpHXkUHS9zDXyJVPfGW+OayPIyDAsB\nFk6H/T1rTjPw8tFICRuM9vbBYc2FLZ5iXBD0LITMIanXM/3OWprnZNeXVeaf1Hx9\nWz1bXB77N5Yt14tMntK+WXolHcX+/sC2fscKSo/imYWZ5hK6qHcHSd3QzZa5x4uz\nXjte6eTqMCggKZpkRGPjY+y5Og4k3Jk4vXYm8m2Niq39IOeLvBhKJAg4j1MMj2gF\nunua4q0a47qyX1APiIZoo9VB3JhprJqRAFKS7AuVAQKBgQD85Jhp2GUDrHFiDqpS\nl64DgHcG6Wxl6kOk9dCkfnrw7NpNQI/dEG609DOQGRA6fDqAb5dxgoSGlpjJMeuE\ngp4NWAoxY8p+KgE/soglzVen/+0IKX6FJ1IaZOqc8o99Kk1GPvw3WtPmk5jCtmt2\nxZf32vqJAtG6SIYqSl0YRxDi4QKBgQDp+oUgIhj7fcg0IELWk6Wj5vTSftlqIjYA\n5wUCA0wEiX6BkQiXfvBpjnzVB8rK7occ1ew1NzgoSaYejcKfkhKO3gDX89sXwrTQ\nXL8BTOlAefAf2VCIg2nTCpP8nln3CfwuvE3EFXWi1Mhko/8Z9bLEYBcJFA7Xon1R\nrLDTByEMyQKBgENg0G7a9cbtyeO7Tovk17sdHhlcVcItkUpBKA67mBvarysH+YyH\nlUdnDNnmo5lBggC4OpxGjvKg6yInx70tY9jgTQ7trITCwkRrV7Tiqekb2dZj386w\nNELOAmhAhBRwEdiWbXJ+I5j6WCgAnE8vxBaIZFnew2wjaIOZ/oW6YXhhAoGBALAC\neKqXe9uT30r3CdCI+Q2262x9Z+fjHGTJZIcDG+g91iB5jdEI+KkvOtC2L+NAU/tp\nIWtWwrPr0z8gvMt1AujeMBxDoQjau1ISssyzorOSBwSuYVqQIMdVKcXbCSpBJKez\nl3xt+DQphSXQCFLq9TOsZSe7Iv8riMIr+kiFEGOhAoGAcVTHoaG6i/iXXx2Z2JcL\nPFKGQcskoz8c6gsOoM9ZEWrMMOT4Ncl5QzN7wh1wLTHde8ZOI07dGVDmCFWG5CKC\n5cVYRCS1wqoXUNC6+hrOupWfdjZSqKzvVXpVf5MN6W0wGbRaS1ar2XrkorILE4kI\nhY2QR3w1ZQaijJ2cBtEC50I=\n-----END PRIVATE KEY-----\n</key>\n<cert>\n-----BEGIN CERTIFICATE-----\nMIIDVDCCAjygAwIBAgIQNfGOo3TLWR7CIymZqG91gjANBgkqhkiG9w0BAQsFADAW\nMRQwEgYDVQQDDAtFYXN5LVJTQSBDQTAeFw0yNjA0MDgxNzU1MDhaFw0zNjA0MDUx\nNzU1MDhaMBExDzANBgNVBAMMBmNsaWVudDCCASIwDQYJKoZIhvcNAQEBBQADggEP\nADCCAQoCggEBAOcjiXeuwlfBzKABwKkL5T3hn7zizHxgPskM/Y+LCaoIjtXxddKR\neITGsVBMpMx6kT9nNLFXgLPb4SwTGvevyoADeoYEdbfUJ1h3rrZNVYb5LDJ5vmXY\nRVQHh8R+k3iFQ5dl1NiPvdV9UUnCyGcJWdwBCuO5YSHnJkrC+9IlpWf5ukErYLw5\nuymqyi5QYfciNGl0i6A1sjevr5ucQKoW5lbmEqiZQS/5Tx4GcW0E38V6C16F0yCH\nW8WI4bE7Sbzj+jdaVSGG7vzLxafIofpw42Jppb0dmNY6KDPNj9QYWDz7FEJ7wvF2\npTi7lC6Xu+qfmqYo2xvc/GRRKeSKOPzlrqkCAwEAAaOBojCBnzAJBgNVHRMEAjAA\nMB0GA1UdDgQWBBQ/o7QsXtLbIUscEMwi2YvpfD1wyjBRBgNVHSMESjBIgBQaT5bg\n3GwqT1XA80RUnO1pfcDeFKEapBgwFjEUMBIGA1UEAwwLRWFzeS1SU0EgQ0GCFARS\nUDhdErRd8p3pGZTlAWsFy02uMBMGA1UdJQQMMAoGCCsGAQUFBwMCMAsGA1UdDwQE\nAwIHgDANBgkqhkiG9w0BAQsFAAOCAQEAvzr7kO4+UUilil3xnOm++y8dIa66vlgi\nn8UG4mL3YQvO8SvcIHMUCHHJEVF4GuZcqF1iFB8vF8HCPRnyR9OMBzhRkzbwTDLT\n+gj/STUheylKPTUa935EIJI4vl78Zs1j+/5NNPGqZOkmRoqD18lvXm/1o3w4PSug\n6JpZg92ep1/Y45Q42RbFrcfWuIs7KjEUIY7q1Y/+OGR9jbyc4vcQ7feUOe2DfrQO\nqZ9/s5PXc4iekEzGnva+CpQlf2znju0K70idZnW495g/XLjayoryA4LkrJqmGgoH\ng7QqkbcL59j8jPGKqHlq7twHgUHFtw1QfGyQx9y7Yvs8HDqzbybNbQ==\n-----END CERTIFICATE-----\n</cert>\n<ca>\n-----BEGIN CERTIFICATE-----\nMIIDSzCCAjOgAwIBAgIUBFJQOF0StF3ynekZlOUBawXLTa4wDQYJKoZIhvcNAQEL\nBQAwFjEUMBIGA1UEAwwLRWFzeS1SU0EgQ0EwHhcNMjYwNDA4MTc1NDExWhcNMzYw\nNDA1MTc1NDExWjAWMRQwEgYDVQQDDAtFYXN5LVJTQSBDQTCCASIwDQYJKoZIhvcN\nAQEBBQADggEPADCCAQoCggEBANyQHqOMvzPdH6HeSO/6ajgMK6PFBTaBbpUpnZIS\nixVDzt04KFpO3dxw1FEyYy39a9KhspfRR6iPhRBQTaVzq/sjE7Z3pHZj2+5snoXH\nqoz3pJwl814Ui1ej17/AXELEjg+FSwsa0m+1uQsDBBYxji7TtKDEHfJZD+fKbCyW\nqeTkLcZmhxk7Fluf02Ks/+mZiGa/Tx5YM5HLsuT0Kb3D3KyD2RQKb+6l8ilGE5Gh\nhJANpNKOPPe3pzdO1tMRLcJITwMdb1aeaYk7I40D0FNmK+2e65L4tvR2cZjebmzF\nUVP38hrJtgL/CfD6yi2kWI5J9zE68D9A9dUwoHuNo6YQkuUCAwEAAaOBkDCBjTAM\nBgNVHRMEBTADAQH/MB0GA1UdDgQWBBQaT5bg3GwqT1XA80RUnO1pfcDeFDBRBgNV\nHSMESjBIgBQaT5bg3GwqT1XA80RUnO1pfcDeFKEapBgwFjEUMBIGA1UEAwwLRWFz\neS1SU0EgQ0GCFARSUDhdErRd8p3pGZTlAWsFy02uMAsGA1UdDwQEAwIBBjANBgkq\nhkiG9w0BAQsFAAOCAQEAco8oYfoBgEBAwbq5kB7JfaVjpqCoUcmP+ysKBWwhMrhj\nvsb3WCL7zBeSYJb8+unp1y0De+J0u1yHrkR59bxGTVKHVGcM7t2NovtGTYyW7pph\nk8ElS9eZuic8xr7gEW04tDp74+/PN+gl5B4CZ6JPJqFIyF7eSnhsFZ/MNcTqDpTY\n7A8vqHTfjwGo5vqFwNxMa18Mee0U227mWXXI8jYwAo5qaxynCnFRalUxS1wCctFb\nLLxdbJnxIJvTuQFxcHtzhAjagBzeJH2WFO3uVt9oia95r3rzDOO4oZFPgWy3I7fS\nTUKZ9s2VBDJSLaux5kmF3yffraqQ7ZM4o/Gw2oUsBA==\n-----END CERTIFICATE-----\n</ca>\n', '1234', '2026-04-10 03:37:04', 0),
(3, 'Server 2 (Pilot Test)', 'Taiwan, China', 'vpn.abc.com', 22, 1194, NULL, 0.00, 0, '2026-04-08 22:13:56', '1234%^&*ab', 'user nobody\ngroup nogroup\ndev tun\nnobind\nclient\nremote 192.168.1.1 1194 udp\nauth-nocache\nremote-cert-tls server\n<tls-crypt-v2>\n-----BEGIN OpenVPN tls-crypt-v2 client key-----\nmN8Vce0R3MReyjQOFphxJTBIVIROunmODVVCVlYd4H0pLtSWUaaTDUs3tYc/0J5s\nvPntIqBLHO2hJsgmg7BdZe/qnXCbL/Hfe3frcxF1GhrosXoxjp8uw9KaT0kpUwoY\nzLoEDoddlxpcYlahfKtztIRkrn2h7hYZaNuhScLlCIMs8Kg5Hq+duaeSbhvt2w+m\nM9cgD2/PxW6TLg8NACNAFSjVdtNmJ1lk+w3DYa21aJc3NJajM/IdtrkAcR+p6gU+\nssOVC1vNeNjdLnGm0c5nKqNcmY9+uS0RU8+DKOGbBK7dnozMYqcvib8L8co2Om56\n5ASiLiOnNpttbSpbn9UK2JvgHoLQoG5ImjpmuPJc9t787+AaE56Q79FURuXbIvyb\n1bBBe1Q4VgR7KLl326df6LqY6/48TL7ELoS+5/744VVlrd4FNuF7ktPC7Wt8Nu23\n1iYSXynjPnrlRauXJ83qEuB0kzxSdrWQhdZx4Y8RU7XUgbqkaKGxEvzLCN/iXg/G\nZ5lSkMVd4yzsYGOGwWdl9cxyHRnEHGOTakNmEwBzFAaTFZazOSm02SJ7GnugE4PF\nKeZz8Uk4ujKz3SJRJFHVe6G3n9qwcEa1fx3i5dYYKvnmKpnExdTMWN6IOAOFuM6R\nkDJcAwrt1bMpGBwdAkALEiqCFFrRkOZCwSHSwOMzP6f27mkHqALo4PVaGO+gO+cD\nwnC+W4FXCgtDS1qZwv2wM0Ye+2vSAM1iaQEr\n-----END OpenVPN tls-crypt-v2 client key-----\n</tls-crypt-v2>\n<key>\n-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDnI4l3rsJXwcyg\nAcCpC+U94Z+84sx8YD7JDP2PiwmqCI7V8XXSkXiExrFQTKTMepE/ZzSxV4Cz2+Es\nExr3r8qAA3qGBHW31CdYd662TVWG+Swyeb5l2EVUB4fEfpN4hUOXZdTYj73VfVFJ\nwshnCVncAQrjuWEh5yZKwvvSJaVn+bpBK2C8ObspqsouUGH3IjRpdIugNbI3r6+b\nnECqFuZW5hKomUEv+U8eBnFtBN/FegtehdMgh1vFiOGxO0m84/o3WlUhhu78y8Wn\nyKH6cONiaaW9HZjWOigzzY/UGFg8+xRCe8LxdqU4u5Qul7vqn5qmKNsb3PxkUSnk\nijj85a6pAgMBAAECggEABDbuq8MBAi6jd4twouR3oqA5lG0iQ2ZR3sKg4PwtCe+s\nAxSrDFLgurMQyqELJDtb6KcOG+m3jBAHVBFpHXkUHS9zDXyJVPfGW+OayPIyDAsB\nFk6H/T1rTjPw8tFICRuM9vbBYc2FLZ5iXBD0LITMIanXM/3OWprnZNeXVeaf1Hx9\nWz1bXB77N5Yt14tMntK+WXolHcX+/sC2fscKSo/imYWZ5hK6qHcHSd3QzZa5x4uz\nXjte6eTqMCggKZpkRGPjY+y5Og4k3Jk4vXYm8m2Niq39IOeLvBhKJAg4j1MMj2gF\nunua4q0a47qyX1APiIZoo9VB3JhprJqRAFKS7AuVAQKBgQD85Jhp2GUDrHFiDqpS\nl64DgHcG6Wxl6kOk9dCkfnrw7NpNQI/dEG609DOQGRA6fDqAb5dxgoSGlpjJMeuE\ngp4NWAoxY8p+KgE/soglzVen/+0IKX6FJ1IaZOqc8o99Kk1GPvw3WtPmk5jCtmt2\nxZf32vqJAtG6SIYqSl0YRxDi4QKBgQDp+oUgIhj7fcg0IELWk6Wj5vTSftlqIjYA\n5wUCA0wEiX6BkQiXfvBpjnzVB8rK7occ1ew1NzgoSaYejcKfkhKO3gDX89sXwrTQ\nXL8BTOlAefAf2VCIg2nTCpP8nln3CfwuvE3EFXWi1Mhko/8Z9bLEYBcJFA7Xon1R\nrLDTByEMyQKBgENg0G7a9cbtyeO7Tovk17sdHhlcVcItkUpBKA67mBvarysH+YyH\nlUdnDNnmo5lBggC4OpxGjvKg6yInx70tY9jgTQ7trITCwkRrV7Tiqekb2dZj386w\nNELOAmhAhBRwEdiWbXJ+I5j6WCgAnE8vxBaIZFnew2wjaIOZ/oW6YXhhAoGBALAC\neKqXe9uT30r3CdCI+Q2262x9Z+fjHGTJZIcDG+g91iB5jdEI+KkvOtC2L+NAU/tp\nIWtWwrPr0z8gvMt1AujeMBxDoQjau1ISssyzorOSBwSuYVqQIMdVKcXbCSpBJKez\nl3xt+DQphSXQCFLq9TOsZSe7Iv8riMIr+kiFEGOhAoGAcVTHoaG6i/iXXx2Z2JcL\nPFKGQcskoz8c6gsOoM9ZEWrMMOT4Ncl5QzN7wh1wLTHde8ZOI07dGVDmCFWG5CKC\n5cVYRCS1wqoXUNC6+hrOupWfdjZSqKzvVXpVf5MN6W0wGbRaS1ar2XrkorILE4kI\nhY2QR3w1ZQaijJ2cBtEC50I=\n-----END PRIVATE KEY-----\n</key>\n<cert>\n-----BEGIN CERTIFICATE-----\nMIIDVDCCAjygAwIBAgIQNfGOo3TLWR7CIymZqG91gjANBgkqhkiG9w0BAQsFADAW\nMRQwEgYDVQQDDAtFYXN5LVJTQSBDQTAeFw0yNjA0MDgxNzU1MDhaFw0zNjA0MDUx\nNzU1MDhaMBExDzANBgNVBAMMBmNsaWVudDCCASIwDQYJKoZIhvcNAQEBBQADggEP\nADCCAQoCggEBAOcjiXeuwlfBzKABwKkL5T3hn7zizHxgPskM/Y+LCaoIjtXxddKR\neITGsVBMpMx6kT9nNLFXgLPb4SwTGvevyoADeoYEdbfUJ1h3rrZNVYb5LDJ5vmXY\nRVQHh8R+k3iFQ5dl1NiPvdV9UUnCyGcJWdwBCuO5YSHnJkrC+9IlpWf5ukErYLw5\nuymqyi5QYfciNGl0i6A1sjevr5ucQKoW5lbmEqiZQS/5Tx4GcW0E38V6C16F0yCH\nW8WI4bE7Sbzj+jdaVSGG7vzLxafIofpw42Jppb0dmNY6KDPNj9QYWDz7FEJ7wvF2\npTi7lC6Xu+qfmqYo2xvc/GRRKeSKOPzlrqkCAwEAAaOBojCBnzAJBgNVHRMEAjAA\nMB0GA1UdDgQWBBQ/o7QsXtLbIUscEMwi2YvpfD1wyjBRBgNVHSMESjBIgBQaT5bg\n3GwqT1XA80RUnO1pfcDeFKEapBgwFjEUMBIGA1UEAwwLRWFzeS1SU0EgQ0GCFARS\nUDhdErRd8p3pGZTlAWsFy02uMBMGA1UdJQQMMAoGCCsGAQUFBwMCMAsGA1UdDwQE\nAwIHgDANBgkqhkiG9w0BAQsFAAOCAQEAvzr7kO4+UUilil3xnOm++y8dIa66vlgi\nn8UG4mL3YQvO8SvcIHMUCHHJEVF4GuZcqF1iFB8vF8HCPRnyR9OMBzhRkzbwTDLT\n+gj/STUheylKPTUa935EIJI4vl78Zs1j+/5NNPGqZOkmRoqD18lvXm/1o3w4PSug\n6JpZg92ep1/Y45Q42RbFrcfWuIs7KjEUIY7q1Y/+OGR9jbyc4vcQ7feUOe2DfrQO\nqZ9/s5PXc4iekEzGnva+CpQlf2znju0K70idZnW495g/XLjayoryA4LkrJqmGgoH\ng7QqkbcL59j8jPGKqHlq7twHgUHFtw1QfGyQx9y7Yvs8HDqzbybNbQ==\n-----END CERTIFICATE-----\n</cert>\n<ca>\n-----BEGIN CERTIFICATE-----\nMIIDSzCCAjOgAwIBAgIUBFJQOF0StF3ynekZlOUBawXLTa4wDQYJKoZIhvcNAQEL\nBQAwFjEUMBIGA1UEAwwLRWFzeS1SU0EgQ0EwHhcNMjYwNDA4MTc1NDExWhcNMzYw\nNDA1MTc1NDExWjAWMRQwEgYDVQQDDAtFYXN5LVJTQSBDQTCCASIwDQYJKoZIhvcN\nAQEBBQADggEPADCCAQoCggEBANyQHqOMvzPdH6HeSO/6ajgMK6PFBTaBbpUpnZIS\nixVDzt04KFpO3dxw1FEyYy39a9KhspfRR6iPhRBQTaVzq/sjE7Z3pHZj2+5snoXH\nqoz3pJwl814Ui1ej17/AXELEjg+FSwsa0m+1uQsDBBYxji7TtKDEHfJZD+fKbCyW\nqeTkLcZmhxk7Fluf02Ks/+mZiGa/Tx5YM5HLsuT0Kb3D3KyD2RQKb+6l8ilGE5Gh\nhJANpNKOPPe3pzdO1tMRLcJITwMdb1aeaYk7I40D0FNmK+2e65L4tvR2cZjebmzF\nUVP38hrJtgL/CfD6yi2kWI5J9zE68D9A9dUwoHuNo6YQkuUCAwEAAaOBkDCBjTAM\nBgNVHRMEBTADAQH/MB0GA1UdDgQWBBQaT5bg3GwqT1XA80RUnO1pfcDeFDBRBgNV\nHSMESjBIgBQaT5bg3GwqT1XA80RUnO1pfcDeFKEapBgwFjEUMBIGA1UEAwwLRWFz\neS1SU0EgQ0GCFARSUDhdErRd8p3pGZTlAWsFy02uMAsGA1UdDwQEAwIBBjANBgkq\nhkiG9w0BAQsFAAOCAQEAco8oYfoBgEBAwbq5kB7JfaVjpqCoUcmP+ysKBWwhMrhj\nvsb3WCL7zBeSYJb8+unp1y0De+J0u1yHrkR59bxGTVKHVGcM7t2NovtGTYyW7pph\nk8ElS9eZuic8xr7gEW04tDp74+/PN+gl5B4CZ6JPJqFIyF7eSnhsFZ/MNcTqDpTY\n7A8vqHTfjwGo5vqFwNxMa18Mee0U227mWXXI8jYwAo5qaxynCnFRalUxS1wCctFb\nLLxdbJnxIJvTuQFxcHtzhAjagBzeJH2WFO3uVt9oia95r3rzDOO4oZFPgWy3I7fS\nTUKZ9s2VBDJSLaux5kmF3yffraqQ7ZM4o/Gw2oUsBA==\n-----END CERTIFICATE-----\n</ca>\n', '1234', '2026-04-10 20:36:25', 0),
(4, 'Shanghai China Mobile', 'China', '101.202.10.2', 22, 1194, NULL, 0.00, 0, '2026-04-09 06:42:01', '1234%^&*ab', 'user nobody\ngroup nogroup\ndev tun\nnobind\nclient\nremote 192.168.1.1 1194 udp\nauth-user-pass\nauth-nocache\nremote-cert-tls server\n<tls-crypt-v2>\n-----BEGIN OpenVPN tls-crypt-v2 client key-----\nmN8Vce0R3MReyjQOFphxJTBIVIROunmODVVCVlYd4H0pLtSWUaaTDUs3tYc/0J5s\nvPntIqBLHO2hJsgmg7BdZe/qnXCbL/Hfe3frcxF1GhrosXoxjp8uw9KaT0kpUwoY\nzLoEDoddlxpcYlahfKtztIRkrn2h7hYZaNuhScLlCIMs8Kg5Hq+duaeSbhvt2w+m\nM9cgD2/PxW6TLg8NACNAFSjVdtNmJ1lk+w3DYa21aJc3NJajM/IdtrkAcR+p6gU+\nssOVC1vNeNjdLnGm0c5nKqNcmY9+uS0RU8+DKOGbBK7dnozMYqcvib8L8co2Om56\n5ASiLiOnNpttbSpbn9UK2JvgHoLQoG5ImjpmuPJc9t787+AaE56Q79FURuXbIvyb\n1bBBe1Q4VgR7KLl326df6LqY6/48TL7ELoS+5/744VVlrd4FNuF7ktPC7Wt8Nu23\n1iYSXynjPnrlRauXJ83qEuB0kzxSdrWQhdZx4Y8RU7XUgbqkaKGxEvzLCN/iXg/G\nZ5lSkMVd4yzsYGOGwWdl9cxyHRnEHGOTakNmEwBzFAaTFZazOSm02SJ7GnugE4PF\nKeZz8Uk4ujKz3SJRJFHVe6G3n9qwcEa1fx3i5dYYKvnmKpnExdTMWN6IOAOFuM6R\nkDJcAwrt1bMpGBwdAkALEiqCFFrRkOZCwSHSwOMzP6f27mkHqALo4PVaGO+gO+cD\nwnC+W4FXCgtDS1qZwv2wM0Ye+2vSAM1iaQEr\n-----END OpenVPN tls-crypt-v2 client key-----\n</tls-crypt-v2>\n<key>\n-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDnI4l3rsJXwcyg\nAcCpC+U94Z+84sx8YD7JDP2PiwmqCI7V8XXSkXiExrFQTKTMepE/ZzSxV4Cz2+Es\nExr3r8qAA3qGBHW31CdYd662TVWG+Swyeb5l2EVUB4fEfpN4hUOXZdTYj73VfVFJ\nwshnCVncAQrjuWEh5yZKwvvSJaVn+bpBK2C8ObspqsouUGH3IjRpdIugNbI3r6+b\nnECqFuZW5hKomUEv+U8eBnFtBN/FegtehdMgh1vFiOGxO0m84/o3WlUhhu78y8Wn\nyKH6cONiaaW9HZjWOigzzY/UGFg8+xRCe8LxdqU4u5Qul7vqn5qmKNsb3PxkUSnk\nijj85a6pAgMBAAECggEABDbuq8MBAi6jd4twouR3oqA5lG0iQ2ZR3sKg4PwtCe+s\nAxSrDFLgurMQyqELJDtb6KcOG+m3jBAHVBFpHXkUHS9zDXyJVPfGW+OayPIyDAsB\nFk6H/T1rTjPw8tFICRuM9vbBYc2FLZ5iXBD0LITMIanXM/3OWprnZNeXVeaf1Hx9\nWz1bXB77N5Yt14tMntK+WXolHcX+/sC2fscKSo/imYWZ5hK6qHcHSd3QzZa5x4uz\nXjte6eTqMCggKZpkRGPjY+y5Og4k3Jk4vXYm8m2Niq39IOeLvBhKJAg4j1MMj2gF\nunua4q0a47qyX1APiIZoo9VB3JhprJqRAFKS7AuVAQKBgQD85Jhp2GUDrHFiDqpS\nl64DgHcG6Wxl6kOk9dCkfnrw7NpNQI/dEG609DOQGRA6fDqAb5dxgoSGlpjJMeuE\ngp4NWAoxY8p+KgE/soglzVen/+0IKX6FJ1IaZOqc8o99Kk1GPvw3WtPmk5jCtmt2\nxZf32vqJAtG6SIYqSl0YRxDi4QKBgQDp+oUgIhj7fcg0IELWk6Wj5vTSftlqIjYA\n5wUCA0wEiX6BkQiXfvBpjnzVB8rK7occ1ew1NzgoSaYejcKfkhKO3gDX89sXwrTQ\nXL8BTOlAefAf2VCIg2nTCpP8nln3CfwuvE3EFXWi1Mhko/8Z9bLEYBcJFA7Xon1R\nrLDTByEMyQKBgENg0G7a9cbtyeO7Tovk17sdHhlcVcItkUpBKA67mBvarysH+YyH\nlUdnDNnmo5lBggC4OpxGjvKg6yInx70tY9jgTQ7trITCwkRrV7Tiqekb2dZj386w\nNELOAmhAhBRwEdiWbXJ+I5j6WCgAnE8vxBaIZFnew2wjaIOZ/oW6YXhhAoGBALAC\neKqXe9uT30r3CdCI+Q2262x9Z+fjHGTJZIcDG+g91iB5jdEI+KkvOtC2L+NAU/tp\nIWtWwrPr0z8gvMt1AujeMBxDoQjau1ISssyzorOSBwSuYVqQIMdVKcXbCSpBJKez\nl3xt+DQphSXQCFLq9TOsZSe7Iv8riMIr+kiFEGOhAoGAcVTHoaG6i/iXXx2Z2JcL\nPFKGQcskoz8c6gsOoM9ZEWrMMOT4Ncl5QzN7wh1wLTHde8ZOI07dGVDmCFWG5CKC\n5cVYRCS1wqoXUNC6+hrOupWfdjZSqKzvVXpVf5MN6W0wGbRaS1ar2XrkorILE4kI\nhY2QR3w1ZQaijJ2cBtEC50I=\n-----END PRIVATE KEY-----\n</key>\n<cert>\n-----BEGIN CERTIFICATE-----\nMIIDVDCCAjygAwIBAgIQNfGOo3TLWR7CIymZqG91gjANBgkqhkiG9w0BAQsFADAW\nMRQwEgYDVQQDDAtFYXN5LVJTQSBDQTAeFw0yNjA0MDgxNzU1MDhaFw0zNjA0MDUx\nNzU1MDhaMBExDzANBgNVBAMMBmNsaWVudDCCASIwDQYJKoZIhvcNAQEBBQADggEP\nADCCAQoCggEBAOcjiXeuwlfBzKABwKkL5T3hn7zizHxgPskM/Y+LCaoIjtXxddKR\neITGsVBMpMx6kT9nNLFXgLPb4SwTGvevyoADeoYEdbfUJ1h3rrZNVYb5LDJ5vmXY\nRVQHh8R+k3iFQ5dl1NiPvdV9UUnCyGcJWdwBCuO5YSHnJkrC+9IlpWf5ukErYLw5\nuymqyi5QYfciNGl0i6A1sjevr5ucQKoW5lbmEqiZQS/5Tx4GcW0E38V6C16F0yCH\nW8WI4bE7Sbzj+jdaVSGG7vzLxafIofpw42Jppb0dmNY6KDPNj9QYWDz7FEJ7wvF2\npTi7lC6Xu+qfmqYo2xvc/GRRKeSKOPzlrqkCAwEAAaOBojCBnzAJBgNVHRMEAjAA\nMB0GA1UdDgQWBBQ/o7QsXtLbIUscEMwi2YvpfD1wyjBRBgNVHSMESjBIgBQaT5bg\n3GwqT1XA80RUnO1pfcDeFKEapBgwFjEUMBIGA1UEAwwLRWFzeS1SU0EgQ0GCFARS\nUDhdErRd8p3pGZTlAWsFy02uMBMGA1UdJQQMMAoGCCsGAQUFBwMCMAsGA1UdDwQE\nAwIHgDANBgkqhkiG9w0BAQsFAAOCAQEAvzr7kO4+UUilil3xnOm++y8dIa66vlgi\nn8UG4mL3YQvO8SvcIHMUCHHJEVF4GuZcqF1iFB8vF8HCPRnyR9OMBzhRkzbwTDLT\n+gj/STUheylKPTUa935EIJI4vl78Zs1j+/5NNPGqZOkmRoqD18lvXm/1o3w4PSug\n6JpZg92ep1/Y45Q42RbFrcfWuIs7KjEUIY7q1Y/+OGR9jbyc4vcQ7feUOe2DfrQO\nqZ9/s5PXc4iekEzGnva+CpQlf2znju0K70idZnW495g/XLjayoryA4LkrJqmGgoH\ng7QqkbcL59j8jPGKqHlq7twHgUHFtw1QfGyQx9y7Yvs8HDqzbybNbQ==\n-----END CERTIFICATE-----\n</cert>\n<ca>\n-----BEGIN CERTIFICATE-----\nMIIDSzCCAjOgAwIBAgIUBFJQOF0StF3ynekZlOUBawXLTa4wDQYJKoZIhvcNAQEL\nBQAwFjEUMBIGA1UEAwwLRWFzeS1SU0EgQ0EwHhcNMjYwNDA4MTc1NDExWhcNMzYw\nNDA1MTc1NDExWjAWMRQwEgYDVQQDDAtFYXN5LVJTQSBDQTCCASIwDQYJKoZIhvcN\nAQEBBQADggEPADCCAQoCggEBANyQHqOMvzPdH6HeSO/6ajgMK6PFBTaBbpUpnZIS\nixVDzt04KFpO3dxw1FEyYy39a9KhspfRR6iPhRBQTaVzq/sjE7Z3pHZj2+5snoXH\nqoz3pJwl814Ui1ej17/AXELEjg+FSwsa0m+1uQsDBBYxji7TtKDEHfJZD+fKbCyW\nqeTkLcZmhxk7Fluf02Ks/+mZiGa/Tx5YM5HLsuT0Kb3D3KyD2RQKb+6l8ilGE5Gh\nhJANpNKOPPe3pzdO1tMRLcJITwMdb1aeaYk7I40D0FNmK+2e65L4tvR2cZjebmzF\nUVP38hrJtgL/CfD6yi2kWI5J9zE68D9A9dUwoHuNo6YQkuUCAwEAAaOBkDCBjTAM\nBgNVHRMEBTADAQH/MB0GA1UdDgQWBBQaT5bg3GwqT1XA80RUnO1pfcDeFDBRBgNV\nHSMESjBIgBQaT5bg3GwqT1XA80RUnO1pfcDeFKEapBgwFjEUMBIGA1UEAwwLRWFz\neS1SU0EgQ0GCFARSUDhdErRd8p3pGZTlAWsFy02uMAsGA1UdDwQEAwIBBjANBgkq\nhkiG9w0BAQsFAAOCAQEAco8oYfoBgEBAwbq5kB7JfaVjpqCoUcmP+ysKBWwhMrhj\nvsb3WCL7zBeSYJb8+unp1y0De+J0u1yHrkR59bxGTVKHVGcM7t2NovtGTYyW7pph\nk8ElS9eZuic8xr7gEW04tDp74+/PN+gl5B4CZ6JPJqFIyF7eSnhsFZ/MNcTqDpTY\n7A8vqHTfjwGo5vqFwNxMa18Mee0U227mWXXI8jYwAo5qaxynCnFRalUxS1wCctFb\nLLxdbJnxIJvTuQFxcHtzhAjagBzeJH2WFO3uVt9oia95r3rzDOO4oZFPgWy3I7fS\nTUKZ9s2VBDJSLaux5kmF3yffraqQ7ZM4o/Gw2oUsBA==\n-----END CERTIFICATE-----\n</ca>\n', '1234', NULL, 0),
(5, 'Olivia Lanzhou', 'China', 'example1.freedns.org', 22, 1194, NULL, 0.00, 0, '2026-04-09 18:19:45', '1234', 'client\ndev tun\nproto udp\nremote china.privacy.network 1197\nresolv-retry infinite\nnobind\npersist-key\npersist-tun\ncipher aes-256-cbc\nauth sha256\ntls-client\nremote-cert-tls server\n\nauth-user-pass\ncompress\nverb 1\nreneg-sec 0\n\n<ca>\n-----BEGIN CERTIFICATE-----\nMIIHqzCCBZOgAwIBAgIJAJ0u+vODZJntMA0GCSqGSIb3DQEBDQUAMIHoMQswCQYD\nVQQGEwJVUzELMAkGA1UECBMCQ0ExEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNV\nBAoTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIElu\ndGVybmV0IEFjY2VzczEgMB4GA1UEAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3Mx\nIDAeBgNVBCkTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkB\nFiBzZWN1cmVAcHJpdmF0ZWludGVybmV0YWNjZXNzLmNvbTAeFw0xNDA0MTcxNzQw\nMzNaFw0zNDA0MTIxNzQwMzNaMIHoMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0Ex\nEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNVBAoTF1ByaXZhdGUgSW50ZXJuZXQg\nQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UE\nAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3MxIDAeBgNVBCkTF1ByaXZhdGUgSW50\nZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkBFiBzZWN1cmVAcHJpdmF0ZWludGVy\nbmV0YWNjZXNzLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALVk\nhjumaqBbL8aSgj6xbX1QPTfTd1qHsAZd2B97m8Vw31c/2yQgZNf5qZY0+jOIHULN\nDe4R9TIvyBEbvnAg/OkPw8n/+ScgYOeH876VUXzjLDBnDb8DLr/+w9oVsuDeFJ9K\nV2UFM1OYX0SnkHnrYAN2QLF98ESK4NCSU01h5zkcgmQ+qKSfA9Ny0/UpsKPBFqsQ\n25NvjDWFhCpeqCHKUJ4Be27CDbSl7lAkBuHMPHJs8f8xPgAbHRXZOxVCpayZ2SND\nfCwsnGWpWFoMGvdMbygngCn6jA/W1VSFOlRlfLuuGe7QFfDwA0jaLCxuWt/BgZyl\np7tAzYKR8lnWmtUCPm4+BtjyVDYtDCiGBD9Z4P13RFWvJHw5aapx/5W/CuvVyI7p\nKwvc2IT+KPxCUhH1XI8ca5RN3C9NoPJJf6qpg4g0rJH3aaWkoMRrYvQ+5PXXYUzj\ntRHImghRGd/ydERYoAZXuGSbPkm9Y/p2X8unLcW+F0xpJD98+ZI+tzSsI99Zs5wi\njSUGYr9/j18KHFTMQ8n+1jauc5bCCegN27dPeKXNSZ5riXFL2XX6BkY68y58UaNz\nmeGMiUL9BOV1iV+PMb7B7PYs7oFLjAhh0EdyvfHkrh/ZV9BEhtFa7yXp8XR0J6vz\n1YV9R6DYJmLjOEbhU8N0gc3tZm4Qz39lIIG6w3FDAgMBAAGjggFUMIIBUDAdBgNV\nHQ4EFgQUrsRtyWJftjpdRM0+925Y6Cl08SUwggEfBgNVHSMEggEWMIIBEoAUrsRt\nyWJftjpdRM0+925Y6Cl08SWhge6kgeswgegxCzAJBgNVBAYTAlVTMQswCQYDVQQI\nEwJDQTETMBEGA1UEBxMKTG9zQW5nZWxlczEgMB4GA1UEChMXUHJpdmF0ZSBJbnRl\ncm5ldCBBY2Nlc3MxIDAeBgNVBAsTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAw\nHgYDVQQDExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UEKRMXUHJpdmF0\nZSBJbnRlcm5ldCBBY2Nlc3MxLzAtBgkqhkiG9w0BCQEWIHNlY3VyZUBwcml2YXRl\naW50ZXJuZXRhY2Nlc3MuY29tggkAnS7684Nkme0wDAYDVR0TBAUwAwEB/zANBgkq\nhkiG9w0BAQ0FAAOCAgEAJsfhsPk3r8kLXLxY+v+vHzbr4ufNtqnL9/1Uuf8NrsCt\npXAoyZ0YqfbkWx3NHTZ7OE9ZRhdMP/RqHQE1p4N4Sa1nZKhTKasV6KhHDqSCt/dv\nEm89xWm2MVA7nyzQxVlHa9AkcBaemcXEiyT19XdpiXOP4Vhs+J1R5m8zQOxZlV1G\ntF9vsXmJqWZpOVPmZ8f35BCsYPvv4yMewnrtAC8PFEK/bOPeYcKN50bol22QYaZu\nLfpkHfNiFTnfMh8sl/ablPyNY7DUNiP5DRcMdIwmfGQxR5WEQoHL3yPJ42LkB5zs\n6jIm26DGNXfwura/mi105+ENH1CaROtRYwkiHb08U6qLXXJz80mWJkT90nr8Asj3\n5xN2cUppg74nG3YVav/38P48T56hG1NHbYF5uOCske19F6wi9maUoto/3vEr0rnX\nJUp2KODmKdvBI7co245lHBABWikk8VfejQSlCtDBXn644ZMtAdoxKNfR2WTFVEwJ\niyd1Fzx0yujuiXDROLhISLQDRjVVAvawrAtLZWYK31bY7KlezPlQnl/D9Asxe85l\n8jO5+0LdJ6VyOs/Hd4w52alDW/MFySDZSfQHMTIc30hLBJ8OnCEIvluVQQ2UQvoW\n+no177N9L2Y+M9TcTA62ZyMXShHQGeh20rb4kK8f+iFX8NxtdHVSkxMEFSfDDyQ=\n-----END CERTIFICATE-----\n</ca>\n\ndisable-occ\n', '1234', NULL, 0),
(6, 'Olivia Nanchong', 'China', 'example1.freedns.org', 22, 1194, NULL, 0.00, 0, '2026-04-09 19:04:57', '1234', 'client\ndev tun\nproto udp\nremote china.privacy.network 1197\nresolv-retry infinite\nnobind\npersist-key\npersist-tun\ncipher aes-256-cbc\nauth sha256\ntls-client\nremote-cert-tls server\n\nauth-user-pass\ncompress\nverb 1\nreneg-sec 0\n\n<ca>\n-----BEGIN CERTIFICATE-----\nMIIHqzCCBZOgAwIBAgIJAJ0u+vODZJntMA0GCSqGSIb3DQEBDQUAMIHoMQswCQYD\nVQQGEwJVUzELMAkGA1UECBMCQ0ExEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNV\nBAoTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIElu\ndGVybmV0IEFjY2VzczEgMB4GA1UEAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3Mx\nIDAeBgNVBCkTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkB\nFiBzZWN1cmVAcHJpdmF0ZWludGVybmV0YWNjZXNzLmNvbTAeFw0xNDA0MTcxNzQw\nMzNaFw0zNDA0MTIxNzQwMzNaMIHoMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0Ex\nEzARBgNVBAcTCkxvc0FuZ2VsZXMxIDAeBgNVBAoTF1ByaXZhdGUgSW50ZXJuZXQg\nQWNjZXNzMSAwHgYDVQQLExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UE\nAxMXUHJpdmF0ZSBJbnRlcm5ldCBBY2Nlc3MxIDAeBgNVBCkTF1ByaXZhdGUgSW50\nZXJuZXQgQWNjZXNzMS8wLQYJKoZIhvcNAQkBFiBzZWN1cmVAcHJpdmF0ZWludGVy\nbmV0YWNjZXNzLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALVk\nhjumaqBbL8aSgj6xbX1QPTfTd1qHsAZd2B97m8Vw31c/2yQgZNf5qZY0+jOIHULN\nDe4R9TIvyBEbvnAg/OkPw8n/+ScgYOeH876VUXzjLDBnDb8DLr/+w9oVsuDeFJ9K\nV2UFM1OYX0SnkHnrYAN2QLF98ESK4NCSU01h5zkcgmQ+qKSfA9Ny0/UpsKPBFqsQ\n25NvjDWFhCpeqCHKUJ4Be27CDbSl7lAkBuHMPHJs8f8xPgAbHRXZOxVCpayZ2SND\nfCwsnGWpWFoMGvdMbygngCn6jA/W1VSFOlRlfLuuGe7QFfDwA0jaLCxuWt/BgZyl\np7tAzYKR8lnWmtUCPm4+BtjyVDYtDCiGBD9Z4P13RFWvJHw5aapx/5W/CuvVyI7p\nKwvc2IT+KPxCUhH1XI8ca5RN3C9NoPJJf6qpg4g0rJH3aaWkoMRrYvQ+5PXXYUzj\ntRHImghRGd/ydERYoAZXuGSbPkm9Y/p2X8unLcW+F0xpJD98+ZI+tzSsI99Zs5wi\njSUGYr9/j18KHFTMQ8n+1jauc5bCCegN27dPeKXNSZ5riXFL2XX6BkY68y58UaNz\nmeGMiUL9BOV1iV+PMb7B7PYs7oFLjAhh0EdyvfHkrh/ZV9BEhtFa7yXp8XR0J6vz\n1YV9R6DYJmLjOEbhU8N0gc3tZm4Qz39lIIG6w3FDAgMBAAGjggFUMIIBUDAdBgNV\nHQ4EFgQUrsRtyWJftjpdRM0+925Y6Cl08SUwggEfBgNVHSMEggEWMIIBEoAUrsRt\nyWJftjpdRM0+925Y6Cl08SWhge6kgeswgegxCzAJBgNVBAYTAlVTMQswCQYDVQQI\nEwJDQTETMBEGA1UEBxMKTG9zQW5nZWxlczEgMB4GA1UEChMXUHJpdmF0ZSBJbnRl\ncm5ldCBBY2Nlc3MxIDAeBgNVBAsTF1ByaXZhdGUgSW50ZXJuZXQgQWNjZXNzMSAw\nHgYDVQQDExdQcml2YXRlIEludGVybmV0IEFjY2VzczEgMB4GA1UEKRMXUHJpdmF0\nZSBJbnRlcm5ldCBBY2Nlc3MxLzAtBgkqhkiG9w0BCQEWIHNlY3VyZUBwcml2YXRl\naW50ZXJuZXRhY2Nlc3MuY29tggkAnS7684Nkme0wDAYDVR0TBAUwAwEB/zANBgkq\nhkiG9w0BAQ0FAAOCAgEAJsfhsPk3r8kLXLxY+v+vHzbr4ufNtqnL9/1Uuf8NrsCt\npXAoyZ0YqfbkWx3NHTZ7OE9ZRhdMP/RqHQE1p4N4Sa1nZKhTKasV6KhHDqSCt/dv\nEm89xWm2MVA7nyzQxVlHa9AkcBaemcXEiyT19XdpiXOP4Vhs+J1R5m8zQOxZlV1G\ntF9vsXmJqWZpOVPmZ8f35BCsYPvv4yMewnrtAC8PFEK/bOPeYcKN50bol22QYaZu\nLfpkHfNiFTnfMh8sl/ablPyNY7DUNiP5DRcMdIwmfGQxR5WEQoHL3yPJ42LkB5zs\n6jIm26DGNXfwura/mi105+ENH1CaROtRYwkiHb08U6qLXXJz80mWJkT90nr8Asj3\n5xN2cUppg74nG3YVav/38P48T56hG1NHbYF5uOCske19F6wi9maUoto/3vEr0rnX\nJUp2KODmKdvBI7co245lHBABWikk8VfejQSlCtDBXn644ZMtAdoxKNfR2WTFVEwJ\niyd1Fzx0yujuiXDROLhISLQDRjVVAvawrAtLZWYK31bY7KlezPlQnl/D9Asxe85l\n8jO5+0LdJ6VyOs/Hd4w52alDW/MFySDZSfQHMTIc30hLBJ8OnCEIvluVQQ2UQvoW\n+no177N9L2Y+M9TcTA62ZyMXShHQGeh20rb4kK8f+iFX8NxtdHVSkxMEFSfDDyQ=\n-----END CERTIFICATE-----\n</ca>\n\ndisable-occ\n', '1234', NULL, 0);

--
-- 已倾印数据表的索引
--

--
-- 数据表索引 `access_logs`
--
ALTER TABLE `access_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `router_id` (`router_id`);

--
-- 数据表索引 `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- 数据表索引 `pending_routers`
--
ALTER TABLE `pending_routers`
  ADD PRIMARY KEY (`id`);

--
-- 数据表索引 `routers`
--
ALTER TABLE `routers`
  ADD PRIMARY KEY (`id`);

--
-- 在倾印的数据表使用自动递增(AUTO_INCREMENT)
--

--
-- 使用数据表自动递增(AUTO_INCREMENT) `access_logs`
--
ALTER TABLE `access_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用数据表自动递增(AUTO_INCREMENT) `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用数据表自动递增(AUTO_INCREMENT) `pending_routers`
--
ALTER TABLE `pending_routers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用数据表自动递增(AUTO_INCREMENT) `routers`
--
ALTER TABLE `routers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 已倾印数据表的限制式
--

--
-- 数据表的限制式 `access_logs`
--
ALTER TABLE `access_logs`
  ADD CONSTRAINT `access_logs_ibfk_1` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;