# ************************************************************
# Sequel Pro SQL dump
# Версия 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Адрес: localhost (MySQL 5.5.42)
# Схема: implant_mysql
# Время создания: 2016-10-01 18:12:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Дамп таблицы comcs_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_address`;

CREATE TABLE `comcs_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_affiliate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_affiliate`;

CREATE TABLE `comcs_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_affiliate_transaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_affiliate_transaction`;

CREATE TABLE `comcs_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_agoo_signer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_agoo_signer`;

CREATE TABLE `comcs_agoo_signer` (
  `id` int(11) NOT NULL,
  `pointer` varchar(128) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  KEY `pointer` (`pointer`),
  KEY `id` (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_attribute`;

CREATE TABLE `comcs_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_attribute` WRITE;
/*!40000 ALTER TABLE `comcs_attribute` DISABLE KEYS */;

INSERT INTO `comcs_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`)
VALUES
	(12,4,1),
	(13,4,2);

/*!40000 ALTER TABLE `comcs_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_attribute_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_attribute_description`;

CREATE TABLE `comcs_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_attribute_description` WRITE;
/*!40000 ALTER TABLE `comcs_attribute_description` DISABLE KEYS */;

INSERT INTO `comcs_attribute_description` (`attribute_id`, `language_id`, `name`)
VALUES
	(12,1,'Батарейка AA'),
	(13,1,'Батарейка AAA');

/*!40000 ALTER TABLE `comcs_attribute_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_attribute_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_attribute_group`;

CREATE TABLE `comcs_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_attribute_group` WRITE;
/*!40000 ALTER TABLE `comcs_attribute_group` DISABLE KEYS */;

INSERT INTO `comcs_attribute_group` (`attribute_group_id`, `sort_order`)
VALUES
	(4,1);

/*!40000 ALTER TABLE `comcs_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_attribute_group_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_attribute_group_description`;

CREATE TABLE `comcs_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_attribute_group_description` WRITE;
/*!40000 ALTER TABLE `comcs_attribute_group_description` DISABLE KEYS */;

INSERT INTO `comcs_attribute_group_description` (`attribute_group_id`, `language_id`, `name`)
VALUES
	(4,1,'Питание');

/*!40000 ALTER TABLE `comcs_attribute_group_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_banner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_banner`;

CREATE TABLE `comcs_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_banner` WRITE;
/*!40000 ALTER TABLE `comcs_banner` DISABLE KEYS */;

INSERT INTO `comcs_banner` (`banner_id`, `name`, `status`)
VALUES
	(9,'Баннер на главной GREEN',1),
	(10,'Вкладки',1),
	(11,'Производители',1);

/*!40000 ALTER TABLE `comcs_banner` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_banner_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_banner_image`;

CREATE TABLE `comcs_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_banner_image` WRITE;
/*!40000 ALTER TABLE `comcs_banner_image` DISABLE KEYS */;

INSERT INTO `comcs_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`)
VALUES
	(189,11,'/implantatsionnye-sistemy-cortex/','data/proizvoditeli/cortex-banner.jpg'),
	(193,10,'/implantatsionnye-sistemy-green/','data/vkladki/banner_1_green.png'),
	(194,10,'/implantatsionnye-sistemy-mozograu/','data/vkladki/banner_2_mozograu.png'),
	(195,10,'/implantatsionnye-sistemy-cortex/','data/vkladki/banner_3_cortex.png'),
	(79,9,'/','data/bannery/green_banner_dummy.jpg'),
	(188,11,'/implantatsionnye-sistemy-green/','data/proizvoditeli/green-banner.jpg'),
	(187,11,'/implantatsionnye-sistemy-mozograu/','data/proizvoditeli/mozograu-banner.jpg'),
	(185,11,'/implantatsionnye-sistemy-xive/','data/proizvoditeli/xive-banner.jpg'),
	(186,11,'/implantatsionnye-sistemy-roott/','data/proizvoditeli/roott-banner.jpg'),
	(183,11,'/implantatsionnye-sistemy-ankylos/','data/proizvoditeli/ankylos-banner.jpg'),
	(184,11,'/implantatsionnye-sistemy-straumann/','data/proizvoditeli/straumann-banner.jpg'),
	(182,11,'/implantatsionnye-sistemy-nobel/','data/proizvoditeli/nobel-banner.jpg'),
	(181,11,'/implantatsionnye-sistemy-mis/','data/proizvoditeli/mis-banner.jpg'),
	(180,11,'/implantatsionnye-sistemy-adin/','data/proizvoditeli/adin-banner.jpg'),
	(179,11,'/implantatsionnye-sistemy-astra/','data/proizvoditeli/astra-banner.jpg');

/*!40000 ALTER TABLE `comcs_banner_image` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_banner_image_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_banner_image_description`;

CREATE TABLE `comcs_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_banner_image_description` WRITE;
/*!40000 ALTER TABLE `comcs_banner_image_description` DISABLE KEYS */;

INSERT INTO `comcs_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`)
VALUES
	(188,1,11,'Имплантационные системы GREEN'),
	(189,1,11,'Имплантационные системы CORTEX'),
	(194,1,10,'Зубные имплантаты MOZOGRAU'),
	(195,1,10,'Дентальные имплантаты CORTEX'),
	(79,1,9,'Имплантаты из Израиля'),
	(187,1,11,'Имплантационные системы MOZOGRAU'),
	(186,1,11,'Имплантационные системы ROOTT'),
	(185,1,11,'Имплантационные системы XIVE'),
	(184,1,11,'Имплантационные системы STRAUMANN'),
	(183,1,11,'Имплантационные системы ANKYLOS'),
	(181,1,11,'Имплантационные системы MIS'),
	(182,1,11,'Имплантационные системы NOBEL'),
	(193,1,10,'Имплантационные системы GREEN'),
	(180,1,11,'Имплантационные системы ADIN'),
	(179,1,11,'Имплантационные системы ASTRA');

/*!40000 ALTER TABLE `comcs_banner_image_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_blog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_blog`;

CREATE TABLE `comcs_blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `design` text NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `customer_group_id` int(2) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_blog` WRITE;
/*!40000 ALTER TABLE `comcs_blog` DISABLE KEYS */;

INSERT INTO `comcs_blog` (`blog_id`, `image`, `design`, `parent_id`, `top`, `column`, `sort_order`, `status`, `customer_group_id`, `date_added`, `date_modified`)
VALUES
	(2,'data/blog/nasha-kompaniia.jpg','a:24:{s:10:\"blog_small\";a:2:{s:5:\"width\";s:0:\"\";s:6:\"height\";s:0:\"\";}s:8:\"blog_big\";a:2:{s:5:\"width\";s:0:\"\";s:6:\"height\";s:0:\"\";}s:16:\"blog_num_records\";s:0:\"\";s:17:\"blog_num_comments\";s:0:\"\";s:13:\"blog_num_desc\";s:0:\"\";s:19:\"blog_num_desc_words\";s:0:\"\";s:18:\"blog_num_desc_pred\";s:0:\"\";s:5:\"order\";s:4:\"sort\";s:8:\"order_ad\";s:3:\"asc\";s:13:\"blog_template\";s:0:\"\";s:20:\"blog_template_record\";s:0:\"\";s:21:\"blog_template_comment\";s:0:\"\";s:15:\"category_status\";s:1:\"0\";s:9:\"view_date\";s:1:\"1\";s:10:\"view_share\";s:1:\"1\";s:13:\"view_comments\";s:1:\"1\";s:11:\"view_viewed\";s:1:\"1\";s:11:\"view_rating\";s:1:\"1\";s:8:\"view_rss\";s:1:\"0\";s:12:\"view_captcha\";s:1:\"1\";s:13:\"visual_editor\";s:1:\"0\";s:7:\"bbwidth\";s:0:\"\";s:12:\"blog_devider\";s:1:\"1\";s:15:\"blog_short_path\";s:1:\"0\";}',0,0,0,1,1,1,'2015-03-19 04:47:28','2015-03-24 09:40:50');

/*!40000 ALTER TABLE `comcs_blog` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_blog_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_blog_description`;

CREATE TABLE `comcs_blog_description` (
  `blog_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `meta_h1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`blog_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_blog_description` WRITE;
/*!40000 ALTER TABLE `comcs_blog_description` DISABLE KEYS */;

INSERT INTO `comcs_blog_description` (`blog_id`, `language_id`, `name`, `description`, `meta_h1`, `meta_title`, `meta_description`, `meta_keyword`)
VALUES
	(2,1,'Наша компания','',X'',X'','','');

/*!40000 ALTER TABLE `comcs_blog_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_blog_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_blog_to_layout`;

CREATE TABLE `comcs_blog_to_layout` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_blog_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_blog_to_store`;

CREATE TABLE `comcs_blog_to_store` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_blog_to_store` WRITE;
/*!40000 ALTER TABLE `comcs_blog_to_store` DISABLE KEYS */;

INSERT INTO `comcs_blog_to_store` (`blog_id`, `store_id`)
VALUES
	(2,0);

/*!40000 ALTER TABLE `comcs_blog_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_catapulta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_catapulta`;

CREATE TABLE `comcs_catapulta` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` varchar(96) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_category`;

CREATE TABLE `comcs_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_category` WRITE;
/*!40000 ALTER TABLE `comcs_category` DISABLE KEYS */;

INSERT INTO `comcs_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`)
VALUES
	(59,'data/kategorii/sistemy-implantatov.jpg',0,0,1,1,1,'2015-03-10 02:14:30','2015-04-01 07:45:55'),
	(60,'data/kategorii/proteticheskie-elementy.png',0,0,1,2,1,'2015-03-10 02:18:50','2015-03-26 06:24:50'),
	(64,'data/kategorii/oborudovanie-dlia-implantatcii.jpg',0,0,1,5,1,'2015-03-26 06:22:11','2015-03-26 06:25:26'),
	(65,'data/proizvoditeli/green.jpg',59,0,1,1,1,'2015-04-01 10:30:02','2015-04-06 14:34:00'),
	(62,'data/kategorii/biomaterialy.png',0,0,1,3,1,'2015-03-10 03:20:53','2015-03-26 06:25:08'),
	(61,'data/kategorii/khirurgicheskii-instrumentarii.jpeg',0,0,1,4,1,'2015-03-10 02:48:43','2015-03-26 06:25:17'),
	(66,'data/kategorii/implantaty-standartnye.png',65,0,1,1,1,'2015-04-06 14:44:57','2015-04-06 15:11:12'),
	(67,'data/kategorii/implantaty-plus.png',65,0,1,2,1,'2015-04-06 15:10:50','2015-04-06 15:10:50'),
	(68,'data/kategorii/formirovateli-desny.jpg',65,0,1,3,1,'2015-04-06 15:35:58','2015-04-07 12:48:06'),
	(69,'data/kategorii/prefiksy.jpg',65,0,1,4,1,'2015-04-07 15:07:25','2015-04-07 15:07:25'),
	(70,'data/proizvoditeli/green.jpg',60,0,1,1,1,'2015-04-07 17:24:39','2015-05-06 18:10:32'),
	(71,'data/kategorii/standartnye-abatmenty.jpg',70,0,1,1,1,'2015-04-07 17:29:39','2015-04-07 17:29:39'),
	(72,'data/kategorii/titanovye-abatmenty-dlia-frezerovki.jpg',70,0,1,2,1,'2015-04-08 17:05:58','2015-04-08 17:05:58'),
	(73,'data/kategorii/plastikovye-abatmenty-dlia-litia.jpg',70,0,1,3,1,'2015-04-08 17:07:51','2015-04-08 17:07:51'),
	(74,'data/kategorii/titanovye-abatmenty-dlia-odnomomentnoi-nagruzki.jpg',70,0,1,4,1,'2015-04-08 17:17:25','2015-04-08 17:17:25'),
	(75,'data/kategorii/vremennye-plastikovye-abatmenty.jpg',70,0,1,5,1,'2015-04-08 17:37:08','2015-04-08 17:37:08'),
	(76,'data/kategorii/titanovye-abatmenty-s-ustupom.jpg',70,0,1,6,1,'2015-04-08 17:40:15','2015-04-08 17:40:34'),
	(77,'data/kategorii/anatomicheskie-abatmenty.jpg',70,0,1,7,1,'2015-04-08 17:45:27','2015-04-08 17:45:27'),
	(78,'data/kategorii/tcirkonievye-abatmenty.jpg',70,0,1,8,1,'2015-04-08 17:47:36','2015-04-08 17:47:36'),
	(79,'data/kategorii/abatmenty-s-sharovym-atachmentom.jpg',70,0,1,9,1,'2015-04-08 17:49:33','2015-04-08 17:49:33'),
	(80,'data/kategorii/titanovye-abatmenty-lokatory.jpg',70,0,1,10,1,'2015-04-08 18:01:37','2015-04-08 18:01:37'),
	(81,'data/kategorii/abatmenty-konnektory.jpg',70,0,1,11,1,'2015-04-08 18:03:19','2015-04-08 18:03:32'),
	(82,'data/kategorii/uglovye-titanovye-adaptory.jpg',70,0,1,12,1,'2015-04-08 18:06:41','2015-04-08 18:06:41'),
	(83,'data/kategorii/vinty-dlia-protezirovaniia.jpg',70,0,1,13,1,'2015-04-08 18:08:40','2015-04-08 18:08:40'),
	(84,'data/proizvoditeli/mozograu.jpg',59,0,1,2,1,'2015-04-16 19:07:25','2015-04-16 19:07:25'),
	(85,'data/proizvoditeli/cortex.jpg',59,0,1,3,1,'2015-04-16 19:08:57','2015-04-16 19:08:57'),
	(86,'data/proizvoditeli/mozograu.jpg',60,0,1,4,1,'2015-04-17 14:47:25','2015-05-13 12:37:24'),
	(87,'data/proizvoditeli/cortex.jpg',60,0,1,3,1,'2015-04-17 14:48:39','2015-04-17 14:48:39'),
	(88,'data/kategorii/standartnye-abatmenty-plus.jpg',70,0,1,1,1,'2015-04-28 12:06:40','2015-04-28 12:06:40'),
	(89,'data/kategorii/titanovye-abatmenty-dlia-frezerovki-plus.jpg',70,0,1,2,1,'2015-04-28 12:10:14','2015-04-28 12:15:31'),
	(90,'data/kategorii/plastikovye-abatmenty-dlia-litia-plus.jpg',70,0,1,3,1,'2015-04-28 12:24:35','2015-04-28 12:24:35'),
	(91,'data/kategorii/titanovye-abatmenty-dlia-odnomomentnoi-nagruzki-plus.jpg',70,0,1,4,1,'2015-04-28 12:27:29','2015-04-28 12:27:29'),
	(92,'data/kategorii/titanovye-abatmenty-s-ustupom-plus.jpg',70,0,1,6,1,'2015-04-28 12:29:42','2015-04-28 12:29:42'),
	(93,'data/kategorii/anatomicheskie-abatmenty-plus.jpg',70,0,1,7,1,'2015-04-28 12:34:01','2015-04-28 12:34:01'),
	(94,'data/kategorii/abatmenty-konnektory-plus.jpg',70,0,1,11,1,'2015-04-28 12:37:51','2015-04-28 12:37:51'),
	(95,'data/kategorii/uglovye-titanovye-adaptory-plus.jpg',70,0,1,12,1,'2015-04-28 12:39:43','2015-04-28 12:39:43'),
	(96,'data/kategorii/hirurgicheskie-instrumenty.jpg',97,0,1,1,1,'2015-05-05 16:41:23','2015-05-05 17:43:32'),
	(97,'data/proizvoditeli/green.jpg',61,0,1,1,1,'2015-05-05 17:21:38','2015-05-05 17:21:38'),
	(98,'data/proizvoditeli/mozograu.jpg',61,0,1,2,1,'2015-05-05 17:23:37','2015-05-05 17:23:57'),
	(99,'data/proizvoditeli/cortex.jpg',61,0,1,3,1,'2015-05-05 17:41:41','2015-05-05 17:41:41'),
	(100,'data/kategorii/prinadlezhnosti-dlya-kostnoj-plastiki.jpg',97,0,1,2,1,'2015-05-05 17:46:29','2015-05-05 17:46:29'),
	(101,'data/kategorii/klyuchi-dlya-implantatov.jpg',97,0,1,3,1,'2015-05-05 17:56:59','2015-05-05 17:56:59'),
	(102,'data/kategorii/klyuchi-dlya-vintov.jpg',97,0,1,5,1,'2015-05-05 18:24:39','2015-05-05 18:24:39'),
	(103,'data/kategorii/klyuchi-dlya-abatmentov.jpg',97,0,1,4,1,'2015-05-05 18:29:36','2015-05-05 18:30:52'),
	(104,'data/kategorii/sverla.jpg',97,0,1,6,1,'2015-05-05 18:32:29','2015-05-05 18:32:29'),
	(105,'data/proizvoditeli/green.jpg',60,0,1,2,1,'2015-05-13 12:40:13','2015-05-13 12:40:13'),
	(106,'data/kategorii/transfery.jpg',105,0,1,1,1,'2015-05-13 12:44:07','2015-05-13 12:44:07'),
	(107,'data/kategorii/transfery-plus.jpg',105,0,1,2,1,'2015-05-13 12:52:10','2015-05-13 12:52:10'),
	(108,'data/kategorii/analogi-abatmentov-i-implantov.jpg',105,0,1,3,1,'2015-05-13 12:54:56','2015-05-13 12:54:56'),
	(109,'data/kategorii/vremennye-koronki.jpg',105,0,1,4,1,'2015-05-13 12:56:34','2015-05-13 12:56:34');

/*!40000 ALTER TABLE `comcs_category` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_category_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_category_description`;

CREATE TABLE `comcs_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_category_description` WRITE;
/*!40000 ALTER TABLE `comcs_category_description` DISABLE KEYS */;

INSERT INTO `comcs_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`)
VALUES
	(60,1,'Протетические элементы','','','протетические элементы','Протетические элементы','Протетические элементы'),
	(61,1,'Хирургический инструментарий','','','хирургический инструментарий для имплантации','Хирургический инструментарий для имплантации','Хирургический инструментарий для имплантации'),
	(62,1,'Биоматериалы','&lt;p&gt;&lt;strong&gt;Биоматериалами&lt;/strong&gt; следует называть материалы, имеющие биологическое происхождение и применяемые в хирургии для восстановления целостности тканей и функций органов. Назначение биоматериалов при &lt;strong&gt;имплантации&lt;/strong&gt; – управление процессами остеогенеза и создание адекватных анатомических условий для имплантации. Биологические материалы, применяемые для реконструкции костной ткани, могут обладать остеоиндуктивными свойствами (способностью вызывать остеогенез) или остеокондуктивными (обеспечивать продвижение фронта остеогенеза по поверхности материала). Материалом, имеющим одновременно те и другие свойства, можно считать только аутотрансплантаты кости.&lt;/p&gt;\r\n&lt;p&gt;Классификация имплантационных материалов:&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;К биоактивным небиологическим&lt;/strong&gt; относятся материалы, которые включаются в метаболизм костного матрикса и ионный обмен, частично или полностью замещаются костной тканью в процессе её регенерации. Характерной особенностью этих материалов является полная либо частичная их деградация (рассасывание) со временем и замещение нормальной костной тканью. Биоактивными материалами являются кальций фосфатные соединения, сульфат кальция, биостекло и материалы на основе некоторых высокомолекулярных полимеров.&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;К биоинертным&lt;/strong&gt; относятся материалы, поверхность которых может обеспечить физико-химическую связь с костным матриксом, но при этом практически не включающиеся в метаболизм костной ткани и не подвергающиеся деградации на протяжении всего периода взаимодействия с окружающими тканями. Биоинертные материалы или их поверхность являются простейшей по химическому составу керамикой, имеющей обычные ионные связи. Основу её составляют оксиды, представляющие собой химическое соединение металла и кислорода. Наиболее известной керамикой из группы биоинертных материалов является алюмооксидная (AI2O3). К биоинертным металлам относятся титан и некоторые его сплавы, а также цирконий.&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;К биотолерантным&lt;/strong&gt; относятся материалы, которые способны обеспечить адсорбцию белков на своей поверхности, но не обладающие остеокондуктивными свойствами, поэтому при их использовании физико-химическая связь между поверхностью имплантата и костным матриксом, обычно, не образуется, что приводит к формированию соединительно-тканной капсулы вокруг имплантата. К биотолерантным материалам относятся сплавы на основе кобальта, некоторые виды нержавеющей стали и полимеры со сверхвысоким молекулярным весом (полиэтилен, полипропилен и тефлон).&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;Существуют три основных варианта организации тканей на поверхности раздела имплантат / кость:&lt;/p&gt;\r\n&lt;ol&gt;\r\n&lt;li&gt;непосредственный контакт костной ткани с поверхностью имплантата т.е. костная интеграция или оссеоинтеграция;&lt;/li&gt;\r\n&lt;li&gt;опосредованный контакт, когда между собственно костной тканью и поверхностью имплантата образуется прослойка соединительной ткани, состоящей преимущественно из волокон коллагена и грубоволокнистой костной ткани т.е. фиброзно-костная интеграция;&lt;/li&gt;\r\n&lt;li&gt;образование волокнистой соединительной ткани на поверхности имплантата (соединительно-тканная интеграция).&lt;/li&gt;\r\n&lt;/ol&gt;','','биоматериалы для имплантации','Биоматериалы для имплантации','Биоматериалы для имплантации'),
	(64,1,'Оборудование для имплантации','','','оборудование для имплантации','Оборудование для имплантации','Оборудование для имплантации'),
	(59,1,'Системы имплантатов','&lt;p&gt;Как выбрать &lt;strong&gt;систему имплантатов&lt;/strong&gt;? Выбор зубного имплантата – дело непростое, ведь перед пациентом предстают производители искусственных корней в широком изобилии. Свою продукцию предлагают Германия, Израиль, Америка, Корея, Швейцария и российские производители. И все сулят практически пожизненный срок эксплуатации. Но как не запутаться в широкой линейке имплантатов и выбрать действительно подходящую по цене и качеству продукцию?&lt;/p&gt;\r\n&lt;p&gt;На непосредственный выбор имплантата влияет метод имплантации:&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;Классическая имплантация зубов&lt;/strong&gt; – самый универсальный метод, для которого подойдут имплантаты стандартной формы и размера совершенно любых производителей. Однако есть и недостатки: продолжительность лечения занимает от полугода, в течение которого установленные имплантаты приживаются без нагрузки. Кроме того, классическая имплантация требует наращивания объема кости в случае ее недостатка (кость уменьшается из-за долгого отсутствия зубов) – а это не только дополнительное время, потраченное на операцию, но и материальные вложения. Для классического протокола подходят имплантаты любых марок, ведь сегодня это самый популярный метод имплантации зубов. Перед пациентом стоит основная задача – определиться с бюджетом и затем уже выбрать фирму-производителя имплантатов.&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;Одномоментная или экспресс-имплантация&lt;/strong&gt;, когда имплантат фиксируется в кости методом прокола – десна не разрезается, а кость травмируется минимально, к тому уровень ее объема корректировать не требуется. Кстати, это и позволяет при экспресс-методе перейти на 2-3 день к протезированию, а при одномоментной имплантации – установить имплантат сразу же после удаления зуба. Такие методы, безусловно, отличаются быстрой и практически безболезненной установкой. К тому же они значительно дешевле классического подхода, поскольку работа врача сводится к минимуму (в большинстве случаев не нужно наращивать кость и в течение нескольких месяцев не требуется посещение своего имплантолога). Имплантаты для данных методов требуются особые, со специальной формой и покрытием.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;Сами имплантаты делятся, прежде всего, на классы:&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;К недорогим зубным &lt;strong&gt;имплантатам эконом класса&lt;/strong&gt; можно условно отнести такие марки российского и израильского производства, как MIS или Alpha BIO. Это качественные и недорогие имплантаты.&lt;/li&gt;\r\n&lt;li&gt;Зубные &lt;strong&gt;имплантаты средней ценовой категории&lt;/strong&gt;, например, шведского производства Astra Tech, как правило, обеспечивают максимально быстрое срастание с костной тканью. Производители из этой группы часто предлагают особую систему крепления имплантата и абатмента, позволяющую надежно и долговечно закрепить зубной протез.&lt;/li&gt;\r\n&lt;li&gt;Зубные &lt;strong&gt;имплантаты премиум-класса&lt;/strong&gt;, или класса люкс, это одни из самых дорогих имплантатов. Производят такие системы в большинстве случаев в Германии. Как и все, что создано в Германии, конструкции для имплантации отличаются невероятными эксплуатационными характеристиками. Это имплантаты XIVE со своим знаменитым показателем отторжения всего в 1%, имплантаты Ankylos, в эксплуатации которых  эксплуатации никто и никогда не заметит разницы между искусственным и натуральным зубом, а также швейцарские Straumann с пожизненной гарантией на конструкцию, имплантаты которые приживаются всего за 2 месяца и имеют особое внешнее покрытие.&lt;/li&gt;\r\n&lt;/ul&gt;','','cистемы имплантатов','Системы имплантатов','Системы имплантатов'),
	(65,1,'Имплантаты производства GREEN','&lt;p&gt;Компания Green Implant System Tec. представляет инновационные решения в области имплантологии.&lt;/p&gt;\r\n&lt;p&gt;Система мульти блокировки &quot;Multi-lock systems&quot; для максимальной поддержки абатмента во внутреннем шестиграннике имплантата и для предотвращения раскручивания винта абатмента. Далее на примере имплантата &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;классик&lt;/a&gt;&lt;/p&gt;\r\n&lt;div class=&quot;cleared reset-box&quot;&gt;&lt;/div&gt;\r\n&lt;img src=&quot;/image/data/implantaty/multi-lock-systems.jpg&quot; alt=&quot;multi lock systems&quot; title=&quot;multi lock systems&quot; /&gt;\r\n&lt;ol&gt;\r\n&lt;li&gt;Плоские лопасти четырех спиральной меняющейся микрорезьбы для компрессии и стабилизации имплантата в кортикальной костной ткани.&lt;/li&gt;\r\n&lt;li&gt;Острые лопасти четырех спиральной меняющейся микрорезьбы для нарезания резьбового хода в кортикальной костной ткани и легкой установки имплантата.&lt;/li&gt;\r\n&lt;li&gt;Плоские лопасти двух спиральной меняющейся резьбы для компрессии и стабилизации имплантата в губчатой костной ткани.&lt;/li&gt;\r\n&lt;li&gt;Острые лопасти двухспиральной меняющейся резьбы для введения в губчатую костную ткань и легкой установки имплантата.&lt;/li&gt;\r\n&lt;/ol&gt;\r\n&lt;img src=&quot;/image/data/implantaty/implantaty-proizvodstva-green.png&quot; alt=&quot;имплантаты производства green&quot; title=&quot;имплантаты производства green&quot; /&gt;','','имплантаты производства green','Имплантаты производства GREEN','Имплантаты производства GREEN'),
	(66,1,'Имплантаты стандартные','','','имплантаты стандартные','Имплантаты стандартные','Имплантаты стандартные'),
	(67,1,'Имплантаты плюс','','','имплантаты плюс','Имплантаты плюс','Имплантаты плюс'),
	(68,1,'Формирователи десны','&lt;p&gt;&lt;strong&gt;Лечебные абатменты (формирователи десны)&lt;/strong&gt; используется для формирования десневой манжетки над имплантатом. Широкий ассортимент лечебных абатментов обеспечивает свободу выбора врача для правильного роста естественных мягких тканей и десневой манжетки над имплантатом во время процесса заживления, который является жизненно важным и критическим фактором для обеспечения эстетического и функционального конечного результата. Лечебные абатменты различаются по длине и диаметру. Имеются 4 диаметра: стандартный, узкий, супер- узкий и широкий. Узкие и супер-узкие лечебные абатменты рекомендуются к использованию при одноэтапной имплантации сразу после установки имплантата. Сохранение большего количества мягких тканей над установленным имплантатом уменьшает риск резорбции кости вокруг имплантата. Стандартные и широкие лечебные абатменты рекомендуются к использованию на стадии расскрытия и протезирования на имплантатах. Правильное и широкое раскрытие десневой манжетки над имплантатом позволяет свести к минимуму ошибки при снятии оттисков с имплантатов, правильному и эстетическому моделированию протезной конструкции в лаборатории, более точной и безболезненной установки протезной конструкции в полости рта.&lt;/p&gt;','','формирователи десны','Формирователи десны','Формирователи десны'),
	(69,1,'Префиксы','','','префиксы','Префиксы','Префиксы'),
	(70,1,'Протетика производства GREEN','','','протетика производства green','Протетика производства GREEN','Протетика производства GREEN'),
	(71,1,'Стандартные абатменты','','','стандартные абатменты','Стандартные абатменты','Стандартные абатменты'),
	(72,1,'Титановые абатменты для фрезеровки','','','титановые абатменты для фрезеровки','Титановые абатменты для фрезеровки','Титановые абатменты для фрезеровки'),
	(73,1,'Пластиковые абатменты для литья','','','пластиковые абатменты для литья','Пластиковые абатменты для литья','Пластиковые абатменты для литья'),
	(74,1,'Тинановые абатменты для одномоментной нагрузки','','','тинановые абатменты для одномоментной нагрузки','Тинановые абатменты для одномоментной нагрузки','Тинановые абатменты для одномоментной нагрузки'),
	(75,1,'Временные пластиковые абатменты','','','временные пластиковые абатменты','Временные пластиковые абатменты','Временные пластиковые абатменты'),
	(76,1,'Титановые абатменты с уступом','','','титановые абатменты с уступом','Титановые абатменты с уступом','Титановые абатменты с уступом'),
	(77,1,'Анатомические абатменты','','','анатомические абатменты','Анатомические абатменты','Анатомические абатменты'),
	(78,1,'Циркониевые абатменты','','','циркониевые абатменты','Циркониевые абатменты','Циркониевые абатменты'),
	(79,1,'Абатменты с шаровым атачментом','','','абатменты с шаровым атачментом','Абатменты с шаровым атачментом','Абатменты с шаровым атачментом'),
	(80,1,'Титановые абатменты-локаторы','','','титановые абатменты-локаторы','Титановые абатменты-локаторы','Титановые абатменты-локаторы'),
	(81,1,'Абатменты-коннекторы','','','абатменты-коннекторы','Абатменты-коннекторы','Абатменты-коннекторы'),
	(82,1,'Угловые титановые адапторы','','','угловые титановые адапторы','Угловые титановые адапторы','Угловые титановые адапторы'),
	(83,1,'Винты для протезирования','','','винты для протезирования','Винты для протезирования','Винты для протезирования'),
	(84,1,'Имплантаты производства MOZOGRAU','','','имплантаты производства mozograu','Имплантаты производства MOZOGRAU','Имплантаты производства MOZOGRAU'),
	(85,1,'Имплантаты производства CORTEX','','','имплантаты производства cortex','Имплантаты производства CORTEX','Имплантаты производства CORTEX'),
	(86,1,'Протетика производства MOZOGRAU','','','протетика производства mozograu','Протетика производства MOZOGRAU','Протетика производства MOZOGRAU'),
	(87,1,'Протетика производства CORTEX','','','протетика производства cortex','Протетика производства CORTEX','Протетика производства CORTEX'),
	(88,1,'Стандартные абатменты плюс','','','стандартные абатменты плюс','Стандартные абатменты плюс','Стандартные абатменты плюс'),
	(89,1,'Титановые абатменты для фрезеровки плюс','','','титановые абатменты для фрезеровки плюс','Титановые абатменты для фрезеровки плюс','Титановые абатменты для фрезеровки плюс'),
	(90,1,'Пластиковые абатменты для литья плюс','','','пластиковые абатменты для литья плюс','Пластиковые абатменты для литья плюс','Пластиковые абатменты для литья плюс'),
	(91,1,'Тинановые абатменты для одномоментной нагрузки плюс','','','тинановые абатменты для одномоментной нагрузки плюс','Тинановые абатменты для одномоментной нагрузки плюс','Тинановые абатменты для одномоментной нагрузки плюс'),
	(92,1,'Титановые абатменты с уступом плюс','','','титановые абатменты с уступом плюс','Титановые абатменты с уступом плюс','Титановые абатменты с уступом плюс'),
	(93,1,'Анатомические абатменты плюс','','','анатомические абатменты плюс','Анатомические абатменты плюс','Анатомические абатменты плюс'),
	(94,1,'Абатменты-коннекторы плюс','','','абатменты-коннекторы плюс','Абатменты-коннекторы плюс','Абатменты-коннекторы плюс'),
	(95,1,'Угловые титановые адапторы плюс','','','угловые титановые адапторы плюс','Угловые титановые адапторы плюс','Угловые титановые адапторы плюс'),
	(96,1,'Хирургические инструменты','','','хирургические инструменты','Хирургические инструменты','Хирургические инструменты'),
	(97,1,'Дентальные инструменты GREEN','','','дентальные инструменты green','Дентальные инструменты GREEN','Дентальные инструменты GREEN'),
	(98,1,'Дентальные инструменты MOZOGRAU','','','дентальные инструменты mozograu','Дентальные инструменты MOZOGRAU','Дентальные инструменты MOZOGRAU'),
	(99,1,'Дентальные инструменты CORTEX','','','дентальные инструменты cortex','Дентальные инструменты CORTEX','Дентальные инструменты CORTEX'),
	(100,1,'Принадлежности для костной пластики','','','принадлежности для костной пластики','Принадлежности для костной пластики','Принадлежности для костной пластики'),
	(101,1,'Ключи для имплантатов','','','ключи для имплантатов','Ключи для имплантатов','Ключи для имплантатов'),
	(102,1,'Ключи для винтов','','','ключи для винтов','Ключи для винтов','Ключи для винтов'),
	(103,1,'Ключи для абатментов','','','ключи для абатментов','Ключи для абатментов','Ключи для абатментов'),
	(104,1,'Сверла','','','сверла','Сверла','Сверла'),
	(105,1,'Аксессуары производства GREEN','','','аксессуары производства green','Аксессуары производства GREEN','Аксессуары производства GREEN'),
	(106,1,'Трансферы','','','трансферы','Трансферы','Трансферы'),
	(107,1,'Трансферы плюс','','','трансферы плюс','Трансферы плюс','Трансферы плюс'),
	(108,1,'Аналоги абатментов и имплантов','','','аналоги абатментов и имплантов','Аналоги абатментов и имплантов','Аналоги абатментов и имплантов'),
	(109,1,'Временные коронки','','','временные коронки','Временные коронки','Временные коронки');

/*!40000 ALTER TABLE `comcs_category_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_category_filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_category_filter`;

CREATE TABLE `comcs_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_category_path
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_category_path`;

CREATE TABLE `comcs_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_category_path` WRITE;
/*!40000 ALTER TABLE `comcs_category_path` DISABLE KEYS */;

INSERT INTO `comcs_category_path` (`category_id`, `path_id`, `level`)
VALUES
	(64,64,0),
	(65,59,0),
	(65,65,1),
	(62,62,0),
	(61,61,0),
	(60,60,0),
	(59,59,0),
	(66,65,1),
	(66,59,0),
	(66,66,2),
	(67,59,0),
	(67,65,1),
	(67,67,2),
	(68,65,1),
	(68,59,0),
	(68,68,2),
	(69,59,0),
	(69,65,1),
	(69,69,2),
	(70,60,0),
	(70,70,1),
	(71,60,0),
	(71,70,1),
	(71,71,2),
	(72,72,2),
	(72,70,1),
	(72,60,0),
	(73,73,2),
	(73,70,1),
	(73,60,0),
	(74,74,2),
	(74,70,1),
	(74,60,0),
	(75,75,2),
	(75,70,1),
	(75,60,0),
	(76,60,0),
	(76,76,2),
	(76,70,1),
	(77,77,2),
	(77,70,1),
	(77,60,0),
	(78,78,2),
	(78,70,1),
	(78,60,0),
	(79,79,2),
	(79,70,1),
	(79,60,0),
	(80,80,2),
	(80,70,1),
	(80,60,0),
	(81,60,0),
	(81,81,2),
	(81,70,1),
	(82,82,2),
	(82,70,1),
	(82,60,0),
	(83,83,2),
	(83,70,1),
	(83,60,0),
	(84,59,0),
	(84,84,1),
	(85,59,0),
	(85,85,1),
	(86,60,0),
	(86,86,1),
	(87,60,0),
	(87,87,1),
	(88,60,0),
	(88,70,1),
	(88,88,2),
	(89,70,1),
	(89,60,0),
	(89,89,2),
	(90,60,0),
	(90,70,1),
	(90,90,2),
	(91,60,0),
	(91,70,1),
	(91,91,2),
	(92,60,0),
	(92,70,1),
	(92,92,2),
	(93,60,0),
	(93,70,1),
	(93,93,2),
	(94,60,0),
	(94,70,1),
	(94,94,2),
	(95,60,0),
	(95,70,1),
	(95,95,2),
	(96,96,2),
	(96,97,1),
	(97,97,1),
	(97,61,0),
	(99,99,1),
	(98,98,1),
	(98,61,0),
	(99,61,0),
	(96,61,0),
	(100,61,0),
	(100,97,1),
	(100,100,2),
	(101,61,0),
	(101,97,1),
	(101,101,2),
	(102,61,0),
	(102,97,1),
	(102,102,2),
	(103,97,1),
	(103,61,0),
	(103,103,2),
	(104,61,0),
	(104,97,1),
	(104,104,2),
	(105,60,0),
	(105,105,1),
	(106,60,0),
	(106,105,1),
	(106,106,2),
	(107,60,0),
	(107,105,1),
	(107,107,2),
	(108,60,0),
	(108,105,1),
	(108,108,2),
	(109,60,0),
	(109,105,1),
	(109,109,2);

/*!40000 ALTER TABLE `comcs_category_path` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_category_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_category_to_layout`;

CREATE TABLE `comcs_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_category_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_category_to_store`;

CREATE TABLE `comcs_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_category_to_store` WRITE;
/*!40000 ALTER TABLE `comcs_category_to_store` DISABLE KEYS */;

INSERT INTO `comcs_category_to_store` (`category_id`, `store_id`)
VALUES
	(59,0),
	(60,0),
	(61,0),
	(62,0),
	(64,0),
	(65,0),
	(66,0),
	(67,0),
	(68,0),
	(69,0),
	(70,0),
	(71,0),
	(72,0),
	(73,0),
	(74,0),
	(75,0),
	(76,0),
	(77,0),
	(78,0),
	(79,0),
	(80,0),
	(81,0),
	(82,0),
	(83,0),
	(84,0),
	(85,0),
	(86,0),
	(87,0),
	(88,0),
	(89,0),
	(90,0),
	(91,0),
	(92,0),
	(93,0),
	(94,0),
	(95,0),
	(96,0),
	(97,0),
	(98,0),
	(99,0),
	(100,0),
	(101,0),
	(102,0),
	(103,0),
	(104,0),
	(105,0),
	(106,0),
	(107,0),
	(108,0),
	(109,0);

/*!40000 ALTER TABLE `comcs_category_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_comment`;

CREATE TABLE `comcs_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `rating_mark` tinyint(1) NOT NULL DEFAULT '0',
  `sorthex` varchar(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`comment_id`),
  KEY `record_id` (`record_id`),
  KEY `rating` (`rating`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_country`;

CREATE TABLE `comcs_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_country` WRITE;
/*!40000 ALTER TABLE `comcs_country` DISABLE KEYS */;

INSERT INTO `comcs_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`)
VALUES
	(20,'Белоруссия (Беларусь)','BY','BLR','',0,1),
	(33,'Болгария','BG','BGR','',0,1),
	(54,'Куба','CU','CUB','',0,1),
	(56,'Чехия','CZ','CZE','',0,1),
	(67,'Эстония','EE','EST','',0,1),
	(80,'Грузия','GE','GEO','',0,1),
	(104,'Израиль','IL','ISR','',0,1),
	(109,'Казахстан','KZ','KAZ','',0,1),
	(117,'Латвия','LV','LVA','',0,1),
	(123,'Литва','LT','LTU','',0,1),
	(140,'Молдова','MD','MDA','',0,1),
	(170,'Польша','PL','POL','',0,1),
	(175,'Румыния','RO','ROM','',0,1),
	(176,'Российская Федерация','RU','RUS','',0,1),
	(207,'Таджикистан','TJ','TJK','',0,1),
	(216,'Туркменистан','TM','TKM','',0,1),
	(220,'Украина','UA','UKR','',0,1),
	(226,'Узбекистан','UZ','UZB','',0,1),
	(236,'Сербия и Черногория','CS','SCG','',0,1);

/*!40000 ALTER TABLE `comcs_country` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_coupon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_coupon`;

CREATE TABLE `comcs_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_coupon` WRITE;
/*!40000 ALTER TABLE `comcs_coupon` DISABLE KEYS */;

INSERT INTO `comcs_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`)
VALUES
	(4,'-10% скидка','2222','P',10.0000,0,0,0.0000,'2011-01-01','2012-01-01',10,'10',1,'2009-01-27 13:55:03'),
	(5,'Бесплатная доставка','3333','P',0.0000,0,1,100.0000,'2009-03-01','2009-08-31',10,'10',1,'2009-03-14 21:13:53'),
	(6,'-10.00 скидка','1111','F',10.0000,0,0,10.0000,'1970-11-01','2020-11-01',100000,'10000',1,'2009-03-14 21:15:18');

/*!40000 ALTER TABLE `comcs_coupon` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_coupon_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_coupon_category`;

CREATE TABLE `comcs_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_coupon_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_coupon_history`;

CREATE TABLE `comcs_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_coupon_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_coupon_product`;

CREATE TABLE `comcs_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_currency
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_currency`;

CREATE TABLE `comcs_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_currency` WRITE;
/*!40000 ALTER TABLE `comcs_currency` DISABLE KEYS */;

INSERT INTO `comcs_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`)
VALUES
	(1,'Рубль','RUB','',' р.','2',1.00000000,1,'2015-06-04 11:56:46'),
	(2,'US Dollar','USD','$','','2',0.01884694,1,'2015-06-04 11:56:46'),
	(3,'Euro','EUR','','€','2',0.01691675,1,'2015-06-04 11:56:46'),
	(4,'US Dollar GREEN','USG','$','','2',0.02083333,1,'2015-04-03 17:57:35');

/*!40000 ALTER TABLE `comcs_currency` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_custom_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_custom_field`;

CREATE TABLE `comcs_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_custom_field_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_custom_field_description`;

CREATE TABLE `comcs_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_custom_field_to_customer_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_custom_field_to_customer_group`;

CREATE TABLE `comcs_custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_custom_field_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_custom_field_value`;

CREATE TABLE `comcs_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_custom_field_value_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_custom_field_value_description`;

CREATE TABLE `comcs_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_customer`;

CREATE TABLE `comcs_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_customer_ban_ip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_customer_ban_ip`;

CREATE TABLE `comcs_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_customer_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_customer_field`;

CREATE TABLE `comcs_customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_customer_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_customer_group`;

CREATE TABLE `comcs_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_customer_group` WRITE;
/*!40000 ALTER TABLE `comcs_customer_group` DISABLE KEYS */;

INSERT INTO `comcs_customer_group` (`customer_group_id`, `approval`, `company_id_display`, `company_id_required`, `tax_id_display`, `tax_id_required`, `sort_order`)
VALUES
	(1,0,0,0,0,0,1);

/*!40000 ALTER TABLE `comcs_customer_group` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_customer_group_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_customer_group_description`;

CREATE TABLE `comcs_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_customer_group_description` WRITE;
/*!40000 ALTER TABLE `comcs_customer_group_description` DISABLE KEYS */;

INSERT INTO `comcs_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`)
VALUES
	(1,1,'По умолчанию','Группа покупателей по умолчанию');

/*!40000 ALTER TABLE `comcs_customer_group_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_customer_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_customer_history`;

CREATE TABLE `comcs_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_customer_ip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_customer_ip`;

CREATE TABLE `comcs_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_customer_online
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_customer_online`;

CREATE TABLE `comcs_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_customer_reward
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_customer_reward`;

CREATE TABLE `comcs_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_customer_transaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_customer_transaction`;

CREATE TABLE `comcs_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_download
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_download`;

CREATE TABLE `comcs_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_download_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_download_description`;

CREATE TABLE `comcs_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_extension
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_extension`;

CREATE TABLE `comcs_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_extension` WRITE;
/*!40000 ALTER TABLE `comcs_extension` DISABLE KEYS */;

INSERT INTO `comcs_extension` (`extension_id`, `type`, `code`, `sort_order`, `description`)
VALUES
	(23,'payment','cod',0,''),
	(22,'total','shipping',0,''),
	(57,'total','sub_total',0,''),
	(458,'payment','shoputils_rk',0,''),
	(59,'total','total',0,''),
	(410,'module','banner',0,''),
	(426,'module','carousel',0,''),
	(461,'module','catapulta',0,''),
	(460,'module','cartpopup',0,''),
	(413,'module','category',0,''),
	(453,'module','tagcloud',0,''),
	(438,'module','account',0,''),
	(435,'payment','bank_transfer',0,''),
	(427,'module','featured',0,''),
	(419,'module','slideshow',0,''),
	(429,'module','smart_menu',0,''),
	(430,'shipping','pickup',0,''),
	(434,'shipping','free',0,''),
	(436,'feed','google_base',0,''),
	(437,'feed','google_sitemap',0,''),
	(441,'module','latest',0,''),
	(442,'module','special',0,''),
	(445,'module','welcome',0,''),
	(446,'module','blog',0,''),
	(451,'module','man_block',0,''),
	(452,'module','we_menu',0,''),
	(454,'module','multycurrgoods',0,''),
	(455,'module','search_suggestion',0,''),
	(456,'module','anylist',0,'');

/*!40000 ALTER TABLE `comcs_extension` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_filter`;

CREATE TABLE `comcs_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_filter_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_filter_description`;

CREATE TABLE `comcs_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_filter_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_filter_group`;

CREATE TABLE `comcs_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_filter_group_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_filter_group_description`;

CREATE TABLE `comcs_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_geo_zone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_geo_zone`;

CREATE TABLE `comcs_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_geo_zone` WRITE;
/*!40000 ALTER TABLE `comcs_geo_zone` DISABLE KEYS */;

INSERT INTO `comcs_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`)
VALUES
	(3,'НДС','Облагаемые НДС','2010-02-26 22:33:24','2009-01-06 23:26:25'),
	(4,'Новосибирск','Новосибирск','2015-03-05 06:45:00','2015-03-05 06:44:50');

/*!40000 ALTER TABLE `comcs_geo_zone` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_information
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_information`;

CREATE TABLE `comcs_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_information_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_information_description`;

CREATE TABLE `comcs_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_information_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_information_to_layout`;

CREATE TABLE `comcs_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_information_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_information_to_store`;

CREATE TABLE `comcs_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_language
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_language`;

CREATE TABLE `comcs_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_language` WRITE;
/*!40000 ALTER TABLE `comcs_language` DISABLE KEYS */;

INSERT INTO `comcs_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`)
VALUES
	(1,'Russian','ru','ru_RU.UTF-8,ru_RU,russian','ru.png','russian','russian',1,1);

/*!40000 ALTER TABLE `comcs_language` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_layout`;

CREATE TABLE `comcs_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_layout` WRITE;
/*!40000 ALTER TABLE `comcs_layout` DISABLE KEYS */;

INSERT INTO `comcs_layout` (`layout_id`, `name`)
VALUES
	(1,'Главная'),
	(2,'Продукт'),
	(3,'Категория'),
	(4,'По-умолчанию'),
	(5,'Производитель'),
	(6,'Аккаунт'),
	(7,'Оформление заказ'),
	(8,'Контакты'),
	(9,'Карта сайта'),
	(10,'Партнерская программа'),
	(11,'Информация'),
	(12,'Blog'),
	(13,'not_found'),
	(14,'Record');

/*!40000 ALTER TABLE `comcs_layout` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_layout_route
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_layout_route`;

CREATE TABLE `comcs_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_layout_route` WRITE;
/*!40000 ALTER TABLE `comcs_layout_route` DISABLE KEYS */;

INSERT INTO `comcs_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`)
VALUES
	(30,6,0,'account'),
	(17,10,0,'affiliate/'),
	(29,3,0,'product/category'),
	(26,1,0,'common/home'),
	(20,2,0,'product/product'),
	(24,11,0,'information/information'),
	(22,5,0,'product/manufacturer'),
	(23,7,0,'checkout/'),
	(31,8,0,'information/contact'),
	(32,9,0,'information/sitemap'),
	(33,12,0,'record/blog'),
	(34,13,0,'error/not_found'),
	(35,14,0,'record/record');

/*!40000 ALTER TABLE `comcs_layout_route` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_length_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_length_class`;

CREATE TABLE `comcs_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_length_class` WRITE;
/*!40000 ALTER TABLE `comcs_length_class` DISABLE KEYS */;

INSERT INTO `comcs_length_class` (`length_class_id`, `value`)
VALUES
	(1,1.00000000),
	(2,10.00000000),
	(3,0.39370000);

/*!40000 ALTER TABLE `comcs_length_class` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_length_class_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_length_class_description`;

CREATE TABLE `comcs_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_length_class_description` WRITE;
/*!40000 ALTER TABLE `comcs_length_class_description` DISABLE KEYS */;

INSERT INTO `comcs_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`)
VALUES
	(1,1,'Сантиметр','см'),
	(2,1,'Миллиметр','мм');

/*!40000 ALTER TABLE `comcs_length_class_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_manufacturer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_manufacturer`;

CREATE TABLE `comcs_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_manufacturer` WRITE;
/*!40000 ALTER TABLE `comcs_manufacturer` DISABLE KEYS */;

INSERT INTO `comcs_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`)
VALUES
	(15,'NOBEL','data/proizvoditeli/nobel.jpg',8),
	(12,'ANKYLOS','data/proizvoditeli/ankylos.jpg',2),
	(13,'ASTRA','data/proizvoditeli/astra.jpg',3),
	(14,'MIS','data/proizvoditeli/mis.jpg',6),
	(11,'ADIN','data/proizvoditeli/adin.jpg',1),
	(16,'ROOTT','data/proizvoditeli/roott.jpg',9),
	(17,'STRAUMANN','data/proizvoditeli/straumann.gif',10),
	(18,'XIVE','data/proizvoditeli/xive.jpg',11),
	(19,'MOZOGRAU','data/proizvoditeli/mozograu.jpg',7),
	(20,'GREEN','data/proizvoditeli/green.jpg',5),
	(21,'CORTEX','data/proizvoditeli/cortex.jpg',4);

/*!40000 ALTER TABLE `comcs_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_manufacturer_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_manufacturer_description`;

CREATE TABLE `comcs_manufacturer_description` (
  `manufacturer_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_manufacturer_description` WRITE;
/*!40000 ALTER TABLE `comcs_manufacturer_description` DISABLE KEYS */;

INSERT INTO `comcs_manufacturer_description` (`manufacturer_id`, `language_id`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`)
VALUES
	(11,1,'','','имплантационные системы adin','Имплантационные системы ADIN','Имплантационные системы ADIN'),
	(12,1,'','','имплантационные системы ankylos','Имплантационные системы ANKYLOS','Имплантационные системы ANKYLOS'),
	(13,1,'','','имплантационные системы astra','Имплантационные системы ASTRA','Имплантационные системы ASTRA'),
	(14,1,'','','имплантационные системы mis','Имплантационные системы MIS','Имплантационные системы MIS'),
	(15,1,'','','имплантационные системы nobel','Имплантационные системы NOBEL','Имплантационные системы NOBEL'),
	(16,1,'','','имплантационные системы roott','Имплантационные системы ROOTT','Имплантационные системы ROOTT'),
	(17,1,'','','имплантационные системы straumann','Имплантационные системы STRAUMANN','Имплантационные системы STRAUMANN'),
	(18,1,'','','имплантационные системы xive','Имплантационные системы XIVE','Имплантационные системы XIVE'),
	(19,1,'','','имплантационные системы mozograu','Имплантационные системы MOZOGRAU','Имплантационные системы MOZOGRAU'),
	(20,1,'&lt;p&gt;Компания Green Implant System Technologie GmbH &amp; Co.KG (Германия) является инновационной высокотехнологичной компанией, достойно представленной на динамичном рынке высоких технологий в области дентальной имплантологии.&lt;/p&gt;\r\n&lt;p&gt;Вся продукция, процесс и услуги Green Implant соответствуют стандарту системы менеджмента качества ISO 9001:2008 , ISO 13485:2003 и СЕ (Marked of European Medical EEC 94/93 Device derective). Green Implant имеют внедренную надежную систему менеджмента качества в соответствии с требованиями национальных и международных регулятивных ведомств в области производства изделий медицинского назначения с использованием новейших технологий. Процессы производства и тестирования продукции соответствуют международным стандартам качества.&lt;/p&gt;\r\n&lt;p&gt;Тесное сотрудничество научно-производственного центра нашей компании с ведущими клиниками, исследовательскими центрами и университетами является гарантией постоянного продвижения вперёд и достижения наивысшего качества изготовляемой продукции.&lt;/p&gt;\r\n&lt;/p&gt;Нашей компанией при участии учёных - разработчиков и врачей ведущих медицинских центров Европы разработан имплантат нового поколения, аналога которому нет в мире - мультимодулярный имплантат-плюс, позволяющий &quot;лечить&quot; имплантат в процессе его использования и практически делать этот имплантат &quot;вечным&quot;. Система мульти-блокировки абатмента во внутреннем шестиграннике имплантата практически полностью решает проблему подвижности протезной конструкции. Разработанные и внедрённые тонкие имплантаты с узкой платформой имеют наивысшие показатели надёжности при функциональнальной нагрузке. Специальные хирургические инструменты и протезная система для немедленной нагрузки на имплантат отвечают самым передовым требованиям современной имплантологии, не имеют аналогов в мировой практике и максимально облегчают работу врача-стоматолога.&lt;/p&gt;\r\n&lt;p&gt;Широкий спектр и выбор продукции позволяет решать проблемы самых сложных клинических случаев и обеспечивает гарантию надёжности и простоты в применении системы, подтверждением чему является множество медицинских и клинических исследований.&lt;/p&gt;\r\n&lt;p&gt;Девиз компании &quot;Мы смотрим в будущее&quot; как нельзя лучше характеризует приоритеты и задачи, поставленные руководством компании перед учёными, разрабатывающими систему.&lt;/p&gt;\r\n&lt;p&gt;Президент компании Green Implant System Technologie GmbH &amp; Co.KG ( Германия) д.м.н. проф. Мушеев И.У.&lt;/p&gt;','','имплантационные системы green','Имплантационные системы GREEN','Имплантационные системы GREEN'),
	(21,1,'','','имплантационные системы cortex','Имплантационные системы CORTEX','Имплантационные системы CORTEX');

/*!40000 ALTER TABLE `comcs_manufacturer_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_manufacturer_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_manufacturer_to_store`;

CREATE TABLE `comcs_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_manufacturer_to_store` WRITE;
/*!40000 ALTER TABLE `comcs_manufacturer_to_store` DISABLE KEYS */;

INSERT INTO `comcs_manufacturer_to_store` (`manufacturer_id`, `store_id`)
VALUES
	(11,0),
	(12,0),
	(13,0),
	(14,0),
	(15,0),
	(16,0),
	(17,0),
	(18,0),
	(19,0),
	(20,0),
	(21,0);

/*!40000 ALTER TABLE `comcs_manufacturer_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_option`;

CREATE TABLE `comcs_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_option` WRITE;
/*!40000 ALTER TABLE `comcs_option` DISABLE KEYS */;

INSERT INTO `comcs_option` (`option_id`, `type`, `sort_order`)
VALUES
	(15,'select',1),
	(14,'select',1),
	(16,'image',1),
	(17,'select',1),
	(18,'select',1),
	(19,'radio',0),
	(20,'radio',1),
	(21,'select',1),
	(22,'select',1),
	(23,'select',1);

/*!40000 ALTER TABLE `comcs_option` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_option_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_option_description`;

CREATE TABLE `comcs_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_option_description` WRITE;
/*!40000 ALTER TABLE `comcs_option_description` DISABLE KEYS */;

INSERT INTO `comcs_option_description` (`option_id`, `language_id`, `name`)
VALUES
	(14,1,'Типоразмер имплантата (диаметр/длина) [GREEN]'),
	(15,1,'Типоразмер формирователя десны (диаметр/длина) [GREEN]'),
	(16,1,'Модификации с изображением [GREEN]'),
	(17,1,'Модификации [GREEN]'),
	(18,1,'Типоразмер префикса (диаметр) [GREEN]'),
	(19,1,'Угол наклона префикса [GREEN]'),
	(20,1,'Спецификации [БИОМАТЕРИАЛЫ]'),
	(21,1,'Модификации протетика плюс [GREEN]'),
	(22,1,'Типоразмер инструмента [GREEN]'),
	(23,1,'Модификации аксессуары [GREEN]');

/*!40000 ALTER TABLE `comcs_option_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_option_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_option_value`;

CREATE TABLE `comcs_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_option_value` WRITE;
/*!40000 ALTER TABLE `comcs_option_value` DISABLE KEYS */;

INSERT INTO `comcs_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`)
VALUES
	(63,14,'no_image.jpg',4),
	(61,14,'no_image.jpg',7),
	(60,14,'no_image.jpg',6),
	(59,14,'no_image.jpg',5),
	(58,14,'no_image.jpg',4),
	(56,14,'no_image.jpg',7),
	(55,14,'no_image.jpg',6),
	(54,14,'no_image.jpg',5),
	(53,14,'no_image.jpg',4),
	(52,14,'no_image.jpg',7),
	(51,14,'no_image.jpg',6),
	(66,14,'no_image.jpg',7),
	(67,14,'no_image.jpg',3),
	(68,14,'no_image.jpg',4),
	(69,14,'no_image.jpg',5),
	(70,14,'no_image.jpg',6),
	(71,14,'no_image.jpg',7),
	(72,14,'no_image.jpg',3),
	(73,14,'no_image.jpg',4),
	(74,14,'no_image.jpg',5),
	(75,14,'no_image.jpg',6),
	(76,14,'no_image.jpg',7),
	(82,14,'no_image.jpg',3),
	(83,14,'no_image.jpg',2),
	(84,14,'no_image.jpg',2),
	(86,14,'no_image.jpg',4),
	(87,14,'no_image.jpg',5),
	(88,14,'no_image.jpg',1),
	(89,14,'no_image.jpg',1),
	(64,14,'no_image.jpg',5),
	(65,14,'no_image.jpg',6),
	(77,14,'no_image.jpg',2),
	(78,14,'no_image.jpg',3),
	(79,14,'no_image.jpg',2),
	(80,14,'no_image.jpg',3),
	(81,14,'no_image.jpg',2),
	(90,14,'no_image.jpg',1),
	(91,14,'no_image.jpg',1),
	(99,15,'no_image.jpg',2),
	(98,15,'no_image.jpg',2),
	(97,15,'no_image.jpg',2),
	(96,15,'no_image.jpg',1),
	(95,15,'no_image.jpg',1),
	(94,15,'no_image.jpg',1),
	(93,15,'no_image.jpg',1),
	(92,15,'no_image.jpg',1),
	(103,15,'no_image.jpg',3),
	(104,15,'no_image.jpg',3),
	(105,15,'no_image.jpg',3),
	(106,15,'no_image.jpg',3),
	(107,15,'no_image.jpg',3),
	(108,15,'no_image.jpg',5),
	(109,15,'no_image.jpg',5),
	(110,15,'no_image.jpg',5),
	(111,15,'no_image.jpg',5),
	(112,15,'no_image.jpg',5),
	(169,16,'data/optcii/550325.png',3),
	(168,16,'data/optcii/550225.png',2),
	(260,17,'no_image.jpg',1),
	(259,17,'no_image.jpg',3),
	(126,18,'no_image.jpg',4),
	(100,15,'no_image.jpg',2),
	(101,15,'no_image.jpg',2),
	(102,15,'no_image.jpg',3),
	(113,15,'no_image.jpg',4),
	(114,15,'no_image.jpg',4),
	(115,15,'no_image.jpg',4),
	(116,15,'no_image.jpg',4),
	(117,15,'no_image.jpg',4),
	(118,15,'no_image.jpg',4),
	(125,18,'no_image.jpg',3),
	(123,18,'no_image.jpg',1),
	(124,18,'no_image.jpg',2),
	(127,19,'no_image.jpg',1),
	(128,19,'no_image.jpg',2),
	(167,16,'data/optcii/550125.png',1),
	(163,16,'data/optcii/550300.png',3),
	(162,16,'data/optcii/550200.png',2),
	(161,16,'data/optcii/550100.png',1),
	(156,16,'data/optcii/530451.png',4),
	(155,16,'data/optcii/530351.png',3),
	(154,16,'data/optcii/530251.png',2),
	(153,16,'data/optcii/530151.png',1),
	(144,16,'data/optcii/548538.png',2),
	(143,16,'data/optcii/548545.png',1),
	(136,16,'data/optcii/522835.png',2),
	(135,16,'data/optcii/520835.png',1),
	(134,16,'data/optcii/521145.png',3),
	(133,16,'data/optcii/520950.png',2),
	(132,16,'data/optcii/520845.png',1),
	(131,16,'data/optcii/501345.png',3),
	(130,16,'data/optcii/500945.png',2),
	(129,16,'data/optcii/500939.png',1),
	(257,17,'no_image.jpg',1),
	(251,17,'no_image.jpg',1),
	(250,17,'no_image.jpg',3),
	(249,17,'no_image.jpg',2),
	(120,16,'data/optcii/240347.jpg',1),
	(119,16,'data/optcii/240547.jpg',2),
	(137,16,'data/optcii/501239.png',1),
	(138,16,'data/optcii/501245.png',2),
	(139,16,'data/optcii/501263.png',3),
	(140,16,'data/optcii/501280.png',4),
	(141,16,'data/optcii/521345.jpg',1),
	(142,16,'data/optcii/521355.png',2),
	(145,16,'data/optcii/541245.png',1),
	(146,16,'data/optcii/541263.png',2),
	(157,16,'data/optcii/530153.png',1),
	(158,16,'data/optcii/530253.png',2),
	(159,16,'data/optcii/530353.png',3),
	(160,16,'data/optcii/530453.png',4),
	(164,16,'data/optcii/550115.png',1),
	(165,16,'data/optcii/550215.png',2),
	(166,16,'data/optcii/550315.png',3),
	(245,17,'no_image.jpg',1),
	(244,17,'no_image.jpg',3),
	(243,17,'no_image.jpg',2),
	(237,17,'no_image.jpg',1),
	(233,17,'no_image.jpg',6),
	(232,17,'no_image.jpg',5),
	(231,17,'no_image.jpg',4),
	(230,17,'no_image.jpg',3),
	(224,17,'no_image.jpg',1),
	(223,17,'no_image.jpg',4),
	(222,17,'no_image.jpg',3),
	(221,17,'no_image.jpg',2),
	(216,17,'no_image.jpg',1),
	(215,17,'no_image.jpg',3),
	(214,17,'no_image.jpg',2),
	(210,17,'no_image.jpg',1),
	(209,17,'no_image.jpg',3),
	(208,17,'no_image.jpg',2),
	(206,17,'no_image.jpg',3),
	(205,17,'no_image.jpg',2),
	(201,17,'no_image.jpg',1),
	(200,17,'no_image.jpg',3),
	(199,17,'no_image.jpg',2),
	(194,17,'no_image.jpg',1),
	(193,17,'no_image.jpg',4),
	(192,17,'no_image.jpg',3),
	(191,17,'no_image.jpg',2),
	(186,17,'no_image.jpg',1),
	(185,17,'no_image.jpg',4),
	(184,17,'no_image.jpg',3),
	(183,17,'no_image.jpg',2),
	(178,17,'no_image.jpg',1),
	(177,17,'no_image.jpg',4),
	(176,17,'no_image.jpg',3),
	(175,17,'no_image.jpg',2),
	(170,17,'no_image.jpg',1),
	(152,17,'no_image.jpg',4),
	(151,17,'no_image.jpg',3),
	(122,17,'no_image.jpg',2),
	(121,17,'no_image.jpg',1),
	(147,17,'no_image.jpg',1),
	(149,17,'no_image.jpg',1),
	(148,17,'no_image.jpg',2),
	(150,17,'no_image.jpg',2),
	(171,17,'no_image.jpg',2),
	(172,17,'no_image.jpg',3),
	(173,17,'no_image.jpg',4),
	(174,17,'no_image.jpg',1),
	(179,17,'no_image.jpg',2),
	(180,17,'no_image.jpg',3),
	(181,17,'no_image.jpg',4),
	(182,17,'no_image.jpg',1),
	(187,17,'no_image.jpg',2),
	(188,17,'no_image.jpg',3),
	(189,17,'no_image.jpg',4),
	(190,17,'no_image.jpg',1),
	(195,17,'no_image.jpg',2),
	(196,17,'no_image.jpg',3),
	(197,17,'no_image.jpg',4),
	(198,17,'no_image.jpg',1),
	(202,17,'no_image.jpg',2),
	(203,17,'no_image.jpg',3),
	(234,20,'no_image.jpg',1),
	(204,17,'no_image.jpg',1),
	(207,17,'no_image.jpg',1),
	(211,17,'no_image.jpg',2),
	(212,17,'no_image.jpg',3),
	(213,17,'no_image.jpg',1),
	(217,17,'no_image.jpg',2),
	(218,17,'no_image.jpg',3),
	(219,17,'no_image.jpg',4),
	(220,17,'no_image.jpg',1),
	(225,17,'no_image.jpg',2),
	(226,17,'no_image.jpg',3),
	(227,17,'no_image.jpg',4),
	(228,17,'no_image.jpg',1),
	(229,17,'no_image.jpg',2),
	(238,17,'no_image.jpg',2),
	(239,17,'no_image.jpg',3),
	(240,17,'no_image.jpg',4),
	(241,17,'no_image.jpg',5),
	(242,17,'no_image.jpg',1),
	(246,17,'no_image.jpg',2),
	(247,17,'no_image.jpg',3),
	(252,17,'no_image.jpg',2),
	(248,17,'no_image.jpg',1),
	(253,17,'no_image.jpg',3),
	(258,17,'no_image.jpg',2),
	(261,17,'no_image.jpg',2),
	(262,17,'no_image.jpg',3),
	(235,20,'no_image.jpg',2),
	(236,20,'no_image.jpg',3),
	(263,20,'',1),
	(264,20,'',2),
	(265,20,'',3),
	(352,21,'no_image.jpg',1),
	(351,21,'no_image.jpg',3),
	(350,21,'no_image.jpg',2),
	(344,21,'no_image.jpg',1),
	(343,21,'no_image.jpg',3),
	(342,21,'no_image.jpg',2),
	(338,21,'no_image.jpg',1),
	(337,21,'no_image.jpg',3),
	(336,21,'no_image.jpg',2),
	(332,21,'no_image.jpg',2),
	(331,21,'no_image.jpg',1),
	(328,21,'no_image.jpg',1),
	(327,21,'no_image.jpg',3),
	(326,21,'no_image.jpg',2),
	(322,21,'no_image.jpg',1),
	(321,21,'no_image.jpg',3),
	(320,21,'no_image.jpg',2),
	(318,21,'no_image.jpg',4),
	(317,21,'no_image.jpg',3),
	(316,21,'no_image.jpg',2),
	(311,21,'no_image.jpg',1),
	(310,21,'no_image.jpg',4),
	(309,21,'no_image.jpg',3),
	(308,21,'no_image.jpg',2),
	(303,21,'no_image.jpg',1),
	(302,21,'no_image.jpg',4),
	(301,21,'no_image.jpg',3),
	(300,21,'no_image.jpg',2),
	(295,21,'no_image.jpg',1),
	(294,21,'no_image.jpg',4),
	(293,21,'no_image.jpg',3),
	(292,21,'no_image.jpg',2),
	(287,21,'no_image.jpg',1),
	(286,21,'no_image.jpg',3),
	(285,21,'no_image.jpg',2),
	(281,21,'no_image.jpg',2),
	(280,21,'no_image.jpg',1),
	(279,21,'no_image.jpg',2),
	(278,21,'no_image.jpg',1),
	(274,21,'no_image.jpg',1),
	(273,21,'no_image.jpg',2),
	(272,21,'no_image.jpg',1),
	(269,21,'no_image.jpg',1),
	(268,21,'no_image.jpg',3),
	(267,21,'no_image.jpg',2),
	(266,21,'no_image.jpg',1),
	(270,21,'no_image.jpg',2),
	(271,21,'no_image.jpg',3),
	(275,21,'no_image.jpg',2),
	(276,21,'no_image.jpg',3),
	(277,21,'no_image.jpg',4),
	(282,21,'no_image.jpg',1),
	(283,21,'no_image.jpg',2),
	(284,21,'no_image.jpg',1),
	(288,21,'no_image.jpg',2),
	(289,21,'no_image.jpg',3),
	(290,21,'no_image.jpg',4),
	(291,21,'no_image.jpg',1),
	(296,21,'no_image.jpg',2),
	(297,21,'no_image.jpg',3),
	(298,21,'no_image.jpg',4),
	(299,21,'no_image.jpg',1),
	(304,21,'no_image.jpg',2),
	(305,21,'no_image.jpg',3),
	(306,21,'no_image.jpg',4),
	(307,21,'no_image.jpg',1),
	(312,21,'no_image.jpg',2),
	(313,21,'no_image.jpg',3),
	(314,21,'no_image.jpg',4),
	(315,21,'no_image.jpg',1),
	(319,21,'no_image.jpg',1),
	(323,21,'no_image.jpg',2),
	(324,21,'no_image.jpg',3),
	(325,21,'no_image.jpg',1),
	(329,21,'no_image.jpg',2),
	(330,21,'no_image.jpg',3),
	(333,21,'no_image.jpg',1),
	(334,21,'no_image.jpg',2),
	(335,21,'no_image.jpg',1),
	(339,21,'no_image.jpg',2),
	(340,21,'no_image.jpg',3),
	(341,21,'no_image.jpg',1),
	(345,21,'no_image.jpg',2),
	(346,21,'no_image.jpg',3),
	(347,21,'no_image.jpg',4),
	(348,21,'no_image.jpg',5),
	(349,21,'no_image.jpg',1),
	(353,21,'no_image.jpg',2),
	(354,21,'no_image.jpg',3),
	(355,21,'',1),
	(356,21,'',2),
	(357,21,'',3),
	(416,22,'no_image.jpg',2),
	(415,22,'no_image.jpg',1),
	(412,22,'no_image.jpg',2),
	(411,22,'no_image.jpg',1),
	(403,22,'no_image.jpg',3),
	(402,22,'no_image.jpg',2),
	(401,22,'no_image.jpg',1),
	(398,22,'no_image.jpg',2),
	(397,22,'no_image.jpg',1),
	(394,22,'no_image.jpg',4),
	(393,22,'no_image.jpg',3),
	(392,22,'no_image.jpg',2),
	(386,22,'no_image.jpg',1),
	(385,22,'no_image.jpg',5),
	(384,22,'no_image.jpg',4),
	(383,22,'no_image.jpg',3),
	(382,22,'no_image.jpg',2),
	(376,22,'no_image.jpg',1),
	(375,22,'no_image.jpg',5),
	(374,22,'no_image.jpg',4),
	(373,22,'no_image.jpg',3),
	(372,22,'no_image.jpg',2),
	(366,22,'no_image.jpg',1),
	(365,22,'no_image.jpg',5),
	(364,22,'no_image.jpg',4),
	(363,22,'no_image.jpg',3),
	(362,22,'no_image.jpg',2),
	(360,22,'no_image.jpg',3),
	(359,22,'no_image.jpg',1),
	(358,22,'no_image.jpg',2),
	(361,22,'no_image.jpg',1),
	(367,22,'no_image.jpg',2),
	(368,22,'no_image.jpg',3),
	(369,22,'no_image.jpg',4),
	(370,22,'no_image.jpg',5),
	(371,22,'no_image.jpg',1),
	(377,22,'no_image.jpg',2),
	(378,22,'no_image.jpg',3),
	(379,22,'no_image.jpg',4),
	(380,22,'no_image.jpg',5),
	(381,22,'no_image.jpg',1),
	(387,22,'no_image.jpg',2),
	(388,22,'no_image.jpg',3),
	(389,22,'no_image.jpg',4),
	(390,22,'no_image.jpg',5),
	(391,22,'no_image.jpg',1),
	(395,22,'no_image.jpg',1),
	(396,22,'no_image.jpg',2),
	(399,22,'no_image.jpg',1),
	(400,22,'no_image.jpg',2),
	(404,22,'no_image.jpg',4),
	(405,22,'no_image.jpg',5),
	(406,22,'no_image.jpg',6),
	(407,22,'no_image.jpg',7),
	(408,22,'no_image.jpg',8),
	(409,22,'no_image.jpg',9),
	(410,22,'no_image.jpg',10),
	(413,22,'no_image.jpg',1),
	(414,22,'no_image.jpg',2),
	(417,22,'no_image.jpg',1),
	(418,22,'no_image.jpg',2),
	(419,22,'',1),
	(420,22,'',2),
	(434,23,'no_image.jpg',2),
	(433,23,'no_image.jpg',1),
	(432,23,'no_image.jpg',4),
	(431,23,'no_image.jpg',3),
	(426,23,'no_image.jpg',2),
	(424,23,'no_image.jpg',4),
	(425,23,'no_image.jpg',1),
	(421,23,'no_image.jpg',1),
	(423,23,'no_image.jpg',3),
	(427,23,'no_image.jpg',3),
	(422,23,'no_image.jpg',2),
	(428,23,'no_image.jpg',4),
	(429,23,'no_image.jpg',1),
	(430,23,'no_image.jpg',2),
	(435,23,'no_image.jpg',3),
	(436,23,'no_image.jpg',4),
	(437,23,'',1),
	(438,23,'',2),
	(439,23,'',3),
	(440,23,'',4);

/*!40000 ALTER TABLE `comcs_option_value` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_option_value_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_option_value_description`;

CREATE TABLE `comcs_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_option_value_description` WRITE;
/*!40000 ALTER TABLE `comcs_option_value_description` DISABLE KEYS */;

INSERT INTO `comcs_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`)
VALUES
	(63,1,14,'3.75mmd/11.5mml'),
	(61,1,14,'6.0mmd/10mml'),
	(60,1,14,'5.0mmd/10mml'),
	(59,1,14,'4.2mmd/10mml'),
	(58,1,14,'3.75mmd/10mml'),
	(56,1,14,'6.0mmd/8mml'),
	(55,1,14,'5.0mmd/8mml'),
	(54,1,14,'4.2mmd/8mml'),
	(53,1,14,'3.75mmd/8mml'),
	(52,1,14,'6.0mmd/6mml'),
	(51,1,14,'5.0mmd/6mml'),
	(66,1,14,'6.0mmd/11.5mml'),
	(67,1,14,'3.3mmd/13mml'),
	(68,1,14,'3.75mmd/13mml'),
	(69,1,14,'4.2mmd/13mml'),
	(70,1,14,'5.0mmd/13mml'),
	(71,1,14,'6.0mmd/13mml'),
	(72,1,14,'3.3mmd/16mml'),
	(73,1,14,'3.75mmd/16mml'),
	(74,1,14,'4.2mmd/16mml'),
	(75,1,14,'5.0mmd/16mml'),
	(76,1,14,'6.0mmd/16mml'),
	(82,1,14,'3.3mmd/11.5mml'),
	(83,1,14,'3.0mmd/13mml'),
	(84,1,14,'3.0mmd/16mml'),
	(86,1,14,'3.75mmd/18mml'),
	(87,1,14,'4.2mmd/18mml'),
	(88,1,14,'2.4mmd/10mml'),
	(89,1,14,'2.4mmd/11.5mml'),
	(64,1,14,'4.2mmd/11.5mml'),
	(65,1,14,'5.0mmd/11.5mml'),
	(77,1,14,'3.0mmd/8mml'),
	(78,1,14,'3.3mmd/8mml'),
	(79,1,14,'3.0mmd/10mml'),
	(80,1,14,'3.3mmd/10mml'),
	(81,1,14,'3.0mmd/11.5mml'),
	(90,1,14,'2.4mmd/13mml'),
	(91,1,14,'2.4mmd/16mml'),
	(118,1,15,'5.0mmd/7mml'),
	(117,1,15,'5.0mmd/6mml'),
	(116,1,15,'5.0mmd/5mml'),
	(115,1,15,'5.0mmd/4mml'),
	(114,1,15,'5.0mmd/3mml'),
	(113,1,15,'5.0mmd/2mml'),
	(102,1,15,'4.5mmd/2mml'),
	(101,1,15,'3.8mmd/7mml'),
	(100,1,15,'3.8mmd/6mml'),
	(99,1,15,'3.8mmd/5mml'),
	(98,1,15,'3.8mmd/4mml'),
	(97,1,15,'3.8mmd/3mml'),
	(96,1,15,'3.0mmd/7mml'),
	(95,1,15,'3.0mmd/6mml'),
	(94,1,15,'3.0mmd/5mml'),
	(93,1,15,'3.0mmd/4mml'),
	(92,1,15,'3.0mmd/3mml'),
	(103,1,15,'4.5mmd/3mml'),
	(104,1,15,'4.5mmd/4mml'),
	(105,1,15,'4.5mmd/5mml'),
	(106,1,15,'4.5mmd/6mml'),
	(107,1,15,'4.5mmd/7mml'),
	(108,1,15,'6.0mmd/2mml'),
	(109,1,15,'6.0mmd/3mml'),
	(110,1,15,'6.0mmd/4mml'),
	(111,1,15,'6.0mmd/5mml'),
	(112,1,15,'6.0mmd/6mml'),
	(168,1,16,'550225 - высота уступа 2мм'),
	(169,1,16,'550325 - высота уступа 3мм'),
	(262,1,17,'701240 - длинный'),
	(261,1,17,'701230 - обычный'),
	(126,1,18,'6mmd'),
	(125,1,18,'5mmd'),
	(123,1,18,'3.75mmd'),
	(124,1,18,'4.2mmd'),
	(128,1,19,'30°'),
	(127,1,19,'17°'),
	(167,1,16,'550125 - высота уступа 1мм'),
	(163,1,16,'550300 - высота уступа 3мм'),
	(162,1,16,'550200 - высота уступа 2мм'),
	(155,1,16,'530351 - высота уступа 3мм'),
	(156,1,16,'530451 - высота уступа 4мм'),
	(161,1,16,'550100 - высота уступа 1мм'),
	(154,1,16,'530251 - высота уступа 2мм'),
	(153,1,16,'530151 - высота уступа 1мм'),
	(144,1,16,'548538 - узкий 3.8ммд'),
	(143,1,16,'548545 - нормальный 4.5ммд'),
	(136,1,16,'Длинный (522835)'),
	(132,1,16,'Нормальный, 4.5mmd/8mml (520845)'),
	(135,1,16,'Стандартный (520835)'),
	(134,1,16,'Длинный, 4.5mmd/11mml (521145)'),
	(133,1,16,'Широкий, 5.0mmd/9mml (520950)'),
	(131,1,16,'Длинный, 4.5mmd/13mml (501345)'),
	(130,1,16,'Нормальный, 4.5mmd/9mml (500945)'),
	(260,1,17,'701220 - короткий'),
	(257,1,17,'701202 - короткий'),
	(259,1,17,'701204 - длинный'),
	(251,1,17,'631141 - высота 1.0мм'),
	(250,1,17,'630341 - высота 3.0мм'),
	(249,1,17,'630241 - высота 2.0мм'),
	(119,1,16,'Обычный (240547)'),
	(120,1,16,'Короткий (240347)'),
	(129,1,16,'Тонкий, 3.9mmd/9mml (500939)'),
	(137,1,16,'Узкий, 3.9mmd (501239)'),
	(138,1,16,'Нормальный, 4.5mmd (501245)'),
	(139,1,16,'Широкий, 6.3mmd (501263)'),
	(140,1,16,'Экстра широкий, 8.0mmd (501280)'),
	(141,1,16,'Нормальный, 4.5mmd (521345)'),
	(142,1,16,'Широкий, 5.5mmd (521355)'),
	(145,1,16,'541245 - нормальный (диаметр 4.5мм)'),
	(146,1,16,'541263 - широкий (диаметр 6.3мм)'),
	(157,1,16,'530153 - высота уступа 1мм'),
	(158,1,16,'530253 - высота уступа 2мм'),
	(159,1,16,'530353 - высота уступа 3мм'),
	(160,1,16,'530453 - высота уступа 4мм'),
	(164,1,16,' 550115 - высота уступа 1мм'),
	(165,1,16,'550215 - высота уступа 2мм'),
	(166,1,16,'550315 - высота уступа 3мм'),
	(245,1,17,'610547 - высота уступа 0.5мм'),
	(244,1,17,'612548 - высота уступа 2.5мм'),
	(243,1,17,'611548 - высота уступа 1.5мм'),
	(237,1,17,'602540 - высота 2.5мм'),
	(233,1,17,'626040 - высота тела абатмента 6мм'),
	(232,1,17,'625040 - высота тела абатмента 5мм'),
	(231,1,17,'624040 - высота тела абатмента 4мм'),
	(230,1,17,'623040 - высота тела абатмента 3мм'),
	(224,1,17,'570052 - высота уступа 0.5мм'),
	(223,1,17,'570350 - высота уступа 3.0мм'),
	(222,1,17,'570250 - высота уступа 2,0мм'),
	(221,1,17,'570150 - высота уступа 1.0мм'),
	(216,1,17,'560050 - высота уступа 0.5мм'),
	(214,1,17,'530277 - высота уступа 2мм'),
	(215,1,17,'530377 - высота уступа 3мм'),
	(210,1,17,'530175 - высота уступа 1мм'),
	(209,1,17,'531335 - с анатомическим уступом 3мм'),
	(208,1,17,'531235 - с анатомическим уступом 2мм'),
	(206,1,17,'530335 - с анатом. уступом 3мм'),
	(200,1,17,'530345 - высота уступа 3мм'),
	(201,1,17,'530147 - высота уступа 1мм'),
	(205,1,17,'530235 - с анатом. уступом 2мм'),
	(199,1,17,'530245 - высота уступа 2мм'),
	(194,1,17,'510176 - высота уступа 1мм'),
	(193,1,17,'510446 - высота уступа 4мм'),
	(192,1,17,'510346 - высота уступа 3мм'),
	(191,1,17,'510246 - высота уступа 2мм'),
	(186,1,17,'510186 - высота уступа 1мм'),
	(185,1,17,'510475 - высота уступа 4мм'),
	(184,1,17,'510375 - высота уступа 3мм'),
	(183,1,17,'510275 - высота уступа 2мм'),
	(178,1,17,'510135 - высота уступа1мм'),
	(177,1,17,'510456 - высота уступа 4мм'),
	(151,1,17,'510347 - высота уступа 3мм'),
	(152,1,17,'510447 - высота уступа 4мм'),
	(170,1,17,'510145 - высота уступа1мм'),
	(175,1,17,'510256 - высота уступа 2мм'),
	(176,1,17,'510356 - высота уступа 3мм'),
	(121,1,17,'Для внутр. шестигранника 2.1mmd'),
	(122,1,17,'Для внутр. шестигранника 2.43mmd'),
	(147,1,17,'549945 - с внутренним шестигранником'),
	(149,1,17,'510147 - высота уступа 1мм'),
	(148,1,17,'549955 - с круглым внутренним основанием'),
	(150,1,17,'510247 - высота уступа 2мм'),
	(171,1,17,'510245 - высота уступа 2мм'),
	(190,1,17,'510146 - высота уступа 1мм'),
	(189,1,17,'510486 - высота уступа 4мм'),
	(188,1,17,'510386 - высота уступа 3мм'),
	(187,1,17,'510286 - высота уступа 2мм'),
	(182,1,17,'510175 - высота уступа 1мм'),
	(181,1,17,'510435 - высота уступа 4мм'),
	(180,1,17,'510335 - высота уступа 3мм'),
	(179,1,17,'510235 - высота уступа 2мм'),
	(174,1,17,'510156 - высота уступа 1мм'),
	(173,1,17,'510445 - высота уступа 4мм'),
	(172,1,17,'510345 - высота уступа 3мм'),
	(196,1,17,'510376 - высота уступа 3мм'),
	(195,1,17,'510276 - высота уступа 2мм'),
	(197,1,17,'510476 - высота уступа 4мм'),
	(198,1,17,'530145 - высота уступа 1мм'),
	(211,1,17,'530275 - высота уступа 2мм'),
	(207,1,17,'531135 - с анатомическим уступом 1мм'),
	(204,1,17,'530135 - с анатом. уступом 1мм'),
	(203,1,17,'530347 - высота уступа 3мм'),
	(236,1,20,'3206'),
	(235,1,20,'3236'),
	(234,1,20,'3225'),
	(202,1,17,'530247 - высота уступа 2мм'),
	(212,1,17,'530375 - высота уступа 3мм'),
	(213,1,17,'530177 - высота уступа 1мм'),
	(217,1,17,'560150 - высота уступа 1мм'),
	(218,1,17,'560250 - высота уступа 2мм'),
	(219,1,17,'560350 - высота уступа 3мм'),
	(220,1,17,'570050 - высота уступа 0.5мм'),
	(225,1,17,'570152 - высота уступа 1.0мм'),
	(226,1,17,'570252 - высота уступа 2.0мм'),
	(228,1,17,'620540 - высота тела абатмента 0.5мм'),
	(227,1,17,'570352 - высота уступа 3.0мм'),
	(229,1,17,'622040 - высота тела абатмента 2мм'),
	(241,1,17,'606040 - высота 6.0мм'),
	(240,1,17,'605040 - высота 5.0мм'),
	(239,1,17,'604040 - высота 4.0мм'),
	(238,1,17,'603040 - высота 3.0мм'),
	(242,1,17,'610548 - высота уступа 0.5мм'),
	(246,1,17,'611547 - высота уступа 1.5мм'),
	(247,1,17,'612547 - высота уступа 2.5мм'),
	(248,1,17,'630141 - высота 1.0мм'),
	(252,1,17,'631241 - высота 2.0мм'),
	(253,1,17,'631341 - высота 3.0мм'),
	(258,1,17,'701203 - обычный'),
	(263,1,20,'16 х 20'),
	(264,1,20,'22 х 32'),
	(265,1,20,'32 х 42'),
	(344,1,21,'602550'),
	(343,1,21,'612567'),
	(342,1,21,'611567'),
	(338,1,21,'532177 - высота уступа 1мм'),
	(337,1,21,'532375 - высота уступа 3мм'),
	(336,1,21,'532275 - высота уступа 2мм'),
	(332,1,21,'532235 - с анатомическим уступом 2мм'),
	(328,1,21,'532147 - высота уступа 1мм'),
	(331,1,21,'532135 - с анатомическим уступом 1мм'),
	(327,1,21,'532345 - высота уступа 3мм'),
	(326,1,21,'532245 - высота уступа 2мм'),
	(322,1,21,'511176 - высота уступа 1мм'),
	(321,1,21,'511346 - высота уступа 3мм'),
	(320,1,21,'511246 - высота уступа 2мм'),
	(318,1,21,'511486 - высота уступа 4мм'),
	(317,1,21,'511386 - высота уступа 3мм'),
	(316,1,21,'511286 - высота уступа 2мм'),
	(311,1,21,'511175 - высота уступа 1мм'),
	(310,1,21,'511435 - высота уступа 4мм'),
	(309,1,21,'511335 - высота уступа 3мм'),
	(308,1,21,'511235 - высота уступа 2мм'),
	(303,1,21,'511156 - высота уступа 1мм'),
	(302,1,21,'511445 - высота уступа 3мм'),
	(301,1,21,'511345 - высота уступа 3мм'),
	(300,1,21,'511245 - высота уступа 2мм'),
	(295,1,21,'532153 - высота уступа 1мм'),
	(294,1,21,'532451 - высота уступа 4мм'),
	(293,1,21,'532351 - высота уступа 3мм'),
	(292,1,21,'532251 - высота уступа 2мм'),
	(287,1,21,'512147 - высота уступа 1мм'),
	(286,1,21,'542660 - экстра широкий (∅ уступа 6.0мм)'),
	(285,1,21,'542650 - широкий (∅ уступа 5.0мм)'),
	(281,1,21,'549538 - узкий (∅ 3.8мм)'),
	(280,1,21,'548555 - нормальный (∅ 4.5мм)'),
	(279,1,21,'523355 - широкий (∅ 5.5мм)'),
	(278,1,21,'523345 - нормальный (∅ 4.5мм)'),
	(274,1,21,'502239 - узкий (∅ 3.9мм)'),
	(273,1,21,'525835 - длинный'),
	(272,1,21,'523835 - стандартный'),
	(269,1,21,'523845 - нормальный (4.5ммд/8ммв)'),
	(268,1,21,'502345 - длинный (4.5ммд/13ммв)'),
	(267,1,21,'501945 - нормальный (4.5ммд/9ммв)'),
	(266,1,21,'501939 - тонкий (3.9ммд/9ммв)'),
	(270,1,21,'523950 - широкий (5.0ммд/9ммв)'),
	(271,1,21,'523145 - длинный (4.5ммд/11ммв)'),
	(275,1,21,'502245 - нормальный (∅ 4.5мм)'),
	(276,1,21,'502263 - широкий (∅ 6.3мм)'),
	(277,1,21,'502280 - экстра широкий (∅ 8.0мм)'),
	(282,1,21,'542245 - нормальный (∅ 4.5мм)'),
	(283,1,21,'542263 - широкий (∅ 6.3мм)'),
	(288,1,21,'512247 - высота уступа 2мм'),
	(284,1,21,'542645 - нормальный (∅ уступа 4.5мм)'),
	(289,1,21,'512347 - высота уступа 3мм'),
	(290,1,21,'512447 - высота уступа 4мм'),
	(291,1,21,'532151 - высота уступа 1мм'),
	(296,1,21,'532253 - высота уступа 2мм'),
	(297,1,21,'532353 - высота уступа 3мм'),
	(298,1,21,'532453 - высота уступа 4мм'),
	(299,1,21,'511145 - высота уступа 1мм'),
	(304,1,21,'511256 - высота уступа 2мм'),
	(305,1,21,'511356 - высота уступа 3мм'),
	(306,1,21,'511456 - высота уступа 3мм'),
	(307,1,21,'511135 - высота уступа 1мм'),
	(312,1,21,'511275 - высота уступа 2мм'),
	(313,1,21,'511375 - высота уступа 3мм'),
	(314,1,21,'511475 - высота уступа 4мм'),
	(315,1,21,'511186 - высота уступа 1мм'),
	(319,1,21,'511146 - высота уступа 1мм'),
	(323,1,21,'511276 - высота уступа 2мм'),
	(324,1,21,'511376 - высота уступа 3мм'),
	(330,1,21,'532347 - высота уступа 3мм'),
	(329,1,21,'532247 - высота уступа 2мм'),
	(325,1,21,'532145 - высота уступа 1мм'),
	(335,1,21,'532175 - высота уступа 1мм'),
	(334,1,21,'533235 - с анатомическим уступом 2мм'),
	(333,1,21,'533135 - с анатомическим уступом 1мм'),
	(339,1,21,'532277 - высота уступа 2мм'),
	(340,1,21,'532377 - высота уступа 3мм'),
	(341,1,21,'610567'),
	(345,1,21,'603050'),
	(346,1,21,'604050'),
	(347,1,21,'605050'),
	(348,1,21,'606050'),
	(349,1,21,'610557'),
	(350,1,21,'611557'),
	(351,1,21,'612557'),
	(352,1,21,'632141'),
	(353,1,21,'632241'),
	(354,1,21,'632341'),
	(355,1,21,'633141'),
	(356,1,21,'633241'),
	(357,1,21,'633341'),
	(419,1,22,'432312 - короткий'),
	(420,1,22,'432912 - длинный'),
	(418,1,22,'431712 - длинный'),
	(416,1,22,'431412 - длинный'),
	(417,1,22,'431212 - короткий'),
	(415,1,22,'431112 - короткий'),
	(412,1,22,'431821 - длинный'),
	(411,1,22,'430521 - короткий'),
	(403,1,22,'Прямой 3,2ddm - 421003'),
	(402,1,22,'Прямой 2,5ddm - 421002'),
	(401,1,22,'Прямой 2,0ddm - 421001'),
	(398,1,22,'702807 - средний'),
	(397,1,22,'702107 - длинный'),
	(394,1,22,'470607 - с наруж. ∅ 7ммд и внутр. ∅ 8ммд'),
	(393,1,22,'470506 - с наруж. ∅ 6ммд и внутр. ∅ 7ммд'),
	(392,1,22,'470405 - с наруж. ∅ 5ммд и внутр. ∅ 4ммд'),
	(386,1,22,'5,2mmdX6mml (410652)'),
	(385,1,22,'4,2mmdX13mml (411342)'),
	(384,1,22,'4,2mmdX11,5mml (411142)'),
	(383,1,22,'4,2mmdX10mml (411042)'),
	(382,1,22,'4,2mmdX8mml (410842)'),
	(376,1,22,'3,7mmdX6mml (410637)'),
	(375,1,22,'3,2mmdX13mml (411332)'),
	(374,1,22,'3,2mmdX11,5mml (411132)'),
	(373,1,22,'3,2mmdX10mml (411032)'),
	(372,1,22,'3,2mmdX8mml (410832)'),
	(366,1,22,'2,8mmdX6mml (411628)'),
	(365,1,22,'2,0mmdX13mml (411320)'),
	(364,1,22,'2,0mmdX11,5mml (411120)'),
	(363,1,22,'2,0mmdX10mml (411020)'),
	(362,1,22,'2,0mmdX8mml (410820)'),
	(360,1,22,'452209 - для имплантата вектор'),
	(359,1,22,'451030 - короткий'),
	(361,1,22,'2,0mmdX6mml (410620)'),
	(358,1,22,'451630 - нормальный'),
	(367,1,22,'2,8mmdX8mml (411828)'),
	(368,1,22,'2,8mmdX10mml (411028)'),
	(369,1,22,'2,8mmdX11,5mml (411128)'),
	(370,1,22,'2,8mmdX13mml (413328)'),
	(371,1,22,'3,2mmdX6mml (410632)'),
	(377,1,22,'3,7mmdX8mml (410837)'),
	(378,1,22,'3,7mmdX10mml (411037)'),
	(379,1,22,'3,7mmdX11,5mml (411137)'),
	(380,1,22,'3,7mmdX13mml (411337)'),
	(388,1,22,'5,2mmdX10mml (411052)'),
	(387,1,22,'5,2mmdX8mml (410852)'),
	(381,1,22,'4,2mmdX6mml (410642)'),
	(389,1,22,'5,2mmdX11,5mml (411152)'),
	(404,1,22,'Прямой 3,7ddm - 421004'),
	(400,1,22,'730530 - длина рабочей части 5мм'),
	(399,1,22,'730330 - длина рабочей части 3мм'),
	(390,1,22,'5,2mmdX13mml (411352)'),
	(395,1,22,'701107 - длинный'),
	(391,1,22,'470304 - с наруж. ∅ 4ммд и внутр. ∅ 3ммд'),
	(396,1,22,'700807 - средний'),
	(405,1,22,'Прямой 4,2ddm - 421005'),
	(406,1,22,'Угловой 2,0ddm -  421011'),
	(407,1,22,'Угловой 2,5ddm - 421012'),
	(408,1,22,'Угловой 3,2ddm - 421013'),
	(409,1,22,'Угловой 3,7ddm - 421014'),
	(410,1,22,'Угловой 4,2ddm - 421015'),
	(413,1,22,'430525 - короткий'),
	(414,1,22,'431825 - длинный'),
	(433,1,23,'903845 - стандартный'),
	(431,1,23,'901540 - узкий'),
	(432,1,23,'901551 - широкий'),
	(426,1,23,'900845 - короткий'),
	(424,1,23,'901552 - широкий'),
	(425,1,23,'902545 - стандартный'),
	(421,1,23,'901545 - стандартный'),
	(423,1,23,'901538 - узкий'),
	(422,1,23,'900745 - короткий'),
	(427,1,23,'901745 - узкий'),
	(428,1,23,'901550 - широкий'),
	(429,1,23,'901546 - стандартный'),
	(430,1,23,'900746 - короткий'),
	(434,1,23,'901045 - короткий'),
	(435,1,23,'902845 - узкий'),
	(436,1,23,'901850 - широкий'),
	(437,1,23,'920038'),
	(438,1,23,'920035'),
	(439,1,23,'920050'),
	(440,1,23,'920060');

/*!40000 ALTER TABLE `comcs_option_value_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_order`;

CREATE TABLE `comcs_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_order` WRITE;
/*!40000 ALTER TABLE `comcs_order` DISABLE KEYS */;

INSERT INTO `comcs_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_company_id`, `payment_tax_id`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`)
VALUES
	(3,0,'INV-2015-00',0,'IMPLANTGROUP.RU','http://implantgroup.ru/',0,1,'Дмитрий','Купчинский','info@abirplus.ru','2112233','','Дмитрий','Купчинский','','','','Кропоткина','','Новосибирск','','Российская Федерация',176,'Новосибирская область',2768,'','Банковский перевод','bank_transfer','Дмитрий','Купчинский','','Кропоткина','','Новосибирск','','Российская Федерация',176,'Новосибирская область',2768,'','Бесплатная доставка','free.free','',7200.0000,0,0,0.0000,1,1,'RUB',1.00000000,'195.208.137.186','195.208.137.186','Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0','ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3','2015-04-14 18:49:33','2015-04-14 18:49:33'),
	(2,0,'INV-2015-00',0,'IMPLANTGROUP.RU','http://implantgroup.ru/',0,1,'Иванов','Иван','fie@sibmail.ru','9890','','Иванов','Иван','','','','ывфа','','фыва','','Российская Федерация',176,'Калининградская область',2743,'','Банковский перевод','bank_transfer','Иванов','Иван','','ывфа','','фыва','','Российская Федерация',176,'Калининградская область',2743,'','Самовывоз из магазина','pickup.pickup','',8160.0000,0,0,0.0000,1,1,'RUB',1.00000000,'195.218.202.46','195.218.202.46','Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko','ru-RU','2015-04-14 18:46:07','2015-04-14 18:46:07'),
	(4,0,'INV-2015-00',0,'IMPLANTGROUP.RU','http://implantgroup.ru/',1,1,'Д','К','info@abirplus.ru','2112233','','Д','К','','','','Кропоткина','','Новосибирск','','Российская Федерация',176,'Новосибирская область',2768,'','Оплата при доставке','cod','Д','К','','Кропоткина','','Новосибирск','','Российская Федерация',176,'Новосибирская область',2768,'','Бесплатная доставка','free.free','',7200.0000,0,0,0.0000,1,1,'RUB',1.00000000,'195.208.137.186','195.208.137.186','Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0','ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3','2015-04-14 18:50:50','2015-04-14 18:50:50');

/*!40000 ALTER TABLE `comcs_order` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_order_download
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_order_download`;

CREATE TABLE `comcs_order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_order_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_order_field`;

CREATE TABLE `comcs_order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_order_fraud
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_order_fraud`;

CREATE TABLE `comcs_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_order_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_order_history`;

CREATE TABLE `comcs_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_order_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_order_option`;

CREATE TABLE `comcs_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_order_option` WRITE;
/*!40000 ALTER TABLE `comcs_order_option` DISABLE KEYS */;

INSERT INTO `comcs_order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`)
VALUES
	(2,2,2,238,1853,'Типоразмер имплантата (диаметр/длина) [GREEN]','4.2mmd/8mml','select'),
	(3,3,3,236,1892,'Типоразмер имплантата (диаметр/длина) [GREEN]','4.2mmd/8mml','select'),
	(4,4,4,236,1892,'Типоразмер имплантата (диаметр/длина) [GREEN]','4.2mmd/8mml','select');

/*!40000 ALTER TABLE `comcs_order_option` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_order_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_order_product`;

CREATE TABLE `comcs_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_order_product` WRITE;
/*!40000 ALTER TABLE `comcs_order_product` DISABLE KEYS */;

INSERT INTO `comcs_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`)
VALUES
	(2,2,78,'Титановый имплантат &quot;Универсал Плюс&quot;','170837-171660',1,8160.0000,8160.0000,0.0000,0),
	(3,3,77,'Титановый имплантат &quot;Классик Плюс&quot;','160837-161660',1,7200.0000,7200.0000,0.0000,0),
	(4,4,77,'Титановый имплантат &quot;Классик Плюс&quot;','160837-161660',1,7200.0000,7200.0000,0.0000,0);

/*!40000 ALTER TABLE `comcs_order_product` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_order_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_order_status`;

CREATE TABLE `comcs_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_order_status` WRITE;
/*!40000 ALTER TABLE `comcs_order_status` DISABLE KEYS */;

INSERT INTO `comcs_order_status` (`order_status_id`, `language_id`, `name`)
VALUES
	(1,1,'Ожидание'),
	(2,1,'В обработке'),
	(3,1,'Доставлено'),
	(7,1,'Отменено'),
	(5,1,'Сделка завершена'),
	(8,1,'Возврат'),
	(9,1,'Отмена и аннулирование'),
	(10,1,'Неудавшийся'),
	(11,1,'Возмещенный'),
	(12,1,'Полностью измененный'),
	(13,1,'Полный возврат');

/*!40000 ALTER TABLE `comcs_order_status` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_order_total
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_order_total`;

CREATE TABLE `comcs_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_order_total` WRITE;
/*!40000 ALTER TABLE `comcs_order_total` DISABLE KEYS */;

INSERT INTO `comcs_order_total` (`order_total_id`, `order_id`, `code`, `title`, `text`, `value`, `sort_order`)
VALUES
	(6,2,'total','Итого','8 160.00 р.',8160.0000,3),
	(5,2,'shipping','Самовывоз из магазина','0.00 р.',0.0000,2),
	(4,2,'sub_total','Сумма','8 160.00 р.',8160.0000,1),
	(7,3,'sub_total','Сумма','7 200.00 р.',7200.0000,1),
	(8,3,'shipping','Бесплатная доставка','0.00 р.',0.0000,2),
	(9,3,'total','Итого','7 200.00 р.',7200.0000,3),
	(10,4,'sub_total','Сумма','7 200.00 р.',7200.0000,1),
	(11,4,'shipping','Бесплатная доставка','0.00 р.',0.0000,2),
	(12,4,'total','Итого','7 200.00 р.',7200.0000,3);

/*!40000 ALTER TABLE `comcs_order_total` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_order_voucher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_order_voucher`;

CREATE TABLE `comcs_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product`;

CREATE TABLE `comcs_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_product` WRITE;
/*!40000 ALTER TABLE `comcs_product` DISABLE KEYS */;

INSERT INTO `comcs_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`)
VALUES
	(79,'180842-181660','','','','','','','',0,8,'data/implantaty/titanovyi-implantat-respect-plus.png',20,1,9120.0000,0,0,'2015-04-01',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-03 15:31:38','2015-04-07 17:58:40',63),
	(78,'170837-171660','','','','','','','',0,8,'data/implantaty/titanovyi-implantat-universal-plus.png',20,1,8160.0000,0,0,'2015-04-01',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-03 14:53:52','2015-04-07 17:58:27',71),
	(77,'160837-161660','','','','','','','',0,8,'data/implantaty/titanovyi-implantat-classic-plus.png',20,1,7200.0000,0,0,'2015-04-01',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-03 14:03:11','2015-04-07 17:58:52',120),
	(76,'131037-131660','','','','','','','',0,8,'data/implantaty/titanovyi-implantat-respect.png',20,1,6240.0000,0,0,'2015-04-01',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-03 12:58:23','2015-05-06 18:21:52',324),
	(75,'120830-121842','','','','','','','',0,8,'data/implantaty/titanovyi-implantat-universal.png',20,1,5760.0000,0,0,'2015-04-01',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-02 18:07:51','2015-04-07 18:09:23',90),
	(73,'110650-111660','','','','','','','',0,8,'data/implantaty/titanovyi-implantat-classic.png',20,1,5280.0000,0,0,'2015-04-01',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-02 14:06:59','2015-04-07 17:58:01',167),
	(74,'141024-141650','','','','','','','',0,8,'data/implantaty/titanovyi-implantat-vector.png',20,1,4800.0000,0,0,'2015-04-01',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-02 16:57:21','2015-04-07 17:58:13',100),
	(80,'151030-151633','','','','','','','',0,8,'data/implantaty/titanovyi-implantat-vector-plus.png',20,1,4800.0000,0,0,'2015-04-01',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-03 16:32:16','2015-04-07 17:59:04',78),
	(81,'210245-270730','','','','','','','',0,8,'data/implantaty/vintovoi-lechebnyi-abatment.jpg',20,1,960.0000,0,0,'2015-04-05',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-06 16:18:58','2015-04-06 16:35:06',48),
	(82,'250338-280660','','','','','','','',0,8,'data/implantaty/vintovoi-lechebnyi-abatment-plus.jpg',20,1,1152.0000,0,0,'2015-04-05',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-06 17:09:16','2015-04-06 17:13:18',43),
	(83,'200235','','','','','','','',0,8,'data/implantaty/lechebnyi-vintovoi-titanovyi-abatment-dlia-vektor-plus.jpg',20,1,960.0000,0,0,'2015-04-05',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-06 17:30:18','2015-04-06 18:19:31',48),
	(84,'200530','','','','','','','',0,8,'data/implantaty/lechebnyi-zamkovyi-titanovyi-abatment-dlia-vektor-plus.jpg',20,1,960.0000,0,0,'2015-04-05',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-06 18:45:51','0000-00-00 00:00:00',57),
	(85,'240347-240547','','','','','','','',0,8,'data/implantaty/lechebnyi-titanovyi-kolpachok-dlia-abatmenta.jpg',20,1,960.0000,0,0,'2015-04-06',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,5,1,'2015-04-07 13:04:02','0000-00-00 00:00:00',44),
	(86,'720630-720638','','','','','','','',0,8,'data/implantaty/titanovyi-zaglushnyi-vint.jpg',20,1,480.0000,0,0,'2015-04-06',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,6,1,'2015-04-07 14:37:38','2015-04-08 13:16:52',51),
	(87,'720631-720639','','','','','','','',0,8,'data/implantaty/titanovyi-zaglushnyi-vint-plus.jpg',20,1,480.0000,0,0,'2015-04-06',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,7,1,'2015-04-07 14:49:23','2015-04-07 15:12:55',48),
	(88,'162537-162560','','','','','','','',0,8,'data/implantaty/prefiks-dlia-implantatov-plus.jpg',20,1,1920.0000,0,0,'2015-04-06',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-07 15:23:11','0000-00-00 00:00:00',46),
	(89,'172542-172560','','','','','','','',0,8,'data/implantaty/prefiks-dlia-implantatov-respeсt-plus.jpg',20,1,1920.0000,0,0,'2015-04-06',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-07 15:41:40','2015-04-07 16:18:31',57),
	(90,'182137-182160','','','','','','','',0,8,'data/implantaty/prefiks-dlia-implantatov-plus-slim.jpg',20,1,1920.0000,0,0,'2015-04-06',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-07 16:43:18','0000-00-00 00:00:00',43),
	(91,'161737-163060','','','','','','','',0,8,'data/implantaty/uglovoi-prefiks-dlia-implantatov-plus.jpg',20,1,3360.0000,0,0,'2015-04-06',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-07 16:58:02','0000-00-00 00:00:00',44),
	(92,'500939-501345','','','','','','','',0,8,'data/protetika/priamoi-titanovyi-abatment.jpg',20,1,2160.0000,0,0,'2015-04-06',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-07 18:21:15','2015-04-07 18:28:30',52),
	(93,'501030','','','','','','','',0,8,'data/protetika/titanovyi-abatment-dlia-implantata-vector-plus.jpg',20,1,2400.0000,0,0,'2015-04-07',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-08 14:35:45','0000-00-00 00:00:00',46),
	(94,'500935','','','','','','','',0,8,'data/protetika/titanovyi-abatment-s-uzkoi-platformoi.jpg',20,1,2160.0000,0,0,'2015-04-07',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-08 14:53:19','0000-00-00 00:00:00',32),
	(95,'500900','','','','','','','',0,8,'data/protetika/vremennyi-titanovyi-abatment-dlia-kompozita.jpg',20,1,2160.0000,0,0,'2015-04-07',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-08 15:28:11','0000-00-00 00:00:00',35),
	(96,'501045','','','','','','','',0,8,'data/protetika/vintovoi-titanovyi-abatment.jpg',20,1,1680.0000,0,0,'2015-04-07',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,5,1,'2015-04-08 15:39:07','0000-00-00 00:00:00',33),
	(97,'520845, 520950, 521145','','','','','','','',0,8,'data/protetika/uglovoi-titanovyi-abatment-15.jpg',20,1,2880.0000,0,0,'2015-04-07',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,6,1,'2015-04-08 16:21:18','0000-00-00 00:00:00',51),
	(98,'520835, 522835','','','','','','','',0,8,'data/protetika/uglovoi-titanovyi-abatment-15-s-uzkoi-platformoi.jpg',20,1,2880.0000,0,0,'2015-04-07',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,7,1,'2015-04-08 16:41:25','2015-04-08 16:43:53',42),
	(99,'520847','','','','','','','',0,8,'data/protetika/uglovoi-titanovyi-abatment-25.jpg',20,1,2880.0000,0,0,'2015-04-07',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,8,1,'2015-04-08 16:51:02','0000-00-00 00:00:00',36),
	(100,'521835','','','','','','','',0,8,'data/protetika/uglovoi-titanovyi-abatment-25-s-uzkoi-platformoi.jpg',20,1,2880.0000,0,0,'2015-04-07',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,9,1,'2015-04-08 16:57:39','0000-00-00 00:00:00',36),
	(101,'501239-501280','','','','','','','',0,8,'data/protetika/priamoi-titanovyi-abatment-dlia-frezerovki.jpg',20,1,1824.0000,0,0,'2015-04-08',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-09 16:50:36','2015-04-09 17:17:31',54),
	(102,'501235','','','','','','','',0,8,'data/protetika/titanovyi-abatment-s-uzkoi-platformoi-dlia-frezerovki.jpg',20,1,1824.0000,0,0,'2015-04-08',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-09 17:02:20','2015-04-09 17:03:06',38),
	(103,'521345, 521355','','','','','','','',0,8,'data/protetika/universalnyi-uglovoi-abatment-15-dlia-frezerovki.jpg',20,1,2400.0000,0,0,'2015-04-08',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-09 17:12:46','2015-04-09 17:44:52',42),
	(104,'521347','','','','','','','',0,8,'data/protetika/uglovoi-abatment-25-dlia-frezerovki.jpg',20,1,2400.0000,0,0,'2015-04-08',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-09 18:02:51','0000-00-00 00:00:00',42),
	(105,'548545, 548538','','','','','','','',0,8,'data/protetika/plastikovyi-abatment.jpg',20,1,1680.0000,0,0,'2015-04-08',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-09 18:25:26','2015-04-09 18:26:44',37),
	(106,'541245, 541263','','','','','','','',0,8,'data/protetika/plastikovyi-abatment-s-normalnoi-platformoi.jpg',20,1,1680.0000,0,0,'2015-04-08',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-09 18:34:19','2015-04-09 18:39:59',38),
	(107,'540935','','','','','','','',0,8,'data/protetika/plastikovyi-abatment-s-uzkoi-platformoi.jpg',20,1,1680.0000,0,0,'2015-04-09',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-10 12:32:23','2015-04-10 12:52:14',38),
	(108,'541645','','','','','','','',0,8,'data/protetika/plastikovyi-abatment-s-titanovym-bazisom.jpg',20,1,1680.0000,0,0,'2015-04-09',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-10 12:59:12','2015-04-10 13:49:06',30),
	(109,'551545','','','','','','','',0,8,'data/protetika/uglovoi-plastikovyi-abatment-15.jpg',20,1,1920.0000,0,0,'2015-04-09',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,5,1,'2015-04-10 14:00:59','0000-00-00 00:00:00',37),
	(110,' 541030','','','','','','','',0,8,'data/protetika/plastikovyi-abatment-dlia-implantata-vektor-plius.jpg',20,1,1680.0000,0,0,'2015-04-09',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,6,1,'2015-04-10 14:59:02','0000-00-00 00:00:00',22),
	(111,'549945, 549955','','','','','','','',0,8,'data/protetika/moduliarnyi-plastikovyi-abatment.jpg',20,1,1824.0000,0,0,'2015-04-09',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,7,1,'2015-04-10 15:10:44','0000-00-00 00:00:00',37),
	(112,'510147, 510247, 510347, 510447','','','','','','','',0,8,'data/protetika/vintovoi-titanovyi-abatment-dlia-odnomomentnoi-nagruzki.jpg',20,1,1680.0000,0,0,'2015-04-09',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-10 15:45:15','2015-04-10 15:47:50',39),
	(113,'530151, 530251, 530351, 530451','','','','','','','',0,8,'data/protetika/uglovoj-titanovyj-abatment-15-dlja-odnomomentnoj-nagruzki.jpg',20,1,2880.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-13 14:41:18','0000-00-00 00:00:00',32),
	(114,'530153, 530253, 530353, 530453','','','','','','','',0,8,'data/protetika/uglovoj-titanovyj-abatment-25-dlja-odnomomentnoj-nagruzki.jpg',20,1,2880.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-13 15:12:08','0000-00-00 00:00:00',34),
	(115,'550100, 550200, 550300','','','','','','','',0,8,'data/protetika/plastikovyj-anatomicheskij-vremennyj-abatment.jpg',20,1,1920.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-13 15:22:11','0000-00-00 00:00:00',38),
	(116,'550115, 550215, 550315','','','','','','','',0,8,'data/protetika/uglovoj-anatomicheskij-plastikovyj-vremennyj-abatment-15.jpg',20,1,1920.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-13 15:34:30','0000-00-00 00:00:00',33),
	(117,'550125, 550225, 550325','','','','','','','',0,8,'data/protetika/vremennyj-uglovoj-plastikovyj-abatment-25.jpg',20,1,1920.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-13 15:45:39','0000-00-00 00:00:00',31),
	(118,'510145, 510245, 510345, 510445','','','','','','','',0,8,'data/protetika/titanovyj-abatment.jpg',20,1,2160.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-13 16:06:15','0000-00-00 00:00:00',37),
	(119,'510156, 510256, 510356, 510456','','','','','','','',0,8,'data/protetika/shirokij-titanovyj-abatment.jpg',20,1,2160.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-13 16:37:08','0000-00-00 00:00:00',39),
	(120,'510135, 510235, 510335, 510435','','','','','','','',0,8,'data/protetika/titanovyj-abatment-s-uzkoj-platformoj.jpg',20,1,2160.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-13 17:02:31','0000-00-00 00:00:00',33),
	(121,'511175, 511275, 511375, 511475','','','','','','','',0,8,'data/protetika/titanovyj-ehsteticheskij-abatment.jpg',20,1,2400.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-13 17:47:01','2015-04-30 17:49:07',39),
	(122,'510186, 510286, 510386, 510486','','','','','','','',0,8,'data/protetika/titanovyj-shirokij-ehsteticheskij-abatment.jpg',20,1,2400.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,5,1,'2015-04-13 18:06:37','0000-00-00 00:00:00',38),
	(123,'510150','','','','','','','',0,8,'data/protetika/priamoi-titanovyi-zamkovyi-abatment.jpg',20,1,2160.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,6,1,'2015-04-13 18:11:02','0000-00-00 00:00:00',42),
	(124,'510146, 510246, 510346, 510446','','','','','','','',0,8,'data/protetika/anatomicheskii-titanovyi-abatment.jpg',20,1,2496.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-13 18:38:01','0000-00-00 00:00:00',43),
	(125,'510176, 510276, 510376, 510476','','','','','','','',0,8,'data/protetika/titanovyi-esteticheskii-anatomicheskii-abatment.jpg',20,1,2688.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-15 15:53:10','2015-04-15 15:54:35',30),
	(126,'530145, 530245, 530345','','','','','','','',0,8,'data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-15.jpg',20,1,3600.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-15 16:12:14','0000-00-00 00:00:00',33),
	(127,'530147, 530247, 530347','','','','','','','',0,8,'data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-25.jpg',20,1,3600.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-15 17:00:07','0000-00-00 00:00:00',33),
	(128,'530135, 530235, 530335','','','','','','','',0,8,'data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-15-s-uzkoi-platformoi.jpg',20,1,3600.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,5,1,'2015-04-15 17:18:34','0000-00-00 00:00:00',34),
	(129,'531135, 531235, 531335','','','','','','','',0,8,'data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-25-s-uzkoi-platformoi.jpg',20,1,3600.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,6,1,'2015-04-15 17:44:30','2015-04-15 17:45:18',30),
	(130,'530175, 530275, 530375','','','','','','','',0,8,'data/protetika/uglovoi-anatomicheskii-esteticheskii-titanovyi-abatment-15.jpg',20,1,3792.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,7,1,'2015-04-15 18:16:35','2015-04-15 18:19:34',31),
	(131,'530177, 530277, 530377','','','','','','','',0,8,'data/protetika/uglovoi-anatomicheskii-esteticheskii-titanovyi-abatment-25.jpg',20,1,3792.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,8,1,'2015-04-15 18:32:15','0000-00-00 00:00:00',38),
	(132,'560050, 560150, 560250, 560350','','','','','','','',0,8,'data/protetika/tcirkonievyi-abatment.jpg',20,1,7920.0000,0,0,'2015-04-15',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-16 13:53:09','2015-04-16 13:54:07',34),
	(133,'561252','','','','','','','',0,8,'data/protetika/tcirkonievyi-shirokii-abatment.jpg',20,1,7920.0000,0,0,'2015-04-15',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-16 14:07:28','0000-00-00 00:00:00',38),
	(134,'570050, 570150, 570250, 570350','','','','','','','',0,8,'data/protetika/uglovoi-tcirkonievyi-abatment-15.jpg',20,1,8400.0000,0,0,'2015-04-15',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-16 14:29:59','2015-04-16 14:30:22',39),
	(135,'570052, 570152, 570252, 570352','','','','','','','',0,8,'data/protetika/uglovoi-tcirkonievyi-abatment-25.jpg',20,1,8400.0000,0,0,'2015-04-15',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-16 14:38:43','2015-04-16 14:40:01',40),
	(136,'620540, 622040, 623040, 624040, 625040, 626040','','','','','','','',0,8,'data/protetika/titanovyi-abatment-s-sharovym-atachmentom.jpg',20,1,2160.0000,0,0,'2015-04-15',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-16 15:18:30','0000-00-00 00:00:00',38),
	(137,'3225, 3236, 3206','','','','','','','',0,8,'data/biomaterialy/naturalnyi-kostnyi-material-graft-alpha-bio.png',0,1,4602.7600,0,0,'2015-04-23',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,1,1,'2015-04-24 15:04:48','2015-04-24 17:49:54',52),
	(138,'602540, 603040, 604040, 605040, 606040','','','','','','','',0,8,'data/protetika/titanovye-standartnye-vintovye-abatmenty-konnektory.jpg',20,1,1680.0000,0,0,'2015-04-26',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-27 14:22:47','2015-04-27 14:26:07',28),
	(139,'610548, 611548, 612548','','','','','','','',0,8,'data/protetika/titanovye-esteticheskie-vintovye-abatmenty-konnektory.jpg',20,1,1680.0000,0,0,'2015-04-26',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-27 14:35:29','2015-04-27 14:37:48',34),
	(140,'610547, 611547, 612547','','','','','','','',0,8,'data/protetika/titanovye-esteticheskie-zamkovye-abatmenty-konnektory.jpg',20,1,1680.0000,0,0,'2015-04-26',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-27 14:50:45','0000-00-00 00:00:00',33),
	(141,'630141-630341','','','','','','','',0,8,'data/protetika/uglovoi-titanovyi-adaptor-17.jpg',20,1,4560.0000,0,0,'2015-04-26',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-27 15:01:09','2015-04-27 15:11:22',31),
	(143,'701202-701204','','','','','','','',0,8,'data/protetika/titanovyi-vint-dlia-abatmenta.jpg',20,1,480.0000,0,0,'2015-04-26',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-27 15:33:03','2015-04-27 15:39:00',30),
	(142,'631141-631341','','','','','','','',0,8,'data/protetika/uglovoi-titanovyi-adaptor-30.jpg',20,1,4560.0000,0,0,'2015-04-26',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-27 15:08:40','2015-04-27 15:15:51',30),
	(144,'701220-701240','','','','','','','',0,8,'data/protetika/titanovyi-sinii-vint-dlia-abatmenta.jpg',20,1,480.0000,0,0,'2015-04-26',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-27 15:48:57','0000-00-00 00:00:00',29),
	(145,'-','','','','','','','',0,8,'data/biomaterialy/rezorbiruemaia-membrana-hypro-sorb.jpg',0,1,4267.6200,0,0,'2015-04-26',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,2,1,'2015-04-27 17:05:05','2015-04-27 17:08:32',41),
	(146,'-','','','','','','','',0,8,'data/biomaterialy/shovnik-main.jpg',0,1,2200.0000,0,0,'2015-04-26',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,3,1,'2015-04-27 18:32:06','2015-04-27 18:33:39',35),
	(147,'501939, 501945, 502345','','','','','','','',0,8,'data/protetika/titanovyi-abatment-plus.jpg',20,1,1824.0000,0,0,'2015-04-27',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-28 14:50:06','0000-00-00 00:00:00',33),
	(148,'501935','','','','','','','',0,8,'data/protetika/titanovyi-abatment-plus-s-uzkoi-platformoi.jpg',20,1,2160.0000,0,0,'2015-04-27',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-28 15:13:36','0000-00-00 00:00:00',27),
	(149,'501900','','','','','','','',0,8,'data/protetika/vremennyi-abatment-dlia-kompozita-plus.jpg',20,1,2160.0000,0,0,'2015-04-27',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-28 18:05:13','0000-00-00 00:00:00',26),
	(150,'523845, 523950, 523145','','','','','','','',0,8,'data/protetika/uglovoi-titanovyi-abatment-15-plus.jpg',20,1,2880.0000,0,0,'2015-04-27',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-28 18:29:09','0000-00-00 00:00:00',29),
	(151,'523847','','','','','','','',0,8,'data/protetika/uglovoi-titanovyi-abatment-25.jpg',20,1,2880.0000,0,0,'2015-04-28',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,5,1,'2015-04-29 17:03:46','2015-04-29 17:16:14',28),
	(152,'523835, 525835','','','','','','','',0,8,'data/protetika/uglovoi-titanovyi-abatment-15-s-uzkoi-platformoi.jpg',20,1,2880.0000,0,0,'2015-04-28',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,6,1,'2015-04-29 17:55:47','2015-04-29 18:00:03',33),
	(153,'524835','','','','','','','',0,8,'data/protetika/uglovoi-titanovyi-abatment-25-s-uzkoi-platformoi.jpg',20,1,2880.0000,0,0,'2015-04-28',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,7,1,'2015-04-29 18:06:09','0000-00-00 00:00:00',29),
	(154,'502239-502280','','','','','','','',0,8,'data/protetika/priamoi-titanovyi-abatment-dlia-frezerovki.jpg',20,1,1824.0000,0,0,'2015-04-08',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-29 18:09:42','2015-04-29 18:33:34',31),
	(155,'502235','','','','','','','',0,8,'data/protetika/titanovyi-abatment-s-uzkoi-platformoi-dlia-frezerovki.jpg',20,1,1824.0000,0,0,'2015-04-08',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-29 18:28:08','2015-04-29 18:37:50',29),
	(156,'523347','','','','','','','',0,8,'data/protetika/uglovoi-abatment-25-dlia-frezerovki.jpg',20,1,2400.0000,0,0,'2015-04-08',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-29 18:42:50','2015-04-29 18:48:46',29),
	(157,'523345, 523355','','','','','','','',0,8,'data/protetika/universalnyi-uglovoi-abatment-15-dlia-frezerovki.jpg',20,1,2400.0000,0,0,'2015-04-08',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-29 18:48:33','2015-04-30 14:23:26',23),
	(158,'548555, 549538','','','','','','','',0,8,'data/protetika/plastikovyi-abatment.jpg',20,1,1680.0000,0,0,'2015-04-08',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-30 14:28:39','2015-04-30 14:39:30',35),
	(159,'542245, 542263','','','','','','','',0,8,'data/protetika/plastikovyi-abatment-s-normalnoi-platformoi.jpg',20,1,1680.0000,0,0,'2015-04-08',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-30 14:47:47','2015-04-30 14:55:01',28),
	(160,'541935','','','','','','','',0,8,'data/protetika/plastikovyi-abatment-s-uzkoi-platformoi.jpg',20,1,1680.0000,0,0,'2015-04-09',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-30 15:11:23','2015-04-30 15:23:07',22),
	(161,'542645, 542650, 542660','','','','','','','',0,8,'data/protetika/plastikovyi-abatment-s-titanovym-bazisom.jpg',20,1,1680.0000,0,0,'2015-04-09',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-30 15:24:42','2015-04-30 15:32:46',25),
	(162,'552545','','','','','','','',0,8,'data/protetika/uglovoi-plastikovyi-abatment-15.jpg',20,1,1920.0000,0,0,'2015-04-09',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,5,1,'2015-04-30 15:33:39','2015-04-30 15:41:45',28),
	(163,'512147, 512247, 512347, 512447','','','','','','','',0,8,'data/protetika/vintovoi-titanovyi-abatment-dlia-odnomomentnoi-nagruzki.jpg',20,1,1680.0000,0,0,'2015-04-09',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-30 15:42:56','2015-04-30 16:06:46',28),
	(164,'532151, 532251, 532351, 532451','','','','','','','',0,8,'data/protetika/uglovoj-titanovyj-abatment-15-dlja-odnomomentnoj-nagruzki.jpg',20,1,2880.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-30 16:08:33','2015-04-30 16:20:31',32),
	(165,'532153, 532253, 532353, 532453','','','','','','','',0,8,'data/protetika/uglovoj-titanovyj-abatment-25-dlja-odnomomentnoj-nagruzki.jpg',20,1,2880.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-30 16:23:00','2015-04-30 17:07:04',28),
	(166,'511145, 511245, 511345, 511445','','','','','','','',0,8,'data/protetika/titanovyj-abatment.jpg',20,1,2160.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-04-30 17:07:51','2015-04-30 17:14:48',30),
	(167,'511156, 511256, 511356, 511456','','','','','','','',0,8,'data/protetika/shirokij-titanovyj-abatment.jpg',20,1,2160.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-04-30 17:16:09','2015-04-30 17:25:43',37),
	(168,'511135, 511235, 511335, 511435','','','','','','','',0,8,'data/protetika/titanovyj-abatment-s-uzkoj-platformoj.jpg',20,1,2160.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-04-30 17:27:03','2015-04-30 17:37:40',40),
	(169,'510175, 510275, 510375, 510475','','','','','','','',0,8,'data/protetika/titanovyj-ehsteticheskij-abatment.jpg',20,1,2400.0000,0,0,'2015-04-29',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-04-30 18:05:26','0000-00-00 00:00:00',29),
	(170,'511186, 511286, 511386, 511486','','','','','','','',0,8,'data/protetika/titanovyj-shirokij-ehsteticheskij-abatment.jpg',20,1,2400.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,5,1,'2015-04-30 18:06:40','2015-04-30 18:17:58',41),
	(171,'511146, 511246, 511346','','','','','','','',0,8,'data/protetika/anatomicheskii-titanovyi-abatment.jpg',20,1,2496.0000,0,0,'2015-04-12',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-05-05 13:10:00','2015-05-05 13:19:46',33),
	(172,'511176, 511276, 511376','','','','','','','',0,8,'data/protetika/titanovyi-esteticheskii-anatomicheskii-abatment.jpg',20,1,2688.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-05-05 13:21:45','2015-05-05 13:37:54',30),
	(173,'532145, 532245, 532345','','','','','','','',0,8,'data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-15.jpg',20,1,3600.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-05-05 13:40:08','2015-05-05 13:47:16',29),
	(174,'532147, 532247, 532347','','','','','','','',0,8,'data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-25.jpg',20,1,3600.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,4,1,'2015-05-05 13:51:24','2015-05-05 13:57:36',27),
	(175,'532135, 532235','','','','','','','',0,8,'data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-15-s-uzkoi-platformoi.jpg',20,1,3600.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,5,1,'2015-05-05 14:04:34','2015-05-05 14:11:32',32),
	(176,'533135, 533235','','','','','','','',0,8,'data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-25-s-uzkoi-platformoi.jpg',20,1,3600.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,6,1,'2015-05-05 14:13:06','2015-05-05 14:20:36',33),
	(177,'532175, 532275, 532375','','','','','','','',0,8,'data/protetika/uglovoi-anatomicheskii-esteticheskii-titanovyi-abatment-15.jpg',20,1,3792.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,7,1,'2015-05-05 14:22:36','2015-05-05 14:28:47',27),
	(178,'532177, 532277, 532377','','','','','','','',0,8,'data/protetika/uglovoi-anatomicheskii-esteticheskii-titanovyi-abatment-25.jpg',20,1,3792.0000,0,0,'2015-04-14',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,8,1,'2015-05-05 14:37:20','2015-05-05 14:47:35',25),
	(179,'610567, 611567, 612567','','','','','','','',0,8,'data/protetika/titanovye-esteticheskie-zamkovye-abatmenty-konnektory.jpg',20,1,1680.0000,0,0,'2015-04-26',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,3,1,'2015-05-05 14:50:26','2015-05-05 14:56:50',30),
	(180,'602550, 603050, 604050, 605050, 606050','','','','','','','',0,8,'data/protetika/titanovye-standartnye-vintovye-abatmenty-konnektory-plus.jpg',20,1,1680.0000,0,0,'2015-04-26',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-05-05 14:57:47','2015-05-05 15:27:48',36),
	(181,'610557, 611557, 612557','','','','','','','',0,8,'data/protetika/titanovye-esteticheskie-vintovye-abatmenty-konnektory-plus.jpg',20,1,1680.0000,0,0,'2015-04-26',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-05-05 15:28:46','2015-05-05 15:41:21',31),
	(182,'632141-632341','','','','','','','',0,8,'data/protetika/uglovoi-titanovyi-adaptor-17-plus.jpg',20,1,4560.0000,0,0,'2015-04-26',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,1,1,'2015-05-05 15:52:11','2015-05-05 16:17:45',31),
	(183,'633141-633341','','','','','','','',0,8,'data/protetika/uglovoi-titanovyi-adaptor-30-plus.jpg',20,1,4560.0000,0,0,'2015-04-26',5.00000000,2,30.00000000,30.00000000,65.00000000,2,0,1,2,1,'2015-05-05 16:13:14','2015-05-05 16:21:40',32),
	(184,'446301','','','','','','','',0,8,'data/instrumenty/odnostoronnij-klyuch-ratchet.png',20,1,5280.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,1,1,'2015-05-06 12:14:43','2015-05-06 12:38:38',38),
	(185,'446302','','','','','','','',0,8,'data/instrumenty/klyuch-ratchet-universalnyj.png',20,1,12480.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,2,1,'2015-05-06 12:37:56','0000-00-00 00:00:00',26),
	(186,'446303','','','','','','','',0,8,'data/instrumenty/hirurgicheskie-instrumenty.png',20,1,5760.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,3,1,'2015-05-06 13:44:00','0000-00-00 00:00:00',26),
	(187,'448501','','','','','','','',0,8,'data/instrumenty/molotok-hirurgicheskij.png',20,1,2880.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,4,1,'2015-05-06 14:26:23','2015-05-06 14:33:46',29),
	(188,'450001','','','','','','','',0,8,'data/instrumenty/izmeritel-glubiny-kostnogo-lozha-implantatov.png',20,1,2400.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,5,1,'2015-05-06 14:38:45','0000-00-00 00:00:00',27),
	(189,'450011','','','','','','','',0,8,'data/instrumenty/izmeritel-desnevogo-kraya.png',20,1,2400.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,6,1,'2015-05-06 14:43:20','0000-00-00 00:00:00',26),
	(190,'451030, 451630, 452209','','','','','','','',0,8,'data/instrumenty/titanovyj-izmeritel.jpg',20,1,816.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,7,1,'2015-05-06 15:11:46','2015-05-06 15:27:50',23),
	(191,'-','','','','','','','',0,8,'data/instrumenty/ctopper-dlya-hirurgicheskih-kostnyh-drilej.jpg',20,1,672.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,8,1,'2015-05-06 16:13:46','0000-00-00 00:00:00',24),
	(192,'-','','','','','','','',0,8,'data/instrumenty/ctopper-dlya-hirurgicheskih-kostnyh-drilej.jpg',20,1,672.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,9,1,'2015-05-06 16:17:46','2015-05-06 16:49:33',27),
	(193,'-','','','','','','','',0,8,'data/instrumenty/ctopper-dlya-hirurgicheskih-kostnyh-drilej.jpg',20,1,672.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,10,1,'2015-05-06 16:51:11','2015-05-06 16:56:59',26),
	(194,'-','','','','','','','',0,8,'data/instrumenty/ctopper-dlya-hirurgicheskih-kostnyh-drilej.jpg',20,1,672.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,11,1,'2015-05-06 17:02:44','2015-05-06 17:11:22',31),
	(195,'-','','','','','','','',0,8,'data/instrumenty/ctopper-dlya-hirurgicheskih-kostnyh-drilej.jpg',20,1,672.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,12,1,'2015-05-06 17:31:41','2015-05-06 17:35:36',27),
	(196,'-','','','','','','','',0,8,'data/instrumenty/ctopper-dlya-hirurgicheskih-kostnyh-drilej.jpg',20,1,672.0000,0,0,'2015-05-05',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,13,1,'2015-05-06 17:37:30','2015-05-06 17:44:54',29),
	(197,'470304, 470405, 470506, 470607','','','','','','','',0,8,'data/instrumenty/sverlo-trefajn.jpg',20,1,4800.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,1,1,'2015-05-07 11:53:31','2015-05-07 12:00:20',22),
	(198,'701107, 700807','','','','','','','',0,8,'data/instrumenty/titanovyj-vint-shestigrannyj.jpg',20,1,480.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,2,1,'2015-05-07 12:07:13','0000-00-00 00:00:00',23),
	(199,'702107, 702807','','','','','','','',0,8,'data/instrumenty/titanovyj-vint-kruglyj.jpg',20,1,480.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,3,1,'2015-05-07 12:14:08','0000-00-00 00:00:00',22),
	(200,'700407','','','','','','','',0,8,'data/instrumenty/krepezhnyj-titanovyj-vint-shestigrannyj.jpg',20,1,480.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,4,1,'2015-05-07 12:17:39','0000-00-00 00:00:00',28),
	(201,'702407','','','','','','','',0,8,'data/instrumenty/krepezhnyj-titanovyj-vint-kruglyj.jpg',20,1,480.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,5,1,'2015-05-07 12:35:13','0000-00-00 00:00:00',24),
	(202,'700330, 700530','','','','','','','',0,8,'data/instrumenty/krepezhnyj-titanovyj-pin.jpg',20,1,480.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,6,1,'2015-05-07 13:11:33','0000-00-00 00:00:00',28),
	(203,'421001-421005, 421011-421015','','','','','','','',0,8,'data/instrumenty/osteotomy.jpg',20,1,3360.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,7,1,'2015-05-07 13:20:05','2015-05-07 13:25:01',27),
	(204,'421000','','','','','','','',0,8,'data/instrumenty/nabor-osteotomov.jpg',20,1,38400.0100,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,8,1,'2015-05-07 13:47:45','0000-00-00 00:00:00',27),
	(205,'430521, 431821','','','','','','','',0,8,'data/instrumenty/shestigrannyj-klyuch-21mmd.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,1,1,'2015-05-07 14:13:06','0000-00-00 00:00:00',27),
	(206,'430121','','','','','','','',0,8,'data/instrumenty/shestigrannyj-klyuch-21mmd-dlya-uglovogo-nakonechnika.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,2,1,'2015-05-07 14:45:35','0000-00-00 00:00:00',25),
	(207,'430525, 431825','','','','','','','',0,8,'data/instrumenty/shestigrannyj-klyuch-25mmd.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,4,1,'2015-05-07 15:07:26','2015-05-07 15:25:12',26),
	(208,'430025','','','','','','','',0,8,'data/instrumenty/shestigrannyj-klyuch-25mmd-dlya-uglovogo-nakonechnika.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,4,1,'2015-05-07 15:28:21','0000-00-00 00:00:00',26),
	(209,'430021','','','','','','','',0,8,'data/instrumenty/polyj-klyuch-dlya-uglovogo-nakonechnika-21mmd.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,5,1,'2015-05-07 15:39:01','2015-05-07 15:47:08',30),
	(210,'431021','','','','','','','',0,8,'data/instrumenty/polyj-klyuch-21mmd.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,6,1,'2015-05-07 15:52:08','0000-00-00 00:00:00',33),
	(211,'432121','','','','','','','',0,8,'data/instrumenty/adaptor-dlya-implantata-vektor-21mmd.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,7,1,'2015-05-07 15:57:00','2015-05-07 16:00:14',31),
	(212,'430027','','','','','','','',0,8,'data/instrumenty/polyj-klyuch-dlya-uglovogo-nakonechnika-27mmd.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,8,1,'2015-05-07 16:09:21','0000-00-00 00:00:00',15),
	(213,'431027','','','','','','','',0,8,'data/instrumenty/polyj-klyuch-27mmd.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,9,1,'2015-05-07 16:21:37','2015-05-07 17:48:29',51),
	(214,'431914','','','','','','','',0,8,'data/instrumenty/klyuch-dlya-uderzhaniya-abatmentov.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,1,1,'2015-05-07 16:43:25','0000-00-00 00:00:00',28),
	(215,'431912','','','','','','','',0,8,'data/instrumenty/klyuch-dlya-izvlecheniya-zashchyolkivayushchegosya-abatmenta-main.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,2,1,'2015-05-07 17:12:45','0000-00-00 00:00:00',29),
	(216,'430717','','','','','','','',0,8,'data/instrumenty/shestigrannyj-klyuch-1-77-mmd.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,3,1,'2015-05-07 17:17:57','0000-00-00 00:00:00',37),
	(217,'430617','','','','','','','',0,8,'data/instrumenty/ruchnoj-shestigrannyj-klyuch-1-77-mmd.jpg',20,1,2160.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,4,1,'2015-05-07 17:23:02','0000-00-00 00:00:00',28),
	(218,'430017','','','','','','','',0,8,'data/instrumenty/shestigrannyj-klyuch-dlya-uglovogo-nakonechnika-1-77-mmd.jpg',20,1,1440.0000,0,0,'2015-05-06',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,5,1,'2015-05-07 17:27:46','0000-00-00 00:00:00',31),
	(219,'431112, 431412','','','','','','','',0,8,'data/instrumenty/shestigrannyj-klyuch-1-25-mmd.jpg',20,1,1440.0000,0,0,'2015-05-07',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,1,1,'2015-05-08 15:17:53','2015-05-08 15:27:45',29),
	(220,'431212, 431712','','','','','','','',0,8,'data/instrumenty/ruchnoj-shestigrannyj-klyuch-1-25-mmd.jpg',20,1,2160.0000,0,0,'2015-05-07',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,2,1,'2015-05-08 16:07:17','2015-05-08 16:11:34',31),
	(221,'430012','','','','','','','',0,8,'data/instrumenty/shestigrannyj-klyuch-dlya-uglovogo-nakonechnika-1-25-mmd.jpg',20,1,1440.0000,0,0,'2015-05-07',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,3,1,'2015-05-08 16:19:54','0000-00-00 00:00:00',28),
	(222,'432312, 432912','','','','','','','',0,8,'data/instrumenty/universalnyj-shestigrannyj-klyuch-1-25-mmd.jpg',20,1,1680.0000,0,0,'2015-05-07',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,4,1,'2015-05-08 16:27:44','0000-00-00 00:00:00',32),
	(223,'430007','','','','','','','',0,8,'data/instrumenty/laboratornyj-shestigrannyj-klyuch-1-25-mmd.jpg',20,1,624.0000,0,0,'2015-05-07',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,5,1,'2015-05-08 16:34:35','0000-00-00 00:00:00',30),
	(224,'430008','','','','','','','',0,8,'data/instrumenty/laboratornyj-shestigrannyj-klyuch-1-25-mmd-dlinnyj.jpg',20,1,1296.0000,0,0,'2015-05-07',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,6,1,'2015-05-08 16:38:08','0000-00-00 00:00:00',31),
	(225,'901545, 900745, 901538, 901552','','','','','','','',0,8,'data/protetika/vintovoj-transfer-dlya-zakrytoj-lozhki.jpg',20,1,1680.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,1,1,'2015-05-13 13:28:56','2015-05-13 13:31:28',15),
	(226,'901535','','','','','','','',0,8,'data/protetika/vintovoj-transfer-dlya-zakrytoj-lozhki-s-uzkoj-platformoj.jpg',20,1,1680.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,2,1,'2015-05-13 14:51:39','0000-00-00 00:00:00',10),
	(227,'902545, 900845, 901745, 901550','','','','','','','',0,8,'data/protetika/vintovoj-transfer-dlya-otkrytoj-lozhki.jpg',20,1,1680.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,3,1,'2015-05-13 15:06:17','0000-00-00 00:00:00',12),
	(228,'901735','','','','','','','',0,8,'data/protetika/vintovoj-transfer-dlya-otkrytoj-lozhki-s-uzkoj-platformoj.jpg',20,1,1680.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,4,1,'2015-05-13 15:11:37','0000-00-00 00:00:00',10),
	(229,'901546, 900746, 901540, 901551','','','','','','','',0,8,'data/protetika/transfer-s-klipsoj-dlya-zakrytoj-lozhki.jpg',20,1,1200.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,5,1,'2015-05-13 15:22:59','0000-00-00 00:00:00',11),
	(230,'901635','','','','','','','',0,8,'data/protetika/transfer-s-klipsoj-dlya-zakrytoj-lozhki-s-uzkoj-platformoj.jpg',20,1,1200.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,6,1,'2015-05-13 15:26:29','0000-00-00 00:00:00',12),
	(231,'901047','','','','','','','',0,8,'data/protetika/transfer-ehsteticheskogo-abatmenta-dlya-otkrytoj-lozhki.jpg',20,1,1680.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,7,1,'2015-05-13 15:33:36','0000-00-00 00:00:00',13),
	(232,'900929','','','','','','','',0,8,'data/protetika/transfer-ehsteticheskogo-abatmenta-dlya-zakrytoj-lozhki.jpg',20,1,1200.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,8,1,'2015-05-13 15:40:59','0000-00-00 00:00:00',13),
	(233,'711729','','','','','','','',0,8,'data/protetika/dlinyj-vint-dlya-transfera-abatmenta.jpg',20,1,480.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,9,1,'2015-05-13 15:56:09','0000-00-00 00:00:00',13),
	(234,'687031','','','','','','','',0,8,'data/protetika/titanovyj-rukav-transfer.jpg',20,1,1680.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,10,1,'2015-05-13 16:02:45','0000-00-00 00:00:00',14),
	(235,'901845, 900945, 901838, 901852','','','','','','','',0,8,'data/protetika/vintovoj-transfer-dlya-zakrytoj-lozhki.jpg',20,1,1680.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,1,1,'2015-05-13 16:06:07','2015-05-13 16:34:18',16),
	(236,'901835','','','','','','','',0,8,'data/protetika/vintovoj-transfer-dlya-zakrytoj-lozhki-s-uzkoj-platformoj.jpg',20,1,1680.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,2,1,'2015-05-13 16:21:56','2015-05-13 16:44:09',12),
	(237,'903845, 901045, 902845, 901850','','','','','','','',0,8,'data/protetika/vintovoj-transfer-dlya-otkrytoj-lozhki.jpg',20,1,1680.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,3,1,'2015-05-13 16:26:43','2015-05-13 16:46:23',12),
	(238,'902835','','','','','','','',0,8,'data/protetika/vintovoj-transfer-dlya-otkrytoj-lozhki-s-uzkoj-platformoj.jpg',20,1,1680.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,4,1,'2015-05-13 16:47:08','2015-05-13 16:51:03',10),
	(239,'920038, 920035, 920050, 920060','','','','','','','',0,8,'data/protetika/analog-implantata-s-vnutrennim-shestigrannikom.jpg',20,1,720.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,1,1,'2015-05-13 17:07:52','2015-05-13 17:16:05',29),
	(240,'927539','','','','','','','',0,8,'data/protetika/analog-titanovogo-abatmenta-1-4.jpg',20,1,720.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,2,1,'2015-05-13 17:21:13','0000-00-00 00:00:00',22),
	(241,'923539','','','','','','','',0,8,'data/protetika/individualnyj-analog-frezerovannogo-titanovogo-abatmenta-1-4.jpg',20,1,816.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,3,1,'2015-05-13 17:27:08','0000-00-00 00:00:00',23),
	(242,'920147','','','','','','','',0,8,'data/protetika/analog-titanovogo-abatmenta-dlya-odnomomentnoj-nagruzki.jpg',20,1,720.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,4,1,'2015-05-13 17:33:46','0000-00-00 00:00:00',23),
	(243,'921147','','','','','','','',0,8,'data/protetika/analog-frezerovannogo-abatmenta-dlya-nemedlennoj-nagruzki.jpg',20,1,816.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,5,1,'2015-05-13 17:42:41','0000-00-00 00:00:00',31),
	(244,'920556','','','','','','','',0,8,'data/protetika/analog-shirokogo-titanovogo-abatmenta-2-4.jpg',20,1,720.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,6,1,'2015-05-13 17:48:06','0000-00-00 00:00:00',29),
	(245,'921556','','','','','','','',0,8,'data/protetika/individualnyj-analog-frezerovannogo-titanovogo-abatmenta-2-4.jpg',20,1,816.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,7,1,'2015-05-13 17:52:12','0000-00-00 00:00:00',31),
	(246,'920146','','','','','','','',0,8,'data/protetika/analog-titanovogo-anatomicheskogo-abatmenta.jpg',20,1,912.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,8,1,'2015-05-13 18:26:01','0000-00-00 00:00:00',26),
	(247,'921146','','','','','','','',0,8,'data/protetika/individualnyj-analog-frezerovannogo-anatomicheskogo-abatmenta.jpg',20,1,1008.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,9,1,'2015-05-13 18:32:23','0000-00-00 00:00:00',21),
	(248,'921545','','','','','','','',0,8,'data/protetika/analog-uglovogo-15-titanovogo-anatomicheskogo-abatmenta.jpg',20,1,912.0000,0,0,'2015-05-12',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,10,1,'2015-05-13 18:55:32','0000-00-00 00:00:00',25),
	(249,'922547','','','','','','','',0,8,'data/protetika/analog-uglovogo-25-titanovogo-anatomicheskogo-abatmenta.jpg',20,1,912.0000,0,0,'2015-05-13',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,11,1,'2015-05-14 15:42:22','0000-00-00 00:00:00',25),
	(250,'922550','','','','','','','',0,8,'data/protetika/analog-titanovogo-abatmenta-s-sharikovym-atachmentom.jpg',20,1,912.0000,0,0,'2015-05-13',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,12,1,'2015-05-14 15:48:31','0000-00-00 00:00:00',22),
	(251,'661040','','','','','','','',0,8,'data/protetika/analog-titanovogo-lokator-abatmenta.jpg',20,1,1296.0000,0,0,'2015-05-13',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,13,1,'2015-05-14 17:16:32','0000-00-00 00:00:00',27),
	(252,'920040','','','','','','','',0,8,'data/protetika/analog-standartnogo-vintovogo-abatmenta-konnektora.jpg',20,1,720.0000,0,0,'2015-05-13',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,14,1,'2015-05-14 17:21:52','0000-00-00 00:00:00',35),
	(253,'920047','','','','','','','',0,8,'data/protetika/analog-ehsteticheskogo-vintovogo-abatmenta-konnektora.jpg',20,1,720.0000,0,0,'2015-05-13',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,15,1,'2015-05-14 17:56:02','0000-00-00 00:00:00',32),
	(254,'441700','','','','','','','',0,8,'data/protetika/plastmassovyj-nositel-abatmenta-implantata.jpg',20,1,0.0000,0,0,'2015-05-13',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,1,0,'2015-05-14 18:09:09','0000-00-00 00:00:00',0),
	(255,'940147','','','','','','','',0,8,'data/protetika/plastikovyj-kolpachok-dlya-vremennogo-protezirovaniya.jpg',20,1,480.0000,0,0,'2015-05-13',5.00000000,2,0.00000000,0.00000000,0.00000000,2,0,1,2,1,'2015-05-14 18:35:53','0000-00-00 00:00:00',37);

/*!40000 ALTER TABLE `comcs_product` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_product_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_attribute`;

CREATE TABLE `comcs_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_product_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_description`;

CREATE TABLE `comcs_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_product_description` WRITE;
/*!40000 ALTER TABLE `comcs_product_description` DISABLE KEYS */;

INSERT INTO `comcs_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`, `tag`)
VALUES
	(74,1,'Титановый имплантат &quot;Вектор&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Имплантат &quot;Вектор&quot;&lt;/strong&gt; представляет собой монолитный титановый имплантат с интегрированным абатментом, разработанный для одноэтапной хирургической процедуры. Уникальная конструкция формы и резьбы имплантата &quot;Вектор&quot; позволяет использовать его для немедленной имплантации и нагрузки. Узкие имплантаты &quot;Вектор&quot; рекомендуются для имплантации при узком альвеолярном гребне, имплантации в области нижних передних резцов, недостаточном расстоянии между естественными зубами, то есть при недостаточном ортопедическом пространстве. Имплантаты &quot;Вектор&quot; диаметром 2.4мм являются временными имплантатами.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/titanovyi-implantat-vector-mod.jpg&quot; alt=&quot;титановый имплантат вектор&quot; title=&quot;титановый имплантат вектор&quot; /&gt;','','титановый имплантат вектор','Титановый имплантат Вектор','Титановый имплантат &quot;Вектор&quot;','грин, имплантат'),
	(76,1,'Титановый имплантат &quot;Респект&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Имплантат &quot;Респект&quot;&lt;/strong&gt;представляет собой конический спиральный винтовой самонарезающий титановый имплантат с внутренним шестигранником диаметром 2.1мм и 2.43мм. Верхняя часть имплантата в виде обратного конуса с диаметром 3.0 или 3.8 мм. Снижение диаметра коронковой части способствует росту кости и процессу остеоинтеграции, противодействует нежелательной атрофии костной ткани. Меняющаяся двухспиральная резьба с шагом резьбы 1.1мм х2 и четырех-спиральная микрорезьба с шагом резьбы 0.5мм х4 обеспечивают плавный вход имплантата в приготовленное костное ложе имплантата и создают великолепную первичную фиксацию имплантата в кости, а также предотвращают нежелательную атрофию костной ткани вокруг него. Специальная система мульти блокировки &quot;Multi-lock systems&quot; обеспечивает отличную фиксацию между абатментом и имплантатом, создает максимальную поддержку абатмента во внутреннем шестиграннике имплантата и предотвращает любые микродвижения установленного абатмента во всех направлениях. Подходит для всех типов костной ткани. Рекомендуется для верхней челюсти, типа костной ткани D-3,4 и при непосредственой имплантации. Области имплантации - все участки верхней и нижней челюсти.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/titanovyi-implantat-respect-mod.png&quot; alt=&quot;титановый имплантат респект&quot; title=&quot;титановый имплантат респект&quot; /&gt;','','титановый имплантат респект','Титановый имплантат Респект','Титановый имплантат &quot;Респект&quot;','грин, имплантат'),
	(73,1,'Титановый имплантат &quot;Классик&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Имплантат &quot;Классик&quot;&lt;/strong&gt; представляет собой конический винтовой самонарезающий титановый имплантат с внутренним шестигранником диаметром 2.43мм. Меняющаяся двухспиральная резьба с шагом резьбы О.6мм х2 и четырехспиральная микрорезьба с шагом резьбы 0.35мм х4 обеспечивают плавный вход имплантата в приготовленное костное ложе имплантата и великолепную первичную фиксацию имплантата в кости, а также предотвращают нежелательную атрофию костной ткани вокруг него. Специальная система мультиблокировки &quot;Multi-lock systems&quot; обеспечивает отличную фиксацию между абатментом и имплантатом, создает максимальную поддержку абатмента во внутреннем шестиграннике имплантата и предотвращает любые микродвижения установленного абатмента во всех направлениях. Подходит для всех типов костной ткани. Рекомендуется для типа костной ткани D-1,2. Области имплантации - все участки верхней и нижней челюсти.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/titanovyi-implantat-classic-mod.jpg&quot; alt=&quot;титановый имплантат классик&quot; title=&quot;титановый имплантат классик&quot; /&gt;','','титановый имплантат классик','Титановый имплантат Классик','Титановый имплантат &quot;Классик&quot;','грин, имплантат'),
	(77,1,'Титановый имплантат &quot;Классик Плюс&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Имплантат &quot;Классик Плюс&quot;&lt;/strong&gt; представляет собой конический винтовой самонарезающий титановый имплантат с внутренним шестигранником диаметром 2.1мм и 2.43мм, состоящий из 2 частей (модулей). Нижняя часть - полноценный имплантат с внутренним шестигранником 2.43мм. Верхняя часть имплантата (префикс) высотой Змм соединяется с нижней частью при помощи специальной системы внутренней мультиблокировки. При необходимости можно отсоединить верхнюю часть с помощью специального ключа. Меняющаяся двухспиральная резьба с шагом резьбы О.бмм х2 и четырехспиральная микрорезьба с шагом резьбы 0.35мм х4 обеспечивают плавный вход имплантата в приготовленное костное ложе имплантата и великолепную первичную фиксацию имплантата в кости, а также предотвращают нежелательную атрофию костной ткани вокруг него. Специальная система мультиблокировки &quot;Multi-lock systems&quot; обеспечивает отличную фиксацию между абатментом и имплантатом, создает максимальную поддержку абатмента во внутреннем шестиграннике имплантата и предотвращает любые микродвижения установленного абатмента во всех направлениях. Имплантат &quot;Классик Плюс&quot; подходит для всех типов костной ткани. Рекомендуется для типа костной ткани D-1,2. Области имплантации - все участки верхней и нижней челюсти.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/titanovyi-implantat-classic-plus-mod.png&quot; alt=&quot;титановый имплантат классик плюс&quot; title=&quot;титановый имплантат классик плюс&quot; /&gt;','','титановый имплантат классик плюс','Титановый имплантат Классик Плюс','Титановый имплантат &quot;Классик Плюс&quot;','грин, имплантат+'),
	(78,1,'Титановый имплантат &quot;Универсал Плюс&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Имплантат &quot;Универсал Плюс&quot;&lt;/strong&gt; представляет собой конический винтовой самонарезающий титановый имплантат с внутренним шестигранником диаметром 2.1мм и 2.43мм, состоящий из 2 частей (модулей). Нижняя часть - полноценный имплантат с внутренним шестигранником 2.43мм. Верхняя часть имплантата (префикс) высотой Змм соединяется с нижней частью при помощи специальной системы внутренней мульти-блокировки. При необходимости можно отсоединить верхнюю часть с помощью специального ключа. Меняющаяся двух-спиральная резьба с шагом резьбы\r\n1.1	мм х2 и четырех-спиральная микрорезьба с шагом резьбы 0.4мм х4 обеспечивают плавный вход имплантата в приготовленное костное ложе имплантата и великолепную первичную фиксацию имплантата в кости, а также предотвращают нежелательную атрофию костной ткани вокруг него. Специальная система мульти-блокировки &quot;Multi-lock systems&quot; обеспечивает отличную фиксацию между абатментом и имплантатом, создает максимальную поддержку абатмента во внутреннем шестиграннике имплантата и предотвращает любые микродвижения установленного абатмента во всех направлениях. Имплантат &quot;Универсал Плюс&quot; подходит и рекомендуется для всех типов костной ткани (D-1,2,3,4). Области имплантации - все участки верхней и нижней челюсти.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/titanovyi-implantat-universal-plus-mod.jpg&quot; alt=&quot;титановый имплантат универсал плюс&quot; title=&quot;титановый имплантат универсал плюс&quot; /&gt;','','титановый имплантат универсал плюс','Титановый имплантат Универсал Плюс','Титановый имплантат &quot;Универсал Плюс&quot;','грин, имплантат+'),
	(79,1,'Титановый имплантат &quot;Респект Плюс&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Имплантат &quot;Респект Плюс&quot;&lt;/strong&gt; представляет собой конический винтовой самонарезающий титановый имплантат с внутренним шестигранником диаметром 2.1 мм и 2.43мм, состоящий из 2 частей (модулей). Нижняя часть - полноценный имплантат с внутренним шестигранником 2.43мм. Верхняя часть имплантата (префикс) высотой Змм в виде обратного конуса с диаметром 3.0 или 3.8 мм соединяется с нижней частью при помощи специальной системы внутренней мультиблокировки. При необходимости можно отсоединить верхнюю часть с помощью специального ключа. Меняющаяся двухспиральная резьба с шагом резьбы 1.1мм х2 и четырехспиральная микрорезьба с шагом резьбы 0.5мм х4 обеспечивают плавный вход имплантата в приготовленное костное ложе имплантата и создают великолепную первичную фиксацию имплантата в кости, а также предотвращают нежелательную атрофию костной ткани вокруг него. Специальная система мультиблокировки &quot;Multi-lock systems&quot; обеспечивает отличную фиксацию между абатментом и имплантатом, создает максимальную поддержку абатмента во внутреннем шестиграннике имплантата и предотвращает любые микродвижения установленного абатмента во всех направлениях. Имплантат &quot;Респект Плюс&quot; подходит для всех типов костной ткани. Рекомендуется для верхней челюсти, типа костной ткани D-3,4 и при непосредственной имплантации. Области имплантации - все участки верхней и нижней челюсти.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/titanovyi-implantat-respect-plus-mod.jpg&quot; alt=&quot;титановый имплантат респект плюс&quot; title=&quot;титановый имплантат респект плюс&quot; /&gt;','','титановый имплантат респект плюс','Титановый имплантат Респект Плюс','Титановый имплантат &quot;Респект Плюс&quot;','грин, имплантат+'),
	(80,1,'Титановый имплантат &quot;Вектор Плюс&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Имплантат &quot;Вектор&quot;&lt;/strong&gt; представляет собой двухкомпонентный титановый имплантат с наружным шестигранником 2.7мм, разработанный для одноэтапной хирургической процедуры при узких альвеолярных гребнях. Уникальная конструкция формы и резьбы имплантата &quot;Вектор Плюс&quot; позволяет использовать его для немедленной имплантации и нагрузки. Имплантаты &quot;Вектор Плюс&quot; рекомендуются также для имплантации в области нижних передних резцов, недостаточном расстоянии между естественными зубами. Стандартная система титановых абатментов имплантата &quot;Вектор Плюс&quot; делает его весьма практичным и недорогим для широкого диапазона методов лечения.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/titanovyi-implantat-vector-plus-mod.jpg&quot; alt=&quot;титановый имплантат вектор плюс&quot; title=&quot;титановый имплантат вектор плюс&quot; /&gt;','','титановый имплантат вектор плюс','Титановый имплантат Вектор Плюс','Титановый имплантат &quot;Вектор Плюс&quot;','грин, имплантат+'),
	(81,1,'Винтовой лечебный абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Лечебный винтовой титановый абатмент (формирователь  дес­ны).&lt;/strong&gt; Устанавливается на имплантат с внутренним шестигранником 2.1ммд и 2.43ммд в случае проведения имплантации в одну стадию или на этапе раскрытия имплантатов.&lt;/p&gt;\r\n&lt;p&gt;Высота и ширина формирователя десны выбирается в зависимости от вида и диаметра устанавливаемого имплантата, состояния и количества десневого края вокруг имплантата. Обязательным условием является то, что формирователь десны должен быть на 1-3мм выше десневого края (слизистой) и не контактировать с антагонистами. Не рекомендуется устанавливать широкие лечебные абатменты  на установленный имплантат (одноэтапная имплантация), можно устанавливать только на стадии раскрытия имплантатов.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/vintovoi-lechebnyi-abatment-mod.jpg&quot; alt=&quot;винтовой лечебный абатмент&quot; title=&quot;винтовой лечебный абатмент&quot; /&gt;','','винтовой лечебный абатмент','Винтовой лечебный абатмент','Винтовой лечебный абатмент','грин'),
	(82,1,'Винтовой лечебный абатмент Плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Лечебный винтовой титановый абатмент плюс&lt;/strong&gt; (формирователь дес­ны). Изготовлены из медицинского титана G-5. Тело абатмента цилиндрической формы. Используется вместе с шестигранным ключом 1,25ммд. Устанавливается на имплантат плюс на хирургическом этапе одноэтапной имплантации или на этапе раскрытия имплантатов плюс. Формирователь десны выбирается согласно клинической ситуации . Формирователи десны отличаюся по высоте цилиндрической части и диаметру.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/vintovoi-lechebnyi-abatment-plus-mod.jpg&quot; alt=&quot;винтовой лечебный абатмент плюс&quot; title=&quot;винтовой лечебный абатмент плюс&quot; /&gt;','','винтовой лечебный абатмент плюс','Винтовой лечебный абатмент Плюс','Винтовой лечебный абатмент Плюс','грин'),
	(83,1,'Лечебный винтовой титановый абатмент для имплантата &quot;Вектор Плюс&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Лечебный винтовой титановый абатмент&lt;/strong&gt; (формирователь дес­ны) диаметром 3.0ммд и высотой 3мм. Устанавливается на имплантат соло модуляр с наружным шестигранником 2.7ммд на хирургическом этапе проведения имплантации в случае, если на следующих этапах лечения будут использоваться винтовые абатменты.&lt;/p&gt;','','лечебный винтовой титановый абатмент для вектор плюс','Лечебный винтовой титановый абатмент для имплантата Вектор Плюс','Лечебный винтовой титановый абатмент для имплантата &quot;Вектор Плюс&quot;','грин'),
	(84,1,'Лечебный замковый титановый абатмент для имплантата &quot;Вектор Плюс&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Лечебный замковый титановый абатмент&lt;/strong&gt; (формирователь дес­ны) диаметром 3.5ммд и высотой 5мм.  Состоит из тела в виде полого цилиндра с внутренним шестигранником и винта. Устанавливается на имплантат соло модуляр с наружным шестигранником 2.7ммд на хирургическом этапе проведения имплантации в случае, если на следующих этапах лечения будут использоваться замковые абатменты.&lt;/p&gt;','','лечебный замковый титановый абатмент для вектор плюс','Лечебный замковый титановый абатмент для имплантата Вектор Плюс','Лечебный замковый титановый абатмент для имплантата &quot;Вектор Плюс&quot;','грин'),
	(85,1,'Лечебный титановый колпачок для абатмента','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Лечебный титановый колпачок для абатмента&lt;/strong&gt; (формирователь дес­ны над абатментом) диаметром 4.7ммд и высотой 5мм/ Состоит из тела в виде полого цилиндра и винта. Устанавливается на эстетический винтовой абатмент – коннектор для формирования дёсенного края над уступом абатмента.&lt;/p&gt;','','лечебный титановый колпачок для абатмента','Лечебный титановый колпачок для абатмента','Лечебный титановый колпачок для абатмента','грин'),
	(87,1,'Титановый заглушный винт для имплантата &quot;Плюс&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый заглушный винт для имплантата &quot;Плюс&quot;.&lt;/strong&gt; Для закры­тия внутренней резьбы и внутреннего шестиграника. Используется при двухэтапной имплантации,идет в наборе с имплантатом плюс.&lt;/p&gt;','','титановый заглушный винт для имплантата плюс','Титановый заглушный винт для имплантата Плюс','Титановый заглушный винт для имплантата &quot;Плюс&quot;','грин'),
	(86,1,'Титановый заглушный винт','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый заглушный винт&lt;/strong&gt; для закры­тия внутренней резьбы имплантата с внутренним шестигранником 2.43ммд при двухэтапной имплантации. Идет в наборе с имплантатом, необходимо иметь для случая, если винт имплантата упал или попал в сакшен.&lt;/p&gt;','','титановый заглушный винт','Титановый заглушный винт','Титановый заглушный винт','грин'),
	(88,1,'Префикс для имплантатов &quot;Плюс&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Префикс для имплантатов &quot;Плюс&quot;&lt;/strong&gt; - это верхний модуль (PREFIX), титановая деталь , которая состоит из тела в виде цилиндра высотой 3мм, с внутренним шестигранником 2.43мм, со специальным замковым соединением, и наружного шестигранника 2.42мм. Green Prefix for Implant Plus изготовлены из медицинского титанового сплава грей5. Поверхность имеет двойную обработку – пескоструйная и кислотная обработка. Спиралевидная меняющаяся микрорезьба 4х0.4мм.&lt;/p&gt;\r\n&lt;p&gt;Является неотъемлемой частью (верхним модулем) Green Classic Plus Titanium Implant и Green Universal Plus Titanium Implant, которая наружным шестигранником входит во внутренний шестигранник нижнего модуля имплантата плюс и образует неподвижное соединение.&lt;/p&gt;\r\n&lt;p&gt;Также используется на хирургическом этапе имплантации для замены верхнего модуля имплантата плюс на верхний модуль другого размера или другой формы или замены верхнего модуля при резорбции (оголении) имплантата плюс на новый и проведения направленной регенерации костной ткани(агументации) вокруг нового верхнего модуля с восстановлением высоты альвеолярного гребня. Отличаются Green Prefix for Implant Plus по диаметру.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/prefiks-dlia-implantatov-plus-mod.jpg&quot; alt=&quot;префикс для имплантатов плюс&quot; title=&quot;префикс для имплантатов плюс&quot; /&gt;','','префикс для имплантатов плюс','Префикс для имплантатов Плюс','Префикс для имплантатов &quot;Плюс&quot;','грин'),
	(89,1,'Префикс для имплантата &quot;Респект Плюс&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Префикс для имплантата &quot;Респект Плюс&quot;&lt;/strong&gt; - это верхний модуль (PREFIX), титановая деталь, которая состоит из тела в виде конуса высотой 3мм, с внутренним шестигранником 2.43мм, со специальным замковым соединением, и наружным шестигранником 2.42мм. Green Prefix for Implant Respect Plus изготовлены из медицинского титанового сплава грей5. Поверхность имеет двойную обработку – пескоструйная и кислотная обработка. Спиралевидная меняющаяся микрорезьба 4х0.45мм.&lt;/p&gt;\r\n&lt;p&gt;Является неотъемлемой частью (верхним модулем) Green Respect Plus Titanium Implant, которая своим наружным шестигранником входит во внутренний шестигранник нижнего модуля имплантата плюс и образует неподвижное соединение.&lt;/p&gt;\r\n&lt;p&gt;Также используется на хирургическом этапе имплантации для замены верхнего модуля имплантата плюс на верхний модуль другого размера или другой формы или замены верхнего модуля при резорбции (оголении) имплантата плюс на новый и проведения направленной регенерации костной ткани(агументации) вокруг нового верхнего модуля с восстановлением высоты альвеолярного гребня. Отличаются Green Prefix for Implant Respect Plus по диаметру широкой части конуса.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/prefiks-dlia-implantatov-respeсt-plus-mod.jpg&quot; alt=&quot;префикс для имплантата респект плюс&quot; title=&quot;префикс для имплантата респект плюс&quot; /&gt;','','префикс для имплантата респект плюс','Префикс для имплантата Респект Плюс','Префикс для имплантата &quot;Респект Плюс&quot;','грин'),
	(90,1,'Префикс для имплантатов &quot;Плюс&quot; с узкой платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Префикс для имплантатов &quot;Плюс&quot; с узкой платформой&lt;/strong&gt; - это верхний модуль (PREFIX), титановая деталь , которая состоит из тела в виде цилиндра высотой 3мм, с внутренним шестигранником 2.1мм, со специальным замковым соединением, и наружного шестигранника 2.42мм. Green Prefix for Implant Plus с узкой платформой изготовлены из медицинского титанового сплава грей5. Поверхность имеет двойную обработку – пескоструйная и кислотная обработка.  Спиралевидная меняющаяся микрорезьба 4х0.45мм.&lt;/p&gt;\r\n&lt;p&gt;Является неотъемлемой частью (верхним модулем) имплантатов &quot;Плюс&quot; (с узкой влатформой), которая наружным шестигранником входит во внутренний шестигранник нижнего модуля имплантата плюс и образует неподвижное соединение.&lt;/p&gt;\r\n&lt;p&gt;Также используется на хирургическом этапе имплантации для замены верхнего модуля имплантата плюс на верхний модуль другого размера или другой формы или замены верхнего модуля при резорбции (оголении) имплантата плюс на новый и проведения направленной регенерации костной ткани(агументации) вокруг нового верхнего модуля с восстановлением высоты альвеолярного гребня. Отличаются Green Prefix for Implant Plus с узкой платформой по диаметру нижней части конуса.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/prefiks-dlia-implantatov-plus-slim-mod.jpg&quot; alt=&quot;префикс для имплантатов плюс с узкой платформой&quot; title=&quot;префикс для имплантатов плюс с узкой платформой&quot; /&gt;','','префикс для имплантатов плюс с узкой платформой','Префикс для имплантатов Плюс с узкой платформой','Префикс для имплантатов &quot;Плюс&quot; с узкой платформой','грин'),
	(91,1,'Угловой префикс для имплантатов &quot;Плюс&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой префикс для имплантатов &quot;Плюс&quot;&lt;/strong&gt; - это верхний модуль (PREFIX), титановая деталь, которая состоит из тела в виде цилиндра высотой 3мм с угловым скосом 17 или 30 градусов. Внутри тела префикса (углового цилиндра) имеется резьба, на которую закручивается абатмент (используются абатменты системы углового адаптера), и наружного шестигранника 2.42мм.  Green Angular Prefix for Implant Plus изготовлен из медицинского титанового сплава грей5. Поверхность имеет двойную обработку – пескоструйная и кислотная обработка. Спиралевидная меняющаяся микрорезьба 4х0,4мм.&lt;/p&gt;\r\n&lt;p&gt;Используется на хирургическом этапе имплантации как дополнительная процедура для замены верхнего модуля имплантата плюс на  верхний  угловой модуль. Отличаются Green Angular prefix for implant plus по диаметру и углу наклона.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/uglovoi-prefiks-dlia-implantatov-plus-mod.jpg&quot; alt=&quot;&quot; title=&quot;&quot; /&gt;','','угловой префикс для имплантатов плюс','Угловой префикс для имплантатов Плюс','Угловой префикс для имплантатов &quot;Плюс&quot;','грин'),
	(75,1,'Титановый имплантат &quot;Универсал&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Имплантат &quot;Универсал&quot;&lt;/strong&gt; представляет собой конический спиральный винтовой самонарезающий титановый имплантат с внутренним шестигранником диаметром 2.1мм и 2.43мм. Меняющаяся двухспиральная резьба с шагом резьбы 1.1мм х2 и четырех-спиральная микрорезьба с шагом резьбы 0.4мм х4 обеспечивают плавный вход имплантата в приготовленное костное ложе имплантата и великолепную первичную фиксацию имплантата в кости, а также предотвращают нежелательную атрофию костной ткани вокруг него. Специальная система мультиблокировки &quot;Multi-lock systems&quot; обеспечивает отличную фиксацию между абатментом и имплантатом, создает максимальную поддержку абатмента во внутреннем шестиграннике имплантата и предотвращает любые микродвижения установленного абатмента во всех направлениях. Подходит и рекомендуется для всех типов костной ткани (D-1,2,3,4). Области имплантации - все участки верхней и нижней челюсти.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/implantaty/titanovyi-implantat-universal-mod.png&quot; alt=&quot;титановый имплантат универсал&quot; title=&quot;титановый имплантат универсал&quot; /&gt;','','титановый имплантат универсал','Титановый имплантат Универсал','Титановый имплантат &quot;Универсал&quot;','грин, имплантат'),
	(92,1,'Прямой титановый абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый Абатмент.&lt;/strong&gt; Используется для цементной и винтовой фиксации протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Прямой стандартный абатмент без уступа, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems. Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;500939 - тонкий (3.9ммд, высота 9мм)&lt;/li&gt;\r\n&lt;li&gt;500945 - нормальный (4.5ммд, высота 9мм)&lt;/li&gt;\r\n&lt;li&gt;501345 - длинный (4.5ммд, высота 13мм)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;img src=&quot;/image/data/protetika/priamoi-titanovyi-abatment-mod.png&quot; alt=&quot;прямой титановый абатмент&quot; title=&quot;прямой титановый абатмент&quot; /&gt;','','прямой титановый абатмент','Прямой титановый абатмент','Прямой титановый абатмент','грин, абатмент'),
	(93,1,'Титановый абатмент для имплантата &quot;Вектор Плюс&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый абатмент для имплантата &quot;Вектор Плюс&quot;.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент, без уступа, с диаметром 3.9мм, с шестиграником 2.7мм, с антиротационным элементом. Используется вместе с имплантатом &quot;Вектор Плюс&quot; диаметром 3.0ммд и 3.3ммд.&lt;/p&gt;','','титановый абатмент для имплантата вектор плюс','Титановый абатмент для имплантата &quot;Вектор Плюс&quot;','Титановый абатмент для имплантата &quot;Вектор Плюс&quot;','грин, абатмент'),
	(94,1,'Титановый абатмент с узкой платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый абатмент с узкой платформой.&lt;/strong&gt; Используется для цементной и винтовой фиксации протезной конструкции. Прямой стандартный абатмент, без уступа, с шестиграником 2.1мм, с антиротационным элементом. Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.0ммд,3.3ммд и имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 3,75ммд.&lt;/p&gt;','','титановый абатмент с узкой платформой','Титановый абатмент с узкой платформой','Титановый абатмент с узкой платформой','грин, абатмент'),
	(95,1,'Временный титановый абатмент для композита','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый Временный Абатмент для композита.&lt;/strong&gt; Используется для винтовой фиксации временной протезной конструкции. Прямой стандартный абатмент с уступом, уступ высотой 1мм и диаметром 4.5мм, круговыми ретенционными борозками для ретенции композита, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;','','временный титановый абатмент для композита','Временный титановый абатмент для композита','Временный титановый абатмент для композита','грин, абатмент'),
	(96,1,'Винтовой титановый абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый Винтовой Абатмент.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный винтовой абатмент без уступа, высотой 9мм и диаметром 4.5мм, без антиротационного элемента.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.0мм, 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0 мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0 мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;','','винтовой титановый абатмент','Винтовой титановый абатмент','Винтовой титановый абатмент','грин, абатмент'),
	(97,1,'Угловой титановый абатмент 15°','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Титановый Абатмент 15°.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой стандартный абатмент 15° без уступа, с диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;520845 - нормальный 4.5ммд, высотой 8мм&lt;/li&gt;\r\n&lt;li&gt;520950 - широкий 5.0ммд, высотой 9мм&lt;/li&gt;\r\n&lt;li&gt;521145 - длинный 4.5ммд, высотой 11мм&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-titanovyi-abatment-15-mod.jpg&quot; alt=&quot;угловой титановый абатмент 15 градусов&quot; title=&quot;угловой титановый абатмент 15 градусов&quot; /&gt;','','угловой титановый абатмент 15 градусов','Угловой титановый абатмент 15 градусов','Угловой титановый абатмент 15°','грин, абатмент'),
	(98,1,'Угловой титановый абатмент 15° с узкой платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой титановый абатмент 15° с узкой платформой.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой 15° стандартный абатмент, без уступа, с шестиграником 2.1мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.0ммд, 3.3ммд и имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 3,75ммд.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;520835 - стандартный&lt;/li&gt;\r\n&lt;li&gt;522835 - длинный&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-titanovyi-abatment-15-s-uzkoi-platformoi-mod.jpg&quot; alt=&quot;угловой титановый абатмент 15 градусов с узкой платформой&quot; title=&quot;угловой титановый абатмент 15 градусов с узкой платформой&quot; /&gt;','','угловой титановый абатмент 15 градусов с узкой платформой','Угловой титановый абатмент 15 градусов с узкой платформой','Угловой титановый абатмент 15° с узкой платформой','грин, абатмент'),
	(99,1,'Угловой титановый абатмент 25°','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Титановый Абатмент 25°.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой стандартный абатмент 25°, без уступа, высотой 8мм и диаметром 4.7мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0 мм , &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2ммд, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм,5.0мм, 6.0 мм.&lt;/p&gt;','','угловой титановый абатмент 25 градусов','Угловой титановый абатмент 25 градусов','Угловой титановый абатмент 25°','грин, абатмент'),
	(100,1,'Угловой титановый абатмент 25° с узкой платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой титановый абатмент 15° с узкой платформой.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой 25° стандартный абатмент, без уступа, с шестиграником 2.1мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.0ммд,3.3ммд и имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 3,75ммд.&lt;/p&gt;','','угловой титановый абатмент 25 градусов с узкой платформой','Угловой титановый абатмент 25 градусов с узкой платформой','Угловой титановый абатмент 25° с узкой платформой','грин, абатмент'),
	(101,1,'Прямой титановый абатмент для фрезеровки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый Абатмент для фрезеровки.&lt;/strong&gt; Используется для цементной и винтовой фиксации протезной конструкции. Прямой цилиндрический абатмент для изготовления индивидуального абатмента, без уступа, диаметром 3.9ммд и высотой 13мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0 ммд, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;501239 - узкий (диаметр 3.9мм)&lt;/li&gt;\r\n&lt;li&gt;501245 - нормальный (диаметр 4.5мм)&lt;/li&gt;\r\n&lt;li&gt;501263 - широкий (диаметр 6.3мм)&lt;/li&gt;\r\n&lt;li&gt;501280 - экстра широкий (диаметр 8.0мм)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;img src=&quot;/image/data/protetika/priamoi-titanovyi-abatment-dlia-frezerovki-mod.jpg&quot; alt=&quot;прямой титановый абатмент для фрезеровки&quot; title=&quot;прямой титановый абатмент для фрезеровки&quot; /&gt;','','прямой титановый абатмент для фрезеровки','Прямой титановый абатмент для фрезеровки','Прямой титановый абатмент для фрезеровки','грин, абатмент'),
	(102,1,'Титановый абатмент с узкой платформой для фрезеровки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый абатмент с узкой платформой для фрезеровки.&lt;/strong&gt; Используется для цементной и винтовой фиксации протезной конструкции. Прямой цилиндрический абатмент для изготовления индивидуального абатмента, без уступа, диаметром 4.5ммд и высотой 13мм, с шестигранником 2.1мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.0ммд, 3.3ммд и имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 3,75ммд.&lt;/p&gt;','','титановый абатмент с узкой платформой для фрезеровки','Титановый абатмент с узкой платформой для фрезеровки','Титановый абатмент с узкой платформой для фрезеровки','грин, абатмент'),
	(103,1,'Универсальный угловой титановый абатмент 15° для фрезеровки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Универсальный Угловой Титановый Абатмент 15° для фрезеровки.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой универсальный абатмент 15° без уступа для изготовления индивидуального углового абатмента, высотой 13мм и диаметром 4.5мм,со смещенным шестигранником 2.43мм на 30 градусов , с анти ротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0 ммд, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;521345 - нормальный 4.5ммд&lt;/li&gt;\r\n&lt;li&gt;521355 - широкий 5.5ммд&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;img src=&quot;/image/data/protetika/universalnyi-uglovoi-abatment-15-dlia-frezerovki-mod.jpg&quot; alt=&quot;универсальный угловой абатмент 15 градусов для фрезеровки&quot; title=&quot;универсальный угловой абатмент 15 градусов для фрезеровки&quot; /&gt;','','универсальный угловой абатмент 15 градусов для фрезеровки','Универсальный угловой титановый абатмент 15 градусов для фрезеровки','Универсальный угловой титановый абатмент 15° для фрезеровки','грин, абатмент'),
	(104,1,'Угловой титановый абатмент 25° для фрезеровки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Универсальный Угловой Титановый Абатмент 25° для фрезеровки.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой универсальный абатмент 25° без уступа для изготовления индивидуального углового абатмента, высотой 13мм и диаметром 4.7мм, со смещенным шестигранником 2.43мм на 30 градусов, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0 мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;','','угловой абатмент 25 градусов для фрезеровки','Угловой титановый абатмент 25 градусов для фрезеровки','Угловой титановый абатмент 25° для фрезеровки','грин, абатмент'),
	(105,1,'Пластиковый абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Пластиковый абатмент для литья.&lt;/strong&gt; Используется для отливки индивидуальных абатментов цементной и винтовой фиксации протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Прямой цилиндрический абатмент для изготовления индивидуального абатмента с уступом, высота которого 8.5мм, с шестигранником 2.43мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;548545 - нормальный 4.5ммд&lt;/li&gt;\r\n&lt;li&gt;548538 - узкий 3.8ммд&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;img src=&quot;/image/data/protetika/plastikovyi-abatment-mod.jpg&quot; alt=&quot;пластиковый абатмент&quot; title=&quot;пластиковый абатмент&quot; /&gt;','','пластиковый абатмент','Пластиковый абатмент','Пластиковый абатмент','грин, абатмент'),
	(106,1,'Пластиковый абатмент с нормальной платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Пластиковый абатмент с нормальной платформой. &lt;/strong&gt; Используется для отливки индивидуальных абатментов цементной и винтовой фиксации протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Прямой цилиндрический абатмент для изготовления индивидуального абатмента без уступа, высотой 13мм, с шестигранником 2.43мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;541245 - нормальный (диаметр 4.5мм)&lt;/li&gt;\r\n&lt;li&gt;541263 - широкий (диаметр 6.3мм)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;img src=&quot;/image/data/protetika/plastikovyi-abatment-s-normalnoi-platformoi-mod.jpg&quot; alt=&quot;пластиковый абатмент с нормальной платформой&quot; title=&quot;пластиковый абатмент с нормальной платформой&quot; /&gt;','','пластиковый абатмент с нормальной платформой','Пластиковый абатмент с нормальной платформой','Пластиковый абатмент с нормальной платформой','грин, абатмент'),
	(107,1,'Пластиковый абатмент с узкой платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Пластиковый абатмент с узкой платформой для литья.&lt;/strong&gt; Используется для отливки индивидуальных абатментов цементной и винтовой фиксации протезной конструкции. Прямой цилиндрический абатмент для изготовления индивидуального абатмента, без уступа, диаметром 3.0ммд и высотой 9мм, с шестигранником 2.1мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.0мм, 3.3мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 3.75ммд.&lt;/p&gt;','','пластиковый абатмент с узкой платформой','Пластиковый абатмент с узкой платформой','Пластиковый абатмент с узкой платформой','грин, абатмент'),
	(108,1,'Пластиковый абатмент с титановым базисом','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Пластиковый абатмент с титановым базисом для литья.&lt;/strong&gt; Используется для отливки индивидуальных абатментов цементной и винтовой фиксации протезной конструкции. Титановый базис прямой цилиндрической формы с уступом 1.5мм высотой, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;На титановый базис присоединяется пластиковый полый цилиндр, из которого отливается вместе с титановым базисом индивидуальный абатмент.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;','','пластиковый абатмент с титановым базисом','Пластиковый абатмент с титановым базисом','Пластиковый абатмент с титановым базисом','грин, абатмент'),
	(109,1,'Угловой пластиковый абатмент 15°','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Пластиковый Абатмент 15° для литья.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Угловой пластиковый абатмент 15° без уступа для изготовления индивидуального абатмента , высотой 8мм и диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0 мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;','','угловой пластиковый абатмент 15 градусов','Угловой пластиковый абатмент 15 градусов','Угловой пластиковый абатмент 15°','грин, абатмент'),
	(110,1,'Пластиковый абатмент для имплантата &quot;Вектор Плюс&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Пластиковый абатмент для имплантата &quot;Вектор Плюс&quot;.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент для изготовления индивидуального абатмента, без уступа, диаметром 3.9мм, с шестигранником 2.7ммд, с антиротационным элементом. Используется вместе с имплантатом &quot;Вектор Плюс&quot; 3.0ммд и 3.3ммд.&lt;/p&gt;','','пластиковый абатмент для имплантата вектор плюс','Пластиковый абатмент для имплантата Вектор Плюс','Пластиковый абатмент для имплантата &quot;Вектор Плюс&quot;','грин, абатмент'),
	(111,1,'Модулярный пластиковый абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Модулярный пластиковый абатмент.&lt;/strong&gt; Используется для изготовления индивидуальных абатментов, коронок, мостовидных протезов и съемных протезов с винтовой фиксацией. В процессе работы с модулярным пластиковым абатментом применяется дополнительный специальный ключ для удержания абатментов (431914).&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;549945 - Модулярный пластиковый абатмент с внутренним шестигранником (антиротационным элементом).&lt;/li&gt;\r\n&lt;li&gt;549955 - Модулярный круглый пластиковый абатмент с круглым внутренним основанием (без антиротационногo элемента).&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','модулярный пластиковый абатмент','Модулярный пластиковый абатмент','Модулярный пластиковый абатмент','грин, абатмент'),
	(112,1,'Винтовой титановый абатмент для одномоментной нагрузки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый винтовой абатмент для одномоментной нагрузки.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции.\r\nПрямой стандартный винтовой абатмент с уступом, уступ диаметром 4.7мм, без антиротационного элемента.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.0мм, 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0 мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0 мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;','','винтовой титановый абатмент для одномоментной нагрузки','Винтовой титановый абатмент для одномоментной нагрузки','Винтовой титановый абатмент для одномоментной нагрузки','грин, абатмент'),
	(113,1,'Угловой титановый абатмент 15° для одномоментной нагрузки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Титановый Абатмент 15° для одномоментной нагрузки.&lt;/strong&gt; Используется для цементной фиксации временной протезной конструкции на хирургическом этапе и постоянной протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Угловой абатмент 15° с суженной шейкой и уступом, диаметр которого 4.7мм, со специальным дополнительным соединением multi-lock systems, с шестигранником 2.43мм, с антиротационным элементом, дополнительным шестигранником 2.1мм на теле абатмента.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;','','угловой абатмент 15 градусов для одномоментной нагрузки','Угловой абатмент 15 градусов для одномоментной нагрузки','Угловой титановый абатмент 15° для одномоментной нагрузки','грин, абатмент'),
	(114,1,'Угловой титановый абатмент 25° для одномоментной нагрузки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Титановый Абатмент 25° для одномоментной нагрузки.&lt;/strong&gt; Используется для цементной фиксации временной протезной конструкции на хирургическом этапе и постоянной протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Угловой абатмент 25° с суженной шейкой и уступом, диаметр которого 4.7мм, со специальным дополнительным соединением multi-lock systems, с шестигранником 2.43мм, с антиротационным элементом, дополнительным шестигранником 2.1мм на теле абатмента.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм,5.0мм,6.0 мм.&lt;/p&gt;','','угловой абатмент 25 градусов для одномоментной нагрузки','Угловой титановый абатмент 25 градусов для одномоментной нагрузки','Угловой титановый абатмент 25° для одномоментной нагрузки','грин, абатмент'),
	(115,1,'Пластиковый анатомический временный абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Пластиковый анатомический временный абатмент.&lt;/strong&gt; Используется для цементной и винтовой фиксации временной протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Прямой пластмассовый абатмент с уступом, диаметр которого 4.6мм, с шестигранником 2.43мм, с антиротационным элементом. Изготовлен из прочного пластикового материала РЕЕК.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0ммд, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;','','пластиковый анатомический временный абатмент','Пластиковый анатомический временный абатмент','Пластиковый анатомический временный абатмент','грин, абатмент'),
	(116,1,'Угловой анатомический пластиковый временный абатмент 15°','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой анатомический пластиковый временный абатмент 15°.&lt;/strong&gt; Используется для цементной и винтовой фиксации временной протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Угловой абатмент 15° с уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с анти ротационным элементом. Изготовлен из прочного пластикового материала РЕЕК.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0ммд, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;','','угловой анатомический пластиковый временный абатмент 15 градусов','Угловой анатомический пластиковый временный абатмент 15 градусов','Угловой анатомический пластиковый временный абатмент 15°','грин, абатмент'),
	(117,1,'Временный угловой пластиковый абатмент 25°','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой анатомический пластиковый временный абатмент 25°.&lt;/strong&gt; Используется для цементной и винтовой фиксации временной протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Угловой абатмент 25° с уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с анти ротационным элементом. Изготовлен из прочного пластикового материала РЕЕК.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0ммд, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;','','временный угловой пластиковый абатмент 25 градусов','Временный угловой пластиковый абатмент 25 градусов','Временный угловой пластиковый абатмент 25°','грин, абатмент'),
	(118,1,'Титановый абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый абатмент.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент с уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyj-abatment-mod.jpg&quot; alt=&quot;титановый абатмент&quot; title=&quot;титановый абатмент&quot; /&gt;','','титановый абатмент','Титановый абатмент','Титановый абатмент','грин, абатмент'),
	(119,1,'Широкий титановый абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый широкий абатмент.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Прямой стандартный абатмент с уступом, уступ диаметром 5.6мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/shirokij-titanovyj-abatment-mod.jpg&quot; alt=&quot;широкий титановый абатмент&quot; title=&quot;широкий титановый абатмент&quot; /&gt;','','широкий титановый абатмент','Широкий титановый абатмент','Широкий титановый абатмент','грин, абатмент'),
	(120,1,'Титановый абатмент с узкой платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый абатмент с узкой платформой.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент, с уступом, с шестигранником 2.1мм, с антиротационным элементом. Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.0ммд и 3.3ммд и имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 3,75ммд.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyj-abatment-s-uzkoj-platformoj-mod.jpg&quot; alt=&quot;титановый абатмент с узкой платформой&quot; title=&quot;титановый абатмент с узкой платформой&quot; /&gt;','','титановый абатмент с узкой платформой','Титановый абатмент с узкой платформой','Титановый абатмент с узкой платформой','грин, абатмент'),
	(169,1,'Титановый эстетический абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый эстетический абатмент.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент с покрытием желтого цвета и уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyj-ehsteticheskij-abatment-mod.jpg&quot; alt=&quot;титановый эстетический абатмент&quot; title=&quot;титановый эстетический абатмент&quot; /&gt;','','титановый эстетический абатмент','Титановый эстетический абатмент','Титановый эстетический абатмент','грин, абатмент'),
	(122,1,'Титановый широкий эстетический абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый широкий эстетический абатмент.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Прямой стандартный абатмент с покрытием желтого цвета и уступом, уступ диаметром 5.6мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyj-shirokij-ehsteticheskij-abatment-mod.jpg&quot; alt=&quot;титановый широкий эстетический абатмент&quot; title=&quot;титановый широкий эстетический абатмент&quot; /&gt;','','титановый широкий эстетический абатмент','Титановый широкий эстетический абатмент','Титановый широкий эстетический абатмент','грин, абатмент'),
	(123,1,'Прямой титановый замковый абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Прямой титановый замковый абатмент.&lt;/strong&gt; Для удержания имплантата в стерильной упаковке и вкручивания вместе с имплантатом в челюстную кость на хирургическом этапе имплантации.&lt;/p&gt;\r\n&lt;p&gt;Верхняя часть абатмента имеет полое углубление в виде шестигранника диаметром 2.5ммд с высотой 6мм. На теле абатмента длиной 8,5мм имеются шесть граней по всей длине, соответствующие граням шестигранника на нижней части абатмента и шестигранника на верхней части абатмента. На нижней части носителя имеется шестигранник 2,5ммд и высотой 2,5мм, который вставляется в шестигранник имплантата. Шестигранник абатмента вставляется в шестигранник имплантата как замок (неподвижное соединение в горизонтальной плоскости) и фиксируется винтом (винт фиксирует абатмент к имплантату).&lt;/p&gt;\r\n&lt;p&gt;При поворачивании ключа 2,5ммд, который вставляется в шестигранник абатмента, поворачивается шестигранник имплантата. Движением по часовой стрелке мы закручиваем имплантат (вводим в кость) и против часовой – раскручиваем (выводим из кости). Позволяет при установке имплантата позиционировать шестигранник имплантата.&lt;/p&gt;','','прямой титановый замковый абатмент','Прямой титановый замковый абатмент','Прямой титановый замковый абатмент','грин, абатмент'),
	(124,1,'Анатомический титановый абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый анатомический абатмент.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Прямой стандартный абатмент с уступом, уступ диаметром 4.6мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/anatomicheskii-titanovyi-abatment-mod.jpg&quot; alt=&quot;анатомический титановый абатмент&quot; title=&quot;анатомический титановый абатмент&quot; /&gt;','','анатомический титановый абатмент','Анатомический титановый абатмент','Анатомический титановый абатмент','грин, абатмент'),
	(125,1,'Тинановый эстетический анатомический абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый эстетический анатомический абатмент.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент с покрытием желтого цвета и уступом, уступ диаметром 4.6мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyi-esteticheskii-anatomicheskii-abatment-mod.jpg&quot; alt=&quot;тинановый эстетический анатомический абатмент&quot; title=&quot;тинановый эстетический анатомический абатмент&quot; /&gt;','','тинановый эстетический анатомический абатмент','Тинановый эстетический анатомический абатмент','Тинановый эстетический анатомический абатмент','грин, абатмент'),
	(126,1,'Угловой анатомический титановый абатмент 15°','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Анатомический Титановый Абатмент 15°.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой абатмент 15° с уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-15-mod.jpg&quot; alt=&quot;угловой анатомический титановый абатмент 15 градусов&quot; title=&quot;угловой анатомический титановый абатмент 15 градусов&quot; /&gt;','','угловой анатомический титановый абатмент 15 градусов','Угловой анатомический титановый абатмент 15 градусов','Угловой анатомический титановый абатмент 15°','грин, абатмент'),
	(127,1,'Угловой анатомический титановый абатмент 25°','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Анатомический Титановый Абатмент 25°.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой абатмент 25° с уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-25-mod.jpg&quot; alt=&quot;угловой анатомический титановый абатмент 25 градусов&quot; title=&quot;угловой анатомический титановый абатмент 25 градусов&quot; /&gt;','','угловой анатомический титановый абатмент 25 градусов','Угловой анатомический титановый абатмент 25 градусов','Угловой анатомический титановый абатмент 25°','грин, абатмент'),
	(128,1,'Угловой анатомический титановый абатмент 15° с узкой платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой анатомический титановый абатмент 15° с узкой платформой.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой 15° абатмент, с анатомическим уступом, с шестигранником 2.1мм, с антиротационным элементом.\r\nИспользуется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.0ммд, 3.3ммд и имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 3,75ммд.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-15-s-uzkoi-platformoi-mod.jpg&quot; alt=&quot;угловой анатомический титановый абатмент 15° с узкой платформой&quot; title=&quot;угловой анатомический титановый абатмент 15° с узкой платформой&quot; /&gt;','','угловой анатомический титановый абатмент 15° с узкой платформой','Угловой анатомический титановый абатмент 15° с узкой платформой','Угловой анатомический титановый абатмент 15° с узкой платформой','грин, абатмент'),
	(129,1,'Угловой анатомический титановый абатмент 25° с узкой платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой анатомический титановый абатмент 25° с узкой платформой.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой 25° абатмент, с анатомическим уступом, с шестиграником 2.1мм, с антиротационным элементом.\r\nИспользуется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.0ммд,3.3ммд и имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 3,75ммд.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-25-s-uzkoi-platformoi-mod.jpg&quot; alt=&quot;угловой анатомический титановый абатмент 25° с узкой платформой&quot; title=&quot;угловой анатомический титановый абатмент 25° с узкой платформой&quot; /&gt;','','угловой анатомический титановый абатмент 25° с узкой платформой','Угловой анатомический титановый абатмент 25° с узкой платформой','Угловой анатомический титановый абатмент 25° с узкой платформой','грин, абатмент'),
	(130,1,'Угловой анатомический эстетический титановый абатмент 15°','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Анатомический Эстетический Титановый Абатмент 15°.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой абатмент 15° с покрытием нитрита титана желтого цвета и уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-anatomicheskii-esteticheskii-titanovyi-abatment-15-mod.jpg&quot; alt=&quot;угловой анатомический эстетический титановый абатмент 15°&quot; title=&quot;угловой анатомический эстетический титановый абатмент 15°&quot; /&gt;','','угловой анатомический эстетический титановый абатмент 15°','Угловой анатомический эстетический титановый абатмент 15°','Угловой анатомический эстетический титановый абатмент 15°','грин, абатмент'),
	(131,1,'Угловой анатомический эстетический титановый абатмент 25°','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Анатомический Эстетический Титановый Абатмент 25°.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой абатмент 25° с покрытием нитрита титана желтого цвета и уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-anatomicheskii-esteticheskii-titanovyi-abatment-25-mod.jpg&quot; alt=&quot;угловой анатомический эстетический титановый абатмент 25°&quot; title=&quot;угловой анатомический эстетический титановый абатмент 25°&quot; /&gt;','','угловой анатомический эстетический титановый абатмент 25°','Угловой анатомический эстетический титановый абатмент 25°','Угловой анатомический эстетический титановый абатмент 25°','грин, абатмент'),
	(132,1,'Циркониевый абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Циркониевый Абатмент.&lt;/strong&gt; Используется для цементной и винтовой фиксации протезной конструкции. Прямой абатмент с уступом, диаметр которого 4.5мм, с шестигранником 2.43мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 ммд.&lt;/p&gt;','','циркониевый абатмент','Циркониевый абатмент','Циркониевый абатмент','грин, абатмент'),
	(133,1,'Циркониевый широкий абатмент','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Циркониевый Широкий Абатмент.&lt;/strong&gt; Используется для цементной и винтовой фиксации протезной конструкции. Прямой абатмент с уступом, уступ высотой 2мм и диаметром 5.6мм, с шестигранником 2.43мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 ммд.&lt;/p&gt;','','циркониевый широкий абатмент','Циркониевый широкий абатмент','Циркониевый широкий абатмент','грин, абатмент'),
	(134,1,'Угловой циркониевый абатмент 15°','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Циркониевый Абатмент 15°.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой абатмент 15° с уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-tcirkonievyi-abatment-15-mod.jpg&quot; alt=&quot;угловой циркониевый абатмент 15°&quot; title=&quot;угловой циркониевый абатмент 15°&quot; /&gt;','','угловой циркониевый абатмент 15°','Угловой циркониевый абатмент 15°','Угловой циркониевый абатмент 15°','грин, абатмент'),
	(135,1,'Угловой циркониевый абатмент 25°','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Циркониевый Абатмент 25°.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой абатмент 25° с уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal/&quot;&gt;Универсал&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic/&quot;&gt;Классик&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respeсt/&quot;&gt;Респект&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-tcirkonievyi-abatment-25-mod.jpg&quot; alt=&quot;угловой циркониевый абатмент 25°&quot; title=&quot;угловой циркониевый абатмент 25°&quot; /&gt;','','угловой циркониевый абатмент 25°','Угловой циркониевый абатмент 25°','Угловой циркониевый абатмент 25°','грин, абатмент'),
	(136,1,'Титановый абатмент с шаровым атачментом','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Абатмент с шаровым атачментом.&lt;/strong&gt; Тело абатмента цилиндрической формы, в коронарной части имеется шаровой атачмент диаметром 2,5ммд, в нижней части имеется винт, который вкручивается во внутренний винт имплантата при помощи шестигранного ключа 1,25ммд. Используется вместе с шестиграным ключом 1,25ммд и шестигранным ключом 1,25ммд для углового наконечника. Используется совместно с нейлоновым+металическим, металическим или нейлоновым кол­пачком, которые, в свою очередь, устанавливаются в съемный протез и таким образом улучшают устой­чивость постоянного или временного съемного протеза. Шаровой аттачмент может служить основанием как для вре­менного протеза, так и для постоянного протеза.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyi-abatment-s-sharovym-atachmentom-mod.jpg&quot; alt=&quot;титановый абатмент с шаровым атачментом&quot; title=&quot;титановый абатмент с шаровым атачментом&quot; /&gt;','','титановый абатмент с шаровым атачментом','Титановый абатмент с шаровым атачментом','Титановый абатмент с шаровым атачментом','грин, абатмент'),
	(137,1,'Натуральный костный материал Alpha-Bio`s GRAFT','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Натуральный (бычий) костный материал Alpha-Bio\'s GRAFT&lt;/strong&gt; - высоконадежный и размерно-стабильный очищенный имплантационный материал. По минеральному составу, трехмерной структуре, а также физико-химическим и биологическим свойствам натуральный (бычий) костный материал очень схож со структурой человеческой кости. Уникальный производственный процесс заключается в нагревании при высоких температурах. Благодаря этому исчезают все органические компоненты, что предотвращает потенциальные иммунобиологические реакции, в результате чего натуральный бычий костный материал Alpha-Bio\'s GRAFT на 100% защищен от коровьего бешенства и является 100% беспротеиновой структурой.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;3225 | малый 0.5-1.0 мм | состав 1x0.5 cc (мл)&lt;/li&gt;\r\n&lt;li&gt;3236 | малый 0.5-1.0 мм | состав 1x1.0 cc (мл)&lt;/li&gt;\r\n&lt;li&gt;3206 | малый 0.5-1.0 мм | состав 1x5.0 cc (мл)&lt;/li&gt;\r\n&lt;/ul&gt;','','натуральный костный материал, бычий костный материал','Натуральный костный материал GRAFT производства Alpha-Bio','Натуральный костный материал Alpha-Bio`s GRAFT',''),
	(138,1,'Титановые стандартные винтовые абатменты-коннекторы','&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovye-standartnye-vintovye-abatmenty-konnektory-mod.png&quot; alt=&quot;стандартные винтовые абатменты-коннекторы&quot; title=&quot;стандартные винтовые абатменты-коннекторы&quot; /&gt;','','стандартные винтовые абатменты-коннекторы','Титановые стандартные винтовые абатменты-коннекторы','Титановые стандартные винтовые абатменты-коннекторы','грин, абатмент'),
	(139,1,'Титановые эстетические винтовые абатменты-коннекторы','&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovye-esteticheskie-vintovye-abatmenty-konnektory-mod.png&quot; alt=&quot;эстетические винтовые абатменты-коннекторы&quot; title=&quot;эстетические винтовые абатменты-коннекторы&quot; /&gt;','','эстетические винтовые абатменты-коннекторы','Титановые эстетические винтовые абатменты-коннекторы','Титановые эстетические винтовые абатменты-коннекторы','грин, абатмент'),
	(140,1,'Титановые эстетические замковые абатменты-коннекторы','&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovye-esteticheskie-zamkovye-abatmenty-konnektory-mod.png&quot; alt=&quot;эстетические замковые абатменты-коннекторы&quot; title=&quot;эстетические замковые абатменты-коннекторы&quot; /&gt;','','эстетические замковые абатменты-коннекторы','Титановые эстетические замковые абатменты-коннекторы','Титановые эстетические замковые абатменты-коннекторы','грин, абатмент'),
	(141,1,'Угловой титановый адаптор 17°','&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-titanovyi-adaptor-17-mod.png&quot; alt=&quot;угловой титановый адаптор 17 градусов&quot; title=&quot;угловой титановый адаптор 17 градусов&quot; /&gt;','','угловой титановый адаптор 17 градусов','Угловой титановый адаптор 17 градусов','Угловой титановый адаптор 17°','грин, абатмент'),
	(142,1,'Угловой титановый адаптор 30°','&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-titanovyi-adaptor-30-mod.png&quot; alt=&quot;угловой титановый адаптор 30 градусов&quot; title=&quot;угловой титановый адаптор 30 градусов&quot; /&gt;','','угловой титановый адаптор 30 градусов','Угловой титановый адаптор 30 градусов','Угловой титановый адаптор 30°','грин, абатмент'),
	(143,1,'Титановый винт для абатмента','&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyi-vint-dlia-abatmenta-mod.jpg&quot; alt=&quot;титановый винт для абатмента&quot; title=&quot;титановый винт для абатмента&quot; /&gt;','','титановый винт для абатмента','Титановый винт для абатмента','Титановый винт для абатмента','грин, абатмент'),
	(144,1,'Титановый синий винт для абатмента','&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyi-sinii-vint-dlia-abatmenta-mod.jpg&quot; alt=&quot;титановый синий винт для абатмента&quot; title=&quot;титановый синий винт для абатмента&quot; /&gt;','','титановый синий винт для абатмента','Титановый синий винт для абатмента','Титановый синий винт для абатмента','грин, абатмент'),
	(145,1,'Резорбируемая мембрана Hypro-Sorb','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Hypro-Sorb M&lt;/strong&gt; является двухфазной, биологически рассасывающейся, мягкой пористой мембраной для направленной тканевой и костной регенерации с гемостатическим воздействием. Является также весьма эффективно действующим кровостанавливающим (гемостатическим) средством. Материал не вызывает аллергии, хорошо поглощается тканями и способствует процессу заживления, полностью биологически рассасывается в срок до 6 месяцев.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Резорбируемая мембрана Hypro-Sorb M&lt;/strong&gt; является результатом многолетнего опыта и интенсивного научно-исследовательского сотрудничества сотрудников фирм Hypro Otrokovice, s.r.o и Cardiophil Ltd. Hypro-Sorb M – это ателоколлаген типа который сохраняет стерильность в течение 5 лет и после пересадки полностью рассасывается в живой ткани.&lt;/p&gt;\r\n&lt;h2&gt;Характеристики&lt;/h2&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Страна производитель: Чехия&lt;/li&gt;\r\n&lt;li&gt;Двухфазная биорасасывающаяся мембрана для направленной тканевой и костной регенерации&lt;/li&gt;\r\n&lt;li&gt;Это ателоколлаген из бычьих сухожилий 1-го типа, неперекрещивающаяся связанная мембрана, подготовленная особым методом, очищенная и подверженная химическим преобразованиям с применением собственной технологии компании&lt;/li&gt;\r\n&lt;li&gt;Материал является биосовместимым, апирогенным, он стерилен в течение 5 лет и полностью растворяется в живых тканях после имплантации&lt;/li&gt;\r\n&lt;li&gt;Обладает хорошим кровоостанавливающим эффектом&lt;/li&gt;\r\n&lt;li&gt;Хорошо приживается в тканях&lt;/li&gt;\r\n&lt;li&gt;Материал не вызывает аллергии, хорошо поглощается тканями и способствует процессу заживления&lt;/li&gt;\r\n&lt;li&gt;Полностью рассасывается в течение 6 месяцев&lt;/li&gt;\r\n&lt;li&gt;Оказывает специфическое действие на тромбоциты и вырабатывает факторы коагуляции, которые вместе с факторами связывания плазмы обеспечивают протекание фиброгенезиса. Примеры других взаимодействий с тканями замедление коллагенолитической активности в области экскреции пораженных участков, поддержание грануляции, эпителизации, способствует заживлению мягких тканей и направленной тканевой регенерации (НТР)&lt;/li&gt;\r\n&lt;li&gt;Также является отличным агентом для направленной костной регенерации (НКР), что возможно благодаря его активному высвобождению факторов роста (ТФР и ТРФ) из высококонцентрированных тромбоцитов. ТФР и ТРФ являются естественным пептидами, ответственными за инициализацию роста клеток и костную регенерацию&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;!--noindex--&gt;\r\n&lt;p&gt;Подробнее, о применении мембраны вы можете ознакомиться в статье: &lt;a rel=&quot;nofollow&quot; href=&quot;http://abirplus.ru/files/ABIR_56-59_DIH_1_12.pdf&quot; onclick=&quot;return !window.open(this.href)&quot;&gt;Hypro-Sorb M биорассасывающаяся двухфазная ателоколлагеновая мембрана&lt;/a&gt;&lt;/p&gt;\r\n&lt;!--/noindex--&gt;','','резорбируемая мембрана','Резорбируемая мембрана Hypro-Sorb','Резорбируемая мембрана Hypro-Sorb',''),
	(146,1,'Шовный хирургический материал','&lt;p&gt;Шовный материал Полиамид, 25 шт.&lt;/p&gt;','','шовный материал, полиамид','Шовный хирургический материал','Шовный хирургический материал',''),
	(147,1,'Титановый абатмент плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый Абатмент PLUS.&lt;/strong&gt; Используется для цементной и винтовой фиксации протезной конструкции. Прямой стандартный абатмент без уступа, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyi-abatment-plus-mod.jpg&quot; alt=&quot;титановый абатмент плюс&quot; title=&quot;титановый абатмент плюс&quot; /&gt;','','титановый абатмент плюс','Титановый абатмент плюс','Титановый абатмент плюс','грин, абатмент+'),
	(148,1,'Титановый абатмент плюс с узкой платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый абатмент PLUS с узкой платформой.&lt;/strong&gt; Используется для цементной и винтовой фиксации протезной конструкции. Прямой стандартный абатмент, без уступа, с шестиграником 2.1мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; 3.75ммд, &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; 3.75ммд и 4.2ммд, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; 3.75ммд.&lt;/p&gt;','','титановый абатмент плюс с узкой платформой','Титановый абатмент плюс с узкой платформой','Титановый абатмент плюс с узкой платформой','грин, абатмент+'),
	(149,1,'Временный абатмент для композита плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый Временный Абатмент PLUS для композита.&lt;/strong&gt; Используется для винтовой фиксации временной протезной конструкции. Прямой стандартный абатмент с уступом, уступ высотой 1мм и диаметром 4.5мм, круговыми ретенционными борозками для ретенции композита, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;','','временный абатмент для композита плюс','Временный абатмент для композита плюс','Временный абатмент для композита плюс','грин, абатмент+'),
	(150,1,'Угловой титановый абатмент 15° плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Титановый Абатмент 15° PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой стандартный абатмент 15° без уступа, с диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-titanovyi-abatment-15-plus-mod.jpg&quot; alt=&quot;&quot; title=&quot;&quot; /&gt;','','угловой титановый абатмент 15 градусов плюс','Угловой титановый абатмент 15 градусов плюс','Угловой титановый абатмент 15° плюс','грин, абатмент+'),
	(151,1,'Угловой титановый абатмент 25° плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Титановый Абатмент 25° PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой стандартный абатмент 25°, без уступа, высотой 8мм и диаметром 4.7мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;','','угловой титановый абатмент 25 градусов плюс','Угловой титановый абатмент 25 градусов плюс','Угловой титановый абатмент 25° плюс','грин, абатмент+'),
	(152,1,'Угловой титановый абатмент 15° плюс (с узкой платформой)','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой титановый абатмент 15° PLUS с узкой платформой.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой 15° стандартный абатмент, без уступа, с шестиграником 2.1мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; 3.75ммд, &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; 3.75ммд и 4.2ммд, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; 3.75ммд.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-titanovyi-abatment-15-plus-s-uzkoi-platformoi-mod.jpg&quot; alt=&quot;угловой титановый абатмент 15 градусов плюс с узкой платформой&quot; title=&quot;угловой титановый абатмент 15 градусов плюс с узкой платформой&quot; /&gt;','','угловой титановый абатмент 15 градусов плюс с узкой платформой','Угловой титановый абатмент 15 градусов плюс (с узкой платформой)','Угловой титановый абатмент 15° плюс (с узкой платформой)','грин, абатмент+'),
	(153,1,'Угловой титановый абатмент 25° плюс (с узкой платформой)','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой титановый абатмент 25° с узкой платформой PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой 25° стандартный абатмент, без уступа, с шестиграником 2.1мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; 3.75ммд, &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; 3.75ммд и 4.2ммд, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; 3.75ммд.&lt;/p&gt;','','угловой титановый абатмент 25 градусов плюс с узкой платформой','Угловой титановый абатмент 25 градусов плюс (с узкой платформой)','Угловой титановый абатмент 25° плюс (с узкой платформой)','грин, абатмент+'),
	(154,1,'Прямой титановый абатмент для фрезеровки плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Прямой титановый Абатмент PLUS для фрезеровки.&lt;/strong&gt; Используется для цементной и винтовой фиксации протезной конструкции. Прямой цилиндрический абатмент для изготовления индивидуального абатмента, без уступа, диаметром 3.9ммд и высотой 13мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/priamoi-titanovyi-abatment-dlia-frezerovki-plus-mod.jpg&quot; alt=&quot;прямой титановый абатмент для фрезеровки плюс&quot; title=&quot;прямой титановый абатмент для фрезеровки плюс&quot; /&gt;','','прямой титановый абатмент для фрезеровки плюс','Прямой титановый абатмент для фрезеровки плюс','Прямой титановый абатмент для фрезеровки плюс','грин, абатмент+'),
	(155,1,'Титановый абатмент с узкой платформой для фрезеровки плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый абатмент PLUS с узкой платформой для фрезеровки.&lt;/strong&gt; Используется для цементной и винтовой фиксации протезной конструкции. Прямой цилиндрический абатмент для изготовления индивидуального абатмента, без уступа, диаметром 4.5ммд и высотой 13мм, с шестигранником 2.1мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; 3.75ммд, &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; 3.75ммд и 4.2ммд, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; 3.75ммд.&lt;/p&gt;','','титановый абатмент с узкой платформой для фрезеровки плюс','Титановый абатмент с узкой платформой для фрезеровки плюс','Титановый абатмент с узкой платформой для фрезеровки плюс','грин, абатмент+'),
	(156,1,'Угловой титановый абатмент 25° для фрезеровки плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Универсальный Угловой Титановый Абатмент 25° PLUS для фрезеровки.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой универсальный абатмент 25° без уступа для изготовления индивидуального углового абатмента, высотой 13мм и диаметром 4.7мм, со смещенным шестигранником 2.43мм на 30 градусов, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;','','угловой абатмент 25 градусов для фрезеровки плюс','Угловой титановый абатмент 25 градусов для фрезеровки плюс','Угловой титановый абатмент 25° для фрезеровки плюс','грин, абатмент+'),
	(157,1,'Универсальный угловой титановый абатмент 15° для фрезеровки плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Универсальный Угловой Титановый Абатмент 15° PLUS для фрезеровки.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой универсальный абатмент 15° без уступа для изготовления индивидуального углового абатмента, высотой 13мм и диаметром 4.5мм,со смещенным шестигранником 2.43мм на 30 градусов , с анти ротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/universalnyi-uglovoi-abatment-15-dlia-frezerovki-plus-mod.jpg&quot; alt=&quot;универсальный угловой абатмент 15 градусов для фрезеровки плюс&quot; title=&quot;универсальный угловой абатмент 15 градусов для фрезеровки плюс&quot; /&gt;','','универсальный угловой абатмент 15 градусов для фрезеровки плюс','Универсальный угловой титановый абатмент 15 градусов для фрезеровки плюс','Универсальный угловой титановый абатмент 15° для фрезеровки плюс','грин, абатмент+'),
	(158,1,'Пластиковый абатмент для литья плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Пластиковый абатмент для литья PLUS.&lt;/strong&gt; Используется для отливки индивидуальных абатментов цементной и винтовой фиксации протезной конструкции.\r\nПрямой цилиндрический абатмент для изготовления индивидуального абатмента с уступом, высота которого 8.5мм, с шестигранником 2.43мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;','','пластиковый абатмент для литья плюс','Пластиковый абатмент для литья плюс','Пластиковый абатмент для литья плюс','грин, абатмент+'),
	(159,1,'Пластиковый абатмент с нормальной платформой плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Пластиковый абатмент с нормальной платформой PLUS.&lt;/strong&gt; Используется для отливки индивидуальных абатментов цементной и винтовой фиксации протезной конструкции. Прямой цилиндрический абатмент для изготовления индивидуального абатмента без уступа, высотой 13мм, с шестигранником 2.43мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;','','пластиковый абатмент с нормальной платформой плюс','Пластиковый абатмент с нормальной платформой плюс','Пластиковый абатмент с нормальной платформой плюс','грин, абатмент+'),
	(160,1,'Пластиковый абатмент с узкой платформой плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Пластиковый абатмент PLUS с узкой платформой для литья.&lt;/strong&gt; Используется для отливки индивидуальных абатментов цементной и винтовой фиксации протезной конструкции. Прямой цилиндрический абатмент для изготовления индивидуального абатмента, без уступа, диаметром 3.0ммд и высотой 9мм, с шестигранником 2.1мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; 3.75ммд, &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; 3.75ммд и 4.2ммд, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; 3.75ммд.&lt;/p&gt;','','пластиковый абатмент с узкой платформой плюс','Пластиковый абатмент с узкой платформой плюс','Пластиковый абатмент с узкой платформой плюс','грин, абатмент+'),
	(161,1,'Пластиковый абатмент с титановым базисом плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Пластиковый абатмент PLUS с титановым базисом для литья.&lt;/strong&gt; Используется для отливки индивидуальных абатментов цементной и винтовой фиксации протезной конструкции. Титановый базис прямой цилиндрической формы с уступом 1.5мм высотой, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems. На титановый базис присоединяется пластиковый полый цилиндр, из которого отливается вместе с титановым базисом индивидуальный абатмент.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;','','пластиковый абатмент с титановым базисом плюс','Пластиковый абатмент с титановым базисом плюс','Пластиковый абатмент с титановым базисом плюс','грин, абатмент+'),
	(162,1,'Угловой пластиковый абатмент 15° плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Пластиковый Абатмент 15° для литья.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой пластиковый абатмент 15° без уступа для изготовления индивидуального абатмента , высотой 8мм и диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 3.75мм, 4.2мм, 5.0мм, 6.0 мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 3.3мм, 3.75мм, 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0 мм.&lt;/p&gt;','','угловой пластиковый абатмент 15 градусов плюс','Угловой пластиковый абатмент 15 градусов плюс','Угловой пластиковый абатмент 15° плюс','грин, абатмент+'),
	(163,1,'Винтовой титановый абатмент для одномоментной нагрузки плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый винтовой абатмент PLUS для одномоментной нагрузки.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный винтовой абатмент с уступом, уступ диаметром 4.7мм, без антиротационного элемента.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/vintovoi-titanovyi-abatment-dlia-odnomomentnoi-nagruzki-plus-mod.jpg&quot; alt=&quot;винтовой титановый абатмент для одномоментной нагрузки плюс&quot; title=&quot;винтовой титановый абатмент для одномоментной нагрузки плюс&quot; /&gt;','','винтовой титановый абатмент для одномоментной нагрузки плюс','Винтовой титановый абатмент для одномоментной нагрузки плюс','Винтовой титановый абатмент для одномоментной нагрузки плюс','грин, абатмент+'),
	(164,1,'Угловой титановый абатмент 15° для одномоментной нагрузки плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Титановый Абатмент 15° PLUS для одномоментной нагрузки.&lt;/strong&gt; Используется для цементной фиксации временной протезной конструкции на хирургическом этапе и постоянной протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Угловой абатмент 15° с суженной шейкой и уступом, диаметр которого 4.7мм, со специальным дополнительным соединением multi-lock systems, с шестигранником 2.43мм, с антиротационным элементом, дополнительным шестигранником 2.1мм на теле абатмента.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoj-titanovyj-abatment-15-dlja-odnomomentnoj-nagruzki-plus-mod.jpg&quot; alt=&quot;угловой абатмент 15 градусов для одномоментной нагрузки плюс&quot; title=&quot;угловой абатмент 15 градусов для одномоментной нагрузки плюс&quot; /&gt;','','угловой абатмент 15 градусов для одномоментной нагрузки плюс','Угловой абатмент 15 градусов для одномоментной нагрузки плюс','Угловой титановый абатмент 15° для одномоментной нагрузки плюс','грин, абатмент+'),
	(165,1,'Угловой титановый абатмент 25° для одномоментной нагрузки плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Титановый Абатмент 25° PLUS для одномоментной нагрузки.&lt;/strong&gt; Используется для цементной фиксации временной протезной конструкции на хирургическом этапе и постоянной протезной конструкции.&lt;/p&gt;\r\n&lt;p&gt;Угловой абатмент 25° с суженной шейкой и уступом, диаметр которого 4.7мм, со специальным дополнительным соединением multi-lock systems, с шестигранником 2.43мм, с антиротационным элементом, дополнительным шестигранником 2.1мм на теле абатмента.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoj-titanovyj-abatment-25-dlja-odnomomentnoj-nagruzki-plus-mod.jpg&quot; alt=&quot;угловой абатмент 25 градусов для одномоментной нагрузки плюс&quot; title=&quot;угловой абатмент 25 градусов для одномоментной нагрузки плюс&quot; /&gt;','','угловой абатмент 25 градусов для одномоментной нагрузки плюс','Угловой титановый абатмент 25 градусов для одномоментной нагрузки плюс','Угловой титановый абатмент 25° для одномоментной нагрузки плюс','грин, абатмент+'),
	(166,1,'Титановый абатмент плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый абатмент PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент, с уступом, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyj-abatment-plus-mod.jpg&quot; alt=&quot;титановый абатмент плюс&quot; title=&quot;титановый абатмент плюс&quot; /&gt;','','титановый абатмент плюс','Титановый абатмент плюс','Титановый абатмент плюс','грин, абатмент+'),
	(167,1,'Широкий титановый абатмент плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый широкий абатмент PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент с уступом, уступ диаметром 5.6мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;','','широкий титановый абатмент плюс','Широкий титановый абатмент плюс','Широкий титановый абатмент плюс','грин, абатмент+'),
	(168,1,'Титановый абатмент с узкой платформой плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый абатмент с узкой платформой PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент, с уступом, с шестигранником 2.1мм, с антиротационным элементом.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; 3.75ммд, &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; 3.75ммд и 4.2ммд, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; 3.75ммд.&lt;/p&gt;','','титановый абатмент с узкой платформой плюс','Титановый абатмент с узкой платформой плюс','Титановый абатмент с узкой платформой плюс','грин, абатмент+'),
	(121,1,'Титановый эстетический абатмент плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый эстетический абатмент PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент с покрытием желтого цвета и уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyj-ehsteticheskij-abatment-plus-mod.jpg&quot; alt=&quot;титановый эстетический абатмент плюс&quot; title=&quot;титановый эстетический абатмент плюс&quot; /&gt;','','титановый эстетический абатмент плюс','Титановый эстетический абатмент плюс','Титановый эстетический абатмент плюс','грин, абатмент+'),
	(170,1,'Титановый широкий эстетический абатмент плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый широкий эстетический абатмент PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент с покрытием желтого цвета и уступом, уступ диаметром 5.6мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyj-shirokij-ehsteticheskij-abatment-plus-mod.jpg&quot; alt=&quot;титановый широкий эстетический абатмент плюс&quot; title=&quot;титановый широкий эстетический абатмент плюс&quot; /&gt;','','титановый широкий эстетический абатмент плюс','Титановый широкий эстетический абатмент плюс','Титановый широкий эстетический абатмент плюс','грин, абатмент+'),
	(171,1,'Анатомический титановый абатмент плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый Анатомический Абатмент PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент с уступом, уступ диаметром 4.6мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/anatomicheskii-titanovyi-abatment-plus-mod.jpg&quot; alt=&quot;анатомический титановый абатмент плюс&quot; title=&quot;анатомический титановый абатмент плюс&quot; /&gt;','','анатомический титановый абатмент плюс','Анатомический титановый абатмент плюс','Анатомический титановый абатмент плюс','грин, абатмент+'),
	(172,1,'Тинановый эстетический анатомический абатмент плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый эстетический анатомический абатмент плюс.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Прямой стандартный абатмент с покрытием желтого цвета и уступом, уступ диаметром 4.6мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovyi-esteticheskii-anatomicheskii-abatment-plus-mod.jpg&quot; alt=&quot;тинановый эстетический анатомический абатмент плюс&quot; title=&quot;тинановый эстетический анатомический абатмент плюс&quot; /&gt;','','тинановый эстетический анатомический абатмент плюс','Тинановый эстетический анатомический абатмент плюс','Тинановый эстетический анатомический абатмент плюс','грин, абатмент+'),
	(173,1,'Угловой анатомический титановый абатмент 15° плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Анатомический Титановый Абатмент 15° PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой абатмент 15° с уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-15-plus-mod.jpg&quot; alt=&quot;угловой анатомический титановый абатмент 15 градусов плюс&quot; title=&quot;угловой анатомический титановый абатмент 15 градусов плюс&quot; /&gt;','','угловой анатомический титановый абатмент 15 градусов плюс','Угловой анатомический титановый абатмент 15 градусов плюс','Угловой анатомический титановый абатмент 15° плюс','грин, абатмент+'),
	(174,1,'Угловой анатомический титановый абатмент 25° плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Анатомический Титановый Абатмент 25° PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой абатмент 25° с уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-25-mod-plus.jpg&quot; alt=&quot;угловой анатомический титановый абатмент 25 градусов плюс&quot; title=&quot;угловой анатомический титановый абатмент 25 градусов плюс&quot; /&gt;','','угловой анатомический титановый абатмент 25 градусов плюс','Угловой анатомический титановый абатмент 25 градусов плюс','Угловой анатомический титановый абатмент 25° плюс','грин, абатмент+'),
	(175,1,'Угловой анатомический титановый абатмент 15° с узкой платформой плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой анатомический титановый абатмент 15° PLUS с узкой платформой.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой 15° абатмент, с анатомическим уступом, с шестиграником 2.1мм, с антиротационным элементом.\r\nПрямой стандартный абатмент, с уступом, с шестигранником 2.1мм, с антиротационным элементом. Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; 3.75ммд, &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; 3.75ммд и 4.2ммд, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; 3.75ммд.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-15-s-uzkoi-platformoi-plus-mod.jpg&quot; alt=&quot;угловой анатомический титановый абатмент 15° с узкой платформой плюс&quot; title=&quot;угловой анатомический титановый абатмент 15° с узкой платформой плюс&quot; /&gt;','','угловой анатомический титановый абатмент 15° с узкой платформой плюс','Угловой анатомический титановый абатмент 15° с узкой платформой плюс','Угловой анатомический титановый абатмент 15° с узкой платформой плюс','грин, абатмент+'),
	(176,1,'Угловой анатомический титановый абатмент 25° с узкой платформой плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой анатомический титановый абатмент 25° PLUS с узкой платформой.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции.\r\nУгловой 25° абатмент, с анатомическим уступом, с шестиграником 2.1мм, с антиротационным элементом. Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; 3.75ммд, &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; 3.75ммд и 4.2ммд, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; 3.75ммд.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-anatomicheskii-titanovyi-abatment-25-s-uzkoi-platformoi-plus-mod.jpg&quot; alt=&quot;угловой анатомический титановый абатмент 25° с узкой платформой плюс&quot; title=&quot;угловой анатомический титановый абатмент 25° с узкой платформой плюс&quot; /&gt;','','угловой анатомический титановый абатмент 25° с узкой платформой плюс','Угловой анатомический титановый абатмент 25° с узкой платформой плюс','Угловой анатомический титановый абатмент 25° с узкой платформой плюс','грин, абатмент+'),
	(177,1,'Угловой анатомический эстетический титановый абатмент 15° плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Анатомический Эстетический Титановый Абатмент 15° PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой абатмент 15° с покрытием нитрита титана желтого цвета и уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems. Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-anatomicheskii-esteticheskii-titanovyi-abatment-15-plus-mod.jpg&quot; alt=&quot;угловой анатомический эстетический титановый абатмент 15° плюс&quot; title=&quot;угловой анатомический эстетический титановый абатмент 15° плюс&quot; /&gt;','','угловой анатомический эстетический титановый абатмент 15° плюс','Угловой анатомический эстетический титановый абатмент 15° плюс','Угловой анатомический эстетический титановый абатмент 15° плюс','грин, абатмент+'),
	(178,1,'Угловой анатомический эстетический титановый абатмент 25° плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Угловой Анатомический Эстетический Титановый Абатмент 25° PLUS.&lt;/strong&gt; Используется для цементной фиксации протезной конструкции. Угловой абатмент 25° с покрытием нитрита титана желтого цвета и уступом, уступ диаметром 4.5мм, с шестигранником 2.43мм, с антиротационным элементом, со специальным дополнительным соединением multi-lock systems. Используется вместе с имплантатами &lt;a href=&quot;/titanovyi-implantat-universal-plus/&quot;&gt;Универсал Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, &lt;a href=&quot;/titanovyi-implantat-classic-plus/&quot;&gt;Классик Плюс&lt;/a&gt; диаметром 4.2мм, 5.0мм, 6.0мм, имплантатами &lt;a href=&quot;/titanovyi-implantat-respect-plus/&quot;&gt;Респект Плюс&lt;/a&gt; диаметром 5.0мм, 6.0 мм.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-anatomicheskii-esteticheskii-titanovyi-abatment-25-plus-mod.jpg&quot; alt=&quot;угловой анатомический эстетический титановый абатмент 25° плюс&quot; title=&quot;угловой анатомический эстетический титановый абатмент 25° плюс&quot; /&gt;','','угловой анатомический эстетический титановый абатмент 25° плюс','Угловой анатомический эстетический титановый абатмент 25° плюс','Угловой анатомический эстетический титановый абатмент 25° плюс','грин, абатмент+'),
	(179,1,'Титановые эстетические замковые абатменты-коннекторы плюс','&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovye-esteticheskie-zamkovye-abatmenty-konnektory-plus-mod.jpg&quot; alt=&quot;эстетические замковые абатменты-коннекторы плюс&quot; title=&quot;эстетические замковые абатменты-коннекторы плюс&quot; /&gt;','','эстетические замковые абатменты-коннекторы плюс','Титановые эстетические замковые абатменты-коннекторы плюс','Титановые эстетические замковые абатменты-коннекторы плюс','грин, абатмент+'),
	(180,1,'Титановые стандартные винтовые абатменты-коннекторы плюс','&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovye-standartnye-vintovye-abatmenty-konnektory-plus-mod.jpg&quot; alt=&quot;стандартные винтовые абатменты-коннекторы плюс&quot; title=&quot;стандартные винтовые абатменты-коннекторы плюс&quot; /&gt;','','стандартные винтовые абатменты-коннекторы плюс','Титановые стандартные винтовые абатменты-коннекторы плюс','Титановые стандартные винтовые абатменты-коннекторы плюс','грин, абатмент+'),
	(181,1,'Титановые эстетические винтовые абатменты-коннекторы плюс','&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/titanovye-esteticheskie-vintovye-abatmenty-konnektory-plus-mod.jpg&quot; alt=&quot;эстетические винтовые абатменты-коннекторы плюс&quot; title=&quot;эстетические винтовые абатменты-коннекторы плюс&quot; /&gt;','','эстетические винтовые абатменты-коннекторы плюс','Титановые эстетические винтовые абатменты-коннекторы плюс','Титановые эстетические винтовые абатменты-коннекторы плюс','грин, абатмент+'),
	(182,1,'Угловой титановый адаптор 17° плюс','&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-titanovyi-adaptor-17-plus-mod.jpg&quot; alt=&quot;угловой титановый адаптор 17 градусов плюс&quot; title=&quot;угловой титановый адаптор 17 градусов плюс&quot; /&gt;','','угловой титановый адаптор 17 градусов плюс','Угловой титановый адаптор 17 градусов плюс','Угловой титановый адаптор 17° плюс','грин, абатмент+'),
	(183,1,'Угловой титановый адаптор 30° плюс','&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/uglovoi-titanovyi-adaptor-30-plus-mod.jpg&quot; alt=&quot;угловой титановый адаптор 30 градусов плюс&quot; title=&quot;угловой титановый адаптор 30 градусов плюс&quot; /&gt;','','угловой титановый адаптор 30 градусов плюс','Угловой титановый адаптор 30 градусов плюс','Угловой титановый адаптор 30° плюс','грин, абатмент+'),
	(184,1,'Односторонний ключ &quot;Ратчет&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Односторонний ключ &quot;Ратчет&quot;.&lt;/strong&gt; С универсальной шестигранной головкой 6,35мм и дополнительной насадкой квадратом 2.1мм. Имеет обратный свободный ход, противоположный направлению закручивания. Предназначен для вкручивания и раскручивания имплантатов и винтов. Ключ универсальный – используется во всех отделах верхней и нижней челюсти. Изготовлен из нержавеющей стали.&lt;/p&gt;','','односторонний ключ ратчет','Односторонний ключ &quot;Ратчет&quot;','Односторонний ключ &quot;Ратчет&quot;','грин, инструменты'),
	(185,1,'Ключ для дозированного определенной силой вкручивания винтов','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Ключ &quot;Ратчет&quot; универсальный.&lt;/strong&gt; Ключ для дозированного определенной силой вкручивания винтов. С универсальной шестигранной головкой 6,35мм и дополнительной насадкой квадратом 2.1мм. На теле ключа имеется шкала, показывающая  силу закручивания в Ncm2. На конце рукоятки имеется винт, которым регулируется  сила закручивания. При достижении установленной силы закручивания рукоятка данного ключа как бы ломается по отношению к головке данного ключа, и далее вкручивание нет необходимости проводить. Предназначен для вкручивания и раскручивания имплантатов и винтов. Ключ универсальный – используется во всех отделах верхней и нижней челюсти. \r\nИзготовлен из нержавеющей стали.&lt;/p&gt;','','ключ ратчет универсальный','Ключ для дозированного определенной силой вкручивания винтов','Ключ для дозированного определенной силой вкручивания винтов','грин, инструменты'),
	(186,1,'Хирургический ключ','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Хирургический ключ.&lt;/strong&gt; Прямая отвертка с буксой. С универсальной шестигранной головкой 6,35мм и длинной утолщенной рукояткой. Предназначен для вкручивания и раскручивания имплантатов и винтов. Используется в основном на верхней челюсти и в некоторых случаях в переднем отделе нижней челюсти. Изготовлен из нержавеющей стали.&lt;/p&gt;','','хирургический ключ','Хирургический ключ','Хирургический ключ','грин, инструменты'),
	(187,1,'Молоток хирургический','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Молоток хирургический.&lt;/strong&gt; Используется при хирургических вмешательствах. Изготовлен из нержавеющей стали.&lt;/p&gt;','','молоток хирургический','Молоток хирургический','Молоток хирургический','грин, инструменты'),
	(188,1,'Измеритель глубины костного ложа имплан­татов','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Измеритель глубины костного ложа имплан­татов.&lt;/strong&gt; Рукоятка с двухсторонней рабочей частью. На рабочей части имеются насечки,которые показывают глубину сверления костного ложа имплантата. На конце рабочей части имется полушар. На одной стороне его диаметр 1.9мм, на другой 2.7мм.&lt;/p&gt;\r\n&lt;p&gt;Использование данного измерителя дает возможность упростить исследование стенок и дна препарированного костного ложа имплантата, определить наличие перфорации стеннок и дна костного ложа, определить целостность слизистой гайморовой пазухи, измерить высоту альвеолярного гребня до дна гайморовой и носовой пазух на верхней челюcти и ментального отверстия на нижней челюсти, провести необходимые измерения во время операции и выбрать тактику дальнейших действий.\r\nИзготовлен из нержавеющей стали.&lt;/p&gt;','','измеритель глубины костного ложа имплан­татов','Измеритель глубины костного ложа имплан­татов','Измеритель глубины костного ложа имплан­татов','грин, инструменты'),
	(189,1,'Измеритель десневого края','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Измеритель десневого края&lt;/strong&gt; – это рукоятка с двухсторонней рабочей частью. Изготовлен из нержавеющей стали. На рабочей части имеются насечки, которые показывает глубину десневого края над имплантатом с одной стороны, а с другой стороны показывает глубину десневого края от высоты кости. Использование данного измерителя дает возможность упростить исследование десневого края над имплантатом и определить высоту слизистой при использовании десневого панча (дырокола).&lt;/p&gt;','','измеритель десневого края','Измеритель десневого края','Измеритель десневого края','грин, инструменты'),
	(190,1,'Титановый измеритель','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановые измерители&lt;/strong&gt; различной длины для определения глубины и параллельности препарирования костного ложа имплантата во время операции.&lt;/p&gt;\r\n&lt;p&gt;После препарирования первым пилотным сверлом на глубину 8мм необходимо вставить титановый измеритель глубины и параллельности в приготовленное отверстие и произвести рентгеновское обследование - периапикальный (прицельный) или панорамный рентгеновский снимок.&lt;/p&gt;\r\n&lt;p&gt;Учитывая, что на измерителе имеется шаг циркулярной насечки 1,0мм, можно с высокой точностю определить, на каком расстоянии мы находимся от нервного ствола, зуба и т.п., а также мы можем определить насколько параллельно прозведено сверление по сравнению с зубами, имплантатами и т.п. И только после этого проводится дальнейшее препарирование костного ложа имплантата.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/titanovyj-izmeritel-mod.jpg&quot; alt=&quot;титановый измеритель&quot; title=&quot;титановый измеритель&quot; /&gt;','','титановый измеритель','Титановый измеритель','Титановый измеритель','грин, инструменты'),
	(191,1,'Cтоппер для хирургических костных дрилей DR2.0','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Набор стопперов для хирургических костных дрилей.&lt;/strong&gt; Стоппер для хирургического костного сверла изготовлен из медицинской стали, в виде полого цилиндра. Стоппер закрепляется на конце рабочей части сверла. Стопперы соответствуют диаметру свёрл. Имеется 5 размеров стопперов (6мм, 8мм, 10мм, 11,5мм, 13мм) для каждого диаметра сверла (всего 30 стопперов). Стоппер препятствует более глубокому проникновению сверла в костную ткань, чем заданная глубина сверления.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/ctopper-dlya-hirurgicheskih-kostnyh-drilej-mod.jpg&quot; alt=&quot;cтоппер для хирургических костных дрилей dr2.0&quot; title=&quot;cтоппер для хирургических костных дрилей dr2.0&quot; /&gt;','','cтоппер для хирургических костных дрилей dr2.0','Cтоппер для хирургических костных дрилей DR2.0','Cтоппер для хирургических костных дрилей DR2.0','грин, инструменты'),
	(192,1,'Cтоппер для хирургических костных дрилей DR2.8','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Набор стопперов для хирургических костных дрилей.&lt;/strong&gt; Стоппер для хирургического костного сверла изготовлен из медицинской стали, в виде полого цилиндра. Стоппер закрепляется на конце рабочей части сверла. Стопперы соответствуют диаметру свёрл. Имеется 5 размеров стопперов (6мм, 8мм, 10мм, 11,5мм, 13мм) для каждого диаметра сверла (всего 30 стоперов). Стоппер препятствует более глубокому проникновению сверла в костную ткань, чем заданная глубина сверления.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/ctopper-dlya-hirurgicheskih-kostnyh-drilej-mod.jpg&quot; alt=&quot;cтоппер для хирургических костных дрилей dr2.8&quot; title=&quot;cтоппер для хирургических костных дрилей dr2.8&quot; /&gt;','','cтоппер для хирургических костных дрилей dr2.8','Cтоппер для хирургических костных дрилей DR2.8','Cтоппер для хирургических костных дрилей DR2.8','грин, инструменты'),
	(193,1,'Cтоппер для хирургических костных дрилей DR3.2','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Набор стопперов для хирургических костных дрилей.&lt;/strong&gt; Стоппер для хирургического костного сверла изготовлен из медицинской стали, в виде полого цилиндра. Стоппер закрепляется на конце рабочей части сверла. Стопперы соответствуют диаметру свёрл. Имеется 5 размеров стопперов (6мм, 8мм, 10мм, 11,5мм, 13мм) для каждого диаметра сверла (всего 30 стоперов). Стоппер препятствует более глубокому проникновению сверла в костную ткань, чем заданная глубина сверления.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/ctopper-dlya-hirurgicheskih-kostnyh-drilej-mod.jpg&quot; alt=&quot;cтоппер для хирургических костных дрилей dr3.2&quot; title=&quot;cтоппер для хирургических костных дрилей dr3.2&quot; /&gt;','','cтоппер для хирургических костных дрилей dr3.2','Cтоппер для хирургических костных дрилей DR3.2','Cтоппер для хирургических костных дрилей DR3.2','грин, инструменты'),
	(194,1,'Cтоппер для хирургических костных дрилей DR3.7','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Набор стопперов для хирургических костных дрилей.&lt;/strong&gt; Стоппер для хирургического костного сверла изготовлен из медицинской стали, в виде полого цилиндра. Стоппер закрепляется на конце рабочей части сверла. Стопперы соответствуют диаметру свёрл. Имеется 5 размеров стопперов (6мм, 8мм, 10мм, 11,5мм, 13мм) для каждого диаметра сверла (всего 30 стоперов). Стоппер препятствует более глубокому проникновению сверла в костную ткань, чем заданная глубина сверления.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/ctopper-dlya-hirurgicheskih-kostnyh-drilej-mod.jpg&quot; alt=&quot;cтоппер для хирургических костных дрилей dr3.7&quot; title=&quot;cтоппер для хирургических костных дрилей dr3.7&quot; /&gt;','','cтоппер для хирургических костных дрилей dr3.7','Cтоппер для хирургических костных дрилей DR3.7','Cтоппер для хирургических костных дрилей DR3.7','грин, инструменты'),
	(195,1,'Cтоппер для хирургических костных дрилей DR4.2','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Набор стопперов для хирургических костных дрилей.&lt;/strong&gt; Стоппер для хирургического костного сверла изготовлен из медицинской стали, в виде полого цилиндра. Стоппер закрепляется на конце рабочей части сверла. Стопперы соответствуют диаметру свёрл. Имеется 5 размеров стопперов (6мм, 8мм, 10мм, 11,5мм, 13мм) для каждого диаметра сверла (всего 30 стоперов). Стоппер препятствует более глубокому проникновению сверла в костную ткань, чем заданная глубина сверления.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/ctopper-dlya-hirurgicheskih-kostnyh-drilej-mod.jpg&quot; alt=&quot;cтоппер для хирургических костных дрилей dr4.2&quot; title=&quot;cтоппер для хирургических костных дрилей dr4.2&quot; /&gt;','','cтоппер для хирургических костных дрилей dr4.2','Cтоппер для хирургических костных дрилей DR4.2','Cтоппер для хирургических костных дрилей DR4.2','грин, инструменты'),
	(196,1,'Cтоппер для хирургических костных дрилей DR5.2','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Набор стопперов для хирургических костных дрилей.&lt;/strong&gt; Стоппер для хирургического костного сверла изготовлен из медицинской стали, в виде полого цилиндра. Стоппер закрепляется на конце рабочей части сверла. Стопперы соответствуют диаметру свёрл. Имеется 5 размеров стопперов (6мм, 8мм, 10мм, 11,5мм, 13мм) для каждого диаметра сверла (всего 30 стоперов). Стоппер препятствует более глубокому проникновению сверла в костную ткань, чем заданная глубина сверления.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/ctopper-dlya-hirurgicheskih-kostnyh-drilej-mod.jpg&quot; alt=&quot;cтоппер для хирургических костных дрилей dr5.2&quot; title=&quot;cтоппер для хирургических костных дрилей dr5.2&quot; /&gt;','','cтоппер для хирургических костных дрилей dr5.2','Cтоппер для хирургических костных дрилей DR5.2','Cтоппер для хирургических костных дрилей DR5.2','грин, инструменты'),
	(197,1,'Сверло &quot;Трефайн&quot;','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Сверло &quot;Трефайн&quot;.&lt;/strong&gt; Специальное полое сверло для препарирования и сбора костной ткани, а также удаления имплантата вместе с костной тканью. Сверла со специальным сквозным отверстием по длине всего сверла, которое предназначено для внутреннего охлаждения сверла при препарировании костной ткани. Изготовлено из нержавеющей стали.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/sverlo-trefajn-mod.png&quot; alt=&quot;cверло трефайн&quot; title=&quot;cверло трефайн&quot; /&gt;','','cверло трефайн','Сверло &quot;Трефайн&quot;','Сверло &quot;Трефайн&quot;','грин, инструменты'),
	(198,1,'Титановый винт шестигранный','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый винт шестигранный&lt;/strong&gt; 1,2ммд. Для фиксации костного имплантата (костного фрагмента) к костной ткани. Используется вместе с шестигранным ключом 1.25ммд.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/titanovyj-vint-shestigrannyj-mod.jpg&quot; alt=&quot;титановый винт шестигранный&quot; title=&quot;титановый винт шестигранный&quot; /&gt;','','титановый винт шестигранный','Титановый винт шестигранный','Титановый винт шестигранный','грин, инструменты'),
	(199,1,'Титановый винт круглый','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый винт круглый&lt;/strong&gt; 1,2ммд. Для фиксации костного имплантата (костного фрагмента) к костной ткани. Используется вместе с ключом филипс.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/titanovyj-vint-kruglyj-mod.jpg&quot; alt=&quot;титановый винт круглый&quot; title=&quot;титановый винт круглый&quot; /&gt;','','титановый винт круглый','Титановый винт круглый','Титановый винт круглый','грин, инструменты'),
	(200,1,'Крепежный титановый винт шестигранный','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Крепежный титановый винт шестигранный&lt;/strong&gt; 1,2ммд. Для фиксации мембраны к костной ткани. Используется вместе с шестигранным ключом 1.25ммд.&lt;/p&gt;','','крепежный титановый винт шестигранный','Крепежный титановый винт шестигранный','Крепежный титановый винт шестигранный','грин, инструменты'),
	(201,1,'Крепежный титановый винт круглый','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Крепежный титановый винт круглый&lt;/strong&gt; 1,2ммд. Для фиксации мембраны к костной ткани. Используется вместе с ключом филипс.&lt;/p&gt;','','крепежный титановый винт круглый','Крепежный титановый винт круглый','Крепежный титановый винт круглый','грин, инструменты'),
	(202,1,'Крепежный титановый пин','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Крепежный титановый пин&lt;/strong&gt; 1.3ммд. Для фиксации мембраны к костной ткани. Изготовлен из медицинского титана G-5. Пин вколачивается костную ткань в при помощи специального инструмента (442500 или 442501).&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/krepezhnyj-titanovyj-pin-mod.jpg&quot; alt=&quot;крепежный титановый пин&quot; title=&quot;крепежный титановый пин&quot; /&gt;','','крепежный титановый пин','Крепежный титановый пин','Крепежный титановый пин','грин, инструменты'),
	(203,1,'Остеотомы','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Остеотомы.&lt;/strong&gt; Применяются для подготовки костного ложа при имплантации в мягких костных типах, а также для дополнительных хирургических действий при дентальной имплантации.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/osteotomy-mod.png&quot; alt=&quot;остеотомы&quot; title=&quot;остеотомы&quot; /&gt;','','остеотомы','Остеотомы','Остеотомы','грин, инструменты'),
	(204,1,'Набор остеотомов','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Набор остеотомов.&lt;/strong&gt; Для формирования костного ложа имплантата.\r\nНабор состоит из пяти прямых остеотомов и из пяти угловых остеотомов. Используется для формирования костного ложа имплантата при типе кости 3 и 4,с преобладанием губчатого вещества в костной ткани.&lt;/p&gt;\r\n&lt;p&gt;Также используются остеотомы для формировании костного ложа имплантата после расщеплении узкого альвеолярного гребня и операции мягкий синус лифтинг для поднятия слизистой гайморовой пазухи. Угловые остетомы в основном используются в боковых отделах верхней челюсти. Изготовлен из нержавеющей стали.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/nabor-osteotomov-mod.jpg&quot; alt=&quot;набор остеотомов&quot; title=&quot;набор остеотомов&quot; /&gt;','','набор остеотомов','Набор остеотомов','Набор остеотомов','грин, инструменты'),
	(205,1,'Шестигранный ключ 2.1ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Шестигранный ключ 2.1ммд для вкручивания имплантатов с внутренним шестигранником в челюстную кость.&lt;/strong&gt; Используется для закручивания и раскручивания имплантата с внутренним шестигранником 2.1ммд в челюстную кость на хирургическом этапе.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с ключом &lt;a href=&quot;/odnostoronnij-klyuch-ratchet/&quot;&gt;Ратчет&lt;/a&gt; или хирургическим полым ключом. &lt;/p&gt;\r\n&lt;p&gt;Грани на рабочей части ключа позволяют визуально контролировать позицию шестигранника имплантата. Насечки на рабочей части ключа позволяют определить глубину введения имплантата.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/shestigrannyj-klyuch-21mmd-mod.jpg&quot; alt=&quot;шестигранный ключ 2.1ммд&quot; title=&quot;шестигранный ключ 2.1ммд&quot; /&gt;','','шестигранный ключ 2.1ммд','Шестигранный ключ 2.1ммд','Шестигранный ключ 2.1ммд','грин, инструменты'),
	(206,1,'Шестигранный ключ 2.1ммд для углового наконечника','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Шестигранный ключ 2.1ммд для углового наконечника.&lt;/strong&gt; Используется для закручивания и раскручивания имплантата с внутренним шестигранником 2.1ммд в челюстную кость на хирургическом этапе. Используется вместе с физиодиспенсором и присоединяется к угловому редукторному наконечнику. Грани на рабочей части ключа позволяют визуально контролировать позицию шестигранника имплантата.&lt;/p&gt;','','шестигранный ключ 2.1ммд для углового наконечника','Шестигранный ключ 2.1ммд для углового наконечника','Шестигранный ключ 2.1ммд для углового наконечника','грин, инструменты'),
	(207,1,'Шестигранный ключ 2.5ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Шестигранный ключ 2.5ммд для вкручивания имплантатов с внутренним шестигранником в челюстную кость.&lt;/strong&gt; Используется для закручивания и раскручивания имплантата с внутренним шестигранником 2.43ммд в челюстную кость на хирургическом этапе.&lt;/p&gt;\r\n&lt;p&gt;Используется вместе с ключом &lt;a href=&quot;/odnostoronnij-klyuch-ratchet/&quot;&gt;Ратчет&lt;/a&gt; или хирургическим полым ключом.&lt;/p&gt;\r\n&lt;p&gt;Грани на рабочей части ключа позволяют визуально контролировать позицию шестигранника имплантата. Насечки на рабочей части ключа позволяют определить глубину введения имплантата.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/shestigrannyj-klyuch-25mmd-mod.jpg&quot; alt=&quot;шестигранный ключ 2.5ммд&quot; title=&quot;шестигранный ключ 2.5ммд&quot; /&gt;','','шестигранный ключ 2.5ммд','Шестигранный ключ 2.5ммд','Шестигранный ключ 2.5ммд','грин, инструменты'),
	(208,1,'Шестигранный ключ 2.5ммд для углового наконечника','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Шестигранный ключ 2.5ммд для углового наконечника.&lt;/strong&gt; Используется для закручивания и раскручивания имплантата с внутренним шестигранником 2.43ммд в челюстную кость на хирургическом этапе. Используется вместе с физиодиспенсором и присоединяется к угловому редукторному наконечнику. Грани на рабочей части ключа позволяют визуально контролировать позицию шестигранника имплантата.&lt;/p&gt;','','шестигранный ключ 2.5ммд для углового наконечника','Шестигранный ключ 2.5ммд для углового наконечника','Шестигранный ключ 2.5ммд для углового наконечника','грин, инструменты'),
	(209,1,'Полый ключ для углового наконечника 2.1ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Полый ключ для углового наконечника 2.1ммд.&lt;/strong&gt; Используется для машинного закручивания и раскручивания имплантата &lt;a href=&quot;/titanovyi-implantat-vector/&quot;&gt;Вектор&lt;/a&gt; с наружным квадратом 2.1ммд в челюстную кость на хирургическом этапе. Используется вместе с физиодиспенсором и присоединяется к угловому редукторному наконечнику.&lt;/p&gt;','','полый ключ для углового наконечника 2.1ммд','Полый ключ для углового наконечника 2.1ммд','Полый ключ для углового наконечника 2.1ммд','грин, инструменты'),
	(210,1,'Полый ключ 2.1ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Полый ключ 2.1ммд.&lt;/strong&gt; Используется для закручивания и раскручивания имплантата &lt;a href=&quot;/titanovyi-implantat-vector/&quot;&gt;Вектор&lt;/a&gt; с наружным квадратом 2.1ммд в челюстную кость на хирургическом этапе. Используется вместе с ключом &lt;a href=&quot;/odnostoronnij-klyuch-ratchet/&quot;&gt;Ратчет&lt;/a&gt; или хирургическим полым ключом.&lt;/p&gt;','','полый ключ 2.1ммд','Полый ключ 2.1ммд','Полый ключ 2.1ммд','грин, инструменты'),
	(211,1,'Адаптор для имплантата Вектор 2.1ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Адаптор для имплантата Вектор 2.1ммд.&lt;/strong&gt; Используется для закручивания и раскручивания имплантата &lt;a href=&quot;/titanovyi-implantat-vector/&quot;&gt;Вектор&lt;/a&gt; с наружным квадратом 2.1ммд в челюстную кость на хирургическом этапе. Используется вместе шестигранным ключом 2,5ммд.&lt;/p&gt;','','адаптор для имплантата вектор 2.1ммд','Адаптор для имплантата Вектор 2.1ммд','Адаптор для имплантата Вектор 2.1ммд','грин, инструменты'),
	(212,1,'Полый ключ для углового наконечника 2.7ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Полый ключ для углового наконечника 2.7ммд.&lt;/strong&gt; Используется для машинного закручивания и раскручивания имплантата &lt;a href=&quot;/titanovyi-implantat-vector-plus/&quot;&gt;Вектор Плюс&lt;/a&gt; с наружным шестигранником 2.7ммд в челюстную кость на хирургическом этапе. Используется вместе с физиодиспенсором и присоединяется к угловому редукторному наконечнику.&lt;/p&gt;','','полый ключ для углового наконечника 2.7ммд','Полый ключ для углового наконечника 2.7ммд','Полый ключ для углового наконечника 2.7ммд','грин, инструменты'),
	(213,1,'Полый ключ 2.7ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Полый ключ 2.7ммд.&lt;/strong&gt; Используется для закручивания и раскручивания имплантата &lt;a href=&quot;/titanovyi-implantat-vector-plus/&quot;&gt;Вектор Плюс&lt;/a&gt; с наружным шестигранником 2.7ммд в челюстную кость на хирургическом этапе. Используется вместе с ключом &lt;a href=&quot;/odnostoronnij-klyuch-ratchet/&quot;&gt;Ратчет&lt;/a&gt; или хирургическим полым ключом.&lt;/p&gt;','','полый ключ 2.7ммд','Полый ключ 2.7ммд','Полый ключ 2.7ммд','грин, инструменты'),
	(214,1,'Ключ для удержания абатментов','','','ключ для удержания абатментов','Ключ для удержания абатментов','Ключ для удержания абатментов','грин, инструменты'),
	(215,1,'Ключ для извлечения защелкивающегося абатмента','','','ключ для извлечения защелкивающегося абатмента','Ключ для извлечения защелкивающегося абатмента','Ключ для извлечения защелкивающегося абатмента','грин, инструменты'),
	(216,1,'Шестигранный ключ 1.77ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Шестигранный ключ 1.77ммд.&lt;/strong&gt; Для вкручивания винтовых абатментов, используемых в ортопедическом этапе имплантации. Этот ключ используется вместе с ключом &lt;a href=&quot;/odnostoronnij-klyuch-ratchet/&quot;&gt;Ратчет&lt;/a&gt; или хирургическим ключом, а также вместе с ключом для дозированного определенной силой вкручивания винтов.&lt;/p&gt;','','шестигранный ключ 1.77ммд','Шестигранный ключ 1.77ммд','Шестигранный ключ 1.77ммд','грин, инструменты'),
	(217,1,'Ручной шестигранный ключ 1.77ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Ручной шестигранный ключ 1.77ммд.&lt;/strong&gt; Для вкручивания  винтовых абатментов, используемых в ортопедическом этапе имплантации. Этот ключ используется для ручного вкручивая винтовых абатментов.&lt;/p&gt;','','ручной шестигранный ключ 1.77ммд','Ручной шестигранный ключ 1.77ммд','Ручной шестигранный ключ 1.77ммд','грин, инструменты'),
	(218,1,'Шестигранный ключ для углового наконечника 1.77ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Шестигранный ключ для углового наконечника 1.77ммд.&lt;/strong&gt; Для вкручивания винтовых абатментов, используемых на ортопедическом этапе имплантации. Этот ключ используется вместе с угловым наконечником.&lt;/p&gt;','','шестигранный ключ для углового наконечника 1.77ммд','Шестигранный ключ для углового наконечника 1.77ммд','Шестигранный ключ для углового наконечника 1.77ммд','грин, инструменты'),
	(219,1,'Шестигранный ключ 1.25ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Шестигранный ключ 1.25ммд&lt;/strong&gt; для вкручивания всех винтов, используемых как в хирургической ,так и ортопедической этапах имплантации. Этот ключ используется вместе с ключом &lt;a href=&quot;/odnostoronnij-klyuch-ratchet/&quot;&gt;Ратчет&lt;/a&gt; или хирургическим ключом, а также вместе с ключом для дозированного определенной силой вкручивания винтов.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/shestigrannyj-klyuch-1-25-mmd-mod.jpg&quot; alt=&quot;шестигранный ключ 1.25ммд&quot; title=&quot;шестигранный ключ 1.25ммд&quot; /&gt;','','шестигранный ключ 1.25ммд','Шестигранный ключ 1.25ммд','Шестигранный ключ 1.25ммд','грин, инструменты'),
	(220,1,'Ручной шестигранный ключ 1.25ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Шестигранный ключ 1.25ммд&lt;/strong&gt; для вкручивания всех винтов, используемых как в хирургической, так и ортопедической этапах имплантации.\r\nЭтот ключ используется для ручного вкручивания винтов.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/ruchnoj-shestigrannyj-klyuch-1-25-mmd-mod.jpg&quot; alt=&quot;ручной шестигранный ключ 1.25ммд&quot; title=&quot;ручной шестигранный ключ 1.25ммд&quot; /&gt;','','ручной шестигранный ключ 1.25ммд','Ручной шестигранный ключ 1.25ммд','Ручной шестигранный ключ 1.25ммд','грин, инструменты'),
	(221,1,'Шестигранный ключ для углового наконечника 1.25ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Шестигранный ключ для углового наконечника 1.25ммд.&lt;/strong&gt; Для вкручивания  всех винтов используемых как в хирургической, так и ортопедической этапах имплантации. Этот ключ используется вместе с угловым наконечником. Верхняя часть, головка, универсальная для соединения с угловым наконечником, что дает возможность использовать данный ключ с любым угловым наконечником.&lt;/p&gt;','','шестигранный ключ для углового наконечника 1.25ммд','Шестигранный ключ для углового наконечника 1.25ммд','Шестигранный ключ для углового наконечника 1.25ммд','грин, инструменты'),
	(222,1,'Универсальный шестигранный ключ 1.25ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Универсальный шестигранный ключ 1.25ммд.&lt;/strong&gt; Для вкручивания  всех винтов используемых как в хирургической, так и ортопедической этапах имплантации. Этот ключ используется для ручного вкручивая винтов и также используется вместе с ключом &lt;a href=&quot;/odnostoronnij-klyuch-ratchet/&quot;&gt;Ратчет&lt;/a&gt; или хирургическим ключом, а также вместе с ключом для дозированного определенной силой вкручивания винтов.&lt;/p&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/instrumenty/universalnyj-shestigrannyj-klyuch-1-25-mmd-mod.jpg&quot; alt=&quot;универсальный шестигранный ключ 1.25ммд&quot; title=&quot;универсальный шестигранный ключ 1.25ммд&quot; /&gt;','','универсальный шестигранный ключ 1.25ммд','Универсальный шестигранный ключ 1.25ммд','Универсальный шестигранный ключ 1.25ммд','грин, инструменты'),
	(223,1,'Лабораторный шестигранный ключ 1.25ммд','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Лабораторный шестигранный ключ 1.25ммд.&lt;/strong&gt; Для вкручивания всех винтов, используемых в ортопедическом этапе имплантации. Используется в зуботехнической лаборатории.&lt;/p&gt;','','лабораторный шестигранный ключ 1.25ммд','Лабораторный шестигранный ключ 1.25ммд','Лабораторный шестигранный ключ 1.25ммд','грин, инструменты'),
	(224,1,'Лабораторный шестигранный ключ 1.25ммд длинный','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Лабораторный шестигранный ключ 1.25ммд длинный.&lt;/strong&gt; Для вкручивания всех винтов, используемых в ортопедическом этапе имплантации. Используется в клинике врачом стоматологом, но в основном он используется в зуботехнической лаборатории.\r\nЭтот ключ используется для ручного закручивания.&lt;/p&gt;','','лабораторный шестигранный ключ 1.25ммд длинный','Лабораторный шестигранный ключ 1.25ммд длинный','Лабораторный шестигранный ключ 1.25ммд длинный','грин, инструменты'),
	(225,1,'Винтовой трансфер для закрытой ложки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Винтовой трансфер для закрытой ложки.&lt;/strong&gt; Трансфер для имплантата с внутренним шестигранником 2.43ммд. Используется вместе с шестигранным ключом 1.25ммд, присоединяется не­посредственно к имплантату. Используется для снятия слепка с имплантата по способу закрытой ложки. Изготовлен из нержавеющей стали&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;901545&lt;/strong&gt; - стандартный (для снятия слепка с имплантата во всех отделах верхней и нижней челюсти);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;900745&lt;/strong&gt; - короткий (для снятия слепка с имплантата в боковых отделах верхней и нижней челюсти);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;901538&lt;/strong&gt; - узкий (для снятия слепка с имплантата при недостаточном расстоянии между имплантатами);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;901552&lt;/strong&gt; - широкий (для снятия слепка с имплантата при использовании широких формирователей десны).&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/vintovoj-transfer-dlya-zakrytoj-lozhki-mod.jpg&quot; alt=&quot;винтовой трансфер для закрытой ложки&quot; title=&quot;винтовой трансфер для закрытой ложки&quot; /&gt;','','винтовой трансфер для закрытой ложки','Винтовой трансфер для закрытой ложки','Винтовой трансфер для закрытой ложки','грин, трансферы'),
	(226,1,'Винтовой трансфер для закрытой ложки с узкой платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Винтовой трансфер для закрытой ложки с узкой платформой.&lt;/strong&gt; Трансфер для имплантата с узким внутренним шестигранником 2.1ммд. Используется вместе с шестигранным ключом 1.25ммд , присоединяется не­посредственно к имплантату. Используется для снятия слепка с имплантата по способу закрытой ложки.&lt;/p&gt;','','винтовой трансфер для закрытой ложки с узкой платформой','Винтовой трансфер для закрытой ложки с узкой платформой','Винтовой трансфер для закрытой ложки с узкой платформой','грин, трансферы'),
	(227,1,'Винтовой трансфер для открытой ложки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Винтовой трансфер для открытой ложки.&lt;/strong&gt; Трансфер для имплантата с внутренним шестигранником 2.43ммд. Используется вместе с шестигранным ключом 1.25ммд, присоединяется не­посредственно к имплантату. Используется для снятия слепка с имплантата по способу открытой ложки. При снятии слепка остается внутри слепка. Изготовлен из нержавеющей стали.&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;902545&lt;/strong&gt; - стандартный (для снятия слепка с имплантата во всех отделах верхней и нижней челюсти);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;900845&lt;/strong&gt; - короткий (для снятия слепка с имплантата в задних отделах челюстей);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;901745&lt;/strong&gt; - узкий (для снятия слепка с имплантата при недостаточном расстоянии между имплантатами);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;901550&lt;/strong&gt; - широкий (для снятия слепка с имплантата при использовании широких формирователей десны).&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/vintovoj-transfer-dlya-otkrytoj-lozhki-mod.jpg&quot; alt=&quot;винтовой трансфер для открытой ложки&quot; title=&quot;винтовой трансфер для открытой ложки&quot; /&gt;','','винтовой трансфер для открытой ложки','Винтовой трансфер для открытой ложки','Винтовой трансфер для открытой ложки','грин, трансферы'),
	(228,1,'Винтовой трансфер для открытой ложки с узкой платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Винтовой трансфер для открытой ложки с узкой платформой.&lt;/strong&gt; Трансфер для имплантата с узким внутренним шестигранником 2.1ммд. Используется вместе с шестигранным ключом 1.25ммд, присоединяется не­посредственно к имплантату. Используется для снятия слепка с имплантата по способу открытой ложки. При снятии слепка остается внутри слепка.&lt;/p&gt;','','винтовой трансфер для открытой ложки с узкой платформой','Винтовой трансфер для открытой ложки с узкой платформой','Винтовой трансфер для открытой ложки с узкой платформой','грин, трансферы'),
	(229,1,'Трансфер с клипсой для закрытой ложки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Трансфер с клипсой для закрытой ложки.&lt;/strong&gt; Закрывающийся трансфер для имплантата с внутренним шестигранником. Состоит из полого тела трансфера высотой 11.5мм и диаметром 4.5мм, на нижнем конце имеется шестигранник, который вставляется в шестигранник имплантата. За шестигранником идет клипса, которая удерживает трансфер в имплантате. Присоединяется не­посредственно к имплантату, на теле трансфера имеется две циркулярные бороздки для ретенции в слепке. Используется для снятия слепка с имплантата по способу закрытой ложки. При снятии слепка остается внутри слепка. Изготовлен из нержавеющей стали.&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;901546&lt;/strong&gt; - стандартный (для снятия слепка с имплантата во всех отделах верхней и нижней челюсти);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;900746&lt;/strong&gt; - короткий (для снятия слепка с имплантата в задних отделах челюстей);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;901540&lt;/strong&gt; - узкий (для снятия слепка с имплантата при недостаточном расстоянии между имплантатами);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;901551&lt;/strong&gt; - широкий (для снятия слепка с имплантата при использовании широких формирователей десны).&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/transfer-s-klipsoj-dlya-zakrytoj-lozhki-mod.jpg&quot; alt=&quot;трансфер с клипсой для закрытой ложки&quot; title=&quot;трансфер с клипсой для закрытой ложки&quot; /&gt;','','трансфер с клипсой для закрытой ложки','Трансфер с клипсой для закрытой ложки','Трансфер с клипсой для закрытой ложки','грин, трансферы'),
	(230,1,'Трансфер с клипсой для закрытой ложки с узкой платформой','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Трансфер с клипсой для закрытой ложки с узкой платформой.&lt;/strong&gt; Трансфер для имплантата с узким внутренним шестигранником 2.1ммд. Присоединяется не­посредственно к имплантату при помощи шестигранника и клипсы, которая удерживает трансфер в имплантате. Используется для снятия слепка с имплантата по способу закрытой ложки. При снятии слепка остается внутри слепка.&lt;/p&gt;','','трансфер с клипсой для закрытой ложки с узкой платформой','Трансфер с клипсой для закрытой ложки с узкой платформой','Трансфер с клипсой для закрытой ложки с узкой платформой','грин, трансферы'),
	(231,1,'Трансфер эстетического абатмента для открытой ложки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Трансфер эстетического абатмента для открытой ложки.&lt;/strong&gt; Трансфер для эстетического винтового абатмента-коннектора с диаметром 4.7ммд (611548 и т.п.) Используется вместе с шестигранным ключом 1.25ммд, присоединяется не­посредственно к эстетическому абатменту при помощи винта (711729). Используется для снятия слепка с абатмента по способу открытой ложки. При снятии слепка остается внутри слепка. Изготовлен из нержавеющей стали.&lt;/p&gt;','','трансфер эстетического абатмента для открытой ложки','Трансфер эстетического абатмента для открытой ложки','Трансфер эстетического абатмента для открытой ложки','грин, трансферы'),
	(232,1,'Трансфер эстетического абатмента для закрытой ложки','','','трансфер эстетического абатмента для закрытой ложки','Трансфер эстетического абатмента для закрытой ложки','Трансфер эстетического абатмента для закрытой ложки','грин, трансферы'),
	(233,1,'Длиный винт для трансфера абатмента','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Длиный винт для трансфера абатмента.&lt;/strong&gt; Используется вместе с трансфером (901047, 687031). Состоит из тела винта, на нижней части имеется винт, который присоединяется к внутреннему винту коннекторов (604040, 611548 и т.п.), а в верхней части винта имеется шестигранное отверстие, куда вставляется шестигранный ключ 1,25ммд (432912 и т.п.) для вкручивания винта. Изготовлен из нержавеющей стали.&lt;/p&gt;','','длиный винт для трансфера абатмента','Длиный винт для трансфера абатмента','Длиный винт для трансфера абатмента','грин, трансферы'),
	(234,1,'Титановый (рукав) трансфер стандартного винтового абатмента-коннектора для открытой ложки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Титановый (рукав) трансфер стандартного винтового абатмента-коннектора для открытой ложки.&lt;/strong&gt; Трансфер для стандартного винтового абатмента-коннектора с диаметром 4.0ммд (614040 и т.п.). Используется вместе с шестигранным ключом 1.25ммд, присоединяется не­посредственно к стандартному абатменту при помощи винта (711729). Используется для снятия слепка с абатмента по способу открытой ложки. При снятии слепка остается внутри слепка. Изготовлен из нержавеющей стали.&lt;/p&gt;','','','Титановый (рукав) трансфер стандартного винтового абатмента-коннектора для открытой ложки','Титановый (рукав) трансфер стандартного винтового абатмента-коннектора для открытой ложки','грин, трансферы'),
	(235,1,'Винтовой трансфер для закрытой ложки плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Винтовой трансфер PLUS для закрытой ложки.&lt;/strong&gt; Трансфер для имплантатаПлюс с внутренним шестигранником 2.43ммд. Используется вместе с шестигранным ключом 1.25ммд, присоединяется не­посредственно к имплантату при помощи винта. Используется для снятия слепка с имплантата по способу закрытой ложки. Изготовлен из нержавеющей стали.&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;901845&lt;/strong&gt; - стандартный (для снятия слепка с имплантата во всех отделах верхней и нижней челюсти);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;900945&lt;/strong&gt; - короткий (для снятия слепка с имплантата в боковых отделах верхней и нижней челюсти);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;901838&lt;/strong&gt; - узкий (для снятия слепка с имплантата при недостаточном расстоянии между имплантатами);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;901852&lt;/strong&gt; - широкий (для снятия слепка с имплантата при использовании широких формирователей десны - 230560 и т.п.).&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/vintovoj-transfer-dlya-zakrytoj-lozhki-plus-mod.jpg&quot; alt=&quot;винтовой трансфер для закрытой ложки плюс&quot; title=&quot;винтовой трансфер для закрытой ложки плюс&quot; /&gt;','','винтовой трансфер для закрытой ложки плюс','Винтовой трансфер для закрытой ложки плюс','Винтовой трансфер для закрытой ложки плюс','грин, трансферы+'),
	(236,1,'Винтовой трансфер для закрытой ложки с узкой платформой плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Винтовой трансфер PLUS с узкой платформой для закрытой ложки.&lt;/strong&gt; Трансфер для имплантата Плюс с узким внутренним шестигранником 2.1ммд. Используется вместе с шестигранным ключом 1,25ммд , присоединяется не­посредственно к имплантату при помощи винта (711312). Используется для снятия слепка с имплантата по способу закрытой ложки.&lt;/p&gt;','','винтовой трансфер для закрытой ложки с узкой платформой плюс','Винтовой трансфер для закрытой ложки с узкой платформой плюс','Винтовой трансфер для закрытой ложки с узкой платформой плюс','грин, трансферы+'),
	(237,1,'Винтовой трансфер для открытой ложки плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Винтовой трансфер PLUS для открытой ложки.&lt;/strong&gt; Трансфер для имплантата Плюс с внутренним шестигранником 2.43ммд. Используется вместе с шестигранным ключом 1.25ммд, присоединяется не­посредственно к имплантату с помощью винта. Используется для снятия слепка с имплантата по способу открытой ложки. При снятии слепка остается внутри слепка. Изготовлен из нержавеющей стали.&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;903845&lt;/strong&gt; - стандартный (для снятия слепка с имплантата во всех отделах верхней и нижней челюсти);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;901045&lt;/strong&gt; - короткий (для снятия слепка с имплантата в задних отделах челюстей);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;902845&lt;/strong&gt; - узкий (для снятия слепка с имплантата при недостаточном расстоянии между имплантатами);&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;901850&lt;/strong&gt; - широкий (для снятия слепка с имплантата при использовании широких формирователей десны).&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/vintovoj-transfer-dlya-otkrytoj-lozhki-plus-mod.jpg&quot; alt=&quot;винтовой трансфер для открытой ложки плюс&quot; title=&quot;винтовой трансфер для открытой ложки плюс&quot; /&gt;','','винтовой трансфер для открытой ложки плюс','Винтовой трансфер для открытой ложки плюс','Винтовой трансфер для открытой ложки плюс','грин, трансферы+'),
	(238,1,'Винтовой трансфер для открытой ложки с узкой платформой плюс','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Винтовой трансфер PLUS для открытой ложки c узкой платформой.&lt;/strong&gt; Трансфер для имплантата PLUS с узким внутренним шестигранником 2.1ммд. Используется вместе с шестигранным ключом 1,25ммд , присоединяется не­посредственно к имплантату при помощи винта. Используется для снятия слепка с имплантата по способу открытой ложки. При снятии слепка остается внутри слепка.&lt;/p&gt;','','винтовой трансфер для открытой ложки с узкой платформой плюс','Винтовой трансфер для открытой ложки с узкой платформой плюс','Винтовой трансфер для открытой ложки с узкой платформой плюс','грин, трансферы+'),
	(239,1,'Аналог имплантата с внутренним шестигранником','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Аналог имплантата с внутренним шестигранником.&lt;/strong&gt; Используется вместе с трансферами для имплантатов с внутренним шестигранником. Лабораторный ана­лог - деталь, имитирующая внутрикостную часть имплантата с внутренним шестигранником.\r\nСостоит из тела аналога с ретенционными бороздками для фиксации внутри гипсовой модели и внутренней полости в виде внутреннего шестигранника и внутренней винтовой нарезки. Используется для изготовления лабораторной модели челюсти . Изготовлен из нержавеющей стали.&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;920038&lt;/strong&gt; - с внутренним шестигранником 2.43ммд, стандартная платформа 3.8ммд&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;920035&lt;/strong&gt; - с внутренним шестигранником 2.1ммд, узкая платформа 3.0ммд&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;920050&lt;/strong&gt; - с широкой платформой 5ммд&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;920060&lt;/strong&gt; - с широкой платформой 6ммд&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2&gt;Модификации&lt;/h2&gt;\r\n&lt;img src=&quot;/image/data/protetika/analog-implantata-s-vnutrennim-shestigrannikom-mod.jpg&quot; alt=&quot;аналог имплантата с внутренним шестигранником&quot; title=&quot;аналог имплантата с внутренним шестигранником&quot; /&gt;','','аналог имплантата с внутренним шестигранником','Аналог имплантата с внутренним шестигранником','Аналог имплантата с внутренним шестигранником','грин'),
	(240,1,'Аналог титанового абатмента 1-4','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Аналог титанового абатмента 1-4.&lt;/strong&gt; Лабораторный ана­лог - деталь, имитирующая верхнюю часть титанового абатмента 1-4 (510245 и т.п.). Используется для изготовления лабораторной модели челюсти.&lt;/p&gt;','','аналог титанового абатмента','Аналог титанового абатмента 1-4','Аналог титанового абатмента 1-4','грин'),
	(241,1,'Индивидуальный аналог фрезерованного титанового абатмента 1-4','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Индивидуальный аналог фрезерованного титанового абатмента 1-4.&lt;/strong&gt; Деталь, позволяющая изготовить индивидуальный лабораторный ана­лог, имитирующая часть титанового абатмента 1-4 на высоте 2мм над уступом и ретенционный пин (510245 и т.п.). Используется для изготовления аналога фрезерованного титанового абатмента 1-4 и использования её в лабораторной модели челюсти.&lt;/p&gt;','','индивидуальный аналог фрезерованного титанового абатмента','Индивидуальный аналог фрезерованного титанового абатмента 1-4','Индивидуальный аналог фрезерованного титанового абатмента 1-4','грин'),
	(242,1,'Аналог титанового абатмента для одномоментной нагрузки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Аналог титанового абатмента для одномоментной нагрузки.&lt;/strong&gt; Лабораторный ана­лог - деталь, имитирующая верхнюю часть титанового абатмента\r\nдля одномоментной нагрузки (510247, 530251, 530353 и т.п.). Используется для изготовления лабораторной модели челюсти.&lt;/p&gt;','','аналог титанового абатмента для одномоментной нагрузки','Аналог титанового абатмента для одномоментной нагрузки','Аналог титанового абатмента для одномоментной нагрузки','грин'),
	(243,1,'Индивидуальный аналог фрезерованного титанового абатмента для немедленной нагрузки','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Индивидуальный аналог фрезерованного титанового абатмента для одномоментной нагрузки.&lt;/strong&gt; Деталь позволяющая изготовить индивидуальный лабораторный ана­лог, имитирующая часть титанового абатмента для одномоментной нагрузки на высоте 2мм над уступом и ретенционный пин (510247, 530251, 530353 и т.п.). Используется для изготовления аналога фрезерованного абатмента для одномоментной нагрузки и использования её в лабораторной модели челюсти.&lt;/p&gt;','','аналог абатмента для немедленной нагрузки','Индивидуальный аналог фрезерованного титанового абатмента для немедленной нагрузки','Индивидуальный аналог фрезерованного титанового абатмента для немедленной нагрузки','грин'),
	(244,1,'Аналог широкого титанового абатмента 2-4','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Аналог широкого титанового абатмента 2-4.&lt;/strong&gt; Лабораторный ана­лог - деталь, имитирующая верхнюю часть широкого титанового абатмента 2-4 (510256 и т.п.). Используется для изготовления лабораторной модели челюсти.&lt;/p&gt;','','аналог широкого титанового абатмента','Аналог широкого титанового абатмента 2-4','Аналог широкого титанового абатмента 2-4','грин'),
	(245,1,'Индивидуальный аналог фрезерованного титанового абатмента 2-4','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Индивидуальный аналог фрезерованного титанового абатмента 2-4.&lt;/strong&gt; Деталь, позволяющая изготовить индивидуальный лабораторный ана­лог, имитирующая часть титанового абатмента 2-4 на высоте 2мм над уступом и ретенционный пин (510245 и т.п.). Используется для изготовления аналога фрезерованного титанового абатмента 2-4 и использования её в лабораторной модели челюсти.&lt;/p&gt;','','индивидуальный аналог фрезерованного абатмента','Индивидуальный аналог фрезерованного титанового абатмента 2-4','Индивидуальный аналог фрезерованного титанового абатмента 2-4','грин'),
	(246,1,'Аналог титанового анатомического абатмента','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Аналог титанового анатомического абатмента.&lt;/strong&gt; Лабораторный ана­лог - деталь, имитирующая верхнюю часть титанового анатомического абатмента (510246 и т.п.). Используется для изготовления лабораторной модели челюсти.&lt;/p&gt;','','аналог титанового анатомического абатмента','Аналог титанового анатомического абатмента','Аналог титанового анатомического абатмента','грин'),
	(247,1,'Индивидуальный аналог фрезерованного титанового анатомического абатмента','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Индивидуальный аналог фрезерованного титанового анатомического абатмента.&lt;/strong&gt; Деталь, позволяющая изготовить индивидуальный лабораторный ана­лог, имитирующая часть титанового анатомического абатмента на высоте 2мм над уступом и ретенционный пин (510246 и т.п.). Используется для изготовления аналога фрезерованного титанового анатомического абатмента и использования её в лабораторной модели челюсти.&lt;/p&gt;','','аналог фрезерованного анатомического абатмента','Индивидуальный аналог фрезерованного титанового анатомического абатмента','Индивидуальный аналог фрезерованного титанового анатомического абатмента','грин'),
	(248,1,'Аналог углового 15° титанового анатомического абатмента','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Аналог углового 15° титанового анатомического абатмента.&lt;/strong&gt; Лабораторный ана­лог - деталь, имитирующая верхнюю часть углового 15° титанового анатомического абатмента (530245 и т.п.). Используется для изготовления лабораторной модели челюсти.&lt;/p&gt;','','аналог углового 15 градусов анатомического абатмента','Аналог углового 15 градусов титанового анатомического абатмента','Аналог углового 15° титанового анатомического абатмента','грин'),
	(249,1,'Аналог углового 25° титанового анатомического абатмента','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Аналог углового 25° титанового анатомического абатмента.&lt;/strong&gt; Лабораторный ана­лог - деталь, имитирующая верхнюю часть углового 25° титанового анатомического абатмента (530247 и т.п.). Используется для изготовления лабораторной модели челюсти.&lt;/p&gt;','','Аналог углового 25° титанового анатомического абатмента','Аналог углового 25° титанового анатомического абатмента','Аналог углового 25° титанового анатомического абатмента','грин'),
	(250,1,'Аналог титанового абатмента с шариковым атачментом','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Аналог титанового абатмента с шариковым атачментом.&lt;/strong&gt; Лабораторный ана­лог - деталь, имитирующая верхнюю часть титанового абатмента с шариковым атачментом (624040, 623040, 625050 и т.п.). Используется для изготовления лабораторной модели челюсти.&lt;/p&gt;','','Аналог титанового абатмента с шариковым атачментом','Аналог титанового абатмента с шариковым атачментом','Аналог титанового абатмента с шариковым атачментом','грин'),
	(251,1,'Аналог титанового локатор абатмента','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Аналог титанового локатор абатмента.&lt;/strong&gt; Лабораторный ана­лог - деталь, имитирующая верхнюю часть титанового локатор абатмента (651038 и т.п.). Используется для изготовления лабораторной модели челюсти.&lt;/p&gt;','','Аналог титанового локатор абатмента','Аналог титанового локатор абатмента','Аналог титанового локатор абатмента','грин'),
	(252,1,'Аналог стандартного винтового абатмента-коннектора ','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Аналог стандартного винтового абатмента-коннектора.&lt;/strong&gt; Лабораторный ана­лог - деталь, имитирующая внутреннюю и верхнюю часть стандартного винтового абатмента-коннектора (604040 и т.п.). Используется для изготовления лабораторной модели челюсти.&lt;/p&gt;','','Аналог стандартного винтового абатмента-коннектора ','Аналог стандартного винтового абатмента-коннектора ','Аналог стандартного винтового абатмента-коннектора ','грин'),
	(253,1,'Аналог эстетического винтового абатмента-коннектора','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Аналог эстетического винтового абатмента-коннектора.&lt;/strong&gt; Лабораторный ана­лог - деталь, имитирующая внутреннюю и верхнюю часть эстетического винтового абатмента-коннектора (612548 и т.п.). Используется для изготовления лабораторной модели челюсти.&lt;/p&gt;','','Аналог эстетического винтового абатмента-коннектора','Аналог эстетического винтового абатмента-коннектора','Аналог эстетического винтового абатмента-коннектора','грин'),
	(254,1,'Пластмассовый носитель абатмента+имплантата','&lt;h2&gt;Описание&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Пластмассовый носитель абатмента+имплантата&lt;/strong&gt; состоит из:&lt;/p&gt;\r\n&lt;ol&gt;\r\n&lt;li&gt;Верхняя часть в виде шестигранника 6,35ммд. Высота шестигранника 6 мм. В центре шестигранника имеется круглое полое углубление диаметром 4,5ммд и глубиной 4мм. В центре углубления имеется внутренняя резьба для закрепления &lt;a href=&quot;/vintovoi-lechebnyi-abatment/&quot;&gt;лечебного титанового абатмента&lt;/a&gt;.&lt;/li&gt;\r\n&lt;li&gt;Тело в виде цилиндра высотой 6мм для удержания в стерильной круглой упаковке.&lt;/li&gt;\r\n&lt;li&gt;Нижняя часть в виде пластмассовой капы.Полое шестигранное углубление капы плотно садится на шестигранник абатмента. Используется для удержания имплантата+абатмента в стерильной упаковке и для закручивания и раскручивания имплантата в челюстную кость, а также из нижней капы изготавливается временная коронка.\r\nИспользуется для удержания имплантата+абатмента в стерильной упаковке и для закручивания и раскручивания имплантата в челюстную кость на хирургическом этапе. После удаления носителя имплантата+абатмента дальнейшее введение осуществляется шестигранным ключом 2,5ммд, который вставляется в шестигранник абатмента, и имплантат докручивается в приготовленное костное ложе.&lt;/li&gt;\r\n&lt;/ol&gt;','','Пластмассовый носитель абатмента+имплантата','Пластмассовый носитель абатмента+имплантата','Пластмассовый носитель абатмента+имплантата','грин'),
	(255,1,'Пластиковый колпачок для временного протезирования при немедленной нагрузке','','','Пластиковый колпачок для временного протезирования при немедленной нагрузке','Пластиковый колпачок для временного протезирования при немедленной нагрузке','Пластиковый колпачок для временного протезирования при немедленной нагрузке','грин');

/*!40000 ALTER TABLE `comcs_product_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_product_discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_discount`;

CREATE TABLE `comcs_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_product_filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_filter`;

CREATE TABLE `comcs_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_product_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_image`;

CREATE TABLE `comcs_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_product_image` WRITE;
/*!40000 ALTER TABLE `comcs_product_image` DISABLE KEYS */;

INSERT INTO `comcs_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`)
VALUES
	(2,83,'data/implantaty/lechebnyi-vintovoi-titanovyi-abatment-dlia-vektor-plus-pic1.jpg',1),
	(3,146,'data/biomaterialy/shovnik-1.jpg',1),
	(4,146,'data/biomaterialy/shovnik-2.jpg',2),
	(5,215,'data/instrumenty/klyuch-dlya-izvlecheniya-zashchyolkivayushchegosya-abatmenta-1.jpg',1);

/*!40000 ALTER TABLE `comcs_product_image` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_product_multycurr
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_multycurr`;

CREATE TABLE `comcs_product_multycurr` (
  `product_id` int(11) NOT NULL DEFAULT '0',
  `price` decimal(15,4) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_product_multycurr` WRITE;
/*!40000 ALTER TABLE `comcs_product_multycurr` DISABLE KEYS */;

INSERT INTO `comcs_product_multycurr` (`product_id`, `price`, `currency_id`)
VALUES
	(74,100.0000,4),
	(73,110.0000,4),
	(75,120.0000,4),
	(76,130.0000,4),
	(77,150.0000,4),
	(78,170.0000,4),
	(79,190.0000,4),
	(80,100.0000,4),
	(81,20.0000,4),
	(82,24.0000,4),
	(83,20.0000,4),
	(84,20.0000,4),
	(85,20.0000,4),
	(86,10.0000,4),
	(87,10.0000,4),
	(88,40.0000,4),
	(89,40.0000,4),
	(90,40.0000,4),
	(91,70.0000,4),
	(92,45.0000,4),
	(93,50.0000,4),
	(94,45.0000,4),
	(95,45.0000,4),
	(96,35.0000,4),
	(97,60.0000,4),
	(98,60.0000,4),
	(99,60.0000,4),
	(100,60.0000,4),
	(101,38.0000,4),
	(102,38.0000,4),
	(103,50.0000,4),
	(104,50.0000,4),
	(105,35.0000,4),
	(106,35.0000,4),
	(107,35.0000,4),
	(108,35.0000,4),
	(109,40.0000,4),
	(110,35.0000,4),
	(111,38.0000,4),
	(112,35.0000,4),
	(113,60.0000,4),
	(114,60.0000,4),
	(115,40.0000,4),
	(116,40.0000,4),
	(117,40.0000,4),
	(118,45.0000,4),
	(119,45.0000,4),
	(120,45.0000,4),
	(121,50.0000,4),
	(122,50.0000,4),
	(123,45.0000,4),
	(124,52.0000,4),
	(125,56.0000,4),
	(126,75.0000,4),
	(127,75.0000,4),
	(128,75.0000,4),
	(129,75.0000,4),
	(130,79.0000,4),
	(131,79.0000,4),
	(132,165.0000,4),
	(133,165.0000,4),
	(134,175.0000,4),
	(135,175.0000,4),
	(136,45.0000,4),
	(137,88.0000,2),
	(138,35.0000,4),
	(139,35.0000,4),
	(140,35.0000,4),
	(141,95.0000,4),
	(142,95.0000,4),
	(143,10.0000,4),
	(144,10.0000,4),
	(145,75.0000,3),
	(147,38.0000,4),
	(148,45.0000,4),
	(149,45.0000,4),
	(150,60.0000,4),
	(151,60.0000,4),
	(152,60.0000,4),
	(153,60.0000,4),
	(154,38.0000,4),
	(155,38.0000,4),
	(156,50.0000,4),
	(157,50.0000,4),
	(158,35.0000,4),
	(159,35.0000,4),
	(160,35.0000,4),
	(161,35.0000,4),
	(162,40.0000,4),
	(163,35.0000,4),
	(164,60.0000,4),
	(165,60.0000,4),
	(166,45.0000,4),
	(167,45.0000,4),
	(168,45.0000,4),
	(169,50.0000,4),
	(170,50.0000,4),
	(171,52.0000,4),
	(172,56.0000,4),
	(173,75.0000,4),
	(174,75.0000,4),
	(175,75.0000,4),
	(176,75.0000,4),
	(177,79.0000,4),
	(178,79.0000,4),
	(179,35.0000,4),
	(180,35.0000,4),
	(181,35.0000,4),
	(182,95.0000,4),
	(183,95.0000,4),
	(184,110.0000,4),
	(185,260.0000,4),
	(186,120.0000,4),
	(187,60.0000,4),
	(188,50.0000,4),
	(189,50.0000,4),
	(190,17.0000,4),
	(191,14.0000,4),
	(192,14.0000,4),
	(193,14.0000,4),
	(194,14.0000,4),
	(195,14.0000,4),
	(196,14.0000,4),
	(197,100.0000,4),
	(198,10.0000,4),
	(199,10.0000,4),
	(200,10.0000,4),
	(201,10.0000,4),
	(202,10.0000,4),
	(203,70.0000,4),
	(204,800.0000,4),
	(205,30.0000,4),
	(206,30.0000,4),
	(207,30.0000,4),
	(208,30.0000,4),
	(209,30.0000,4),
	(210,30.0000,4),
	(211,30.0000,4),
	(212,30.0000,4),
	(213,30.0000,4),
	(214,30.0000,4),
	(215,30.0000,4),
	(216,30.0000,4),
	(217,45.0000,4),
	(218,30.0000,4),
	(219,30.0000,4),
	(220,45.0000,4),
	(221,30.0000,4),
	(222,35.0000,4),
	(223,13.0000,4),
	(224,27.0000,4),
	(225,35.0000,4),
	(226,35.0000,4),
	(227,35.0000,4),
	(228,35.0000,4),
	(229,25.0000,4),
	(230,25.0000,4),
	(231,35.0000,4),
	(232,25.0000,4),
	(233,10.0000,4),
	(234,35.0000,4),
	(235,35.0000,4),
	(236,35.0000,4),
	(237,35.0000,4),
	(238,35.0000,4),
	(239,15.0000,4),
	(240,15.0000,4),
	(241,17.0000,4),
	(242,15.0000,4),
	(243,17.0000,4),
	(244,15.0000,4),
	(245,17.0000,4),
	(246,19.0000,4),
	(247,21.0000,4),
	(248,19.0000,4),
	(249,19.0000,4),
	(250,19.0000,4),
	(251,27.0000,4),
	(252,15.0000,4),
	(253,15.0000,4),
	(255,10.0000,4);

/*!40000 ALTER TABLE `comcs_product_multycurr` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_product_multycurr_discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_multycurr_discount`;

CREATE TABLE `comcs_product_multycurr_discount` (
  `product_discount_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) DEFAULT NULL,
  `mc_price` decimal(15,4) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_discount_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_product_multycurr_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_multycurr_history`;

CREATE TABLE `comcs_product_multycurr_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateof` date NOT NULL,
  `user` varchar(32) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `kurs` decimal(15,4) DEFAULT NULL,
  `vendor` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_product_multycurr_history` WRITE;
/*!40000 ALTER TABLE `comcs_product_multycurr_history` DISABLE KEYS */;

INSERT INTO `comcs_product_multycurr_history` (`id`, `dateof`, `user`, `currency_id`, `kurs`, `vendor`, `total`)
VALUES
	(1,'2015-04-29','admin',3,56.9016,NULL,1),
	(2,'2015-04-29','admin',2,52.3041,NULL,1);

/*!40000 ALTER TABLE `comcs_product_multycurr_history` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_product_multycurr_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_multycurr_option`;

CREATE TABLE `comcs_product_multycurr_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_value_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `mc_price` decimal(15,4) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_product_multycurr_option` WRITE;
/*!40000 ALTER TABLE `comcs_product_multycurr_option` DISABLE KEYS */;

INSERT INTO `comcs_product_multycurr_option` (`id`, `product_option_value_id`, `product_id`, `mc_price`, `currency_id`)
VALUES
	(1,2015,103,10.0000,4),
	(2,2085,128,15.0000,4),
	(3,2132,137,15.0000,2),
	(4,2133,137,143.0000,2),
	(5,2164,145,20.0000,3),
	(6,2165,145,45.0000,3),
	(7,2167,147,7.0000,4),
	(8,2168,147,7.0000,4),
	(12,2198,157,10.0000,4);

/*!40000 ALTER TABLE `comcs_product_multycurr_option` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_product_multycurr_special
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_multycurr_special`;

CREATE TABLE `comcs_product_multycurr_special` (
  `product_special_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) DEFAULT NULL,
  `mc_price` decimal(15,4) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_special_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_product_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_option`;

CREATE TABLE `comcs_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_product_option` WRITE;
/*!40000 ALTER TABLE `comcs_product_option` DISABLE KEYS */;

INSERT INTO `comcs_product_option` (`product_option_id`, `product_id`, `option_id`, `option_value`, `required`)
VALUES
	(228,73,14,'',1),
	(231,75,14,'',1),
	(234,74,14,'',1),
	(233,76,14,'',1),
	(236,77,14,'',1),
	(238,78,14,'',1),
	(240,79,14,'',1),
	(242,80,14,'',1),
	(243,81,15,'',1),
	(244,82,15,'',1),
	(245,85,16,'',1),
	(246,86,17,'',1),
	(247,87,17,'',1),
	(248,88,18,'',1),
	(249,89,18,'',1),
	(250,90,18,'',1),
	(251,91,19,'',1),
	(252,91,18,'',1),
	(253,92,16,'',1),
	(254,97,16,'',1),
	(255,98,16,'',1),
	(256,101,16,'',1),
	(257,103,16,'',1),
	(258,105,16,'',1),
	(259,106,16,'',1),
	(260,111,17,'',1),
	(261,112,17,'',1),
	(262,113,16,'',1),
	(263,114,16,'',1),
	(264,115,16,'',1),
	(265,116,16,'',1),
	(266,117,16,'',1),
	(267,118,17,'',1),
	(268,119,17,'',1),
	(269,120,17,'',1),
	(317,121,21,'',1),
	(271,122,17,'',1),
	(272,124,17,'',1),
	(273,125,17,'',1),
	(274,126,17,'',1),
	(275,127,17,'',1),
	(276,128,17,'',1),
	(277,129,17,'',1),
	(278,130,17,'',1),
	(279,131,17,'',1),
	(280,132,17,'',1),
	(281,134,17,'',1),
	(282,135,17,'',1),
	(283,136,17,'',1),
	(284,137,20,'',1),
	(285,138,17,'',1),
	(286,139,17,'',1),
	(287,140,17,'',1),
	(288,141,17,'',1),
	(289,142,17,'',1),
	(290,143,17,'',1),
	(291,144,17,'',1),
	(292,145,20,'',1),
	(293,147,21,'',1),
	(294,150,21,'',1),
	(295,152,21,'',1),
	(297,154,21,'',1),
	(299,157,21,'',1),
	(301,158,21,'',1),
	(303,159,21,'',1),
	(304,161,21,'',1),
	(306,163,21,'',1),
	(308,164,21,'',1),
	(310,165,21,'',1),
	(312,166,21,'',1),
	(314,167,21,'',1),
	(316,168,21,'',1),
	(318,169,17,'',1),
	(320,170,21,'',1),
	(322,171,21,'',1),
	(324,172,21,'',1),
	(326,173,21,'',1),
	(328,174,21,'',1),
	(330,175,21,'',1),
	(332,176,21,'',1),
	(334,177,21,'',1),
	(336,178,21,'',1),
	(338,179,21,'',1),
	(340,180,21,'',1),
	(342,181,21,'',1),
	(344,182,21,'',1),
	(346,183,21,'',1),
	(347,190,22,'',1),
	(348,191,22,'',1),
	(350,192,22,'',1),
	(352,193,22,'',1),
	(354,194,22,'',1),
	(356,195,22,'',1),
	(358,196,22,'',1),
	(359,197,22,'',1),
	(360,198,22,'',1),
	(361,199,22,'',1),
	(362,202,22,'',1),
	(363,203,22,'',1),
	(364,205,22,'',1),
	(365,207,22,'',1),
	(366,219,22,'',1),
	(367,220,22,'',1),
	(368,222,22,'',1),
	(369,225,23,'',1),
	(370,227,23,'',1),
	(371,229,23,'',1),
	(374,237,23,'',1),
	(375,239,23,'',1);

/*!40000 ALTER TABLE `comcs_product_option` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_product_option_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_option_value`;

CREATE TABLE `comcs_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_product_option_value` WRITE;
/*!40000 ALTER TABLE `comcs_product_option_value` DISABLE KEYS */;

INSERT INTO `comcs_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`)
VALUES
	(1851,234,74,14,59,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1827,228,73,14,74,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1826,228,73,14,74,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1825,228,73,14,67,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1824,228,73,14,72,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1823,228,73,14,58,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1822,228,73,14,63,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1821,228,73,14,68,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1820,228,73,14,73,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1819,228,73,14,53,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1818,228,73,14,59,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1817,228,73,14,64,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1816,228,73,14,69,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1815,228,73,14,74,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1814,228,73,14,54,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1813,228,73,14,60,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1812,228,73,14,65,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1811,228,73,14,70,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1810,228,73,14,75,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1809,228,73,14,51,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1808,228,73,14,55,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1807,228,73,14,61,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1806,228,73,14,66,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1805,228,73,14,71,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1804,228,73,14,76,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1803,228,73,14,52,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1802,228,73,14,56,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1850,234,74,14,83,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1849,234,74,14,58,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1848,234,74,14,80,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1847,234,74,14,79,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1846,234,74,14,88,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2478,233,76,14,60,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2477,233,76,14,63,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2476,233,76,14,61,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2475,233,76,14,64,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2474,233,76,14,65,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2473,233,76,14,66,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2472,233,76,14,68,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2471,233,76,14,69,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2470,233,76,14,70,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2469,233,76,14,71,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2468,233,76,14,58,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2467,233,76,14,76,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2466,233,76,14,75,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2465,233,76,14,74,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2464,233,76,14,73,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1845,234,74,14,90,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1844,234,74,14,65,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1843,234,74,14,64,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1842,234,74,14,63,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1841,234,74,14,82,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1840,234,74,14,81,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1839,234,74,14,89,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1838,234,74,14,60,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1950,231,75,14,74,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1949,231,75,14,84,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1948,231,75,14,71,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1947,231,75,14,70,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1946,231,75,14,69,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1945,231,75,14,68,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1944,231,75,14,67,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1943,231,75,14,83,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1942,231,75,14,66,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1941,231,75,14,65,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1940,231,75,14,64,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1939,231,75,14,63,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1938,231,75,14,82,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1937,231,75,14,81,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1936,231,75,14,61,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1935,231,75,14,60,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1934,231,75,14,59,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1933,231,75,14,58,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1932,231,75,14,80,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1931,231,75,14,79,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1930,231,75,14,56,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1929,231,75,14,55,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1928,231,75,14,54,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1927,231,75,14,53,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1926,231,75,14,78,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1925,231,75,14,77,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1924,231,75,14,73,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1923,231,75,14,74,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1922,231,75,14,75,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1921,231,75,14,76,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1920,231,75,14,86,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1919,231,75,14,87,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2463,233,76,14,59,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1837,234,74,14,67,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1836,234,74,14,68,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1835,234,74,14,69,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1834,234,74,14,70,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1833,234,74,14,91,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1832,234,74,14,84,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1831,234,74,14,72,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1830,234,74,14,73,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1829,234,74,14,75,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1828,234,74,14,74,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1701,243,81,15,112,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1700,243,81,15,111,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1699,243,81,15,110,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1698,243,81,15,109,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1890,240,79,14,55,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1910,236,77,14,76,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1909,236,77,14,75,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1908,236,77,14,74,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1907,236,77,14,73,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1906,236,77,14,71,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1905,236,77,14,70,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1904,236,77,14,69,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1903,236,77,14,68,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1902,236,77,14,66,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1901,236,77,14,65,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1900,236,77,14,64,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1899,236,77,14,63,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1898,236,77,14,61,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1897,236,77,14,60,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1896,236,77,14,59,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1895,236,77,14,58,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1894,236,77,14,56,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1893,236,77,14,55,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1892,236,77,14,54,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1891,236,77,14,53,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1889,240,79,14,54,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1888,240,79,14,74,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1887,240,79,14,75,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1886,240,79,14,76,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1885,240,79,14,56,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1884,240,79,14,58,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1871,238,78,14,76,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1870,238,78,14,75,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1869,238,78,14,74,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1868,238,78,14,73,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1867,238,78,14,71,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1866,238,78,14,70,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1865,238,78,14,69,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1864,238,78,14,68,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1863,238,78,14,66,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1862,238,78,14,65,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1861,238,78,14,64,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1860,238,78,14,63,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1859,238,78,14,61,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1858,238,78,14,60,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1857,238,78,14,59,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1856,238,78,14,58,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1855,238,78,14,56,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1854,238,78,14,55,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1853,238,78,14,54,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1852,238,78,14,53,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1883,240,79,14,59,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1882,240,79,14,60,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1881,240,79,14,61,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1880,240,79,14,63,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1879,240,79,14,64,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1878,240,79,14,65,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1877,240,79,14,66,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1876,240,79,14,68,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1875,240,79,14,69,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1874,240,79,14,70,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1873,240,79,14,73,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1872,240,79,14,71,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1697,243,81,15,108,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1696,243,81,15,107,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1695,243,81,15,106,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1694,243,81,15,105,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1693,243,81,15,96,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1692,243,81,15,97,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1691,243,81,15,98,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1690,243,81,15,99,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1689,243,81,15,100,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1918,242,80,14,79,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1917,242,80,14,80,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1916,242,80,14,81,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1915,242,80,14,82,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1914,242,80,14,83,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1913,242,80,14,67,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1912,242,80,14,84,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1911,242,80,14,72,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1688,243,81,15,101,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1687,243,81,15,102,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1686,243,81,15,103,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1685,243,81,15,104,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1684,243,81,15,92,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1683,243,81,15,93,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1682,243,81,15,94,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1681,243,81,15,95,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1702,244,82,15,97,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1703,244,82,15,98,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1704,244,82,15,99,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1705,244,82,15,100,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1706,244,82,15,101,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1707,244,82,15,113,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1708,244,82,15,114,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1709,244,82,15,115,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1710,244,82,15,116,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1711,244,82,15,117,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1712,244,82,15,118,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1713,244,82,15,108,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1714,244,82,15,109,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1715,244,82,15,110,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1716,244,82,15,111,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1717,244,82,15,112,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1718,245,85,16,119,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1719,245,85,16,120,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1986,246,86,17,121,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1985,246,86,17,122,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1725,247,87,17,122,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1724,247,87,17,121,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1728,248,88,18,123,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1729,248,88,18,124,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1730,248,88,18,125,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1731,248,88,18,126,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1743,249,89,18,126,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1742,249,89,18,125,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1741,249,89,18,124,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1744,250,90,18,123,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1745,250,90,18,124,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1746,250,90,18,125,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1747,250,90,18,126,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1748,251,91,19,127,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1749,251,91,19,128,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1750,252,91,18,123,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1751,252,91,18,124,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1752,252,91,18,125,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1753,252,91,18,126,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1984,253,92,16,131,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1983,253,92,16,130,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1982,253,92,16,129,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1987,254,97,16,132,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1988,254,97,16,133,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1989,254,97,16,134,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1997,255,98,16,136,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(1996,255,98,16,135,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2013,256,101,16,140,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2012,256,101,16,139,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2011,256,101,16,138,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2010,256,101,16,137,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2014,257,103,16,141,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2015,257,103,16,142,0,0,480.0000,'+',0,'+',0.00000000,'+'),
	(2019,258,105,16,144,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2018,258,105,16,143,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2020,259,106,16,145,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2021,259,106,16,146,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2022,260,111,17,147,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2023,260,111,17,148,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2024,261,112,17,149,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2025,261,112,17,150,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2026,261,112,17,151,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2027,261,112,17,152,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2028,262,113,16,153,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2029,262,113,16,154,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2030,262,113,16,155,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2031,262,113,16,156,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2032,263,114,16,157,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2033,263,114,16,158,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2034,263,114,16,159,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2035,263,114,16,160,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2036,264,115,16,161,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2037,264,115,16,162,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2038,264,115,16,163,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2039,265,116,16,164,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2040,265,116,16,165,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2041,265,116,16,166,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2042,266,117,16,167,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2043,266,117,16,168,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2044,266,117,16,169,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2045,267,118,17,170,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2046,267,118,17,171,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2047,267,118,17,172,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2048,267,118,17,173,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2049,268,119,17,174,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2050,268,119,17,175,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2051,268,119,17,176,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2052,268,119,17,177,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2053,269,120,17,178,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2054,269,120,17,179,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2055,269,120,17,180,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2056,269,120,17,181,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2286,317,121,21,314,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2285,317,121,21,313,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2284,317,121,21,312,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2283,317,121,21,311,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2061,271,122,17,186,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2062,271,122,17,187,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2063,271,122,17,188,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2064,271,122,17,189,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2065,272,124,17,190,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2066,272,124,17,191,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2067,272,124,17,192,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2068,272,124,17,193,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2076,273,125,17,197,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2075,273,125,17,196,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2074,273,125,17,195,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2073,273,125,17,194,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2077,274,126,17,198,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2078,274,126,17,199,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2079,274,126,17,200,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2080,275,127,17,201,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2081,275,127,17,202,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2082,275,127,17,203,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2083,276,128,17,204,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2084,276,128,17,205,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2085,276,128,17,206,0,0,720.0000,'-',0,'+',0.00000000,'+'),
	(2091,277,129,17,209,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2090,277,129,17,208,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2089,277,129,17,207,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2097,278,130,17,212,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2096,278,130,17,211,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2095,278,130,17,210,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2098,279,131,17,213,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2099,279,131,17,214,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2100,279,131,17,215,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2108,280,132,17,219,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2107,280,132,17,218,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2106,280,132,17,217,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2105,280,132,17,216,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2116,281,134,17,223,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2115,281,134,17,222,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2114,281,134,17,221,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2113,281,134,17,220,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2124,282,135,17,227,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2123,282,135,17,226,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2122,282,135,17,225,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2121,282,135,17,224,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2125,283,136,17,228,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2126,283,136,17,229,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2127,283,136,17,230,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2128,283,136,17,231,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2129,283,136,17,232,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2130,283,136,17,233,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2131,284,137,20,234,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2132,284,137,20,235,0,0,784.5600,'+',0,'+',0.00000000,'+'),
	(2133,284,137,20,236,0,0,7479.4900,'+',0,'+',0.00000000,'+'),
	(2134,285,138,17,237,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2135,285,138,17,238,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2136,285,138,17,239,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2137,285,138,17,240,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2138,285,138,17,241,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2139,286,139,17,242,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2140,286,139,17,243,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2141,286,139,17,244,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2142,287,140,17,245,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2143,287,140,17,246,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2144,287,140,17,247,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2150,288,141,17,250,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2149,288,141,17,249,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2148,288,141,17,248,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2156,289,142,17,253,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2155,289,142,17,252,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2154,289,142,17,251,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2157,290,143,17,257,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2158,290,143,17,258,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2159,290,143,17,259,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2160,291,144,17,260,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2161,291,144,17,261,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2162,291,144,17,262,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2163,292,145,20,263,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2164,292,145,20,264,0,0,1138.0300,'+',0,'+',0.00000000,'+'),
	(2165,292,145,20,265,0,0,2560.5700,'+',0,'+',0.00000000,'+'),
	(2166,293,147,21,266,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2167,293,147,21,267,0,0,336.0000,'+',0,'+',0.00000000,'+'),
	(2168,293,147,21,268,0,0,336.0000,'+',0,'+',0.00000000,'+'),
	(2169,294,150,21,269,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2170,294,150,21,270,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2171,294,150,21,271,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2172,295,152,21,272,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2173,295,152,21,273,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2193,297,154,21,277,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2192,297,154,21,276,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2191,297,154,21,275,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2190,297,154,21,274,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2199,299,157,21,278,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2198,299,157,21,279,0,0,480.0000,'+',0,'+',0.00000000,'+'),
	(2203,301,158,21,281,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2202,301,158,21,280,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2207,303,159,21,283,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2206,303,159,21,282,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2208,304,161,21,284,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2209,304,161,21,285,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2210,304,161,21,286,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2218,306,163,21,290,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2217,306,163,21,289,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2216,306,163,21,288,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2215,306,163,21,287,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2230,308,164,21,294,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2229,308,164,21,293,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2228,308,164,21,292,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2227,308,164,21,291,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2246,310,165,21,298,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2245,310,165,21,297,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2244,310,165,21,296,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2243,310,165,21,295,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2258,312,166,21,302,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2257,312,166,21,301,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2256,312,166,21,300,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2255,312,166,21,299,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2266,314,167,21,306,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2265,314,167,21,305,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2264,314,167,21,304,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2263,314,167,21,303,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2278,316,168,21,310,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2277,316,168,21,309,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2276,316,168,21,308,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2275,316,168,21,307,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2287,318,169,17,182,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2288,318,169,17,183,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2289,318,169,17,184,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2290,318,169,17,185,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2298,320,170,21,318,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2297,320,170,21,317,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2296,320,170,21,316,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2295,320,170,21,315,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2318,326,173,21,327,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2305,322,171,21,321,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2304,322,171,21,320,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2303,322,171,21,319,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2312,324,172,21,324,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2311,324,172,21,323,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2310,324,172,21,322,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2317,326,173,21,326,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2316,326,173,21,325,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2324,328,174,21,330,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2323,328,174,21,329,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2322,328,174,21,328,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2340,334,177,21,337,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2329,330,175,21,332,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2328,330,175,21,331,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2334,332,176,21,334,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2333,332,176,21,333,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2339,334,177,21,336,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2338,334,177,21,335,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2346,336,178,21,340,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2345,336,178,21,339,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2344,336,178,21,338,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2355,338,179,21,341,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2354,338,179,21,342,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2353,338,179,21,343,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2370,340,180,21,344,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2369,340,180,21,345,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2368,340,180,21,346,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2367,340,180,21,347,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2366,340,180,21,348,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2376,342,181,21,351,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2375,342,181,21,350,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2374,342,181,21,349,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2391,344,182,21,352,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2390,344,182,21,353,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2389,344,182,21,354,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2394,346,183,21,357,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2393,346,183,21,356,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2392,346,183,21,355,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2395,347,190,22,359,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2396,347,190,22,358,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2397,347,190,22,360,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2398,348,191,22,361,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2399,348,191,22,362,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2400,348,191,22,363,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2401,348,191,22,364,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2402,348,191,22,365,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2417,350,192,22,370,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2416,350,192,22,369,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2415,350,192,22,368,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2414,350,192,22,367,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2413,350,192,22,366,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2432,352,193,22,371,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2431,352,193,22,372,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2430,352,193,22,373,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2429,352,193,22,374,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2428,352,193,22,375,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2442,354,194,22,380,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2441,354,194,22,379,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2440,354,194,22,378,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2439,354,194,22,377,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2438,354,194,22,376,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2452,356,195,22,385,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2451,356,195,22,384,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2450,356,195,22,383,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2449,356,195,22,382,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2448,356,195,22,381,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2462,358,196,22,390,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2461,358,196,22,389,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2460,358,196,22,388,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2459,358,196,22,387,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2458,358,196,22,386,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2479,359,197,22,391,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2480,359,197,22,392,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2481,359,197,22,393,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2482,359,197,22,394,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2483,360,198,22,395,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2484,360,198,22,396,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2485,361,199,22,397,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2486,361,199,22,398,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2487,362,202,22,399,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2488,362,202,22,400,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2489,363,203,22,401,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2490,363,203,22,402,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2491,363,203,22,403,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2492,363,203,22,404,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2493,363,203,22,405,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2494,363,203,22,406,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2495,363,203,22,407,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2496,363,203,22,408,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2497,363,203,22,409,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2498,363,203,22,410,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2499,364,205,22,411,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2500,364,205,22,412,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2504,365,207,22,414,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2503,365,207,22,413,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2505,366,219,22,415,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2506,366,219,22,416,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2510,367,220,22,418,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2509,367,220,22,417,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2511,368,222,22,419,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2512,368,222,22,420,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2513,369,225,23,421,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2514,369,225,23,422,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2515,369,225,23,423,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2516,369,225,23,424,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2517,370,227,23,425,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2518,370,227,23,426,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2519,370,227,23,427,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2520,370,227,23,428,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2521,371,229,23,429,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2522,371,229,23,430,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2523,371,229,23,431,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2524,371,229,23,432,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2536,374,237,23,436,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2535,374,237,23,435,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2534,374,237,23,434,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2533,374,237,23,433,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2544,375,239,23,440,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2543,375,239,23,439,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2542,375,239,23,438,0,0,0.0000,'+',0,'+',0.00000000,'+'),
	(2541,375,239,23,437,0,0,0.0000,'+',0,'+',0.00000000,'+');

/*!40000 ALTER TABLE `comcs_product_option_value` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_product_related
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_related`;

CREATE TABLE `comcs_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_product_related` WRITE;
/*!40000 ALTER TABLE `comcs_product_related` DISABLE KEYS */;

INSERT INTO `comcs_product_related` (`product_id`, `related_id`)
VALUES
	(74,209),
	(74,210),
	(74,211),
	(79,89),
	(80,83),
	(80,84),
	(80,93),
	(80,110),
	(80,212),
	(80,213),
	(81,254),
	(83,80),
	(84,80),
	(89,79),
	(93,80),
	(110,80),
	(112,242),
	(113,242),
	(114,242),
	(118,240),
	(118,241),
	(138,233),
	(139,231),
	(139,233),
	(209,74),
	(210,74),
	(211,74),
	(212,80),
	(213,80),
	(222,233),
	(231,139),
	(231,233),
	(233,138),
	(233,139),
	(233,222),
	(233,231),
	(233,234),
	(234,233),
	(240,118),
	(241,118),
	(242,112),
	(242,113),
	(242,114),
	(254,81);

/*!40000 ALTER TABLE `comcs_product_related` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_product_reward
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_reward`;

CREATE TABLE `comcs_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_product_reward` WRITE;
/*!40000 ALTER TABLE `comcs_product_reward` DISABLE KEYS */;

INSERT INTO `comcs_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`)
VALUES
	(945,76,1,0),
	(717,73,1,0),
	(718,74,1,0),
	(723,75,1,0),
	(722,80,1,0),
	(719,78,1,0),
	(720,79,1,0),
	(721,77,1,0),
	(696,81,1,0),
	(698,82,1,0),
	(700,83,1,0),
	(701,84,1,0),
	(702,85,1,0),
	(732,86,1,0),
	(706,87,1,0),
	(708,88,1,0),
	(712,89,1,0),
	(713,90,1,0),
	(714,91,1,0),
	(731,92,1,0),
	(733,93,1,0),
	(734,94,1,0),
	(735,95,1,0),
	(736,96,1,0),
	(737,97,1,0),
	(741,98,1,0),
	(742,99,1,0),
	(743,100,1,0),
	(752,101,1,0),
	(748,102,1,0),
	(754,103,1,0),
	(755,104,1,0),
	(757,105,1,0),
	(759,106,1,0),
	(763,107,1,0),
	(765,108,1,0),
	(766,109,1,0),
	(767,110,1,0),
	(768,111,1,0),
	(770,112,1,0),
	(771,113,1,0),
	(772,114,1,0),
	(773,115,1,0),
	(774,116,1,0),
	(775,117,1,0),
	(776,118,1,0),
	(777,119,1,0),
	(778,120,1,0),
	(879,121,1,0),
	(780,122,1,0),
	(781,123,1,0),
	(782,124,1,0),
	(784,125,1,0),
	(785,126,1,0),
	(786,127,1,0),
	(787,128,1,0),
	(789,129,1,0),
	(791,130,1,0),
	(792,131,1,0),
	(794,132,1,0),
	(795,133,1,0),
	(797,134,1,0),
	(799,135,1,0),
	(800,136,1,0),
	(805,137,1,0),
	(807,138,1,0),
	(809,139,1,0),
	(810,140,1,0),
	(814,141,1,0),
	(816,142,1,0),
	(818,143,1,0),
	(819,144,1,0),
	(822,145,1,0),
	(824,146,1,0),
	(825,147,1,0),
	(826,148,1,0),
	(827,149,1,0),
	(828,150,1,0),
	(830,151,1,0),
	(832,152,1,0),
	(833,153,1,0),
	(840,154,1,0),
	(841,155,1,0),
	(845,156,1,0),
	(848,157,1,0),
	(851,158,1,0),
	(854,159,1,0),
	(856,160,1,0),
	(858,161,1,0),
	(860,162,1,0),
	(862,163,1,0),
	(865,164,1,0),
	(869,165,1,0),
	(872,166,1,0),
	(874,167,1,0),
	(877,168,1,0),
	(880,169,1,0),
	(884,170,1,0),
	(886,171,1,0),
	(889,172,1,0),
	(891,173,1,0),
	(893,174,1,0),
	(895,175,1,0),
	(897,176,1,0),
	(899,177,1,0),
	(901,178,1,0),
	(904,179,1,0),
	(907,180,1,0),
	(909,181,1,0),
	(914,182,1,0),
	(915,183,1,0),
	(918,184,1,0),
	(917,185,1,0),
	(919,186,1,0),
	(922,187,1,0),
	(923,188,1,0),
	(924,189,1,0),
	(926,190,1,0),
	(927,191,1,0),
	(931,192,1,0),
	(935,193,1,0),
	(938,194,1,0),
	(941,195,1,0),
	(944,196,1,0),
	(947,197,1,0),
	(948,198,1,0),
	(949,199,1,0),
	(950,200,1,0),
	(951,201,1,0),
	(952,202,1,0),
	(954,203,1,0),
	(955,204,1,0),
	(956,205,1,0),
	(957,206,1,0),
	(959,207,1,0),
	(960,208,1,0),
	(962,209,1,0),
	(963,210,1,0),
	(965,211,1,0),
	(966,212,1,0),
	(974,213,1,0),
	(968,214,1,0),
	(969,215,1,0),
	(970,216,1,0),
	(971,217,1,0),
	(972,218,1,0),
	(976,219,1,0),
	(979,220,1,0),
	(980,221,1,0),
	(981,222,1,0),
	(982,223,1,0),
	(983,224,1,0),
	(985,225,1,0),
	(986,226,1,0),
	(987,227,1,0),
	(988,228,1,0),
	(989,229,1,0),
	(990,230,1,0),
	(991,231,1,0),
	(992,232,1,0),
	(993,233,1,0),
	(994,234,1,0),
	(1002,235,1,0),
	(1004,236,1,0),
	(1005,237,1,0),
	(1007,238,1,0),
	(1009,239,1,0),
	(1010,240,1,0),
	(1011,241,1,0),
	(1012,242,1,0),
	(1013,243,1,0),
	(1014,244,1,0),
	(1015,245,1,0),
	(1016,246,1,0),
	(1017,247,1,0),
	(1018,248,1,0),
	(1019,249,1,0),
	(1020,250,1,0),
	(1021,251,1,0),
	(1022,252,1,0),
	(1023,253,1,0),
	(1024,254,1,0),
	(1025,255,1,0);

/*!40000 ALTER TABLE `comcs_product_reward` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_product_special
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_special`;

CREATE TABLE `comcs_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_product_to_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_to_category`;

CREATE TABLE `comcs_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_product_to_category` WRITE;
/*!40000 ALTER TABLE `comcs_product_to_category` DISABLE KEYS */;

INSERT INTO `comcs_product_to_category` (`product_id`, `category_id`, `main_category`)
VALUES
	(73,66,1),
	(74,66,1),
	(76,66,1),
	(77,67,1),
	(80,67,1),
	(78,67,1),
	(79,67,1),
	(75,66,1),
	(81,68,1),
	(82,68,1),
	(83,68,1),
	(84,68,1),
	(85,68,1),
	(86,68,1),
	(87,68,1),
	(88,69,1),
	(89,69,1),
	(90,69,1),
	(91,69,1),
	(92,71,1),
	(93,71,1),
	(94,71,1),
	(95,71,1),
	(96,71,1),
	(97,71,1),
	(98,71,1),
	(99,71,1),
	(100,71,1),
	(101,72,1),
	(102,72,1),
	(103,72,1),
	(104,72,1),
	(105,73,1),
	(106,73,1),
	(107,73,1),
	(108,73,1),
	(109,73,1),
	(110,73,1),
	(111,73,1),
	(112,74,1),
	(113,74,1),
	(114,74,1),
	(115,75,1),
	(116,75,1),
	(117,75,1),
	(118,76,1),
	(119,76,1),
	(120,76,1),
	(121,92,1),
	(122,76,1),
	(123,76,1),
	(124,77,1),
	(125,77,1),
	(126,77,1),
	(127,77,1),
	(128,77,1),
	(129,77,1),
	(130,77,1),
	(131,77,1),
	(132,78,1),
	(133,78,1),
	(134,78,1),
	(135,78,1),
	(136,79,1),
	(137,62,1),
	(138,81,1),
	(139,81,1),
	(140,81,1),
	(141,82,1),
	(142,82,1),
	(143,83,1),
	(144,83,1),
	(145,62,1),
	(146,62,1),
	(147,88,1),
	(148,88,1),
	(149,88,1),
	(150,88,1),
	(151,88,1),
	(152,88,1),
	(153,88,1),
	(154,89,1),
	(155,89,1),
	(156,89,1),
	(157,89,1),
	(158,90,1),
	(159,90,1),
	(160,90,1),
	(161,90,1),
	(162,90,1),
	(163,91,1),
	(164,91,1),
	(165,91,1),
	(166,92,1),
	(167,92,1),
	(168,92,1),
	(169,76,1),
	(170,92,1),
	(171,93,1),
	(172,93,1),
	(173,93,1),
	(174,93,1),
	(175,93,1),
	(176,93,1),
	(177,93,1),
	(178,93,1),
	(179,94,1),
	(180,94,1),
	(181,94,1),
	(182,95,1),
	(183,95,1),
	(184,96,1),
	(185,96,1),
	(186,96,1),
	(188,96,1),
	(187,96,1),
	(189,96,1),
	(190,96,1),
	(191,96,1),
	(192,96,1),
	(193,96,1),
	(194,96,1),
	(195,96,1),
	(196,96,1),
	(197,100,1),
	(198,100,1),
	(199,100,1),
	(200,100,1),
	(201,100,1),
	(202,100,1),
	(203,100,1),
	(204,100,1),
	(205,101,1),
	(206,101,1),
	(207,101,1),
	(208,101,1),
	(209,101,1),
	(210,101,1),
	(211,101,1),
	(212,101,1),
	(213,101,1),
	(214,103,1),
	(215,103,1),
	(216,103,1),
	(217,103,1),
	(218,103,1),
	(219,102,1),
	(220,102,1),
	(221,102,1),
	(222,102,1),
	(223,102,1),
	(224,102,1),
	(225,106,1),
	(226,106,1),
	(227,106,1),
	(228,106,1),
	(229,106,1),
	(230,106,1),
	(231,106,1),
	(232,106,1),
	(233,106,1),
	(234,106,1),
	(236,107,1),
	(235,107,1),
	(237,107,1),
	(238,107,1),
	(239,108,1),
	(240,108,1),
	(241,108,1),
	(242,108,1),
	(243,108,1),
	(244,108,1),
	(245,108,1),
	(246,108,1),
	(247,108,1),
	(248,108,1),
	(249,108,1),
	(250,108,1),
	(251,108,1),
	(252,108,1),
	(253,108,1),
	(254,109,1),
	(255,109,1);

/*!40000 ALTER TABLE `comcs_product_to_category` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_product_to_download
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_to_download`;

CREATE TABLE `comcs_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_product_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_to_layout`;

CREATE TABLE `comcs_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_product_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_product_to_store`;

CREATE TABLE `comcs_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_product_to_store` WRITE;
/*!40000 ALTER TABLE `comcs_product_to_store` DISABLE KEYS */;

INSERT INTO `comcs_product_to_store` (`product_id`, `store_id`)
VALUES
	(73,0),
	(74,0),
	(75,0),
	(76,0),
	(77,0),
	(78,0),
	(79,0),
	(80,0),
	(81,0),
	(82,0),
	(83,0),
	(84,0),
	(85,0),
	(86,0),
	(87,0),
	(88,0),
	(89,0),
	(90,0),
	(91,0),
	(92,0),
	(93,0),
	(94,0),
	(95,0),
	(96,0),
	(97,0),
	(98,0),
	(99,0),
	(100,0),
	(101,0),
	(102,0),
	(103,0),
	(104,0),
	(105,0),
	(106,0),
	(107,0),
	(108,0),
	(109,0),
	(110,0),
	(111,0),
	(112,0),
	(113,0),
	(114,0),
	(115,0),
	(116,0),
	(117,0),
	(118,0),
	(119,0),
	(120,0),
	(121,0),
	(122,0),
	(123,0),
	(124,0),
	(125,0),
	(126,0),
	(127,0),
	(128,0),
	(129,0),
	(130,0),
	(131,0),
	(132,0),
	(133,0),
	(134,0),
	(135,0),
	(136,0),
	(137,0),
	(138,0),
	(139,0),
	(140,0),
	(141,0),
	(142,0),
	(143,0),
	(144,0),
	(145,0),
	(146,0),
	(147,0),
	(148,0),
	(149,0),
	(150,0),
	(151,0),
	(152,0),
	(153,0),
	(154,0),
	(155,0),
	(156,0),
	(157,0),
	(158,0),
	(159,0),
	(160,0),
	(161,0),
	(162,0),
	(163,0),
	(164,0),
	(165,0),
	(166,0),
	(167,0),
	(168,0),
	(169,0),
	(170,0),
	(171,0),
	(172,0),
	(173,0),
	(174,0),
	(175,0),
	(176,0),
	(177,0),
	(178,0),
	(179,0),
	(180,0),
	(181,0),
	(182,0),
	(183,0),
	(184,0),
	(185,0),
	(186,0),
	(187,0),
	(188,0),
	(189,0),
	(190,0),
	(191,0),
	(192,0),
	(193,0),
	(194,0),
	(195,0),
	(196,0),
	(197,0),
	(198,0),
	(199,0),
	(200,0),
	(201,0),
	(202,0),
	(203,0),
	(204,0),
	(205,0),
	(206,0),
	(207,0),
	(208,0),
	(209,0),
	(210,0),
	(211,0),
	(212,0),
	(213,0),
	(214,0),
	(215,0),
	(216,0),
	(217,0),
	(218,0),
	(219,0),
	(220,0),
	(221,0),
	(222,0),
	(223,0),
	(224,0),
	(225,0),
	(226,0),
	(227,0),
	(228,0),
	(229,0),
	(230,0),
	(231,0),
	(232,0),
	(233,0),
	(234,0),
	(235,0),
	(236,0),
	(237,0),
	(238,0),
	(239,0),
	(240,0),
	(241,0),
	(242,0),
	(243,0),
	(244,0),
	(245,0),
	(246,0),
	(247,0),
	(248,0),
	(249,0),
	(250,0),
	(251,0),
	(252,0),
	(253,0),
	(254,0),
	(255,0);

/*!40000 ALTER TABLE `comcs_product_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_rate_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_rate_comment`;

CREATE TABLE `comcs_rate_comment` (
  `comment_id` int(11) unsigned NOT NULL,
  `customer_id` int(11) unsigned NOT NULL,
  `delta` float(9,3) DEFAULT '0.000',
  KEY `comment_id` (`comment_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_rate_review
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_rate_review`;

CREATE TABLE `comcs_rate_review` (
  `review_id` int(11) unsigned NOT NULL,
  `customer_id` int(11) unsigned NOT NULL,
  `delta` float(9,3) DEFAULT '0.000',
  KEY `review_id` (`review_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record`;

CREATE TABLE `comcs_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_main` tinyint(1) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `weight` decimal(5,2) NOT NULL DEFAULT '0.00',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(5,2) NOT NULL DEFAULT '0.00',
  `width` decimal(5,2) NOT NULL DEFAULT '0.00',
  `height` decimal(5,2) NOT NULL DEFAULT '0.00',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `customer_group_id` int(2) NOT NULL,
  `comment` text NOT NULL,
  `comment_status` tinyint(1) NOT NULL,
  `comment_status_reg` tinyint(1) NOT NULL,
  `comment_status_now` tinyint(1) NOT NULL,
  `date_available` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_end` datetime NOT NULL DEFAULT '2033-03-03 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`),
  KEY `blog_main` (`blog_main`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_record` WRITE;
/*!40000 ALTER TABLE `comcs_record` DISABLE KEYS */;

INSERT INTO `comcs_record` (`record_id`, `blog_main`, `model`, `sku`, `upc`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `customer_group_id`, `comment`, `comment_status`, `comment_status_reg`, `comment_status_now`, `date_available`, `date_end`, `date_added`, `date_modified`, `viewed`)
VALUES
	(4,2,'','','','',0,0,'data/blog/sviazatsia-s-nami.jpg',0,1,0.0000,0,0,0.00,0,0.00,0.00,0.00,0,1,1,2,1,1,'a:8:{s:6:\"status\";s:1:\"1\";s:10:\"status_reg\";s:1:\"0\";s:10:\"status_now\";s:1:\"0\";s:6:\"rating\";s:1:\"1\";s:6:\"signer\";s:1:\"0\";s:5:\"order\";s:4:\"sort\";s:8:\"order_ad\";s:4:\"desc\";s:10:\"rating_num\";s:1:\"1\";}',0,0,0,'2015-03-23 09:19:50','2033-03-03 00:00:00','2015-03-23 05:30:25','2015-03-24 03:25:16',72),
	(3,2,'','','','',0,0,'data/blog/o-nas.jpg',0,1,0.0000,0,0,0.00,0,0.00,0.00,0.00,0,1,1,1,1,1,'a:8:{s:6:\"status\";s:1:\"1\";s:10:\"status_reg\";s:1:\"0\";s:10:\"status_now\";s:1:\"0\";s:6:\"rating\";s:1:\"1\";s:6:\"signer\";s:1:\"0\";s:5:\"order\";s:4:\"sort\";s:8:\"order_ad\";s:4:\"desc\";s:10:\"rating_num\";s:1:\"1\";}',0,0,0,'2015-03-19 11:49:27','2033-03-03 00:00:00','2015-03-19 07:52:49','2015-03-23 06:26:23',77),
	(5,2,'','','','',0,0,'data/blog/bankovskie-rekvizity.gif',0,1,0.0000,0,0,0.00,0,0.00,0.00,0.00,0,1,1,3,1,1,'a:8:{s:6:\"status\";s:1:\"1\";s:10:\"status_reg\";s:1:\"0\";s:10:\"status_now\";s:1:\"0\";s:6:\"rating\";s:1:\"0\";s:6:\"signer\";s:1:\"1\";s:5:\"order\";s:4:\"sort\";s:8:\"order_ad\";s:4:\"desc\";s:10:\"rating_num\";s:1:\"1\";}',0,0,0,'2015-03-24 07:32:54','2033-03-03 00:00:00','2015-03-24 03:47:50','0000-00-00 00:00:00',47);

/*!40000 ALTER TABLE `comcs_record` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_record_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_attribute`;

CREATE TABLE `comcs_record_attribute` (
  `record_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`record_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_record_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_description`;

CREATE TABLE `comcs_record_description` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sdescription` text NOT NULL,
  `description` text NOT NULL,
  `meta_h1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`record_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_record_description` WRITE;
/*!40000 ALTER TABLE `comcs_record_description` DISABLE KEYS */;

INSERT INTO `comcs_record_description` (`record_id`, `language_id`, `name`, `sdescription`, `description`, `meta_h1`, `meta_title`, `meta_description`, `meta_keyword`)
VALUES
	(3,1,'О нас','','&lt;!--noindex--&gt;\r\n&lt;p&gt;Интернет-магазин &quot;Имплантационные системы&quot; представлен компанией ООО &quot;АБИР-Плюс&quot;, которая уже несколько лет занимается поставками материалов, инструментов и оборудования для стоматологических клиник. &lt;/p&gt;\r\n&lt;!--/noindex--&gt;\r\n&lt;p&gt;Наш мультибрендовый интернет-магазин &quot;Имплантационные системы&quot; занимается реализацией в розницу широкого ассортимента товаров для &lt;strong&gt;стоматологической имплантации&lt;/strong&gt;, в частности стоматологических имплантатов, хирургических инструментов и сопутствующих материалов!&lt;/p&gt;\r\n&lt;p&gt;Мы тесно сотрудничаем и являемся эксклюзивными представителями производителя принципиально новой системы имплантатов Green Implant, система разработана в Израиле, но производство организовано в Германия. Продукция Green Implant System Tec сочетает в себе передовой опыт израильских научных разработок в области стоматологии и традиционное немецкое качество исполнения. Мы не только продаем имплантаты, но и регулярно организовываем обучающие семинары для стоматологов по работе с новыми имплантационными системами.&lt;/p&gt;\r\n&lt;p&gt;Мы только начали работы по развитию нашего интернет-магазина, но уже сейчас планируем представить в нем практически весь ассортимент самых известных производителей, разного класса и ценовой политики, чтобы каждый профессионал мог выбрать систему под свои критерии или приобрести уже проверенный лично вариант.&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Мы будем рады видеть Вас в числе наших клиентов или партнеров!&lt;/li&gt;\r\n&lt;li&gt;Мы всегда открыты для предложений по сотрудничеству!&lt;/li&gt;\r\n&lt;li&gt;Мы следим за ценами конкурентов, перед нами стоит задача не только представить продукцию, но и предложить выгодные цены!&lt;/li&gt;\r\n&lt;/ul&gt;',X'',X'','',''),
	(5,1,'Банковские реквизиты','','&lt;!--noindex--&gt;\r\n&lt;p&gt;\r\n&lt;strong&gt;Полное наименование&lt;/strong&gt; ООО &quot;АБИР-Плюс&quot;&lt;br /&gt;\r\n&lt;strong&gt;ОГРН&lt;/strong&gt; 1125476096272&lt;br /&gt;\r\n&lt;strong&gt;ИНН&lt;/strong&gt; 5402551920&lt;br /&gt;\r\n&lt;strong&gt;КПП&lt;/strong&gt; 540201001&lt;br /&gt;\r\n&lt;strong&gt;Юридический адрес&lt;/strong&gt; 630011, г. Новосибирск, ул. Кропоткина, д. 271 оф. 409&lt;br /&gt;\r\n&lt;strong&gt;Банковские реквизиты:&lt;/strong&gt;&lt;br /&gt;\r\n&lt;strong&gt;Банк&lt;/strong&gt; НФ ОАО &quot;Росгосстрах Банк&quot;&lt;br /&gt;\r\n&lt;strong&gt;К/сч&lt;/strong&gt; 30101810800000000794&lt;br /&gt;\r\n&lt;strong&gt;Р/сч&lt;/strong&gt; 40702810500030004707&lt;br /&gt;\r\n&lt;strong&gt;БИК&lt;/strong&gt; 045004794&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;!--/noindex--&gt;',X'',X'','',''),
	(4,1,'Связаться с нами','','&lt;!--noindex--&gt;\r\n&lt;form enctype=&quot;multipart/form-data&quot; method=&quot;post&quot; action=&quot;http://implantgroup.ru/contact-us/&quot;&gt;\r\n&lt;h2&gt;Наше местонахождение&lt;/h2&gt;\r\n&lt;div class=&quot;contact-info&quot;&gt;\r\n&lt;div class=&quot;content&quot;&gt;\r\n&lt;div class=&quot;left&quot;&gt;\r\n&lt;strong&gt;Адрес:&lt;/strong&gt;\r\n&lt;br /&gt;\r\nИмплантационные системы - интернет-магазин стоматологических имплантатов, инструментов и материалов для имплантации\r\n&lt;br /&gt;\r\n630011, г. Новосибирск, ул. Кропоткина, д. 271, оф. 409\r\n&lt;/div&gt;\r\n&lt;div class=&quot;right&quot;&gt;\r\n&lt;strong&gt;Телефон:&lt;/strong&gt;\r\n8 800 505-30-14\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!--/noindex--&gt;\r\n&lt;h2&gt;На карте&lt;/h2&gt;\r\n&lt;div class=&quot;content&quot;&gt;\r\n&lt;script type=&quot;text/javascript&quot; charset=&quot;utf-8&quot; src=&quot;//api-maps.yandex.ru/services/constructor/1.0/js/?sid=drKS_NIzNhUG8XPjAny-9Ykup_MUc3zc&amp;width=958&amp;height=400&quot;&gt;&lt;/script&gt;\r\n&lt;/div&gt;\r\n&lt;h2&gt;Написать нам&lt;/h2&gt;\r\n&lt;div class=&quot;content&quot;&gt;\r\n&lt;strong&gt;Ваше имя:&lt;/strong&gt;\r\n&lt;br /&gt;\r\n&lt;input type=&quot;text&quot; value=&quot;&quot; name=&quot;name&quot;&gt;\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;strong&gt;Ваш E-Mail:&lt;/strong&gt;\r\n&lt;br /&gt;\r\n&lt;input type=&quot;text&quot; value=&quot;&quot; name=&quot;email&quot;&gt;\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;strong&gt;Ваш вопрос:&lt;/strong&gt;\r\n&lt;br /&gt;\r\n&lt;textarea style=&quot;width: 99%;&quot; rows=&quot;10&quot; cols=&quot;40&quot; name=&quot;enquiry&quot;&gt;&lt;/textarea&gt;\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;strong&gt;Введите код, указанный на картинке:&lt;/strong&gt;\r\n&lt;br /&gt;\r\n&lt;input type=&quot;text&quot; value=&quot;&quot; name=&quot;captcha&quot;&gt;\r\n&lt;br /&gt;\r\n&lt;img alt=&quot;captcha&quot; src=&quot;index.php?route=information/contact/captcha&quot;&gt;\r\n&lt;br /&gt;\r\n&lt;div class=&quot;buttons&quot;&gt;\r\n&lt;div class=&quot;right&quot;&gt;\r\n&lt;input type=&quot;submit&quot; class=&quot;button&quot; value=&quot;Отправить&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/form&gt;',X'',X'','','');

/*!40000 ALTER TABLE `comcs_record_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_record_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_image`;

CREATE TABLE `comcs_record_image` (
  `record_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `options` text NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_record_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_option`;

CREATE TABLE `comcs_record_option` (
  `record_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`record_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_record_option_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_option_value`;

CREATE TABLE `comcs_record_option_value` (
  `record_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_option_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`record_option_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_record_product_related
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_product_related`;

CREATE TABLE `comcs_record_product_related` (
  `record_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_record_related
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_related`;

CREATE TABLE `comcs_record_related` (
  `record_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_record_reward
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_reward`;

CREATE TABLE `comcs_record_reward` (
  `record_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_record_special
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_special`;

CREATE TABLE `comcs_record_special` (
  `record_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`record_special_id`),
  KEY `record_id` (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_record_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_tag`;

CREATE TABLE `comcs_record_tag` (
  `record_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `tag` varchar(32) NOT NULL,
  PRIMARY KEY (`record_tag_id`),
  KEY `record_id` (`record_id`),
  KEY `language_id` (`language_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_record_to_blog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_to_blog`;

CREATE TABLE `comcs_record_to_blog` (
  `record_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_record_to_blog` WRITE;
/*!40000 ALTER TABLE `comcs_record_to_blog` DISABLE KEYS */;

INSERT INTO `comcs_record_to_blog` (`record_id`, `blog_id`)
VALUES
	(3,2),
	(4,2),
	(5,2);

/*!40000 ALTER TABLE `comcs_record_to_blog` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_record_to_download
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_to_download`;

CREATE TABLE `comcs_record_to_download` (
  `record_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_record_to_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_to_layout`;

CREATE TABLE `comcs_record_to_layout` (
  `record_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_record_to_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_record_to_store`;

CREATE TABLE `comcs_record_to_store` (
  `record_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_record_to_store` WRITE;
/*!40000 ALTER TABLE `comcs_record_to_store` DISABLE KEYS */;

INSERT INTO `comcs_record_to_store` (`record_id`, `store_id`)
VALUES
	(3,0),
	(4,0),
	(5,0);

/*!40000 ALTER TABLE `comcs_record_to_store` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_return
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_return`;

CREATE TABLE `comcs_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_return_action
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_return_action`;

CREATE TABLE `comcs_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_return_action` WRITE;
/*!40000 ALTER TABLE `comcs_return_action` DISABLE KEYS */;

INSERT INTO `comcs_return_action` (`return_action_id`, `language_id`, `name`)
VALUES
	(1,1,'Возвращены средства'),
	(2,1,'Выдан в кредит'),
	(3,1,'Отправлена замена (отправлен другой товар для замены)');

/*!40000 ALTER TABLE `comcs_return_action` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_return_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_return_history`;

CREATE TABLE `comcs_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_return_reason
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_return_reason`;

CREATE TABLE `comcs_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_return_reason` WRITE;
/*!40000 ALTER TABLE `comcs_return_reason` DISABLE KEYS */;

INSERT INTO `comcs_return_reason` (`return_reason_id`, `language_id`, `name`)
VALUES
	(1,1,'Получен/доставлен неисправным (сломанным)'),
	(2,1,'Получен не тот (ошибочный) товар'),
	(4,1,'Ошибочный, пожалуйста укажите/приложите подробности'),
	(5,1,'Другое (другая причина), пожалуйста укажите/приложите подробности');

/*!40000 ALTER TABLE `comcs_return_reason` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_return_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_return_status`;

CREATE TABLE `comcs_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_return_status` WRITE;
/*!40000 ALTER TABLE `comcs_return_status` DISABLE KEYS */;

INSERT INTO `comcs_return_status` (`return_status_id`, `language_id`, `name`)
VALUES
	(1,1,'Рассматриваемый / находящийся в '),
	(3,1,'Готов (к отправке) / или Заверше'),
	(2,1,'Заказ \"висит\" в ожидании поступл');

/*!40000 ALTER TABLE `comcs_return_status` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_review
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_review`;

CREATE TABLE `comcs_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `sorthex` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `rating_mark` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`),
  KEY `rating` (`rating`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_review_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_review_fields`;

CREATE TABLE `comcs_review_fields` (
  `review_id` int(11) NOT NULL,
  `mark` varchar(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  KEY `review_id` (`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_setting`;

CREATE TABLE `comcs_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_setting` WRITE;
/*!40000 ALTER TABLE `comcs_setting` DISABLE KEYS */;

INSERT INTO `comcs_setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`)
VALUES
	(8236,0,'shipping','shipping_sort_order','2',0),
	(8240,0,'sub_total','sub_total_sort_order','1',0),
	(8239,0,'sub_total','sub_total_status','1',0),
	(8238,0,'total','total_sort_order','3',0),
	(8237,0,'total','total_status','1',0),
	(8532,0,'bank_transfer','bank_transfer_total','',0),
	(8533,0,'bank_transfer','bank_transfer_order_status_id','2',0),
	(8534,0,'bank_transfer','bank_transfer_geo_zone_id','0',0),
	(8528,0,'cod','cod_geo_zone_id','4',0),
	(8527,0,'cod','cod_order_status_id','5',0),
	(8235,0,'shipping','shipping_status','1',0),
	(8234,0,'shipping','shipping_estimator','1',0),
	(7881,0,'special','special_module','a:1:{i:0;a:7:{s:5:\"limit\";s:1:\"4\";s:11:\"image_width\";s:2:\"80\";s:12:\"image_height\";s:2:\"80\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"0\";s:10:\"sort_order\";s:1:\"2\";}}',1),
	(7353,0,'carousel','carousel_module','a:1:{i:0;a:9:{s:9:\"banner_id\";s:2:\"11\";s:5:\"limit\";s:1:\"4\";s:6:\"scroll\";s:1:\"2\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"100\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:10:\"footer_new\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}',1),
	(7879,0,'featured','featured_product','77,78,79,80',0),
	(7880,0,'featured','featured_module','a:1:{i:0;a:7:{s:5:\"limit\";s:2:\"10\";s:11:\"image_width\";s:2:\"90\";s:12:\"image_height\";s:2:\"90\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}',1),
	(8233,0,'free','free_sort_order','2',0),
	(7878,0,'featured','product','Пл',0),
	(5091,0,'category','category_module','a:3:{i:0;a:4:{s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}i:1;a:4:{s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}i:2;a:4:{s:9:\"layout_id\";s:1:\"5\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}',1),
	(3159,0,'account','account_module','a:1:{i:0;a:4:{s:9:\"layout_id\";s:1:\"6\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}',1),
	(8495,0,'shoputils_rk','shoputils_rk_status','1',0),
	(8494,0,'shoputils_rk','shoputils_rk_sort_order','3',0),
	(8493,0,'shoputils_rk','shoputils_rk_geo_zone_id','0',0),
	(8489,0,'config','config_sms_gate_password','',0),
	(8488,0,'config','config_sms_gate_username','',0),
	(8484,0,'config','config_sms_from','',0),
	(8485,0,'config','config_sms_to','',0),
	(8486,0,'config','config_sms_copy','',0),
	(8487,0,'config','config_sms_message','',0),
	(8480,0,'config','config_google_analytics','',0),
	(8481,0,'config','config_google_api_key','',0),
	(8482,0,'config','config_sms_alert','0',0),
	(8483,0,'config','config_sms_gatename','testsms',0),
	(8477,0,'config','config_error_display','0',0),
	(8476,0,'config','config_compression','0',0),
	(8475,0,'config','config_encryption','01b9df692fd0d4c83947e68b2b062674',0),
	(8474,0,'config','config_password','0',0),
	(8473,0,'config','config_maintenance','0',0),
	(8478,0,'config','config_error_log','1',0),
	(8479,0,'config','config_error_filename','my_mego_log.log',0),
	(8467,0,'config','config_seo_url','1',0),
	(8245,0,'cartpopup','cartpopup_module','a:4:{i:0;a:4:{s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}i:1;a:4:{s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}i:2;a:4:{s:9:\"layout_id\";s:1:\"5\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}i:3;a:4:{s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}',1),
	(8526,0,'cod','cod_total','1000',0),
	(7339,0,'banner','banner_module','a:1:{i:0;a:7:{s:9:\"banner_id\";s:1:\"9\";s:5:\"width\";s:3:\"176\";s:6:\"height\";s:3:\"287\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"3\";}}',1),
	(7869,0,'multycurrgoods','currency_id4LastValue','48',0),
	(8468,0,'config','config_seo_url_type','seo_pro',0),
	(8469,0,'config','config_seo_url_include_path','0',0),
	(8470,0,'config','config_seo_url_postfix','/',0),
	(8471,0,'config','config_file_extension_allowed','txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods',0),
	(8472,0,'config','config_file_mime_allowed','text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet',0),
	(8466,0,'config','config_robots','abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg',0),
	(8464,0,'config','config_secure','0',0),
	(8465,0,'config','config_shared','0',0),
	(8463,0,'config','config_fraud_status_id','2',0),
	(8462,0,'config','config_fraud_score','',0),
	(8461,0,'config','config_fraud_key','',0),
	(8460,0,'config','config_fraud_detection','0',0),
	(8459,0,'config','config_alert_emails','',0),
	(8458,0,'config','config_account_mail','1',0),
	(8457,0,'config','config_alert_mail','1',0),
	(8456,0,'config','config_smtp_timeout','5',0),
	(8455,0,'config','config_smtp_port','465',0),
	(8454,0,'config','config_smtp_password','2113021130',0),
	(8453,0,'config','config_smtp_username','info@abirplus.ru',0),
	(8452,0,'config','config_smtp_host','smtp.yandex.ru',0),
	(8451,0,'config','config_mail_parameter','',0),
	(8448,0,'config','config_ftp_root','',0),
	(8449,0,'config','config_ftp_status','1',0),
	(8450,0,'config','config_mail_protocol','mail',0),
	(8447,0,'config','config_ftp_password','Jd#A@#yp4ivY1jw4I0cpq*aBFcqNAB6863ak3w@W',0),
	(8446,0,'config','config_ftp_username','implant_ftp',0),
	(8443,0,'config','config_image_cart_height','50',0),
	(8445,0,'config','config_ftp_port','21',0),
	(8444,0,'config','config_ftp_host','implantgroup.ru',0),
	(8442,0,'config','config_image_cart_width','50',0),
	(8441,0,'config','config_image_wishlist_height','50',0),
	(8440,0,'config','config_image_wishlist_width','50',0),
	(8437,0,'config','config_image_related_height','90',0),
	(8492,0,'smart_menu','smart_menu_module','a:1:{i:0;a:5:{s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"column_left\";s:6:\"config\";a:4:{s:10:\"color_Main\";s:7:\"#5A9451\";s:9:\"text_main\";s:7:\"#FFFFFF\";s:9:\"color_sub\";s:7:\"#DBDEE1\";s:8:\"Text_sub\";s:7:\"#333333\";}s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}',1),
	(8525,0,'pickup','pickup_sort_order','1',0),
	(8524,0,'pickup','pickup_status','1',0),
	(8523,0,'pickup','pickup_geo_zone_id','0',0),
	(8232,0,'free','free_status','1',0),
	(8231,0,'free','free_geo_zone_id','4',0),
	(8230,0,'free','free_total','1000',0),
	(8531,0,'bank_transfer','bank_transfer_bank_1','ООО &quot;АБИР-Плюс&quot;\r\nОГРН 1125476096272\r\nИНН 5402551920\r\nКПП 540201001\r\n630011, г. Новосибирск, ул. Кропоткина, дом 271 офис 409\r\nБанковсие реквизиты:\r\nНФ ОАО &quot;Росгосстрах Банк&quot;\r\nк/с 30101810800000000794\r\nр/с 40702810500030004707\r\nБИК 045004794',0),
	(3157,0,'google_sitemap','google_sitemap_status','1',0),
	(7875,0,'anylist','anylist_module','a:4:{i:0;a:16:{s:4:\"code\";s:0:\"\";s:9:\"titlelink\";s:0:\"\";s:5:\"title\";a:1:{i:1;s:25:\"Выгодная цена\";}s:6:\"latest\";s:1:\"0\";s:8:\"specials\";s:1:\"0\";s:8:\"products\";s:2:\"73\";s:9:\"sortfield\";s:0:\"\";s:5:\"width\";s:3:\"130\";s:6:\"height\";s:3:\"130\";s:5:\"limit\";s:1:\"1\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"date_start\";s:0:\"\";s:8:\"date_end\";s:0:\"\";s:10:\"sort_order\";s:1:\"1\";}i:1;a:16:{s:4:\"code\";s:0:\"\";s:9:\"titlelink\";s:0:\"\";s:5:\"title\";a:1:{i:1;s:14:\"Новинка\";}s:6:\"latest\";s:1:\"0\";s:8:\"specials\";s:1:\"0\";s:8:\"products\";s:2:\"76\";s:9:\"sortfield\";s:0:\"\";s:5:\"width\";s:3:\"130\";s:6:\"height\";s:3:\"130\";s:5:\"limit\";s:1:\"1\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"date_start\";s:0:\"\";s:8:\"date_end\";s:0:\"\";s:10:\"sort_order\";s:1:\"2\";}i:2;a:16:{s:4:\"code\";s:0:\"\";s:9:\"titlelink\";s:0:\"\";s:5:\"title\";a:1:{i:1;s:21:\"Лучшая цена\";}s:6:\"latest\";s:1:\"0\";s:8:\"specials\";s:1:\"0\";s:8:\"products\";s:2:\"74\";s:9:\"sortfield\";s:0:\"\";s:5:\"width\";s:3:\"130\";s:6:\"height\";s:3:\"130\";s:5:\"limit\";s:1:\"1\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"date_start\";s:0:\"\";s:8:\"date_end\";s:0:\"\";s:10:\"sort_order\";s:1:\"3\";}i:3;a:16:{s:4:\"code\";s:0:\"\";s:9:\"titlelink\";s:0:\"\";s:5:\"title\";a:1:{i:1;s:19:\"Хит продаж\";}s:6:\"latest\";s:1:\"0\";s:8:\"specials\";s:1:\"0\";s:8:\"products\";s:2:\"75\";s:9:\"sortfield\";s:0:\"\";s:5:\"width\";s:3:\"130\";s:6:\"height\";s:3:\"130\";s:5:\"limit\";s:1:\"1\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"date_start\";s:0:\"\";s:8:\"date_end\";s:0:\"\";s:10:\"sort_order\";s:1:\"4\";}}',1),
	(3298,0,'latest','latest_module','a:1:{i:0;a:7:{s:5:\"limit\";s:1:\"4\";s:11:\"image_width\";s:2:\"90\";s:12:\"image_height\";s:2:\"90\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"3\";}}',1),
	(5803,0,'blogversion','blog_version','4.34.5 (Commercial)',0),
	(3305,0,'welcome','welcome_module','a:1:{i:1;a:5:{s:11:\"description\";a:1:{i:1;s:509:\"&lt;p&gt;Мультибрендовый интернет-магазин &quot;Имплантационные системы&quot; занимается реализацией в розницу широкого ассортимента товаров для стоматологической имплантации, в частности стоматологических имплантатов, хирургических инструментов и сопутствующих материалов!&lt;/p&gt;\";}s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"2\";}}',1),
	(5801,0,'blogadmin','http_admin_path','http://implantgroup.ru/admin/',0),
	(5802,0,'blogadmin','https_admin_path','http://implantgroup.ru/admin/',0),
	(5835,0,'blog_options','generallist','a:4:{s:15:\"category_status\";s:1:\"0\";s:13:\"cache_widgets\";s:1:\"0\";s:13:\"review_visual\";s:1:\"0\";s:14:\"colorbox_theme\";s:1:\"0\";}',1),
	(7738,0,'we_menu','we_menu_class','',0),
	(7739,0,'we_menu','tpl_row','&lt;li&gt;&lt;span class=&quot;menu-sep&quot;&gt;&lt;/span&gt;&lt;a href=&quot;#href#&quot; class=&quot;menu-sep&quot; #attributes#&gt;#title#&lt;/a&gt;&lt;/li&gt;',0),
	(5834,0,'blog_options','blog_num_desc_pred','',0),
	(5828,0,'blog_options','blog_small','a:2:{s:5:\"width\";s:3:\"100\";s:6:\"height\";s:3:\"100\";}',1),
	(5833,0,'blog_options','blog_num_desc_words','',0),
	(5832,0,'blog_options','blog_num_desc','300',0),
	(8439,0,'config','config_image_compare_height','90',0),
	(8438,0,'config','config_image_compare_width','90',0),
	(8436,0,'config','config_image_related_width','90',0),
	(8435,0,'config','config_image_additional_height','50',0),
	(8434,0,'config','config_image_additional_width','50',0),
	(8433,0,'config','config_image_product_height','90',0),
	(8432,0,'config','config_image_product_width','90',0),
	(8431,0,'config','config_image_popup_height','500',0),
	(8430,0,'config','config_image_popup_width','500',0),
	(8429,0,'config','config_image_thumb_height','228',0),
	(8428,0,'config','config_image_thumb_width','228',0),
	(8427,0,'config','config_image_category_height','90',0),
	(8425,0,'config','config_icon','',0),
	(8426,0,'config','config_image_category_width','90',0),
	(8424,0,'config','config_logo','data/logo-600x133.png',0),
	(8423,0,'config','config_return_status_id','2',0),
	(7745,0,'slideshow','slideshow_module','a:1:{i:0;a:7:{s:9:\"banner_id\";s:2:\"10\";s:5:\"width\";s:3:\"590\";s:6:\"height\";s:3:\"250\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}',1),
	(8422,0,'config','config_return_id','0',0),
	(8421,0,'config','config_commission','0',0),
	(8420,0,'config','config_affiliate_id','0',0),
	(8419,0,'config','config_stock_status_id','8',0),
	(8418,0,'config','config_stock_checkout','1',0),
	(8417,0,'config','config_stock_warning','0',0),
	(8416,0,'config','config_stock_display','0',0),
	(8415,0,'config','config_complete_status_id','5',0),
	(8414,0,'config','config_order_status_id','1',0),
	(8413,0,'config','config_invoice_prefix','INV-2015-00',0),
	(8412,0,'config','config_order_edit','1',0),
	(8411,0,'config','config_checkout_id','0',0),
	(8410,0,'config','config_guest_checkout','1',0),
	(8409,0,'config','config_cart_weight','1',0),
	(7748,0,'man_block','man_block_module','a:3:{i:0;a:7:{s:5:\"limit\";s:3:\"100\";s:11:\"image_width\";s:3:\"130\";s:12:\"image_height\";s:3:\"130\";s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}i:1;a:7:{s:5:\"limit\";s:3:\"100\";s:11:\"image_width\";s:3:\"130\";s:12:\"image_height\";s:3:\"130\";s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}i:2;a:7:{s:5:\"limit\";s:3:\"100\";s:11:\"image_width\";s:3:\"130\";s:12:\"image_height\";s:3:\"130\";s:9:\"layout_id\";s:1:\"5\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}',1),
	(7742,0,'we_menu','we_menu_cache','a:3:{i:0;a:3:{s:7:\"tpl_row\";s:153:\"&lt;li&gt;&lt;span class=&quot;menu-sep&quot;&gt;&lt;/span&gt;&lt;a href=&quot;/&quot; class=&quot;menu-sep&quot; &gt;Главная&lt;/a&gt;&lt;/li&gt;\";s:11:\"tpl_row_act\";s:93:\"&lt;li&gt;&lt;a href=&quot;/&quot; class=&quot;&quot; &gt;Главная&lt;/a&gt;&lt;/li&gt;\";s:4:\"href\";s:1:\"/\";}i:1;a:3:{s:7:\"tpl_row\";s:180:\"&lt;li&gt;&lt;span class=&quot;menu-sep&quot;&gt;&lt;/span&gt;&lt;a href=&quot;/nasha-kompaniia/&quot; class=&quot;menu-sep&quot; &gt;Наша компания&lt;/a&gt;&lt;/li&gt;\";s:11:\"tpl_row_act\";s:120:\"&lt;li&gt;&lt;a href=&quot;/nasha-kompaniia/&quot; class=&quot;&quot; &gt;Наша компания&lt;/a&gt;&lt;/li&gt;\";s:4:\"href\";s:17:\"/nasha-kompaniia/\";}i:2;a:3:{s:7:\"tpl_row\";s:168:\"&lt;li&gt;&lt;span class=&quot;menu-sep&quot;&gt;&lt;/span&gt;&lt;a href=&quot;/sitemap/&quot; class=&quot;menu-sep&quot; &gt;Карта сайта&lt;/a&gt;&lt;/li&gt;\";s:11:\"tpl_row_act\";s:108:\"&lt;li&gt;&lt;a href=&quot;/sitemap/&quot; class=&quot;&quot; &gt;Карта сайта&lt;/a&gt;&lt;/li&gt;\";s:4:\"href\";s:9:\"/sitemap/\";}}',1),
	(7370,0,'tagcloud','tagcloud_title1','Облако тегов',0),
	(7371,0,'tagcloud','tagcloud_icon','0',0),
	(7372,0,'tagcloud','tagcloud_box','1',0),
	(7373,0,'tagcloud','tagcloud_limit','10',0),
	(7374,0,'tagcloud','tagcloud_min_font_size','12',0),
	(7375,0,'tagcloud','tagcloud_max_font_size','25',0),
	(7376,0,'tagcloud','tagcloud_module','a:4:{i:0;a:4:{s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"2\";}i:1;a:4:{s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"2\";}i:2;a:4:{s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"2\";}i:3;a:4:{s:9:\"layout_id\";s:1:\"5\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"2\";}}',1),
	(5660,0,'multycurrgoods','0','a:6:{s:10:\"round_mode\";i:0;s:8:\"reg_mail\";s:16:\"info@abirplus.ru\";s:9:\"reg_store\";s:217:\"Имплантационные системы - интернет-магазин стоматологических имплантатов, инструментов и материалов для имплантации\";s:7:\"reg_www\";s:15:\"implantgroup.ru\";s:6:\"reg_ip\";s:9:\"127.0.0.1\";s:8:\"reg_name\";s:47:\"Мультивалютные товары 1.5.5\";}',1),
	(5661,0,'multycurrgoods','round_mode','2',0),
	(5662,0,'multycurrgoods','save_mode','1',0),
	(8540,0,'multycurrgoods','currency_id2LastValue','52.3041',0),
	(8539,0,'multycurrgoods','currency_id3LastValue','56.9016',0),
	(5830,0,'blog_options','blog_num_records','10',0),
	(5734,0,'blog_widgets','mylist-what','blogs',0),
	(5735,0,'blog_widgets','mylist','a:1:{i:2;a:5:{s:4:\"type\";s:5:\"blogs\";s:17:\"title_list_latest\";a:1:{i:1;s:16:\"Страницы\";}s:6:\"avatar\";a:2:{s:5:\"width\";s:2:\"50\";s:6:\"height\";s:2:\"50\";}s:8:\"template\";s:0:\"\";s:5:\"blogs\";a:1:{i:0;s:1:\"2\";}}}',1),
	(5831,0,'blog_options','blog_num_comments','10',0),
	(5704,0,'search_suggestion','search_suggestion_options','a:7:{s:12:\"search_order\";s:4:\"name\";s:16:\"search_order_dir\";s:3:\"asc\";s:12:\"search_limit\";s:1:\"7\";s:12:\"search_logic\";s:2:\"or\";s:12:\"search_cache\";s:1:\"1\";s:12:\"search_where\";a:5:{s:4:\"name\";s:1:\"1\";s:4:\"tags\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:5:\"model\";s:1:\"1\";s:3:\"sku\";s:1:\"1\";}s:12:\"search_field\";a:4:{s:15:\"description_cut\";s:2:\"50\";s:14:\"attributes_cut\";s:2:\"50\";s:20:\"attributes_separator\";s:1:\"/\";s:10:\"attributes\";a:2:{i:12;a:2:{s:4:\"show\";s:1:\"0\";s:7:\"replace\";s:0:\"\";}i:13;a:2:{s:4:\"show\";s:1:\"0\";s:7:\"replace\";s:0:\"\";}}}}',1),
	(5705,0,'search_suggestion','search_suggestion_module','a:14:{i:0;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:2:\"12\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:1;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:2:\"13\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:2;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:2:\"14\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:3;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:1:\"6\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:4;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:5;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:2:\"11\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:6;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:1:\"9\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:7;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:8;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:1:\"8\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:9;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:1:\"7\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:10;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:2:\"10\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:11;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:1:\"4\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:12;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}i:13;a:4:{s:6:\"status\";s:1:\"1\";s:9:\"layout_id\";s:1:\"5\";s:8:\"position\";s:14:\"content_bottom\";s:10:\"sort_order\";s:1:\"0\";}}',1),
	(5745,0,'blog_schemes','blog_module','a:3:{i:0;a:5:{s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:4:\"what\";s:9:\"what_hook\";s:10:\"sort_order\";s:1:\"0\";}i:1;a:5:{s:9:\"layout_id\";s:2:\"13\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:4:\"what\";s:9:\"what_hook\";s:10:\"sort_order\";s:1:\"0\";}i:2;a:5:{s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"0\";s:4:\"what\";s:1:\"2\";s:10:\"sort_order\";s:1:\"1\";}}',1),
	(5829,0,'blog_options','blog_big','a:2:{s:5:\"width\";s:3:\"300\";s:6:\"height\";s:3:\"300\";}',1),
	(8408,0,'config','config_account_id','0',0),
	(8406,0,'config','config_customer_group_display','a:1:{i:0;s:1:\"1\";}',1),
	(8407,0,'config','config_customer_price','0',0),
	(8405,0,'config','config_customer_group_id','1',0),
	(8404,0,'config','config_customer_online','0',0),
	(8403,0,'config','config_tax_customer','',0),
	(8402,0,'config','config_tax_default','',0),
	(8401,0,'config','config_vat','0',0),
	(8400,0,'config','config_tax','0',0),
	(8399,0,'config','config_voucher_max','1000',0),
	(8398,0,'config','config_voucher_min','1',0),
	(8397,0,'config','config_download','1',0),
	(8396,0,'config','config_review_status','1',0),
	(8395,0,'config','config_product_count','0',0),
	(8393,0,'config','config_catalog_limit','10',0),
	(8394,0,'config','config_admin_limit','10',0),
	(8392,0,'config','config_weight_class_id','2',0),
	(8391,0,'config','config_length_class_id','2',0),
	(8390,0,'config','config_currency_auto','1',0),
	(8389,0,'config','config_currency','RUB',0),
	(8388,0,'config','config_admin_language','ru',0),
	(8383,0,'config','config_template','default',0),
	(8384,0,'config','config_layout_id','4',0),
	(8385,0,'config','config_country_id','176',0),
	(8386,0,'config','config_zone_id','2768',0),
	(8387,0,'config','config_language','ru',0),
	(8382,0,'config','config_meta_description','Интернет-магазин стоматологических имплантатов, инструментов и материалов для имплантации',0),
	(8380,0,'config','config_fax','',0),
	(8381,0,'config','config_title','Имплантационные системы',0),
	(8379,0,'config','config_telephone','8 800 505-30-14',0),
	(8375,0,'config','config_name','IMPLANTGROUP.RU',0),
	(8376,0,'config','config_owner','ООО &quot;АБИР-Плюс&quot;',0),
	(8377,0,'config','config_address','630011, г. Новосибирск, ул. Кропоткина, д. 271, оф. 409',0),
	(8378,0,'config','config_email','info@abirplus.ru',0),
	(7740,0,'we_menu','tpl_row_act','&lt;li&gt;&lt;a href=&quot;#href#&quot; class=&quot;#class#&quot; #attributes#&gt;#title#&lt;/a&gt;&lt;/li&gt;',0),
	(7741,0,'we_menu','we_menu','a:3:{i:0;a:7:{s:4:\"item\";s:14:\"Главная\";s:9:\"item_type\";s:10:\"clear_link\";s:9:\"item_link\";s:1:\"/\";s:5:\"class\";s:0:\"\";s:4:\"attr\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:11:\"item_enable\";s:2:\"on\";}i:1;a:7:{s:4:\"item\";s:25:\"Наша компания\";s:9:\"item_type\";s:10:\"clear_link\";s:9:\"item_link\";s:17:\"/nasha-kompaniia/\";s:5:\"class\";s:0:\"\";s:4:\"attr\";s:0:\"\";s:4:\"sort\";s:1:\"2\";s:11:\"item_enable\";s:2:\"on\";}i:2;a:7:{s:4:\"item\";s:21:\"Карта сайта\";s:9:\"item_type\";s:10:\"clear_link\";s:9:\"item_link\";s:9:\"/sitemap/\";s:5:\"class\";s:0:\"\";s:4:\"attr\";s:0:\"\";s:4:\"sort\";s:1:\"3\";s:11:\"item_enable\";s:2:\"on\";}}',1),
	(8258,0,'catapulta','catapulta_phone_mask_status','0',0),
	(8257,0,'catapulta','catapulta_phone_text','qwerty',0),
	(8256,0,'catapulta','catapulta_status','1',0),
	(8255,0,'catapulta','catapulta_email_status','1',0),
	(8259,0,'catapulta','catapulta_phone_mask','+9 (999) 999-99-99',0),
	(8496,0,'shoputils_rk','shoputils_rk_minimal_order','',0),
	(8497,0,'shoputils_rk','shoputils_rk_maximal_order','',0),
	(8498,0,'shoputils_rk','shoputils_rk_order_confirm_status_id','2',0),
	(8499,0,'shoputils_rk','shoputils_rk_order_status_id','1',0),
	(8500,0,'shoputils_rk','shoputils_rk_order_fail_status_id','10',0),
	(8501,0,'shoputils_rk','shoputils_rk_laterpay_mode','1',0),
	(8502,0,'shoputils_rk','shoputils_rk_order_later_status_id','2',0),
	(8503,0,'shoputils_rk','shoputils_rk_langdata','a:1:{i:1;a:6:{s:5:\"title\";s:9:\"Robokassa\";s:11:\"instruction\";s:497:\"Уважаемый покупатель! Просим Вас дождаться проверки заказа нашим менеджером перед оплатой. Это необходимо для подтверждения наличия товара на складе и возможности доставки в Ваш регион. После чего менеджер отправит Вам письмо со ссылкой на оплату заказа или перезвонит.\";s:29:\"mail_customer_success_subject\";s:61:\"Ваш заказ №{order_id} успешно оплачен\";s:29:\"mail_customer_success_content\";s:105:\"Уважаемый {customer_firstname} {customer_lastname}! Ваш заказ {order_id} оплачен.\";s:26:\"mail_customer_fail_subject\";s:77:\"Заказ №{order_id} отклонен платежной системой\";s:26:\"mail_customer_fail_content\";s:252:\"Уважаемый {customer_firstname} {customer_lastname}! К сожалению, заказ №{order_id} был отклонен платежной системой {date_modified}. Пожалуйста, повторите заказ еще раз.\";}}',1),
	(8504,0,'shoputils_rk','shoputils_rk_notify_customer_success','0',0),
	(8505,0,'shoputils_rk','shoputils_rk_notify_customer_fail','0',0),
	(8506,0,'shoputils_rk','shoputils_rk_notify_admin_success','1',0),
	(8507,0,'shoputils_rk','shoputils_rk_mail_admin_success_subject','Заказ №{order_id} оплачен',0),
	(8508,0,'shoputils_rk','shoputils_rk_mail_admin_success_content','Заказ №{order_id} оплачен {date_modified} на сумму {total}. Статус: {order_status}; Покупатель: {customer_firstname} {customer_lastname}; E-mail: {customer_email}; Телефон: {customer_telephone}',0),
	(8509,0,'shoputils_rk','shoputils_rk_notify_admin_fail','1',0),
	(8510,0,'shoputils_rk','shoputils_rk_mail_admin_fail_subject','Заказ №{order_id} был отклонен платежной системой',0),
	(8511,0,'shoputils_rk','shoputils_rk_mail_admin_fail_content','Заказ №{order_id} от {date_added} на сумму {total} был отклонен {date_modified}. Текущий статус заказа: {order_status}. ',0),
	(8512,0,'shoputils_rk','shoputils_rk_MerchantLogin','implantgroup',0),
	(8513,0,'shoputils_rk','shoputils_rk_MerchantPass1','dmg284skj-sdq364gbx',0),
	(8514,0,'shoputils_rk','shoputils_rk_MerchantPass2','dlp392bnw_ymk956cvb',0),
	(8515,0,'shoputils_rk','shoputils_rk_test_mode','0',0),
	(8516,0,'shoputils_rk','shoputils_rk_language','ru',0),
	(8517,0,'shoputils_rk','shoputils_rk_log_filename','shoputils_rk.log',0),
	(8518,0,'shoputils_rk','shoputils_rk_version','2.2',0),
	(8519,0,'shoputils_rk','shoputils_rk_log','2',0),
	(8529,0,'cod','cod_status','1',0),
	(8530,0,'cod','cod_sort_order','2',0),
	(8535,0,'bank_transfer','bank_transfer_status','1',0),
	(8536,0,'bank_transfer','bank_transfer_sort_order','1',0);

/*!40000 ALTER TABLE `comcs_setting` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_stock_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_stock_status`;

CREATE TABLE `comcs_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_stock_status` WRITE;
/*!40000 ALTER TABLE `comcs_stock_status` DISABLE KEYS */;

INSERT INTO `comcs_stock_status` (`stock_status_id`, `language_id`, `name`)
VALUES
	(7,1,'В наличии'),
	(8,1,'Предзаказ'),
	(5,1,'Нет в наличии'),
	(6,1,'Ожидание 2-3 дня');

/*!40000 ALTER TABLE `comcs_stock_status` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_store`;

CREATE TABLE `comcs_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_tax_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_tax_class`;

CREATE TABLE `comcs_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_tax_class` WRITE;
/*!40000 ALTER TABLE `comcs_tax_class` DISABLE KEYS */;

INSERT INTO `comcs_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`)
VALUES
	(9,'Налоги','Облагаемые налогом','2009-01-06 23:21:53','2011-03-09 21:17:10');

/*!40000 ALTER TABLE `comcs_tax_class` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_tax_rate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_tax_rate`;

CREATE TABLE `comcs_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_tax_rate` WRITE;
/*!40000 ALTER TABLE `comcs_tax_rate` DISABLE KEYS */;

INSERT INTO `comcs_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`)
VALUES
	(86,3,'НДС 18%',18.0000,'P','2011-03-09 21:17:10','2011-09-22 22:24:29'),
	(87,3,'Eco Tax (-2.00)',2.0000,'F','2011-09-21 21:49:23','2011-09-23 00:40:19');

/*!40000 ALTER TABLE `comcs_tax_rate` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_tax_rate_to_customer_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_tax_rate_to_customer_group`;

CREATE TABLE `comcs_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_tax_rate_to_customer_group` WRITE;
/*!40000 ALTER TABLE `comcs_tax_rate_to_customer_group` DISABLE KEYS */;

INSERT INTO `comcs_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`)
VALUES
	(86,1),
	(87,1);

/*!40000 ALTER TABLE `comcs_tax_rate_to_customer_group` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_tax_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_tax_rule`;

CREATE TABLE `comcs_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_tax_rule` WRITE;
/*!40000 ALTER TABLE `comcs_tax_rule` DISABLE KEYS */;

INSERT INTO `comcs_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`)
VALUES
	(121,10,86,'payment',1),
	(120,10,87,'store',0),
	(128,9,86,'shipping',1),
	(127,9,87,'shipping',2);

/*!40000 ALTER TABLE `comcs_tax_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_url_alias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_url_alias`;

CREATE TABLE `comcs_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`(64))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_url_alias` WRITE;
/*!40000 ALTER TABLE `comcs_url_alias` DISABLE KEYS */;

INSERT INTO `comcs_url_alias` (`url_alias_id`, `query`, `keyword`)
VALUES
	(810,'account/voucher','vouchers'),
	(809,'account/wishlist','wishlist'),
	(808,'account/account','my-account'),
	(807,'checkout/cart','cart'),
	(806,'checkout/checkout','checkout'),
	(805,'account/login','login'),
	(804,'account/logout','logout'),
	(803,'account/order','order-history'),
	(802,'account/newsletter','newsletter'),
	(801,'product/special','specials'),
	(800,'affiliate/account','affiliates'),
	(799,'checkout/voucher','gift-vouchers'),
	(798,'product/manufacturer','brands'),
	(797,'information/contact','contact-us'),
	(796,'account/return/insert','request-return'),
	(795,'information/sitemap','sitemap'),
	(794,'account/forgotten','forgot-password'),
	(793,'account/download','downloads'),
	(792,'account/return','returns'),
	(791,'account/transaction','transactions'),
	(790,'account/register','create-account'),
	(789,'product/compare','compare-products'),
	(788,'product/search','search'),
	(787,'account/edit','edit-account'),
	(786,'account/password','change-password'),
	(785,'account/address','address-book'),
	(784,'account/reward','reward-points'),
	(783,'affiliate/edit','edit-affiliate-account'),
	(782,'affiliate/password','change-affiliate-password'),
	(781,'affiliate/payment','affiliate-payment-options'),
	(780,'affiliate/tracking','affiliate-tracking-code'),
	(779,'affiliate/transaction','affiliate-transactions'),
	(778,'affiliate/logout','affiliate-logout'),
	(777,'affiliate/forgotten','affiliate-forgot-password'),
	(776,'affiliate/register','create-affiliate-account'),
	(775,'affiliate/login','affiliate-login'),
	(774,'common/home',''),
	(905,'category_id=62','biomaterialy'),
	(906,'category_id=61','khirurgicheskii-instrumentarii'),
	(907,'category_id=64','oborudovanie-dlia-implantatcii'),
	(910,'category_id=59','sistemy-implantatov'),
	(904,'category_id=60','proteticheskie-elementy'),
	(833,'manufacturer_id=11','implantatsionnye-sistemy-adin'),
	(832,'manufacturer_id=12','implantatsionnye-sistemy-ankylos'),
	(1135,'manufacturer_id=13','implantatsionnye-sistemy-astra'),
	(1032,'product_id=77','titanovyi-implantat-classic-plus'),
	(1128,'manufacturer_id=14','implantatsionnye-sistemy-mis'),
	(1130,'manufacturer_id=15','implantatsionnye-sistemy-nobel'),
	(1029,'product_id=74','titanovyi-implantat-vector'),
	(1131,'manufacturer_id=16','implantatsionnye-sistemy-roott'),
	(1132,'manufacturer_id=17','implantatsionnye-sistemy-straumann'),
	(1028,'product_id=73','titanovyi-implantat-classic'),
	(1133,'manufacturer_id=18','implantatsionnye-sistemy-xive'),
	(986,'category_id=65','implantaty-proizvodstva-green'),
	(1129,'manufacturer_id=19','implantatsionnye-sistemy-mozograu'),
	(1127,'manufacturer_id=20','implantatsionnye-sistemy-green'),
	(1030,'product_id=78','titanovyi-implantat-universal-plus'),
	(1031,'product_id=79','titanovyi-implantat-respect-plus'),
	(1033,'product_id=80','titanovyi-implantat-vector-plus'),
	(997,'category_id=66','implantaty-standartnye'),
	(996,'category_id=67','implantaty-plus'),
	(1011,'category_id=68','formirovateli-desny'),
	(1005,'product_id=81','vintovoi-lechebnyi-abatment'),
	(1007,'product_id=82','vintovoi-lechebnyi-abatment-plus'),
	(1009,'product_id=83','lechebnyi-vintovoi-titanovyi-abatment-dlia-vektor-plus'),
	(1010,'product_id=84','lechebnyi-zamkovyi-titanovyi-abatment-dlia-vektor-plus'),
	(1012,'product_id=85','lechebnyi-titanovyi-kolpachok-dlia-abatmenta'),
	(1043,'product_id=86','titanovyi-zaglushnyi-vint'),
	(1017,'product_id=87','titanovyi-zaglushnyi-vint-plus'),
	(1016,'category_id=69','prefiksy'),
	(1019,'product_id=88','prefiks-dlia-implantatov-plus'),
	(1023,'product_id=89','prefiks-dlia-implantatov-respect-plus'),
	(1024,'product_id=90','prefiks-dlia-implantatov-plus-slim'),
	(1025,'product_id=91','uglovoi-prefiks-dlia-implantatov-plus'),
	(1270,'category_id=70','protetika-proizvodstva-green'),
	(1027,'category_id=71','standartnye-abatmenty'),
	(1034,'product_id=75','titanovyi-implantat-universal'),
	(1271,'product_id=76','titanovyi-implantat-respect'),
	(1042,'product_id=92','priamoi-titanovyi-abatment'),
	(1044,'product_id=93','titanovyi-abatment-dlia-implantata-vector-plus'),
	(1045,'product_id=94','titanovyi-abatment-s-uzkoi-platformoi'),
	(1046,'product_id=95','vremennyi-titanovyi-abatment-dlia-kompozita'),
	(1047,'product_id=96','vintovoi-titanovyi-abatment'),
	(1048,'product_id=97','uglovoi-titanovyi-abatment-15'),
	(1052,'product_id=98','uglovoi-titanovyi-abatment-15-s-uzkoi-platformoi'),
	(1053,'product_id=99','uglovoi-titanovyi-abatment-25'),
	(1054,'product_id=100','uglovoi-titanovyi-abatment-25-s-uzkoi-platformoi'),
	(1055,'category_id=72','titanovye-abatmenty-dlia-frezerovki'),
	(1056,'category_id=73','plastikovye-abatmenty-dlia-litia'),
	(1057,'category_id=74','titanovye-abatmenty-dlia-odnomomentnoi-nagruzki'),
	(1058,'category_id=75','vremennye-plastikovye-abatmenty'),
	(1060,'category_id=76','titanovye-abatmenty-s-ustupom'),
	(1061,'category_id=77','anatomicheskie-abatmenty'),
	(1062,'category_id=78','tcirkonievye-abatmenty'),
	(1063,'category_id=79','abatmenty-s-sharovym-atachmentom'),
	(1064,'category_id=80','titanovye-abatmenty-lokatory'),
	(1066,'category_id=81','abatmenty-konnektory'),
	(1067,'category_id=82','uglovye-titanovye-adaptory'),
	(1068,'category_id=83','vinty-dlia-protezirovaniia'),
	(1073,'product_id=102','titanovyi-abatment-s-uzkoi-platformoi-dlia-frezerovki'),
	(1079,'product_id=103','universalnyi-uglovoi-abatment-15-dlia-frezerovki'),
	(1077,'product_id=101','priamoi-titanovyi-abatment-dlia-frezerovki'),
	(1080,'product_id=104','uglovoi-abatment-25-dlia-frezerovki'),
	(1082,'product_id=105','plastikovyi-abatment'),
	(1084,'product_id=106','plastikovyi-abatment-s-normalnoi-platformoi'),
	(1088,'product_id=107','plastikovyi-abatment-s-uzkoi-platformoi'),
	(1090,'product_id=108','plastikovyi-abatment-s-titanovym-bazisom'),
	(1091,'product_id=109','uglovoi-plastikovyi-abatment-15'),
	(1092,'product_id=110','plastikovyi-abatment-dlia-implantata-vektor-plius'),
	(1093,'product_id=111','moduliarnyi-plastikovyi-abatment'),
	(1095,'product_id=112','vintovoi-titanovyi-abatment-dlia-odnomomentnoi-nagruzki'),
	(1096,'product_id=113','uglovoj-titanovyj-abatment-15-dlja-odnomomentnoj-nagruzki'),
	(1097,'product_id=114','uglovoj-titanovyj-abatment-25-dlja-odnomomentnoj-nagruzki'),
	(1098,'product_id=115','plastikovyj-anatomicheskij-vremennyj-abatment'),
	(1099,'product_id=116','uglovoj-anatomicheskij-plastikovyj-vremennyj-abatment-15'),
	(1100,'product_id=117','vremennyj-uglovoj-plastikovyj-abatment-25'),
	(1101,'product_id=118','titanovyj-abatment'),
	(1102,'product_id=119','shirokij-titanovyj-abatment'),
	(1103,'product_id=120','titanovyj-abatment-s-uzkoj-platformoj'),
	(1105,'product_id=122','titanovyj-shirokij-ehsteticheskij-abatment'),
	(1106,'product_id=123','priamoi-titanovyi-zamkovyi-abatment'),
	(1107,'product_id=124','anatomicheskii-titanovyi-abatment'),
	(1109,'product_id=125','titanovyi-esteticheskii-anatomicheskii-abatment'),
	(1110,'product_id=126','uglovoi-anatomicheskii-titanovyi-abatment-15'),
	(1111,'product_id=127','uglovoi-anatomicheskii-titanovyi-abatment-25'),
	(1112,'product_id=128','uglovoi-anatomicheskii-titanovyi-abatment-15-s-uzkoi-platformoi'),
	(1114,'product_id=129','uglovoi-anatomicheskii-titanovyi-abatment-25-s-uzkoi-platformoi'),
	(1116,'product_id=130','uglovoi-anatomicheskii-esteticheskii-titanovyi-abatment-15'),
	(1117,'product_id=131','uglovoi-anatomicheskii-esteticheskii-titanovyi-abatment-25'),
	(1119,'product_id=132','tcirkonievyi-abatment'),
	(1120,'product_id=133','tcirkonievyi-shirokii-abatment'),
	(1122,'product_id=134','uglovoi-tcirkonievyi-abatment-15'),
	(1124,'product_id=135','uglovoi-tcirkonievyi-abatment-25'),
	(1125,'product_id=136','titanovyi-abatment-s-sharovym-atachmentom'),
	(1134,'manufacturer_id=21','implantatsionnye-sistemy-cortex'),
	(1136,'category_id=84','implantaty-proizvodstva-mozograu'),
	(1137,'category_id=85','implantaty-proizvodstva-cortex'),
	(1311,'category_id=86','protetika-proizvodstva-mozograu'),
	(1140,'category_id=87','protetika-proizvodstva-cortex'),
	(1145,'product_id=137','naturalnyi-kostnyi-material-graft-alpha-bio'),
	(1147,'product_id=138','titanovye-standartnye-vintovye-abatmenty-konnektory'),
	(1149,'product_id=139','titanovye-esteticheskie-vintovye-abatmenty-konnektory'),
	(1150,'product_id=140','titanovye-esteticheskie-zamkovye-abatmenty-konnektory'),
	(1154,'product_id=141','uglovoi-titanovyi-adaptor-17'),
	(1156,'product_id=142','uglovoi-titanovyi-adaptor-30'),
	(1158,'product_id=143','titanovyi-vint-dlia-abatmenta'),
	(1159,'product_id=144','titanovyi-sinii-vint-dlia-abatmenta'),
	(1162,'product_id=145','rezorbiruemaia-membrana-hypro-sorb'),
	(1164,'product_id=146','shovnyi-khirurgicheskii-material'),
	(1165,'category_id=88','standartnye-abatmenty-plus'),
	(1167,'category_id=89','titanovye-abatmenty-dlia-frezerovki-plus'),
	(1168,'category_id=90','plastikovye-abatmenty-dlia-litia-plus'),
	(1169,'category_id=91','titanovye-abatmenty-dlia-odnomomentnoi-nagruzki-plus'),
	(1170,'category_id=92','titanovye-abatmenty-s-ustupom-plus'),
	(1171,'category_id=93','anatomicheskie-abatmenty-plus'),
	(1172,'category_id=94','abatmenty-konnektory-plus'),
	(1173,'category_id=95','uglovye-titanovye-adaptory-plus'),
	(1174,'product_id=147','titanovyi-abatment-plus'),
	(1175,'product_id=148','titanovyi-abatment-plus-s-uzkoi-platformoi'),
	(1176,'product_id=149','vremennyi-abatment-dlia-kompozita-plus'),
	(1177,'product_id=150','uglovoi-titanovyi-abatment-15-plus'),
	(1179,'product_id=151','uglovoi-titanovyi-abatment-25-plus'),
	(1181,'product_id=152','uglovoi-titanovyi-abatment-15-plus-s-uzkoi-platformoi'),
	(1182,'product_id=153','uglovoi-titanovyi-abatment-25-plus-s-uzkoi-platformoi'),
	(1186,'product_id=154','priamoi-titanovyi-abatment-dlia-frezerovki-plus'),
	(1187,'product_id=155','titanovyi-abatment-s-uzkoi-platformoi-dlia-frezerovki-plus'),
	(1189,'product_id=156','uglovoi-abatment-25-dlia-frezerovki-plus'),
	(1191,'product_id=157','universalnyi-uglovoi-abatment-15-dlia-frezerovki-plus'),
	(1193,'product_id=158','plastikovyi-abatment-plus'),
	(1195,'product_id=159','plastikovyi-abatment-s-normalnoi-platformoi-plus'),
	(1196,'product_id=160','plastikovyi-abatment-s-uzkoi-platformoi-plus'),
	(1197,'product_id=161','plastikovyi-abatment-s-titanovym-bazisom-plus'),
	(1198,'product_id=162','uglovoi-plastikovyi-abatment-15-plus'),
	(1199,'product_id=163','vintovoi-titanovyi-abatment-dlia-odnomomentnoi-nagruzki-plus'),
	(1201,'product_id=164','uglovoj-titanovyj-abatment-15-dlja-odnomomentnoj-nagruzki-plus'),
	(1204,'product_id=165','uglovoj-titanovyj-abatment-25-dlja-odnomomentnoj-nagruzki-plus'),
	(1205,'product_id=166','titanovyj-abatment-plus'),
	(1206,'product_id=167','shirokij-titanovyj-abatment-plus'),
	(1208,'product_id=168','titanovyj-abatment-s-uzkoj-platformoj-plus'),
	(1210,'product_id=121','titanovyj-ehsteticheskij-abatment-plus'),
	(1211,'product_id=169','titanovyj-ehsteticheskij-abatment'),
	(1214,'product_id=170','titanovyj-shirokij-ehsteticheskij-abatment-plus'),
	(1215,'product_id=171','anatomicheskii-titanovyi-abatment-plus'),
	(1217,'product_id=172','titanovyi-esteticheskii-anatomicheskii-abatment-plus'),
	(1218,'product_id=173','uglovoi-anatomicheskii-titanovyi-abatment-15-plus'),
	(1219,'product_id=174','uglovoi-anatomicheskii-titanovyi-abatment-25-plus'),
	(1220,'product_id=175','uglovoi-anatomicheskii-titanovyi-abatment-15-s-uzkoi-platformoi-plus'),
	(1221,'product_id=176','uglovoi-anatomicheskii-titanovyi-abatment-25-s-uzkoi-platformoi-plus'),
	(1222,'product_id=177','uglovoi-anatomicheskii-esteticheskii-titanovyi-abatment-15-plus'),
	(1223,'product_id=178','uglovoi-anatomicheskii-esteticheskii-titanovyi-abatment-25-plus'),
	(1225,'product_id=179','titanovye-esteticheskie-zamkovye-abatmenty-konnektory-plus'),
	(1227,'product_id=180','titanovye-standartnye-vintovye-abatmenty-konnektory-plus'),
	(1228,'product_id=181','titanovye-esteticheskie-vintovye-abatmenty-konnektory-plus'),
	(1231,'product_id=182','uglovoi-titanovyi-adaptor-17-plus'),
	(1232,'product_id=183','uglovoi-titanovyi-adaptor-30-plus'),
	(1234,'category_id=97','dentalnye-instrumenty-green'),
	(1236,'category_id=98','dentalnye-instrumenty-mozograu'),
	(1237,'category_id=99','dentalnye-instrumenty-cortex'),
	(1239,'category_id=96','hirurgicheskie-instrumenty-green'),
	(1240,'category_id=100','prinadlezhnosti-dlya-kostnoj-plastiki'),
	(1241,'category_id=101','klyuchi-dlya-implantatov'),
	(1242,'category_id=102','klyuchi-dlya-vintov'),
	(1244,'category_id=103','klyuchi-dlya-abatmentov'),
	(1245,'category_id=104','sverla'),
	(1248,'product_id=184','odnostoronnij-klyuch-ratchet'),
	(1247,'product_id=185','klyuch-ratchet-universalnyj'),
	(1249,'product_id=186','hirurgicheskie-instrumenty'),
	(1252,'product_id=187','molotok-hirurgicheskij'),
	(1253,'product_id=188','izmeritel-glubiny-kostnogo-lozha-implantatov'),
	(1254,'product_id=189','izmeritel-desnevogo-kraya'),
	(1256,'product_id=190','titanovyj-izmeritel'),
	(1257,'product_id=191','ctopper-dlya-hirurgicheskih-kostnyh-drilej-dr20'),
	(1260,'product_id=192','ctopper-dlya-hirurgicheskih-kostnyh-drilej-dr28'),
	(1263,'product_id=193','ctopper-dlya-hirurgicheskih-kostnyh-drilej-dr32'),
	(1265,'product_id=194','ctopper-dlya-hirurgicheskih-kostnyh-drilej-dr37'),
	(1267,'product_id=195','ctopper-dlya-hirurgicheskih-kostnyh-drilej-dr42'),
	(1269,'product_id=196','ctopper-dlya-hirurgicheskih-kostnyh-drilej-dr52'),
	(1273,'product_id=197','sverlo-trefajn'),
	(1274,'product_id=198','titanovyj-vint-shestigrannyj'),
	(1275,'product_id=199','titanovyj-vint-kruglyj'),
	(1276,'product_id=200','krepezhnyj-titanovyj-vint-shestigrannyj'),
	(1277,'product_id=201','krepezhnyj-titanovyj-vint-kruglyj'),
	(1278,'product_id=202','krepezhnyj-titanovyj-pin'),
	(1280,'product_id=203','osteotomy'),
	(1281,'product_id=204','nabor-osteotomov'),
	(1282,'product_id=205','shestigrannyj-klyuch-21mmd'),
	(1283,'product_id=206','shestigrannyj-klyuch-21mmd-dlya-uglovogo-nakonechnika'),
	(1285,'product_id=207','shestigrannyj-klyuch-25mmd'),
	(1286,'product_id=208','shestigrannyj-klyuch-25mmd-dlya-uglovogo-nakonechnika'),
	(1288,'product_id=209','polyj-klyuch-dlya-uglovogo-nakonechnika-21mmd'),
	(1289,'product_id=210','polyj-klyuch-21mmd'),
	(1291,'product_id=211','adaptor-dlya-implantata-vektor-21mmd'),
	(1292,'product_id=212','polyj-klyuch-dlya-uglovogo-nakonechnika-27mmd'),
	(1300,'product_id=213','polyj-klyuch-27mmd'),
	(1294,'product_id=214','klyuch-dlya-uderzhaniya-abatmentov'),
	(1295,'product_id=215','klyuch-dlya-izvlecheniya-zashchyolkivayushchegosya-abatmenta'),
	(1296,'product_id=216','shestigrannyj-klyuch-1-77-mmd'),
	(1297,'product_id=217','ruchnoj-shestigrannyj-klyuch-1-77-mmd'),
	(1298,'product_id=218','shestigrannyj-klyuch-dlya-uglovogo-nakonechnika-1-77-mmd'),
	(1302,'product_id=219','shestigrannyj-klyuch-1-25-mmd'),
	(1305,'product_id=220','ruchnoj-shestigrannyj-klyuch-1-25-mmd'),
	(1306,'product_id=221','shestigrannyj-klyuch-dlya-uglovogo-nakonechnika-1-25-mmd'),
	(1307,'product_id=222','universalnyj-shestigrannyj-klyuch-1-25-mmd'),
	(1308,'product_id=223','laboratornyj-shestigrannyj-klyuch-1-25-mmd'),
	(1309,'product_id=224','laboratornyj-shestigrannyj-klyuch-1-25-mmd-dlinnyj'),
	(1312,'category_id=105','aksessuary-proizvodstva-green'),
	(1313,'category_id=106','transfery'),
	(1314,'category_id=107','transfery-plus'),
	(1315,'category_id=108','analogi-abatmentov-i-implantov'),
	(1316,'category_id=109','vremennye-koronki'),
	(1318,'product_id=225','vintovoj-transfer-dlya-zakrytoj-lozhki'),
	(1319,'product_id=226','vintovoj-transfer-dlya-zakrytoj-lozhki-s-uzkoj-platformoj'),
	(1320,'product_id=227','vintovoj-transfer-dlya-otkrytoj-lozhki'),
	(1321,'product_id=228','vintovoj-transfer-dlya-otkrytoj-lozhki-s-uzkoj-platformoj'),
	(1322,'product_id=229','transfer-s-klipsoj-dlya-zakrytoj-lozhki'),
	(1323,'product_id=230','transfer-s-klipsoj-dlya-zakrytoj-lozhki-s-uzkoj-platformoj'),
	(1324,'product_id=231','transfer-ehsteticheskogo-abatmenta-dlya-otkrytoj-lozhki'),
	(1325,'product_id=232','transfer-ehsteticheskogo-abatmenta-dlya-zakrytoj-lozhki'),
	(1326,'product_id=233','dlinyj-vint-dlya-transfera-abatmenta'),
	(1327,'product_id=234','titanovyj-rukav-transfer'),
	(1332,'product_id=235','vintovoj-transfer-dlya-zakrytoj-lozhki-plus'),
	(1334,'product_id=236','vintovoj-transfer-dlya-zakrytoj-lozhki-s-uzkoj-platformoj-plus'),
	(1335,'product_id=237','vintovoj-transfer-dlya-otkrytoj-lozhki-plus'),
	(1336,'product_id=238','vintovoj-transfer-dlya-otkrytoj-lozhki-s-uzkoj-platformoj-plus'),
	(1338,'product_id=239','analog-implantata-s-vnutrennim-shestigrannikom'),
	(1339,'product_id=240','analog-titanovogo-abatmenta-1-4'),
	(1340,'product_id=241','individualnyj-analog-frezerovannogo-titanovogo-abatmenta-1-4'),
	(1341,'product_id=242','analog-titanovogo-abatmenta-dlya-odnomomentnoj-nagruzki'),
	(1342,'product_id=243','analog-frezerovannogo-abatmenta-dlya-nemedlennoj-nagruzki'),
	(1343,'product_id=244','analog-shirokogo-titanovogo-abatmenta-2-4'),
	(1344,'product_id=245','individualnyj-analog-frezerovannogo-titanovogo-abatmenta-2-4'),
	(1345,'product_id=246','analog-titanovogo-anatomicheskogo-abatmenta'),
	(1346,'product_id=247','individualnyj-analog-frezerovannogo-anatomicheskogo-abatmenta'),
	(1347,'product_id=248','analog-uglovogo-15-titanovogo-anatomicheskogo-abatmenta'),
	(1348,'product_id=249','analog-uglovogo-25-titanovogo-anatomicheskogo-abatmenta'),
	(1349,'product_id=250','analog-titanovogo-abatmenta-s-sharikovym-atachmentom'),
	(1350,'product_id=251','analog-titanovogo-lokator-abatmenta'),
	(1351,'product_id=252','analog-standartnogo-vintovogo-abatmenta-konnektora'),
	(1352,'product_id=253','analog-ehsteticheskogo-vintovogo-abatmenta-konnektora'),
	(1353,'product_id=254','plastmassovyj-nositel-abatmenta-implantata'),
	(1354,'product_id=255','plastikovyj-kolpachok-dlya-vremennogo-protezirovaniya');

/*!40000 ALTER TABLE `comcs_url_alias` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_url_alias_blog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_url_alias_blog`;

CREATE TABLE `comcs_url_alias_blog` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_url_alias_blog` WRITE;
/*!40000 ALTER TABLE `comcs_url_alias_blog` DISABLE KEYS */;

INSERT INTO `comcs_url_alias_blog` (`url_alias_id`, `query`, `keyword`)
VALUES
	(65,'blog_id=2','nasha-kompaniia'),
	(60,'record_id=4','sviazatsia-s-nami'),
	(44,'record_id=3','o-nas'),
	(61,'record_id=5','bankovskie-rekvizity');

/*!40000 ALTER TABLE `comcs_url_alias_blog` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_user`;

CREATE TABLE `comcs_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_user` WRITE;
/*!40000 ALTER TABLE `comcs_user` DISABLE KEYS */;

INSERT INTO `comcs_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `code`, `ip`, `status`, `date_added`)
VALUES
	(1,1,'admin','60cc3bc70c3f6583017dbbf88c0935da6f51cffd','09bbc4f6a','admin','admin','info@abirplus.ru','','::1',1,'2015-02-27 00:46:55');

/*!40000 ALTER TABLE `comcs_user` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_user_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_user_group`;

CREATE TABLE `comcs_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_user_group` WRITE;
/*!40000 ALTER TABLE `comcs_user_group` DISABLE KEYS */;

INSERT INTO `comcs_user_group` (`user_group_id`, `name`, `permission`)
VALUES
	(1,'Главный администратор','a:2:{s:6:\"access\";a:149:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:12:\"catalog/blog\";i:3;s:17:\"catalog/catapulta\";i:4;s:16:\"catalog/category\";i:5;s:15:\"catalog/comment\";i:6;s:16:\"catalog/download\";i:7;s:14:\"catalog/filter\";i:8;s:19:\"catalog/information\";i:9;s:20:\"catalog/manufacturer\";i:10;s:14:\"catalog/option\";i:11;s:15:\"catalog/product\";i:12;s:14:\"catalog/record\";i:13;s:14:\"catalog/review\";i:14;s:18:\"common/filemanager\";i:15;s:14:\"common/seoblog\";i:16;s:13:\"design/banner\";i:17;s:19:\"design/custom_field\";i:18;s:13:\"design/layout\";i:19;s:14:\"extension/feed\";i:20;s:17:\"extension/manager\";i:21;s:16:\"extension/module\";i:22;s:17:\"extension/payment\";i:23;s:18:\"extension/shipping\";i:24;s:15:\"extension/total\";i:25;s:16:\"feed/google_base\";i:26;s:19:\"feed/google_sitemap\";i:27;s:20:\"localisation/country\";i:28;s:21:\"localisation/currency\";i:29;s:21:\"localisation/geo_zone\";i:30;s:21:\"localisation/language\";i:31;s:25:\"localisation/length_class\";i:32;s:25:\"localisation/order_status\";i:33;s:26:\"localisation/return_action\";i:34;s:26:\"localisation/return_reason\";i:35;s:26:\"localisation/return_status\";i:36;s:25:\"localisation/stock_status\";i:37;s:22:\"localisation/tax_class\";i:38;s:21:\"localisation/tax_rate\";i:39;s:25:\"localisation/weight_class\";i:40;s:17:\"localisation/zone\";i:41;s:14:\"module/account\";i:42;s:16:\"module/affiliate\";i:43;s:14:\"module/anylist\";i:44;s:13:\"module/banner\";i:45;s:17:\"module/bestseller\";i:46;s:11:\"module/blog\";i:47;s:15:\"module/carousel\";i:48;s:16:\"module/cartpopup\";i:49;s:16:\"module/catapulta\";i:50;s:15:\"module/category\";i:51;s:16:\"module/csvimport\";i:52;s:15:\"module/featured\";i:53;s:13:\"module/filter\";i:54;s:18:\"module/google_talk\";i:55;s:18:\"module/information\";i:56;s:13:\"module/latest\";i:57;s:16:\"module/man_block\";i:58;s:21:\"module/multycurrgoods\";i:59;s:24:\"module/search_suggestion\";i:60;s:16:\"module/slideshow\";i:61;s:17:\"module/smart_menu\";i:62;s:14:\"module/special\";i:63;s:12:\"module/store\";i:64;s:15:\"module/tagcloud\";i:65;s:14:\"module/we_menu\";i:66;s:14:\"module/welcome\";i:67;s:14:\"octeam/toolset\";i:68;s:18:\"octeam_tools/dummy\";i:69;s:32:\"octeam_tools/seo_keyword_checker\";i:70;s:24:\"payment/authorizenet_aim\";i:71;s:21:\"payment/bank_transfer\";i:72;s:14:\"payment/cheque\";i:73;s:11:\"payment/cod\";i:74;s:21:\"payment/free_checkout\";i:75;s:22:\"payment/klarna_account\";i:76;s:22:\"payment/klarna_invoice\";i:77;s:14:\"payment/liqpay\";i:78;s:20:\"payment/moneybookers\";i:79;s:14:\"payment/nochex\";i:80;s:15:\"payment/paymate\";i:81;s:16:\"payment/paypoint\";i:82;s:13:\"payment/payza\";i:83;s:26:\"payment/perpetual_payments\";i:84;s:14:\"payment/pp_pro\";i:85;s:17:\"payment/pp_pro_uk\";i:86;s:19:\"payment/pp_standard\";i:87;s:15:\"payment/sagepay\";i:88;s:22:\"payment/sagepay_direct\";i:89;s:18:\"payment/sagepay_us\";i:90;s:20:\"payment/shoputils_rk\";i:91;s:19:\"payment/twocheckout\";i:92;s:28:\"payment/web_payment_software\";i:93;s:16:\"payment/worldpay\";i:94;s:27:\"report/affiliate_commission\";i:95;s:22:\"report/customer_credit\";i:96;s:22:\"report/customer_online\";i:97;s:21:\"report/customer_order\";i:98;s:22:\"report/customer_reward\";i:99;s:24:\"report/product_purchased\";i:100;s:21:\"report/product_viewed\";i:101;s:18:\"report/sale_coupon\";i:102;s:17:\"report/sale_order\";i:103;s:18:\"report/sale_return\";i:104;s:20:\"report/sale_shipping\";i:105;s:15:\"report/sale_tax\";i:106;s:14:\"sale/affiliate\";i:107;s:12:\"sale/contact\";i:108;s:11:\"sale/coupon\";i:109;s:13:\"sale/customer\";i:110;s:20:\"sale/customer_ban_ip\";i:111;s:19:\"sale/customer_group\";i:112;s:10:\"sale/order\";i:113;s:11:\"sale/return\";i:114;s:12:\"sale/voucher\";i:115;s:18:\"sale/voucher_theme\";i:116;s:15:\"setting/setting\";i:117;s:13:\"setting/store\";i:118;s:16:\"shipping/auspost\";i:119;s:17:\"shipping/citylink\";i:120;s:14:\"shipping/fedex\";i:121;s:13:\"shipping/flat\";i:122;s:13:\"shipping/free\";i:123;s:13:\"shipping/item\";i:124;s:23:\"shipping/parcelforce_48\";i:125;s:15:\"shipping/pickup\";i:126;s:19:\"shipping/royal_mail\";i:127;s:12:\"shipping/ups\";i:128;s:13:\"shipping/usps\";i:129;s:15:\"shipping/weight\";i:130;s:9:\"tool/ajax\";i:131;s:11:\"tool/backup\";i:132;s:14:\"tool/error_log\";i:133;s:11:\"tool/export\";i:134;s:15:\"tool/fileupload\";i:135;s:11:\"tool/import\";i:136;s:12:\"total/coupon\";i:137;s:12:\"total/credit\";i:138;s:14:\"total/handling\";i:139;s:16:\"total/klarna_fee\";i:140;s:19:\"total/low_order_fee\";i:141;s:12:\"total/reward\";i:142;s:14:\"total/shipping\";i:143;s:15:\"total/sub_total\";i:144;s:9:\"total/tax\";i:145;s:11:\"total/total\";i:146;s:13:\"total/voucher\";i:147;s:9:\"user/user\";i:148;s:20:\"user/user_permission\";}s:6:\"modify\";a:149:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:12:\"catalog/blog\";i:3;s:17:\"catalog/catapulta\";i:4;s:16:\"catalog/category\";i:5;s:15:\"catalog/comment\";i:6;s:16:\"catalog/download\";i:7;s:14:\"catalog/filter\";i:8;s:19:\"catalog/information\";i:9;s:20:\"catalog/manufacturer\";i:10;s:14:\"catalog/option\";i:11;s:15:\"catalog/product\";i:12;s:14:\"catalog/record\";i:13;s:14:\"catalog/review\";i:14;s:18:\"common/filemanager\";i:15;s:14:\"common/seoblog\";i:16;s:13:\"design/banner\";i:17;s:19:\"design/custom_field\";i:18;s:13:\"design/layout\";i:19;s:14:\"extension/feed\";i:20;s:17:\"extension/manager\";i:21;s:16:\"extension/module\";i:22;s:17:\"extension/payment\";i:23;s:18:\"extension/shipping\";i:24;s:15:\"extension/total\";i:25;s:16:\"feed/google_base\";i:26;s:19:\"feed/google_sitemap\";i:27;s:20:\"localisation/country\";i:28;s:21:\"localisation/currency\";i:29;s:21:\"localisation/geo_zone\";i:30;s:21:\"localisation/language\";i:31;s:25:\"localisation/length_class\";i:32;s:25:\"localisation/order_status\";i:33;s:26:\"localisation/return_action\";i:34;s:26:\"localisation/return_reason\";i:35;s:26:\"localisation/return_status\";i:36;s:25:\"localisation/stock_status\";i:37;s:22:\"localisation/tax_class\";i:38;s:21:\"localisation/tax_rate\";i:39;s:25:\"localisation/weight_class\";i:40;s:17:\"localisation/zone\";i:41;s:14:\"module/account\";i:42;s:16:\"module/affiliate\";i:43;s:14:\"module/anylist\";i:44;s:13:\"module/banner\";i:45;s:17:\"module/bestseller\";i:46;s:11:\"module/blog\";i:47;s:15:\"module/carousel\";i:48;s:16:\"module/cartpopup\";i:49;s:16:\"module/catapulta\";i:50;s:15:\"module/category\";i:51;s:16:\"module/csvimport\";i:52;s:15:\"module/featured\";i:53;s:13:\"module/filter\";i:54;s:18:\"module/google_talk\";i:55;s:18:\"module/information\";i:56;s:13:\"module/latest\";i:57;s:16:\"module/man_block\";i:58;s:21:\"module/multycurrgoods\";i:59;s:24:\"module/search_suggestion\";i:60;s:16:\"module/slideshow\";i:61;s:17:\"module/smart_menu\";i:62;s:14:\"module/special\";i:63;s:12:\"module/store\";i:64;s:15:\"module/tagcloud\";i:65;s:14:\"module/we_menu\";i:66;s:14:\"module/welcome\";i:67;s:14:\"octeam/toolset\";i:68;s:18:\"octeam_tools/dummy\";i:69;s:32:\"octeam_tools/seo_keyword_checker\";i:70;s:24:\"payment/authorizenet_aim\";i:71;s:21:\"payment/bank_transfer\";i:72;s:14:\"payment/cheque\";i:73;s:11:\"payment/cod\";i:74;s:21:\"payment/free_checkout\";i:75;s:22:\"payment/klarna_account\";i:76;s:22:\"payment/klarna_invoice\";i:77;s:14:\"payment/liqpay\";i:78;s:20:\"payment/moneybookers\";i:79;s:14:\"payment/nochex\";i:80;s:15:\"payment/paymate\";i:81;s:16:\"payment/paypoint\";i:82;s:13:\"payment/payza\";i:83;s:26:\"payment/perpetual_payments\";i:84;s:14:\"payment/pp_pro\";i:85;s:17:\"payment/pp_pro_uk\";i:86;s:19:\"payment/pp_standard\";i:87;s:15:\"payment/sagepay\";i:88;s:22:\"payment/sagepay_direct\";i:89;s:18:\"payment/sagepay_us\";i:90;s:20:\"payment/shoputils_rk\";i:91;s:19:\"payment/twocheckout\";i:92;s:28:\"payment/web_payment_software\";i:93;s:16:\"payment/worldpay\";i:94;s:27:\"report/affiliate_commission\";i:95;s:22:\"report/customer_credit\";i:96;s:22:\"report/customer_online\";i:97;s:21:\"report/customer_order\";i:98;s:22:\"report/customer_reward\";i:99;s:24:\"report/product_purchased\";i:100;s:21:\"report/product_viewed\";i:101;s:18:\"report/sale_coupon\";i:102;s:17:\"report/sale_order\";i:103;s:18:\"report/sale_return\";i:104;s:20:\"report/sale_shipping\";i:105;s:15:\"report/sale_tax\";i:106;s:14:\"sale/affiliate\";i:107;s:12:\"sale/contact\";i:108;s:11:\"sale/coupon\";i:109;s:13:\"sale/customer\";i:110;s:20:\"sale/customer_ban_ip\";i:111;s:19:\"sale/customer_group\";i:112;s:10:\"sale/order\";i:113;s:11:\"sale/return\";i:114;s:12:\"sale/voucher\";i:115;s:18:\"sale/voucher_theme\";i:116;s:15:\"setting/setting\";i:117;s:13:\"setting/store\";i:118;s:16:\"shipping/auspost\";i:119;s:17:\"shipping/citylink\";i:120;s:14:\"shipping/fedex\";i:121;s:13:\"shipping/flat\";i:122;s:13:\"shipping/free\";i:123;s:13:\"shipping/item\";i:124;s:23:\"shipping/parcelforce_48\";i:125;s:15:\"shipping/pickup\";i:126;s:19:\"shipping/royal_mail\";i:127;s:12:\"shipping/ups\";i:128;s:13:\"shipping/usps\";i:129;s:15:\"shipping/weight\";i:130;s:9:\"tool/ajax\";i:131;s:11:\"tool/backup\";i:132;s:14:\"tool/error_log\";i:133;s:11:\"tool/export\";i:134;s:15:\"tool/fileupload\";i:135;s:11:\"tool/import\";i:136;s:12:\"total/coupon\";i:137;s:12:\"total/credit\";i:138;s:14:\"total/handling\";i:139;s:16:\"total/klarna_fee\";i:140;s:19:\"total/low_order_fee\";i:141;s:12:\"total/reward\";i:142;s:14:\"total/shipping\";i:143;s:15:\"total/sub_total\";i:144;s:9:\"total/tax\";i:145;s:11:\"total/total\";i:146;s:13:\"total/voucher\";i:147;s:9:\"user/user\";i:148;s:20:\"user/user_permission\";}}'),
	(10,'Менеджер','');

/*!40000 ALTER TABLE `comcs_user_group` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_voucher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_voucher`;

CREATE TABLE `comcs_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_voucher_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_voucher_history`;

CREATE TABLE `comcs_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы comcs_voucher_theme
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_voucher_theme`;

CREATE TABLE `comcs_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_voucher_theme` WRITE;
/*!40000 ALTER TABLE `comcs_voucher_theme` DISABLE KEYS */;

INSERT INTO `comcs_voucher_theme` (`voucher_theme_id`, `image`)
VALUES
	(8,'data/demo/canon_eos_5d_2.jpg'),
	(7,'data/demo/gift-voucher-birthday.jpg'),
	(6,'data/demo/apple_logo.jpg');

/*!40000 ALTER TABLE `comcs_voucher_theme` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_voucher_theme_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_voucher_theme_description`;

CREATE TABLE `comcs_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_voucher_theme_description` WRITE;
/*!40000 ALTER TABLE `comcs_voucher_theme_description` DISABLE KEYS */;

INSERT INTO `comcs_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`)
VALUES
	(6,1,'Рождество'),
	(7,1,'День рождения'),
	(8,1,'Основной');

/*!40000 ALTER TABLE `comcs_voucher_theme_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_weight_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_weight_class`;

CREATE TABLE `comcs_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_weight_class` WRITE;
/*!40000 ALTER TABLE `comcs_weight_class` DISABLE KEYS */;

INSERT INTO `comcs_weight_class` (`weight_class_id`, `value`)
VALUES
	(1,1.00000000),
	(2,1000.00000000);

/*!40000 ALTER TABLE `comcs_weight_class` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_weight_class_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_weight_class_description`;

CREATE TABLE `comcs_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_weight_class_description` WRITE;
/*!40000 ALTER TABLE `comcs_weight_class_description` DISABLE KEYS */;

INSERT INTO `comcs_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`)
VALUES
	(1,1,'Килограммы','кг'),
	(2,1,'Граммы','г');

/*!40000 ALTER TABLE `comcs_weight_class_description` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_zone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_zone`;

CREATE TABLE `comcs_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_zone` WRITE;
/*!40000 ALTER TABLE `comcs_zone` DISABLE KEYS */;

INSERT INTO `comcs_zone` (`zone_id`, `country_id`, `name`, `code`, `status`)
VALUES
	(1,1,'Бадахшан','BDS',1),
	(2,1,'Бадгис','BDG',1),
	(3,1,'Баглан','BGL',1),
	(4,1,'Балх','BAL',1),
	(5,1,'Бамиан','BAM',1),
	(6,1,'Фарах','FRA',1),
	(7,1,'Фарьяб','FYB',1),
	(8,1,'Газни','GHA',1),
	(9,1,'Гор','GHO',1),
	(10,1,'Гильменд','HEL',1),
	(11,1,'Герат','HER',1),
	(12,1,'Джаузджан','JOW',1),
	(13,1,'Кабул','KAB',1),
	(14,1,'Кандагар','KAN',1),
	(15,1,'Каписа','KAP',1),
	(16,1,'Хост','KHO',1),
	(17,1,'Кунар','KNR',1),
	(18,1,'Кундуз','KDZ',1),
	(19,1,'Лагман','LAG',1),
	(20,1,'Логар','LOW',1),
	(21,1,'Нангархар','NAN',1),
	(22,1,'Нимроз','NIM',1),
	(23,1,'Нуристан','NUR',1),
	(24,1,'Урузган','ORU',1),
	(25,1,'Пактия','PIA',1),
	(26,1,'Пактика','PKA',1),
	(27,1,'Парван','PAR',1),
	(28,1,'Саманган','SAM',1),
	(29,1,'Сари-Пуль','SAR',1),
	(30,1,'Тахар','TAK',1),
	(31,1,'Вардак','WAR',1),
	(32,1,'Забуль','ZAB',1),
	(33,2,'Берат','BR',1),
	(34,2,'Булькиза','BU',1),
	(35,2,'Дельвина','DL',1),
	(36,2,'Девол','DV',1),
	(37,2,'Дибра','DI',1),
	(38,2,'Дуррес','DR',1),
	(39,2,'Эльбасан','EL',1),
	(40,2,'Колёня','ER',1),
	(41,2,'Фиери','FR',1),
	(42,2,'Гирокастра','GJ',1),
	(43,2,'Грамши','GR',1),
	(44,2,'Хас','HA',1),
	(45,2,'Кавая','KA',1),
	(46,2,'Курбин','KB',1),
	(47,2,'Кучова','KC',1),
	(48,2,'Корча','KO',1),
	(49,2,'Круя','KR',1),
	(50,2,'Кукес','KU',1),
	(51,2,'Либражди','LB',1),
	(52,2,'Лежа','LE',1),
	(53,2,'Люшня','LU',1),
	(54,2,'Мальси-э-Мади','MM',1),
	(55,2,'Малакастра','MK',1),
	(56,2,'Мати','MT',1),
	(57,2,'Мирдита','MR',1),
	(58,2,'Пекини','PQ',1),
	(59,2,'Пермети','PR',1),
	(60,2,'Поградец','PG',1),
	(61,2,'Пука','PU',1),
	(62,2,'Шкодер','SH',1),
	(63,2,'Скрапари','SK',1),
	(64,2,'Саранда','SR',1),
	(65,2,'Тепелена','TE',1),
	(66,2,'Тропоя','TP',1),
	(67,2,'Тирана','TR',1),
	(68,2,'Влёра','VL',1),
	(69,3,'Адрар','ADR',1),
	(70,3,'Айн-Дефла','ADE',1),
	(71,3,'Айн-Темухент','ATE',1),
	(72,3,'Алжир','ALG',1),
	(73,3,'Аннаба','ANN',1),
	(74,3,'Батна','BAT',1),
	(75,3,'Бешар','BEC',1),
	(76,3,'Беджая','BEJ',1),
	(77,3,'Бискра','BIS',1),
	(78,3,'Блида','BLI',1),
	(79,3,'Бордж-Бу-Арреридж','BBA',1),
	(80,3,'Буйра','BOA',1),
	(81,3,'Бумердес','BMD',1),
	(82,3,'Шлеф','CHL',1),
	(83,3,'Константина','CON',1),
	(84,3,'Джельфа','DJE',1),
	(85,3,'Эль-Баяд','EBA',1),
	(86,3,'Эль-Уэд','EOU',1),
	(87,3,'Эль-Тарф','ETA',1),
	(88,3,'Гардая','GHA',1),
	(89,3,'Гуэльма','GUE',1),
	(90,3,'Иллизи','ILL',1),
	(91,3,'Джиджель','JIJ',1),
	(92,3,'Хеншела','KHE',1),
	(93,3,'Лагуат','LAG',1),
	(94,3,'Маскара','MUA',1),
	(95,3,'Медеа','MED',1),
	(96,3,'Мила','MIL',1),
	(97,3,'Мостаганем','MOS',1),
	(98,3,'Мсила','MSI',1),
	(99,3,'Наама','NAA',1),
	(100,3,'Оран','ORA',1),
	(101,3,'Уаргла','OUA',1),
	(102,3,'Ум Эль-Буахи','OEB',1),
	(103,3,'Релизан','REL',1),
	(104,3,'Саида','SAI',1),
	(105,3,'Сетиф','SET',1),
	(106,3,'Сиди-Бель-Аббес','SBA',1),
	(107,3,'Скикда','SKI',1),
	(108,3,'Сук-Ахрас','SAH',1),
	(109,3,'Таменрассет','TAM',1),
	(110,3,'Тебесса','TEB',1),
	(111,3,'Тиарет','TIA',1),
	(112,3,'Тиндуф','TIN',1),
	(113,3,'Типаза','TIP',1),
	(114,3,'Тиссемсилт','TIS',1),
	(115,3,'Тизи-Узу','TOU',1),
	(116,3,'Тлемсен','TLE',1),
	(117,4,'Восточный округ','E',1),
	(118,4,'Мануа','M',1),
	(119,4,'Остров Роз','R',1),
	(120,4,'Остров Суэйнс','S',1),
	(121,4,'Западный округ','W',1),
	(122,5,'Андорра-ла-Велья','ALV',1),
	(123,5,'Канильо','CAN',1),
	(124,5,'Энкамп','ENC',1),
	(125,5,'Эскальдес-Энгордань','ESE',1),
	(126,5,'Ла-Массана','LMA',1),
	(127,5,'Ордино','ORD',1),
	(128,5,'Сант-Жулия-де-Лория','SJL',1),
	(129,6,'Бенго','BGO',1),
	(130,6,'Бенгела','BGU',1),
	(131,6,'Бие','BIE',1),
	(132,6,'Кабинда','CAB',1),
	(133,6,'Квандо-Кубанго','CCU',1),
	(134,6,'Северная Кванза','CNO',1),
	(135,6,'Южная Кванза','CUS',1),
	(136,6,'Кунене','CNN',1),
	(137,6,'Уамбо','HUA',1),
	(138,6,'Уила','HUI',1),
	(139,6,'Луанда','LUA',1),
	(140,6,'Северная Лунда','LNO',1),
	(141,6,'Южная Лунда','LSU',1),
	(142,6,'Маланже','MAL',1),
	(143,6,'Мошико','MOX',1),
	(144,6,'Намибе','NAM',1),
	(145,6,'Уиже','UIG',1),
	(146,6,'Заире','ZAI',1),
	(147,9,'Сент-Джордж','ASG',1),
	(148,9,'Сент-Джон','ASJ',1),
	(149,9,'Сент-Мери','ASM',1),
	(150,9,'Сент-Пол','ASL',1),
	(151,9,'Сент-Петер','ASR',1),
	(152,9,'Сент-Филип','ASH',1),
	(153,9,'Барбуда','BAR',1),
	(154,9,'Редонда','RED',1),
	(155,10,'Антарктида и острова Южной Атлантики','AN',1),
	(156,10,'Буэнос-Айрес','BA',1),
	(157,10,'Катамарка','CA',1),
	(158,10,'Чако','CH',1),
	(159,10,'Чубут','CU',1),
	(160,10,'Кордова','CO',1),
	(161,10,'Корриентес','CR',1),
	(162,10,'Федеральный округ','DF',1),
	(163,10,'Энтре-Риос','ER',1),
	(164,10,'Формоса','FO',1),
	(165,10,'Жужуй','JU',1),
	(166,10,'Ла-Пампа','LP',1),
	(167,10,'Ла-Риоха','LR',1),
	(168,10,'Мендоса','ME',1),
	(169,10,'Мисьонес','MI',1),
	(170,10,'Неукен','NE',1),
	(171,10,'Рио-Негро','RN',1),
	(172,10,'Сальта','SA',1),
	(173,10,'Сан-Хуан','SJ',1),
	(174,10,'Сан-Луис','SL',1),
	(175,10,'Санта-Крус','SC',1),
	(176,10,'Санта-Фе','SF',1),
	(177,10,'Сантьяго-дель-Эстеро','SD',1),
	(178,10,'Тьерра-дель-Фуэго','TF',1),
	(179,10,'Тукуман','TU',1),
	(180,11,'Арагацотн','AGT',1),
	(181,11,'Арарат','ARR',1),
	(182,11,'Армавир','ARM',1),
	(183,11,'Гегаркуник','GEG',1),
	(184,11,'Котайк','KOT',1),
	(185,11,'Лори','LOR',1),
	(186,11,'Ширак','SHI',1),
	(187,11,'Сюник','SYU',1),
	(188,11,'Тавуш','TAV',1),
	(189,11,'Вайоц Дзор','VAY',1),
	(190,11,'Ереван','YER',1),
	(191,13,'Австралийская столичная территория','ACT',1),
	(192,13,'Новый Южный Уэльс','NSW',1),
	(193,13,'Северная территория','NT',1),
	(194,13,'Квинсленд','QLD',1),
	(195,13,'Южная Австралия','SA',1),
	(196,13,'Тасмания','TAS',1),
	(197,13,'Виктория','VIC',1),
	(198,13,'Западная Австралия','WA',1),
	(199,14,'Бургенланд','BUR',1),
	(200,14,'Каринтия','KAR',1),
	(201,14,'Нижняя Австрия','NOS',1),
	(202,14,'Верхняя Австрия','OOS',1),
	(203,14,'Зальцбург','SAL',1),
	(204,14,'Штирия','STE',1),
	(205,14,'Тироль','TIR',1),
	(206,14,'Форарльберг','VOR',1),
	(207,14,'Вена','WIE',1),
	(208,15,'Ali Bayramli','AB',1),
	(209,15,'Abseron','ABS',1),
	(210,15,'AgcabAdi','AGC',1),
	(211,15,'Agdam','AGM',1),
	(212,15,'Agdas','AGS',1),
	(213,15,'Agstafa','AGA',1),
	(214,15,'Agsu','AGU',1),
	(215,15,'Astara','AST',1),
	(216,15,'Baki','BA',1),
	(217,15,'BabAk','BAB',1),
	(218,15,'BalakAn','BAL',1),
	(219,15,'BArdA','BAR',1),
	(220,15,'Beylaqan','BEY',1),
	(221,15,'Bilasuvar','BIL',1),
	(222,15,'Cabrayil','CAB',1),
	(223,15,'Calilabab','CAL',1),
	(224,15,'Culfa','CUL',1),
	(225,15,'Daskasan','DAS',1),
	(226,15,'Davaci','DAV',1),
	(227,15,'Fuzuli','FUZ',1),
	(228,15,'Ganca','GA',1),
	(229,15,'Gadabay','GAD',1),
	(230,15,'Goranboy','GOR',1),
	(231,15,'Goycay','GOY',1),
	(232,15,'Haciqabul','HAC',1),
	(233,15,'Imisli','IMI',1),
	(234,15,'Ismayilli','ISM',1),
	(235,15,'Kalbacar','KAL',1),
	(236,15,'Kurdamir','KUR',1),
	(237,15,'Lankaran','LA',1),
	(238,15,'Lacin','LAC',1),
	(239,15,'Lankaran','LAN',1),
	(240,15,'Lerik','LER',1),
	(241,15,'Masalli','MAS',1),
	(242,15,'Mingacevir','MI',1),
	(243,15,'Naftalan','NA',1),
	(244,15,'Neftcala','NEF',1),
	(245,15,'Oguz','OGU',1),
	(246,15,'Ordubad','ORD',1),
	(247,15,'Qabala','QAB',1),
	(248,15,'Qax','QAX',1),
	(249,15,'Qazax','QAZ',1),
	(250,15,'Qobustan','QOB',1),
	(251,15,'Quba','QBA',1),
	(252,15,'Qubadli','QBI',1),
	(253,15,'Qusar','QUS',1),
	(254,15,'Saki','SA',1),
	(255,15,'Saatli','SAT',1),
	(256,15,'Sabirabad','SAB',1),
	(257,15,'Sadarak','SAD',1),
	(258,15,'Sahbuz','SAH',1),
	(259,15,'Saki','SAK',1),
	(260,15,'Salyan','SAL',1),
	(261,15,'Sumqayit','SM',1),
	(262,15,'Samaxi','SMI',1),
	(263,15,'Samkir','SKR',1),
	(264,15,'Samux','SMX',1),
	(265,15,'Sarur','SAR',1),
	(266,15,'Siyazan','SIY',1),
	(267,15,'Susa','SS',1),
	(268,15,'Susa','SUS',1),
	(269,15,'Tartar','TAR',1),
	(270,15,'Tovuz','TOV',1),
	(271,15,'Ucar','UCA',1),
	(272,15,'Xankandi','XA',1),
	(273,15,'Xacmaz','XAC',1),
	(274,15,'Xanlar','XAN',1),
	(275,15,'Xizi','XIZ',1),
	(276,15,'Xocali','XCI',1),
	(277,15,'Xocavand','XVD',1),
	(278,15,'Yardimli','YAR',1),
	(279,15,'Yevlax','YEV',1),
	(280,15,'Zangilan','ZAN',1),
	(281,15,'Zaqatala','ZAQ',1),
	(282,15,'Zardab','ZAR',1),
	(283,15,'Naxcivan','NX',1),
	(284,16,'Acklins','ACK',1),
	(285,16,'Berry Islands','BER',1),
	(286,16,'Bimini','BIM',1),
	(287,16,'Black Point','BLK',1),
	(288,16,'Cat Island','CAT',1),
	(289,16,'Central Abaco','CAB',1),
	(290,16,'Central Andros','CAN',1),
	(291,16,'Central Eleuthera','CEL',1),
	(292,16,'City of Freeport','FRE',1),
	(293,16,'Crooked Island','CRO',1),
	(294,16,'East Grand Bahama','EGB',1),
	(295,16,'Exuma','EXU',1),
	(296,16,'Grand Cay','GRD',1),
	(297,16,'Harbour Island','HAR',1),
	(298,16,'Hope Town','HOP',1),
	(299,16,'Inagua','INA',1),
	(300,16,'Long Island','LNG',1),
	(301,16,'Mangrove Cay','MAN',1),
	(302,16,'Mayaguana','MAY',1),
	(303,16,'Moore\'s Island','MOO',1),
	(304,16,'North Abaco','NAB',1),
	(305,16,'North Andros','NAN',1),
	(306,16,'North Eleuthera','NEL',1),
	(307,16,'Ragged Island','RAG',1),
	(308,16,'Rum Cay','RUM',1),
	(309,16,'San Salvador','SAL',1),
	(310,16,'South Abaco','SAB',1),
	(311,16,'South Andros','SAN',1),
	(312,16,'South Eleuthera','SEL',1),
	(313,16,'Spanish Wells','SWE',1),
	(314,16,'West Grand Bahama','WGB',1),
	(315,17,'Capital','CAP',1),
	(316,17,'Central','CEN',1),
	(317,17,'Muharraq','MUH',1),
	(318,17,'Northern','NOR',1),
	(319,17,'Southern','SOU',1),
	(320,18,'Barisal','BAR',1),
	(321,18,'Chittagong','CHI',1),
	(322,18,'Dhaka','DHA',1),
	(323,18,'Khulna','KHU',1),
	(324,18,'Rajshahi','RAJ',1),
	(325,18,'Sylhet','SYL',1),
	(326,19,'Christ Church','CC',1),
	(327,19,'Saint Andrew','AND',1),
	(328,19,'Saint George','GEO',1),
	(329,19,'Saint James','JAM',1),
	(330,19,'Saint John','JOH',1),
	(331,19,'Saint Joseph','JOS',1),
	(332,19,'Saint Lucy','LUC',1),
	(333,19,'Saint Michael','MIC',1),
	(334,19,'Saint Peter','PET',1),
	(335,19,'Saint Philip','PHI',1),
	(336,19,'Saint Thomas','THO',1),
	(337,20,'Брест','BR',1),
	(338,20,'Гомель','HO',1),
	(339,20,'Минск','HM',1),
	(340,20,'Гродно','HR',1),
	(341,20,'Могилев','MA',1),
	(342,20,'Минская область','MI',1),
	(343,20,'Витебск','VI',1),
	(344,21,'Antwerpen','VAN',1),
	(345,21,'Brabant Wallon','WBR',1),
	(346,21,'Hainaut','WHT',1),
	(347,21,'Liege','WLG',1),
	(348,21,'Limburg','VLI',1),
	(349,21,'Luxembourg','WLX',1),
	(350,21,'Namur','WNA',1),
	(351,21,'Oost-Vlaanderen','VOV',1),
	(352,21,'Vlaams Brabant','VBR',1),
	(353,21,'West-Vlaanderen','VWV',1),
	(354,22,'Belize','BZ',1),
	(355,22,'Cayo','CY',1),
	(356,22,'Corozal','CR',1),
	(357,22,'Orange Walk','OW',1),
	(358,22,'Stann Creek','SC',1),
	(359,22,'Toledo','TO',1),
	(360,23,'Alibori','AL',1),
	(361,23,'Atakora','AK',1),
	(362,23,'Atlantique','AQ',1),
	(363,23,'Borgou','BO',1),
	(364,23,'Collines','CO',1),
	(365,23,'Donga','DO',1),
	(366,23,'Kouffo','KO',1),
	(367,23,'Littoral','LI',1),
	(368,23,'Mono','MO',1),
	(369,23,'Oueme','OU',1),
	(370,23,'Plateau','PL',1),
	(371,23,'Zou','ZO',1),
	(372,24,'Devonshire','DS',1),
	(373,24,'Hamilton City','HC',1),
	(374,24,'Hamilton','HA',1),
	(375,24,'Paget','PG',1),
	(376,24,'Pembroke','PB',1),
	(377,24,'Saint George City','GC',1),
	(378,24,'Saint George\'s','SG',1),
	(379,24,'Sandys','SA',1),
	(380,24,'Smith\'s','SM',1),
	(381,24,'Southampton','SH',1),
	(382,24,'Warwick','WA',1),
	(383,25,'Bumthang','BUM',1),
	(384,25,'Chukha','CHU',1),
	(385,25,'Dagana','DAG',1),
	(386,25,'Gasa','GAS',1),
	(387,25,'Haa','HAA',1),
	(388,25,'Lhuntse','LHU',1),
	(389,25,'Mongar','MON',1),
	(390,25,'Paro','PAR',1),
	(391,25,'Pemagatshel','PEM',1),
	(392,25,'Punakha','PUN',1),
	(393,25,'Samdrup Jongkhar','SJO',1),
	(394,25,'Samtse','SAT',1),
	(395,25,'Sarpang','SAR',1),
	(396,25,'Thimphu','THI',1),
	(397,25,'Trashigang','TRG',1),
	(398,25,'Trashiyangste','TRY',1),
	(399,25,'Trongsa','TRO',1),
	(400,25,'Tsirang','TSI',1),
	(401,25,'Wangdue Phodrang','WPH',1),
	(402,25,'Zhemgang','ZHE',1),
	(403,26,'Beni','BEN',1),
	(404,26,'Chuquisaca','CHU',1),
	(405,26,'Cochabamba','COC',1),
	(406,26,'La Paz','LPZ',1),
	(407,26,'Oruro','ORU',1),
	(408,26,'Pando','PAN',1),
	(409,26,'Potosi','POT',1),
	(410,26,'Santa Cruz','SCZ',1),
	(411,26,'Tarija','TAR',1),
	(412,27,'Brcko district','BRO',1),
	(413,27,'Unsko-Sanski Kanton','FUS',1),
	(414,27,'Posavski Kanton','FPO',1),
	(415,27,'Tuzlanski Kanton','FTU',1),
	(416,27,'Zenicko-Dobojski Kanton','FZE',1),
	(417,27,'Bosanskopodrinjski Kanton','FBP',1),
	(418,27,'Srednjebosanski Kanton','FSB',1),
	(419,27,'Hercegovacko-neretvanski Kanton','FHN',1),
	(420,27,'Zapadnohercegovacka Zupanija','FZH',1),
	(421,27,'Kanton Sarajevo','FSA',1),
	(422,27,'Zapadnobosanska','FZA',1),
	(423,27,'Banja Luka','SBL',1),
	(424,27,'Doboj','SDO',1),
	(425,27,'Bijeljina','SBI',1),
	(426,27,'Vlasenica','SVL',1),
	(427,27,'Sarajevo-Romanija or Sokolac','SSR',1),
	(428,27,'Foca','SFO',1),
	(429,27,'Trebinje','STR',1),
	(430,28,'Central','CE',1),
	(431,28,'Ghanzi','GH',1),
	(432,28,'Kgalagadi','KD',1),
	(433,28,'Kgatleng','KT',1),
	(434,28,'Kweneng','KW',1),
	(435,28,'Ngamiland','NG',1),
	(436,28,'North East','NE',1),
	(437,28,'North West','NW',1),
	(438,28,'South East','SE',1),
	(439,28,'Southern','SO',1),
	(440,30,'Acre','AC',1),
	(441,30,'Alagoas','AL',1),
	(442,30,'Amapa','AP',1),
	(443,30,'Amazonas','AM',1),
	(444,30,'Bahia','BA',1),
	(445,30,'Ceara','CE',1),
	(446,30,'Distrito Federal','DF',1),
	(447,30,'Espirito Santo','ES',1),
	(448,30,'Goias','GO',1),
	(449,30,'Maranhao','MA',1),
	(450,30,'Mato Grosso','MT',1),
	(451,30,'Mato Grosso do Sul','MS',1),
	(452,30,'Minas Gerais','MG',1),
	(453,30,'Para','PA',1),
	(454,30,'Paraiba','PB',1),
	(455,30,'Parana','PR',1),
	(456,30,'Pernambuco','PE',1),
	(457,30,'Piaui','PI',1),
	(458,30,'Rio de Janeiro','RJ',1),
	(459,30,'Rio Grande do Norte','RN',1),
	(460,30,'Rio Grande do Sul','RS',1),
	(461,30,'Rondonia','RO',1),
	(462,30,'Roraima','RR',1),
	(463,30,'Santa Catarina','SC',1),
	(464,30,'Sao Paulo','SP',1),
	(465,30,'Sergipe','SE',1),
	(466,30,'Tocantins','TO',1),
	(467,31,'Peros Banhos','PB',1),
	(468,31,'Salomon Islands','SI',1),
	(469,31,'Nelsons Island','NI',1),
	(470,31,'Three Brothers','TB',1),
	(471,31,'Eagle Islands','EA',1),
	(472,31,'Danger Island','DI',1),
	(473,31,'Egmont Islands','EG',1),
	(474,31,'Diego Garcia','DG',1),
	(475,32,'Belait','BEL',1),
	(476,32,'Brunei and Muara','BRM',1),
	(477,32,'Temburong','TEM',1),
	(478,32,'Tutong','TUT',1),
	(479,33,'Blagoevgrad','',1),
	(480,33,'Burgas','',1),
	(481,33,'Dobrich','',1),
	(482,33,'Gabrovo','',1),
	(483,33,'Haskovo','',1),
	(484,33,'Kardjali','',1),
	(485,33,'Kyustendil','',1),
	(486,33,'Lovech','',1),
	(487,33,'Montana','',1),
	(488,33,'Pazardjik','',1),
	(489,33,'Pernik','',1),
	(490,33,'Pleven','',1),
	(491,33,'Plovdiv','',1),
	(492,33,'Razgrad','',1),
	(493,33,'Shumen','',1),
	(494,33,'Silistra','',1),
	(495,33,'Sliven','',1),
	(496,33,'Smolyan','',1),
	(497,33,'Sofia','',1),
	(498,33,'Sofia - town','',1),
	(499,33,'Stara Zagora','',1),
	(500,33,'Targovishte','',1),
	(501,33,'Varna','',1),
	(502,33,'Veliko Tarnovo','',1),
	(503,33,'Vidin','',1),
	(504,33,'Vratza','',1),
	(505,33,'Yambol','',1),
	(506,34,'Bale','BAL',1),
	(507,34,'Bam','BAM',1),
	(508,34,'Banwa','BAN',1),
	(509,34,'Bazega','BAZ',1),
	(510,34,'Bougouriba','BOR',1),
	(511,34,'Boulgou','BLG',1),
	(512,34,'Boulkiemde','BOK',1),
	(513,34,'Comoe','COM',1),
	(514,34,'Ganzourgou','GAN',1),
	(515,34,'Gnagna','GNA',1),
	(516,34,'Gourma','GOU',1),
	(517,34,'Houet','HOU',1),
	(518,34,'Ioba','IOA',1),
	(519,34,'Kadiogo','KAD',1),
	(520,34,'Kenedougou','KEN',1),
	(521,34,'Komondjari','KOD',1),
	(522,34,'Kompienga','KOP',1),
	(523,34,'Kossi','KOS',1),
	(524,34,'Koulpelogo','KOL',1),
	(525,34,'Kouritenga','KOT',1),
	(526,34,'Kourweogo','KOW',1),
	(527,34,'Leraba','LER',1),
	(528,34,'Loroum','LOR',1),
	(529,34,'Mouhoun','MOU',1),
	(530,34,'Nahouri','NAH',1),
	(531,34,'Namentenga','NAM',1),
	(532,34,'Nayala','NAY',1),
	(533,34,'Noumbiel','NOU',1),
	(534,34,'Oubritenga','OUB',1),
	(535,34,'Oudalan','OUD',1),
	(536,34,'Passore','PAS',1),
	(537,34,'Poni','PON',1),
	(538,34,'Sanguie','SAG',1),
	(539,34,'Sanmatenga','SAM',1),
	(540,34,'Seno','SEN',1),
	(541,34,'Sissili','SIS',1),
	(542,34,'Soum','SOM',1),
	(543,34,'Sourou','SOR',1),
	(544,34,'Tapoa','TAP',1),
	(545,34,'Tuy','TUY',1),
	(546,34,'Yagha','YAG',1),
	(547,34,'Yatenga','YAT',1),
	(548,34,'Ziro','ZIR',1),
	(549,34,'Zondoma','ZOD',1),
	(550,34,'Zoundweogo','ZOW',1),
	(551,35,'Bubanza','BB',1),
	(552,35,'Bujumbura','BJ',1),
	(553,35,'Bururi','BR',1),
	(554,35,'Cankuzo','CA',1),
	(555,35,'Cibitoke','CI',1),
	(556,35,'Gitega','GI',1),
	(557,35,'Karuzi','KR',1),
	(558,35,'Kayanza','KY',1),
	(559,35,'Kirundo','KI',1),
	(560,35,'Makamba','MA',1),
	(561,35,'Muramvya','MU',1),
	(562,35,'Muyinga','MY',1),
	(563,35,'Mwaro','MW',1),
	(564,35,'Ngozi','NG',1),
	(565,35,'Rutana','RT',1),
	(566,35,'Ruyigi','RY',1),
	(567,36,'Phnom Penh','PP',1),
	(568,36,'Preah Seihanu (Kompong Som or Sihanoukville)','PS',1),
	(569,36,'Pailin','PA',1),
	(570,36,'Keb','KB',1),
	(571,36,'Banteay Meanchey','BM',1),
	(572,36,'Battambang','BA',1),
	(573,36,'Kampong Cham','KM',1),
	(574,36,'Kampong Chhnang','KN',1),
	(575,36,'Kampong Speu','KU',1),
	(576,36,'Kampong Som','KO',1),
	(577,36,'Kampong Thom','KT',1),
	(578,36,'Kampot','KP',1),
	(579,36,'Kandal','KL',1),
	(580,36,'Kaoh Kong','KK',1),
	(581,36,'Kratie','KR',1),
	(582,36,'Mondul Kiri','MK',1),
	(583,36,'Oddar Meancheay','OM',1),
	(584,36,'Pursat','PU',1),
	(585,36,'Preah Vihear','PR',1),
	(586,36,'Prey Veng','PG',1),
	(587,36,'Ratanak Kiri','RK',1),
	(588,36,'Siemreap','SI',1),
	(589,36,'Stung Treng','ST',1),
	(590,36,'Svay Rieng','SR',1),
	(591,36,'Takeo','TK',1),
	(592,37,'Adamawa (Adamaoua)','ADA',1),
	(593,37,'Centre','CEN',1),
	(594,37,'East (Est)','EST',1),
	(595,37,'Extreme North (Extreme-Nord)','EXN',1),
	(596,37,'Littoral','LIT',1),
	(597,37,'North (Nord)','NOR',1),
	(598,37,'Northwest (Nord-Ouest)','NOT',1),
	(599,37,'West (Ouest)','OUE',1),
	(600,37,'South (Sud)','SUD',1),
	(601,37,'Southwest (Sud-Ouest).','SOU',1),
	(602,38,'Alberta','AB',1),
	(603,38,'British Columbia','BC',1),
	(604,38,'Manitoba','MB',1),
	(605,38,'New Brunswick','NB',1),
	(606,38,'Newfoundland and Labrador','NL',1),
	(607,38,'Northwest Territories','NT',1),
	(608,38,'Nova Scotia','NS',1),
	(609,38,'Nunavut','NU',1),
	(610,38,'Ontario','ON',1),
	(611,38,'Prince Edward Island','PE',1),
	(612,38,'Qu&eacute;bec','QC',1),
	(613,38,'Saskatchewan','SK',1),
	(614,38,'Yukon Territory','YT',1),
	(615,39,'Boa Vista','BV',1),
	(616,39,'Brava','BR',1),
	(617,39,'Calheta de Sao Miguel','CS',1),
	(618,39,'Maio','MA',1),
	(619,39,'Mosteiros','MO',1),
	(620,39,'Paul','PA',1),
	(621,39,'Porto Novo','PN',1),
	(622,39,'Praia','PR',1),
	(623,39,'Ribeira Grande','RG',1),
	(624,39,'Sal','SL',1),
	(625,39,'Santa Catarina','CA',1),
	(626,39,'Santa Cruz','CR',1),
	(627,39,'Sao Domingos','SD',1),
	(628,39,'Sao Filipe','SF',1),
	(629,39,'Sao Nicolau','SN',1),
	(630,39,'Sao Vicente','SV',1),
	(631,39,'Tarrafal','TA',1),
	(632,40,'Creek','CR',1),
	(633,40,'Eastern','EA',1),
	(634,40,'Midland','ML',1),
	(635,40,'South Town','ST',1),
	(636,40,'Spot Bay','SP',1),
	(637,40,'Stake Bay','SK',1),
	(638,40,'West End','WD',1),
	(639,40,'Western','WN',1),
	(640,41,'Bamingui-Bangoran','BBA',1),
	(641,41,'Basse-Kotto','BKO',1),
	(642,41,'Haute-Kotto','HKO',1),
	(643,41,'Haut-Mbomou','HMB',1),
	(644,41,'Kemo','KEM',1),
	(645,41,'Lobaye','LOB',1),
	(646,41,'Mambere-KadeÔ','MKD',1),
	(647,41,'Mbomou','MBO',1),
	(648,41,'Nana-Mambere','NMM',1),
	(649,41,'Ombella-M\'Poko','OMP',1),
	(650,41,'Ouaka','OUK',1),
	(651,41,'Ouham','OUH',1),
	(652,41,'Ouham-Pende','OPE',1),
	(653,41,'Vakaga','VAK',1),
	(654,41,'Nana-Grebizi','NGR',1),
	(655,41,'Sangha-Mbaere','SMB',1),
	(656,41,'Bangui','BAN',1),
	(657,42,'Batha','BA',1),
	(658,42,'Biltine','BI',1),
	(659,42,'Borkou-Ennedi-Tibesti','BE',1),
	(660,42,'Chari-Baguirmi','CB',1),
	(661,42,'Guera','GU',1),
	(662,42,'Kanem','KA',1),
	(663,42,'Lac','LA',1),
	(664,42,'Logone Occidental','LC',1),
	(665,42,'Logone Oriental','LR',1),
	(666,42,'Mayo-Kebbi','MK',1),
	(667,42,'Moyen-Chari','MC',1),
	(668,42,'Ouaddai','OU',1),
	(669,42,'Salamat','SA',1),
	(670,42,'Tandjile','TA',1),
	(671,43,'Aisen del General Carlos Ibanez','AI',1),
	(672,43,'Antofagasta','AN',1),
	(673,43,'Araucania','AR',1),
	(674,43,'Atacama','AT',1),
	(675,43,'Bio-Bio','BI',1),
	(676,43,'Coquimbo','CO',1),
	(677,43,'Libertador General Bernardo O\'Hi','LI',1),
	(678,43,'Los Lagos','LL',1),
	(679,43,'Magallanes y de la Antartica Chi','MA',1),
	(680,43,'Maule','ML',1),
	(681,43,'Region Metropolitana','RM',1),
	(682,43,'Tarapaca','TA',1),
	(683,43,'Valparaiso','VS',1),
	(684,44,'Anhui','AN',1),
	(685,44,'Beijing','BE',1),
	(686,44,'Chongqing','CH',1),
	(687,44,'Fujian','FU',1),
	(688,44,'Gansu','GA',1),
	(689,44,'Guangdong','GU',1),
	(690,44,'Guangxi','GX',1),
	(691,44,'Guizhou','GZ',1),
	(692,44,'Hainan','HA',1),
	(693,44,'Hebei','HB',1),
	(694,44,'Heilongjiang','HL',1),
	(695,44,'Henan','HE',1),
	(696,44,'Hong Kong','HK',1),
	(697,44,'Hubei','HU',1),
	(698,44,'Hunan','HN',1),
	(699,44,'Inner Mongolia','IM',1),
	(700,44,'Jiangsu','JI',1),
	(701,44,'Jiangxi','JX',1),
	(702,44,'Jilin','JL',1),
	(703,44,'Liaoning','LI',1),
	(704,44,'Macau','MA',1),
	(705,44,'Ningxia','NI',1),
	(706,44,'Shaanxi','SH',1),
	(707,44,'Shandong','SA',1),
	(708,44,'Shanghai','SG',1),
	(709,44,'Shanxi','SX',1),
	(710,44,'Sichuan','SI',1),
	(711,44,'Tianjin','TI',1),
	(712,44,'Xinjiang','XI',1),
	(713,44,'Yunnan','YU',1),
	(714,44,'Zhejiang','ZH',1),
	(715,46,'Direction Island','D',1),
	(716,46,'Home Island','H',1),
	(717,46,'Horsburgh Island','O',1),
	(718,46,'South Island','S',1),
	(719,46,'West Island','W',1),
	(720,47,'Amazonas','AMZ',1),
	(721,47,'Antioquia','ANT',1),
	(722,47,'Arauca','ARA',1),
	(723,47,'Atlantico','ATL',1),
	(724,47,'Bogota D.C.','BDC',1),
	(725,47,'Bolivar','BOL',1),
	(726,47,'Boyaca','BOY',1),
	(727,47,'Caldas','CAL',1),
	(728,47,'Caqueta','CAQ',1),
	(729,47,'Casanare','CAS',1),
	(730,47,'Cauca','CAU',1),
	(731,47,'Cesar','CES',1),
	(732,47,'Choco','CHO',1),
	(733,47,'Cordoba','COR',1),
	(734,47,'Cundinamarca','CAM',1),
	(735,47,'Guainia','GNA',1),
	(736,47,'Guajira','GJR',1),
	(737,47,'Guaviare','GVR',1),
	(738,47,'Huila','HUI',1),
	(739,47,'Magdalena','MAG',1),
	(740,47,'Meta','MET',1),
	(741,47,'Narino','NAR',1),
	(742,47,'Norte de Santander','NDS',1),
	(743,47,'Putumayo','PUT',1),
	(744,47,'Quindio','QUI',1),
	(745,47,'Risaralda','RIS',1),
	(746,47,'San Andres y Providencia','SAP',1),
	(747,47,'Santander','SAN',1),
	(748,47,'Sucre','SUC',1),
	(749,47,'Tolima','TOL',1),
	(750,47,'Valle del Cauca','VDC',1),
	(751,47,'Vaupes','VAU',1),
	(752,47,'Vichada','VIC',1),
	(753,48,'Grande Comore','G',1),
	(754,48,'Anjouan','A',1),
	(755,48,'Moheli','M',1),
	(756,49,'Bouenza','BO',1),
	(757,49,'Brazzaville','BR',1),
	(758,49,'Cuvette','CU',1),
	(759,49,'Cuvette-Ouest','CO',1),
	(760,49,'Kouilou','KO',1),
	(761,49,'Lekoumou','LE',1),
	(762,49,'Likouala','LI',1),
	(763,49,'Niari','NI',1),
	(764,49,'Plateaux','PL',1),
	(765,49,'Pool','PO',1),
	(766,49,'Sangha','SA',1),
	(767,50,'Pukapuka','PU',1),
	(768,50,'Rakahanga','RK',1),
	(769,50,'Manihiki','MK',1),
	(770,50,'Penrhyn','PE',1),
	(771,50,'Nassau Island','NI',1),
	(772,50,'Surwarrow','SU',1),
	(773,50,'Palmerston','PA',1),
	(774,50,'Aitutaki','AI',1),
	(775,50,'Manuae','MA',1),
	(776,50,'Takutea','TA',1),
	(777,50,'Mitiaro','MT',1),
	(778,50,'Atiu','AT',1),
	(779,50,'Mauke','MU',1),
	(780,50,'Rarotonga','RR',1),
	(781,50,'Mangaia','MG',1),
	(782,51,'Alajuela','AL',1),
	(783,51,'Cartago','CA',1),
	(784,51,'Guanacaste','GU',1),
	(785,51,'Heredia','HE',1),
	(786,51,'Limon','LI',1),
	(787,51,'Puntarenas','PU',1),
	(788,51,'San Jose','SJ',1),
	(789,52,'Abengourou','ABE',1),
	(790,52,'Abidjan','ABI',1),
	(791,52,'Aboisso','ABO',1),
	(792,52,'Adiake','ADI',1),
	(793,52,'Adzope','ADZ',1),
	(794,52,'Agboville','AGB',1),
	(795,52,'Agnibilekrou','AGN',1),
	(796,52,'Alepe','ALE',1),
	(797,52,'Bocanda','BOC',1),
	(798,52,'Bangolo','BAN',1),
	(799,52,'Beoumi','BEO',1),
	(800,52,'Biankouma','BIA',1),
	(801,52,'Bondoukou','BDK',1),
	(802,52,'Bongouanou','BGN',1),
	(803,52,'Bouafle','BFL',1),
	(804,52,'Bouake','BKE',1),
	(805,52,'Bouna','BNA',1),
	(806,52,'Boundiali','BDL',1),
	(807,52,'Dabakala','DKL',1),
	(808,52,'Dabou','DBU',1),
	(809,52,'Daloa','DAL',1),
	(810,52,'Danane','DAN',1),
	(811,52,'Daoukro','DAO',1),
	(812,52,'Dimbokro','DIM',1),
	(813,52,'Divo','DIV',1),
	(814,52,'Duekoue','DUE',1),
	(815,52,'Ferkessedougou','FER',1),
	(816,52,'Gagnoa','GAG',1),
	(817,52,'Grand-Bassam','GBA',1),
	(818,52,'Grand-Lahou','GLA',1),
	(819,52,'Guiglo','GUI',1),
	(820,52,'Issia','ISS',1),
	(821,52,'Jacqueville','JAC',1),
	(822,52,'Katiola','KAT',1),
	(823,52,'Korhogo','KOR',1),
	(824,52,'Lakota','LAK',1),
	(825,52,'Man','MAN',1),
	(826,52,'Mankono','MKN',1),
	(827,52,'Mbahiakro','MBA',1),
	(828,52,'Odienne','ODI',1),
	(829,52,'Oume','OUM',1),
	(830,52,'Sakassou','SAK',1),
	(831,52,'San-Pedro','SPE',1),
	(832,52,'Sassandra','SAS',1),
	(833,52,'Seguela','SEG',1),
	(834,52,'Sinfra','SIN',1),
	(835,52,'Soubre','SOU',1),
	(836,52,'Tabou','TAB',1),
	(837,52,'Tanda','TAN',1),
	(838,52,'Tiebissou','TIE',1),
	(839,52,'Tingrela','TIN',1),
	(840,52,'Tiassale','TIA',1),
	(841,52,'Touba','TBA',1),
	(842,52,'Toulepleu','TLP',1),
	(843,52,'Toumodi','TMD',1),
	(844,52,'Vavoua','VAV',1),
	(845,52,'Yamoussoukro','YAM',1),
	(846,52,'Zuenoula','ZUE',1),
	(847,53,'Bjelovar-Bilogora','BB',1),
	(848,53,'City of Zagreb','CZ',1),
	(849,53,'Dubrovnik-Neretva','DN',1),
	(850,53,'Istra','IS',1),
	(851,53,'Karlovac','KA',1),
	(852,53,'Koprivnica-Krizevci','KK',1),
	(853,53,'Krapina-Zagorje','KZ',1),
	(854,53,'Lika-Senj','LS',1),
	(855,53,'Medimurje','ME',1),
	(856,53,'Osijek-Baranja','OB',1),
	(857,53,'Pozega-Slavonia','PS',1),
	(858,53,'Primorje-Gorski Kotar','PG',1),
	(859,53,'Sibenik','SI',1),
	(860,53,'Sisak-Moslavina','SM',1),
	(861,53,'Slavonski Brod-Posavina','SB',1),
	(862,53,'Split-Dalmatia','SD',1),
	(863,53,'Varazdin','VA',1),
	(864,53,'Virovitica-Podravina','VP',1),
	(865,53,'Vukovar-Srijem','VS',1),
	(866,53,'Zadar-Knin','ZK',1),
	(867,53,'Zagreb','ZA',1),
	(868,54,'Camaguey','CA',1),
	(869,54,'Ciego de Avila','CD',1),
	(870,54,'Cienfuegos','CI',1),
	(871,54,'Ciudad de La Habana','CH',1),
	(872,54,'Granma','GR',1),
	(873,54,'Guantanamo','GU',1),
	(874,54,'Holguin','HO',1),
	(875,54,'Isla de la Juventud','IJ',1),
	(876,54,'La Habana','LH',1),
	(877,54,'Las Tunas','LT',1),
	(878,54,'Matanzas','MA',1),
	(879,54,'Pinar del Rio','PR',1),
	(880,54,'Sancti Spiritus','SS',1),
	(881,54,'Santiago de Cuba','SC',1),
	(882,54,'Villa Clara','VC',1),
	(883,55,'Famagusta','F',1),
	(884,55,'Kyrenia','K',1),
	(885,55,'Larnaca','A',1),
	(886,55,'Limassol','I',1),
	(887,55,'Nicosia','N',1),
	(888,55,'Paphos','P',1),
	(889,56,'Ústecký','U',1),
	(890,56,'Jihočeský','C',1),
	(891,56,'Jihomoravský','B',1),
	(892,56,'Karlovarský','K',1),
	(893,56,'Královehradecký','H',1),
	(894,56,'Liberecký','L',1),
	(895,56,'Moravskoslezský','T',1),
	(896,56,'Olomoucký','M',1),
	(897,56,'Pardubický','E',1),
	(898,56,'Plzeňský','P',1),
	(899,56,'Praha','A',1),
	(900,56,'Středočeský','S',1),
	(901,56,'Vysočina','J',1),
	(902,56,'Zlínský','Z',1),
	(903,57,'Arhus','AR',1),
	(904,57,'Bornholm','BH',1),
	(905,57,'Copenhagen','CO',1),
	(906,57,'Faroe Islands','FO',1),
	(907,57,'Frederiksborg','FR',1),
	(908,57,'Fyn','FY',1),
	(909,57,'Kobenhavn','KO',1),
	(910,57,'Nordjylland','NO',1),
	(911,57,'Ribe','RI',1),
	(912,57,'Ringkobing','RK',1),
	(913,57,'Roskilde','RO',1),
	(914,57,'Sonderjylland','SO',1),
	(915,57,'Storstrom','ST',1),
	(916,57,'Vejle','VK',1),
	(917,57,'Vestj&aelig;lland','VJ',1),
	(918,57,'Viborg','VB',1),
	(919,58,'\'Ali Sabih','S',1),
	(920,58,'Dikhil','K',1),
	(921,58,'Djibouti','J',1),
	(922,58,'Obock','O',1),
	(923,58,'Tadjoura','T',1),
	(924,59,'Saint Andrew Parish','AND',1),
	(925,59,'Saint David Parish','DAV',1),
	(926,59,'Saint George Parish','GEO',1),
	(927,59,'Saint John Parish','JOH',1),
	(928,59,'Saint Joseph Parish','JOS',1),
	(929,59,'Saint Luke Parish','LUK',1),
	(930,59,'Saint Mark Parish','MAR',1),
	(931,59,'Saint Patrick Parish','PAT',1),
	(932,59,'Saint Paul Parish','PAU',1),
	(933,59,'Saint Peter Parish','PET',1),
	(934,60,'Distrito Nacional','DN',1),
	(935,60,'Azua','AZ',1),
	(936,60,'Baoruco','BC',1),
	(937,60,'Barahona','BH',1),
	(938,60,'Dajabon','DJ',1),
	(939,60,'Duarte','DU',1),
	(940,60,'Elias Pina','EL',1),
	(941,60,'El Seybo','SY',1),
	(942,60,'Espaillat','ET',1),
	(943,60,'Hato Mayor','HM',1),
	(944,60,'Independencia','IN',1),
	(945,60,'La Altagracia','AL',1),
	(946,60,'La Romana','RO',1),
	(947,60,'La Vega','VE',1),
	(948,60,'Maria Trinidad Sanchez','MT',1),
	(949,60,'Monsenor Nouel','MN',1),
	(950,60,'Monte Cristi','MC',1),
	(951,60,'Monte Plata','MP',1),
	(952,60,'Pedernales','PD',1),
	(953,60,'Peravia (Bani)','PR',1),
	(954,60,'Puerto Plata','PP',1),
	(955,60,'Salcedo','SL',1),
	(956,60,'Samana','SM',1),
	(957,60,'Sanchez Ramirez','SH',1),
	(958,60,'San Cristobal','SC',1),
	(959,60,'San Jose de Ocoa','JO',1),
	(960,60,'San Juan','SJ',1),
	(961,60,'San Pedro de Macoris','PM',1),
	(962,60,'Santiago','SA',1),
	(963,60,'Santiago Rodriguez','ST',1),
	(964,60,'Santo Domingo','SD',1),
	(965,60,'Valverde','VA',1),
	(966,61,'Aileu','AL',1),
	(967,61,'Ainaro','AN',1),
	(968,61,'Baucau','BA',1),
	(969,61,'Bobonaro','BO',1),
	(970,61,'Cova Lima','CO',1),
	(971,61,'Dili','DI',1),
	(972,61,'Ermera','ER',1),
	(973,61,'Lautem','LA',1),
	(974,61,'Liquica','LI',1),
	(975,61,'Manatuto','MT',1),
	(976,61,'Manufahi','MF',1),
	(977,61,'Oecussi','OE',1),
	(978,61,'Viqueque','VI',1),
	(979,62,'Azuay','AZU',1),
	(980,62,'Bolivar','BOL',1),
	(981,62,'Ca&ntilde;ar','CAN',1),
	(982,62,'Carchi','CAR',1),
	(983,62,'Chimborazo','CHI',1),
	(984,62,'Cotopaxi','COT',1),
	(985,62,'El Oro','EOR',1),
	(986,62,'Esmeraldas','ESM',1),
	(987,62,'Gal&aacute;pagos','GPS',1),
	(988,62,'Guayas','GUA',1),
	(989,62,'Imbabura','IMB',1),
	(990,62,'Loja','LOJ',1),
	(991,62,'Los Rios','LRO',1),
	(992,62,'Manab&iacute;','MAN',1),
	(993,62,'Morona Santiago','MSA',1),
	(994,62,'Napo','NAP',1),
	(995,62,'Orellana','ORE',1),
	(996,62,'Pastaza','PAS',1),
	(997,62,'Pichincha','PIC',1),
	(998,62,'Sucumb&iacute;os','SUC',1),
	(999,62,'Tungurahua','TUN',1),
	(1000,62,'Zamora Chinchipe','ZCH',1),
	(1001,63,'Ad Daqahliyah','DHY',1),
	(1002,63,'Al Bahr al Ahmar','BAM',1),
	(1003,63,'Al Buhayrah','BHY',1),
	(1004,63,'Al Fayyum','FYM',1),
	(1005,63,'Al Gharbiyah','GBY',1),
	(1006,63,'Al Iskandariyah','IDR',1),
	(1007,63,'Al Isma\'iliyah','IML',1),
	(1008,63,'Al Jizah','JZH',1),
	(1009,63,'Al Minufiyah','MFY',1),
	(1010,63,'Al Minya','MNY',1),
	(1011,63,'Al Qahirah','QHR',1),
	(1012,63,'Al Qalyubiyah','QLY',1),
	(1013,63,'Al Wadi al Jadid','WJD',1),
	(1014,63,'Ash Sharqiyah','SHQ',1),
	(1015,63,'As Suways','SWY',1),
	(1016,63,'Aswan','ASW',1),
	(1017,63,'Asyut','ASY',1),
	(1018,63,'Bani Suwayf','BSW',1),
	(1019,63,'Bur Sa\'id','BSD',1),
	(1020,63,'Dumyat','DMY',1),
	(1021,63,'Janub Sina\'','JNS',1),
	(1022,63,'Kafr ash Shaykh','KSH',1),
	(1023,63,'Matruh','MAT',1),
	(1024,63,'Qina','QIN',1),
	(1025,63,'Shamal Sina\'','SHS',1),
	(1026,63,'Suhaj','SUH',1),
	(1027,64,'Ahuachapan','AH',1),
	(1028,64,'Cabanas','CA',1),
	(1029,64,'Chalatenango','CH',1),
	(1030,64,'Cuscatlan','CU',1),
	(1031,64,'La Libertad','LB',1),
	(1032,64,'La Paz','PZ',1),
	(1033,64,'La Union','UN',1),
	(1034,64,'Morazan','MO',1),
	(1035,64,'San Miguel','SM',1),
	(1036,64,'San Salvador','SS',1),
	(1037,64,'San Vicente','SV',1),
	(1038,64,'Santa Ana','SA',1),
	(1039,64,'Sonsonate','SO',1),
	(1040,64,'Usulutan','US',1),
	(1041,65,'Provincia Annobon','AN',1),
	(1042,65,'Provincia Bioko Norte','BN',1),
	(1043,65,'Provincia Bioko Sur','BS',1),
	(1044,65,'Provincia Centro Sur','CS',1),
	(1045,65,'Provincia Kie-Ntem','KN',1),
	(1046,65,'Provincia Litoral','LI',1),
	(1047,65,'Provincia Wele-Nzas','WN',1),
	(1048,66,'Central (Maekel)','MA',1),
	(1049,66,'Anseba (Keren)','KE',1),
	(1050,66,'Southern Red Sea (Debub-Keih-Bahri)','DK',1),
	(1051,66,'Northern Red Sea (Semien-Keih-Bahri)','SK',1),
	(1052,66,'Southern (Debub)','DE',1),
	(1053,66,'Gash-Barka (Barentu)','BR',1),
	(1054,67,'Harjumaa (Tallinn)','HA',1),
	(1055,67,'Hiiumaa (Kardla)','HI',1),
	(1056,67,'Ida-Virumaa (Johvi)','IV',1),
	(1057,67,'Jarvamaa (Paide)','JA',1),
	(1058,67,'Jogevamaa (Jogeva)','JO',1),
	(1059,67,'Laane-Virumaa (Rakvere)','LV',1),
	(1060,67,'Laanemaa (Haapsalu)','LA',1),
	(1061,67,'Parnumaa (Parnu)','PA',1),
	(1062,67,'Polvamaa (Polva)','PO',1),
	(1063,67,'Raplamaa (Rapla)','RA',1),
	(1064,67,'Saaremaa (Kuessaare)','SA',1),
	(1065,67,'Tartumaa (Tartu)','TA',1),
	(1066,67,'Valgamaa (Valga)','VA',1),
	(1067,67,'Viljandimaa (Viljandi)','VI',1),
	(1068,67,'Vorumaa (Voru)','VO',1),
	(1069,68,'Afar','AF',1),
	(1070,68,'Amhara','AH',1),
	(1071,68,'Benishangul-Gumaz','BG',1),
	(1072,68,'Gambela','GB',1),
	(1073,68,'Hariai','HR',1),
	(1074,68,'Oromia','OR',1),
	(1075,68,'Somali','SM',1),
	(1076,68,'Southern Nations - Nationalities and Peoples Region','SN',1),
	(1077,68,'Tigray','TG',1),
	(1078,68,'Addis Ababa','AA',1),
	(1079,68,'Dire Dawa','DD',1),
	(1080,71,'Central Division','C',1),
	(1081,71,'Northern Division','N',1),
	(1082,71,'Eastern Division','E',1),
	(1083,71,'Western Division','W',1),
	(1084,71,'Rotuma','R',1),
	(1085,72,'Ahvenanmaan Laani','AL',1),
	(1086,72,'Etela-Suomen Laani','ES',1),
	(1087,72,'Ita-Suomen Laani','IS',1),
	(1088,72,'Lansi-Suomen Laani','LS',1),
	(1089,72,'Lapin Lanani','LA',1),
	(1090,72,'Oulun Laani','OU',1),
	(1091,73,'Alsace','AL',1),
	(1092,73,'Aquitaine','AQ',1),
	(1093,73,'Auvergne','AU',1),
	(1094,73,'Brittany','BR',1),
	(1095,73,'Burgundy','BU',1),
	(1096,73,'Center Loire Valley','CE',1),
	(1097,73,'Champagne','CH',1),
	(1098,73,'Corse','CO',1),
	(1099,73,'France Comte','FR',1),
	(1100,73,'Languedoc Roussillon','LA',1),
	(1101,73,'Limousin','LI',1),
	(1102,73,'Lorraine','LO',1),
	(1103,73,'Midi Pyrenees','MI',1),
	(1104,73,'Nord Pas de Calais','NO',1),
	(1105,73,'Normandy','NR',1),
	(1106,73,'Paris / Ill de France','PA',1),
	(1107,73,'Picardie','PI',1),
	(1108,73,'Poitou Charente','PO',1),
	(1109,73,'Provence','PR',1),
	(1110,73,'Rhone Alps','RH',1),
	(1111,73,'Riviera','RI',1),
	(1112,73,'Western Loire Valley','WE',1),
	(1113,74,'Etranger','Et',1),
	(1114,74,'Ain','01',1),
	(1115,74,'Aisne','02',1),
	(1116,74,'Allier','03',1),
	(1117,74,'Alpes de Haute Provence','04',1),
	(1118,74,'Hautes-Alpes','05',1),
	(1119,74,'Alpes Maritimes','06',1),
	(1120,74,'Ard&egrave;che','07',1),
	(1121,74,'Ardennes','08',1),
	(1122,74,'Ari&egrave;ge','09',1),
	(1123,74,'Aube','10',1),
	(1124,74,'Aude','11',1),
	(1125,74,'Aveyron','12',1),
	(1126,74,'Bouches du Rh&ocirc;ne','13',1),
	(1127,74,'Calvados','14',1),
	(1128,74,'Cantal','15',1),
	(1129,74,'Charente','16',1),
	(1130,74,'Charente Maritime','17',1),
	(1131,74,'Cher','18',1),
	(1132,74,'Corr&egrave;ze','19',1),
	(1133,74,'Corse du Sud','2A',1),
	(1134,74,'Haute Corse','2B',1),
	(1135,74,'C&ocirc;te d&#039;or','21',1),
	(1136,74,'C&ocirc;tes d&#039;Armor','22',1),
	(1137,74,'Creuse','23',1),
	(1138,74,'Dordogne','24',1),
	(1139,74,'Doubs','25',1),
	(1140,74,'Dr&ocirc;me','26',1),
	(1141,74,'Eure','27',1),
	(1142,74,'Eure et Loir','28',1),
	(1143,74,'Finist&egrave;re','29',1),
	(1144,74,'Gard','30',1),
	(1145,74,'Haute Garonne','31',1),
	(1146,74,'Gers','32',1),
	(1147,74,'Gironde','33',1),
	(1148,74,'H&eacute;rault','34',1),
	(1149,74,'Ille et Vilaine','35',1),
	(1150,74,'Indre','36',1),
	(1151,74,'Indre et Loire','37',1),
	(1152,74,'Is&eacute;re','38',1),
	(1153,74,'Jura','39',1),
	(1154,74,'Landes','40',1),
	(1155,74,'Loir et Cher','41',1),
	(1156,74,'Loire','42',1),
	(1157,74,'Haute Loire','43',1),
	(1158,74,'Loire Atlantique','44',1),
	(1159,74,'Loiret','45',1),
	(1160,74,'Lot','46',1),
	(1161,74,'Lot et Garonne','47',1),
	(1162,74,'Loz&egrave;re','48',1),
	(1163,74,'Maine et Loire','49',1),
	(1164,74,'Manche','50',1),
	(1165,74,'Marne','51',1),
	(1166,74,'Haute Marne','52',1),
	(1167,74,'Mayenne','53',1),
	(1168,74,'Meurthe et Moselle','54',1),
	(1169,74,'Meuse','55',1),
	(1170,74,'Morbihan','56',1),
	(1171,74,'Moselle','57',1),
	(1172,74,'Ni&egrave;vre','58',1),
	(1173,74,'Nord','59',1),
	(1174,74,'Oise','60',1),
	(1175,74,'Orne','61',1),
	(1176,74,'Pas de Calais','62',1),
	(1177,74,'Puy de D&ocirc;me','63',1),
	(1178,74,'Pyr&eacute;n&eacute;es Atlantiques','64',1),
	(1179,74,'Hautes Pyr&eacute;n&eacute;es','65',1),
	(1180,74,'Pyr&eacute;n&eacute;es Orientales','66',1),
	(1181,74,'Bas Rhin','67',1),
	(1182,74,'Haut Rhin','68',1),
	(1183,74,'Rh&ocirc;ne','69',1),
	(1184,74,'Haute Sa&ocirc;ne','70',1),
	(1185,74,'Sa&ocirc;ne et Loire','71',1),
	(1186,74,'Sarthe','72',1),
	(1187,74,'Savoie','73',1),
	(1188,74,'Haute Savoie','74',1),
	(1189,74,'Paris','75',1),
	(1190,74,'Seine Maritime','76',1),
	(1191,74,'Seine et Marne','77',1),
	(1192,74,'Yvelines','78',1),
	(1193,74,'Deux S&egrave;vres','79',1),
	(1194,74,'Somme','80',1),
	(1195,74,'Tarn','81',1),
	(1196,74,'Tarn et Garonne','82',1),
	(1197,74,'Var','83',1),
	(1198,74,'Vaucluse','84',1),
	(1199,74,'Vend&eacute;e','85',1),
	(1200,74,'Vienne','86',1),
	(1201,74,'Haute Vienne','87',1),
	(1202,74,'Vosges','88',1),
	(1203,74,'Yonne','89',1),
	(1204,74,'Territoire de Belfort','90',1),
	(1205,74,'Essonne','91',1),
	(1206,74,'Hauts de Seine','92',1),
	(1207,74,'Seine St-Denis','93',1),
	(1208,74,'Val de Marne','94',1),
	(1209,74,'Val d\'Oise','95',1),
	(1210,76,'Archipel des Marquises','M',1),
	(1211,76,'Archipel des Tuamotu','T',1),
	(1212,76,'Archipel des Tubuai','I',1),
	(1213,76,'Iles du Vent','V',1),
	(1214,76,'Iles Sous-le-Vent','S',1),
	(1215,77,'Iles Crozet','C',1),
	(1216,77,'Iles Kerguelen','K',1),
	(1217,77,'Ile Amsterdam','A',1),
	(1218,77,'Ile Saint-Paul','P',1),
	(1219,77,'Adelie Land','D',1),
	(1220,78,'Estuaire','ES',1),
	(1221,78,'Haut-Ogooue','HO',1),
	(1222,78,'Moyen-Ogooue','MO',1),
	(1223,78,'Ngounie','NG',1),
	(1224,78,'Nyanga','NY',1),
	(1225,78,'Ogooue-Ivindo','OI',1),
	(1226,78,'Ogooue-Lolo','OL',1),
	(1227,78,'Ogooue-Maritime','OM',1),
	(1228,78,'Woleu-Ntem','WN',1),
	(1229,79,'Banjul','BJ',1),
	(1230,79,'Basse','BS',1),
	(1231,79,'Brikama','BR',1),
	(1232,79,'Janjangbure','JA',1),
	(1233,79,'Kanifeng','KA',1),
	(1234,79,'Kerewan','KE',1),
	(1235,79,'Kuntaur','KU',1),
	(1236,79,'Mansakonko','MA',1),
	(1237,79,'Lower River','LR',1),
	(1238,79,'Central River','CR',1),
	(1239,79,'North Bank','NB',1),
	(1240,79,'Upper River','UR',1),
	(1241,79,'Western','WE',1),
	(1242,80,'Abkhazia','AB',1),
	(1243,80,'Ajaria','AJ',1),
	(1244,80,'Tbilisi','TB',1),
	(1245,80,'Guria','GU',1),
	(1246,80,'Imereti','IM',1),
	(1247,80,'Kakheti','KA',1),
	(1248,80,'Kvemo Kartli','KK',1),
	(1249,80,'Mtskheta-Mtianeti','MM',1),
	(1250,80,'Racha Lechkhumi and Kvemo Svanet','RL',1),
	(1251,80,'Samegrelo-Zemo Svaneti','SZ',1),
	(1252,80,'Samtskhe-Javakheti','SJ',1),
	(1253,80,'Shida Kartli','SK',1),
	(1254,81,'Baden-W&uuml;rttemberg','BAW',1),
	(1255,81,'Bayern','BAY',1),
	(1256,81,'Berlin','BER',1),
	(1257,81,'Brandenburg','BRG',1),
	(1258,81,'Bremen','BRE',1),
	(1259,81,'Hamburg','HAM',1),
	(1260,81,'Hessen','HES',1),
	(1261,81,'Mecklenburg-Vorpommern','MEC',1),
	(1262,81,'Niedersachsen','NDS',1),
	(1263,81,'Nordrhein-Westfalen','NRW',1),
	(1264,81,'Rheinland-Pfalz','RHE',1),
	(1265,81,'Saarland','SAR',1),
	(1266,81,'Sachsen','SAS',1),
	(1267,81,'Sachsen-Anhalt','SAC',1),
	(1268,81,'Schleswig-Holstein','SCN',1),
	(1269,81,'Th&uuml;ringen','THE',1),
	(1270,82,'Ashanti Region','AS',1),
	(1271,82,'Brong-Ahafo Region','BA',1),
	(1272,82,'Central Region','CE',1),
	(1273,82,'Eastern Region','EA',1),
	(1274,82,'Greater Accra Region','GA',1),
	(1275,82,'Northern Region','NO',1),
	(1276,82,'Upper East Region','UE',1),
	(1277,82,'Upper West Region','UW',1),
	(1278,82,'Volta Region','VO',1),
	(1279,82,'Western Region','WE',1),
	(1280,84,'Attica','AT',1),
	(1281,84,'Central Greece','CN',1),
	(1282,84,'Central Macedonia','CM',1),
	(1283,84,'Crete','CR',1),
	(1284,84,'East Macedonia and Thrace','EM',1),
	(1285,84,'Epirus','EP',1),
	(1286,84,'Ionian Islands','II',1),
	(1287,84,'North Aegean','NA',1),
	(1288,84,'Peloponnesos','PP',1),
	(1289,84,'South Aegean','SA',1),
	(1290,84,'Thessaly','TH',1),
	(1291,84,'West Greece','WG',1),
	(1292,84,'West Macedonia','WM',1),
	(1293,85,'Avannaa','A',1),
	(1294,85,'Tunu','T',1),
	(1295,85,'Kitaa','K',1),
	(1296,86,'Saint Andrew','A',1),
	(1297,86,'Saint David','D',1),
	(1298,86,'Saint George','G',1),
	(1299,86,'Saint John','J',1),
	(1300,86,'Saint Mark','M',1),
	(1301,86,'Saint Patrick','P',1),
	(1302,86,'Carriacou','C',1),
	(1303,86,'Petit Martinique','Q',1),
	(1304,89,'Alta Verapaz','AV',1),
	(1305,89,'Baja Verapaz','BV',1),
	(1306,89,'Chimaltenango','CM',1),
	(1307,89,'Chiquimula','CQ',1),
	(1308,89,'El Peten','PE',1),
	(1309,89,'El Progreso','PR',1),
	(1310,89,'El Quiche','QC',1),
	(1311,89,'Escuintla','ES',1),
	(1312,89,'Guatemala','GU',1),
	(1313,89,'Huehuetenango','HU',1),
	(1314,89,'Izabal','IZ',1),
	(1315,89,'Jalapa','JA',1),
	(1316,89,'Jutiapa','JU',1),
	(1317,89,'Quetzaltenango','QZ',1),
	(1318,89,'Retalhuleu','RE',1),
	(1319,89,'Sacatepequez','ST',1),
	(1320,89,'San Marcos','SM',1),
	(1321,89,'Santa Rosa','SR',1),
	(1322,89,'Solola','SO',1),
	(1323,89,'Suchitepequez','SU',1),
	(1324,89,'Totonicapan','TO',1),
	(1325,89,'Zacapa','ZA',1),
	(1326,90,'Conakry','CNK',1),
	(1327,90,'Beyla','BYL',1),
	(1328,90,'Boffa','BFA',1),
	(1329,90,'Boke','BOK',1),
	(1330,90,'Coyah','COY',1),
	(1331,90,'Dabola','DBL',1),
	(1332,90,'Dalaba','DLB',1),
	(1333,90,'Dinguiraye','DGR',1),
	(1334,90,'Dubreka','DBR',1),
	(1335,90,'Faranah','FRN',1),
	(1336,90,'Forecariah','FRC',1),
	(1337,90,'Fria','FRI',1),
	(1338,90,'Gaoual','GAO',1),
	(1339,90,'Gueckedou','GCD',1),
	(1340,90,'Kankan','KNK',1),
	(1341,90,'Kerouane','KRN',1),
	(1342,90,'Kindia','KND',1),
	(1343,90,'Kissidougou','KSD',1),
	(1344,90,'Koubia','KBA',1),
	(1345,90,'Koundara','KDA',1),
	(1346,90,'Kouroussa','KRA',1),
	(1347,90,'Labe','LAB',1),
	(1348,90,'Lelouma','LLM',1),
	(1349,90,'Lola','LOL',1),
	(1350,90,'Macenta','MCT',1),
	(1351,90,'Mali','MAL',1),
	(1352,90,'Mamou','MAM',1),
	(1353,90,'Mandiana','MAN',1),
	(1354,90,'Nzerekore','NZR',1),
	(1355,90,'Pita','PIT',1),
	(1356,90,'Siguiri','SIG',1),
	(1357,90,'Telimele','TLM',1),
	(1358,90,'Tougue','TOG',1),
	(1359,90,'Yomou','YOM',1),
	(1360,91,'Bafata Region','BF',1),
	(1361,91,'Biombo Region','BB',1),
	(1362,91,'Bissau Region','BS',1),
	(1363,91,'Bolama Region','BL',1),
	(1364,91,'Cacheu Region','CA',1),
	(1365,91,'Gabu Region','GA',1),
	(1366,91,'Oio Region','OI',1),
	(1367,91,'Quinara Region','QU',1),
	(1368,91,'Tombali Region','TO',1),
	(1369,92,'Barima-Waini','BW',1),
	(1370,92,'Cuyuni-Mazaruni','CM',1),
	(1371,92,'Demerara-Mahaica','DM',1),
	(1372,92,'East Berbice-Corentyne','EC',1),
	(1373,92,'Essequibo Islands-West Demerara','EW',1),
	(1374,92,'Mahaica-Berbice','MB',1),
	(1375,92,'Pomeroon-Supenaam','PM',1),
	(1376,92,'Potaro-Siparuni','PI',1),
	(1377,92,'Upper Demerara-Berbice','UD',1),
	(1378,92,'Upper Takutu-Upper Essequibo','UT',1),
	(1379,93,'Artibonite','AR',1),
	(1380,93,'Centre','CE',1),
	(1381,93,'Grand\'Anse','GA',1),
	(1382,93,'Nord','ND',1),
	(1383,93,'Nord-Est','NE',1),
	(1384,93,'Nord-Ouest','NO',1),
	(1385,93,'Ouest','OU',1),
	(1386,93,'Sud','SD',1),
	(1387,93,'Sud-Est','SE',1),
	(1388,94,'Flat Island','F',1),
	(1389,94,'McDonald Island','M',1),
	(1390,94,'Shag Island','S',1),
	(1391,94,'Heard Island','H',1),
	(1392,95,'Atlantida','AT',1),
	(1393,95,'Choluteca','CH',1),
	(1394,95,'Colon','CL',1),
	(1395,95,'Comayagua','CM',1),
	(1396,95,'Copan','CP',1),
	(1397,95,'Cortes','CR',1),
	(1398,95,'El Paraiso','PA',1),
	(1399,95,'Francisco Morazan','FM',1),
	(1400,95,'Gracias a Dios','GD',1),
	(1401,95,'Intibuca','IN',1),
	(1402,95,'Islas de la Bahia (Bay Islands)','IB',1),
	(1403,95,'La Paz','PZ',1),
	(1404,95,'Lempira','LE',1),
	(1405,95,'Ocotepeque','OC',1),
	(1406,95,'Olancho','OL',1),
	(1407,95,'Santa Barbara','SB',1),
	(1408,95,'Valle','VA',1),
	(1409,95,'Yoro','YO',1),
	(1410,96,'Central and Western Hong Kong Island','HCW',1),
	(1411,96,'Eastern Hong Kong Island','HEA',1),
	(1412,96,'Southern Hong Kong Island','HSO',1),
	(1413,96,'Wan Chai Hong Kong Island','HWC',1),
	(1414,96,'Kowloon City Kowloon','KKC',1),
	(1415,96,'Kwun Tong Kowloon','KKT',1),
	(1416,96,'Sham Shui Po Kowloon','KSS',1),
	(1417,96,'Wong Tai Sin Kowloon','KWT',1),
	(1418,96,'Yau Tsim Mong Kowloon','KYT',1),
	(1419,96,'Islands New Territories','NIS',1),
	(1420,96,'Kwai Tsing New Territories','NKT',1),
	(1421,96,'North New Territories','NNO',1),
	(1422,96,'Sai Kung New Territories','NSK',1),
	(1423,96,'Sha Tin New Territories','NST',1),
	(1424,96,'Tai Po New Territories','NTP',1),
	(1425,96,'Tsuen Wan New Territories','NTW',1),
	(1426,96,'Tuen Mun New Territories','NTM',1),
	(1427,96,'Yuen Long New Territories','NYL',1),
	(1428,97,'Bacs-Kiskun','BK',1),
	(1429,97,'Baranya','BA',1),
	(1430,97,'Bekes','BE',1),
	(1431,97,'Bekescsaba','BS',1),
	(1432,97,'Borsod-Abauj-Zemplen','BZ',1),
	(1433,97,'Budapest','BU',1),
	(1434,97,'Csongrad','CS',1),
	(1435,97,'Debrecen','DE',1),
	(1436,97,'Dunaujvaros','DU',1),
	(1437,97,'Eger','EG',1),
	(1438,97,'Fejer','FE',1),
	(1439,97,'Gyor','GY',1),
	(1440,97,'Gyor-Moson-Sopron','GM',1),
	(1441,97,'Hajdu-Bihar','HB',1),
	(1442,97,'Heves','HE',1),
	(1443,97,'Hodmezovasarhely','HO',1),
	(1444,97,'Jasz-Nagykun-Szolnok','JN',1),
	(1445,97,'Kaposvar','KA',1),
	(1446,97,'Kecskemet','KE',1),
	(1447,97,'Komarom-Esztergom','KO',1),
	(1448,97,'Miskolc','MI',1),
	(1449,97,'Nagykanizsa','NA',1),
	(1450,97,'Nograd','NO',1),
	(1451,97,'Nyiregyhaza','NY',1),
	(1452,97,'Pecs','PE',1),
	(1453,97,'Pest','PS',1),
	(1454,97,'Somogy','SO',1),
	(1455,97,'Sopron','SP',1),
	(1456,97,'Szabolcs-Szatmar-Bereg','SS',1),
	(1457,97,'Szeged','SZ',1),
	(1458,97,'Szekesfehervar','SE',1),
	(1459,97,'Szolnok','SL',1),
	(1460,97,'Szombathely','SM',1),
	(1461,97,'Tatabanya','TA',1),
	(1462,97,'Tolna','TO',1),
	(1463,97,'Vas','VA',1),
	(1464,97,'Veszprem','VE',1),
	(1465,97,'Zala','ZA',1),
	(1466,97,'Zalaegerszeg','ZZ',1),
	(1467,98,'Austurland','AL',1),
	(1468,98,'Hofuoborgarsvaeoi','HF',1),
	(1469,98,'Norourland eystra','NE',1),
	(1470,98,'Norourland vestra','NV',1),
	(1471,98,'Suourland','SL',1),
	(1472,98,'Suournes','SN',1),
	(1473,98,'Vestfiroir','VF',1),
	(1474,98,'Vesturland','VL',1),
	(1475,99,'Andaman and Nicobar Islands','AN',1),
	(1476,99,'Andhra Pradesh','AP',1),
	(1477,99,'Arunachal Pradesh','AR',1),
	(1478,99,'Assam','AS',1),
	(1479,99,'Bihar','BI',1),
	(1480,99,'Chandigarh','CH',1),
	(1481,99,'Dadra and Nagar Haveli','DA',1),
	(1482,99,'Daman and Diu','DM',1),
	(1483,99,'Delhi','DE',1),
	(1484,99,'Goa','GO',1),
	(1485,99,'Gujarat','GU',1),
	(1486,99,'Haryana','HA',1),
	(1487,99,'Himachal Pradesh','HP',1),
	(1488,99,'Jammu and Kashmir','JA',1),
	(1489,99,'Karnataka','KA',1),
	(1490,99,'Kerala','KE',1),
	(1491,99,'Lakshadweep Islands','LI',1),
	(1492,99,'Madhya Pradesh','MP',1),
	(1493,99,'Maharashtra','MA',1),
	(1494,99,'Manipur','MN',1),
	(1495,99,'Meghalaya','ME',1),
	(1496,99,'Mizoram','MI',1),
	(1497,99,'Nagaland','NA',1),
	(1498,99,'Orissa','OR',1),
	(1499,99,'Pondicherry','PO',1),
	(1500,99,'Punjab','PU',1),
	(1501,99,'Rajasthan','RA',1),
	(1502,99,'Sikkim','SI',1),
	(1503,99,'Tamil Nadu','TN',1),
	(1504,99,'Tripura','TR',1),
	(1505,99,'Uttar Pradesh','UP',1),
	(1506,99,'West Bengal','WB',1),
	(1507,100,'Aceh','AC',1),
	(1508,100,'Bali','BA',1),
	(1509,100,'Banten','BT',1),
	(1510,100,'Bengkulu','BE',1),
	(1511,100,'BoDeTaBek','BD',1),
	(1512,100,'Gorontalo','GO',1),
	(1513,100,'Jakarta Raya','JK',1),
	(1514,100,'Jambi','JA',1),
	(1515,100,'Jawa Barat','JB',1),
	(1516,100,'Jawa Tengah','JT',1),
	(1517,100,'Jawa Timur','JI',1),
	(1518,100,'Kalimantan Barat','KB',1),
	(1519,100,'Kalimantan Selatan','KS',1),
	(1520,100,'Kalimantan Tengah','KT',1),
	(1521,100,'Kalimantan Timur','KI',1),
	(1522,100,'Kepulauan Bangka Belitung','BB',1),
	(1523,100,'Lampung','LA',1),
	(1524,100,'Maluku','MA',1),
	(1525,100,'Maluku Utara','MU',1),
	(1526,100,'Nusa Tenggara Barat','NB',1),
	(1527,100,'Nusa Tenggara Timur','NT',1),
	(1528,100,'Papua','PA',1),
	(1529,100,'Riau','RI',1),
	(1530,100,'Sulawesi Selatan','SN',1),
	(1531,100,'Sulawesi Tengah','ST',1),
	(1532,100,'Sulawesi Tenggara','SG',1),
	(1533,100,'Sulawesi Utara','SA',1),
	(1534,100,'Sumatera Barat','SB',1),
	(1535,100,'Sumatera Selatan','SS',1),
	(1536,100,'Sumatera Utara','SU',1),
	(1537,100,'Yogyakarta','YO',1),
	(1538,101,'Tehran','TEH',1),
	(1539,101,'Qom','QOM',1),
	(1540,101,'Markazi','MKZ',1),
	(1541,101,'Qazvin','QAZ',1),
	(1542,101,'Gilan','GIL',1),
	(1543,101,'Ardabil','ARD',1),
	(1544,101,'Zanjan','ZAN',1),
	(1545,101,'East Azarbaijan','EAZ',1),
	(1546,101,'West Azarbaijan','WEZ',1),
	(1547,101,'Kurdistan','KRD',1),
	(1548,101,'Hamadan','HMD',1),
	(1549,101,'Kermanshah','KRM',1),
	(1550,101,'Ilam','ILM',1),
	(1551,101,'Lorestan','LRS',1),
	(1552,101,'Khuzestan','KZT',1),
	(1553,101,'Chahar Mahaal and Bakhtiari','CMB',1),
	(1554,101,'Kohkiluyeh and Buyer Ahmad','KBA',1),
	(1555,101,'Bushehr','BSH',1),
	(1556,101,'Fars','FAR',1),
	(1557,101,'Hormozgan','HRM',1),
	(1558,101,'Sistan and Baluchistan','SBL',1),
	(1559,101,'Kerman','KRB',1),
	(1560,101,'Yazd','YZD',1),
	(1561,101,'Esfahan','EFH',1),
	(1562,101,'Semnan','SMN',1),
	(1563,101,'Mazandaran','MZD',1),
	(1564,101,'Golestan','GLS',1),
	(1565,101,'North Khorasan','NKH',1),
	(1566,101,'Razavi Khorasan','RKH',1),
	(1567,101,'South Khorasan','SKH',1),
	(1568,102,'Baghdad','BD',1),
	(1569,102,'Salah ad Din','SD',1),
	(1570,102,'Diyala','DY',1),
	(1571,102,'Wasit','WS',1),
	(1572,102,'Maysan','MY',1),
	(1573,102,'Al Basrah','BA',1),
	(1574,102,'Dhi Qar','DQ',1),
	(1575,102,'Al Muthanna','MU',1),
	(1576,102,'Al Qadisyah','QA',1),
	(1577,102,'Babil','BB',1),
	(1578,102,'Al Karbala','KB',1),
	(1579,102,'An Najaf','NJ',1),
	(1580,102,'Al Anbar','AB',1),
	(1581,102,'Ninawa','NN',1),
	(1582,102,'Dahuk','DH',1),
	(1583,102,'Arbil','AL',1),
	(1584,102,'At Ta\'mim','TM',1),
	(1585,102,'As Sulaymaniyah','SL',1),
	(1586,103,'Carlow','CA',1),
	(1587,103,'Cavan','CV',1),
	(1588,103,'Clare','CL',1),
	(1589,103,'Cork','CO',1),
	(1590,103,'Donegal','DO',1),
	(1591,103,'Dublin','DU',1),
	(1592,103,'Galway','GA',1),
	(1593,103,'Kerry','KE',1),
	(1594,103,'Kildare','KI',1),
	(1595,103,'Kilkenny','KL',1),
	(1596,103,'Laois','LA',1),
	(1597,103,'Leitrim','LE',1),
	(1598,103,'Limerick','LI',1),
	(1599,103,'Longford','LO',1),
	(1600,103,'Louth','LU',1),
	(1601,103,'Mayo','MA',1),
	(1602,103,'Meath','ME',1),
	(1603,103,'Monaghan','MO',1),
	(1604,103,'Offaly','OF',1),
	(1605,103,'Roscommon','RO',1),
	(1606,103,'Sligo','SL',1),
	(1607,103,'Tipperary','TI',1),
	(1608,103,'Waterford','WA',1),
	(1609,103,'Westmeath','WE',1),
	(1610,103,'Wexford','WX',1),
	(1611,103,'Wicklow','WI',1),
	(1612,104,'Be\'er Sheva','BS',1),
	(1613,104,'Bika\'at Hayarden','BH',1),
	(1614,104,'Eilat and Arava','EA',1),
	(1615,104,'Galil','GA',1),
	(1616,104,'Haifa','HA',1),
	(1617,104,'Jehuda Mountains','JM',1),
	(1618,104,'Jerusalem','JE',1),
	(1619,104,'Negev','NE',1),
	(1620,104,'Semaria','SE',1),
	(1621,104,'Sharon','SH',1),
	(1622,104,'Tel Aviv (Gosh Dan)','TA',1),
	(3860,105,'Caltanissetta','CL',1),
	(3842,105,'Agrigento','AG',1),
	(3843,105,'Alessandria','AL',1),
	(3844,105,'Ancona','AN',1),
	(3845,105,'Aosta','AO',1),
	(3846,105,'Arezzo','AR',1),
	(3847,105,'Ascoli Piceno','AP',1),
	(3848,105,'Asti','AT',1),
	(3849,105,'Avellino','AV',1),
	(3850,105,'Bari','BA',1),
	(3851,105,'Belluno','BL',1),
	(3852,105,'Benevento','BN',1),
	(3853,105,'Bergamo','BG',1),
	(3854,105,'Biella','BI',1),
	(3855,105,'Bologna','BO',1),
	(3856,105,'Bolzano','BZ',1),
	(3857,105,'Brescia','BS',1),
	(3858,105,'Brindisi','BR',1),
	(3859,105,'Cagliari','CA',1),
	(1643,106,'Clarendon Parish','CLA',1),
	(1644,106,'Hanover Parish','HAN',1),
	(1645,106,'Kingston Parish','KIN',1),
	(1646,106,'Manchester Parish','MAN',1),
	(1647,106,'Portland Parish','POR',1),
	(1648,106,'Saint Andrew Parish','AND',1),
	(1649,106,'Saint Ann Parish','ANN',1),
	(1650,106,'Saint Catherine Parish','CAT',1),
	(1651,106,'Saint Elizabeth Parish','ELI',1),
	(1652,106,'Saint James Parish','JAM',1),
	(1653,106,'Saint Mary Parish','MAR',1),
	(1654,106,'Saint Thomas Parish','THO',1),
	(1655,106,'Trelawny Parish','TRL',1),
	(1656,106,'Westmoreland Parish','WML',1),
	(1657,107,'Aichi','AI',1),
	(1658,107,'Akita','AK',1),
	(1659,107,'Aomori','AO',1),
	(1660,107,'Chiba','CH',1),
	(1661,107,'Ehime','EH',1),
	(1662,107,'Fukui','FK',1),
	(1663,107,'Fukuoka','FU',1),
	(1664,107,'Fukushima','FS',1),
	(1665,107,'Gifu','GI',1),
	(1666,107,'Gumma','GU',1),
	(1667,107,'Hiroshima','HI',1),
	(1668,107,'Hokkaido','HO',1),
	(1669,107,'Hyogo','HY',1),
	(1670,107,'Ibaraki','IB',1),
	(1671,107,'Ishikawa','IS',1),
	(1672,107,'Iwate','IW',1),
	(1673,107,'Kagawa','KA',1),
	(1674,107,'Kagoshima','KG',1),
	(1675,107,'Kanagawa','KN',1),
	(1676,107,'Kochi','KO',1),
	(1677,107,'Kumamoto','KU',1),
	(1678,107,'Kyoto','KY',1),
	(1679,107,'Mie','MI',1),
	(1680,107,'Miyagi','MY',1),
	(1681,107,'Miyazaki','MZ',1),
	(1682,107,'Nagano','NA',1),
	(1683,107,'Nagasaki','NG',1),
	(1684,107,'Nara','NR',1),
	(1685,107,'Niigata','NI',1),
	(1686,107,'Oita','OI',1),
	(1687,107,'Okayama','OK',1),
	(1688,107,'Okinawa','ON',1),
	(1689,107,'Osaka','OS',1),
	(1690,107,'Saga','SA',1),
	(1691,107,'Saitama','SI',1),
	(1692,107,'Shiga','SH',1),
	(1693,107,'Shimane','SM',1),
	(1694,107,'Shizuoka','SZ',1),
	(1695,107,'Tochigi','TO',1),
	(1696,107,'Tokushima','TS',1),
	(1697,107,'Tokyo','TK',1),
	(1698,107,'Tottori','TT',1),
	(1699,107,'Toyama','TY',1),
	(1700,107,'Wakayama','WA',1),
	(1701,107,'Yamagata','YA',1),
	(1702,107,'Yamaguchi','YM',1),
	(1703,107,'Yamanashi','YN',1),
	(1704,108,'\'Amman','AM',1),
	(1705,108,'Ajlun','AJ',1),
	(1706,108,'Al \'Aqabah','AA',1),
	(1707,108,'Al Balqa\'','AB',1),
	(1708,108,'Al Karak','AK',1),
	(1709,108,'Al Mafraq','AL',1),
	(1710,108,'At Tafilah','AT',1),
	(1711,108,'Az Zarqa\'','AZ',1),
	(1712,108,'Irbid','IR',1),
	(1713,108,'Jarash','JA',1),
	(1714,108,'Ma\'an','MA',1),
	(1715,108,'Madaba','MD',1),
	(1716,109,'Алматинская область','AL',1),
	(1717,109,'Алматы - город республ-го значения','AC',1),
	(1718,109,'Акмолинская область','AM',1),
	(1719,109,'Актюбинская область','AQ',1),
	(1720,109,'Астана - город республ-го значения','AS',1),
	(1721,109,'Атырауская область','AT',1),
	(1722,109,'Западно-Казахстанская область','BA',1),
	(1723,109,'Байконур - город республ-го значения','BY',1),
	(1724,109,'Мангистауская область','MA',1),
	(1725,109,'Южно-Казахстанская область','ON',1),
	(1726,109,'Павлодарская область','PA',1),
	(1727,109,'Карагандинская область','QA',1),
	(1728,109,'Костанайская область','QO',1),
	(1729,109,'Кызылординская область','QY',1),
	(1730,109,'Восточно-Казахстанская область','SH',1),
	(1731,109,'Северо-Казахстанская область','SO',1),
	(1732,109,'Жамбылская область','ZH',1),
	(1733,110,'Central','CE',1),
	(1734,110,'Coast','CO',1),
	(1735,110,'Eastern','EA',1),
	(1736,110,'Nairobi Area','NA',1),
	(1737,110,'North Eastern','NE',1),
	(1738,110,'Nyanza','NY',1),
	(1739,110,'Rift Valley','RV',1),
	(1740,110,'Western','WE',1),
	(1741,111,'Abaiang','AG',1),
	(1742,111,'Abemama','AM',1),
	(1743,111,'Aranuka','AK',1),
	(1744,111,'Arorae','AO',1),
	(1745,111,'Banaba','BA',1),
	(1746,111,'Beru','BE',1),
	(1747,111,'Butaritari','bT',1),
	(1748,111,'Kanton','KA',1),
	(1749,111,'Kiritimati','KR',1),
	(1750,111,'Kuria','KU',1),
	(1751,111,'Maiana','MI',1),
	(1752,111,'Makin','MN',1),
	(1753,111,'Marakei','ME',1),
	(1754,111,'Nikunau','NI',1),
	(1755,111,'Nonouti','NO',1),
	(1756,111,'Onotoa','ON',1),
	(1757,111,'Tabiteuea','TT',1),
	(1758,111,'Tabuaeran','TR',1),
	(1759,111,'Tamana','TM',1),
	(1760,111,'Tarawa','TW',1),
	(1761,111,'Teraina','TE',1),
	(1762,112,'Chagang-do','CHA',1),
	(1763,112,'Hamgyong-bukto','HAB',1),
	(1764,112,'Hamgyong-namdo','HAN',1),
	(1765,112,'Hwanghae-bukto','HWB',1),
	(1766,112,'Hwanghae-namdo','HWN',1),
	(1767,112,'Kangwon-do','KAN',1),
	(1768,112,'P\'yongan-bukto','PYB',1),
	(1769,112,'P\'yongan-namdo','PYN',1),
	(1770,112,'Ryanggang-do (Yanggang-do)','YAN',1),
	(1771,112,'Rason Directly Governed City','NAJ',1),
	(1772,112,'P\'yongyang Special City','PYO',1),
	(1773,113,'Ch\'ungch\'ong-bukto','CO',1),
	(1774,113,'Ch\'ungch\'ong-namdo','CH',1),
	(1775,113,'Cheju-do','CD',1),
	(1776,113,'Cholla-bukto','CB',1),
	(1777,113,'Cholla-namdo','CN',1),
	(1778,113,'Inch\'on-gwangyoksi','IG',1),
	(1779,113,'Kangwon-do','KA',1),
	(1780,113,'Kwangju-gwangyoksi','KG',1),
	(1781,113,'Kyonggi-do','KD',1),
	(1782,113,'Kyongsang-bukto','KB',1),
	(1783,113,'Kyongsang-namdo','KN',1),
	(1784,113,'Pusan-gwangyoksi','PG',1),
	(1785,113,'Soul-t\'ukpyolsi','SO',1),
	(1786,113,'Taegu-gwangyoksi','TA',1),
	(1787,113,'Taejon-gwangyoksi','TG',1),
	(1788,114,'Al \'Asimah','AL',1),
	(1789,114,'Al Ahmadi','AA',1),
	(1790,114,'Al Farwaniyah','AF',1),
	(1791,114,'Al Jahra\'','AJ',1),
	(1792,114,'Hawalli','HA',1),
	(1793,115,'Bishkek','GB',1),
	(1794,115,'Batken','B',1),
	(1795,115,'Chu','C',1),
	(1796,115,'Jalal-Abad','J',1),
	(1797,115,'Naryn','N',1),
	(1798,115,'Osh','O',1),
	(1799,115,'Talas','T',1),
	(1800,115,'Ysyk-Kol','Y',1),
	(1801,116,'Vientiane','VT',1),
	(1802,116,'Attapu','AT',1),
	(1803,116,'Bokeo','BK',1),
	(1804,116,'Bolikhamxai','BL',1),
	(1805,116,'Champasak','CH',1),
	(1806,116,'Houaphan','HO',1),
	(1807,116,'Khammouan','KH',1),
	(1808,116,'Louang Namtha','LM',1),
	(1809,116,'Louangphabang','LP',1),
	(1810,116,'Oudomxai','OU',1),
	(1811,116,'Phongsali','PH',1),
	(1812,116,'Salavan','SL',1),
	(1813,116,'Savannakhet','SV',1),
	(1814,116,'Vientiane','VI',1),
	(1815,116,'Xaignabouli','XA',1),
	(1816,116,'Xekong','XE',1),
	(1817,116,'Xiangkhoang','XI',1),
	(1818,116,'Xaisomboun','XN',1),
	(1819,117,'Aizkraukles Rajons','AIZ',1),
	(1820,117,'Aluksnes Rajons','ALU',1),
	(1821,117,'Balvu Rajons','BAL',1),
	(1822,117,'Bauskas Rajons','BAU',1),
	(1823,117,'Cesu Rajons','CES',1),
	(1824,117,'Daugavpils Rajons','DGR',1),
	(1825,117,'Dobeles Rajons','DOB',1),
	(1826,117,'Gulbenes Rajons','GUL',1),
	(1827,117,'Jekabpils Rajons','JEK',1),
	(1828,117,'Jelgavas Rajons','JGR',1),
	(1829,117,'Kraslavas Rajons','KRA',1),
	(1830,117,'Kuldigas Rajons','KUL',1),
	(1831,117,'Liepajas Rajons','LPR',1),
	(1832,117,'Limbazu Rajons','LIM',1),
	(1833,117,'Ludzas Rajons','LUD',1),
	(1834,117,'Madonas Rajons','MAD',1),
	(1835,117,'Ogres Rajons','OGR',1),
	(1836,117,'Preilu Rajons','PRE',1),
	(1837,117,'Rezeknes Rajons','RZR',1),
	(1838,117,'Rigas Rajons','RGR',1),
	(1839,117,'Saldus Rajons','SAL',1),
	(1840,117,'Talsu Rajons','TAL',1),
	(1841,117,'Tukuma Rajons','TUK',1),
	(1842,117,'Valkas Rajons','VLK',1),
	(1843,117,'Valmieras Rajons','VLM',1),
	(1844,117,'Ventspils Rajons','VSR',1),
	(1845,117,'Daugavpils','DGV',1),
	(1846,117,'Jelgava','JGV',1),
	(1847,117,'Jurmala','JUR',1),
	(1848,117,'Liepaja','LPK',1),
	(1849,117,'Rezekne','RZK',1),
	(1850,117,'Riga','RGA',1),
	(1851,117,'Ventspils','VSL',1),
	(1852,119,'Berea','BE',1),
	(1853,119,'Butha-Buthe','BB',1),
	(1854,119,'Leribe','LE',1),
	(1855,119,'Mafeteng','MF',1),
	(1856,119,'Maseru','MS',1),
	(1857,119,'Mohale\'s Hoek','MH',1),
	(1858,119,'Mokhotlong','MK',1),
	(1859,119,'Qacha\'s Nek','QN',1),
	(1860,119,'Quthing','QT',1),
	(1861,119,'Thaba-Tseka','TT',1),
	(1862,120,'Bomi','BI',1),
	(1863,120,'Bong','BG',1),
	(1864,120,'Grand Bassa','GB',1),
	(1865,120,'Grand Cape Mount','CM',1),
	(1866,120,'Grand Gedeh','GG',1),
	(1867,120,'Grand Kru','GK',1),
	(1868,120,'Lofa','LO',1),
	(1869,120,'Margibi','MG',1),
	(1870,120,'Maryland','ML',1),
	(1871,120,'Montserrado','MS',1),
	(1872,120,'Nimba','NB',1),
	(1873,120,'River Cess','RC',1),
	(1874,120,'Sinoe','SN',1),
	(1875,121,'Ajdabiya','AJ',1),
	(1876,121,'Al \'Aziziyah','AZ',1),
	(1877,121,'Al Fatih','FA',1),
	(1878,121,'Al Jabal al Akhdar','JA',1),
	(1879,121,'Al Jufrah','JU',1),
	(1880,121,'Al Khums','KH',1),
	(1881,121,'Al Kufrah','KU',1),
	(1882,121,'An Nuqat al Khams','NK',1),
	(1883,121,'Ash Shati\'','AS',1),
	(1884,121,'Awbari','AW',1),
	(1885,121,'Az Zawiyah','ZA',1),
	(1886,121,'Banghazi','BA',1),
	(1887,121,'Darnah','DA',1),
	(1888,121,'Ghadamis','GD',1),
	(1889,121,'Gharyan','GY',1),
	(1890,121,'Misratah','MI',1),
	(1891,121,'Murzuq','MZ',1),
	(1892,121,'Sabha','SB',1),
	(1893,121,'Sawfajjin','SW',1),
	(1894,121,'Surt','SU',1),
	(1895,121,'Tarabulus (Tripoli)','TL',1),
	(1896,121,'Tarhunah','TH',1),
	(1897,121,'Tubruq','TU',1),
	(1898,121,'Yafran','YA',1),
	(1899,121,'Zlitan','ZL',1),
	(1900,122,'Vaduz','V',1),
	(1901,122,'Schaan','A',1),
	(1902,122,'Balzers','B',1),
	(1903,122,'Triesen','N',1),
	(1904,122,'Eschen','E',1),
	(1905,122,'Mauren','M',1),
	(1906,122,'Triesenberg','T',1),
	(1907,122,'Ruggell','R',1),
	(1908,122,'Gamprin','G',1),
	(1909,122,'Schellenberg','L',1),
	(1910,122,'Planken','P',1),
	(1911,123,'Alytus','AL',1),
	(1912,123,'Kaunas','KA',1),
	(1913,123,'Klaipeda','KL',1),
	(1914,123,'Marijampole','MA',1),
	(1915,123,'Panevezys','PA',1),
	(1916,123,'Siauliai','SI',1),
	(1917,123,'Taurage','TA',1),
	(1918,123,'Telsiai','TE',1),
	(1919,123,'Utena','UT',1),
	(1920,123,'Vilnius','VI',1),
	(1921,124,'Diekirch','DD',1),
	(1922,124,'Clervaux','DC',1),
	(1923,124,'Redange','DR',1),
	(1924,124,'Vianden','DV',1),
	(1925,124,'Wiltz','DW',1),
	(1926,124,'Grevenmacher','GG',1),
	(1927,124,'Echternach','GE',1),
	(1928,124,'Remich','GR',1),
	(1929,124,'Luxembourg','LL',1),
	(1930,124,'Capellen','LC',1),
	(1931,124,'Esch-sur-Alzette','LE',1),
	(1932,124,'Mersch','LM',1),
	(1933,125,'Our Lady Fatima Parish','OLF',1),
	(1934,125,'St. Anthony Parish','ANT',1),
	(1935,125,'St. Lazarus Parish','LAZ',1),
	(1936,125,'Cathedral Parish','CAT',1),
	(1937,125,'St. Lawrence Parish','LAW',1),
	(1938,127,'Antananarivo','AN',1),
	(1939,127,'Antsiranana','AS',1),
	(1940,127,'Fianarantsoa','FN',1),
	(1941,127,'Mahajanga','MJ',1),
	(1942,127,'Toamasina','TM',1),
	(1943,127,'Toliara','TL',1),
	(1944,128,'Balaka','BLK',1),
	(1945,128,'Blantyre','BLT',1),
	(1946,128,'Chikwawa','CKW',1),
	(1947,128,'Chiradzulu','CRD',1),
	(1948,128,'Chitipa','CTP',1),
	(1949,128,'Dedza','DDZ',1),
	(1950,128,'Dowa','DWA',1),
	(1951,128,'Karonga','KRG',1),
	(1952,128,'Kasungu','KSG',1),
	(1953,128,'Likoma','LKM',1),
	(1954,128,'Lilongwe','LLG',1),
	(1955,128,'Machinga','MCG',1),
	(1956,128,'Mangochi','MGC',1),
	(1957,128,'Mchinji','MCH',1),
	(1958,128,'Mulanje','MLJ',1),
	(1959,128,'Mwanza','MWZ',1),
	(1960,128,'Mzimba','MZM',1),
	(1961,128,'Ntcheu','NTU',1),
	(1962,128,'Nkhata Bay','NKB',1),
	(1963,128,'Nkhotakota','NKH',1),
	(1964,128,'Nsanje','NSJ',1),
	(1965,128,'Ntchisi','NTI',1),
	(1966,128,'Phalombe','PHL',1),
	(1967,128,'Rumphi','RMP',1),
	(1968,128,'Salima','SLM',1),
	(1969,128,'Thyolo','THY',1),
	(1970,128,'Zomba','ZBA',1),
	(1971,129,'Johor','JO',1),
	(1972,129,'Kedah','KE',1),
	(1973,129,'Kelantan','KL',1),
	(1974,129,'Labuan','LA',1),
	(1975,129,'Melaka','ME',1),
	(1976,129,'Negeri Sembilan','NS',1),
	(1977,129,'Pahang','PA',1),
	(1978,129,'Perak','PE',1),
	(1979,129,'Perlis','PR',1),
	(1980,129,'Pulau Pinang','PP',1),
	(1981,129,'Sabah','SA',1),
	(1982,129,'Sarawak','SR',1),
	(1983,129,'Selangor','SE',1),
	(1984,129,'Terengganu','TE',1),
	(1985,129,'Wilayah Persekutuan','WP',1),
	(1986,130,'Thiladhunmathi Uthuru','THU',1),
	(1987,130,'Thiladhunmathi Dhekunu','THD',1),
	(1988,130,'Miladhunmadulu Uthuru','MLU',1),
	(1989,130,'Miladhunmadulu Dhekunu','MLD',1),
	(1990,130,'Maalhosmadulu Uthuru','MAU',1),
	(1991,130,'Maalhosmadulu Dhekunu','MAD',1),
	(1992,130,'Faadhippolhu','FAA',1),
	(1993,130,'Male Atoll','MAA',1),
	(1994,130,'Ari Atoll Uthuru','AAU',1),
	(1995,130,'Ari Atoll Dheknu','AAD',1),
	(1996,130,'Felidhe Atoll','FEA',1),
	(1997,130,'Mulaku Atoll','MUA',1),
	(1998,130,'Nilandhe Atoll Uthuru','NAU',1),
	(1999,130,'Nilandhe Atoll Dhekunu','NAD',1),
	(2000,130,'Kolhumadulu','KLH',1),
	(2001,130,'Hadhdhunmathi','HDH',1),
	(2002,130,'Huvadhu Atoll Uthuru','HAU',1),
	(2003,130,'Huvadhu Atoll Dhekunu','HAD',1),
	(2004,130,'Fua Mulaku','FMU',1),
	(2005,130,'Addu','ADD',1),
	(2006,131,'Gao','GA',1),
	(2007,131,'Kayes','KY',1),
	(2008,131,'Kidal','KD',1),
	(2009,131,'Koulikoro','KL',1),
	(2010,131,'Mopti','MP',1),
	(2011,131,'Segou','SG',1),
	(2012,131,'Sikasso','SK',1),
	(2013,131,'Tombouctou','TB',1),
	(2014,131,'Bamako Capital District','CD',1),
	(2015,132,'Attard','ATT',1),
	(2016,132,'Balzan','BAL',1),
	(2017,132,'Birgu','BGU',1),
	(2018,132,'Birkirkara','BKK',1),
	(2019,132,'Birzebbuga','BRZ',1),
	(2020,132,'Bormla','BOR',1),
	(2021,132,'Dingli','DIN',1),
	(2022,132,'Fgura','FGU',1),
	(2023,132,'Floriana','FLO',1),
	(2024,132,'Gudja','GDJ',1),
	(2025,132,'Gzira','GZR',1),
	(2026,132,'Gargur','GRG',1),
	(2027,132,'Gaxaq','GXQ',1),
	(2028,132,'Hamrun','HMR',1),
	(2029,132,'Iklin','IKL',1),
	(2030,132,'Isla','ISL',1),
	(2031,132,'Kalkara','KLK',1),
	(2032,132,'Kirkop','KRK',1),
	(2033,132,'Lija','LIJ',1),
	(2034,132,'Luqa','LUQ',1),
	(2035,132,'Marsa','MRS',1),
	(2036,132,'Marsaskala','MKL',1),
	(2037,132,'Marsaxlokk','MXL',1),
	(2038,132,'Mdina','MDN',1),
	(2039,132,'Melliea','MEL',1),
	(2040,132,'Mgarr','MGR',1),
	(2041,132,'Mosta','MST',1),
	(2042,132,'Mqabba','MQA',1),
	(2043,132,'Msida','MSI',1),
	(2044,132,'Mtarfa','MTF',1),
	(2045,132,'Naxxar','NAX',1),
	(2046,132,'Paola','PAO',1),
	(2047,132,'Pembroke','PEM',1),
	(2048,132,'Pieta','PIE',1),
	(2049,132,'Qormi','QOR',1),
	(2050,132,'Qrendi','QRE',1),
	(2051,132,'Rabat','RAB',1),
	(2052,132,'Safi','SAF',1),
	(2053,132,'San Giljan','SGI',1),
	(2054,132,'Santa Lucija','SLU',1),
	(2055,132,'San Pawl il-Bahar','SPB',1),
	(2056,132,'San Gwann','SGW',1),
	(2057,132,'Santa Venera','SVE',1),
	(2058,132,'Siggiewi','SIG',1),
	(2059,132,'Sliema','SLM',1),
	(2060,132,'Swieqi','SWQ',1),
	(2061,132,'Ta Xbiex','TXB',1),
	(2062,132,'Tarxien','TRX',1),
	(2063,132,'Valletta','VLT',1),
	(2064,132,'Xgajra','XGJ',1),
	(2065,132,'Zabbar','ZBR',1),
	(2066,132,'Zebbug','ZBG',1),
	(2067,132,'Zejtun','ZJT',1),
	(2068,132,'Zurrieq','ZRQ',1),
	(2069,132,'Fontana','FNT',1),
	(2070,132,'Ghajnsielem','GHJ',1),
	(2071,132,'Gharb','GHR',1),
	(2072,132,'Ghasri','GHS',1),
	(2073,132,'Kercem','KRC',1),
	(2074,132,'Munxar','MUN',1),
	(2075,132,'Nadur','NAD',1),
	(2076,132,'Qala','QAL',1),
	(2077,132,'Victoria','VIC',1),
	(2078,132,'San Lawrenz','SLA',1),
	(2079,132,'Sannat','SNT',1),
	(2080,132,'Xagra','ZAG',1),
	(2081,132,'Xewkija','XEW',1),
	(2082,132,'Zebbug','ZEB',1),
	(2083,133,'Ailinginae','ALG',1),
	(2084,133,'Ailinglaplap','ALL',1),
	(2085,133,'Ailuk','ALK',1),
	(2086,133,'Arno','ARN',1),
	(2087,133,'Aur','AUR',1),
	(2088,133,'Bikar','BKR',1),
	(2089,133,'Bikini','BKN',1),
	(2090,133,'Bokak','BKK',1),
	(2091,133,'Ebon','EBN',1),
	(2092,133,'Enewetak','ENT',1),
	(2093,133,'Erikub','EKB',1),
	(2094,133,'Jabat','JBT',1),
	(2095,133,'Jaluit','JLT',1),
	(2096,133,'Jemo','JEM',1),
	(2097,133,'Kili','KIL',1),
	(2098,133,'Kwajalein','KWJ',1),
	(2099,133,'Lae','LAE',1),
	(2100,133,'Lib','LIB',1),
	(2101,133,'Likiep','LKP',1),
	(2102,133,'Majuro','MJR',1),
	(2103,133,'Maloelap','MLP',1),
	(2104,133,'Mejit','MJT',1),
	(2105,133,'Mili','MIL',1),
	(2106,133,'Namorik','NMK',1),
	(2107,133,'Namu','NAM',1),
	(2108,133,'Rongelap','RGL',1),
	(2109,133,'Rongrik','RGK',1),
	(2110,133,'Toke','TOK',1),
	(2111,133,'Ujae','UJA',1),
	(2112,133,'Ujelang','UJL',1),
	(2113,133,'Utirik','UTK',1),
	(2114,133,'Wotho','WTH',1),
	(2115,133,'Wotje','WTJ',1),
	(2116,135,'Adrar','AD',1),
	(2117,135,'Assaba','AS',1),
	(2118,135,'Brakna','BR',1),
	(2119,135,'Dakhlet Nouadhibou','DN',1),
	(2120,135,'Gorgol','GO',1),
	(2121,135,'Guidimaka','GM',1),
	(2122,135,'Hodh Ech Chargui','HC',1),
	(2123,135,'Hodh El Gharbi','HG',1),
	(2124,135,'Inchiri','IN',1),
	(2125,135,'Tagant','TA',1),
	(2126,135,'Tiris Zemmour','TZ',1),
	(2127,135,'Trarza','TR',1),
	(2128,135,'Nouakchott','NO',1),
	(2129,136,'Beau Bassin-Rose Hill','BR',1),
	(2130,136,'Curepipe','CU',1),
	(2131,136,'Port Louis','PU',1),
	(2132,136,'Quatre Bornes','QB',1),
	(2133,136,'Vacoas-Phoenix','VP',1),
	(2134,136,'Agalega Islands','AG',1),
	(2135,136,'Cargados Carajos Shoals (Saint Brandon Islands)','CC',1),
	(2136,136,'Rodrigues','RO',1),
	(2137,136,'Black River','BL',1),
	(2138,136,'Flacq','FL',1),
	(2139,136,'Grand Port','GP',1),
	(2140,136,'Moka','MO',1),
	(2141,136,'Pamplemousses','PA',1),
	(2142,136,'Plaines Wilhems','PW',1),
	(2143,136,'Port Louis','PL',1),
	(2144,136,'Riviere du Rempart','RR',1),
	(2145,136,'Savanne','SA',1),
	(2146,138,'Baja California Norte','BN',1),
	(2147,138,'Baja California Sur','BS',1),
	(2148,138,'Campeche','CA',1),
	(2149,138,'Chiapas','CI',1),
	(2150,138,'Chihuahua','CH',1),
	(2151,138,'Coahuila de Zaragoza','CZ',1),
	(2152,138,'Colima','CL',1),
	(2153,138,'Distrito Federal','DF',1),
	(2154,138,'Durango','DU',1),
	(2155,138,'Guanajuato','GA',1),
	(2156,138,'Guerrero','GE',1),
	(2157,138,'Hidalgo','HI',1),
	(2158,138,'Jalisco','JA',1),
	(2159,138,'Mexico','ME',1),
	(2160,138,'Michoacan de Ocampo','MI',1),
	(2161,138,'Morelos','MO',1),
	(2162,138,'Nayarit','NA',1),
	(2163,138,'Nuevo Leon','NL',1),
	(2164,138,'Oaxaca','OA',1),
	(2165,138,'Puebla','PU',1),
	(2166,138,'Queretaro de Arteaga','QA',1),
	(2167,138,'Quintana Roo','QR',1),
	(2168,138,'San Luis Potosi','SA',1),
	(2169,138,'Sinaloa','SI',1),
	(2170,138,'Sonora','SO',1),
	(2171,138,'Tabasco','TB',1),
	(2172,138,'Tamaulipas','TM',1),
	(2173,138,'Tlaxcala','TL',1),
	(2174,138,'Veracruz-Llave','VE',1),
	(2175,138,'Yucatan','YU',1),
	(2176,138,'Zacatecas','ZA',1),
	(2177,139,'Chuuk','C',1),
	(2178,139,'Kosrae','K',1),
	(2179,139,'Pohnpei','P',1),
	(2180,139,'Yap','Y',1),
	(2181,140,'Gagauzia','GA',1),
	(2182,140,'Chisinau','CU',1),
	(2183,140,'Balti','BA',1),
	(2184,140,'Cahul','CA',1),
	(2185,140,'Edinet','ED',1),
	(2186,140,'Lapusna','LA',1),
	(2187,140,'Orhei','OR',1),
	(2188,140,'Soroca','SO',1),
	(2189,140,'Tighina','TI',1),
	(2190,140,'Ungheni','UN',1),
	(2191,140,'St‚nga Nistrului','SN',1),
	(2192,141,'Fontvieille','FV',1),
	(2193,141,'La Condamine','LC',1),
	(2194,141,'Monaco-Ville','MV',1),
	(2195,141,'Monte-Carlo','MC',1),
	(2196,142,'Ulanbaatar','1',1),
	(2197,142,'Orhon','035',1),
	(2198,142,'Darhan uul','037',1),
	(2199,142,'Hentiy','039',1),
	(2200,142,'Hovsgol','041',1),
	(2201,142,'Hovd','043',1),
	(2202,142,'Uvs','046',1),
	(2203,142,'Tov','047',1),
	(2204,142,'Selenge','049',1),
	(2205,142,'Suhbaatar','051',1),
	(2206,142,'Omnogovi','053',1),
	(2207,142,'Ovorhangay','055',1),
	(2208,142,'Dzavhan','057',1),
	(2209,142,'DundgovL','059',1),
	(2210,142,'Dornod','061',1),
	(2211,142,'Dornogov','063',1),
	(2212,142,'Govi-Sumber','064',1),
	(2213,142,'Govi-Altay','065',1),
	(2214,142,'Bulgan','067',1),
	(2215,142,'Bayanhongor','069',1),
	(2216,142,'Bayan-Olgiy','071',1),
	(2217,142,'Arhangay','073',1),
	(2218,143,'Saint Anthony','A',1),
	(2219,143,'Saint Georges','G',1),
	(2220,143,'Saint Peter','P',1),
	(2221,144,'Agadir','AGD',1),
	(2222,144,'Al Hoceima','HOC',1),
	(2223,144,'Azilal','AZI',1),
	(2224,144,'Beni Mellal','BME',1),
	(2225,144,'Ben Slimane','BSL',1),
	(2226,144,'Boulemane','BLM',1),
	(2227,144,'Casablanca','CBL',1),
	(2228,144,'Chaouen','CHA',1),
	(2229,144,'El Jadida','EJA',1),
	(2230,144,'El Kelaa des Sraghna','EKS',1),
	(2231,144,'Er Rachidia','ERA',1),
	(2232,144,'Essaouira','ESS',1),
	(2233,144,'Fes','FES',1),
	(2234,144,'Figuig','FIG',1),
	(2235,144,'Guelmim','GLM',1),
	(2236,144,'Ifrane','IFR',1),
	(2237,144,'Kenitra','KEN',1),
	(2238,144,'Khemisset','KHM',1),
	(2239,144,'Khenifra','KHN',1),
	(2240,144,'Khouribga','KHO',1),
	(2241,144,'Laayoune','LYN',1),
	(2242,144,'Larache','LAR',1),
	(2243,144,'Marrakech','MRK',1),
	(2244,144,'Meknes','MKN',1),
	(2245,144,'Nador','NAD',1),
	(2246,144,'Ouarzazate','ORZ',1),
	(2247,144,'Oujda','OUJ',1),
	(2248,144,'Rabat-Sale','RSA',1),
	(2249,144,'Safi','SAF',1),
	(2250,144,'Settat','SET',1),
	(2251,144,'Sidi Kacem','SKA',1),
	(2252,144,'Tangier','TGR',1),
	(2253,144,'Tan-Tan','TAN',1),
	(2254,144,'Taounate','TAO',1),
	(2255,144,'Taroudannt','TRD',1),
	(2256,144,'Tata','TAT',1),
	(2257,144,'Taza','TAZ',1),
	(2258,144,'Tetouan','TET',1),
	(2259,144,'Tiznit','TIZ',1),
	(2260,144,'Ad Dakhla','ADK',1),
	(2261,144,'Boujdour','BJD',1),
	(2262,144,'Es Smara','ESM',1),
	(2263,145,'Cabo Delgado','CD',1),
	(2264,145,'Gaza','GZ',1),
	(2265,145,'Inhambane','IN',1),
	(2266,145,'Manica','MN',1),
	(2267,145,'Maputo (city)','MC',1),
	(2268,145,'Maputo','MP',1),
	(2269,145,'Nampula','NA',1),
	(2270,145,'Niassa','NI',1),
	(2271,145,'Sofala','SO',1),
	(2272,145,'Tete','TE',1),
	(2273,145,'Zambezia','ZA',1),
	(2274,146,'Ayeyarwady','AY',1),
	(2275,146,'Bago','BG',1),
	(2276,146,'Magway','MG',1),
	(2277,146,'Mandalay','MD',1),
	(2278,146,'Sagaing','SG',1),
	(2279,146,'Tanintharyi','TN',1),
	(2280,146,'Yangon','YG',1),
	(2281,146,'Chin State','CH',1),
	(2282,146,'Kachin State','KC',1),
	(2283,146,'Kayah State','KH',1),
	(2284,146,'Kayin State','KN',1),
	(2285,146,'Mon State','MN',1),
	(2286,146,'Rakhine State','RK',1),
	(2287,146,'Shan State','SH',1),
	(2288,147,'Caprivi','CA',1),
	(2289,147,'Erongo','ER',1),
	(2290,147,'Hardap','HA',1),
	(2291,147,'Karas','KR',1),
	(2292,147,'Kavango','KV',1),
	(2293,147,'Khomas','KH',1),
	(2294,147,'Kunene','KU',1),
	(2295,147,'Ohangwena','OW',1),
	(2296,147,'Omaheke','OK',1),
	(2297,147,'Omusati','OT',1),
	(2298,147,'Oshana','ON',1),
	(2299,147,'Oshikoto','OO',1),
	(2300,147,'Otjozondjupa','OJ',1),
	(2301,148,'Aiwo','AO',1),
	(2302,148,'Anabar','AA',1),
	(2303,148,'Anetan','AT',1),
	(2304,148,'Anibare','AI',1),
	(2305,148,'Baiti','BA',1),
	(2306,148,'Boe','BO',1),
	(2307,148,'Buada','BU',1),
	(2308,148,'Denigomodu','DE',1),
	(2309,148,'Ewa','EW',1),
	(2310,148,'Ijuw','IJ',1),
	(2311,148,'Meneng','ME',1),
	(2312,148,'Nibok','NI',1),
	(2313,148,'Uaboe','UA',1),
	(2314,148,'Yaren','YA',1),
	(2315,149,'Bagmati','BA',1),
	(2316,149,'Bheri','BH',1),
	(2317,149,'Dhawalagiri','DH',1),
	(2318,149,'Gandaki','GA',1),
	(2319,149,'Janakpur','JA',1),
	(2320,149,'Karnali','KA',1),
	(2321,149,'Kosi','KO',1),
	(2322,149,'Lumbini','LU',1),
	(2323,149,'Mahakali','MA',1),
	(2324,149,'Mechi','ME',1),
	(2325,149,'Narayani','NA',1),
	(2326,149,'Rapti','RA',1),
	(2327,149,'Sagarmatha','SA',1),
	(2328,149,'Seti','SE',1),
	(2329,150,'Drenthe','DR',1),
	(2330,150,'Flevoland','FL',1),
	(2331,150,'Friesland','FR',1),
	(2332,150,'Gelderland','GE',1),
	(2333,150,'Groningen','GR',1),
	(2334,150,'Limburg','LI',1),
	(2335,150,'Noord Brabant','NB',1),
	(2336,150,'Noord Holland','NH',1),
	(2337,150,'Overijssel','OV',1),
	(2338,150,'Utrecht','UT',1),
	(2339,150,'Zeeland','ZE',1),
	(2340,150,'Zuid Holland','ZH',1),
	(2341,152,'Iles Loyaute','L',1),
	(2342,152,'Nord','N',1),
	(2343,152,'Sud','S',1),
	(2344,153,'Auckland','AUK',1),
	(2345,153,'Bay of Plenty','BOP',1),
	(2346,153,'Canterbury','CAN',1),
	(2347,153,'Coromandel','COR',1),
	(2348,153,'Gisborne','GIS',1),
	(2349,153,'Fiordland','FIO',1),
	(2350,153,'Hawke\'s Bay','HKB',1),
	(2351,153,'Marlborough','MBH',1),
	(2352,153,'Manawatu-Wanganui','MWT',1),
	(2353,153,'Mt Cook-Mackenzie','MCM',1),
	(2354,153,'Nelson','NSN',1),
	(2355,153,'Northland','NTL',1),
	(2356,153,'Otago','OTA',1),
	(2357,153,'Southland','STL',1),
	(2358,153,'Taranaki','TKI',1),
	(2359,153,'Wellington','WGN',1),
	(2360,153,'Waikato','WKO',1),
	(2361,153,'Wairprarapa','WAI',1),
	(2362,153,'West Coast','WTC',1),
	(2363,154,'Atlantico Norte','AN',1),
	(2364,154,'Atlantico Sur','AS',1),
	(2365,154,'Boaco','BO',1),
	(2366,154,'Carazo','CA',1),
	(2367,154,'Chinandega','CI',1),
	(2368,154,'Chontales','CO',1),
	(2369,154,'Esteli','ES',1),
	(2370,154,'Granada','GR',1),
	(2371,154,'Jinotega','JI',1),
	(2372,154,'Leon','LE',1),
	(2373,154,'Madriz','MD',1),
	(2374,154,'Managua','MN',1),
	(2375,154,'Masaya','MS',1),
	(2376,154,'Matagalpa','MT',1),
	(2377,154,'Nuevo Segovia','NS',1),
	(2378,154,'Rio San Juan','RS',1),
	(2379,154,'Rivas','RI',1),
	(2380,155,'Agadez','AG',1),
	(2381,155,'Diffa','DF',1),
	(2382,155,'Dosso','DS',1),
	(2383,155,'Maradi','MA',1),
	(2384,155,'Niamey','NM',1),
	(2385,155,'Tahoua','TH',1),
	(2386,155,'Tillaberi','TL',1),
	(2387,155,'Zinder','ZD',1),
	(2388,156,'Abia','AB',1),
	(2389,156,'Abuja Federal Capital Territory','CT',1),
	(2390,156,'Adamawa','AD',1),
	(2391,156,'Akwa Ibom','AK',1),
	(2392,156,'Anambra','AN',1),
	(2393,156,'Bauchi','BC',1),
	(2394,156,'Bayelsa','BY',1),
	(2395,156,'Benue','BN',1),
	(2396,156,'Borno','BO',1),
	(2397,156,'Cross River','CR',1),
	(2398,156,'Delta','DE',1),
	(2399,156,'Ebonyi','EB',1),
	(2400,156,'Edo','ED',1),
	(2401,156,'Ekiti','EK',1),
	(2402,156,'Enugu','EN',1),
	(2403,156,'Gombe','GO',1),
	(2404,156,'Imo','IM',1),
	(2405,156,'Jigawa','JI',1),
	(2406,156,'Kaduna','KD',1),
	(2407,156,'Kano','KN',1),
	(2408,156,'Katsina','KT',1),
	(2409,156,'Kebbi','KE',1),
	(2410,156,'Kogi','KO',1),
	(2411,156,'Kwara','KW',1),
	(2412,156,'Lagos','LA',1),
	(2413,156,'Nassarawa','NA',1),
	(2414,156,'Niger','NI',1),
	(2415,156,'Ogun','OG',1),
	(2416,156,'Ondo','ONG',1),
	(2417,156,'Osun','OS',1),
	(2418,156,'Oyo','OY',1),
	(2419,156,'Plateau','PL',1),
	(2420,156,'Rivers','RI',1),
	(2421,156,'Sokoto','SO',1),
	(2422,156,'Taraba','TA',1),
	(2423,156,'Yobe','YO',1),
	(2424,156,'Zamfara','ZA',1),
	(2425,159,'Northern Islands','N',1),
	(2426,159,'Rota','R',1),
	(2427,159,'Saipan','S',1),
	(2428,159,'Tinian','T',1),
	(2429,160,'Akershus','AK',1),
	(2430,160,'Aust-Agder','AA',1),
	(2431,160,'Buskerud','BU',1),
	(2432,160,'Finnmark','FM',1),
	(2433,160,'Hedmark','HM',1),
	(2434,160,'Hordaland','HL',1),
	(2435,160,'More og Romdal','MR',1),
	(2436,160,'Nord-Trondelag','NT',1),
	(2437,160,'Nordland','NL',1),
	(2438,160,'Ostfold','OF',1),
	(2439,160,'Oppland','OP',1),
	(2440,160,'Oslo','OL',1),
	(2441,160,'Rogaland','RL',1),
	(2442,160,'Sor-Trondelag','ST',1),
	(2443,160,'Sogn og Fjordane','SJ',1),
	(2444,160,'Svalbard','SV',1),
	(2445,160,'Telemark','TM',1),
	(2446,160,'Troms','TR',1),
	(2447,160,'Vest-Agder','VA',1),
	(2448,160,'Vestfold','VF',1),
	(2449,161,'Ad Dakhiliyah','DA',1),
	(2450,161,'Al Batinah','BA',1),
	(2451,161,'Al Wusta','WU',1),
	(2452,161,'Ash Sharqiyah','SH',1),
	(2453,161,'Az Zahirah','ZA',1),
	(2454,161,'Masqat','MA',1),
	(2455,161,'Musandam','MU',1),
	(2456,161,'Zufar','ZU',1),
	(2457,162,'Balochistan','B',1),
	(2458,162,'Federally Administered Tribal Areas','T',1),
	(2459,162,'Islamabad Capital Territory','I',1),
	(2460,162,'North-West Frontier','N',1),
	(2461,162,'Punjab','P',1),
	(2462,162,'Sindh','S',1),
	(2463,163,'Aimeliik','AM',1),
	(2464,163,'Airai','AR',1),
	(2465,163,'Angaur','AN',1),
	(2466,163,'Hatohobei','HA',1),
	(2467,163,'Kayangel','KA',1),
	(2468,163,'Koror','KO',1),
	(2469,163,'Melekeok','ME',1),
	(2470,163,'Ngaraard','NA',1),
	(2471,163,'Ngarchelong','NG',1),
	(2472,163,'Ngardmau','ND',1),
	(2473,163,'Ngatpang','NT',1),
	(2474,163,'Ngchesar','NC',1),
	(2475,163,'Ngeremlengui','NR',1),
	(2476,163,'Ngiwal','NW',1),
	(2477,163,'Peleliu','PE',1),
	(2478,163,'Sonsorol','SO',1),
	(2479,164,'Bocas del Toro','BT',1),
	(2480,164,'Chiriqui','CH',1),
	(2481,164,'Cocle','CC',1),
	(2482,164,'Colon','CL',1),
	(2483,164,'Darien','DA',1),
	(2484,164,'Herrera','HE',1),
	(2485,164,'Los Santos','LS',1),
	(2486,164,'Panama','PA',1),
	(2487,164,'San Blas','SB',1),
	(2488,164,'Veraguas','VG',1),
	(2489,165,'Bougainville','BV',1),
	(2490,165,'Central','CE',1),
	(2491,165,'Chimbu','CH',1),
	(2492,165,'Eastern Highlands','EH',1),
	(2493,165,'East New Britain','EB',1),
	(2494,165,'East Sepik','ES',1),
	(2495,165,'Enga','EN',1),
	(2496,165,'Gulf','GU',1),
	(2497,165,'Madang','MD',1),
	(2498,165,'Manus','MN',1),
	(2499,165,'Milne Bay','MB',1),
	(2500,165,'Morobe','MR',1),
	(2501,165,'National Capital','NC',1),
	(2502,165,'New Ireland','NI',1),
	(2503,165,'Northern','NO',1),
	(2504,165,'Sandaun','SA',1),
	(2505,165,'Southern Highlands','SH',1),
	(2506,165,'Western','WE',1),
	(2507,165,'Western Highlands','WH',1),
	(2508,165,'West New Britain','WB',1),
	(2509,166,'Alto Paraguay','AG',1),
	(2510,166,'Alto Parana','AN',1),
	(2511,166,'Amambay','AM',1),
	(2512,166,'Asuncion','AS',1),
	(2513,166,'Boqueron','BO',1),
	(2514,166,'Caaguazu','CG',1),
	(2515,166,'Caazapa','CZ',1),
	(2516,166,'Canindeyu','CN',1),
	(2517,166,'Central','CE',1),
	(2518,166,'Concepcion','CC',1),
	(2519,166,'Cordillera','CD',1),
	(2520,166,'Guaira','GU',1),
	(2521,166,'Itapua','IT',1),
	(2522,166,'Misiones','MI',1),
	(2523,166,'Neembucu','NE',1),
	(2524,166,'Paraguari','PA',1),
	(2525,166,'Presidente Hayes','PH',1),
	(2526,166,'San Pedro','SP',1),
	(2527,167,'Amazonas','AM',1),
	(2528,167,'Ancash','AN',1),
	(2529,167,'Apurimac','AP',1),
	(2530,167,'Arequipa','AR',1),
	(2531,167,'Ayacucho','AY',1),
	(2532,167,'Cajamarca','CJ',1),
	(2533,167,'Callao','CL',1),
	(2534,167,'Cusco','CU',1),
	(2535,167,'Huancavelica','HV',1),
	(2536,167,'Huanuco','HO',1),
	(2537,167,'Ica','IC',1),
	(2538,167,'Junin','JU',1),
	(2539,167,'La Libertad','LD',1),
	(2540,167,'Lambayeque','LY',1),
	(2541,167,'Lima','LI',1),
	(2542,167,'Loreto','LO',1),
	(2543,167,'Madre de Dios','MD',1),
	(2544,167,'Moquegua','MO',1),
	(2545,167,'Pasco','PA',1),
	(2546,167,'Piura','PI',1),
	(2547,167,'Puno','PU',1),
	(2548,167,'San Martin','SM',1),
	(2549,167,'Tacna','TA',1),
	(2550,167,'Tumbes','TU',1),
	(2551,167,'Ucayali','UC',1),
	(2552,168,'Abra','ABR',1),
	(2553,168,'Agusan del Norte','ANO',1),
	(2554,168,'Agusan del Sur','ASU',1),
	(2555,168,'Aklan','AKL',1),
	(2556,168,'Albay','ALB',1),
	(2557,168,'Antique','ANT',1),
	(2558,168,'Apayao','APY',1),
	(2559,168,'Aurora','AUR',1),
	(2560,168,'Basilan','BAS',1),
	(2561,168,'Bataan','BTA',1),
	(2562,168,'Batanes','BTE',1),
	(2563,168,'Batangas','BTG',1),
	(2564,168,'Biliran','BLR',1),
	(2565,168,'Benguet','BEN',1),
	(2566,168,'Bohol','BOL',1),
	(2567,168,'Bukidnon','BUK',1),
	(2568,168,'Bulacan','BUL',1),
	(2569,168,'Cagayan','CAG',1),
	(2570,168,'Camarines Norte','CNO',1),
	(2571,168,'Camarines Sur','CSU',1),
	(2572,168,'Camiguin','CAM',1),
	(2573,168,'Capiz','CAP',1),
	(2574,168,'Catanduanes','CAT',1),
	(2575,168,'Cavite','CAV',1),
	(2576,168,'Cebu','CEB',1),
	(2577,168,'Compostela','CMP',1),
	(2578,168,'Davao del Norte','DNO',1),
	(2579,168,'Davao del Sur','DSU',1),
	(2580,168,'Davao Oriental','DOR',1),
	(2581,168,'Eastern Samar','ESA',1),
	(2582,168,'Guimaras','GUI',1),
	(2583,168,'Ifugao','IFU',1),
	(2584,168,'Ilocos Norte','INO',1),
	(2585,168,'Ilocos Sur','ISU',1),
	(2586,168,'Iloilo','ILO',1),
	(2587,168,'Isabela','ISA',1),
	(2588,168,'Kalinga','KAL',1),
	(2589,168,'Laguna','LAG',1),
	(2590,168,'Lanao del Norte','LNO',1),
	(2591,168,'Lanao del Sur','LSU',1),
	(2592,168,'La Union','UNI',1),
	(2593,168,'Leyte','LEY',1),
	(2594,168,'Maguindanao','MAG',1),
	(2595,168,'Marinduque','MRN',1),
	(2596,168,'Masbate','MSB',1),
	(2597,168,'Mindoro Occidental','MIC',1),
	(2598,168,'Mindoro Oriental','MIR',1),
	(2599,168,'Misamis Occidental','MSC',1),
	(2600,168,'Misamis Oriental','MOR',1),
	(2601,168,'Mountain','MOP',1),
	(2602,168,'Negros Occidental','NOC',1),
	(2603,168,'Negros Oriental','NOR',1),
	(2604,168,'North Cotabato','NCT',1),
	(2605,168,'Northern Samar','NSM',1),
	(2606,168,'Nueva Ecija','NEC',1),
	(2607,168,'Nueva Vizcaya','NVZ',1),
	(2608,168,'Palawan','PLW',1),
	(2609,168,'Pampanga','PMP',1),
	(2610,168,'Pangasinan','PNG',1),
	(2611,168,'Quezon','QZN',1),
	(2612,168,'Quirino','QRN',1),
	(2613,168,'Rizal','RIZ',1),
	(2614,168,'Romblon','ROM',1),
	(2615,168,'Samar','SMR',1),
	(2616,168,'Sarangani','SRG',1),
	(2617,168,'Siquijor','SQJ',1),
	(2618,168,'Sorsogon','SRS',1),
	(2619,168,'South Cotabato','SCO',1),
	(2620,168,'Southern Leyte','SLE',1),
	(2621,168,'Sultan Kudarat','SKU',1),
	(2622,168,'Sulu','SLU',1),
	(2623,168,'Surigao del Norte','SNO',1),
	(2624,168,'Surigao del Sur','SSU',1),
	(2625,168,'Tarlac','TAR',1),
	(2626,168,'Tawi-Tawi','TAW',1),
	(2627,168,'Zambales','ZBL',1),
	(2628,168,'Zamboanga del Norte','ZNO',1),
	(2629,168,'Zamboanga del Sur','ZSU',1),
	(2630,168,'Zamboanga Sibugay','ZSI',1),
	(2631,170,'Dolnoslaskie','DO',1),
	(2632,170,'Kujawsko-Pomorskie','KP',1),
	(2633,170,'Lodzkie','LO',1),
	(2634,170,'Lubelskie','LL',1),
	(2635,170,'Lubuskie','LU',1),
	(2636,170,'Malopolskie','ML',1),
	(2637,170,'Mazowieckie','MZ',1),
	(2638,170,'Opolskie','OP',1),
	(2639,170,'Podkarpackie','PP',1),
	(2640,170,'Podlaskie','PL',1),
	(2641,170,'Pomorskie','PM',1),
	(2642,170,'Slaskie','SL',1),
	(2643,170,'Swietokrzyskie','SW',1),
	(2644,170,'Warminsko-Mazurskie','WM',1),
	(2645,170,'Wielkopolskie','WP',1),
	(2646,170,'Zachodniopomorskie','ZA',1),
	(2647,198,'Saint Pierre','P',1),
	(2648,198,'Miquelon','M',1),
	(2649,171,'A&ccedil;ores','AC',1),
	(2650,171,'Aveiro','AV',1),
	(2651,171,'Beja','BE',1),
	(2652,171,'Braga','BR',1),
	(2653,171,'Bragan&ccedil;a','BA',1),
	(2654,171,'Castelo Branco','CB',1),
	(2655,171,'Coimbra','CO',1),
	(2656,171,'&Eacute;vora','EV',1),
	(2657,171,'Faro','FA',1),
	(2658,171,'Guarda','GU',1),
	(2659,171,'Leiria','LE',1),
	(2660,171,'Lisboa','LI',1),
	(2661,171,'Madeira','ME',1),
	(2662,171,'Portalegre','PO',1),
	(2663,171,'Porto','PR',1),
	(2664,171,'Santar&eacute;m','SA',1),
	(2665,171,'Set&uacute;bal','SE',1),
	(2666,171,'Viana do Castelo','VC',1),
	(2667,171,'Vila Real','VR',1),
	(2668,171,'Viseu','VI',1),
	(2669,173,'Ad Dawhah','DW',1),
	(2670,173,'Al Ghuwayriyah','GW',1),
	(2671,173,'Al Jumayliyah','JM',1),
	(2672,173,'Al Khawr','KR',1),
	(2673,173,'Al Wakrah','WK',1),
	(2674,173,'Ar Rayyan','RN',1),
	(2675,173,'Jarayan al Batinah','JB',1),
	(2676,173,'Madinat ash Shamal','MS',1),
	(2677,173,'Umm Sa\'id','UD',1),
	(2678,173,'Umm Salal','UL',1),
	(2679,175,'Alba','AB',1),
	(2680,175,'Arad','AR',1),
	(2681,175,'Arges','AG',1),
	(2682,175,'Bacau','BC',1),
	(2683,175,'Bihor','BH',1),
	(2684,175,'Bistrita-Nasaud','BN',1),
	(2685,175,'Botosani','BT',1),
	(2686,175,'Brasov','BV',1),
	(2687,175,'Braila','BR',1),
	(2688,175,'Bucuresti','B',1),
	(2689,175,'Buzau','BZ',1),
	(2690,175,'Caras-Severin','CS',1),
	(2691,175,'Calarasi','CL',1),
	(2692,175,'Cluj','CJ',1),
	(2693,175,'Constanta','CT',1),
	(2694,175,'Covasna','CV',1),
	(2695,175,'Dimbovita','DB',1),
	(2696,175,'Dolj','DJ',1),
	(2697,175,'Galati','GL',1),
	(2698,175,'Giurgiu','GR',1),
	(2699,175,'Gorj','GJ',1),
	(2700,175,'Harghita','HR',1),
	(2701,175,'Hunedoara','HD',1),
	(2702,175,'Ialomita','IL',1),
	(2703,175,'Iasi','IS',1),
	(2704,175,'Ilfov','IF',1),
	(2705,175,'Maramures','MM',1),
	(2706,175,'Mehedinti','MH',1),
	(2707,175,'Mures','MS',1),
	(2708,175,'Neamt','NT',1),
	(2709,175,'Olt','OT',1),
	(2710,175,'Prahova','PH',1),
	(2711,175,'Satu-Mare','SM',1),
	(2712,175,'Salaj','SJ',1),
	(2713,175,'Sibiu','SB',1),
	(2714,175,'Suceava','SV',1),
	(2715,175,'Teleorman','TR',1),
	(2716,175,'Timis','TM',1),
	(2717,175,'Tulcea','TL',1),
	(2718,175,'Vaslui','VS',1),
	(2719,175,'Valcea','VL',1),
	(2720,175,'Vrancea','VN',1),
	(2721,176,'Республика Хакасия','KK',1),
	(2722,176,'Московская область','MOS',1),
	(2723,176,'Чукотский АО','CHU',1),
	(2724,176,'Архангельская область','ARK',1),
	(2725,176,'Астраханская область','AST',1),
	(2726,176,'Алтайский край','ALT',1),
	(2727,176,'Белгородская область','BEL',1),
	(2728,176,'Еврейская АО','YEV',1),
	(2729,176,'Амурская область','AMU',1),
	(2730,176,'Брянская область','BRY',1),
	(2731,176,'Чувашская Республика','CU',1),
	(2732,176,'Челябинская область','CHE',1),
	(2733,176,'Карачаево-Черкеcсия','KC',1),
	(2734,176,'Забайкальский край','ZAB',1),
	(2735,176,'Ленинградская область','LEN',1),
	(2736,176,'Республика Калмыкия','KL',1),
	(2737,176,'Сахалинская область','SAK',1),
	(2738,176,'Республика Алтай','AL',1),
	(2739,176,'Чеченская Республика','CE',1),
	(2740,176,'Иркутская область','IRK',1),
	(2741,176,'Ивановская область','IVA',1),
	(2742,176,'Удмуртская Республика','UD',1),
	(2743,176,'Калининградская область','KGD',1),
	(2744,176,'Калужская область','KLU',1),
	(2746,176,'Республика Татарстан','TA',1),
	(2747,176,'Кемеровская область','KEM',1),
	(2748,176,'Хабаровский край','KHA',1),
	(2749,176,'Ханты-Мансийский АО - Югра','KHM',1),
	(2750,176,'Костромская область','KOS',1),
	(2751,176,'Краснодарский край','KDA',1),
	(2752,176,'Красноярский край','KYA',1),
	(2754,176,'Курганская область','KGN',1),
	(2755,176,'Курская область','KRS',1),
	(2756,176,'Республика Тыва','TY',1),
	(2757,176,'Липецкая область','LIP',1),
	(2758,176,'Магаданская область','MAG',1),
	(2759,176,'Республика Дагестан','DA',1),
	(2760,176,'Республика Адыгея','AD',1),
	(2761,176,'Москва','MOW',1),
	(2762,176,'Мурманская область','MUR',1),
	(2763,176,'Республика Кабардино-Балкария','KB',1),
	(2764,176,'Ненецкий АО','NEN',1),
	(2765,176,'Республика Ингушетия','IN',1),
	(2766,176,'Нижегородская область','NIZ',1),
	(2767,176,'Новгородская область','NGR',1),
	(2768,176,'Новосибирская область','NVS',1),
	(2769,176,'Омская область','OMS',1),
	(2770,176,'Орловская область','ORL',1),
	(2771,176,'Оренбургская область','ORE',1),
	(2773,176,'Пензенская область','PNZ',1),
	(2774,176,'Пермский край','PER',1),
	(2775,176,'Камчатский край','KAM',1),
	(2776,176,'Республика Карелия','KR',1),
	(2777,176,'Псковская область','PSK',1),
	(2778,176,'Ростовская область','ROS',1),
	(2779,176,'Рязанская область','RYA',1),
	(2780,176,'Ямало-Ненецкий АО','YAN',1),
	(2781,176,'Самарская область','SAM',1),
	(2782,176,'Республика Мордовия','MO',1),
	(2783,176,'Саратовская область','SAR',1),
	(2784,176,'Смоленская область','SMO',1),
	(2785,176,'Санкт-Петербург','SPE',1),
	(2786,176,'Ставропольский край','STA',1),
	(2787,176,'Республика Коми','KO',1),
	(2788,176,'Тамбовская область','TAM',1),
	(2789,176,'Томская область','TOM',1),
	(2790,176,'Тульская область','TUL',1),
	(2792,176,'Тверская область','TVE',1),
	(2793,176,'Тюменская область','TYU',1),
	(2794,176,'Республика Башкортостан','BA',1),
	(2795,176,'Ульяновская область','ULY',1),
	(2796,176,'Республика Бурятия','BU',1),
	(2798,176,'Республика Северная Осетия','SE',1),
	(2799,176,'Владимирская область','VLA',1),
	(2800,176,'Приморский край','PRI',1),
	(2801,176,'Волгоградская область','VGG',1),
	(2802,176,'Вологодская область','VLG',1),
	(2803,176,'Воронежская область','VOR',1),
	(2804,176,'Кировская область','KIR',1),
	(2805,176,'Республика Саха','SA',1),
	(2806,176,'Ярославская область','YAR',1),
	(2807,176,'Свердловская область','SVE',1),
	(2808,176,'Республика Марий Эл','ME',1),
	(2809,177,'Butare','BU',1),
	(2810,177,'Byumba','BY',1),
	(2811,177,'Cyangugu','CY',1),
	(2812,177,'Gikongoro','GK',1),
	(2813,177,'Gisenyi','GS',1),
	(2814,177,'Gitarama','GT',1),
	(2815,177,'Kibungo','KG',1),
	(2816,177,'Kibuye','KY',1),
	(2817,177,'Kigali Rurale','KR',1),
	(2818,177,'Kigali-ville','KV',1),
	(2819,177,'Ruhengeri','RU',1),
	(2820,177,'Umutara','UM',1),
	(2821,178,'Christ Church Nichola Town','CCN',1),
	(2822,178,'Saint Anne Sandy Point','SAS',1),
	(2823,178,'Saint George Basseterre','SGB',1),
	(2824,178,'Saint George Gingerland','SGG',1),
	(2825,178,'Saint James Windward','SJW',1),
	(2826,178,'Saint John Capesterre','SJC',1),
	(2827,178,'Saint John Figtree','SJF',1),
	(2828,178,'Saint Mary Cayon','SMC',1),
	(2829,178,'Saint Paul Capesterre','CAP',1),
	(2830,178,'Saint Paul Charlestown','CHA',1),
	(2831,178,'Saint Peter Basseterre','SPB',1),
	(2832,178,'Saint Thomas Lowland','STL',1),
	(2833,178,'Saint Thomas Middle Island','STM',1),
	(2834,178,'Trinity Palmetto Point','TPP',1),
	(2835,179,'Anse-la-Raye','AR',1),
	(2836,179,'Castries','CA',1),
	(2837,179,'Choiseul','CH',1),
	(2838,179,'Dauphin','DA',1),
	(2839,179,'Dennery','DE',1),
	(2840,179,'Gros-Islet','GI',1),
	(2841,179,'Laborie','LA',1),
	(2842,179,'Micoud','MI',1),
	(2843,179,'Praslin','PR',1),
	(2844,179,'Soufriere','SO',1),
	(2845,179,'Vieux-Fort','VF',1),
	(2846,180,'Charlotte','C',1),
	(2847,180,'Grenadines','R',1),
	(2848,180,'Saint Andrew','A',1),
	(2849,180,'Saint David','D',1),
	(2850,180,'Saint George','G',1),
	(2851,180,'Saint Patrick','P',1),
	(2852,181,'A\'ana','AN',1),
	(2853,181,'Aiga-i-le-Tai','AI',1),
	(2854,181,'Atua','AT',1),
	(2855,181,'Fa\'asaleleaga','FA',1),
	(2856,181,'Gaga\'emauga','GE',1),
	(2857,181,'Gagaifomauga','GF',1),
	(2858,181,'Palauli','PA',1),
	(2859,181,'Satupa\'itea','SA',1),
	(2860,181,'Tuamasaga','TU',1),
	(2861,181,'Va\'a-o-Fonoti','VF',1),
	(2862,181,'Vaisigano','VS',1),
	(2863,182,'Acquaviva','AC',1),
	(2864,182,'Borgo Maggiore','BM',1),
	(2865,182,'Chiesanuova','CH',1),
	(2866,182,'Domagnano','DO',1),
	(2867,182,'Faetano','FA',1),
	(2868,182,'Fiorentino','FI',1),
	(2869,182,'Montegiardino','MO',1),
	(2870,182,'Citta di San Marino','SM',1),
	(2871,182,'Serravalle','SE',1),
	(2872,183,'Sao Tome','S',1),
	(2873,183,'Principe','P',1),
	(2874,184,'Al Bahah','BH',1),
	(2875,184,'Al Hudud ash Shamaliyah','HS',1),
	(2876,184,'Al Jawf','JF',1),
	(2877,184,'Al Madinah','MD',1),
	(2878,184,'Al Qasim','QS',1),
	(2879,184,'Ar Riyad','RD',1),
	(2880,184,'Ash Sharqiyah (Eastern)','AQ',1),
	(2881,184,'\'Asir','AS',1),
	(2882,184,'Ha\'il','HL',1),
	(2883,184,'Jizan','JZ',1),
	(2884,184,'Makkah','ML',1),
	(2885,184,'Najran','NR',1),
	(2886,184,'Tabuk','TB',1),
	(2887,185,'Dakar','DA',1),
	(2888,185,'Diourbel','DI',1),
	(2889,185,'Fatick','FA',1),
	(2890,185,'Kaolack','KA',1),
	(2891,185,'Kolda','KO',1),
	(2892,185,'Louga','LO',1),
	(2893,185,'Matam','MA',1),
	(2894,185,'Saint-Louis','SL',1),
	(2895,185,'Tambacounda','TA',1),
	(2896,185,'Thies','TH',1),
	(2897,185,'Ziguinchor','ZI',1),
	(2898,186,'Anse aux Pins','AP',1),
	(2899,186,'Anse Boileau','AB',1),
	(2900,186,'Anse Etoile','AE',1),
	(2901,186,'Anse Louis','AL',1),
	(2902,186,'Anse Royale','AR',1),
	(2903,186,'Baie Lazare','BL',1),
	(2904,186,'Baie Sainte Anne','BS',1),
	(2905,186,'Beau Vallon','BV',1),
	(2906,186,'Bel Air','BA',1),
	(2907,186,'Bel Ombre','BO',1),
	(2908,186,'Cascade','CA',1),
	(2909,186,'Glacis','GL',1),
	(2910,186,'Grand\' Anse (on Mahe)','GM',1),
	(2911,186,'Grand\' Anse (on Praslin)','GP',1),
	(2912,186,'La Digue','DG',1),
	(2913,186,'La Riviere Anglaise','RA',1),
	(2914,186,'Mont Buxton','MB',1),
	(2915,186,'Mont Fleuri','MF',1),
	(2916,186,'Plaisance','PL',1),
	(2917,186,'Pointe La Rue','PR',1),
	(2918,186,'Port Glaud','PG',1),
	(2919,186,'Saint Louis','SL',1),
	(2920,186,'Takamaka','TA',1),
	(2921,187,'Eastern','E',1),
	(2922,187,'Northern','N',1),
	(2923,187,'Southern','S',1),
	(2924,187,'Western','W',1),
	(2925,189,'Banskobystrický','BA',1),
	(2926,189,'Bratislavský','BR',1),
	(2927,189,'Košický','KO',1),
	(2928,189,'Nitriansky','NI',1),
	(2929,189,'Prešovský','PR',1),
	(2930,189,'Trenčiansky','TC',1),
	(2931,189,'Trnavský','TV',1),
	(2932,189,'Žilinský','ZI',1),
	(2933,191,'Central','CE',1),
	(2934,191,'Choiseul','CH',1),
	(2935,191,'Guadalcanal','GC',1),
	(2936,191,'Honiara','HO',1),
	(2937,191,'Isabel','IS',1),
	(2938,191,'Makira','MK',1),
	(2939,191,'Malaita','ML',1),
	(2940,191,'Rennell and Bellona','RB',1),
	(2941,191,'Temotu','TM',1),
	(2942,191,'Western','WE',1),
	(2943,192,'Awdal','AW',1),
	(2944,192,'Bakool','BK',1),
	(2945,192,'Banaadir','BN',1),
	(2946,192,'Bari','BR',1),
	(2947,192,'Bay','BY',1),
	(2948,192,'Galguduud','GA',1),
	(2949,192,'Gedo','GE',1),
	(2950,192,'Hiiraan','HI',1),
	(2951,192,'Jubbada Dhexe','JD',1),
	(2952,192,'Jubbada Hoose','JH',1),
	(2953,192,'Mudug','MU',1),
	(2954,192,'Nugaal','NU',1),
	(2955,192,'Sanaag','SA',1),
	(2956,192,'Shabeellaha Dhexe','SD',1),
	(2957,192,'Shabeellaha Hoose','SH',1),
	(2958,192,'Sool','SL',1),
	(2959,192,'Togdheer','TO',1),
	(2960,192,'Woqooyi Galbeed','WG',1),
	(2961,193,'Eastern Cape','EC',1),
	(2962,193,'Free State','FS',1),
	(2963,193,'Gauteng','GT',1),
	(2964,193,'KwaZulu-Natal','KN',1),
	(2965,193,'Limpopo','LP',1),
	(2966,193,'Mpumalanga','MP',1),
	(2967,193,'North West','NW',1),
	(2968,193,'Northern Cape','NC',1),
	(2969,193,'Western Cape','WC',1),
	(2970,195,'La Coru&ntilde;a','CA',1),
	(2971,195,'&Aacute;lava','AL',1),
	(2972,195,'Albacete','AB',1),
	(2973,195,'Alicante','AC',1),
	(2974,195,'Almeria','AM',1),
	(2975,195,'Asturias','AS',1),
	(2976,195,'&Aacute;vila','AV',1),
	(2977,195,'Badajoz','BJ',1),
	(2978,195,'Baleares','IB',1),
	(2979,195,'Barcelona','BA',1),
	(2980,195,'Burgos','BU',1),
	(2981,195,'C&aacute;ceres','CC',1),
	(2982,195,'C&aacute;diz','CZ',1),
	(2983,195,'Cantabria','CT',1),
	(2984,195,'Castell&oacute;n','CL',1),
	(2985,195,'Ceuta','CE',1),
	(2986,195,'Ciudad Real','CR',1),
	(2987,195,'C&oacute;rdoba','CD',1),
	(2988,195,'Cuenca','CU',1),
	(2989,195,'Girona','GI',1),
	(2990,195,'Granada','GD',1),
	(2991,195,'Guadalajara','GJ',1),
	(2992,195,'Guip&uacute;zcoa','GP',1),
	(2993,195,'Huelva','HL',1),
	(2994,195,'Huesca','HS',1),
	(2995,195,'Ja&eacute;n','JN',1),
	(2996,195,'La Rioja','RJ',1),
	(2997,195,'Las Palmas','PM',1),
	(2998,195,'Leon','LE',1),
	(2999,195,'Lleida','LL',1),
	(3000,195,'Lugo','LG',1),
	(3001,195,'Madrid','MD',1),
	(3002,195,'Malaga','MA',1),
	(3003,195,'Melilla','ML',1),
	(3004,195,'Murcia','MU',1),
	(3005,195,'Navarra','NV',1),
	(3006,195,'Ourense','OU',1),
	(3007,195,'Palencia','PL',1),
	(3008,195,'Pontevedra','PO',1),
	(3009,195,'Salamanca','SL',1),
	(3010,195,'Santa Cruz de Tenerife','SC',1),
	(3011,195,'Segovia','SG',1),
	(3012,195,'Sevilla','SV',1),
	(3013,195,'Soria','SO',1),
	(3014,195,'Tarragona','TA',1),
	(3015,195,'Teruel','TE',1),
	(3016,195,'Toledo','TO',1),
	(3017,195,'Valencia','VC',1),
	(3018,195,'Valladolid','VD',1),
	(3019,195,'Vizcaya','VZ',1),
	(3020,195,'Zamora','ZM',1),
	(3021,195,'Zaragoza','ZR',1),
	(3022,196,'Central','CE',1),
	(3023,196,'Eastern','EA',1),
	(3024,196,'North Central','NC',1),
	(3025,196,'Northern','NO',1),
	(3026,196,'North Western','NW',1),
	(3027,196,'Sabaragamuwa','SA',1),
	(3028,196,'Southern','SO',1),
	(3029,196,'Uva','UV',1),
	(3030,196,'Western','WE',1),
	(3031,197,'Ascension','A',1),
	(3032,197,'Saint Helena','S',1),
	(3033,197,'Tristan da Cunha','T',1),
	(3034,199,'A\'ali an Nil','ANL',1),
	(3035,199,'Al Bahr al Ahmar','BAM',1),
	(3036,199,'Al Buhayrat','BRT',1),
	(3037,199,'Al Jazirah','JZR',1),
	(3038,199,'Al Khartum','KRT',1),
	(3039,199,'Al Qadarif','QDR',1),
	(3040,199,'Al Wahdah','WDH',1),
	(3041,199,'An Nil al Abyad','ANB',1),
	(3042,199,'An Nil al Azraq','ANZ',1),
	(3043,199,'Ash Shamaliyah','ASH',1),
	(3044,199,'Bahr al Jabal','BJA',1),
	(3045,199,'Gharb al Istiwa\'iyah','GIS',1),
	(3046,199,'Gharb Bahr al Ghazal','GBG',1),
	(3047,199,'Gharb Darfur','GDA',1),
	(3048,199,'Gharb Kurdufan','GKU',1),
	(3049,199,'Janub Darfur','JDA',1),
	(3050,199,'Janub Kurdufan','JKU',1),
	(3051,199,'Junqali','JQL',1),
	(3052,199,'Kassala','KSL',1),
	(3053,199,'Nahr an Nil','NNL',1),
	(3054,199,'Shamal Bahr al Ghazal','SBG',1),
	(3055,199,'Shamal Darfur','SDA',1),
	(3056,199,'Shamal Kurdufan','SKU',1),
	(3057,199,'Sharq al Istiwa\'iyah','SIS',1),
	(3058,199,'Sinnar','SNR',1),
	(3059,199,'Warab','WRB',1),
	(3060,200,'Brokopondo','BR',1),
	(3061,200,'Commewijne','CM',1),
	(3062,200,'Coronie','CR',1),
	(3063,200,'Marowijne','MA',1),
	(3064,200,'Nickerie','NI',1),
	(3065,200,'Para','PA',1),
	(3066,200,'Paramaribo','PM',1),
	(3067,200,'Saramacca','SA',1),
	(3068,200,'Sipaliwini','SI',1),
	(3069,200,'Wanica','WA',1),
	(3070,202,'Hhohho','H',1),
	(3071,202,'Lubombo','L',1),
	(3072,202,'Manzini','M',1),
	(3073,202,'Shishelweni','S',1),
	(3074,203,'Blekinge','K',1),
	(3075,203,'Dalarna','W',1),
	(3076,203,'G&auml;vleborg','X',1),
	(3077,203,'Gotland','I',1),
	(3078,203,'Halland','N',1),
	(3079,203,'J&auml;mtland','Z',1),
	(3080,203,'J&ouml;nk&ouml;ping','F',1),
	(3081,203,'Kalmar','H',1),
	(3082,203,'Kronoberg','G',1),
	(3083,203,'Norrbotten','BD',1),
	(3084,203,'&Ouml;rebro','T',1),
	(3085,203,'&Ouml;sterg&ouml;tland','E',1),
	(3086,203,'Sk&aring;ne','M',1),
	(3087,203,'S&ouml;dermanland','D',1),
	(3088,203,'Stockholm','AB',1),
	(3089,203,'Uppsala','C',1),
	(3090,203,'V&auml;rmland','S',1),
	(3091,203,'V&auml;sterbotten','AC',1),
	(3092,203,'V&auml;sternorrland','Y',1),
	(3093,203,'V&auml;stmanland','U',1),
	(3094,203,'V&auml;stra G&ouml;taland','O',1),
	(3095,204,'Aargau','AG',1),
	(3096,204,'Appenzell Ausserrhoden','AR',1),
	(3097,204,'Appenzell Innerrhoden','AI',1),
	(3098,204,'Basel-Stadt','BS',1),
	(3099,204,'Basel-Landschaft','BL',1),
	(3100,204,'Bern','BE',1),
	(3101,204,'Fribourg','FR',1),
	(3102,204,'Gen&egrave;ve','GE',1),
	(3103,204,'Glarus','GL',1),
	(3104,204,'Graub&uuml;nden','GR',1),
	(3105,204,'Jura','JU',1),
	(3106,204,'Luzern','LU',1),
	(3107,204,'Neuch&acirc;tel','NE',1),
	(3108,204,'Nidwald','NW',1),
	(3109,204,'Obwald','OW',1),
	(3110,204,'St. Gallen','SG',1),
	(3111,204,'Schaffhausen','SH',1),
	(3112,204,'Schwyz','SZ',1),
	(3113,204,'Solothurn','SO',1),
	(3114,204,'Thurgau','TG',1),
	(3115,204,'Ticino','TI',1),
	(3116,204,'Uri','UR',1),
	(3117,204,'Valais','VS',1),
	(3118,204,'Vaud','VD',1),
	(3119,204,'Zug','ZG',1),
	(3120,204,'Z&uuml;rich','ZH',1),
	(3121,205,'Al Hasakah','HA',1),
	(3122,205,'Al Ladhiqiyah','LA',1),
	(3123,205,'Al Qunaytirah','QU',1),
	(3124,205,'Ar Raqqah','RQ',1),
	(3125,205,'As Suwayda','SU',1),
	(3126,205,'Dara','DA',1),
	(3127,205,'Dayr az Zawr','DZ',1),
	(3128,205,'Dimashq','DI',1),
	(3129,205,'Halab','HL',1),
	(3130,205,'Hamah','HM',1),
	(3131,205,'Hims','HI',1),
	(3132,205,'Idlib','ID',1),
	(3133,205,'Rif Dimashq','RD',1),
	(3134,205,'Tartus','TA',1),
	(3135,206,'Chang-hua','CH',1),
	(3136,206,'Chia-i','CI',1),
	(3137,206,'Hsin-chu','HS',1),
	(3138,206,'Hua-lien','HL',1),
	(3139,206,'I-lan','IL',1),
	(3140,206,'Kao-hsiung county','KH',1),
	(3141,206,'Kin-men','KM',1),
	(3142,206,'Lien-chiang','LC',1),
	(3143,206,'Miao-li','ML',1),
	(3144,206,'Nan-t\'ou','NT',1),
	(3145,206,'P\'eng-hu','PH',1),
	(3146,206,'P\'ing-tung','PT',1),
	(3147,206,'T\'ai-chung','TG',1),
	(3148,206,'T\'ai-nan','TA',1),
	(3149,206,'T\'ai-pei county','TP',1),
	(3150,206,'T\'ai-tung','TT',1),
	(3151,206,'T\'ao-yuan','TY',1),
	(3152,206,'Yun-lin','YL',1),
	(3153,206,'Chia-i city','CC',1),
	(3154,206,'Chi-lung','CL',1),
	(3155,206,'Hsin-chu','HC',1),
	(3156,206,'T\'ai-chung','TH',1),
	(3157,206,'T\'ai-nan','TN',1),
	(3158,206,'Kao-hsiung city','KC',1),
	(3159,206,'T\'ai-pei city','TC',1),
	(3160,207,'Gorno-Badakhstan','GB',1),
	(3161,207,'Khatlon','KT',1),
	(3162,207,'Sughd','SU',1),
	(3163,208,'Arusha','AR',1),
	(3164,208,'Dar es Salaam','DS',1),
	(3165,208,'Dodoma','DO',1),
	(3166,208,'Iringa','IR',1),
	(3167,208,'Kagera','KA',1),
	(3168,208,'Kigoma','KI',1),
	(3169,208,'Kilimanjaro','KJ',1),
	(3170,208,'Lindi','LN',1),
	(3171,208,'Manyara','MY',1),
	(3172,208,'Mara','MR',1),
	(3173,208,'Mbeya','MB',1),
	(3174,208,'Morogoro','MO',1),
	(3175,208,'Mtwara','MT',1),
	(3176,208,'Mwanza','MW',1),
	(3177,208,'Pemba North','PN',1),
	(3178,208,'Pemba South','PS',1),
	(3179,208,'Pwani','PW',1),
	(3180,208,'Rukwa','RK',1),
	(3181,208,'Ruvuma','RV',1),
	(3182,208,'Shinyanga','SH',1),
	(3183,208,'Singida','SI',1),
	(3184,208,'Tabora','TB',1),
	(3185,208,'Tanga','TN',1),
	(3186,208,'Zanzibar Central/South','ZC',1),
	(3187,208,'Zanzibar North','ZN',1),
	(3188,208,'Zanzibar Urban/West','ZU',1),
	(3189,209,'Amnat Charoen','Amnat Charoen',1),
	(3190,209,'Ang Thong','Ang Thong',1),
	(3191,209,'Ayutthaya','Ayutthaya',1),
	(3192,209,'Bangkok','Bangkok',1),
	(3193,209,'Buriram','Buriram',1),
	(3194,209,'Chachoengsao','Chachoengsao',1),
	(3195,209,'Chai Nat','Chai Nat',1),
	(3196,209,'Chaiyaphum','Chaiyaphum',1),
	(3197,209,'Chanthaburi','Chanthaburi',1),
	(3198,209,'Chiang Mai','Chiang Mai',1),
	(3199,209,'Chiang Rai','Chiang Rai',1),
	(3200,209,'Chon Buri','Chon Buri',1),
	(3201,209,'Chumphon','Chumphon',1),
	(3202,209,'Kalasin','Kalasin',1),
	(3203,209,'Kamphaeng Phet','Kamphaeng Phet',1),
	(3204,209,'Kanchanaburi','Kanchanaburi',1),
	(3205,209,'Khon Kaen','Khon Kaen',1),
	(3206,209,'Krabi','Krabi',1),
	(3207,209,'Lampang','Lampang',1),
	(3208,209,'Lamphun','Lamphun',1),
	(3209,209,'Loei','Loei',1),
	(3210,209,'Lop Buri','Lop Buri',1),
	(3211,209,'Mae Hong Son','Mae Hong Son',1),
	(3212,209,'Maha Sarakham','Maha Sarakham',1),
	(3213,209,'Mukdahan','Mukdahan',1),
	(3214,209,'Nakhon Nayok','Nakhon Nayok',1),
	(3215,209,'Nakhon Pathom','Nakhon Pathom',1),
	(3216,209,'Nakhon Phanom','Nakhon Phanom',1),
	(3217,209,'Nakhon Ratchasima','Nakhon Ratchasima',1),
	(3218,209,'Nakhon Sawan','Nakhon Sawan',1),
	(3219,209,'Nakhon Si Thammarat','Nakhon Si Thammarat',1),
	(3220,209,'Nan','Nan',1),
	(3221,209,'Narathiwat','Narathiwat',1),
	(3222,209,'Nong Bua Lamphu','Nong Bua Lamphu',1),
	(3223,209,'Nong Khai','Nong Khai',1),
	(3224,209,'Nonthaburi','Nonthaburi',1),
	(3225,209,'Pathum Thani','Pathum Thani',1),
	(3226,209,'Pattani','Pattani',1),
	(3227,209,'Phangnga','Phangnga',1),
	(3228,209,'Phatthalung','Phatthalung',1),
	(3229,209,'Phayao','Phayao',1),
	(3230,209,'Phetchabun','Phetchabun',1),
	(3231,209,'Phetchaburi','Phetchaburi',1),
	(3232,209,'Phichit','Phichit',1),
	(3233,209,'Phitsanulok','Phitsanulok',1),
	(3234,209,'Phrae','Phrae',1),
	(3235,209,'Phuket','Phuket',1),
	(3236,209,'Prachin Buri','Prachin Buri',1),
	(3237,209,'Prachuap Khiri Khan','Prachuap Khiri Khan',1),
	(3238,209,'Ranong','Ranong',1),
	(3239,209,'Ratchaburi','Ratchaburi',1),
	(3240,209,'Rayong','Rayong',1),
	(3241,209,'Roi Et','Roi Et',1),
	(3242,209,'Sa Kaeo','Sa Kaeo',1),
	(3243,209,'Sakon Nakhon','Sakon Nakhon',1),
	(3244,209,'Samut Prakan','Samut Prakan',1),
	(3245,209,'Samut Sakhon','Samut Sakhon',1),
	(3246,209,'Samut Songkhram','Samut Songkhram',1),
	(3247,209,'Sara Buri','Sara Buri',1),
	(3248,209,'Satun','Satun',1),
	(3249,209,'Sing Buri','Sing Buri',1),
	(3250,209,'Sisaket','Sisaket',1),
	(3251,209,'Songkhla','Songkhla',1),
	(3252,209,'Sukhothai','Sukhothai',1),
	(3253,209,'Suphan Buri','Suphan Buri',1),
	(3254,209,'Surat Thani','Surat Thani',1),
	(3255,209,'Surin','Surin',1),
	(3256,209,'Tak','Tak',1),
	(3257,209,'Trang','Trang',1),
	(3258,209,'Trat','Trat',1),
	(3259,209,'Ubon Ratchathani','Ubon Ratchathani',1),
	(3260,209,'Udon Thani','Udon Thani',1),
	(3261,209,'Uthai Thani','Uthai Thani',1),
	(3262,209,'Uttaradit','Uttaradit',1),
	(3263,209,'Yala','Yala',1),
	(3264,209,'Yasothon','Yasothon',1),
	(3265,210,'Kara','K',1),
	(3266,210,'Plateaux','P',1),
	(3267,210,'Savanes','S',1),
	(3268,210,'Centrale','C',1),
	(3269,210,'Maritime','M',1),
	(3270,211,'Atafu','A',1),
	(3271,211,'Fakaofo','F',1),
	(3272,211,'Nukunonu','N',1),
	(3273,212,'Ha\'apai','H',1),
	(3274,212,'Tongatapu','T',1),
	(3275,212,'Vava\'u','V',1),
	(3276,213,'Couva/Tabaquite/Talparo','CT',1),
	(3277,213,'Diego Martin','DM',1),
	(3278,213,'Mayaro/Rio Claro','MR',1),
	(3279,213,'Penal/Debe','PD',1),
	(3280,213,'Princes Town','PT',1),
	(3281,213,'Sangre Grande','SG',1),
	(3282,213,'San Juan/Laventille','SL',1),
	(3283,213,'Siparia','SI',1),
	(3284,213,'Tunapuna/Piarco','TP',1),
	(3285,213,'Port of Spain','PS',1),
	(3286,213,'San Fernando','SF',1),
	(3287,213,'Arima','AR',1),
	(3288,213,'Point Fortin','PF',1),
	(3289,213,'Chaguanas','CH',1),
	(3290,213,'Tobago','TO',1),
	(3291,214,'Ariana','AR',1),
	(3292,214,'Beja','BJ',1),
	(3293,214,'Ben Arous','BA',1),
	(3294,214,'Bizerte','BI',1),
	(3295,214,'Gabes','GB',1),
	(3296,214,'Gafsa','GF',1),
	(3297,214,'Jendouba','JE',1),
	(3298,214,'Kairouan','KR',1),
	(3299,214,'Kasserine','KS',1),
	(3300,214,'Kebili','KB',1),
	(3301,214,'Kef','KF',1),
	(3302,214,'Mahdia','MH',1),
	(3303,214,'Manouba','MN',1),
	(3304,214,'Medenine','ME',1),
	(3305,214,'Monastir','MO',1),
	(3306,214,'Nabeul','NA',1),
	(3307,214,'Sfax','SF',1),
	(3308,214,'Sidi','SD',1),
	(3309,214,'Siliana','SL',1),
	(3310,214,'Sousse','SO',1),
	(3311,214,'Tataouine','TA',1),
	(3312,214,'Tozeur','TO',1),
	(3313,214,'Tunis','TU',1),
	(3314,214,'Zaghouan','ZA',1),
	(3315,215,'Adana','ADA',1),
	(3316,215,'Adıyaman','ADI',1),
	(3317,215,'Afyonkarahisar','AFY',1),
	(3318,215,'Ağrı','AGR',1),
	(3319,215,'Aksaray','AKS',1),
	(3320,215,'Amasya','AMA',1),
	(3321,215,'Ankara','ANK',1),
	(3322,215,'Antalya','ANT',1),
	(3323,215,'Ardahan','ARD',1),
	(3324,215,'Artvin','ART',1),
	(3325,215,'Aydın','AYI',1),
	(3326,215,'Balıkesir','BAL',1),
	(3327,215,'Bartın','BAR',1),
	(3328,215,'Batman','BAT',1),
	(3329,215,'Bayburt','BAY',1),
	(3330,215,'Bilecik','BIL',1),
	(3331,215,'Bingöl','BIN',1),
	(3332,215,'Bitlis','BIT',1),
	(3333,215,'Bolu','BOL',1),
	(3334,215,'Burdur','BRD',1),
	(3335,215,'Bursa','BRS',1),
	(3336,215,'Çanakkale','CKL',1),
	(3337,215,'Çankırı','CKR',1),
	(3338,215,'Çorum','COR',1),
	(3339,215,'Denizli','DEN',1),
	(3340,215,'Diyarbakir','DIY',1),
	(3341,215,'Düzce','DUZ',1),
	(3342,215,'Edirne','EDI',1),
	(3343,215,'Elazig','ELA',1),
	(3344,215,'Erzincan','EZC',1),
	(3345,215,'Erzurum','EZR',1),
	(3346,215,'Eskişehir','ESK',1),
	(3347,215,'Gaziantep','GAZ',1),
	(3348,215,'Giresun','GIR',1),
	(3349,215,'Gümüşhane','GMS',1),
	(3350,215,'Hakkari','HKR',1),
	(3351,215,'Hatay','HTY',1),
	(3352,215,'Iğdır','IGD',1),
	(3353,215,'Isparta','ISP',1),
	(3354,215,'İstanbul','IST',1),
	(3355,215,'İzmir','IZM',1),
	(3356,215,'Kahramanmaraş','KAH',1),
	(3357,215,'Karabük','KRB',1),
	(3358,215,'Karaman','KRM',1),
	(3359,215,'Kars','KRS',1),
	(3360,215,'Kastamonu','KAS',1),
	(3361,215,'Kayseri','KAY',1),
	(3362,215,'Kilis','KLS',1),
	(3363,215,'Kirikkale','KRK',1),
	(3364,215,'Kirklareli','KLR',1),
	(3365,215,'Kirsehir','KRH',1),
	(3366,215,'Kocaeli','KOC',1),
	(3367,215,'Konya','KON',1),
	(3368,215,'Kütahya','KUT',1),
	(3369,215,'Malatya','MAL',1),
	(3370,215,'Manisa','MAN',1),
	(3371,215,'Mardin','MAR',1),
	(3372,215,'Mersin','MER',1),
	(3373,215,'Muğla','MUG',1),
	(3374,215,'Muş','MUS',1),
	(3375,215,'Nevşehir','NEV',1),
	(3376,215,'Niğde','NIG',1),
	(3377,215,'Ordu','ORD',1),
	(3378,215,'Osmaniye','OSM',1),
	(3379,215,'Rize','RIZ',1),
	(3380,215,'Sakarya','SAK',1),
	(3381,215,'Samsun','SAM',1),
	(3382,215,'Şanlıurfa','SAN',1),
	(3383,215,'Siirt','SII',1),
	(3384,215,'Sinop','SIN',1),
	(3385,215,'Şırnak','SIR',1),
	(3386,215,'Sivas','SIV',1),
	(3387,215,'Tekirdağ','TEL',1),
	(3388,215,'Tokat','TOK',1),
	(3389,215,'Trabzon','TRA',1),
	(3390,215,'Tunceli','TUN',1),
	(3391,215,'Uşak','USK',1),
	(3392,215,'Van','VAN',1),
	(3393,215,'Yalova','YAL',1),
	(3394,215,'Yozgat','YOZ',1),
	(3395,215,'Zonguldak','ZON',1),
	(3396,216,'Ahal Welayaty','A',1),
	(3397,216,'Balkan Welayaty','B',1),
	(3398,216,'Dashhowuz Welayaty','D',1),
	(3399,216,'Lebap Welayaty','L',1),
	(3400,216,'Mary Welayaty','M',1),
	(3401,217,'Ambergris Cays','AC',1),
	(3402,217,'Dellis Cay','DC',1),
	(3403,217,'French Cay','FC',1),
	(3404,217,'Little Water Cay','LW',1),
	(3405,217,'Parrot Cay','RC',1),
	(3406,217,'Pine Cay','PN',1),
	(3407,217,'Salt Cay','SL',1),
	(3408,217,'Grand Turk','GT',1),
	(3409,217,'South Caicos','SC',1),
	(3410,217,'East Caicos','EC',1),
	(3411,217,'Middle Caicos','MC',1),
	(3412,217,'North Caicos','NC',1),
	(3413,217,'Providenciales','PR',1),
	(3414,217,'West Caicos','WC',1),
	(3415,218,'Nanumanga','NMG',1),
	(3416,218,'Niulakita','NLK',1),
	(3417,218,'Niutao','NTO',1),
	(3418,218,'Funafuti','FUN',1),
	(3419,218,'Nanumea','NME',1),
	(3420,218,'Nui','NUI',1),
	(3421,218,'Nukufetau','NFT',1),
	(3422,218,'Nukulaelae','NLL',1),
	(3423,218,'Vaitupu','VAI',1),
	(3424,219,'Kalangala','KAL',1),
	(3425,219,'Kampala','KMP',1),
	(3426,219,'Kayunga','KAY',1),
	(3427,219,'Kiboga','KIB',1),
	(3428,219,'Luwero','LUW',1),
	(3429,219,'Masaka','MAS',1),
	(3430,219,'Mpigi','MPI',1),
	(3431,219,'Mubende','MUB',1),
	(3432,219,'Mukono','MUK',1),
	(3433,219,'Nakasongola','NKS',1),
	(3434,219,'Rakai','RAK',1),
	(3435,219,'Sembabule','SEM',1),
	(3436,219,'Wakiso','WAK',1),
	(3437,219,'Bugiri','BUG',1),
	(3438,219,'Busia','BUS',1),
	(3439,219,'Iganga','IGA',1),
	(3440,219,'Jinja','JIN',1),
	(3441,219,'Kaberamaido','KAB',1),
	(3442,219,'Kamuli','KML',1),
	(3443,219,'Kapchorwa','KPC',1),
	(3444,219,'Katakwi','KTK',1),
	(3445,219,'Kumi','KUM',1),
	(3446,219,'Mayuge','MAY',1),
	(3447,219,'Mbale','MBA',1),
	(3448,219,'Pallisa','PAL',1),
	(3449,219,'Sironko','SIR',1),
	(3450,219,'Soroti','SOR',1),
	(3451,219,'Tororo','TOR',1),
	(3452,219,'Adjumani','ADJ',1),
	(3453,219,'Apac','APC',1),
	(3454,219,'Arua','ARU',1),
	(3455,219,'Gulu','GUL',1),
	(3456,219,'Kitgum','KIT',1),
	(3457,219,'Kotido','KOT',1),
	(3458,219,'Lira','LIR',1),
	(3459,219,'Moroto','MRT',1),
	(3460,219,'Moyo','MOY',1),
	(3461,219,'Nakapiripirit','NAK',1),
	(3462,219,'Nebbi','NEB',1),
	(3463,219,'Pader','PAD',1),
	(3464,219,'Yumbe','YUM',1),
	(3465,219,'Bundibugyo','BUN',1),
	(3466,219,'Bushenyi','BSH',1),
	(3467,219,'Hoima','HOI',1),
	(3468,219,'Kabale','KBL',1),
	(3469,219,'Kabarole','KAR',1),
	(3470,219,'Kamwenge','KAM',1),
	(3471,219,'Kanungu','KAN',1),
	(3472,219,'Kasese','KAS',1),
	(3473,219,'Kibaale','KBA',1),
	(3474,219,'Kisoro','KIS',1),
	(3475,219,'Kyenjojo','KYE',1),
	(3476,219,'Masindi','MSN',1),
	(3477,219,'Mbarara','MBR',1),
	(3478,219,'Ntungamo','NTU',1),
	(3479,219,'Rukungiri','RUK',1),
	(3480,220,'Черкассы','CK',1),
	(3481,220,'Чернигов','CH',1),
	(3482,220,'Черновцы','CV',1),
	(3483,220,'Крым','CR',1),
	(3484,220,'Днепропетровск','DN',1),
	(3485,220,'Донецк','DO',1),
	(3486,220,'Ивано-Франковск','IV',1),
	(3487,220,'Харьков','KH',1),
	(3488,220,'Хмельницкий','KM',1),
	(3489,220,'Кировоград','KR',1),
	(3490,220,'Киевская область','KV',1),
	(3491,220,'Киев','KY',1),
	(3492,220,'Луганск','LU',1),
	(3493,220,'Львов','LV',1),
	(3494,220,'Николаев','MY',1),
	(3495,220,'Одесса','OD',1),
	(3496,220,'Полтава','PO',1),
	(3497,220,'Ровно','RI',1),
	(3498,220,'Севастополь','SE',1),
	(3499,220,'Сумы','SU',1),
	(3500,220,'Тернополь','TE',1),
	(3501,220,'Винница','VI',1),
	(3502,220,'Луцк','VO',1),
	(3503,220,'Ужгород','ZK',1),
	(3504,220,'Запорожье','ZA',1),
	(3505,220,'Житомир','ZH',1),
	(3506,221,'Abu Zaby','AZ',1),
	(3507,221,'\'Ajman','AJ',1),
	(3508,221,'Al Fujayrah','FU',1),
	(3509,221,'Ash Shariqah','SH',1),
	(3510,221,'Dubayy','DU',1),
	(3511,221,'R\'as al Khaymah','RK',1),
	(3512,221,'Umm al Qaywayn','UQ',1),
	(3513,222,'Aberdeen','ABN',1),
	(3514,222,'Aberdeenshire','ABNS',1),
	(3515,222,'Anglesey','ANG',1),
	(3516,222,'Angus','AGS',1),
	(3517,222,'Argyll and Bute','ARY',1),
	(3518,222,'Bedfordshire','BEDS',1),
	(3519,222,'Berkshire','BERKS',1),
	(3520,222,'Blaenau Gwent','BLA',1),
	(3521,222,'Bridgend','BRI',1),
	(3522,222,'Bristol','BSTL',1),
	(3523,222,'Buckinghamshire','BUCKS',1),
	(3524,222,'Caerphilly','CAE',1),
	(3525,222,'Cambridgeshire','CAMBS',1),
	(3526,222,'Cardiff','CDF',1),
	(3527,222,'Carmarthenshire','CARM',1),
	(3528,222,'Ceredigion','CDGN',1),
	(3529,222,'Cheshire','CHES',1),
	(3530,222,'Clackmannanshire','CLACK',1),
	(3531,222,'Conwy','CON',1),
	(3532,222,'Cornwall','CORN',1),
	(3533,222,'Denbighshire','DNBG',1),
	(3534,222,'Derbyshire','DERBY',1),
	(3535,222,'Devon','DVN',1),
	(3536,222,'Dorset','DOR',1),
	(3537,222,'Dumfries and Galloway','DGL',1),
	(3538,222,'Dundee','DUND',1),
	(3539,222,'Durham','DHM',1),
	(3540,222,'East Ayrshire','ARYE',1),
	(3541,222,'East Dunbartonshire','DUNBE',1),
	(3542,222,'East Lothian','LOTE',1),
	(3543,222,'East Renfrewshire','RENE',1),
	(3544,222,'East Riding of Yorkshire','ERYS',1),
	(3545,222,'East Sussex','SXE',1),
	(3546,222,'Edinburgh','EDIN',1),
	(3547,222,'Essex','ESX',1),
	(3548,222,'Falkirk','FALK',1),
	(3549,222,'Fife','FFE',1),
	(3550,222,'Flintshire','FLINT',1),
	(3551,222,'Glasgow','GLAS',1),
	(3552,222,'Gloucestershire','GLOS',1),
	(3553,222,'Greater London','LDN',1),
	(3554,222,'Greater Manchester','MCH',1),
	(3555,222,'Gwynedd','GDD',1),
	(3556,222,'Hampshire','HANTS',1),
	(3557,222,'Herefordshire','HWR',1),
	(3558,222,'Hertfordshire','HERTS',1),
	(3559,222,'Highlands','HLD',1),
	(3560,222,'Inverclyde','IVER',1),
	(3561,222,'Isle of Wight','IOW',1),
	(3562,222,'Kent','KNT',1),
	(3563,222,'Lancashire','LANCS',1),
	(3564,222,'Leicestershire','LEICS',1),
	(3565,222,'Lincolnshire','LINCS',1),
	(3566,222,'Merseyside','MSY',1),
	(3567,222,'Merthyr Tydfil','MERT',1),
	(3568,222,'Midlothian','MLOT',1),
	(3569,222,'Monmouthshire','MMOUTH',1),
	(3570,222,'Moray','MORAY',1),
	(3571,222,'Neath Port Talbot','NPRTAL',1),
	(3572,222,'Newport','NEWPT',1),
	(3573,222,'Norfolk','NOR',1),
	(3574,222,'North Ayrshire','ARYN',1),
	(3575,222,'North Lanarkshire','LANN',1),
	(3576,222,'North Yorkshire','YSN',1),
	(3577,222,'Northamptonshire','NHM',1),
	(3578,222,'Northumberland','NLD',1),
	(3579,222,'Nottinghamshire','NOT',1),
	(3580,222,'Orkney Islands','ORK',1),
	(3581,222,'Oxfordshire','OFE',1),
	(3582,222,'Pembrokeshire','PEM',1),
	(3583,222,'Perth and Kinross','PERTH',1),
	(3584,222,'Powys','PWS',1),
	(3585,222,'Renfrewshire','REN',1),
	(3586,222,'Rhondda Cynon Taff','RHON',1),
	(3587,222,'Rutland','RUT',1),
	(3588,222,'Scottish Borders','BOR',1),
	(3589,222,'Shetland Islands','SHET',1),
	(3590,222,'Shropshire','SPE',1),
	(3591,222,'Somerset','SOM',1),
	(3592,222,'South Ayrshire','ARYS',1),
	(3593,222,'South Lanarkshire','LANS',1),
	(3594,222,'South Yorkshire','YSS',1),
	(3595,222,'Staffordshire','SFD',1),
	(3596,222,'Stirling','STIR',1),
	(3597,222,'Suffolk','SFK',1),
	(3598,222,'Surrey','SRY',1),
	(3599,222,'Swansea','SWAN',1),
	(3600,222,'Torfaen','TORF',1),
	(3601,222,'Tyne and Wear','TWR',1),
	(3602,222,'Vale of Glamorgan','VGLAM',1),
	(3603,222,'Warwickshire','WARKS',1),
	(3604,222,'West Dunbartonshire','WDUN',1),
	(3605,222,'West Lothian','WLOT',1),
	(3606,222,'West Midlands','WMD',1),
	(3607,222,'West Sussex','SXW',1),
	(3608,222,'West Yorkshire','YSW',1),
	(3609,222,'Western Isles','WIL',1),
	(3610,222,'Wiltshire','WLT',1),
	(3611,222,'Worcestershire','WORCS',1),
	(3612,222,'Wrexham','WRX',1),
	(3613,223,'Alabama','AL',1),
	(3614,223,'Alaska','AK',1),
	(3615,223,'American Samoa','AS',1),
	(3616,223,'Arizona','AZ',1),
	(3617,223,'Arkansas','AR',1),
	(3618,223,'Armed Forces Africa','AF',1),
	(3619,223,'Armed Forces Americas','AA',1),
	(3620,223,'Armed Forces Canada','AC',1),
	(3621,223,'Armed Forces Europe','AE',1),
	(3622,223,'Armed Forces Middle East','AM',1),
	(3623,223,'Armed Forces Pacific','AP',1),
	(3624,223,'California','CA',1),
	(3625,223,'Colorado','CO',1),
	(3626,223,'Connecticut','CT',1),
	(3627,223,'Delaware','DE',1),
	(3628,223,'District of Columbia','DC',1),
	(3629,223,'Federated States Of Micronesia','FM',1),
	(3630,223,'Florida','FL',1),
	(3631,223,'Georgia','GA',1),
	(3632,223,'Guam','GU',1),
	(3633,223,'Hawaii','HI',1),
	(3634,223,'Idaho','ID',1),
	(3635,223,'Illinois','IL',1),
	(3636,223,'Indiana','IN',1),
	(3637,223,'Iowa','IA',1),
	(3638,223,'Kansas','KS',1),
	(3639,223,'Kentucky','KY',1),
	(3640,223,'Louisiana','LA',1),
	(3641,223,'Maine','ME',1),
	(3642,223,'Marshall Islands','MH',1),
	(3643,223,'Maryland','MD',1),
	(3644,223,'Massachusetts','MA',1),
	(3645,223,'Michigan','MI',1),
	(3646,223,'Minnesota','MN',1),
	(3647,223,'Mississippi','MS',1),
	(3648,223,'Missouri','MO',1),
	(3649,223,'Montana','MT',1),
	(3650,223,'Nebraska','NE',1),
	(3651,223,'Nevada','NV',1),
	(3652,223,'New Hampshire','NH',1),
	(3653,223,'New Jersey','NJ',1),
	(3654,223,'New Mexico','NM',1),
	(3655,223,'New York','NY',1),
	(3656,223,'North Carolina','NC',1),
	(3657,223,'North Dakota','ND',1),
	(3658,223,'Northern Mariana Islands','MP',1),
	(3659,223,'Ohio','OH',1),
	(3660,223,'Oklahoma','OK',1),
	(3661,223,'Oregon','OR',1),
	(3662,223,'Palau','PW',1),
	(3663,223,'Pennsylvania','PA',1),
	(3664,223,'Puerto Rico','PR',1),
	(3665,223,'Rhode Island','RI',1),
	(3666,223,'South Carolina','SC',1),
	(3667,223,'South Dakota','SD',1),
	(3668,223,'Tennessee','TN',1),
	(3669,223,'Texas','TX',1),
	(3670,223,'Utah','UT',1),
	(3671,223,'Vermont','VT',1),
	(3672,223,'Virgin Islands','VI',1),
	(3673,223,'Virginia','VA',1),
	(3674,223,'Washington','WA',1),
	(3675,223,'West Virginia','WV',1),
	(3676,223,'Wisconsin','WI',1),
	(3677,223,'Wyoming','WY',1),
	(3678,224,'Baker Island','BI',1),
	(3679,224,'Howland Island','HI',1),
	(3680,224,'Jarvis Island','JI',1),
	(3681,224,'Johnston Atoll','JA',1),
	(3682,224,'Kingman Reef','KR',1),
	(3683,224,'Midway Atoll','MA',1),
	(3684,224,'Navassa Island','NI',1),
	(3685,224,'Palmyra Atoll','PA',1),
	(3686,224,'Wake Island','WI',1),
	(3687,225,'Artigas','AR',1),
	(3688,225,'Canelones','CA',1),
	(3689,225,'Cerro Largo','CL',1),
	(3690,225,'Colonia','CO',1),
	(3691,225,'Durazno','DU',1),
	(3692,225,'Flores','FS',1),
	(3693,225,'Florida','FA',1),
	(3694,225,'Lavalleja','LA',1),
	(3695,225,'Maldonado','MA',1),
	(3696,225,'Montevideo','MO',1),
	(3697,225,'Paysandu','PA',1),
	(3698,225,'Rio Negro','RN',1),
	(3699,225,'Rivera','RV',1),
	(3700,225,'Rocha','RO',1),
	(3701,225,'Salto','SL',1),
	(3702,225,'San Jose','SJ',1),
	(3703,225,'Soriano','SO',1),
	(3704,225,'Tacuarembo','TA',1),
	(3705,225,'Treinta y Tres','TT',1),
	(3706,226,'Andijon','AN',1),
	(3707,226,'Buxoro','BU',1),
	(3708,226,'Farg\'ona','FA',1),
	(3709,226,'Jizzax','JI',1),
	(3710,226,'Namangan','NG',1),
	(3711,226,'Navoiy','NW',1),
	(3712,226,'Qashqadaryo','QA',1),
	(3713,226,'Qoraqalpog\'iston Republikasi','QR',1),
	(3714,226,'Samarqand','SA',1),
	(3715,226,'Sirdaryo','SI',1),
	(3716,226,'Surxondaryo','SU',1),
	(3717,226,'Toshkent City','TK',1),
	(3718,226,'Toshkent Region','TO',1),
	(3719,226,'Xorazm','XO',1),
	(3720,227,'Malampa','MA',1),
	(3721,227,'Penama','PE',1),
	(3722,227,'Sanma','SA',1),
	(3723,227,'Shefa','SH',1),
	(3724,227,'Tafea','TA',1),
	(3725,227,'Torba','TO',1),
	(3726,229,'Amazonas','AM',1),
	(3727,229,'Anzoategui','AN',1),
	(3728,229,'Apure','AP',1),
	(3729,229,'Aragua','AR',1),
	(3730,229,'Barinas','BA',1),
	(3731,229,'Bolivar','BO',1),
	(3732,229,'Carabobo','CA',1),
	(3733,229,'Cojedes','CO',1),
	(3734,229,'Delta Amacuro','DA',1),
	(3735,229,'Dependencias Federales','DF',1),
	(3736,229,'Distrito Federal','DI',1),
	(3737,229,'Falcon','FA',1),
	(3738,229,'Guarico','GU',1),
	(3739,229,'Lara','LA',1),
	(3740,229,'Merida','ME',1),
	(3741,229,'Miranda','MI',1),
	(3742,229,'Monagas','MO',1),
	(3743,229,'Nueva Esparta','NE',1),
	(3744,229,'Portuguesa','PO',1),
	(3745,229,'Sucre','SU',1),
	(3746,229,'Tachira','TA',1),
	(3747,229,'Trujillo','TR',1),
	(3748,229,'Vargas','VA',1),
	(3749,229,'Yaracuy','YA',1),
	(3750,229,'Zulia','ZU',1),
	(3751,230,'An Giang','AG',1),
	(3752,230,'Bac Giang','BG',1),
	(3753,230,'Bac Kan','BK',1),
	(3754,230,'Bac Lieu','BL',1),
	(3755,230,'Bac Ninh','BC',1),
	(3756,230,'Ba Ria-Vung Tau','BR',1),
	(3757,230,'Ben Tre','BN',1),
	(3758,230,'Binh Dinh','BH',1),
	(3759,230,'Binh Duong','BU',1),
	(3760,230,'Binh Phuoc','BP',1),
	(3761,230,'Binh Thuan','BT',1),
	(3762,230,'Ca Mau','CM',1),
	(3763,230,'Can Tho','CT',1),
	(3764,230,'Cao Bang','CB',1),
	(3765,230,'Dak Lak','DL',1),
	(3766,230,'Dak Nong','DG',1),
	(3767,230,'Da Nang','DN',1),
	(3768,230,'Dien Bien','DB',1),
	(3769,230,'Dong Nai','DI',1),
	(3770,230,'Dong Thap','DT',1),
	(3771,230,'Gia Lai','GL',1),
	(3772,230,'Ha Giang','HG',1),
	(3773,230,'Hai Duong','HD',1),
	(3774,230,'Hai Phong','HP',1),
	(3775,230,'Ha Nam','HM',1),
	(3776,230,'Ha Noi','HI',1),
	(3777,230,'Ha Tay','HT',1),
	(3778,230,'Ha Tinh','HH',1),
	(3779,230,'Hoa Binh','HB',1),
	(3780,230,'Ho Chi Minh City','HC',1),
	(3781,230,'Hau Giang','HU',1),
	(3782,230,'Hung Yen','HY',1),
	(3783,232,'Saint Croix','C',1),
	(3784,232,'Saint John','J',1),
	(3785,232,'Saint Thomas','T',1),
	(3786,233,'Alo','A',1),
	(3787,233,'Sigave','S',1),
	(3788,233,'Wallis','W',1),
	(3789,235,'Abyan','AB',1),
	(3790,235,'Adan','AD',1),
	(3791,235,'Amran','AM',1),
	(3792,235,'Al Bayda','BA',1),
	(3793,235,'Ad Dali','DA',1),
	(3794,235,'Dhamar','DH',1),
	(3795,235,'Hadramawt','HD',1),
	(3796,235,'Hajjah','HJ',1),
	(3797,235,'Al Hudaydah','HU',1),
	(3798,235,'Ibb','IB',1),
	(3799,235,'Al Jawf','JA',1),
	(3800,235,'Lahij','LA',1),
	(3801,235,'Ma\'rib','MA',1),
	(3802,235,'Al Mahrah','MR',1),
	(3803,235,'Al Mahwit','MW',1),
	(3804,235,'Sa\'dah','SD',1),
	(3805,235,'San\'a','SN',1),
	(3806,235,'Shabwah','SH',1),
	(3807,235,'Ta\'izz','TA',1),
	(3808,236,'Kosovo','KOS',1),
	(3809,236,'Montenegro','MON',1),
	(3810,236,'Serbia','SER',1),
	(3811,236,'Vojvodina','VOJ',1),
	(3812,237,'Bas-Congo','BC',1),
	(3813,237,'Bandundu','BN',1),
	(3814,237,'Equateur','EQ',1),
	(3815,237,'Katanga','KA',1),
	(3816,237,'Kasai-Oriental','KE',1),
	(3817,237,'Kinshasa','KN',1),
	(3818,237,'Kasai-Occidental','KW',1),
	(3819,237,'Maniema','MA',1),
	(3820,237,'Nord-Kivu','NK',1),
	(3821,237,'Orientale','OR',1),
	(3822,237,'Sud-Kivu','SK',1),
	(3823,238,'Central','CE',1),
	(3824,238,'Copperbelt','CB',1),
	(3825,238,'Eastern','EA',1),
	(3826,238,'Luapula','LP',1),
	(3827,238,'Lusaka','LK',1),
	(3828,238,'Northern','NO',1),
	(3829,238,'North-Western','NW',1),
	(3830,238,'Southern','SO',1),
	(3831,238,'Western','WE',1),
	(3832,239,'Bulawayo','BU',1),
	(3833,239,'Harare','HA',1),
	(3834,239,'Manicaland','ML',1),
	(3835,239,'Mashonaland Central','MC',1),
	(3836,239,'Mashonaland East','ME',1),
	(3837,239,'Mashonaland West','MW',1),
	(3838,239,'Masvingo','MV',1),
	(3839,239,'Matabeleland North','MN',1),
	(3840,239,'Matabeleland South','MS',1),
	(3841,239,'Midlands','MD',1),
	(3861,105,'Campobasso','CB',1),
	(3862,105,'Carbonia-Iglesias','CI',1),
	(3863,105,'Caserta','CE',1),
	(3864,105,'Catania','CT',1),
	(3865,105,'Catanzaro','CZ',1),
	(3866,105,'Chieti','CH',1),
	(3867,105,'Como','CO',1),
	(3868,105,'Cosenza','CS',1),
	(3869,105,'Cremona','CR',1),
	(3870,105,'Crotone','KR',1),
	(3871,105,'Cuneo','CN',1),
	(3872,105,'Enna','EN',1),
	(3873,105,'Ferrara','FE',1),
	(3874,105,'Firenze','FI',1),
	(3875,105,'Foggia','FG',1),
	(3876,105,'Forli-Cesena','FC',1),
	(3877,105,'Frosinone','FR',1),
	(3878,105,'Genova','GE',1),
	(3879,105,'Gorizia','GO',1),
	(3880,105,'Grosseto','GR',1),
	(3881,105,'Imperia','IM',1),
	(3882,105,'Isernia','IS',1),
	(3883,105,'L&#39;Aquila','AQ',1),
	(3884,105,'La Spezia','SP',1),
	(3885,105,'Latina','LT',1),
	(3886,105,'Lecce','LE',1),
	(3887,105,'Lecco','LC',1),
	(3888,105,'Livorno','LI',1),
	(3889,105,'Lodi','LO',1),
	(3890,105,'Lucca','LU',1),
	(3891,105,'Macerata','MC',1),
	(3892,105,'Mantova','MN',1),
	(3893,105,'Massa-Carrara','MS',1),
	(3894,105,'Matera','MT',1),
	(3895,105,'Medio Campidano','VS',1),
	(3896,105,'Messina','ME',1),
	(3897,105,'Milano','MI',1),
	(3898,105,'Modena','MO',1),
	(3899,105,'Napoli','NA',1),
	(3900,105,'Novara','NO',1),
	(3901,105,'Nuoro','NU',1),
	(3902,105,'Ogliastra','OG',1),
	(3903,105,'Olbia-Tempio','OT',1),
	(3904,105,'Oristano','OR',1),
	(3905,105,'Padova','PD',1),
	(3906,105,'Palermo','PA',1),
	(3907,105,'Parma','PR',1),
	(3908,105,'Pavia','PV',1),
	(3909,105,'Perugia','PG',1),
	(3910,105,'Pesaro e Urbino','PU',1),
	(3911,105,'Pescara','PE',1),
	(3912,105,'Piacenza','PC',1),
	(3913,105,'Pisa','PI',1),
	(3914,105,'Pistoia','PT',1),
	(3915,105,'Pordenone','PN',1),
	(3916,105,'Potenza','PZ',1),
	(3917,105,'Prato','PO',1),
	(3918,105,'Ragusa','RG',1),
	(3919,105,'Ravenna','RA',1),
	(3920,105,'Reggio Calabria','RC',1),
	(3921,105,'Reggio Emilia','RE',1),
	(3922,105,'Rieti','RI',1),
	(3923,105,'Rimini','RN',1),
	(3924,105,'Roma','RM',1),
	(3925,105,'Rovigo','RO',1),
	(3926,105,'Salerno','SA',1),
	(3927,105,'Sassari','SS',1),
	(3928,105,'Savona','SV',1),
	(3929,105,'Siena','SI',1),
	(3930,105,'Siracusa','SR',1),
	(3931,105,'Sondrio','SO',1),
	(3932,105,'Taranto','TA',1),
	(3933,105,'Teramo','TE',1),
	(3934,105,'Terni','TR',1),
	(3935,105,'Torino','TO',1),
	(3936,105,'Trapani','TP',1),
	(3937,105,'Trento','TN',1),
	(3938,105,'Treviso','TV',1),
	(3939,105,'Trieste','TS',1),
	(3940,105,'Udine','UD',1),
	(3941,105,'Varese','VA',1),
	(3942,105,'Venezia','VE',1),
	(3943,105,'Verbano-Cusio-Ossola','VB',1),
	(3944,105,'Vercelli','VC',1),
	(3945,105,'Verona','VR',1),
	(3946,105,'Vibo Valentia','VV',1),
	(3947,105,'Vicenza','VI',1),
	(3948,105,'Viterbo','VT',1),
	(3949,222,'County Antrim','ANT',1),
	(3950,222,'County Armagh','ARM',1),
	(3951,222,'County Down','DOW',1),
	(3952,222,'County Fermanagh','FER',1),
	(3953,222,'County Londonderry','LDY',1),
	(3954,222,'County Tyrone','TYR',1),
	(3955,222,'Cumbria','CMA',1),
	(3956,190,'Pomurska','1',1),
	(3957,190,'Podravska','2',1),
	(3958,190,'Koroška','3',1),
	(3959,190,'Savinjska','4',1),
	(3960,190,'Zasavska','5',1),
	(3961,190,'Spodnjeposavska','6',1),
	(3962,190,'Jugovzhodna Slovenija','7',1),
	(3963,190,'Osrednjeslovenska','8',1),
	(3964,190,'Gorenjska','9',1),
	(3965,190,'Notranjsko-kraška','10',1),
	(3966,190,'Goriška','11',1),
	(3967,190,'Obalno-kraška','12',1),
	(3968,33,'Ruse','',1),
	(3969,101,'Alborz','ALB',1),
	(3970,220,'Херсон','KE',1);

/*!40000 ALTER TABLE `comcs_zone` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы comcs_zone_to_geo_zone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comcs_zone_to_geo_zone`;

CREATE TABLE `comcs_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comcs_zone_to_geo_zone` WRITE;
/*!40000 ALTER TABLE `comcs_zone_to_geo_zone` DISABLE KEYS */;

INSERT INTO `comcs_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`)
VALUES
	(57,176,0,3,'2010-02-26 22:33:24','0000-00-00 00:00:00'),
	(59,176,2768,4,'2015-03-05 06:45:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `comcs_zone_to_geo_zone` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
