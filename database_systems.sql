-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 產生時間： 2018 年 11 月 20 日 11:06
-- 伺服器版本: 5.7.24-0ubuntu0.16.04.1
-- PHP 版本： 5.6.38-3+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `database_systems`
--
CREATE DATABASE IF NOT EXISTS `database_systems` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `database_systems`;

-- --------------------------------------------------------

--
-- 資料表結構 `Bars`
--

DROP TABLE IF EXISTS `Bars`;
CREATE TABLE `Bars` (
  `name` varchar(255) NOT NULL,
  `addr` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `Bars`
--

INSERT INTO `Bars` (`name`, `addr`, `license`) VALUES
('Joe\'s', 'Maple st.', '123'),
('Lendle', 'I Don\'t Know', '789'),
('Sue\'s', 'River\'s Rd.', '456');

-- --------------------------------------------------------

--
-- 資料表結構 `Beers`
--

DROP TABLE IF EXISTS `Beers`;
CREATE TABLE `Beers` (
  `name` varchar(255) NOT NULL,
  `manf` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `Beers`
--

INSERT INTO `Beers` (`name`, `manf`) VALUES
('Bud', 'Anheuser-Busch'),
('Bud Lite', 'Anheuser-Busch'),
('Michelob', 'Anheuser-Busch'),
('Miller', 'test');

-- --------------------------------------------------------

--
-- 資料表結構 `Drinkers`
--

DROP TABLE IF EXISTS `Drinkers`;
CREATE TABLE `Drinkers` (
  `name` varchar(255) NOT NULL,
  `addr` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `Drinkers`
--

INSERT INTO `Drinkers` (`name`, `addr`, `phone`) VALUES
('Fred', 'Test1', '1234');

-- --------------------------------------------------------

--
-- 資料表結構 `Employee`
--

DROP TABLE IF EXISTS `Employee`;
CREATE TABLE `Employee` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `bar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `Employee`
--

INSERT INTO `Employee` (`id`, `name`, `email`, `bar`) VALUES
('id1', 'name1', 'test@com.tw', 'Joe\'s'),
('id2', 'name2', 'test2@com.tw', 'Joe\'s');

-- --------------------------------------------------------

--
-- 資料表結構 `Frequents`
--

DROP TABLE IF EXISTS `Frequents`;
CREATE TABLE `Frequents` (
  `drinker` varchar(255) NOT NULL,
  `bar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `Likes`
--

DROP TABLE IF EXISTS `Likes`;
CREATE TABLE `Likes` (
  `drinker` varchar(255) NOT NULL,
  `beer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `Likes`
--

INSERT INTO `Likes` (`drinker`, `beer`) VALUES
('Fred', 'Bud'),
('Sally', 'Bud');

-- --------------------------------------------------------

--
-- 資料表結構 `Sells`
--

DROP TABLE IF EXISTS `Sells`;
CREATE TABLE `Sells` (
  `bar` varchar(255) NOT NULL,
  `beer` varchar(255) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `Sells`
--

INSERT INTO `Sells` (`bar`, `beer`, `price`) VALUES
('Joe\'s', 'Bud', 2.5),
('Joe\'s', 'Miller', 2.75),
('Lendle', 'Bud', 2),
('Sue\'s', 'Bud', 2.5),
('Sue\'s', 'Miller', 3);

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `Bars`
--
ALTER TABLE `Bars`
  ADD PRIMARY KEY (`name`);

--
-- 資料表索引 `Beers`
--
ALTER TABLE `Beers`
  ADD PRIMARY KEY (`name`);

--
-- 資料表索引 `Drinkers`
--
ALTER TABLE `Drinkers`
  ADD PRIMARY KEY (`name`);

--
-- 資料表索引 `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`bar`);

--
-- 資料表索引 `Frequents`
--
ALTER TABLE `Frequents`
  ADD PRIMARY KEY (`drinker`,`bar`);

--
-- 資料表索引 `Likes`
--
ALTER TABLE `Likes`
  ADD PRIMARY KEY (`drinker`,`beer`);

--
-- 資料表索引 `Sells`
--
ALTER TABLE `Sells`
  ADD PRIMARY KEY (`bar`,`beer`),
  ADD KEY `beer` (`beer`);

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`bar`) REFERENCES `Bars` (`name`);

--
-- 資料表的 Constraints `Sells`
--
ALTER TABLE `Sells`
  ADD CONSTRAINT `Sells_ibfk_1` FOREIGN KEY (`bar`) REFERENCES `Bars` (`name`),
  ADD CONSTRAINT `Sells_ibfk_2` FOREIGN KEY (`beer`) REFERENCES `Beers` (`name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
