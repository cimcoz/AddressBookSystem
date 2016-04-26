-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-04-26 10:05:25
-- 服务器版本： 5.7.9
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `java_contact`
--

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `groups`
--

INSERT INTO `groups` (`id`, `user_id`, `name`) VALUES
(1, 1, '分组1'),
(2, 1, '分组1'),
(3, 1, '分组1'),
(4, 1, '分组1'),
(5, 1, '分组1'),
(6, 1, '分组1'),
(7, 1, '分组1'),
(8, 2, '分组2'),
(9, 2, '分组2'),
(10, 2, '分组2'),
(11, 2, '分组2'),
(12, 2, '分组2'),
(13, 2, '分组2'),
(14, 2, '分组2');

-- --------------------------------------------------------

--
-- 表的结构 `groups_record`
--

DROP TABLE IF EXISTS `groups_record`;
CREATE TABLE IF NOT EXISTS `groups_record` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `phone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_record_user_id_index` (`user_id`),
  KEY `groups_record_group_id_index` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `groups_record`
--

INSERT INTO `groups_record` (`id`, `user_id`, `group_id`, `phone_id`) VALUES
(1, 1, 2, 1),
(2, 1, 3, 2),
(3, 1, 4, 3),
(4, 1, 5, 4),
(5, 1, 6, 5),
(6, 1, 7, 6),
(7, 1, 1, 7),
(8, 1, 2, 8),
(9, 1, 3, 9),
(10, 1, 4, 10),
(11, 1, 5, 11),
(12, 1, 6, 12),
(13, 1, 7, 13),
(14, 1, 1, 14),
(15, 1, 2, 15),
(16, 1, 3, 16),
(17, 1, 4, 17),
(18, 1, 5, 18),
(19, 1, 6, 19),
(20, 1, 7, 20),
(21, 2, 8, 21),
(22, 2, 9, 22),
(23, 2, 10, 23),
(24, 2, 11, 24),
(25, 2, 12, 25),
(26, 2, 13, 26),
(27, 2, 14, 27),
(28, 2, 8, 28),
(29, 2, 9, 29),
(30, 2, 10, 30),
(31, 2, 11, 31),
(32, 2, 12, 32),
(33, 2, 13, 33),
(34, 2, 14, 34),
(35, 2, 8, 35),
(36, 2, 9, 36),
(37, 2, 10, 37),
(38, 2, 11, 38),
(39, 2, 12, 39),
(40, 2, 13, 40);

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`, `id`) VALUES
('2016_04_23_130114_create_user_table', 1, 0),
('2016_04_23_130124_create_group_table', 1, 0),
('2016_04_23_130129_create_phone_table', 1, 0),
('2016_04_23_145705_create_table_groups_record', 1, 0),
('2016_04_23_153615_create_config_table', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `phone`
--

DROP TABLE IF EXISTS `phone`;
CREATE TABLE IF NOT EXISTS `phone` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `number2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pinyin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `QQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_page` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_user_id_index` (`user_id`),
  KEY `phone_number_index` (`number`),
  KEY `phone_name_index` (`name`),
  KEY `phone_pinyin_index` (`pinyin`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `phone`
--

INSERT INTO `phone` (`id`, `user_id`, `number`, `number2`, `name`, `pinyin`, `email`, `QQ`, `work_address`, `home_address`, `birthday`, `home_page`, `post_code`, `image`) VALUES
(1, 1, '18819259311', '36080711', '小李0', 'xiaoli0', 'example1@163.com', '272138111', '广州市天河区猎德大厦1号', '广州市天河区华南农业大学24栋', '1995-10-1', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(2, 1, '18819259312', '36080712', '小张0', 'xiaozhang0', 'example2@163.com', '272138112', '广州市天河区猎德大厦2号', '广州市天河区华南农业大学24栋', '1995-10-2', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(3, 1, '18819259313', '36080713', '小明0', 'xiaoming0', 'example3@163.com', '272138113', '广州市天河区猎德大厦3号', '广州市天河区华南农业大学24栋', '1995-10-3', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(4, 1, '18819259314', '36080714', '小江0', 'xiaojiang0', 'example4@163.com', '272138114', '广州市天河区猎德大厦4号', '广州市天河区华南农业大学24栋', '1995-10-4', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(5, 1, '18819259315', '36080715', '小王1', 'xiaowang1', 'example5@163.com', '272138115', '广州市天河区猎德大厦5号', '广州市天河区华南农业大学24栋', '1995-10-5', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(6, 1, '18819259316', '36080716', '小李1', 'xiaoli1', 'example6@163.com', '272138116', '广州市天河区猎德大厦6号', '广州市天河区华南农业大学24栋', '1995-10-6', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(7, 1, '18819259317', '36080717', '小张1', 'xiaozhang1', 'example7@163.com', '272138117', '广州市天河区猎德大厦7号', '广州市天河区华南农业大学24栋', '1995-10-7', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(8, 1, '18819259318', '36080718', '小明1', 'xiaoming1', 'example8@163.com', '272138118', '广州市天河区猎德大厦8号', '广州市天河区华南农业大学24栋', '1995-10-8', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(9, 1, '18819259319', '36080719', '小江1', 'xiaojiang1', 'example9@163.com', '272138119', '广州市天河区猎德大厦9号', '广州市天河区华南农业大学24栋', '1995-10-9', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(10, 1, '18819259320', '36080720', '小王2', 'xiaowang2', 'example10@163.com', '272138120', '广州市天河区猎德大厦10号', '广州市天河区华南农业大学24栋', '1995-10-10', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(11, 1, '18819259321', '36080721', '小李2', 'xiaoli2', 'example11@163.com', '272138121', '广州市天河区猎德大厦11号', '广州市天河区华南农业大学24栋', '1995-10-11', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(12, 1, '18819259322', '36080722', '小张2', 'xiaozhang2', 'example12@163.com', '272138122', '广州市天河区猎德大厦12号', '广州市天河区华南农业大学24栋', '1995-10-12', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(13, 1, '18819259323', '36080723', '小明2', 'xiaoming2', 'example13@163.com', '272138123', '广州市天河区猎德大厦13号', '广州市天河区华南农业大学24栋', '1995-10-13', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(14, 1, '18819259324', '36080724', '小江2', 'xiaojiang2', 'example14@163.com', '272138124', '广州市天河区猎德大厦14号', '广州市天河区华南农业大学24栋', '1995-10-14', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(15, 1, '18819259325', '36080725', '小王3', 'xiaowang3', 'example15@163.com', '272138125', '广州市天河区猎德大厦15号', '广州市天河区华南农业大学24栋', '1995-10-15', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(16, 1, '18819259326', '36080726', '小李3', 'xiaoli3', 'example16@163.com', '272138126', '广州市天河区猎德大厦16号', '广州市天河区华南农业大学24栋', '1995-10-16', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(17, 1, '18819259327', '36080727', '小张3', 'xiaozhang3', 'example17@163.com', '272138127', '广州市天河区猎德大厦17号', '广州市天河区华南农业大学24栋', '1995-10-17', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(18, 1, '18819259328', '36080728', '小明3', 'xiaoming3', 'example18@163.com', '272138128', '广州市天河区猎德大厦18号', '广州市天河区华南农业大学24栋', '1995-10-18', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(19, 1, '18819259329', '36080729', '小江3', 'xiaojiang3', 'example19@163.com', '272138129', '广州市天河区猎德大厦19号', '广州市天河区华南农业大学24栋', '1995-10-19', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(20, 1, '18819259330', '36080730', '小王4', 'xiaowang4', 'example20@163.com', '272138130', '广州市天河区猎德大厦20号', '广州市天河区华南农业大学24栋', '1995-10-20', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(21, 2, '18819259311', '36080711', '小李0', 'xiaoli0', 'example1@163.com', '272138111', '广州市天河区猎德大厦1号', '广州市天河区华南农业大学24栋', '1995-10-1', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(22, 2, '18819259312', '36080712', '小张0', 'xiaozhang0', 'example2@163.com', '272138112', '广州市天河区猎德大厦2号', '广州市天河区华南农业大学24栋', '1995-10-2', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(23, 2, '18819259313', '36080713', '小明0', 'xiaoming0', 'example3@163.com', '272138113', '广州市天河区猎德大厦3号', '广州市天河区华南农业大学24栋', '1995-10-3', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(24, 2, '18819259314', '36080714', '小江0', 'xiaojiang0', 'example4@163.com', '272138114', '广州市天河区猎德大厦4号', '广州市天河区华南农业大学24栋', '1995-10-4', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(25, 2, '18819259315', '36080715', '小王1', 'xiaowang1', 'example5@163.com', '272138115', '广州市天河区猎德大厦5号', '广州市天河区华南农业大学24栋', '1995-10-5', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(26, 2, '18819259316', '36080716', '小李1', 'xiaoli1', 'example6@163.com', '272138116', '广州市天河区猎德大厦6号', '广州市天河区华南农业大学24栋', '1995-10-6', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(27, 2, '18819259317', '36080717', '小张1', 'xiaozhang1', 'example7@163.com', '272138117', '广州市天河区猎德大厦7号', '广州市天河区华南农业大学24栋', '1995-10-7', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(28, 2, '18819259318', '36080718', '小明1', 'xiaoming1', 'example8@163.com', '272138118', '广州市天河区猎德大厦8号', '广州市天河区华南农业大学24栋', '1995-10-8', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(29, 2, '18819259319', '36080719', '小江1', 'xiaojiang1', 'example9@163.com', '272138119', '广州市天河区猎德大厦9号', '广州市天河区华南农业大学24栋', '1995-10-9', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(30, 2, '18819259320', '36080720', '小王2', 'xiaowang2', 'example10@163.com', '272138120', '广州市天河区猎德大厦10号', '广州市天河区华南农业大学24栋', '1995-10-10', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(31, 2, '18819259321', '36080721', '小李2', 'xiaoli2', 'example11@163.com', '272138121', '广州市天河区猎德大厦11号', '广州市天河区华南农业大学24栋', '1995-10-11', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(32, 2, '18819259322', '36080722', '小张2', 'xiaozhang2', 'example12@163.com', '272138122', '广州市天河区猎德大厦12号', '广州市天河区华南农业大学24栋', '1995-10-12', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(33, 2, '18819259323', '36080723', '小明2', 'xiaoming2', 'example13@163.com', '272138123', '广州市天河区猎德大厦13号', '广州市天河区华南农业大学24栋', '1995-10-13', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(34, 2, '18819259324', '36080724', '小江2', 'xiaojiang2', 'example14@163.com', '272138124', '广州市天河区猎德大厦14号', '广州市天河区华南农业大学24栋', '1995-10-14', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(35, 2, '18819259325', '36080725', '小王3', 'xiaowang3', 'example15@163.com', '272138125', '广州市天河区猎德大厦15号', '广州市天河区华南农业大学24栋', '1995-10-15', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(36, 2, '18819259326', '36080726', '小李3', 'xiaoli3', 'example16@163.com', '272138126', '广州市天河区猎德大厦16号', '广州市天河区华南农业大学24栋', '1995-10-16', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(37, 2, '18819259327', '36080727', '小张3', 'xiaozhang3', 'example17@163.com', '272138127', '广州市天河区猎德大厦17号', '广州市天河区华南农业大学24栋', '1995-10-17', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(38, 2, '18819259328', '36080728', '小明3', 'xiaoming3', 'example18@163.com', '272138128', '广州市天河区猎德大厦18号', '广州市天河区华南农业大学24栋', '1995-10-18', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(39, 2, '18819259329', '36080729', '小江3', 'xiaojiang3', 'example19@163.com', '272138129', '广州市天河区猎德大厦19号', '广州市天河区华南农业大学24栋', '1995-10-19', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(40, 2, '18819259330', '36080730', '小王4', 'xiaowang4', 'example20@163.com', '272138130', '广州市天河区猎德大厦20号', '广州市天河区华南农业大学24栋', '1995-10-20', 'kong36088.github.io/', '510642', '/uploads/head/head.jpg'),
(41, 1, '123456', '12345633', '小飞飞GG', 'xiaofeifeiGG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 1, '123456', '12345633', '小飞飞GG', 'xiaofeifeiGG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'test', '098f6bcd4621d373cade4e832627b4f6');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
