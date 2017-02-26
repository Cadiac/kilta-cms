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
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_columns`
--

LOCK TABLES `directus_columns` WRITE;
/*!40000 ALTER TABLE `directus_columns` DISABLE KEYS */;
INSERT INTO `directus_columns` VALUES (1,'directus_users','group',NULL,'many_to_one','MANYTOONE','directus_groups',NULL,NULL,'group_id',0,0,0,NULL,''),(2,'directus_users','avatar_file_id','INT','single_file','MANYTOONE','directus_files',NULL,NULL,'avatar_file_id',0,0,0,NULL,''),(3,'events','participants','ALIAS','many_to_many','MANYTOMANY','members','event_participants','event_id','member_id',0,0,0,13,''),(4,'events','authors','ALIAS','many_to_many','MANYTOMANY','members','event_authors','event_id','member_id',0,0,1,5,''),(5,'events','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,0,''),(6,'events','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,1,''),(7,'events','title',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,2,''),(8,'events','slug',NULL,'slug',NULL,NULL,NULL,NULL,NULL,0,0,1,3,''),(9,'events','created_on',NULL,'datetime',NULL,NULL,NULL,NULL,NULL,0,0,1,4,''),(10,'events','location',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,6,''),(11,'events','text',NULL,'textarea',NULL,NULL,NULL,NULL,NULL,0,0,1,7,''),(12,'events','max_participants',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,8,''),(13,'events','event_start_time',NULL,'datetime',NULL,NULL,NULL,NULL,NULL,0,0,1,9,''),(14,'events','event_end_time',NULL,'datetime',NULL,NULL,NULL,NULL,NULL,0,0,0,10,''),(15,'events','registration_start_time',NULL,'datetime',NULL,NULL,NULL,NULL,NULL,0,0,1,11,''),(16,'events','registration_end_date',NULL,'datetime',NULL,NULL,NULL,NULL,NULL,0,0,0,12,''),(17,'news','authors','ALIAS','many_to_many','MANYTOMANY','members','news_authors','news_id','member_id',0,0,1,9999,''),(18,'news','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(19,'news','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(20,'news','title',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,1,3,''),(21,'news','text',NULL,'markdown',NULL,NULL,NULL,NULL,NULL,0,0,0,4,''),(22,'news','slug',NULL,'slug',NULL,NULL,NULL,NULL,NULL,0,0,1,5,''),(23,'news','created_on',NULL,'datetime',NULL,NULL,NULL,NULL,NULL,0,0,1,6,''),(24,'news','category',NULL,'select',NULL,NULL,NULL,NULL,NULL,0,0,1,7,''),(25,'members','id',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,1,1,''),(26,'members','active',NULL,'numeric',NULL,NULL,NULL,NULL,NULL,0,0,0,2,''),(27,'members','username',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,3,''),(28,'members','first_name',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,4,''),(29,'members','last_name',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,5,''),(30,'members','email',NULL,'textinput',NULL,NULL,NULL,NULL,NULL,0,0,0,6,''),(31,'members','salt',NULL,'salt',NULL,NULL,NULL,NULL,NULL,0,0,0,7,''),(33,'members','password',NULL,'password',NULL,NULL,NULL,NULL,NULL,0,0,0,9,''),(34,'members','role','VARCHAR','select',NULL,NULL,NULL,NULL,NULL,0,0,0,9999,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_preferences`
--

LOCK TABLES `directus_preferences` WRITE;
/*!40000 ALTER TABLE `directus_preferences` DISABLE KEYS */;
INSERT INTO `directus_preferences` VALUES (1,1,'directus_bookmarks',NULL,'user,title,url,icon_class','id','ASC','1,2',NULL),(2,1,'directus_columns',NULL,'table_name,column_name,data_type,ui,relationship_type','sort','ASC','1,2',NULL),(3,1,'directus_files',NULL,'name,title,location,caption','date_uploaded','DESC','1,2',NULL),(4,1,'directus_groups',NULL,'name,description,restrict_to_ip_whitelist,nav_override,show_activity','id','ASC','1,2',NULL),(5,1,'directus_messages',NULL,'from,subject,message,datetime,attachment','id','ASC','1,2',NULL),(6,1,'directus_messages_recipients',NULL,'message_id,recipient,read,group','id','ASC','1,2',NULL),(7,1,'directus_preferences',NULL,'user,table_name,title,columns_visible','sort','ASC','1,2',NULL),(8,1,'directus_privileges',NULL,'table_name,allow_view,allow_add,allow_edit,allow_delete','id','ASC','1,2',NULL),(9,1,'directus_schema_migrations',NULL,'version','id','ASC','1,2',NULL),(10,1,'directus_settings',NULL,'collection,name,value','id','ASC','1,2',NULL),(11,1,'directus_tables',NULL,'hidden,single,default_status,footer,list_view','table_name','ASC','1,2',NULL),(12,1,'directus_ui',NULL,'table_name,column_name,ui_name,name,value','id','ASC','1,2',NULL),(13,1,'directus_users',NULL,'first_name,last_name,email,password','id','ASC','1,2',NULL),(14,1,'event_authors',NULL,'member_id,event_id','id','ASC','1,2',NULL),(15,1,'event_participants',NULL,'member_id,event_id','id','ASC','1,2',NULL),(16,1,'events',NULL,'title,slug,created_on,max_participants','id','ASC','1,2',NULL),(17,1,'members',NULL,'username,first_name,last_name,email','id','ASC','1,2',NULL),(18,1,'news',NULL,'title,text,slug,created_on','id','ASC','1,2',NULL),(19,1,'news_authors',NULL,'news_id,member_id','id','ASC','1,2',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_privileges`
--

LOCK TABLES `directus_privileges` WRITE;
/*!40000 ALTER TABLE `directus_privileges` DISABLE KEYS */;
INSERT INTO `directus_privileges` VALUES (1,'directus_activity',2,1,2,2,1,1,NULL,NULL,1,0),(2,'directus_columns',2,1,2,2,1,1,NULL,NULL,1,0),(3,'directus_groups',2,1,2,2,1,1,NULL,NULL,1,0),(4,'directus_files',2,1,2,2,1,1,NULL,NULL,1,0),(5,'directus_messages',2,1,2,2,1,1,NULL,NULL,1,0),(6,'directus_preferences',2,1,2,2,1,1,NULL,NULL,1,0),(7,'directus_privileges',2,1,2,2,1,1,NULL,NULL,1,0),(8,'directus_settings',2,1,2,2,1,1,NULL,NULL,1,0),(9,'directus_tables',2,1,2,2,1,1,NULL,NULL,1,0),(10,'directus_ui',2,1,2,2,1,1,NULL,NULL,1,0),(11,'directus_users',2,1,2,2,1,1,NULL,NULL,1,0),(12,'directus_messages_recipients',2,1,2,2,1,1,NULL,NULL,1,0),(13,'directus_bookmarks',2,1,2,2,1,1,NULL,NULL,1,0),(14,'events',2,1,2,2,1,1,NULL,NULL,1,0),(15,'event_participants',2,1,2,2,1,1,NULL,NULL,1,0),(16,'event_authors',2,1,2,2,1,1,NULL,NULL,1,0),(18,'news',2,1,2,2,1,1,NULL,NULL,1,0),(19,'news_authors',2,1,2,2,1,1,NULL,NULL,1,0),(20,'members',2,1,2,2,1,1,NULL,NULL,1,0);
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
INSERT INTO `directus_tables` VALUES ('directus_bookmarks',1,0,1,0,NULL,NULL,NULL,'user',NULL,NULL,NULL,NULL),('directus_files',1,0,1,0,NULL,NULL,NULL,'user',NULL,NULL,NULL,NULL),('directus_messages_recipients',1,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('directus_preferences',1,0,1,0,NULL,NULL,NULL,'user',NULL,NULL,NULL,NULL),('directus_users',1,0,1,0,NULL,NULL,NULL,'id',NULL,NULL,NULL,NULL),('events',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('event_authors',1,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('event_participants',1,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('members',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('news',0,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL),('news_authors',1,0,1,0,NULL,NULL,'id',NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directus_ui`
--

LOCK TABLES `directus_ui` WRITE;
/*!40000 ALTER TABLE `directus_ui` DISABLE KEYS */;
INSERT INTO `directus_ui` VALUES (1,'directus_users','avatar_file_id','single_file','allowed_filetypes','image/*'),(2,'events','authors','many_to_many','id','many_to_many'),(3,'events','authors','many_to_many','visible_columns','username'),(4,'events','authors','many_to_many','add_button','0'),(5,'events','authors','many_to_many','choose_button','1'),(6,'events','authors','many_to_many','remove_button','1'),(7,'events','authors','many_to_many','filter_type','dropdown'),(8,'events','authors','many_to_many','filter_column',''),(9,'events','authors','many_to_many','visible_column_template',''),(10,'events','authors','many_to_many','min_entries','0'),(11,'events','authors','many_to_many','no_duplicates','0'),(12,'events','participants','many_to_many','id','many_to_many'),(13,'events','participants','many_to_many','visible_columns','username'),(14,'events','participants','many_to_many','add_button','1'),(15,'events','participants','many_to_many','choose_button','1'),(16,'events','participants','many_to_many','remove_button','1'),(17,'events','participants','many_to_many','filter_type','dropdown'),(18,'events','participants','many_to_many','filter_column',''),(19,'events','participants','many_to_many','visible_column_template',''),(20,'events','participants','many_to_many','min_entries','0'),(21,'events','participants','many_to_many','no_duplicates','0'),(22,'news','authors','many_to_many','id','many_to_many'),(23,'news','authors','many_to_many','visible_columns','username'),(24,'news','authors','many_to_many','add_button','0'),(25,'news','authors','many_to_many','choose_button','1'),(26,'news','authors','many_to_many','remove_button','1'),(27,'news','authors','many_to_many','filter_type','dropdown'),(28,'news','authors','many_to_many','filter_column',''),(29,'news','authors','many_to_many','visible_column_template',''),(30,'news','authors','many_to_many','min_entries','0'),(31,'news','authors','many_to_many','no_duplicates','0'),(32,'news','category','select','id','select'),(33,'news','category','select','options','{\r\n    \"news\": \"News\",\r\n    \"recruitment\": \"Recruitment\",\r\n    \"meeting_notes\": \"Meeting Notes\"\r\n}'),(34,'news','category','select','allow_null','0'),(35,'news','category','select','placeholder_text',''),(36,'news','text','markdown','id','markdown'),(37,'news','text','markdown','rows','14'),(38,'news','text','markdown','github_flavored_markdown','0'),(39,'news','text','markdown','tables','0'),(40,'news','text','markdown','breaks','0'),(41,'news','text','markdown','sanitize','0'),(42,'events','text','markdown','id','markdown'),(43,'events','text','markdown','rows','14'),(44,'events','text','markdown','github_flavored_markdown','0'),(45,'events','text','markdown','tables','0'),(46,'events','text','markdown','breaks','0'),(47,'events','text','markdown','sanitize','0'),(48,'news','slug','slug','id','slug'),(49,'news','slug','slug','rows','14'),(50,'news','slug','slug','github_flavored_markdown','0'),(51,'news','slug','slug','tables','0'),(52,'news','slug','slug','breaks','0'),(53,'news','slug','slug','sanitize','0'),(54,'news','slug','slug','readonly','1'),(55,'news','slug','slug','size','large'),(56,'news','slug','slug','mirrored_field','title'),(57,'events','slug','slug','id','slug'),(58,'events','slug','slug','readonly','1'),(59,'events','slug','slug','size','large'),(60,'events','slug','slug','mirrored_field','title'),(61,'members','password','password','id','password'),(62,'members','password','password','require_confirmation','1'),(63,'members','password','password','salt_field','salt'),(68,'members','password','password','options','{\r\n    \"none\": \"None\",\r\n    \"member\": \"Member\",\r\n    \"board\": \"Board member\",\r\n    \"admin\": \"Admin\r\n}\r\n'),(69,'members','password','password','allow_null','0'),(70,'members','password','password','placeholder_text',''),(71,'members','role','select','id','select'),(72,'members','role','select','options','{\r\n    \"none\": \"None\",\r\n    \"member\": \"Member\",\r\n    \"board\": \"Board\"\r\n}'),(73,'members','role','select','allow_null','0'),(74,'members','role','select','placeholder_text','');
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
INSERT INTO `directus_users` VALUES (1,1,'Admin','User','admin@admin.com','$2y$12$bw.Fd.KiX.Xn4Z/dDXRAE.qHAJJPWnRYqM4rbnZ4coP0Ly0FDvqEK','ggFBQNXfmYWFev0P','pcabg4mmEZYe8DzFHWeIhBAuvICLYTtU','5b8a0022dbc543bcad820b85dbd927f334a616b5','',NULL,'',1,'2017-02-26 00:18:29','2017-02-26 02:49:00','{\"path\":\"settings\",\"route\":\"settings\"}','',1,'//www.gravatar.com/avatar/64e1b8d34f425d19e1ee2ea7236d3028?s=200&d=identicon&r=g',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en','America/New_York');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
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
  `salt` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_authors`
--

LOCK TABLES `news_authors` WRITE;
/*!40000 ALTER TABLE `news_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_authors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-26 18:09:25
