-- MySQL dump 10.13  Distrib 5.5.54, for linux2.6 (x86_64)
--
-- Host: localhost    Database: directus
-- ------------------------------------------------------
-- Server version	5.5.54

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board_actual_members`
--

DROP TABLE IF EXISTS `board_actual_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_actual_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `board_member_id` int(11) DEFAULT NULL,
  `guild_board_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_actual_members`
--

LOCK TABLES `board_actual_members` WRITE;
/*!40000 ALTER TABLE `board_actual_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_actual_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_members`
--

DROP TABLE IF EXISTS `board_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `title` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_shorthand` varchar(100) DEFAULT NULL,
  `IRC_nick` varchar(100) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_members`
--

LOCK TABLES `board_members` WRITE;
/*!40000 ALTER TABLE `board_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_officials`
--

DROP TABLE IF EXISTS `board_officials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_officials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `board_member_id` int(11) DEFAULT NULL,
  `guild_board_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_officials`
--

LOCK TABLES `board_officials` WRITE;
/*!40000 ALTER TABLE `board_officials` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_officials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_activity`
--

DROP TABLE IF EXISTS `directus_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `identifier` varchar(100) DEFAULT NULL,
  `table_name` varchar(100) NOT NULL DEFAULT '',
  `row_id` int(11) unsigned DEFAULT '0',
  `user` int(11) unsigned NOT NULL DEFAULT '0',
  `data` text,
  `delta` text,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `parent_table` varchar(100) DEFAULT NULL,
  `parent_changed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Did the top-level record in the change set alter (scalar values/many-to-one relationships)? Or only the data within its related foreign collection records? (*toMany)',
  `datetime` datetime DEFAULT NULL,
  `logged_ip` varchar(20) DEFAULT NULL,
  `user_agent` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2069 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_activity`
--

LOCK TABLES `directus_activity` WRITE;
/*!40000 ALTER TABLE `directus_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_bookmarks`
--

DROP TABLE IF EXISTS `directus_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_bookmarks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon_class` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_bookmarks`
--

LOCK TABLES `directus_bookmarks` WRITE;
/*!40000 ALTER TABLE `directus_bookmarks` DISABLE KEYS */;
INSERT INTO `directus_bookmarks` VALUES (1,1,'Activity','activity','icon-bell',NULL,'other'),(2,1,'Files','files','icon-attach',NULL,'other'),(3,1,'Messages','messages','icon-chat',NULL,'other'),(4,1,'Users','users','icon-users',NULL,'other');
/*!40000 ALTER TABLE `directus_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_columns`
--

DROP TABLE IF EXISTS `directus_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_columns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `data_type` varchar(64) DEFAULT NULL,
  `ui` varchar(64) DEFAULT NULL,
  `relationship_type` varchar(20) DEFAULT NULL,
  `related_table` varchar(64) DEFAULT NULL,
  `junction_table` varchar(64) DEFAULT NULL,
  `junction_key_left` varchar(64) DEFAULT NULL,
  `junction_key_right` varchar(64) DEFAULT NULL,
  `hidden_input` tinyint(1) NOT NULL DEFAULT '0',
  `hidden_list` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  `comment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table-column` (`table_name`,`column_name`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_columns`
--

LOCK TABLES `directus_columns` WRITE;
/*!40000 ALTER TABLE `directus_columns` DISABLE KEYS */;
INSERT INTO `directus_columns` VALUES (1,'directus_users','group',NULL,'many_to_one','MANYTOONE','directus_groups',NULL,NULL,'group_id',0,0,0,NULL,''),(2,'directus_users','avatar_file_id','INT','single_file','MANYTOONE','directus_files',NULL,NULL,'avatar_file_id',0,0,0,NULL,''),(3,'events','participants','ALIAS','many_to_many','MANYTOMANY','members','event_participants','event_id','member_id',0,0,0,13,''),(4,'events','authors','ALIAS','many_to_many','MANYTOMANY','members','event_authors','event_id','member_id',0,0,1,5,''),(5,'events','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,0,''),(6,'events','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,1,''),(7,'events','title',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,2,''),(8,'events','slug',NULL,'slug',NULL,NULL,NULL,NULL,NULL,0,0,1,3,''),(9,'events','created_on',NULL,'datetime',NULL,NULL,NULL,NULL,NULL,0,0,1,4,''),(10,'events','location',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,6,''),(11,'events','text',NULL,'markdown',NULL,NULL,NULL,NULL,NULL,0,0,1,7,''),(12,'events','max_participants',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,8,''),(13,'events','event_start_time',NULL,'datetime',NULL,NULL,NULL,NULL,NULL,0,0,1,9,''),(14,'events','event_end_time',NULL,'datetime',NULL,NULL,NULL,NULL,NULL,0,0,0,10,''),(15,'events','registration_start_time',NULL,'datetime',NULL,NULL,NULL,NULL,NULL,0,0,1,11,''),(16,'events','registration_end_date',NULL,'datetime',NULL,NULL,NULL,NULL,NULL,0,0,0,12,''),(17,'news','authors','ALIAS','many_to_many','MANYTOMANY','members','news_authors','news_id','member_id',0,0,1,9999,''),(18,'news','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(19,'news','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(20,'news','title',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,3,''),(21,'news','text',NULL,'markdown',NULL,NULL,NULL,NULL,NULL,0,0,0,4,''),(22,'news','slug',NULL,'slug',NULL,NULL,NULL,NULL,NULL,0,0,1,5,''),(23,'news','created_on',NULL,'datetime',NULL,NULL,NULL,NULL,NULL,0,0,1,6,''),(25,'members','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,0,''),(26,'members','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,1,''),(27,'members','username',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,2,''),(28,'members','first_name',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,3,''),(29,'members','last_name',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,4,''),(30,'members','email',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,5,''),(34,'members','role',NULL,'select',NULL,NULL,NULL,NULL,NULL,0,0,1,9,''),(35,'Partners','logo','INT','single_file','MANYTOONE','directus_files',NULL,NULL,'logo',0,0,0,9999,''),(36,'Partners','name','VARCHAR','textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(37,'Partners','website','VARCHAR','textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(38,'Partners','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(39,'Partners','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(41,'landing_page','main_title',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(42,'landing_page','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(43,'landing_page','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(44,'landing_page','introduction_text',NULL,'markdown',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(45,'sponsors','name',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(46,'sponsors','logo','INT','single_file','MANYTOONE','directus_files',NULL,NULL,'logo',0,0,1,9999,''),(47,'sponsors','website',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(48,'sponsors','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(49,'sponsors','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(50,'landing_page_images','image_id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(51,'landing_page_images','landing_page_id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(52,'landing_page_images','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(53,'landing_page_images','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(54,'landing_page','jumbotron_images','ALIAS','multiple_files','MANYTOMANY','directus_files','landing_page_images','landing_page_id','image_id',0,0,1,9999,''),(55,'footer','contact_info',NULL,'markdown',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(56,'social_media_button','logo','INT','single_file','MANYTOONE','directus_files',NULL,NULL,'logo',0,0,1,9999,''),(57,'social_media_button','link',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(58,'social_media_button','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(59,'social_media_button','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(60,'social_media_button','footer_id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,1,1,0,9999,''),(61,'footer','social_media_buttons','ALIAS','one_to_many','ONETOMANY','social_media_button',NULL,NULL,'footer_id',0,0,0,9999,''),(62,'footer','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(63,'footer','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(64,'social_media_button','name',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(65,'footer_links','title',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(66,'footer_links','link',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(67,'footer_links','footer_id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,1,1,0,9999,''),(68,'footer_links','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(69,'footer_links','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(70,'footer','other_links','ALIAS','one_to_many','ONETOMANY','footer_links',NULL,NULL,'footer_id',0,0,0,9999,''),(71,'landing_page','guild_logo','INT','single_file','MANYTOONE','directus_files',NULL,NULL,'guild_logo',0,0,1,9999,''),(72,'landing_page','guild_name',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(73,'guild_pages','guild_id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,1,1,0,9999,''),(74,'guild_pages','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(75,'guild_pages','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(76,'guild','sub_pages','ALIAS','one_to_many','ONETOMANY','guild_pages',NULL,NULL,'guild_id',0,0,0,9999,''),(78,'guild_subpages','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(79,'guild_subpages','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(80,'guild_main_page','subpages','ALIAS','one_to_many','ONETOMANY','guild_subpages',NULL,NULL,'guild_id',0,0,0,9999,''),(81,'guild_main_page','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(82,'guild_main_page','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(83,'guild_subpages','title',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(84,'guild_subpages','text',NULL,'markdown',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(85,'guild_subpages','slug',NULL,'slug',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(86,'guild_subpages','priority','TINYINT','numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(87,'guild_board','text',NULL,'markdown',NULL,NULL,NULL,NULL,NULL,0,0,0,3,''),(88,'guild_board','title',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,4,''),(89,'guild_board','year',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,2,''),(90,'guild_board','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,0,''),(91,'guild_board','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,1,''),(94,'board_members','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(95,'board_members','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(99,'members','phone','VARCHAR','textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,6,''),(100,'board_members','title',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(101,'board_members','first_name',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(102,'board_members','last_name',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(103,'board_members','email_shorthand',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(105,'board_members','IRC_nick','VARCHAR','textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(106,'board_members','image','INT','single_file','MANYTOONE','directus_files',NULL,NULL,'image',0,0,1,9999,''),(110,'guild_board','slug',NULL,'slug',NULL,NULL,NULL,NULL,NULL,0,0,1,5,'Based on title'),(112,'subpages','text','TEXT','markdown',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(113,'subpages','slug','VARCHAR','slug',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(114,'subpages','priority','TINYINT','numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(116,'subpages','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(117,'subpages','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(118,'categories','title','VARCHAR','textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(120,'categories','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(121,'categories','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(123,'categories','slug','VARCHAR','slug',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(126,'subpages','title','VARCHAR','textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(130,'subpages','category_id','INT','many_to_one','MANYTOONE','categories',NULL,NULL,'category_id',0,0,0,9999,''),(131,'categories','subpages','ALIAS','one_to_many','ONETOMANY','subpages',NULL,NULL,'category_id',0,0,0,9999,''),(134,'board_officials','board_member_id','INT','numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(135,'board_officials','guild_board_id','INT','numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(136,'board_officials','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(137,'board_officials','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(139,'board_actual_members','board_member_id','INT','numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(140,'board_actual_members','guild_board_id','INT','numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(141,'board_actual_members','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(142,'board_actual_members','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(144,'guild_board','board_members_title',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,7,''),(145,'guild_board','board_officials_title',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,9,''),(146,'news','tags','TEXT','tags',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(147,'news_categories','title','VARCHAR','textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(148,'news_categories','slug','VARCHAR','slug',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(149,'news','news_category','INT','many_to_one','MANYTOONE','news_categories',NULL,NULL,'news_category',0,0,1,9999,''),(150,'news_categories','news','ALIAS','one_to_many','ONETOMANY','news',NULL,NULL,'news_category',0,0,0,9999,''),(151,'news_categories','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(152,'news_categories','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(153,'other_links','title','VARCHAR','textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(154,'other_links','link','VARCHAR','textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,''),(155,'other_links','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(156,'other_links','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(157,'Theme','primary_color',NULL,'color',NULL,NULL,NULL,NULL,NULL,0,0,1,3,''),(158,'Theme','accent_color',NULL,'color',NULL,NULL,NULL,NULL,NULL,0,0,1,4,''),(159,'Theme','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,0,''),(160,'Theme','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,1,''),(162,'Theme','name','VARCHAR','textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(165,'guild_board','board_officials','ALIAS','many_to_many','MANYTOMANY','board_members','board_officials','guild_board_id','board_member_id',0,0,0,10,''),(166,'guild_board','board_members','ALIAS','many_to_many','MANYTOMANY','board_members','board_actual_members','guild_board_id','board_member_id',0,0,0,8,''),(168,'guild_board','chairman','INT','many_to_one_typeahead','MANYTOONE','board_members',NULL,NULL,'chairman',0,0,0,6,''),(169,'members','password',NULL,'password',NULL,NULL,NULL,NULL,NULL,0,0,1,9999,''),(170,'members','salt',NULL,'salt',NULL,NULL,NULL,NULL,NULL,1,1,0,9999,'');
/*!40000 ALTER TABLE `directus_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_files`
--

DROP TABLE IF EXISTS `directus_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `location` varchar(200) DEFAULT NULL,
  `caption` text,
  `type` varchar(50) DEFAULT '',
  `charset` varchar(50) DEFAULT '',
  `tags` varchar(255) DEFAULT '',
  `width` int(11) unsigned DEFAULT '0',
  `height` int(11) unsigned DEFAULT '0',
  `size` int(11) unsigned DEFAULT '0',
  `embed_id` varchar(200) DEFAULT NULL,
  `user` int(11) unsigned NOT NULL,
  `date_uploaded` datetime DEFAULT NULL,
  `storage_adapter` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_files`
--

LOCK TABLES `directus_files` WRITE;
/*!40000 ALTER TABLE `directus_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_groups`
--

DROP TABLE IF EXISTS `directus_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `restrict_to_ip_whitelist` text,
  `nav_override` text,
  `show_activity` tinyint(1) NOT NULL DEFAULT '1',
  `show_messages` tinyint(1) NOT NULL DEFAULT '1',
  `show_users` tinyint(1) NOT NULL DEFAULT '1',
  `show_files` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_groups`
--

LOCK TABLES `directus_groups` WRITE;
/*!40000 ALTER TABLE `directus_groups` DISABLE KEYS */;
INSERT INTO `directus_groups` VALUES (1,'Administrator',NULL,'0',NULL,1,1,1,1);
/*!40000 ALTER TABLE `directus_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_messages`
--

DROP TABLE IF EXISTS `directus_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(11) unsigned DEFAULT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `attachment` int(11) unsigned DEFAULT NULL,
  `response_to` int(11) unsigned DEFAULT NULL,
  `comment_metadata` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_messages`
--

LOCK TABLES `directus_messages` WRITE;
/*!40000 ALTER TABLE `directus_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_messages_recipients`
--

DROP TABLE IF EXISTS `directus_messages_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_messages_recipients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(11) unsigned NOT NULL,
  `recipient` int(11) unsigned NOT NULL,
  `read` tinyint(1) NOT NULL,
  `group` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_messages_recipients`
--

LOCK TABLES `directus_messages_recipients` WRITE;
/*!40000 ALTER TABLE `directus_messages_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `directus_messages_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_preferences`
--

DROP TABLE IF EXISTS `directus_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_preferences` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned DEFAULT NULL,
  `table_name` varchar(64) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `columns_visible` varchar(300) DEFAULT NULL,
  `sort` varchar(64) DEFAULT 'id',
  `sort_order` varchar(5) DEFAULT 'ASC',
  `status` varchar(5) DEFAULT '3',
  `search_string` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`,`table_name`,`title`),
  UNIQUE KEY `pref_title_constraint` (`user`,`table_name`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_preferences`
--

LOCK TABLES `directus_preferences` WRITE;
/*!40000 ALTER TABLE `directus_preferences` DISABLE KEYS */;
INSERT INTO `directus_preferences` VALUES (1,1,'directus_bookmarks',NULL,'user,title,url,icon_class','id','ASC','1,2',NULL),(2,1,'directus_columns',NULL,'table_name,column_name,data_type,ui,relationship_type','sort','ASC','1,2',NULL),(3,1,'directus_files',NULL,'name,title,location,caption','date_uploaded','DESC','1,2',NULL),(4,1,'directus_groups',NULL,'name,description,restrict_to_ip_whitelist,nav_override,show_activity','id','ASC','1,2',NULL),(5,1,'directus_messages',NULL,'from,subject,message,datetime,attachment','id','ASC','1,2',NULL),(6,1,'directus_messages_recipients',NULL,'message_id,recipient,read,group','id','ASC','1,2',NULL),(7,1,'directus_preferences',NULL,'user,table_name,title,columns_visible','sort','ASC','1,2',NULL),(8,1,'directus_privileges',NULL,'table_name,allow_view,allow_add,allow_edit,allow_delete','id','ASC','1,2',NULL),(9,1,'directus_schema_migrations',NULL,'version','id','ASC','1,2',NULL),(10,1,'directus_settings',NULL,'collection,name,value','id','ASC','1,2',NULL),(11,1,'directus_tables',NULL,'hidden,single,default_status,footer,list_view','table_name','ASC','1,2',NULL),(12,1,'directus_ui',NULL,'table_name,column_name,ui_name,name,value','id','ASC','1,2',NULL),(13,1,'directus_users',NULL,'first_name,last_name,email,password','id','ASC','1,2',NULL),(14,1,'event_authors',NULL,'member_id,event_id','id','ASC','1,2',NULL),(15,1,'event_participants',NULL,'member_id,event_id','id','ASC','1,2',NULL),(16,1,'events',NULL,'title,slug,created_on,max_participants,event_start_time,event_end_time','id','ASC','1,2',NULL),(17,1,'members',NULL,'username,first_name,last_name,email','id','ASC','1,2',NULL),(18,1,'news',NULL,'title,text,slug,created_on','id','ASC','1,2',NULL),(19,1,'news_authors',NULL,'news_id,member_id','id','ASC','1,2',NULL),(22,1,'landing_page',NULL,'main_title,introduction_text,jumbotron_images','id','ASC','1,2',NULL),(23,1,'sponsors',NULL,'name,logo,website','id','ASC','1,2',NULL),(24,1,'landing_page_images',NULL,'image_id,landing_page_id','id','ASC','1,2',NULL),(25,1,'footer',NULL,'contact_info','id','ASC','1,2',NULL),(26,1,'social_media_button',NULL,'logo,link,footer_id','id','ASC','1,2',NULL),(27,1,'footer_links',NULL,'title,link,footer_id','id','ASC','1,2',NULL),(32,1,'guild_board',NULL,'year,title','id','ASC','1,2',NULL),(33,1,'board_members',NULL,'guild_board_id,title,first_name,last_name','id','ASC','1,2',NULL),(36,1,'subpages',NULL,'title,priority,category_id','id','ASC','1,2',NULL),(37,1,'categories',NULL,'title,slug','id','ASC','1,2',NULL),(38,1,'board_officials',NULL,'board_member_id,guild_board_id','id','ASC','1,2',NULL),(39,1,'board_actual_members',NULL,'board_member_id,guild_board_id','id','ASC','1,2',NULL),(41,1,'news_categories',NULL,'title,slug','id','ASC','1,2',NULL);
/*!40000 ALTER TABLE `directus_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_privileges`
--

DROP TABLE IF EXISTS `directus_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_privileges` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `allow_view` tinyint(1) NOT NULL DEFAULT '0',
  `allow_add` tinyint(1) NOT NULL DEFAULT '0',
  `allow_edit` tinyint(1) NOT NULL DEFAULT '0',
  `allow_delete` tinyint(1) NOT NULL DEFAULT '0',
  `allow_alter` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` int(11) unsigned NOT NULL,
  `read_field_blacklist` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `write_field_blacklist` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `nav_listed` tinyint(1) NOT NULL DEFAULT '1',
  `status_id` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_privileges`
--

LOCK TABLES `directus_privileges` WRITE;
/*!40000 ALTER TABLE `directus_privileges` DISABLE KEYS */;
INSERT INTO `directus_privileges` VALUES (1,'directus_activity',2,1,2,2,1,1,NULL,NULL,1,0),(2,'directus_columns',2,1,2,2,1,1,NULL,NULL,1,0),(3,'directus_groups',2,1,2,2,1,1,NULL,NULL,1,0),(4,'directus_files',2,1,2,2,1,1,NULL,NULL,1,0),(5,'directus_messages',2,1,2,2,1,1,NULL,NULL,1,0),(6,'directus_preferences',2,1,2,2,1,1,NULL,NULL,1,0),(7,'directus_privileges',2,1,2,2,1,1,NULL,NULL,1,0),(8,'directus_settings',2,1,2,2,1,1,NULL,NULL,1,0),(9,'directus_tables',2,1,2,2,1,1,NULL,NULL,1,0),(10,'directus_ui',2,1,2,2,1,1,NULL,NULL,1,0),(11,'directus_users',2,1,2,2,1,1,NULL,NULL,1,0),(12,'directus_messages_recipients',2,1,2,2,1,1,NULL,NULL,1,0),(13,'directus_bookmarks',2,1,2,2,1,1,NULL,NULL,1,0),(14,'events',2,1,2,2,1,1,NULL,NULL,1,0),(15,'event_participants',2,1,2,2,1,1,NULL,NULL,1,0),(16,'event_authors',2,1,2,2,1,1,NULL,NULL,1,0),(18,'news',2,1,2,2,1,1,NULL,NULL,1,0),(19,'news_authors',2,1,2,2,1,1,NULL,NULL,1,0),(20,'members',2,1,2,2,1,1,NULL,NULL,1,0),(22,'landing_page',2,1,2,2,1,1,NULL,NULL,1,0),(23,'sponsors',2,1,2,2,1,1,NULL,NULL,1,0),(24,'landing_page_images',2,1,2,2,1,1,NULL,NULL,1,0),(25,'footer',2,1,2,2,1,1,NULL,NULL,1,0),(26,'social_media_button',2,1,2,2,1,1,NULL,NULL,1,0),(27,'footer_links',2,1,2,2,1,1,NULL,NULL,1,0),(32,'guild_board',2,1,2,2,1,1,NULL,NULL,1,0),(33,'board_members',2,1,2,2,1,1,NULL,NULL,1,0),(36,'subpages',2,1,2,2,1,1,NULL,NULL,1,0),(37,'categories',2,1,2,2,1,1,NULL,NULL,1,0),(38,'board_officials',2,1,2,2,1,1,NULL,NULL,1,0),(39,'board_actual_members',2,1,2,2,1,1,NULL,NULL,1,0),(41,'news_categories',2,1,2,2,1,1,NULL,NULL,1,0);
/*!40000 ALTER TABLE `directus_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_schema_migrations`
--

DROP TABLE IF EXISTS `directus_schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_schema_migrations` (
  `version` varchar(255) DEFAULT NULL,
  UNIQUE KEY `idx_directus_schema_migrations_version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_schema_migrations`
--

LOCK TABLES `directus_schema_migrations` WRITE;
/*!40000 ALTER TABLE `directus_schema_migrations` DISABLE KEYS */;
INSERT INTO `directus_schema_migrations` VALUES ('20150203221946'),('20150203235646'),('20150204002341'),('20150204003426'),('20150204015251'),('20150204021255'),('20150204022237'),('20150204023325'),('20150204024327'),('20150204031412'),('20150204041007'),('20150204042025'),('20150204042725');
/*!40000 ALTER TABLE `directus_schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_settings`
--

DROP TABLE IF EXISTS `directus_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `collection` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique Collection and Name` (`collection`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_settings`
--

LOCK TABLES `directus_settings` WRITE;
/*!40000 ALTER TABLE `directus_settings` DISABLE KEYS */;
INSERT INTO `directus_settings` VALUES (1,'global','cms_user_auto_sign_out','60'),(2,'global','project_name','directus'),(3,'global','project_url','http://localhost/'),(4,'global','rows_per_page','200'),(5,'files','thumbnail_quality','100'),(6,'files','thumbnail_size','200'),(7,'global','cms_thumbnail_url',''),(8,'files','file_naming','file_id'),(9,'files','thumbnail_crop_enabled','1'),(10,'files','youtube_api_key','');
/*!40000 ALTER TABLE `directus_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_tables`
--

DROP TABLE IF EXISTS `directus_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_tables` (
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `single` tinyint(1) NOT NULL DEFAULT '0',
  `default_status` tinyint(1) NOT NULL DEFAULT '1',
  `footer` tinyint(1) DEFAULT '0',
  `list_view` varchar(200) DEFAULT NULL,
  `column_groupings` varchar(255) DEFAULT NULL,
  `primary_column` varchar(255) DEFAULT NULL,
  `user_create_column` varchar(64) DEFAULT NULL,
  `user_update_column` varchar(64) DEFAULT NULL,
  `date_create_column` varchar(64) DEFAULT NULL,
  `date_update_column` varchar(64) DEFAULT NULL,
  `filter_column_blacklist` text,
  PRIMARY KEY (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_tables`
--

LOCK TABLES `directus_tables` WRITE;
/*!40000 ALTER TABLE `directus_tables` DISABLE KEYS */;
INSERT INTO `directus_tables` VALUES ('board_actual_members',1,0,1,0,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),('board_members',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('board_officials',1,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('categories',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('directus_bookmarks',1,0,1,0,NULL,NULL,NULL,'user',NULL,NULL,NULL,NULL),('directus_files',1,0,1,0,NULL,NULL,NULL,'user',NULL,NULL,NULL,NULL),('directus_messages_recipients',1,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('directus_preferences',1,0,1,0,NULL,NULL,NULL,'user',NULL,NULL,NULL,NULL),('directus_users',1,0,1,0,NULL,NULL,NULL,'id',NULL,NULL,NULL,NULL),('events',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('event_authors',1,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('event_participants',1,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('footer',0,1,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('footer_links',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('guild_board',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('landing_page',0,1,1,0,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),('landing_page_images',1,0,1,0,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),('members',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('news',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('news_authors',1,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('news_categories',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('social_media_button',0,0,1,0,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),('sponsors',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('subpages',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `directus_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_ui`
--

DROP TABLE IF EXISTS `directus_ui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_ui` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(64) DEFAULT NULL,
  `column_name` varchar(64) DEFAULT NULL,
  `ui_name` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`table_name`,`column_name`,`ui_name`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_ui`
--

LOCK TABLES `directus_ui` WRITE;
/*!40000 ALTER TABLE `directus_ui` DISABLE KEYS */;
INSERT INTO `directus_ui` VALUES (1,'directus_users','avatar_file_id','single_file','allowed_filetypes','image/*'),(2,'events','authors','many_to_many','id','many_to_many'),(3,'events','authors','many_to_many','visible_columns','username'),(4,'events','authors','many_to_many','add_button','0'),(5,'events','authors','many_to_many','choose_button','1'),(6,'events','authors','many_to_many','remove_button','1'),(7,'events','authors','many_to_many','filter_type','dropdown'),(8,'events','authors','many_to_many','filter_column',''),(9,'events','authors','many_to_many','visible_column_template',''),(10,'events','authors','many_to_many','min_entries','0'),(11,'events','authors','many_to_many','no_duplicates','0'),(12,'events','participants','many_to_many','id','many_to_many'),(13,'events','participants','many_to_many','visible_columns','username'),(14,'events','participants','many_to_many','add_button','1'),(15,'events','participants','many_to_many','choose_button','1'),(16,'events','participants','many_to_many','remove_button','1'),(17,'events','participants','many_to_many','filter_type','dropdown'),(18,'events','participants','many_to_many','filter_column',''),(19,'events','participants','many_to_many','visible_column_template',''),(20,'events','participants','many_to_many','min_entries','0'),(21,'events','participants','many_to_many','no_duplicates','1'),(22,'news','authors','many_to_many','id','many_to_many'),(23,'news','authors','many_to_many','visible_columns','username'),(24,'news','authors','many_to_many','add_button','0'),(25,'news','authors','many_to_many','choose_button','1'),(26,'news','authors','many_to_many','remove_button','1'),(27,'news','authors','many_to_many','filter_type','dropdown'),(28,'news','authors','many_to_many','filter_column',''),(29,'news','authors','many_to_many','visible_column_template',''),(30,'news','authors','many_to_many','min_entries','0'),(31,'news','authors','many_to_many','no_duplicates','0'),(36,'news','text','markdown','id','markdown'),(37,'news','text','markdown','rows','14'),(38,'news','text','markdown','github_flavored_markdown','0'),(39,'news','text','markdown','tables','0'),(40,'news','text','markdown','breaks','0'),(41,'news','text','markdown','sanitize','0'),(42,'events','text','markdown','id','markdown'),(43,'events','text','markdown','rows','14'),(44,'events','text','markdown','github_flavored_markdown','0'),(45,'events','text','markdown','tables','0'),(46,'events','text','markdown','breaks','0'),(47,'events','text','markdown','sanitize','0'),(48,'news','slug','slug','id','slug'),(49,'news','slug','slug','rows','14'),(50,'news','slug','slug','github_flavored_markdown','0'),(51,'news','slug','slug','tables','0'),(52,'news','slug','slug','breaks','0'),(53,'news','slug','slug','sanitize','0'),(54,'news','slug','slug','readonly','1'),(55,'news','slug','slug','size','large'),(56,'news','slug','slug','mirrored_field','title'),(57,'events','slug','slug','id','slug'),(58,'events','slug','slug','readonly','1'),(59,'events','slug','slug','size','large'),(60,'events','slug','slug','mirrored_field','title'),(71,'members','role','select','id','select'),(72,'members','role','select','options','{\r\n    \"none\": \"None\",\r\n    \"member\": \"Member\",\r\n    \"board\": \"Board\"\r\n}'),(73,'members','role','select','allow_null','0'),(74,'members','role','select','placeholder_text',''),(75,'Partners','logo','single_file','id','single_file'),(76,'Partners','logo','single_file','allowed_filetypes','jpeg,gif,png,svg'),(77,'Partners','website','textinput','id','textinput'),(78,'Partners','website','textinput','readonly','0'),(79,'Partners','website','textinput','size','large'),(80,'Partners','website','textinput','placeholder_text','Website URL'),(81,'Partners','website','textinput','validation_type','rgx'),(82,'Partners','website','textinput','validation_string','(https?:\\/\\/(?:www\\.|(?!www))[^\\s\\.]+\\.[^\\s]{2,}|www\\.[^\\s]+\\.[^\\s]{2,})'),(83,'Partners','website','textinput','validation_message','Insert valid url starting with http or https'),(84,'sponsors','website','textinput','id','textinput'),(85,'sponsors','website','textinput','readonly','0'),(86,'sponsors','website','textinput','size','large'),(87,'sponsors','website','textinput','placeholder_text','Website URL'),(88,'sponsors','website','textinput','validation_type','rgx'),(89,'sponsors','website','textinput','validation_string','(https?:\\/\\/(?:www\\.|(?!www))[^\\s\\.]+\\.[^\\s]{2,}|www\\.[^\\s]+\\.[^\\s]{2,})'),(90,'sponsors','website','textinput','validation_message','Enter valid website url!'),(91,'sponsors','logo','single_file','id','single_file'),(92,'sponsors','logo','single_file','allowed_filetypes',''),(93,'landing_page','introduction_text','markdown','id','markdown'),(94,'landing_page','introduction_text','markdown','rows','12'),(95,'landing_page','introduction_text','markdown','github_flavored_markdown','0'),(96,'landing_page','introduction_text','markdown','tables','0'),(97,'landing_page','introduction_text','markdown','breaks','0'),(98,'landing_page','introduction_text','markdown','sanitize','0'),(99,'social_media_button','link','textinput','id','textinput'),(100,'social_media_button','link','textinput','readonly','0'),(101,'social_media_button','link','textinput','size','large'),(102,'social_media_button','link','textinput','placeholder_text','URL'),(103,'social_media_button','link','textinput','validation_type','rgx'),(104,'social_media_button','link','textinput','validation_string','(https?:\\/\\/(?:www\\.|(?!www))[^\\s\\.]+\\.[^\\s]{2,}|www\\.[^\\s]+\\.[^\\s]{2,})'),(105,'social_media_button','link','textinput','validation_message','Enter valid URL!'),(106,'social_media_button','footer_id','numeric','id','numeric'),(107,'social_media_button','footer_id','numeric','readonly','0'),(108,'social_media_button','footer_id','numeric','size','large'),(109,'social_media_button','footer_id','numeric','placeholder_text','Footer ID'),(110,'social_media_button','footer_id','numeric','validation_type','rgx'),(111,'social_media_button','footer_id','numeric','validation_string','(https?:\\/\\/(?:www\\.|(?!www))[^\\s\\.]+\\.[^\\s]{2,}|www\\.[^\\s]+\\.[^\\s]{2,})'),(112,'social_media_button','footer_id','numeric','validation_message','Enter valid URL!'),(113,'social_media_button','footer_id','numeric','allow_null','0'),(114,'social_media_button','footer_id','numeric','footer','0'),(115,'social_media_button','name','textinput','id','textinput'),(116,'social_media_button','name','textinput','readonly','0'),(117,'social_media_button','name','textinput','size','large'),(118,'social_media_button','name','textinput','placeholder_text','Name of the service (eg. \"Facebook\", \"Twitter\"...)'),(119,'social_media_button','name','textinput','validation_type','bl'),(120,'social_media_button','name','textinput','validation_string',''),(121,'social_media_button','name','textinput','validation_message',''),(122,'footer_links','link','textinput','id','textinput'),(123,'footer_links','link','textinput','readonly','0'),(124,'footer_links','link','textinput','size','large'),(125,'footer_links','link','textinput','placeholder_text','URL'),(126,'footer_links','link','textinput','validation_type','rgx'),(127,'footer_links','link','textinput','validation_string','(https?:\\/\\/(?:www\\.|(?!www))[^\\s\\.]+\\.[^\\s]{2,}|www\\.[^\\s]+\\.[^\\s]{2,})'),(128,'footer_links','link','textinput','validation_message','Enter valid URL!'),(129,'footer_links','title','textinput','id','textinput'),(130,'footer_links','title','textinput','readonly','0'),(131,'footer_links','title','textinput','size','large'),(132,'footer_links','title','textinput','placeholder_text','Text displayed on the footer'),(133,'footer_links','title','textinput','validation_type','bl'),(134,'footer_links','title','textinput','validation_string',''),(135,'footer_links','title','textinput','validation_message',''),(136,'footer_links','footer_id','numeric','id','numeric'),(137,'footer_links','footer_id','numeric','size','large'),(138,'footer_links','footer_id','numeric','placeholder_text','Footer ID'),(139,'footer_links','footer_id','numeric','allow_null','0'),(140,'footer_links','footer_id','numeric','footer','0'),(141,'guild_subpages','slug','slug','id','slug'),(142,'guild_subpages','slug','slug','readonly','1'),(143,'guild_subpages','slug','slug','size','large'),(144,'guild_subpages','slug','slug','mirrored_field','title'),(205,'guild_board','year','numeric','id','numeric'),(206,'guild_board','year','numeric','size','large'),(207,'guild_board','year','numeric','placeholder_text','Year'),(208,'guild_board','year','numeric','allow_null','0'),(209,'guild_board','year','numeric','footer','0'),(210,'guild_board','slug','slug','id','slug'),(211,'guild_board','slug','slug','readonly','1'),(212,'guild_board','slug','slug','size','large'),(213,'guild_board','slug','slug','mirrored_field','year'),(214,'subpages','slug','slug','id','slug'),(215,'subpages','slug','slug','readonly','1'),(216,'subpages','slug','slug','size','large'),(217,'subpages','slug','slug','mirrored_field','title'),(236,'categories','slug','slug','id','slug'),(237,'categories','slug','slug','readonly','1'),(238,'categories','slug','slug','size','large'),(239,'categories','slug','slug','mirrored_field','title'),(247,'subpages','priority','numeric','id','numeric'),(248,'subpages','priority','numeric','readonly','1'),(249,'subpages','priority','numeric','size','large'),(250,'subpages','priority','numeric','mirrored_field','title'),(251,'subpages','priority','numeric','placeholder_text','Priority for ordering the subpages'),(252,'subpages','priority','numeric','allow_null','0'),(253,'subpages','priority','numeric','footer','0'),(254,'categories','subpages','one_to_many','id','one_to_many'),(255,'categories','subpages','one_to_many','visible_columns','title'),(256,'categories','subpages','one_to_many','result_limit','100'),(257,'categories','subpages','one_to_many','add_button','1'),(258,'categories','subpages','one_to_many','choose_button','1'),(259,'categories','subpages','one_to_many','remove_button','1'),(260,'categories','subpages','one_to_many','only_unassigned','0'),(261,'subpages','category_id','many_to_one','id','many_to_one'),(262,'subpages','category_id','many_to_one','readonly','0'),(263,'subpages','category_id','many_to_one','visible_column','title'),(264,'subpages','category_id','many_to_one','visible_column_template','{{ title }}'),(265,'subpages','category_id','many_to_one','visible_status_ids','1'),(266,'subpages','category_id','many_to_one','placeholder_text',''),(267,'subpages','category_id','many_to_one','allow_null','0'),(268,'subpages','category_id','many_to_one','filter_type','dropdown'),(269,'subpages','category_id','many_to_one','filter_column',''),(270,'categories','title','textinput','id','textinput'),(271,'categories','title','textinput','readonly','0'),(272,'categories','title','textinput','size','large'),(273,'categories','title','textinput','placeholder_text',''),(274,'categories','title','textinput','validation_type','bl'),(275,'categories','title','textinput','validation_string',''),(276,'categories','title','textinput','validation_message',''),(301,'footer_links','footer_id','many_to_one','id','many_to_one'),(302,'footer_links','footer_id','many_to_one','size','large'),(303,'footer_links','footer_id','many_to_one','placeholder_text','Footer ID'),(304,'footer_links','footer_id','many_to_one','allow_null','0'),(305,'footer_links','footer_id','many_to_one','footer','0'),(306,'footer_links','footer_id','many_to_one','readonly','0'),(307,'footer_links','footer_id','many_to_one','visible_column','title'),(308,'footer_links','footer_id','many_to_one','visible_column_template','{{ title }}'),(309,'footer_links','footer_id','many_to_one','visible_status_ids','1'),(310,'footer_links','footer_id','many_to_one','filter_type','dropdown'),(311,'footer_links','footer_id','many_to_one','filter_column',''),(312,'footer_links','footer_id','numeric','readonly','0'),(313,'footer_links','footer_id','numeric','visible_column','title'),(314,'footer_links','footer_id','numeric','visible_column_template','{{ title }}'),(315,'footer_links','footer_id','numeric','visible_status_ids','1'),(316,'footer_links','footer_id','numeric','filter_type','dropdown'),(317,'footer_links','footer_id','numeric','filter_column',''),(333,'news','tags','tags','id','tags'),(334,'news','tags','tags','force_lowercase','1'),(335,'news','news_category','many_to_one','id','many_to_one'),(336,'news','news_category','many_to_one','readonly','0'),(337,'news','news_category','many_to_one','visible_column','title'),(338,'news','news_category','many_to_one','visible_column_template','{{ title }}'),(339,'news','news_category','many_to_one','visible_status_ids','1'),(340,'news','news_category','many_to_one','placeholder_text','Choose category for news'),(341,'news','news_category','many_to_one','allow_null','0'),(342,'news','news_category','many_to_one','filter_type','dropdown'),(343,'news','news_category','many_to_one','filter_column',''),(344,'news_categories','slug','slug','id','slug'),(345,'news_categories','slug','slug','readonly','1'),(346,'news_categories','slug','slug','size','large'),(347,'news_categories','slug','slug','mirrored_field','title'),(348,'news_categories','news','one_to_many','id','one_to_many'),(349,'news_categories','news','one_to_many','readonly','1'),(350,'news_categories','news','one_to_many','size','large'),(351,'news_categories','news','one_to_many','mirrored_field','title'),(352,'news_categories','news','one_to_many','visible_columns','title,created_on'),(353,'news_categories','news','one_to_many','result_limit','100'),(354,'news_categories','news','one_to_many','add_button','1'),(355,'news_categories','news','one_to_many','choose_button','1'),(356,'news_categories','news','one_to_many','remove_button','1'),(357,'news_categories','news','one_to_many','only_unassigned','0'),(358,'Theme','name','textinput','id','textinput'),(359,'Theme','name','textinput','readonly','0'),(360,'Theme','name','textinput','size','large'),(361,'Theme','name','textinput','placeholder_text','Name of the theme'),(362,'Theme','name','textinput','validation_type','bl'),(363,'Theme','name','textinput','validation_string',''),(364,'Theme','name','textinput','validation_message',''),(376,'guild_board','board_members_title','textinput','id','textinput'),(377,'guild_board','board_members_title','textinput','readonly','0'),(378,'guild_board','board_members_title','textinput','size','large'),(379,'guild_board','board_members_title','textinput','mirrored_field','year'),(380,'guild_board','board_members_title','textinput','placeholder_text',''),(381,'guild_board','board_members_title','textinput','validation_type','rgx'),(382,'guild_board','board_members_title','textinput','validation_string',''),(383,'guild_board','board_members_title','textinput','validation_message',''),(384,'guild_board','board_officials_title','textinput','id','textinput'),(385,'guild_board','board_officials_title','textinput','readonly','0'),(386,'guild_board','board_officials_title','textinput','size','large'),(387,'guild_board','board_officials_title','textinput','mirrored_field','year'),(388,'guild_board','board_officials_title','textinput','placeholder_text',''),(389,'guild_board','board_officials_title','textinput','validation_type','rgx'),(390,'guild_board','board_officials_title','textinput','validation_string',''),(391,'guild_board','board_officials_title','textinput','validation_message',''),(392,'guild_board','board_members','many_to_many','id','many_to_many'),(393,'guild_board','board_members','many_to_many','readonly','1'),(394,'guild_board','board_members','many_to_many','size','large'),(395,'guild_board','board_members','many_to_many','mirrored_field','year'),(396,'guild_board','board_members','many_to_many','visible_column','first_name,last_name,title'),(397,'guild_board','board_members','many_to_many','visible_column_template','{{ first_name }} {{ last_name}} - {{ title }}'),(398,'guild_board','board_members','many_to_many','visible_status_ids','2'),(399,'guild_board','board_members','many_to_many','placeholder_text',''),(400,'guild_board','board_members','many_to_many','allow_null','0'),(401,'guild_board','board_members','many_to_many','filter_type','dropdown'),(402,'guild_board','board_members','many_to_many','filter_column',''),(403,'guild_board','board_members','many_to_many','visible_columns','first_name,last_name,title'),(404,'guild_board','board_members','many_to_many','add_button','1'),(405,'guild_board','board_members','many_to_many','choose_button','1'),(406,'guild_board','board_members','many_to_many','remove_button','1'),(407,'guild_board','board_members','many_to_many','min_entries','0'),(408,'guild_board','board_members','many_to_many','no_duplicates','0'),(409,'guild_board','board_officials','many_to_many','id','many_to_many'),(410,'guild_board','board_officials','many_to_many','readonly','1'),(411,'guild_board','board_officials','many_to_many','size','large'),(412,'guild_board','board_officials','many_to_many','mirrored_field','year'),(413,'guild_board','board_officials','many_to_many','visible_column','first_name,last_name,title'),(414,'guild_board','board_officials','many_to_many','visible_column_template','{{ first_name }} {{ last_name}} - {{ title }}'),(415,'guild_board','board_officials','many_to_many','visible_status_ids','2'),(416,'guild_board','board_officials','many_to_many','placeholder_text',''),(417,'guild_board','board_officials','many_to_many','allow_null','0'),(418,'guild_board','board_officials','many_to_many','filter_type','dropdown'),(419,'guild_board','board_officials','many_to_many','filter_column',''),(420,'guild_board','board_officials','many_to_many','visible_columns','first_name,last_name,title'),(421,'guild_board','board_officials','many_to_many','add_button','1'),(422,'guild_board','board_officials','many_to_many','choose_button','1'),(423,'guild_board','board_officials','many_to_many','remove_button','1'),(424,'guild_board','board_officials','many_to_many','min_entries','0'),(425,'guild_board','board_officials','many_to_many','no_duplicates','0'),(426,'guild_board','chairman','many_to_one_typeahead','id','many_to_one_typeahead'),(427,'guild_board','chairman','many_to_one_typeahead','readonly','0'),(428,'guild_board','chairman','many_to_one_typeahead','size','large'),(429,'guild_board','chairman','many_to_one_typeahead','mirrored_field','year'),(430,'guild_board','chairman','many_to_one_typeahead','placeholder_text',''),(431,'guild_board','chairman','many_to_one_typeahead','validation_type','rgx'),(432,'guild_board','chairman','many_to_one_typeahead','validation_string',''),(433,'guild_board','chairman','many_to_one_typeahead','validation_message',''),(434,'guild_board','chairman','many_to_one_typeahead','visible_column','first_name,last_name,title'),(435,'guild_board','chairman','many_to_one_typeahead','template','{{ first_name }} {{ last_name }} - {{ title }}'),(436,'guild_board','chairman','many_to_one_typeahead','visible_status_ids','2'),(437,'footer','social_media_buttons','one_to_many','id','one_to_many'),(438,'footer','social_media_buttons','one_to_many','visible_columns','link'),(439,'footer','social_media_buttons','one_to_many','result_limit','100'),(440,'footer','social_media_buttons','one_to_many','add_button','1'),(441,'footer','social_media_buttons','one_to_many','choose_button','1'),(442,'footer','social_media_buttons','one_to_many','remove_button','1'),(443,'footer','social_media_buttons','one_to_many','only_unassigned','0'),(444,'footer','other_links','one_to_many','id','one_to_many'),(445,'footer','other_links','one_to_many','visible_columns','link'),(446,'footer','other_links','one_to_many','result_limit','100'),(447,'footer','other_links','one_to_many','add_button','1'),(448,'footer','other_links','one_to_many','choose_button','1'),(449,'footer','other_links','one_to_many','remove_button','1'),(450,'footer','other_links','one_to_many','only_unassigned','0'),(451,'members','password','password','id','password'),(452,'members','password','password','options','{\r\n    \"none\": \"None\",\r\n    \"member\": \"Member\",\r\n    \"board\": \"Board\"\r\n}'),(453,'members','password','password','allow_null','0'),(454,'members','password','password','placeholder_text',''),(455,'members','password','password','require_confirmation','1'),(456,'members','password','password','salt_field','salt');
/*!40000 ALTER TABLE `directus_ui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directus_users`
--

DROP TABLE IF EXISTS `directus_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directus_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT '1',
  `first_name` varchar(50) DEFAULT '',
  `last_name` varchar(50) DEFAULT '',
  `email` varchar(255) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `salt` varchar(255) DEFAULT '',
  `token` varchar(255) NOT NULL,
  `access_token` varchar(255) DEFAULT '',
  `reset_token` varchar(255) DEFAULT '',
  `reset_expiration` datetime DEFAULT NULL,
  `position` varchar(500) DEFAULT '',
  `email_messages` tinyint(1) DEFAULT '1',
  `last_login` datetime DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  `last_page` varchar(255) DEFAULT '',
  `ip` varchar(50) DEFAULT '',
  `group` int(11) unsigned DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `avatar_file_id` int(11) unsigned DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `language` varchar(8) DEFAULT 'en',
  `timezone` varchar(32) DEFAULT 'America/New_York',
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_users_token_unique` (`token`),
  UNIQUE KEY `directus_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_users`
--

LOCK TABLES `directus_users` WRITE;
/*!40000 ALTER TABLE `directus_users` DISABLE KEYS */;
INSERT INTO `directus_users` VALUES (1,1,'Admin','User','admin@admin.com','$2y$12$bw.Fd.KiX.Xn4Z/dDXRAE.qHAJJPWnRYqM4rbnZ4coP0Ly0FDvqEK','ggFBQNXfmYWFev0P','pcabg4mmEZYe8DzFHWeIhBAuvICLYTtU','06638fa07ab7724c3d257a1d04e4a93579d6495d','',NULL,'',1,'2017-05-04 21:42:52','2017-05-05 01:40:00','{\"path\":\"tables/events\",\"route\":\"entries\"}','',1,'//www.gravatar.com/avatar/64e1b8d34f425d19e1ee2ea7236d3028?s=200&d=identicon&r=g',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en','America/New_York');
/*!40000 ALTER TABLE `directus_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_authors`
--

DROP TABLE IF EXISTS `event_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `member_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_authors`
--

LOCK TABLES `event_authors` WRITE;
/*!40000 ALTER TABLE `event_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_participants`
--

DROP TABLE IF EXISTS `event_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `member_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_participants`
--

LOCK TABLES `event_participants` WRITE;
/*!40000 ALTER TABLE `event_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `title` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `max_participants` int(11) DEFAULT NULL,
  `event_start_time` datetime DEFAULT NULL,
  `event_end_time` datetime DEFAULT NULL,
  `registration_start_time` datetime DEFAULT NULL,
  `registration_end_date` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footer`
--

DROP TABLE IF EXISTS `footer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `contact_info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footer`
--

LOCK TABLES `footer` WRITE;
/*!40000 ALTER TABLE `footer` DISABLE KEYS */;
/*!40000 ALTER TABLE `footer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footer_links`
--

DROP TABLE IF EXISTS `footer_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footer_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `title` varchar(100) DEFAULT NULL,
  `link` varchar(512) DEFAULT NULL,
  `footer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footer_links`
--

LOCK TABLES `footer_links` WRITE;
/*!40000 ALTER TABLE `footer_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `footer_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_board`
--

DROP TABLE IF EXISTS `guild_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `text` text,
  `title` varchar(255) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `board_members_title` varchar(255) DEFAULT NULL,
  `board_officials_title` varchar(255) DEFAULT NULL,
  `chairman` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_board`
--

LOCK TABLES `guild_board` WRITE;
/*!40000 ALTER TABLE `guild_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landing_page`
--

DROP TABLE IF EXISTS `landing_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landing_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `main_title` varchar(255) DEFAULT NULL,
  `introduction_text` text,
  `guild_logo` int(11) DEFAULT NULL,
  `guild_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landing_page`
--

LOCK TABLES `landing_page` WRITE;
/*!40000 ALTER TABLE `landing_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `landing_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landing_page_images`
--

DROP TABLE IF EXISTS `landing_page_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landing_page_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `image_id` int(11) DEFAULT NULL,
  `landing_page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landing_page_images`
--

LOCK TABLES `landing_page_images` WRITE;
/*!40000 ALTER TABLE `landing_page_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `landing_page_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `username` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `slug` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `tags` text,
  `news_category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_authors`
--

DROP TABLE IF EXISTS `news_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `news_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_authors`
--

LOCK TABLES `news_authors` WRITE;
/*!40000 ALTER TABLE `news_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_categories`
--

DROP TABLE IF EXISTS `news_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_categories`
--

LOCK TABLES `news_categories` WRITE;
/*!40000 ALTER TABLE `news_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media_button`
--

DROP TABLE IF EXISTS `social_media_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_media_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `logo` int(11) DEFAULT NULL,
  `link` varchar(512) DEFAULT NULL,
  `footer_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media_button`
--

LOCK TABLES `social_media_button` WRITE;
/*!40000 ALTER TABLE `social_media_button` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_media_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `name` varchar(255) DEFAULT NULL,
  `logo` int(11) DEFAULT NULL,
  `website` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsors`
--

LOCK TABLES `sponsors` WRITE;
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subpages`
--

DROP TABLE IF EXISTS `subpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '2',
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `text` text,
  `priority` tinyint(4) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subpages`
--

LOCK TABLES `subpages` WRITE;
/*!40000 ALTER TABLE `subpages` DISABLE KEYS */;
/*!40000 ALTER TABLE `subpages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-05  0:01:08
