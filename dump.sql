-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: new_redmine_production
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.10

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
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) NOT NULL DEFAULT '0',
  `container_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `disk_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `digest` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`),
  KEY `index_attachments_on_author_id` (`author_id`),
  KEY `index_attachments_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `host` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `base_dn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr_login` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr_firstname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr_lastname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr_mail` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_auth_sources_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT '1',
  `topics_count` int(11) NOT NULL DEFAULT '0',
  `messages_count` int(11) NOT NULL DEFAULT '0',
  `last_message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_project_id` (`project_id`),
  KEY `index_boards_on_last_message_id` (`last_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `from_path` text COLLATE utf8_unicode_ci,
  `from_revision` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `revision` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changesets_changeset_id` (`changeset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets`
--

DROP TABLE IF EXISTS `changesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `committer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  KEY `index_changesets_on_user_id` (`user_id`),
  KEY `index_changesets_on_repository_id` (`repository_id`),
  KEY `index_changesets_on_committed_on` (`committed_on`),
  KEY `changesets_repos_scmid` (`repository_id`,`scmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets`
--

LOCK TABLES `changesets` WRITE;
/*!40000 ALTER TABLE `changesets` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets_issues`
--

DROP TABLE IF EXISTS `changesets_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets_issues`
--

LOCK TABLES `changesets_issues` WRITE;
/*!40000 ALTER TABLE `changesets_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commented_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8_unicode_ci,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  KEY `index_comments_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field_format` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `possible_values` text COLLATE utf8_unicode_ci,
  `regexp` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `min_length` int(11) NOT NULL DEFAULT '0',
  `max_length` int(11) NOT NULL DEFAULT '0',
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text COLLATE utf8_unicode_ci,
  `editable` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (1,'IssueCustomField','Story-Size','list','--- \n- \"0\"\n- \"0.5\"\n- \"1\"\n- \"2\"\n- \"3\"\n- \"5\"\n- \"8\"\n- \"13\"\n- \"20\"\n- \"40\"\n- \"60\"\n- \"100\"\n- \"200\"\n','',0,0,0,0,0,1,0,'0',1,1),(2,'IssueCustomField','To-Do (hrs)','float','--- []\n\n','',0,0,0,0,0,2,0,'0',1,1);
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_projects`
--

DROP TABLE IF EXISTS `custom_fields_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_projects`
--

LOCK TABLES `custom_fields_projects` WRITE;
/*!40000 ALTER TABLE `custom_fields_projects` DISABLE KEYS */;
INSERT INTO `custom_fields_projects` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `custom_fields_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_trackers`
--

DROP TABLE IF EXISTS `custom_fields_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_trackers`
--

LOCK TABLES `custom_fields_trackers` WRITE;
/*!40000 ALTER TABLE `custom_fields_trackers` DISABLE KEYS */;
INSERT INTO `custom_fields_trackers` VALUES (1,1),(1,3),(1,5),(2,2);
/*!40000 ALTER TABLE `custom_fields_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_values`
--

DROP TABLE IF EXISTS `custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customized_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT '0',
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `custom_values_customized` (`customized_type`,`customized_id`),
  KEY `index_custom_values_on_custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_values`
--

LOCK TABLES `custom_values` WRITE;
/*!40000 ALTER TABLE `custom_values` DISABLE KEYS */;
INSERT INTO `custom_values` VALUES (1,'Issue',40,1,'2'),(2,'Issue',38,1,'0.5'),(3,'Issue',42,1,'2'),(4,'Issue',48,2,'0'),(5,'Issue',47,2,NULL),(6,'Issue',43,1,NULL),(7,'Issue',20,1,NULL);
/*!40000 ALTER TABLE `custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_project_id` (`project_id`),
  KEY `index_documents_on_category_id` (`category_id`),
  KEY `index_documents_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enabled_modules`
--

DROP TABLE IF EXISTS `enabled_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enabled_modules`
--

LOCK TABLES `enabled_modules` WRITE;
/*!40000 ALTER TABLE `enabled_modules` DISABLE KEYS */;
INSERT INTO `enabled_modules` VALUES (1,1,'issue_tracking'),(2,1,'time_tracking'),(3,1,'news'),(4,1,'documents'),(5,1,'files'),(6,1,'wiki'),(7,1,'repository'),(8,1,'boards'),(9,1,'calendar'),(10,1,'gantt'),(11,1,'scrummer');
/*!40000 ALTER TABLE `enabled_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumerations`
--

DROP TABLE IF EXISTS `enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enumerations_on_project_id` (`project_id`),
  KEY `index_enumerations_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumerations`
--

LOCK TABLES `enumerations` WRITE;
/*!40000 ALTER TABLE `enumerations` DISABLE KEYS */;
INSERT INTO `enumerations` VALUES (1,'Normal',1,1,'IssuePriority',1,NULL,NULL),(2,'High',2,0,'IssuePriority',1,NULL,NULL),(3,'Low',3,0,'IssuePriority',1,NULL,NULL);
/*!40000 ALTER TABLE `enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_categories`
--

DROP TABLE IF EXISTS `issue_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_categories_project_id` (`project_id`),
  KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_categories`
--

LOCK TABLES `issue_categories` WRITE;
/*!40000 ALTER TABLE `issue_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_relations`
--

DROP TABLE IF EXISTS `issue_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_relations`
--

LOCK TABLES `issue_relations` WRITE;
/*!40000 ALTER TABLE `issue_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_statuses`
--

DROP TABLE IF EXISTS `issue_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `default_done_ratio` int(11) DEFAULT NULL,
  `is_scrum` tinyint(1) DEFAULT '0',
  `short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_issue_statuses_on_position` (`position`),
  KEY `index_issue_statuses_on_is_closed` (`is_closed`),
  KEY `index_issue_statuses_on_is_default` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_statuses`
--

LOCK TABLES `issue_statuses` WRITE;
/*!40000 ALTER TABLE `issue_statuses` DISABLE KEYS */;
INSERT INTO `issue_statuses` VALUES (1,'Scrum-Defined',0,1,1,NULL,1,'D'),(2,'Scrum-In-Progress',0,0,2,NULL,1,'P'),(3,'Scrum-Completed',0,0,3,NULL,1,'C'),(4,'Scrum-Accepted',1,0,4,NULL,1,'A');
/*!40000 ALTER TABLE `issue_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT '0',
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL DEFAULT '0',
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `issues_project_id` (`project_id`),
  KEY `index_issues_on_status_id` (`status_id`),
  KEY `index_issues_on_category_id` (`category_id`),
  KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  KEY `index_issues_on_tracker_id` (`tracker_id`),
  KEY `index_issues_on_priority_id` (`priority_id`),
  KEY `index_issues_on_author_id` (`author_id`),
  KEY `index_issues_on_created_on` (`created_on`),
  KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (14,3,1,'User Stories','',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:12:35','2011-06-13 02:12:35','2011-06-13',0,NULL,NULL,14,1,14,0),(15,3,1,'Sprint Planning','',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:12:50','2011-06-13 02:12:50','2011-06-13',0,NULL,NULL,15,1,6,0),(16,3,1,'Release Planning','',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:12:58','2011-06-13 02:12:58','2011-06-13',0,NULL,NULL,16,1,8,0),(17,1,1,'move issues between projects','- As a Project member I need to be able change the project of an issue from the issue form.',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:13:42','2011-06-13 02:13:42','2011-06-13',0,NULL,16,16,2,3,0),(18,1,1,'Burn Down Charts','- As a Project member I need to be able to see the progress of a Scrum Sprint, as a burn down chart',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:14:51','2011-06-13 02:14:51','2011-06-13',0,NULL,15,15,2,3,0),(19,1,1,'Burn Down Charts','- As a Project member I need to be able to see the progress of a Scrum Release, as a burn down chart',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:15:22','2011-06-13 02:15:22','2011-06-13',0,NULL,16,16,4,5,0),(20,3,1,'Admin','',NULL,NULL,1,NULL,1,NULL,1,3,'2011-06-13 02:16:17','2011-06-21 01:47:57','2011-06-13',0,26,NULL,20,1,16,0),(21,1,1,'Inherit sub-project settings from Project','As an Admin I need sub project access settings to inherit from parent project so that I won\'t set the same settings again for each scrum sub-project (Release)\r\n\r\n*Verification points*\r\n* Verify that, Team members, Roles, Issue categories, Repository and modules settings are copied\r\n* Verify that \"Scrummer\" is selected by default in all modules\r\n* Verify that PO is selected as a \"Non-admin\" member to create projects',NULL,NULL,1,NULL,1,NULL,1,1,'2011-06-13 02:16:57','2011-06-14 03:01:30','2011-06-13',0,NULL,20,20,2,3,0),(22,1,1,'Scrum Initialization','- As an Admin I want see the Scrum Roles/Issues Types, once I installed the plugin, and the workflow being adjusted\n	* Should see the following Roles:\n		- Scrum-Master\n		- Scrum Product Owner\n		- Scrum Project member\n	* Should see the following Issue Types:\n		- Scrum Theme\n		- Scrum Epic\n		- Scrum Feature\n		- Scrum Story\n		- Scrum Task\n	* Should see the following \"Issues Statuses\":\n		_ Scrum Defined\n		- Scrum In-Progress\n		- Scrum Completed\n		- Scrum Accepted\n	* Should see the workflow populated initially with Scrum Roles being able to Change the Status of any Scrum Issue.\n	',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:17:52','2011-06-13 02:17:52','2011-06-13',0,NULL,20,20,4,5,0),(23,1,1,'Scrum Tabs in Project menu','- As a Project member I need to have a views for Scrum management \"User Stories, Sprint Planning, Release Planning\" to scrum-manage my projects\n	* The link \"Scrum\" should be shown in the \"Project\" tab\n	',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:19:16','2011-06-13 02:19:16','2011-06-13',0,NULL,20,20,6,7,0),(24,1,1,'Scrum Tabs in Project menu','- As a Project member I need to have a views for Scrum management \"User Stories, Sprint Planning, Release Planning\" to scrum-manage my projects\n	* The link \"Scrum\" should be shown in the \"Project\" tab\n	',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:20:39','2011-06-13 02:20:39','2011-06-13',0,NULL,20,20,8,9,0),(25,1,1,'List stories','<pre>\r\n- As a Project member I need to see \"scrum issues\" in the UserStories View	\r\n	* Each Row should show \"Id, Tracker Name, Name, Release, Sprint, Status, Planned Est (PTs), Task Est(hrs), Actual Time(hrs), Completion Percent, Assignee\"  \r\n	* \"Scrum\" word should be eliminated from Tracker Name\r\n	* Each Issue should allow the user the expand/collapse children	\r\n	* Give the user one option of two:\r\n		1 - Show them in hierarchy with the naming as (\"US: Sample name\", \"Feature: Smth\", \"Epic: ...\")\r\n		2 - Show them planaer (in this case the subject of each story, should contain the Short hand of all it\'s parents\' names)\r\n\r\n</pre>',NULL,NULL,1,NULL,1,NULL,1,1,'2011-06-13 02:21:48','2011-06-13 11:50:52','2011-06-13',0,NULL,14,14,2,3,0),(26,1,1,'DE-Can\'t add child to last entry in stories table','',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:22:38','2011-06-13 02:22:38','2011-06-13',0,NULL,NULL,26,1,2,0),(27,1,1,'DE-Some sort columns in stories index will direct to strange page','',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:23:20','2011-06-13 02:23:20','2011-06-13',0,NULL,NULL,27,1,2,0),(28,1,1,'Show Backlog','- As a Project member I need to be able to filter the view of UserStories\n	* A Button called \"Backlog\" will filter the view so that the issues satisfying the following conditions applies:\n		* Accepted issues shouldn\'t be shown\n		* Issues of type \"Scrum - Task\" shouldn\'t be shown\n		* Only leafs is shown (the lowest level in the hierarchy)\n		* Leafs Names should include the names of the parents separated by \'-\'\n		* Sort Issues by Order\n		* Ability To Change Sort order of items by drag and drop\n',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:24:09','2011-06-13 02:24:09','2011-06-13',0,NULL,14,14,4,5,0),(29,1,1,'Planning','- As Project member I need to be able to plan for the iteration\n	* Separate the view in two sides\n	* Show backlog issues at left side (Backlog conditions for \"Backlog\" filter in the UserStories view)\n	* Show The individual sprints at right side, stacked vertically\n	* In The Sprint Panel, only show the leaf \"Scrum-Issues\" in-addition to their related \"Scrum-Tasks\"\n	* Show The newest Sprint at top\n	* Ability to expand/collapse Sprints\n	* The Newest Sprint being expanded\n	* Move Issues between Sprints/Backlog by right click on the row\n	* Select the a release from combo box at tob, to show only the issues included in that release\n	* Select the current release by default in that combo box\n	* Use Ajax to refresh all the viewed lists, when user choose to move a story.\n	* Use Ajax to Apply any modification on a row\n	* Ability To Change Sort order of items by drag and drop\n',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:24:35','2011-06-13 02:24:35','2011-06-13',0,NULL,15,15,4,5,0),(30,1,1,'Planning','- As a Project member I need to be able to plan for the release\n	* Separate the view in two sides\n	* Show backlog issues at left side (Backlog conditions for \"Backlog\" filter in the UserStories view)\n	* Show The individual releases\n	* In The Sprint Panel, only show the leaf \"Scrum-Issues\" in-addition to their related \"Scrum-Tasks\"\n	* Show The newest Release at top\n	* Ability to expand/collapse Releases\n	* The Newest Release being expanded\n	* Move Issues between Releases/Backlog by right click on the row\n	* Use Ajax to refresh all the viewed lists, when user choose to move a story.\n	* Use Ajax to Apply any modification on a row\n	* Ability To Change Sort order of items by drag and drop\n',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:25:07','2011-06-13 02:25:07','2011-06-13',0,NULL,16,16,6,7,0),(31,1,1,'add in-line story','- As a Project member I need to be able to add issues in-line\n	* Put input row, at top of each of the following lists, to add new issue inline\n		* UserStories view\n		* IterationPlannign View (left panel)\n		* ReleasePlanning View (left panel)\n	* The New Issue Box should show the following fields:\n		* Tracker (Default to: \"Scrum UserStory\")\n		* Estimation in points\n		* Parent Story (Prefered to be a magnifier icon, that opens a popup to search for a parent story)		\n',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:25:41','2011-06-13 02:25:41','2011-06-13',0,NULL,14,14,6,7,0),(32,1,1,'add in-line child','- As a Project member I need to be able to add child issues in-line\n	* Put a \"+\" icon at the end of each issue row in all views those showing issues, that will show inline issue adding row, right below the current row.\n	* Use all the fields mentioned in (in-line issues) except for the Parent Field',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 02:26:05','2011-06-13 02:26:05','2011-06-13',0,NULL,14,14,8,9,0),(33,1,1,'DE-User Stories menu actions, take you back to issues','',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 11:26:01','2011-06-13 11:26:01','2011-06-13',0,NULL,NULL,33,1,2,0),(34,1,1,'DE-if status \"short-name\" is empty, show the full name','',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 11:42:30','2011-06-13 11:42:30','2011-06-13',0,NULL,NULL,34,1,2,0),(35,1,1,'DE-Change the label \"Name\" in in-line add form to \"Subject\"','',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 11:49:08','2011-06-13 11:49:08','2011-06-13',0,NULL,NULL,35,1,2,0),(36,1,1,'DE-Remove \"Scrum-Feature\" from default trackers','',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 12:43:12','2011-06-13 12:43:12','2011-06-13',0,NULL,NULL,36,1,2,0),(37,1,1,'DE-Remove \"Scrum-Feature\" from default trackers','',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-13 12:52:34','2011-06-13 12:52:34','2011-06-13',0,NULL,NULL,37,1,2,0),(38,1,1,'Add Story-Size as Custom Field','As an admin I want to see story size as custom field',NULL,NULL,1,NULL,1,1,1,5,'2011-06-14 00:17:33','2011-06-21 01:47:57','2011-06-16',0,26,20,20,10,15,0),(39,3,1,'Tasks','',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-14 00:19:51','2011-06-14 00:19:51','2011-06-14',0,NULL,NULL,39,1,4,0),(40,1,1,'Efforts Tracking','As a developer, I want to record the remaining effort of my tasks, so that it will be a basis for iteration burn down charts\r\n\r\n*Satisfaction Conditions:*\r\n* Verify that user can record and update task\'s \"Remaining hours\"\r\n* Verify that RH\'s accumelate top-wise (aggregated at higher levels)\r\n* Verify that task RH\'s can be updated in the \"User Stories\" view\r\n* Verify that in-line add task, includes Estimated hours',NULL,NULL,1,NULL,1,1,1,3,'2011-06-14 00:24:17','2011-06-16 21:35:05','2011-06-14',0,NULL,39,39,2,3,0),(42,1,1,'List stories (1)','As a user, I want to be able to filter, update issues in the User Stories view:\r\n\r\n*Verification points:*\r\n\r\n* Verify that filters are customized to view backlog and sprint issues by simple choice control\r\n* Verify that on hover on story subject, description of subject is shown in a pop-up\r\n* Verify that \"Collapse/Expand\" all buttons are available to that view\r\n* Verify that user can edit subject, description, size of any issue\r\n* Verify that RH\'s field isn\'t available for Stories for type not \"Task\"',NULL,NULL,1,NULL,1,1,1,2,'2011-06-14 00:37:26','2011-06-16 21:36:27','2011-06-14',0,NULL,14,14,12,13,0),(43,1,1,'Show Hide Individual Tabs','As a user, I want to show/hide \"Issues\" & \"User Stories\" views',NULL,NULL,1,NULL,1,NULL,1,1,'2011-06-14 03:02:46','2011-06-21 01:47:42','2011-06-14',0,100,NULL,43,1,2,0),(44,1,1,'Short Names configurations','As admin, I want to configure short names for Trackers and Statuses',NULL,NULL,1,NULL,1,NULL,1,1,'2011-06-14 03:04:09','2011-06-21 01:16:57','2011-06-14',0,90,NULL,44,1,2,0),(45,1,1,'DE-Add \"0\" to \"User Story\" Sizes list','',NULL,NULL,1,NULL,1,NULL,1,1,'2011-06-14 03:04:37','2011-06-21 01:15:47','2011-06-14',0,78,NULL,45,1,2,0),(46,1,1,'DE-\"User Stories\" tab, highlight is not working','',NULL,NULL,1,NULL,1,NULL,1,0,'2011-06-14 03:05:26','2011-06-14 03:05:26','2011-06-14',0,NULL,NULL,46,1,2,0),(47,2,1,'Add story size custom field','',NULL,NULL,1,NULL,1,1,1,1,'2011-06-16 21:30:59','2011-06-16 21:40:15','2011-06-16',0,1,38,20,11,12,0),(48,2,1,'Remove Story-Size column','',NULL,NULL,1,NULL,1,1,1,2,'2011-06-16 21:39:01','2011-06-21 01:47:57','2011-06-16',0,25,38,20,13,14,0);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_details`
--

DROP TABLE IF EXISTS `journal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `prop_key` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `old_value` text COLLATE utf8_unicode_ci,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `journal_details_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_details`
--

LOCK TABLES `journal_details` WRITE;
/*!40000 ALTER TABLE `journal_details` DISABLE KEYS */;
INSERT INTO `journal_details` VALUES (1,1,'attr','description','- As a Project member I need to see \"scrum issues\" in the UserStories View	\n	* Each Row should show \"Id, Tracker Name, Name, Release, Sprint, Status, Planned Est (PTs), Task Est(hrs), Actual Time(hrs), Completion Percent, Assignee\"  \n	* \"Scrum\" word should be eliminated from Tracker Name\n	* Each Issue should allow the user the expand/collapse children	\n	* Give the user one option of two:\n		1 - Show them in hierarchy with the naming as (\"US: Sample name\", \"Feature: Smth\", \"Epic: ...\")\n		2 - Show them planaer (in this case the subject of each story, should contain the Short hand of all it\'s parents\' names)\n','<pre>\r\n- As a Project member I need to see \"scrum issues\" in the UserStories View	\r\n	* Each Row should show \"Id, Tracker Name, Name, Release, Sprint, Status, Planned Est (PTs), Task Est(hrs), Actual Time(hrs), Completion Percent, Assignee\"  \r\n	* \"Scrum\" word should be eliminated from Tracker Name\r\n	* Each Issue should allow the user the expand/collapse children	\r\n	* Give the user one option of two:\r\n		1 - Show them in hierarchy with the naming as (\"US: Sample name\", \"Feature: Smth\", \"Epic: ...\")\r\n		2 - Show them planaer (in this case the subject of each story, should contain the Short hand of all it\'s parents\' names)\r\n\r\n</pre>'),(2,2,'attr','fixed_version_id',NULL,'1'),(3,3,'attr','description','','As a developer, I want to record the remaining effort of my tasks, so that it will be a basis for iteration burn down charts\r\n\r\n*Satisfaction Conditions:*\r\n* Verify that user can record and update task\'s \"Remaining hours\"\r\n* Verify that RH\'s accumelate top-wise (aggregated at higher levels)\r\n* Verify that task RH\'s can be updated in the \"User Stories\" view\r\n* Verify that in-line add task, includes Estimated hours'),(4,4,'attr','fixed_version_id',NULL,'1'),(5,5,'attr','fixed_version_id',NULL,'1'),(6,6,'attr','description','As an Admin I need sub project access settings to inherit from parent project so that I won\'t set the same settings again for each scrum sub-project (Release)','As an Admin I need sub project access settings to inherit from parent project so that I won\'t set the same settings again for each scrum sub-project (Release)\r\n\r\n*Verification points*\r\n* Verify that, Team members, Roles, Issue categories, Repository and modules settings are copied\r\n* Verify that \"Scrummer\" is selected by default in all modules\r\n* Verify that PO is selected as a \"Non-admin\" member to create projects'),(7,7,'cf','1',NULL,'2'),(8,8,'cf','1',NULL,'0.5'),(9,9,'attr','description','As a user, I want to be able to filter, update issues in the User Stories view:\n\n*Verification points:*\n\n* Verify that filters are customized to view backlog and sprint issues by simple choice control\n* Verify that on hover on story subject, description of subject is shown in a pop-up\n* Verify that \"Collapse/Expand\" all buttons are available to that view\n* Verify that user can edit subject, description, size of any issue\n* Verify that RH\'s field isn\'t available for Stories for type not \"Task\"','As a user, I want to be able to filter, update issues in the User Stories view:\r\n\r\n*Verification points:*\r\n\r\n* Verify that filters are customized to view backlog and sprint issues by simple choice control\r\n* Verify that on hover on story subject, description of subject is shown in a pop-up\r\n* Verify that \"Collapse/Expand\" all buttons are available to that view\r\n* Verify that user can edit subject, description, size of any issue\r\n* Verify that RH\'s field isn\'t available for Stories for type not \"Task\"'),(10,9,'cf','1',NULL,'2'),(11,10,'attr','fixed_version_id',NULL,'1'),(12,11,'attr','fixed_version_id',NULL,'1');
/*!40000 ALTER TABLE `journal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journalized_id` int(11) NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  KEY `index_journals_on_user_id` (`user_id`),
  KEY `index_journals_on_journalized_id` (`journalized_id`),
  KEY `index_journals_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,25,'Issue',1,'','2011-06-13 11:50:52'),(2,38,'Issue',1,NULL,'2011-06-14 00:18:23'),(3,40,'Issue',1,'','2011-06-14 00:25:55'),(4,42,'Issue',1,NULL,'2011-06-14 02:46:19'),(5,40,'Issue',1,NULL,'2011-06-14 02:46:49'),(6,21,'Issue',1,'','2011-06-14 03:01:30'),(7,40,'Issue',1,'','2011-06-16 21:35:06'),(8,38,'Issue',1,'','2011-06-16 21:35:34'),(9,42,'Issue',1,'','2011-06-16 21:36:27'),(10,48,'Issue',1,NULL,'2011-06-16 21:39:18'),(11,47,'Issue',1,NULL,'2011-06-16 21:40:16');
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_roles`
--

DROP TABLE IF EXISTS `member_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inherited_from` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_member_roles_on_member_id` (`member_id`),
  KEY `index_member_roles_on_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_roles`
--

LOCK TABLES `member_roles` WRITE;
/*!40000 ALTER TABLE `member_roles` DISABLE KEYS */;
INSERT INTO `member_roles` VALUES (1,1,3,NULL),(2,1,4,NULL),(3,1,5,NULL);
/*!40000 ALTER TABLE `member_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_members_on_user_id` (`user_id`),
  KEY `index_members_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,1,1,'2011-06-05 00:50:51',0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT '0',
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messages_board_id` (`board_id`),
  KEY `messages_parent_id` (`parent_id`),
  KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  KEY `index_messages_on_author_id` (`author_id`),
  KEY `index_messages_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_project_id` (`project_id`),
  KEY `index_news_on_author_id` (`author_id`),
  KEY `index_news_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_associations`
--

DROP TABLE IF EXISTS `open_id_authentication_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assoc_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_associations`
--

LOCK TABLES `open_id_authentication_associations` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_nonces`
--

DROP TABLE IF EXISTS `open_id_authentication_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_nonces`
--

LOCK TABLES `open_id_authentication_nonces` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `homepage` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lft` (`lft`),
  KEY `index_projects_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Redmine Scrummer','','',1,NULL,'2011-06-04 23:48:56','2011-06-04 23:48:56','redmine-scrummer',1,1,2);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_trackers`
--

DROP TABLE IF EXISTS `projects_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  KEY `projects_trackers_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_trackers`
--

LOCK TABLES `projects_trackers` WRITE;
/*!40000 ALTER TABLE `projects_trackers` DISABLE KEYS */;
INSERT INTO `projects_trackers` VALUES (1,1),(1,2),(1,3),(1,4),(1,5);
/*!40000 ALTER TABLE `projects_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filters` text COLLATE utf8_unicode_ci,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `column_names` text COLLATE utf8_unicode_ci,
  `sort_criteria` text COLLATE utf8_unicode_ci,
  `group_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_queries_on_project_id` (`project_id`),
  KEY `index_queries_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,NULL,'User-Stories','--- \nstatus_id: \n  :values: \n  - \"1\"\n  :operator: o\n',1,1,'--- \n- :subject\n- :fixed_version\n- :assigned_to\n- :cf_1\n- :estimated_hours\n- :spent_hours\n- :cf_2\n','--- []\n\n','');
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositories`
--

DROP TABLE IF EXISTS `repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `login` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `root_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path_encoding` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_encoding` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra_info` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_repositories_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositories`
--

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int(11) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8_unicode_ci,
  `issues_visibility` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `is_scrum` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Non member',1,1,1,NULL,'default',0),(2,'Anonymous',2,1,2,NULL,'default',0),(3,'Scrum-ProjectMember',3,1,0,'--- \n- :add_issue_notes\n- :add_issue_watchers\n- :add_messages\n- :browse_repository\n- :comment_news\n- :commit_access\n- :delete_own_messages\n- :edit_issue_notes\n- :edit_messages\n- :edit_own_issue_notes\n- :edit_own_messages\n- :edit_own_time_entries\n- :edit_project\n- :edit_time_entries\n- :edit_wiki_pages\n- :export_wiki_pages\n- :log_time\n- :protect_wiki_pages\n- :rename_wiki_pages\n- :save_queries\n- :search_project\n- :select_project_modules\n- :set_own_issues_private\n- :view_calendar\n- :view_changesets\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issue_watchers\n- :view_issues\n- :view_messages\n- :view_news\n- :view_project\n- :view_time_entries\n- :view_wiki_edits\n- :view_wiki_pages\n- :scrum_user_stories\n- :scrum_user_stories_add_inline\n- :scrum_user_stories_manipulate_inline\n- :scrum_sprint_planing\n- :scrum_release_planing\n- :scrum_charts\n','default',1),(4,'Scrum-ScrumMaster',4,1,0,'--- \n- :add_issue_notes\n- :add_issue_watchers\n- :add_issues\n- :add_messages\n- :add_project\n- :add_subprojects\n- :browse_repository\n- :comment_news\n- :commit_access\n- :delete_issue_watchers\n- :delete_issues\n- :delete_messages\n- :delete_own_messages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :edit_issue_notes\n- :edit_issues\n- :edit_messages\n- :edit_own_issue_notes\n- :edit_own_messages\n- :edit_own_time_entries\n- :edit_project\n- :edit_time_entries\n- :edit_wiki_pages\n- :export_wiki_pages\n- :log_time\n- :manage_boards\n- :manage_categories\n- :manage_documents\n- :manage_files\n- :manage_issue_relations\n- :manage_members\n- :manage_news\n- :manage_project_activities\n- :manage_public_queries\n- :manage_repository\n- :manage_subtasks\n- :manage_versions\n- :manage_wiki\n- :move_issues\n- :protect_wiki_pages\n- :rename_wiki_pages\n- :save_queries\n- :search_project\n- :select_project_modules\n- :set_issues_private\n- :set_own_issues_private\n- :view_calendar\n- :view_changesets\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issue_watchers\n- :view_issues\n- :view_messages\n- :view_news\n- :view_project\n- :view_time_entries\n- :view_wiki_edits\n- :view_wiki_pages\n- :scrum_user_stories\n- :scrum_user_stories_add_inline\n- :scrum_user_stories_manipulate_inline\n- :scrum_sprint_planing\n- :scrum_release_planing\n- :scrum_charts\n','default',1),(5,'Scrum-ProductOwner',5,1,0,'--- \n- :add_issue_notes\n- :add_issue_watchers\n- :add_issues\n- :add_messages\n- :browse_repository\n- :comment_news\n- :commit_access\n- :delete_issues\n- :delete_messages\n- :delete_own_messages\n- :edit_issue_notes\n- :edit_issues\n- :edit_messages\n- :edit_own_issue_notes\n- :edit_own_messages\n- :edit_own_time_entries\n- :edit_project\n- :edit_time_entries\n- :edit_wiki_pages\n- :export_wiki_pages\n- :log_time\n- :manage_documents\n- :manage_files\n- :manage_issue_relations\n- :protect_wiki_pages\n- :rename_wiki_pages\n- :save_queries\n- :search_project\n- :select_project_modules\n- :set_own_issues_private\n- :view_calendar\n- :view_changesets\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issue_watchers\n- :view_issues\n- :view_messages\n- :view_news\n- :view_project\n- :view_time_entries\n- :view_wiki_edits\n- :view_wiki_pages\n- :scrum_user_stories\n- :scrum_user_stories_add_inline\n- :scrum_user_stories_manipulate_inline\n- :scrum_sprint_planing\n- :scrum_release_planing\n- :scrum_charts\n','default',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('1-redmine_scrummer'),('10'),('10-redmine_scrummer'),('100'),('101'),('102'),('103'),('104'),('105'),('106'),('107'),('108'),('11'),('11-redmine_scrummer'),('12'),('12-redmine_scrummer'),('13'),('13-redmine_scrummer'),('14'),('15'),('16'),('17'),('18'),('19'),('2'),('2-redmine_scrummer'),('20'),('20090214190337'),('20090312172426'),('20090312194159'),('20090318181151'),('20090323224724'),('20090401221305'),('20090401231134'),('20090403001910'),('20090406161854'),('20090425161243'),('20090503121501'),('20090503121505'),('20090503121510'),('20090614091200'),('20090704172350'),('20090704172355'),('20090704172358'),('20091010093521'),('20091017212227'),('20091017212457'),('20091017212644'),('20091017212938'),('20091017213027'),('20091017213113'),('20091017213151'),('20091017213228'),('20091017213257'),('20091017213332'),('20091017213444'),('20091017213536'),('20091017213642'),('20091017213716'),('20091017213757'),('20091017213835'),('20091017213910'),('20091017214015'),('20091017214107'),('20091017214136'),('20091017214236'),('20091017214308'),('20091017214336'),('20091017214406'),('20091017214440'),('20091017214519'),('20091017214611'),('20091017214644'),('20091017214720'),('20091017214750'),('20091025163651'),('20091108092559'),('20091114105931'),('20091123212029'),('20091205124427'),('20091220183509'),('20091220183727'),('20091220184736'),('20091225164732'),('20091227112908'),('20100129193402'),('20100129193813'),('20100221100219'),('20100313132032'),('20100313171051'),('20100705164950'),('20100819172912'),('20101104182107'),('20101107130441'),('20101114115114'),('20101114115359'),('20110220160626'),('20110223180944'),('20110223180953'),('20110224000000'),('20110226120112'),('20110226120132'),('20110227125750'),('20110228000000'),('20110228000100'),('20110401192910'),('20110408103312'),('20110412065600'),('20110511000000'),('21'),('22'),('23'),('24'),('25'),('26'),('27'),('28'),('29'),('3'),('3-redmine_scrummer'),('30'),('31'),('32'),('33'),('34'),('35'),('36'),('37'),('38'),('39'),('4'),('4-redmine_scrummer'),('40'),('41'),('42'),('43'),('44'),('45'),('46'),('47'),('48'),('49'),('5'),('5-redmine_scrummer'),('50'),('51'),('52'),('53'),('54'),('55'),('56'),('57'),('58'),('59'),('6'),('6-redmine_scrummer'),('60'),('61'),('62'),('63'),('64'),('65'),('66'),('67'),('68'),('69'),('7'),('7-redmine_scrummer'),('70'),('71'),('72'),('73'),('74'),('75'),('76'),('77'),('78'),('79'),('8'),('8-redmine_scrummer'),('80'),('81'),('82'),('83'),('84'),('85'),('86'),('87'),('88'),('89'),('9'),('9-redmine_scrummer'),('90'),('91'),('92'),('93'),('94'),('95'),('96'),('97'),('98'),('99');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_entries`
--

DROP TABLE IF EXISTS `time_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_entries_project_id` (`project_id`),
  KEY `time_entries_issue_id` (`issue_id`),
  KEY `index_time_entries_on_activity_id` (`activity_id`),
  KEY `index_time_entries_on_user_id` (`user_id`),
  KEY `index_time_entries_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_entries`
--

LOCK TABLES `time_entries` WRITE;
/*!40000 ALTER TABLE `time_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tokens_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (2,1,'feeds','60fd0d1ffadb851bdafe3654d4774ad15e3659bf','2011-06-04 21:56:05');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_in_chlog` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  `is_scrum` tinyint(1) DEFAULT '0',
  `short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackers`
--

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
INSERT INTO `trackers` VALUES (1,'Scrum-UserStory',1,1,1,1,'US'),(2,'Scrum-Task',1,2,1,1,'Task'),(3,'Scrum-Epic',1,3,1,1,'Epic'),(4,'Scrum-Feature',1,4,1,1,'Feature'),(5,'Scrum-Theme',1,5,1,1,'Theme');
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `others` text COLLATE utf8_unicode_ci,
  `hide_mail` tinyint(1) DEFAULT '0',
  `time_zone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,'--- {}\n\n',0,NULL),(2,2,'--- {}\n\n',0,NULL);
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hashed_password` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mail` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_notification` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_id_and_type` (`id`,`type`),
  KEY `index_users_on_auth_source_id` (`auth_source_id`),
  KEY `index_users_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','bcad959a2b894d60f2653313cb8c187f30991ed1','Redmine','Admin','admin@example.net',1,1,NULL,'en',NULL,'2011-06-04 20:02:13','2011-06-04 20:02:13','User',NULL,'all','66dbefae9ab62dd51e4b12217793a5d7'),(2,'','','','Anonymous','',0,0,NULL,'',NULL,'2011-06-05 11:15:05','2011-06-05 11:15:05','AnonymousUser',NULL,'only_my_events',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `wiki_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'open',
  `sharing` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`),
  KEY `index_versions_on_sharing` (`sharing`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,1,'Basic usable version','','2011-06-28','2011-06-14 00:14:12','2011-06-14 00:14:12','','open','tree');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchers`
--

DROP TABLE IF EXISTS `watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watchable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  KEY `index_watchers_on_user_id` (`user_id`),
  KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchers`
--

LOCK TABLES `watchers` WRITE;
/*!40000 ALTER TABLE `watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_content_versions`
--

DROP TABLE IF EXISTS `wiki_content_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  KEY `index_wiki_content_versions_on_updated_on` (`updated_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_content_versions`
--

LOCK TABLES `wiki_content_versions` WRITE;
/*!40000 ALTER TABLE `wiki_content_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_content_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_contents`
--

DROP TABLE IF EXISTS `wiki_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`),
  KEY `index_wiki_contents_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_contents`
--

LOCK TABLES `wiki_contents` WRITE;
/*!40000 ALTER TABLE `wiki_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  KEY `index_wiki_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_redirects`
--

DROP TABLE IF EXISTS `wiki_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirects_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_redirects`
--

LOCK TABLES `wiki_redirects` WRITE;
/*!40000 ALTER TABLE `wiki_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikis`
--

DROP TABLE IF EXISTS `wikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikis`
--

LOCK TABLES `wikis` WRITE;
/*!40000 ALTER TABLE `wikis` DISABLE KEYS */;
INSERT INTO `wikis` VALUES (1,1,'Wiki',1);
/*!40000 ALTER TABLE `wikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `old_status_id` int(11) NOT NULL DEFAULT '0',
  `new_status_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `assignee` tinyint(1) NOT NULL DEFAULT '0',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  KEY `index_workflows_on_old_status_id` (`old_status_id`),
  KEY `index_workflows_on_role_id` (`role_id`),
  KEY `index_workflows_on_new_status_id` (`new_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
INSERT INTO `workflows` VALUES (1,1,1,1,3,0,0),(2,1,1,2,3,0,0),(3,1,1,3,3,0,0),(4,1,1,4,3,0,0),(5,1,2,1,3,0,0),(6,1,2,2,3,0,0),(7,1,2,3,3,0,0),(8,1,2,4,3,0,0),(9,1,3,1,3,0,0),(10,1,3,2,3,0,0),(11,1,3,3,3,0,0),(12,1,3,4,3,0,0),(13,1,4,1,3,0,0),(14,1,4,2,3,0,0),(15,1,4,3,3,0,0),(16,1,4,4,3,0,0),(17,1,1,1,4,0,0),(18,1,1,2,4,0,0),(19,1,1,3,4,0,0),(20,1,1,4,4,0,0),(21,1,2,1,4,0,0),(22,1,2,2,4,0,0),(23,1,2,3,4,0,0),(24,1,2,4,4,0,0),(25,1,3,1,4,0,0),(26,1,3,2,4,0,0),(27,1,3,3,4,0,0),(28,1,3,4,4,0,0),(29,1,4,1,4,0,0),(30,1,4,2,4,0,0),(31,1,4,3,4,0,0),(32,1,4,4,4,0,0),(33,1,1,1,5,0,0),(34,1,1,2,5,0,0),(35,1,1,3,5,0,0),(36,1,1,4,5,0,0),(37,1,2,1,5,0,0),(38,1,2,2,5,0,0),(39,1,2,3,5,0,0),(40,1,2,4,5,0,0),(41,1,3,1,5,0,0),(42,1,3,2,5,0,0),(43,1,3,3,5,0,0),(44,1,3,4,5,0,0),(45,1,4,1,5,0,0),(46,1,4,2,5,0,0),(47,1,4,3,5,0,0),(48,1,4,4,5,0,0),(49,2,1,1,3,0,0),(50,2,1,2,3,0,0),(51,2,1,3,3,0,0),(52,2,1,4,3,0,0),(53,2,2,1,3,0,0),(54,2,2,2,3,0,0),(55,2,2,3,3,0,0),(56,2,2,4,3,0,0),(57,2,3,1,3,0,0),(58,2,3,2,3,0,0),(59,2,3,3,3,0,0),(60,2,3,4,3,0,0),(61,2,4,1,3,0,0),(62,2,4,2,3,0,0),(63,2,4,3,3,0,0),(64,2,4,4,3,0,0),(65,2,1,1,4,0,0),(66,2,1,2,4,0,0),(67,2,1,3,4,0,0),(68,2,1,4,4,0,0),(69,2,2,1,4,0,0),(70,2,2,2,4,0,0),(71,2,2,3,4,0,0),(72,2,2,4,4,0,0),(73,2,3,1,4,0,0),(74,2,3,2,4,0,0),(75,2,3,3,4,0,0),(76,2,3,4,4,0,0),(77,2,4,1,4,0,0),(78,2,4,2,4,0,0),(79,2,4,3,4,0,0),(80,2,4,4,4,0,0),(81,2,1,1,5,0,0),(82,2,1,2,5,0,0),(83,2,1,3,5,0,0),(84,2,1,4,5,0,0),(85,2,2,1,5,0,0),(86,2,2,2,5,0,0),(87,2,2,3,5,0,0),(88,2,2,4,5,0,0),(89,2,3,1,5,0,0),(90,2,3,2,5,0,0),(91,2,3,3,5,0,0),(92,2,3,4,5,0,0),(93,2,4,1,5,0,0),(94,2,4,2,5,0,0),(95,2,4,3,5,0,0),(96,2,4,4,5,0,0),(97,3,1,1,3,0,0),(98,3,1,2,3,0,0),(99,3,1,3,3,0,0),(100,3,1,4,3,0,0),(101,3,2,1,3,0,0),(102,3,2,2,3,0,0),(103,3,2,3,3,0,0),(104,3,2,4,3,0,0),(105,3,3,1,3,0,0),(106,3,3,2,3,0,0),(107,3,3,3,3,0,0),(108,3,3,4,3,0,0),(109,3,4,1,3,0,0),(110,3,4,2,3,0,0),(111,3,4,3,3,0,0),(112,3,4,4,3,0,0),(113,3,1,1,4,0,0),(114,3,1,2,4,0,0),(115,3,1,3,4,0,0),(116,3,1,4,4,0,0),(117,3,2,1,4,0,0),(118,3,2,2,4,0,0),(119,3,2,3,4,0,0),(120,3,2,4,4,0,0),(121,3,3,1,4,0,0),(122,3,3,2,4,0,0),(123,3,3,3,4,0,0),(124,3,3,4,4,0,0),(125,3,4,1,4,0,0),(126,3,4,2,4,0,0),(127,3,4,3,4,0,0),(128,3,4,4,4,0,0),(129,3,1,1,5,0,0),(130,3,1,2,5,0,0),(131,3,1,3,5,0,0),(132,3,1,4,5,0,0),(133,3,2,1,5,0,0),(134,3,2,2,5,0,0),(135,3,2,3,5,0,0),(136,3,2,4,5,0,0),(137,3,3,1,5,0,0),(138,3,3,2,5,0,0),(139,3,3,3,5,0,0),(140,3,3,4,5,0,0),(141,3,4,1,5,0,0),(142,3,4,2,5,0,0),(143,3,4,3,5,0,0),(144,3,4,4,5,0,0),(145,4,1,1,3,0,0),(146,4,1,2,3,0,0),(147,4,1,3,3,0,0),(148,4,1,4,3,0,0),(149,4,2,1,3,0,0),(150,4,2,2,3,0,0),(151,4,2,3,3,0,0),(152,4,2,4,3,0,0),(153,4,3,1,3,0,0),(154,4,3,2,3,0,0),(155,4,3,3,3,0,0),(156,4,3,4,3,0,0),(157,4,4,1,3,0,0),(158,4,4,2,3,0,0),(159,4,4,3,3,0,0),(160,4,4,4,3,0,0),(161,4,1,1,4,0,0),(162,4,1,2,4,0,0),(163,4,1,3,4,0,0),(164,4,1,4,4,0,0),(165,4,2,1,4,0,0),(166,4,2,2,4,0,0),(167,4,2,3,4,0,0),(168,4,2,4,4,0,0),(169,4,3,1,4,0,0),(170,4,3,2,4,0,0),(171,4,3,3,4,0,0),(172,4,3,4,4,0,0),(173,4,4,1,4,0,0),(174,4,4,2,4,0,0),(175,4,4,3,4,0,0),(176,4,4,4,4,0,0),(177,4,1,1,5,0,0),(178,4,1,2,5,0,0),(179,4,1,3,5,0,0),(180,4,1,4,5,0,0),(181,4,2,1,5,0,0),(182,4,2,2,5,0,0),(183,4,2,3,5,0,0),(184,4,2,4,5,0,0),(185,4,3,1,5,0,0),(186,4,3,2,5,0,0),(187,4,3,3,5,0,0),(188,4,3,4,5,0,0),(189,4,4,1,5,0,0),(190,4,4,2,5,0,0),(191,4,4,3,5,0,0),(192,4,4,4,5,0,0),(193,5,1,1,3,0,0),(194,5,1,2,3,0,0),(195,5,1,3,3,0,0),(196,5,1,4,3,0,0),(197,5,2,1,3,0,0),(198,5,2,2,3,0,0),(199,5,2,3,3,0,0),(200,5,2,4,3,0,0),(201,5,3,1,3,0,0),(202,5,3,2,3,0,0),(203,5,3,3,3,0,0),(204,5,3,4,3,0,0),(205,5,4,1,3,0,0),(206,5,4,2,3,0,0),(207,5,4,3,3,0,0),(208,5,4,4,3,0,0),(209,5,1,1,4,0,0),(210,5,1,2,4,0,0),(211,5,1,3,4,0,0),(212,5,1,4,4,0,0),(213,5,2,1,4,0,0),(214,5,2,2,4,0,0),(215,5,2,3,4,0,0),(216,5,2,4,4,0,0),(217,5,3,1,4,0,0),(218,5,3,2,4,0,0),(219,5,3,3,4,0,0),(220,5,3,4,4,0,0),(221,5,4,1,4,0,0),(222,5,4,2,4,0,0),(223,5,4,3,4,0,0),(224,5,4,4,4,0,0),(225,5,1,1,5,0,0),(226,5,1,2,5,0,0),(227,5,1,3,5,0,0),(228,5,1,4,5,0,0),(229,5,2,1,5,0,0),(230,5,2,2,5,0,0),(231,5,2,3,5,0,0),(232,5,2,4,5,0,0),(233,5,3,1,5,0,0),(234,5,3,2,5,0,0),(235,5,3,3,5,0,0),(236,5,3,4,5,0,0),(237,5,4,1,5,0,0),(238,5,4,2,5,0,0),(239,5,4,3,5,0,0),(240,5,4,4,5,0,0);
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-06-21  1:50:44
