-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 建立日期: 2015 年 04 月 18 日 11:10
-- 伺服器版本: 5.6.23
-- PHP 版本: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫: `citiarco_superun`
--

-- --------------------------------------------------------

--
-- 資料表結構 `adminstrator`
--

CREATE TABLE IF NOT EXISTS `adminstrator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `life` int(10) unsigned DEFAULT NULL,
  `auth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=55 ;

--
-- 資料表的匯出資料 `adminstrator`
--

INSERT INTO `adminstrator` (`id`, `life`, `auth`, `account`, `password`, `name`, `login_time`) VALUES
(1, 1, '0,', 'admin', 'enjoys', 'jimmy', '2013-08-19 13:47:21'),
(54, 1, '0,1,2,', 'superun', 's7591530', '張皓閔', '2012-12-11 16:30:45');

-- --------------------------------------------------------

--
-- 資料表結構 `auth_class`
--

CREATE TABLE IF NOT EXISTS `auth_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `page_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- 資料表的匯出資料 `auth_class`
--

INSERT INTO `auth_class` (`id`, `name`, `page_name`) VALUES
(1, '系統設定', 'system'),
(2, '動態訊息', 'news');

-- --------------------------------------------------------

--
-- 資料表結構 `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- 資料表的匯出資料 `language`
--

INSERT INTO `language` (`id`, `name`) VALUES
(1, '繁體中文');

-- --------------------------------------------------------

--
-- 資料表結構 `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(10) unsigned DEFAULT '1',
  `class_id` int(10) unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` text CHARACTER SET utf8,
  `news_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `show_front` int(10) unsigned DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hit` int(11) unsigned NOT NULL,
  `des` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `head` int(11) unsigned DEFAULT NULL,
  `keyword` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- 資料表的匯出資料 `news`
--

INSERT INTO `news` (`id`, `language_id`, `class_id`, `title`, `content`, `news_date`, `show_front`, `url`, `hit`, `des`, `head`, `keyword`) VALUES
(1, 1, 1, '歡迎來到Superun全壘打入口網站', '<p>\r\n	&nbsp;</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; color: rgb(102, 102, 102); font-family: ''LiHei Pro''; line-height: 24px;">\r\n	素有棒球王國美譽的台灣，擁有百年的棒球文化，國內棒球之風行，棒球熱潮席捲全國，不論是國際棒球賽事或是國內職棒，都是萬眾矚目，這股熱潮，連帶影響民間棒球打擊場林立，不論男女老少，都爭相恐後入場體驗棒球，體驗球員們的打擊樂趣，隨之棒球的普及，讓許多廠商投入運動周邊市場，更締造出上億的驚人商機，<strong style="margin: 0px; padding: 0px; border: 0px;">Superun全壘打歷經多年之研究，開發出專利型 高體感打擊機，不同一般陽春型打擊練習器材，我們整合多功能，提供高互動性機台，讓打擊者享有更高品質的打擊環境。</strong></p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; color: rgb(102, 102, 102); font-family: ''LiHei Pro''; line-height: 24px;">\r\n	有效的系統式整合，Superun全壘打除擁有實體店面，並提供完善的會員服務，完整的產銷一條龍服務，我們將提供經銷商、成功的superun全壘打經營經驗，快速複製，誠摯邀請您一同擊出成功紅不讓！</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; color: rgb(102, 102, 102); font-family: ''LiHei Pro''; line-height: 24px;">\r\n	<strong style="margin: 0px; padding: 0px; border: 0px;">各國代理、經銷、加盟、租賃請洽 張先生（0936-220-360）</strong></p>\r\n', '2012-10-10', 1, NULL, 0, NULL, NULL, 'Superun全壘打,棒球機,投球機,室內棒球機,首創棒球機'),
(2, 1, 2, '總積分競賽-Superun全壘打', NULL, '2012-06-22', 1, NULL, 0, '遊戲方式，由投球機投出，打擊者揮棒至各大分數打點，並累積分數進行遊戲。然而取名用意『SUPERUN全壘打』釋義成SUPER RUN 翻譯 [SUPER] 超級、最佳，[ RUN] 全部落實打點、打擊者等意思。..', 0, 'Superun全壘打,棒球機,投球機,室內棒球機,首創棒球機'),
(6, 1, 2, '國小組總積分競賽-棒球打擊機', '<p>\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[0]" style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; line-height: 15px;"><span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[0].[0]">名子 &nbsp; &nbsp; &nbsp;&nbsp;</span></span><span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; line-height: 15px;">第一回合</span><span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; line-height: 15px;">&nbsp; &nbsp;&nbsp;</span><span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; line-height: 15px;">第二回合</span><span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; line-height: 15px;">&nbsp; &nbsp; &nbsp;</span><span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; line-height: 15px;">第三回合</span><span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; line-height: 15px;">&nbsp; &nbsp; 第四回合　 &nbsp; 　累 計　 &nbsp; &nbsp;平均分數　　名 次</span></p>\r\n<p>\r\n	<span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; line-height: 15px;"><span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[0].[2]">趙 晉　　　4804　　　3909　　　3932　　　3845　　　16490　　　4122.5　1</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[0].[3]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[0].[4]">蘇晨文　　3477　　　3185　　　3149　　　3494　　　13305　　　3326.25　2</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[0].[5]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[0].[6]">葛承皓　　2281　　　2607　　　2562　　　2323　　　9773　　　 2443.25　3</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[0].[7]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[0].[8]">潘昱愷　　1872　　　</span></span><span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]" style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; line-height: 15px;"><span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]."><span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[0]">1736　　　3017　　　2054　　　8679　　　2169.75　4</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[1]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[2]">羅 億　　　1632　　　1465　　　1031　　　1846　　　5974　　　1493.5　　5</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[3]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[4]">趙浩偉　　1160　　　1739　　　1529　　　1437　　　5865　　　1466.25　6</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[5]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[6]">劉忠仁　　1640　　　1281　　　1171　　　1763　　　5855　　　1463.75　　7</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[7]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[8]">邱詩涵　　1318　　　1366　　　1461　　　1471　　　5616　　　1404　　　8</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[9]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[10]">鄭琮薰　　1877　　　1606　　　1350　　　692　　　　5525　　　1381.25　9</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[11]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[12]">劉育銓　　1071　　　1375　　　1007　　　1616　　　5069　　　1267.25 11</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[13]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[14]">楊青浩　　1266　　　1630　　　662　　　　1458　　　5016　　　1254　　12</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[15]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[16]">蘇弘展　　1367　　　896　　　　1745　　　526　　　　4534　　　1133.5　　13</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[17]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[18]">鄭琮醴　　1335　　　1141　　　969　　　　418　　　3863　　　965.75　　14</span><br id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[19]" />\r\n	<span id=".reactRoot[1].[1][2][1]{comment493576697337309_6096190}..[1]..[1]..[0].[0][2]..[3]..[20]">葛宇琴　　840　　　　547　　　954　　　　796　　　3137　　　784.25　　15</span></span></span></p>\r\n', '2012-08-26', 1, NULL, 0, '8/26國小組比賽終告段落.感謝大家對SUPERUN全壘打支持. \r\n這次比賽家長及小孩都非常準時出席.讓我們能非常順利成功辦完這次比賽!! ', 0, '棒球打擊機,國小棒球比賽,superun國小,台灣棒球機,棒球打擊機,國小棒球比賽,superun國小,台灣棒球機,綜合棒球機,棒球運動機'),
(3, 1, 2, 'SUPERUN 棒球練習機實際打擊', '<p>\r\n	<iframe allowfullscreen="" frameborder="0" height="315" src="http://www.youtube.com/embed/FX8rTpRVBJ8" width="560"></iframe></p>\r\n', '2012-11-12', 1, NULL, 0, '台灣的棒球，因缺乏完善的培訓環境，世代遞嬗，出現了人才斷層問題，台灣棒球稱霸亞洲的榮景不再！隨著科技的發展，其他國家培訓方法，也應因時代潮流，採用高科技、人體工學之設計，讓選手可以在無害、安全的環境，全力鍛鍊激發自己的潛力', 0, 'Superun全壘打,棒球機,投球機,室內棒球機,首創棒球機'),
(5, 1, 1, '最新連線對打、成績列印即將推出', '<p>\r\n	我們將於11/20在台中大雅 雅環保齡球館開幕</p>\r\n<p>\r\n	歡迎蒞臨體驗</p>\r\n', '2012-11-13', 1, NULL, 0, NULL, NULL, 'Superun全壘打,棒球機,投球機,室內棒球機,首創棒球機,連線對打,成績列印,大雅,雅環,雅環保齡球'),
(7, 1, 1, 'SUPERUN在台中大雅的雅環保齡球館', '<p>\r\n	<span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; font-size: 14px; line-height: 19px;"><strong>SUPERUN在台中大雅的雅環保齡球館</strong>，全新雙打連線，</span><wbr style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; font-size: 14px; line-height: 19px;" /><span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; font-size: 14px; line-height: 19px;">反應相當不錯，歡迎各位SUPERUN會員可以蒞臨體驗。</span></p>\r\n<p>\r\n	快找親朋好友來打打球~PK或紓解壓力~</p>\r\n<p>\r\n	<span style="color: rgb(0, 0, 205);"><strong>台中雅環保齡球館</strong></span>~不只可以打保齡球~還有<span style="background-color: rgb(255, 255, 0);">棒球~健身~網咖~撞球</span>...等等多項娛樂。</p>\r\n<p>\r\n	絕對是你休閒娛樂的好地方~~~<span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; font-size: 14px; line-height: 19px;">相關</span><span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; font-size: 14px; line-height: 19px;">照片會再發佈在網路上，敬請期待^^</span></p>\r\n<div>\r\n	<iframe allowfullscreen="" frameborder="0" height="236" src="http://www.youtube.com/embed/qg9jEMuBqHk" width="420"></iframe></div>\r\n', '2012-11-30', 1, NULL, 0, NULL, NULL, '台中大雅棒球,superun雙打連線,棒球雙打連線,打擊雙打連線,台中superun,台中棒球練習場,台中打擊場'),
(9, 1, 2, '台中大雅 雅環保齡球館', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; font-size: 14px; line-height: 19px;"><strong>SUPERUN在台中大雅的雅環保齡球館</strong>，全新雙打連線，</span><wbr style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; font-size: 14px; line-height: 19px;" /><span style="color: rgb(51, 51, 51); font-family: ''lucida grande'', tahoma, verdana, arial, sans-serif; font-size: 14px; line-height: 19px;">反應相當不錯，歡迎各位SUPERUN會員可以蒞臨體驗。</span></p>\r\n<p>\r\n	快找親朋好友來打打球~PK或紓解壓力~</p>\r\n<p>\r\n	<span style="color: rgb(0, 0, 205);"><strong>台中雅環保齡球館</strong></span>~不只可以打保齡球~還有<span style="background-color: rgb(255, 255, 0);">棒球~健身~網咖~撞球</span>...等等多項娛樂。</p>\r\n<p>\r\n	絕對是你休閒娛樂的好地方~~~</p>\r\n', '2012-12-10', 1, NULL, 0, 'SUPERUN在台中大雅的雅環保齡球館，全新雙打連線，反應相當不錯，歡迎各位SUPERUN會員可以蒞臨體驗。快找親朋好友來打打球~PK或紓解壓力~', 1, '台中大雅棒球,superun雙打連線,棒球雙打連線,打擊雙打連線,台中superun,台中棒球練習場,台中打擊場'),
(10, 1, 1, '雙打棒球遊戲-SUPEURN全新棒球運動', '<p>\r\n	<iframe allowfullscreen="" frameborder="0" height="315" src="http://www.youtube.com/embed/fzGDKygSWZs" width="560"></iframe></p>\r\n', '2013-06-01', 1, NULL, 0, NULL, NULL, 'superun,雙打棒球遊戲,棒球投球機'),
(11, 1, 1, 'SUPERUN全新棒球運動-ㄧ起熱血揮棒 ', '<iframe width="560" height="315" src="http://www.youtube.com/embed/FX8rTpRVBJ8" frameborder="0" allowfullscreen></iframe>', '2013-06-01', 1, NULL, 0, NULL, NULL, '棒球運動,室內棒球揮棒');

-- --------------------------------------------------------

--
-- 資料表結構 `news_class`
--

CREATE TABLE IF NOT EXISTS `news_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- 資料表的匯出資料 `news_class`
--

INSERT INTO `news_class` (`id`, `name`) VALUES
(1, '最新消息'),
(2, '動態內容');

-- --------------------------------------------------------

--
-- 資料表結構 `photo`
--

CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo_id` int(10) unsigned DEFAULT '0',
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `size` int(10) unsigned DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `flag` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `sort` int(10) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=63 ;

--
-- 資料表的匯出資料 `photo`
--

INSERT INTO `photo` (`id`, `photo_id`, `width`, `height`, `size`, `url`, `flag`, `sort`, `title`) VALUES
(9, 2, 200, 150, 160387, '1211151322370.jpg', 'product_photo', 999, NULL),
(8, 2, 200, 150, 160387, '1211151322020.jpg', 'product_photo', 999, NULL),
(4, 3, 200, 133, 131949, '1211091803480.jpg', 'news_photo', 2, NULL),
(5, 3, 200, 133, 140154, '1211091803481.jpg', 'news_photo', 3, NULL),
(6, 3, 200, 133, 131417, '1211091803482.jpg', 'news_photo', 1, NULL),
(7, 3, 200, 133, 131949, '1211121009540.jpg', 'product_photo', 999, NULL),
(10, 2, 200, 266, 102433, '1211151323040.jpg', 'product_photo', 999, NULL),
(11, 2, 200, 24, 2868, '1211151323530.gif', 'product_photo', 999, NULL),
(12, 3, 200, 150, 160387, '1211151324180.jpg', 'product_photo', 999, NULL),
(13, 3, 200, 133, 131949, '1211151330250.jpg', 'product_photo', 999, NULL),
(14, 3, 200, 133, 131417, '1211151332140.jpg', 'product_photo', 999, NULL),
(15, 3, 200, 133, 131949, '1211151335420.jpg', 'product_photo', 999, NULL),
(30, 6, 200, 150, 136160, '1211220905580.jpg', 'news_photo', 999, NULL),
(17, 2, 200, 150, 160387, '1211151341050.jpg', 'news_photo', 999, NULL),
(18, 2, 200, 266, 102433, '1211151341051.jpg', 'news_photo', 999, NULL),
(19, 2, 200, 150, 17255, '1211151341052.jpg', 'news_photo', 999, NULL),
(20, 2, 200, 150, 17560, '1211151342000.jpg', 'news_photo', 999, NULL),
(31, 6, 200, 150, 112401, '1211220905581.jpg', 'news_photo', 999, NULL),
(22, 2, 200, 150, 89016, '1211151342002.jpg', 'news_photo', 999, NULL),
(23, 2, 200, 150, 119284, '1211151342420.jpg', 'news_photo', 999, NULL),
(24, 2, 200, 266, 112785, '1211151342421.jpg', 'news_photo', 999, NULL),
(25, 2, 200, 266, 110493, '1211151342422.jpg', 'news_photo', 999, NULL),
(26, 2, 200, 150, 153860, '1211151343170.jpg', 'news_photo', 999, NULL),
(27, 2, 200, 150, 127186, '1211151343171.jpg', 'news_photo', 999, NULL),
(28, 2, 200, 150, 151458, '1211151343172.jpg', 'news_photo', 999, NULL),
(29, 2, 200, 150, 16973, '1211151343420.jpg', 'news_photo', 1, NULL),
(32, 6, 200, 150, 116834, '1211220905582.jpg', 'news_photo', 1, NULL),
(33, 6, 200, 150, 22248, '1211220905583.jpg', 'news_photo', 999, NULL),
(34, 6, 200, 150, 71534, '1211220905584.jpg', 'news_photo', 999, NULL),
(35, 6, 200, 150, 78138, '1211220905585.jpg', 'news_photo', 999, NULL),
(36, 6, 200, 150, 144201, '1211220905596.jpg', 'news_photo', 999, NULL),
(37, 6, 200, 150, 138339, '1211220905597.jpg', 'news_photo', 999, NULL),
(38, 6, 200, 150, 103465, '1211220905598.jpg', 'news_photo', 999, NULL),
(39, 6, 200, 150, 16410, '1211220905599.jpg', 'news_photo', 999, NULL),
(40, 6, 200, 150, 91648, '12112209055910.jpg', 'news_photo', 999, NULL),
(41, 6, 200, 150, 98450, '12112209055911.jpg', 'news_photo', 999, NULL),
(42, 6, 200, 150, 65099, '12112209060012.jpg', 'news_photo', 999, NULL),
(43, 6, 200, 150, 13639, '12112209060013.jpg', 'news_photo', 999, NULL),
(44, 6, 200, 150, 90272, '12112209060014.jpg', 'news_photo', 999, NULL),
(45, 6, 200, 150, 91862, '12112209060015.jpg', 'news_photo', 999, NULL),
(46, 9, 200, 150, 151075, '1212111632370.jpg', 'news_photo', 999, NULL),
(47, 9, 200, 150, 158671, '1212111632371.jpg', 'news_photo', 999, NULL),
(48, 9, 200, 150, 124716, '1212111632372.jpg', 'news_photo', 999, NULL),
(49, 9, 200, 150, 90070, '1212111632373.jpg', 'news_photo', 999, NULL),
(50, 9, 200, 150, 158536, '1212111632374.jpg', 'news_photo', 999, NULL),
(51, 9, 200, 150, 133583, '1212111632375.jpg', 'news_photo', 999, NULL),
(52, 9, 200, 150, 143039, '1212111632376.jpg', 'news_photo', 999, NULL),
(53, 9, 200, 150, 134086, '1212111632377.jpg', 'news_photo', 1, NULL),
(54, 9, 200, 150, 139547, '1212111632378.jpg', 'news_photo', 999, NULL),
(55, 9, 200, 150, 140446, '1212111632379.jpg', 'news_photo', 999, NULL),
(56, 9, 200, 150, 94485, '12121116323710.jpg', 'news_photo', 999, NULL),
(57, 9, 200, 150, 132877, '12121116323711.jpg', 'news_photo', 999, NULL),
(58, 9, 200, 150, 140675, '12121116323712.jpg', 'news_photo', 999, NULL),
(59, 9, 200, 150, 130480, '12121116323713.jpg', 'news_photo', 999, NULL),
(60, 9, 200, 150, 96516, '12121116323714.jpg', 'news_photo', 999, NULL),
(61, 9, 200, 150, 151124, '12121116323715.jpg', 'news_photo', 999, NULL),
(62, 9, 200, 150, 91430, '12121116323716.jpg', 'news_photo', 999, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `flag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- 資料表的匯出資料 `system`
--

INSERT INTO `system` (`id`, `name`, `content`, `flag`) VALUES
(1, 'mail', 'maxwell2004ll@superun.net', 'mail');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
