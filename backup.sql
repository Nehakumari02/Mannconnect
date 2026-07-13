-- MySQL dump 10.13  Distrib 9.7.1, for Linux (aarch64)
--
-- Host: localhost    Database: colibri_plus
-- ------------------------------------------------------
-- Server version	9.7.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_deletion_feedback`
--

DROP TABLE IF EXISTS `account_deletion_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_deletion_feedback` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `feedback_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `registered_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publications` int NOT NULL DEFAULT '0',
  `followers` int NOT NULL DEFAULT '0',
  `following` int NOT NULL DEFAULT '0',
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_deletion_feedback`
--

LOCK TABLES `account_deletion_feedback` WRITE;
/*!40000 ALTER TABLE `account_deletion_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_deletion_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `cta_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_budget` decimal(10,2) NOT NULL DEFAULT '0.00',
  `spent_budget` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price_per_view` decimal(10,2) NOT NULL DEFAULT '0.01',
  `target_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `views_count` int NOT NULL DEFAULT '1',
  `last_show_at` timestamp NULL DEFAULT NULL,
  `last_charge_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ads_user_id_foreign` (`user_id`),
  CONSTRAINT `ads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,3,NULL,NULL,NULL,'draft',NULL,0.00,0.00,0.01,NULL,'pending',1,NULL,NULL,'2026-07-09 05:06:59','2026-07-09 05:06:59'),(2,5,'testtesttesttesttest','testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest','button','published',NULL,20.00,0.22,0.01,'https://test.com','pending',23,'2026-07-10 08:20:54','2026-07-10 08:15:54','2026-07-09 10:12:09','2026-07-10 08:20:54'),(3,5,NULL,NULL,NULL,'draft',NULL,0.00,0.00,0.01,NULL,'pending',1,NULL,NULL,'2026-07-09 10:47:18','2026-07-09 10:47:18');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_conversation_messages`
--

DROP TABLE IF EXISTS `agent_conversation_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_conversation_messages` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversation_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_calls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_results` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `usage` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_index` (`conversation_id`,`user_id`,`updated_at`),
  KEY `agent_conversation_messages_user_id_index` (`user_id`),
  KEY `agent_conversation_messages_conversation_id_index` (`conversation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_conversation_messages`
--

LOCK TABLES `agent_conversation_messages` WRITE;
/*!40000 ALTER TABLE `agent_conversation_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_conversation_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_conversations`
--

DROP TABLE IF EXISTS `agent_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_conversations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agent_conversations_user_id_updated_at_index` (`user_id`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_conversations`
--

LOCK TABLES `agent_conversations` WRITE;
/*!40000 ALTER TABLE `agent_conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archived_chats`
--

DROP TABLE IF EXISTS `archived_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archived_chats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'direct',
  PRIMARY KEY (`id`),
  KEY `archived_chats_chat_id_foreign` (`chat_id`),
  KEY `archived_chats_user_id_foreign` (`user_id`),
  CONSTRAINT `archived_chats_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `archived_chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archived_chats`
--

LOCK TABLES `archived_chats` WRITE;
/*!40000 ALTER TABLE `archived_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `archived_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorship_requests`
--

DROP TABLE IF EXISTS `authorship_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorship_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `authorship_requests_user_id_foreign` (`user_id`),
  CONSTRAINT `authorship_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorship_requests`
--

LOCK TABLES `authorship_requests` WRITE;
/*!40000 ALTER TABLE `authorship_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorship_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklists`
--

DROP TABLE IF EXISTS `blacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blacklistable` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `added_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blacklists_blacklistable_unique` (`blacklistable`),
  KEY `blacklists_admin_id_foreign` (`admin_id`),
  CONSTRAINT `blacklists_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklists`
--

LOCK TABLES `blacklists` WRITE;
/*!40000 ALTER TABLE `blacklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `blocker_id` bigint unsigned NOT NULL,
  `blocked_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_block` (`blocker_id`,`blocked_id`),
  KEY `blocks_blocked_id_foreign` (`blocked_id`),
  CONSTRAINT `blocks_blocked_id_foreign` FOREIGN KEY (`blocked_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blocks_blocker_id_foreign` FOREIGN KEY (`blocker_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmarks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `bookmarkable_id` bigint unsigned NOT NULL,
  `bookmarkable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_bookmark_unique` (`user_id`,`bookmarkable_id`,`bookmarkable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
INSERT INTO `bookmarks` VALUES (2,2,6,'App\\Models\\Post','2026-07-09 04:37:50','2026-07-09 04:37:50');
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_accounts`
--

DROP TABLE IF EXISTS `business_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `industry_id` int DEFAULT NULL,
  `business_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` json NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_accounts_user_id_foreign` (`user_id`),
  CONSTRAINT `business_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_accounts`
--

LOCK TABLES `business_accounts` WRITE;
/*!40000 ALTER TABLE `business_accounts` DISABLE KEYS */;
INSERT INTO `business_accounts` VALUES (1,2,' ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]',NULL,0,0,NULL),(2,3,' ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]',NULL,0,0,NULL),(3,4,' ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]',NULL,0,0,NULL),(4,5,' ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]',NULL,0,0,NULL),(5,6,' ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]',NULL,0,0,NULL);
/*!40000 ALTER TABLE `business_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashouts`
--

DROP TABLE IF EXISTS `cashouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashouts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `request_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `commission_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `to_pay` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credentials` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewer_notes` tinytext COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cashouts_request_code_unique` (`request_code`),
  KEY `cashouts_user_id_foreign` (`user_id`),
  CONSTRAINT `cashouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashouts`
--

LOCK TABLES `cashouts` WRITE;
/*!40000 ALTER TABLE `cashouts` DISABLE KEYS */;
INSERT INTO `cashouts` VALUES (1,5,'338444',180.00,3.00,174.00,'USD','Bank Transfer','testttttttt',NULL,'pending','2026-07-10 04:45:22','2026-07-10 04:45:22');
/*!40000 ALTER TABLE `cashouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `localization` json NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `categorizable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'uncategorized',
  `depth` int NOT NULL DEFAULT '1',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'{\"en\": \"Electronics\"}',NULL,'product',1,'active'),(2,'{\"en\": \"Health & Beauty\"}',NULL,'product',1,'active'),(3,'{\"en\": \"Sporting Goods\"}',NULL,'product',1,'active'),(4,'{\"en\": \"Apparel\"}',NULL,'product',1,'active'),(5,'{\"en\": \"Classifieds\"}',NULL,'product',1,'active'),(6,'{\"en\": \"Art & Design\"}',NULL,'job',1,'active'),(7,'{\"en\": \"Project Management\"}',NULL,'job',1,'active'),(8,'{\"en\": \"Security\"}',NULL,'job',1,'active'),(9,'{\"en\": \"Software Development\"}',NULL,'job',1,'active'),(10,'{\"en\": \"Web Development\"}',NULL,'job',1,'active');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `censors`
--

DROP TABLE IF EXISTS `censors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `censors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'replaced',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `censors`
--

LOCK TABLES `censors` WRITE;
/*!40000 ALTER TABLE `censors` DISABLE KEYS */;
/*!40000 ALTER TABLE `censors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_invites`
--

DROP TABLE IF EXISTS `chat_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_invites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` bigint unsigned NOT NULL,
  `receiver_id` bigint unsigned NOT NULL,
  `sender_id` bigint unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NOT NULL DEFAULT '2026-07-14 07:53:40',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_invites_chat_id_receiver_id_sender_id_unique` (`chat_id`,`receiver_id`,`sender_id`),
  KEY `chat_invites_receiver_id_foreign` (`receiver_id`),
  KEY `chat_invites_sender_id_foreign` (`sender_id`),
  CONSTRAINT `chat_invites_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_invites_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_invites_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_invites`
--

LOCK TABLES `chat_invites` WRITE;
/*!40000 ALTER TABLE `chat_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_participants`
--

DROP TABLE IF EXISTS `chat_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_participants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `last_read_message_id` int NOT NULL DEFAULT '0',
  `metadata` json NOT NULL,
  `last_read_at` timestamp NULL DEFAULT NULL,
  `joined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `chat_participants_chat_id_foreign` (`chat_id`),
  KEY `chat_participants_user_id_foreign` (`user_id`),
  CONSTRAINT `chat_participants_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_participants`
--

LOCK TABLES `chat_participants` WRITE;
/*!40000 ALTER TABLE `chat_participants` DISABLE KEYS */;
INSERT INTO `chat_participants` VALUES (1,1,3,5,'{\"color\": \"#CC5049\"}','2026-07-09 05:02:58','2026-07-09 04:57:35'),(2,1,2,5,'{\"color\": \"#40a920\"}','2026-07-09 05:03:38','2026-07-09 05:02:15'),(3,2,1,8,'{\"color\": \"#40a920\"}','2026-07-09 09:48:37','2026-07-09 09:47:16'),(4,2,5,8,'{\"color\": \"#CC5049\"}','2026-07-09 09:51:51','2026-07-09 09:47:16'),(5,3,6,11,'{\"color\": \"#40a920\"}','2026-07-09 10:02:44','2026-07-09 09:50:44'),(6,3,5,11,'{\"color\": \"#D67722\"}','2026-07-09 10:02:24','2026-07-09 09:50:44'),(7,4,6,0,'{\"color\": \"#40a920\"}',NULL,'2026-07-09 09:59:46'),(8,4,1,0,'{\"color\": \"#D67722\"}',NULL,'2026-07-09 09:59:46');
/*!40000 ALTER TABLE `chat_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'direct',
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,'80ad4e96-fa17-4bb1-9976-a8bfee50a749','group','2026-07-09 05:02:58','2026-07-09 04:57:35'),(2,'efdde58c-20a5-43e4-bbd0-0a3e5598f74d','direct','2026-07-09 09:48:37','2026-07-09 09:47:16'),(3,'c6ef18a7-7faa-495d-b92d-4fbe33ee8313','direct','2026-07-09 10:02:25','2026-07-09 09:50:44'),(4,'72890711-61a8-4a50-9307-9a7a496fc06e','direct',NULL,'2026-07-09 09:59:46');
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_parent_id_foreign` (`parent_id`),
  CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,1,NULL,'hii','om','2026-07-07 09:18:58','2026-07-07 09:18:58'),(2,4,1,NULL,'hii','en','2026-07-07 10:16:27','2026-07-07 10:16:27'),(3,6,2,NULL,'hiii','en','2026-07-07 11:30:39','2026-07-07 11:30:39');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmations`
--

DROP TABLE IF EXISTS `confirmations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirmations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `confirmations_user_id_foreign` (`user_id`),
  CONSTRAINT `confirmations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmations`
--

LOCK TABLES `confirmations` WRITE;
/*!40000 ALTER TABLE `confirmations` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirmations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `alpha_3_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol_native` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `usage_count` int NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'USD','United States dollar','$','$',1,0,0,1,'2026-07-07 07:53:41','2026-07-07 07:53:41'),(2,'EUR','Euro','€','€',1,0,0,1,'2026-07-07 07:53:41','2026-07-07 07:53:41'),(3,'RUB','Russian ruble','₽','₽',1,0,0,1,'2026-07-07 07:53:41','2026-07-07 07:53:41'),(4,'TRY','Turkish lira','₺','₺',1,0,0,1,'2026-07-07 07:53:41','2026-07-07 07:53:41'),(5,'CNY','Chinese yuan','¥','¥',1,0,0,1,'2026-07-07 07:53:41','2026-07-07 07:53:41'),(6,'GBP','British pound','£','£',1,0,0,1,'2026-07-07 07:53:41','2026-07-07 07:53:41'),(7,'JPY','Japanese yen','¥','¥',1,0,0,1,'2026-07-07 07:53:41','2026-07-07 07:53:41'),(8,'KRW','South Korean won','₩','₩',1,0,0,1,'2026-07-07 07:53:41','2026-07-07 07:53:41'),(9,'INR','Indian rupee','₹','₹',1,0,0,1,'2026-07-07 07:53:41','2026-07-07 07:53:41'),(10,'BRL','Brazilian real','R$','R$',1,0,0,1,'2026-07-07 07:53:41','2026-07-07 07:53:41');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_stats`
--

DROP TABLE IF EXISTS `data_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_stats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_size` int NOT NULL DEFAULT '0',
  `content_items` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_stats_media_type_disk_unique` (`media_type`,`disk`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_stats`
--

LOCK TABLES `data_stats` WRITE;
/*!40000 ALTER TABLE `data_stats` DISABLE KEYS */;
INSERT INTO `data_stats` VALUES (1,'image','public',1668818,21,'2026-07-07 10:13:30','2026-07-09 10:12:21');
/*!40000 ALTER TABLE `data_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `device_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'desktop',
  `last_online` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_terminated` tinyint(1) NOT NULL DEFAULT '0',
  `is_location_unknown` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devices_user_id_foreign` (`user_id`),
  CONSTRAINT `devices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,1,'012334eefc8ce786692c5eba2a320a29464462109ac1058ce6820264e5ee8f69','YXIm6gxAi3EWjlWdCLl7bI60WkHssDQGeC4c1n29','OS X','10_15_7','Chrome','149.0.0.0','169.150.207.210','SG','Singapore','Singapore','Asia/Singapore','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','desktop','2026-07-07 11:28:10',0,0),(2,2,'012334eefc8ce786692c5eba2a320a29464462109ac1058ce6820264e5ee8f69','tKt9qWHhSnAjEbqHiZOQTArLeIOSyxicCfqY70XO','OS X','10_15_7','Chrome','149.0.0.0','169.150.207.210','SG','Singapore','Singapore','Asia/Singapore','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','desktop','2026-07-08 04:52:31',0,0),(3,3,'012334eefc8ce786692c5eba2a320a29464462109ac1058ce6820264e5ee8f69','aW03kAR5nvJ1D48VssLqi1YxSexjE6gc0f5gehH7','OS X','10_15_7','Chrome','149.0.0.0','169.150.207.210','SG','Singapore','Singapore','Asia/Singapore','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','desktop','2026-07-07 11:25:53',0,0),(4,4,'012334eefc8ce786692c5eba2a320a29464462109ac1058ce6820264e5ee8f69','oaNkBWSsahDGJfReO0iIS38O5evPss0fJuv63aFx','OS X','10_15_7','Chrome','149.0.0.0','169.150.207.210','SG','Singapore','Singapore','Asia/Singapore','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','desktop','2026-07-07 11:51:14',0,0),(5,2,'d3ffe1a65819739cd4376fbc1fe014a6a5a9ed984c327304e298033ded3e711f','huKAjiEnFMq4j33okrhTza0knDGvjMG80jpC2WDO','OS X','10_15_7','Chrome','150.0.0.0','192.168.65.1',NULL,NULL,NULL,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','desktop','2026-07-09 07:21:07',0,0),(6,3,'d3ffe1a65819739cd4376fbc1fe014a6a5a9ed984c327304e298033ded3e711f','WgXJ9qquksziL7KETmi11ojtxKkj4HvltkzSwvrF','OS X','10_15_7','Chrome','150.0.0.0','192.168.65.1',NULL,NULL,NULL,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','desktop','2026-07-09 06:12:10',0,0),(7,1,'d3ffe1a65819739cd4376fbc1fe014a6a5a9ed984c327304e298033ded3e711f','GHgMNiMTNkfIhugih38YtmbVNTfAnwjZupJhr7aw','OS X','10_15_7','Chrome','150.0.0.0','192.168.65.1',NULL,NULL,NULL,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','desktop','2026-07-10 09:12:24',0,0),(8,5,'d3ffe1a65819739cd4376fbc1fe014a6a5a9ed984c327304e298033ded3e711f','GYl9U69UDpCcKQ0P7S7a0e8WNuaoZwhX4zUSkFIK','OS X','10_15_7','Chrome','150.0.0.0','192.168.65.1',NULL,NULL,NULL,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','desktop','2026-07-10 07:47:40',0,0),(9,6,'d3ffe1a65819739cd4376fbc1fe014a6a5a9ed984c327304e298033ded3e711f','EtzAF5sE8KGTab7mBzcPCMSEEHPJBSYcpnOhBc8z','OS X','10_15_7','Chrome','150.0.0.0','192.168.65.1',NULL,NULL,NULL,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','desktop','2026-07-09 10:39:21',0,0);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_confirmations`
--

DROP TABLE IF EXISTS `email_confirmations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_confirmations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_confirmations`
--

LOCK TABLES `email_confirmations` WRITE;
/*!40000 ALTER TABLE `email_confirmations` DISABLE KEYS */;
INSERT INTO `email_confirmations` VALUES (4,'nehapanwal02@gmail.com','70e01f25-6bc9-4af5-aa71-ffd9c698c8f1','2026-07-09 04:29:07','2026-07-09 04:29:07');
/*!40000 ALTER TABLE `email_confirmations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
INSERT INTO `failed_jobs` VALUES (1,'a32466d1-d7a2-415a-ae71-8d405f7d470f','redis','default','{\"uuid\":\"a32466d1-d7a2-415a-ae71-8d405f7d470f\",\"displayName\":\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":18:{s:8:\\\"mailable\\\";O:34:\\\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\\\":3:{s:4:\\\"data\\\";a:2:{s:4:\\\"link\\\";s:73:\\\"http:\\/\\/localhost\\/auth\\/confirm-signup\\/c1cc298f-a3e4-444f-980b-883485950307\\\";s:5:\\\"title\\\";s:15:\\\"Hi, there! \\ud83d\\udc4b\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"nehapanwal02@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1783422166,\"nightwatch\":{\"job_id\":\"acc4a5a2-8025-4c77-b7f6-c620318c9d59\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"32a07e50-0f24-43fb-b396-86f900999204\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:0:\\\"\\\";\"}},\"id\":\"a32466d1-d7a2-415a-ae71-8d405f7d470f\",\"attempts\":0,\"delay\":null,\"type\":\"mail\",\"tags\":[],\"silenced\":false,\"pushedAt\":\"1783422166.1522\"}','Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"localhost:2525\": stream_socket_client(): Unable to connect to localhost:2525 (Connection refused) in /var/www/html/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->{closure:Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream::initialize():153}(2, \'stream_socket_c...\', \'/var/www/html/v...\', 157)\n#1 /var/www/html/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client(\'localhost:2525\', 0, \'\', 60.0, 4, Resource id #1669)\n#2 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(268): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(200): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 /var/www/html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#5 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#8 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(211): Illuminate\\Mail\\Mailer->send(\'emails.user.aut...\', Array, Object(Closure))\n#9 /var/www/html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(21): Illuminate\\Mail\\Mailable->{closure:Illuminate\\Mail\\Mailable::send():204}()\n#10 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(204): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#11 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(89): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#12 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#13 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#14 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(136): Illuminate\\Container\\Container->call(Array)\n#18 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():133}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#20 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(140): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#21 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(153): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#22 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():146}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#24 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(146): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(84): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#26 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#27 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(559): Illuminate\\Queue\\Jobs\\Job->fire()\n#28 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(505): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#29 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(257): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#31 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#32 /var/www/html/vendor/laravel/horizon/src/Console/WorkCommand.php(53): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#33 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#34 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#35 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#36 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#37 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#38 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(280): Illuminate\\Container\\Container->call(Array)\n#39 /var/www/html/vendor/symfony/console/Command/Command.php(284): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#40 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(249): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 /var/www/html/vendor/symfony/console/Application.php(1144): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 /var/www/html/vendor/symfony/console/Application.php(379): Symfony\\Component\\Console\\Application->doRunCommand(Object(Laravel\\Horizon\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 /var/www/html/vendor/symfony/console/Application.php(218): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/artisan(11): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#47 {main}','2026-07-08 04:44:03'),(2,'bd95f2d4-53df-4159-bdb4-a0d9dec05096','redis','default','{\"uuid\":\"bd95f2d4-53df-4159-bdb4-a0d9dec05096\",\"displayName\":\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":18:{s:8:\\\"mailable\\\";O:34:\\\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\\\":3:{s:4:\\\"data\\\";a:2:{s:4:\\\"link\\\";s:73:\\\"http:\\/\\/localhost\\/auth\\/confirm-signup\\/318bed98-deda-4f5f-ba00-34e1aea60db1\\\";s:5:\\\"title\\\";s:15:\\\"Hi, there! \\ud83d\\udc4b\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:20:\\\"nehapanwal@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1783423552,\"nightwatch\":{\"job_id\":\"3145049b-9b8f-4348-acc9-6f2a9cf5a4f5\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"c56cfacf-99db-4a5b-af40-b19158d77858\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:0:\\\"\\\";\"}},\"id\":\"bd95f2d4-53df-4159-bdb4-a0d9dec05096\",\"attempts\":0,\"delay\":null,\"type\":\"mail\",\"tags\":[],\"silenced\":false,\"pushedAt\":\"1783423552.3021\"}','Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"localhost:2525\": stream_socket_client(): Unable to connect to localhost:2525 (Connection refused) in /var/www/html/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->{closure:Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream::initialize():153}(2, \'stream_socket_c...\', \'/var/www/html/v...\', 157)\n#1 /var/www/html/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client(\'localhost:2525\', 0, \'\', 60.0, 4, Resource id #1732)\n#2 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(268): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(200): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 /var/www/html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#5 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#8 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(211): Illuminate\\Mail\\Mailer->send(\'emails.user.aut...\', Array, Object(Closure))\n#9 /var/www/html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(21): Illuminate\\Mail\\Mailable->{closure:Illuminate\\Mail\\Mailable::send():204}()\n#10 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(204): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#11 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(89): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#12 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#13 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#14 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(136): Illuminate\\Container\\Container->call(Array)\n#18 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():133}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#20 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(140): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#21 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(153): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#22 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():146}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#24 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(146): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(84): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#26 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#27 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(559): Illuminate\\Queue\\Jobs\\Job->fire()\n#28 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(505): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#29 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(257): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#31 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#32 /var/www/html/vendor/laravel/horizon/src/Console/WorkCommand.php(53): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#33 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#34 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#35 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#36 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#37 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#38 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(280): Illuminate\\Container\\Container->call(Array)\n#39 /var/www/html/vendor/symfony/console/Command/Command.php(284): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#40 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(249): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 /var/www/html/vendor/symfony/console/Application.php(1144): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 /var/www/html/vendor/symfony/console/Application.php(379): Symfony\\Component\\Console\\Application->doRunCommand(Object(Laravel\\Horizon\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 /var/www/html/vendor/symfony/console/Application.php(218): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/artisan(11): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#47 {main}','2026-07-08 04:44:03'),(3,'10f646fb-a859-4d4f-9146-bc11e0744535','redis','default','{\"uuid\":\"10f646fb-a859-4d4f-9146-bc11e0744535\",\"displayName\":\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":18:{s:8:\\\"mailable\\\";O:34:\\\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\\\":3:{s:4:\\\"data\\\";a:2:{s:4:\\\"link\\\";s:73:\\\"http:\\/\\/localhost\\/auth\\/confirm-signup\\/012f9bad-9c0d-4aac-9d55-f1b1b1e91e96\\\";s:5:\\\"title\\\";s:15:\\\"Hi, there! \\ud83d\\udc4b\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"nehapanwal1@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1783425074,\"nightwatch\":{\"job_id\":\"705de8a2-2b27-403b-8363-7864cf70d8c4\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"53ae370f-d74a-4f16-8277-ce361d249e39\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:0:\\\"\\\";\"}},\"id\":\"10f646fb-a859-4d4f-9146-bc11e0744535\",\"attempts\":0,\"delay\":null,\"type\":\"mail\",\"tags\":[],\"silenced\":false,\"pushedAt\":\"1783425074.0696\"}','Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"localhost:2525\": stream_socket_client(): Unable to connect to localhost:2525 (Connection refused) in /var/www/html/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->{closure:Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream::initialize():153}(2, \'stream_socket_c...\', \'/var/www/html/v...\', 157)\n#1 /var/www/html/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client(\'localhost:2525\', 0, \'\', 60.0, 4, Resource id #1751)\n#2 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(268): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(200): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 /var/www/html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#5 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#8 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(211): Illuminate\\Mail\\Mailer->send(\'emails.user.aut...\', Array, Object(Closure))\n#9 /var/www/html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(21): Illuminate\\Mail\\Mailable->{closure:Illuminate\\Mail\\Mailable::send():204}()\n#10 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(204): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#11 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(89): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#12 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#13 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#14 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(136): Illuminate\\Container\\Container->call(Array)\n#18 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():133}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#20 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(140): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#21 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(153): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#22 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():146}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#24 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(146): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(84): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#26 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#27 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(559): Illuminate\\Queue\\Jobs\\Job->fire()\n#28 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(505): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#29 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(257): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#31 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#32 /var/www/html/vendor/laravel/horizon/src/Console/WorkCommand.php(53): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#33 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#34 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#35 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#36 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#37 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#38 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(280): Illuminate\\Container\\Container->call(Array)\n#39 /var/www/html/vendor/symfony/console/Command/Command.php(284): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#40 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(249): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 /var/www/html/vendor/symfony/console/Application.php(1144): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 /var/www/html/vendor/symfony/console/Application.php(379): Symfony\\Component\\Console\\Application->doRunCommand(Object(Laravel\\Horizon\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 /var/www/html/vendor/symfony/console/Application.php(218): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/artisan(11): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#47 {main}','2026-07-08 04:44:03'),(4,'90b3f720-11db-477c-b12c-44609538b120','redis','default','{\"uuid\":\"90b3f720-11db-477c-b12c-44609538b120\",\"displayName\":\"App\\\\Mail\\\\User\\\\Auth\\\\ResetPasswordMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":18:{s:8:\\\"mailable\\\";O:36:\\\"App\\\\Mail\\\\User\\\\Auth\\\\ResetPasswordMail\\\":3:{s:4:\\\"data\\\";a:2:{s:4:\\\"name\\\";s:5:\\\"neha \\\";s:4:\\\"link\\\";s:73:\\\"http:\\/\\/localhost\\/auth\\/reset-password\\/70e01f25-6bc9-4af5-aa71-ffd9c698c8f1\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"nehapanwal02@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1783571347,\"nightwatch\":{\"job_id\":\"9b8b15d2-e6ba-4a7e-b731-2e1167812529\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"a501ad0d-415c-47ab-a43f-f7560f0b372f\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:0:\\\"\\\";\"}},\"id\":\"90b3f720-11db-477c-b12c-44609538b120\",\"attempts\":0,\"delay\":null,\"type\":\"mail\",\"tags\":[],\"silenced\":false,\"pushedAt\":\"1783571347.5314\"}','Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"localhost:2525\": stream_socket_client(): Unable to connect to localhost:2525 (Connection refused) in /var/www/html/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->{closure:Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream::initialize():153}(2, \'stream_socket_c...\', \'/var/www/html/v...\', 157)\n#1 /var/www/html/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client(\'localhost:2525\', 0, \'\', 60.0, 4, Resource id #1636)\n#2 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(268): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(200): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 /var/www/html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#5 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#8 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(211): Illuminate\\Mail\\Mailer->send(\'emails.user.aut...\', Array, Object(Closure))\n#9 /var/www/html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(21): Illuminate\\Mail\\Mailable->{closure:Illuminate\\Mail\\Mailable::send():204}()\n#10 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(204): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#11 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(89): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#12 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#13 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#14 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(136): Illuminate\\Container\\Container->call(Array)\n#18 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():133}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#20 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(140): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#21 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(153): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#22 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():146}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#24 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(146): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(84): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#26 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#27 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(559): Illuminate\\Queue\\Jobs\\Job->fire()\n#28 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(505): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#29 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(257): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#31 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#32 /var/www/html/vendor/laravel/horizon/src/Console/WorkCommand.php(53): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#33 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#34 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#35 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#36 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#37 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#38 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(280): Illuminate\\Container\\Container->call(Array)\n#39 /var/www/html/vendor/symfony/console/Command/Command.php(284): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#40 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(249): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 /var/www/html/vendor/symfony/console/Application.php(1144): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 /var/www/html/vendor/symfony/console/Application.php(379): Symfony\\Component\\Console\\Application->doRunCommand(Object(Laravel\\Horizon\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 /var/www/html/vendor/symfony/console/Application.php(218): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/artisan(11): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#47 {main}','2026-07-09 04:29:09'),(5,'97e4e878-bff4-4b38-b277-9de1316357d4','redis','default','{\"uuid\":\"97e4e878-bff4-4b38-b277-9de1316357d4\",\"displayName\":\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":18:{s:8:\\\"mailable\\\";O:34:\\\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\\\":3:{s:4:\\\"data\\\";a:2:{s:4:\\\"link\\\";s:73:\\\"http:\\/\\/localhost\\/auth\\/confirm-signup\\/044e402d-c1a3-4772-b0ba-4c0973dd2dca\\\";s:5:\\\"title\\\";s:15:\\\"Hi, there! \\ud83d\\udc4b\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"neha@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1783581623,\"nightwatch\":{\"job_id\":\"0bc0b704-9565-420b-a971-b72e0e8b4e19\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"d53a4856-5058-44c7-8e44-ba2fb6c86e0e\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:0:\\\"\\\";\"}},\"id\":\"97e4e878-bff4-4b38-b277-9de1316357d4\",\"attempts\":0,\"delay\":null,\"type\":\"mail\",\"tags\":[],\"silenced\":false,\"pushedAt\":\"1783581623.8943\"}','Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"localhost:2525\": stream_socket_client(): Unable to connect to localhost:2525 (Connection refused) in /var/www/html/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->{closure:Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream::initialize():153}(2, \'stream_socket_c...\', \'/var/www/html/v...\', 157)\n#1 /var/www/html/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client(\'localhost:2525\', 0, \'\', 60.0, 4, Resource id #1704)\n#2 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(268): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(200): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 /var/www/html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#5 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#8 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(211): Illuminate\\Mail\\Mailer->send(\'emails.user.aut...\', Array, Object(Closure))\n#9 /var/www/html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(21): Illuminate\\Mail\\Mailable->{closure:Illuminate\\Mail\\Mailable::send():204}()\n#10 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(204): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#11 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(89): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#12 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#13 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#14 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(136): Illuminate\\Container\\Container->call(Array)\n#18 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():133}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#20 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(140): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#21 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(153): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#22 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():146}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#24 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(146): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(84): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#26 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#27 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(559): Illuminate\\Queue\\Jobs\\Job->fire()\n#28 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(505): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#29 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(257): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#31 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#32 /var/www/html/vendor/laravel/horizon/src/Console/WorkCommand.php(53): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#33 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#34 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#35 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#36 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#37 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#38 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(280): Illuminate\\Container\\Container->call(Array)\n#39 /var/www/html/vendor/symfony/console/Command/Command.php(284): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#40 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(249): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 /var/www/html/vendor/symfony/console/Application.php(1144): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 /var/www/html/vendor/symfony/console/Application.php(379): Symfony\\Component\\Console\\Application->doRunCommand(Object(Laravel\\Horizon\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 /var/www/html/vendor/symfony/console/Application.php(218): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/artisan(11): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#47 {main}','2026-07-09 07:20:25'),(6,'b9208dd0-fbeb-4e15-8df2-dcf7bbcc4a75','redis','default','{\"uuid\":\"b9208dd0-fbeb-4e15-8df2-dcf7bbcc4a75\",\"displayName\":\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":18:{s:8:\\\"mailable\\\";O:34:\\\"App\\\\Mail\\\\User\\\\Auth\\\\VerifyEmailMail\\\":3:{s:4:\\\"data\\\";a:2:{s:4:\\\"link\\\";s:73:\\\"http:\\/\\/localhost\\/auth\\/confirm-signup\\/23e79b94-9c8a-411e-ad7d-3c0c9cd6b810\\\";s:5:\\\"title\\\";s:15:\\\"Hi, there! \\ud83d\\udc4b\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:15:\\\"neha2@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1783581675,\"nightwatch\":{\"job_id\":\"d32d2784-150c-4059-a73f-1af3836d9bcb\"},\"illuminate:log:context\":{\"data\":[],\"hidden\":{\"nightwatch_trace_id\":\"s:36:\\\"4d7e92c7-c751-4412-8091-5d2d34d1c596\\\";\",\"nightwatch_should_sample\":\"b:1;\",\"nightwatch_user_id\":\"s:0:\\\"\\\";\"}},\"id\":\"b9208dd0-fbeb-4e15-8df2-dcf7bbcc4a75\",\"attempts\":0,\"delay\":null,\"type\":\"mail\",\"tags\":[],\"silenced\":false,\"pushedAt\":\"1783581675.4043\"}','Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"localhost:2525\": stream_socket_client(): Unable to connect to localhost:2525 (Connection refused) in /var/www/html/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->{closure:Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream::initialize():153}(2, \'stream_socket_c...\', \'/var/www/html/v...\', 157)\n#1 /var/www/html/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client(\'localhost:2525\', 0, \'\', 60.0, 4, Resource id #1721)\n#2 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(268): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(200): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 /var/www/html/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#5 /var/www/html/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#8 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(211): Illuminate\\Mail\\Mailer->send(\'emails.user.aut...\', Array, Object(Closure))\n#9 /var/www/html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(21): Illuminate\\Mail\\Mailable->{closure:Illuminate\\Mail\\Mailable::send():204}()\n#10 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(204): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#11 /var/www/html/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(89): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#12 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#13 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#14 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#15 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#16 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#17 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(136): Illuminate\\Container\\Container->call(Array)\n#18 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():133}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#20 /var/www/html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(140): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#21 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(153): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#22 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():146}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 /var/www/html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#24 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(146): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(84): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#26 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#27 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(559): Illuminate\\Queue\\Jobs\\Job->fire()\n#28 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(505): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#29 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(257): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#31 /var/www/html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#32 /var/www/html/vendor/laravel/horizon/src/Console/WorkCommand.php(53): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#33 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#34 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#35 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#36 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#37 /var/www/html/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#38 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(280): Illuminate\\Container\\Container->call(Array)\n#39 /var/www/html/vendor/symfony/console/Command/Command.php(284): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#40 /var/www/html/vendor/laravel/framework/src/Illuminate/Console/Command.php(249): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 /var/www/html/vendor/symfony/console/Application.php(1144): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 /var/www/html/vendor/symfony/console/Application.php(379): Symfony\\Component\\Console\\Application->doRunCommand(Object(Laravel\\Horizon\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 /var/www/html/vendor/symfony/console/Application.php(218): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /var/www/html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /var/www/html/artisan(11): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#47 {main}','2026-07-09 07:21:16');
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `follower_id` bigint unsigned NOT NULL,
  `following_id` bigint unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'following',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_follow` (`follower_id`,`following_id`),
  KEY `follows_following_id_foreign` (`following_id`),
  CONSTRAINT `follows_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `follows_following_id_foreign` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (1,1,2,'following','2026-07-07 11:21:29','2026-07-07 11:21:29'),(2,3,2,'requested','2026-07-09 04:56:13','2026-07-09 04:56:13'),(4,6,5,'following','2026-07-09 07:49:57','2026-07-09 07:49:57');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `visibility` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `privacy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_chat_id_foreign` (`chat_id`),
  KEY `groups_user_id_foreign` (`user_id`),
  CONSTRAINT `groups_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,1,3,NULL,'test2','','public','open',0,'active',NULL,'2026-07-09 04:57:35','2026-07-09 05:01:55');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hidden_chats`
--

DROP TABLE IF EXISTS `hidden_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hidden_chats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'direct',
  PRIMARY KEY (`id`),
  KEY `hidden_chats_chat_id_foreign` (`chat_id`),
  KEY `hidden_chats_user_id_foreign` (`user_id`),
  CONSTRAINT `hidden_chats_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hidden_chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hidden_chats`
--

LOCK TABLES `hidden_chats` WRITE;
/*!40000 ALTER TABLE `hidden_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `hidden_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hidden_messages`
--

DROP TABLE IF EXISTS `hidden_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hidden_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message_id` bigint unsigned NOT NULL,
  `chat_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hidden_messages_chat_id_foreign` (`chat_id`),
  KEY `hidden_messages_user_id_foreign` (`user_id`),
  CONSTRAINT `hidden_messages_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hidden_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hidden_messages`
--

LOCK TABLES `hidden_messages` WRITE;
/*!40000 ALTER TABLE `hidden_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `hidden_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_listings`
--

DROP TABLE IF EXISTS `job_listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_listings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `overview` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `views_count` int NOT NULL DEFAULT '0',
  `applications_count` int NOT NULL DEFAULT '0',
  `bookmarks_count` int NOT NULL DEFAULT '0',
  `income` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_start_income` tinyint(1) NOT NULL DEFAULT '0',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_remote` tinyint(1) NOT NULL DEFAULT '1',
  `is_urgent` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'vacancy',
  `last_contacted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_listings_user_id_foreign` (`user_id`),
  KEY `job_listings_category_id_foreign` (`category_id`),
  CONSTRAINT `job_listings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `job_listings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_listings`
--

LOCK TABLES `job_listings` WRITE;
/*!40000 ALTER TABLE `job_listings` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_snapshots`
--

DROP TABLE IF EXISTS `link_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link_snapshots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `linkable_id` bigint unsigned NOT NULL,
  `linkable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` json NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_snapshots`
--

LOCK TABLES `link_snapshots` WRITE;
/*!40000 ALTER TABLE `link_snapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `alpha_2_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `native_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `usage_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'en','English','English','','ltr',1,1,1,0,'2026-07-07 07:53:41','2026-07-07 07:53:41');
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mediaable_id` bigint unsigned NOT NULL,
  `mediaable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumbnail_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lqip_base64` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'processed',
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumbnail_disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `visibility` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'visible',
  `mime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumbnail_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order` int NOT NULL DEFAULT '0',
  `metadata` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (2,3,'App\\Models\\Post','uploads/post/images/0cd5caee-192a-4a09-a6a8-a801a8491a00.webp','','data:image/webp;base64,UklGRsQDAABXRUJQVlA4ILgDAACQJQCdASqAAMAAP73Q3WY/v7+nNrWuQ/A3iWgDsBzc8b0Q28jou8/fJabBSCXeZCO9rCO9g62oB3jePPiIkNI2iIeQRsl24VjbTGkzc/nYsOMoZ9eMzNBzfoRUyK2vmqYv/OZRrbADp4YUaMu32XZKrdyaPNrE/5LDFOymVbdqAozILC6eHLvjQTMhNEIUZPSuVVnXc4Ycch6tLTLwSf2aQgdVCebC0GOm0YO+vlqZwT8wok/rEjZcGd6BaVTzhzYFss+/T/XH7KN6j0RPxw1l4uPhh5NEDjBg0gLlEGc7V+cpdtMEZClzSSwJ1kxIPQ0oRgCkCRtghI2CMjhUl4rN1NTvsPeD8rIHL0pEavAcDi02vuvNugEytdYFjDJiGzWqDqomluPKvfcPtVoVU/baLgkgA0AAz5OhnNuh8Z9JnfLFp4kNi+V936Suf4NHXwNQRVjUVse/Tq1lI/EEh5ReP1af3bqJP37Cq+ZbeeHBzKvhWqgvXwwNcfKGbFOdZ6tNWkK1fuZVmcvGnrpnGw1s0KVC1pcFG2DClAyDnJ2tP3xbE8Cd1/NZc9hXcwUvJ7ivKWbOc7t2TsUfV5sPXbTMbsBfD1c2dUkBZ8q2/mMK462J3aPxDAArGUFOTli7MgPcxcULVUIQQ4dK6h8QZ3Vx1qa/KVP2OmiTsZgmIXZVGZJpUcZ3oGXcvXmH93E/NgWl6MccI3vXRWXJvkebamVBLCDX7vmp1uQWsB5OplbQU2RqYIovXHr5NvZBOosEZN1BxhJnopiJAhVBn3Np+ERmhNjAXBCgJnKlKceMFfufBK4lUG8XH2tlKFHGMzG3cygk5m9Xo8pWKkJQzOpk4BmeYthSQ00rwIQNLxtss0/bAfhWQFR9kfMVFMyDifvpk+03jljRE6Vd0V5eTXLxJWEITKedVQXhO3I9WC2HjbTlex3ZNtvq6NN+RSKyOHc3EXRb+Q73+H1fs8k/nvGFdnaCg6kWo4CpmlqOTAxzLsgKABjNgwc7MhEItVuYehwU0WL1+jNEHId5ZZzhfEP0PFVBTAUqvwrIs5DMY8YlZOQ0wQ55NC1oU7QpZ23ym/+Vy/agF0dy06YWE8eauc/gfSPhllZ93PEtatUTwBst8GshdRPwFNbz6+zaB7ZQJKxD0bIf523gVIQhO9CdytOVgzIzPybEtDmZWEa1RI9MKQ05DuFDVMy23T0gSrl7QtpU4dK446FHVziKrVCivoVpfe51KqXPBMRsAy+656HEVV88ijEHC1cqhAAA','image','processed','public','','jpg','visible','image/jpeg','28552','',0,'[]','2026-07-07 10:14:03','2026-07-07 10:14:03'),(3,4,'App\\Models\\Post','uploads/post/images/9908659d-0978-4b9e-a1f6-97fc5b080a6f.webp','','data:image/webp;base64,UklGRloCAABXRUJQVlA4IE4CAABQHgCdASqAAMAAP83a5Wg/v7+1L7Mba/A5iWMA0d597kx8mJwYOR8qmxdmfgUMbDuMU3O2EVWbgf2f7+RVDVvN8xl09/3a/mMvg05Tz9z9GIZAp2b7Q2MU+zJ4Dez7RJyCAzqRdmEoSKbEL12KqlcWYzwJw5WFU3xMaH28ylU/SyGO8i7CgNC9cnSypV8VGtpIdoXbuhxC5s0nOn/PoVO8vnPFcTnuzBiguZPUqLIceLtxSstvaPIb4yNta0Wp0bmiQfhQRurnxwzTS6Pqy+EWtxjdb/2aiY2ndswvaOWpt8nxNQryTGUzH7X2/AVVlq/yNbbONmOV4x3BIAD+48l2FFkj4jwgxBrC1pUHZx+DN5hFmGAenHuFPdhQ0Gc89X0hJyVpe3EOzAQADgtSw6HqH/+ODpi/HhG25yDmuaMoZBOHYDWae9j+QXjZXqFFZEZsiXPX7JUSfQIRNI3AIX9SMZmEAPYrOOkcNi8iCqs8q4wJCeVk7SmmQscMmZoBvILqkO4k68ZpvQLIQ6RwlXHbdn0n6v2sEWNa/GJEfqTW6v3aP/52/wlZrPMTGJftjybO6A3rhTV497pNTIqH+rtb6wG3NCjeEj6PcaCRdy3CkUqXXsbI5AQ86YsR54TDCWGUqhUrghbx3TfD8AnUoRc4xrIIiMEhyCsijJQ+7gK6oz+6ab5qCB+T5Sc3blraa4pjmNwJtokRAK0TuH0xC3PEMPp6K+trJh8nZar9Ps8gcyVlD7dEaMlEWe2XBDv4jsv4ZCuUAKtx44YjSAAAAA==','image','processed','public','','jpg','visible','image/jpeg','20118','',0,'[]','2026-07-07 10:15:40','2026-07-07 10:15:40'),(4,1,'App\\Models\\StoryFrame','uploads/stories/images/306d48fa-8e14-4cd5-aeda-83e73fa68e1d.webp','','data:image/webp;base64,UklGRsIFAABXRUJQVlA4ILYFAABwTgCdASoAAYABP83k622/v7+7JnSau/A5iWdu/ELJW9v7i05eweZL2fz7P2aOlySCg1Uj/ccqNo255od54vLmJB49AhOp3G8ahJBYXiR2SePRwSuMTtTn/X+d60+IFoywen0cQd++mSILk4BF4Y3lIBXU5do8NSHaR1+5nZkqcAUpAEz62MP1kTI5QIyouGvg0XJN6E2gjHD88e7I2R+MGbHLNIVMygbgdYEmGLfmcZFHYXzRFAZRAHqgfhKebL0JaLmJhdEqn8htvspMIJzSmy3oqJIBLOCVEByvP9vm+UOFuz0diLgH9e4fqM2gfFRBF90E2ZXrOjxRAygaOGRg67N5DvFYnF/LlJsAZW0J5BJG9mAX0K8JfqZP5jYp+a8r0J8A17ipzTrCwOnc1UhQL/uEfIEctNLM3NTu5gEP8y6Er41IKvTH1Z+y7NdoEE582IU2aTpkpH6+FIKpJCi9tTPwE8aYMu094XYLhrh1SAsD1H6zMbPpSKczuf1xnzjK6x7pUJmDIT1iiEtCFaV2Z1+Nfo0+oyxOofaSsoy9bQ0JV54n/6F2e0MWLx6cqOYcO9dUNMl9pL84JHe1GcKn0XWISetWlG6DJQ181IWpAkZ4zB23e+CxGV6SRFYUVfkMvuSQvURdFo+VcAMIOGU7kdSBsAijCicFBpzTe3g1RfVFxPktEefIuLs+8yPWuIT5D/Uizxr554D6MyEzS2or7y4PlbfupdCfbwqdBFzAXiNb6wbqw8G3xEoTwoZNEpY4tVUHIgQcPO21Rz7LrS0Z0Mp0eMBJrUQvQqbXvm9GSKkTb4jTe0iej/a7kj2npqHQEec1X+Gaoh/fYAAA/qmkF1aC0EEbK2J97qDQ4lWiJkAOpAhBPqFHWDMNRkgKNAPmaKJkztBTfvleesUa0Z3GN7GO0zz7hjWPwXbJy/WFWGNKRmAyzpP7sI818i5IpQrk77LzIEtGmExcACR/Bl/h5SF8MTNV6Y4U2CRVNaprStyaMwEzrBe9NZ8iukYcOBiszGFNkC4D4SSy4WDVaIBu1jrvAsCUw3F5D73dX8Cx4RMdLUkE11A8ffbVlN90z2fW7wNHyOxL7xC5zCmEMFZpFSpjmmoR/h2oepZF9ypGamxmLLEGgl3FyN4tyhUjBftMupVy6r5IL6arOFoW/k38qFFKnI8f1b/43ZhtT228XjcuiEzwvqDAi3IN9ubQUIm6LsJk4lID9mlN93CrrGOcOJ1K15q4KQhh7iJsw3n0qP47VzneGw6eTMgL+NDJ2wX+dhpcRQUEro9P7pZ2TRt9Z/ozXFerHqO/wMYn7JpPkDVvWijQRC8zQu5bHjAw7se/hf1cX4/Yn2dN520itu5zrdGn3iOZ/d1gBMzClrh44soHN5TdB24ktHcdrfmFiXxKkoNW6znMcrfjhGfCkQcu3VCAIj+YwHoq4Cw7wgRBvLjP3OUnTjHbnvU8U7LyCQxagr4voLxsuD+EA7itZcb0rn9QstdF2cFxrIKlQOpTc3lDyTU/xzXYFoeIhEL9o8nCPfsxuZAGfq0DZW+c+RacwEQjfb8YLrZ7fyN+zT5n0MMgerQnubWQilHxF1MFqfmomzwh37UvKBSlmm82LdaBIGgtiYlJmpJ6B/HhdbbTqse5GZoVkEEpFFFNoL7pUjcTV2OwlNaSgvtGciLqymFQgOilbnbQYIy8zz+4YbeeZhguYVMshKDGxa+nzTf8yF3ZsAGt0M1r31578UnPW84qyACbDLYVhoHIRumI975fLrhQAnrQIHESVyKJBuLYm2eks7jM31xBqPSADpHz3lVmb1BoMFPfdZgE5tNxjWRN0NdD/wRhZ1cFH0uhlBa7z9afA3K0ljDbCMzK0oEXl+Fc/ax8yoDSiQBi3F/mSu7+bYlPjQu/dTco1a9QPfif7jJh/Sc6ViwF4a8yqDgCsLpxiQLqkAAA','image','processed','public','','jpg','visible','image/jpeg','57662','',0,'[]','2026-07-07 10:18:59','2026-07-07 10:18:59'),(5,2,'App\\Models\\StoryFrame','uploads/stories/images/3a6f8105-07d8-4102-89a1-561b469f0d60.webp','','data:image/webp;base64,UklGRqgEAABXRUJQVlA4IJwEAAAQNACdASoAAQABP83m7G6/ubIqp7Q5M/A5iWVu4XCBCCAdm2QCuJTS9E9pStozhe/yuyNtSxj36AlNXZG2pYx787JVs1BNXla5ggG/Jy6D/9+N0ZlgCNZKqpRTJ2QjNkyEosY9+gItVH2kWg1Dw8CMvXAuOZaZB5jzh1LGPdCzKQ0EtT2dyoIdPoIDwGc+g2Ueaw6G96VFyJTQvJ+CvtYyw60BrGBpEGiyMWYBek+MXyLj0pd9yS73PBaOmW3yUbo52B39ZyZh5I9/GdeNBvp9yS72M/1tDmBMfXwiOM3SgwXZk6+ZgFRz/5w6N041Lg1Uh2/DFD3QTxIcHC8oG74P1wEvb1Sdcqfi7oMH97j+rkjdGIxWKkiq+11cdeuEQ2Z63FKK2NuhYkjUqgVvy3Qp75qzA4b6XbTc0YgkKq1CF5RwmIr5ybaXAXox0oIFLlNcROhRbs8m5bE2OvyjpDPaPERuyYWlnFD7tqBcqE0gizDcUP5gcdLSeigz/OpLB2EaD2qEiqz+MyIsl0prljH172ahs89DdzxzItTPVtQrMVOWeRQ2Ab5QAAD++6tEHmASqH24kLKkb+zeV8lTdKk/AKSGSGfDmHOkuB66bp+eC5XhZ51G+wQhcWpwGFlV+843WjNSbICJDNTIGnQ2C+FmqaCtEaDpjW8GJFeGclBVG9glhLv34v90zjboRRvq3Bi1zDyGuCp+Yi650/QsgkfVTRKuPCIHYpQDc2o1Hxa6i98ZcT13yxhI1Cjd0iiYOSgjg7Whom8AJpoiHJCvYXkQes0XY1/lU/3VCDVJKtrEkvFD0PyfjclXsxc0CAj/5IrIJlmFQeeOGpmTy0i3RCu4ilBReVzZAAjznNp0wiFpLCavtfuMP71Gq7PBWZCnEhZCbRMmAEVtU2A5AfPBHXqu2UlzXcBv2V756fwH2FO4Cf8O8ANj9b2oxqcNsxS9vtjk4TWZ0FVxwguF96Boo23bnXN7WcGy3nvTnkjQvAEInnxjd7lVOnd4aUQ2LAbrmBIAbXfGzAr9C3Z4pet+1/RBmAAc3LiDYz+qx4dTgS0x7ZYyZgbVReGgKeBdznmVm2VQqAs4Wj9fAWS/62MYUPW5G8EmoTUlmQFVBdrH3s1bdvibsV3wPpL8xjUCMRSqjmLR9XxuRnYBagxj0jnsa4g6dRf8tDfgH2oDjna3GgTo7hY7S4u4QqZ493qZi0VRM9MA7//ZeJ805xrFO21hVnl2sbq9dLBJmMur5i57/tVGGbWilf8YTPYE3CgarBn6ZFcj4mM5xF/kWyCtiCz6SgrFNCfiLG3Y+X7D+6cW73YJjPWz9HVrOYT0FlTENvQLsbUqbsti4XMbLRQgI79HykZilencNNJO8afo5s40eAZBTMHJJk2xBq8FQOb0t/Us9EyaVsPXr++J1/EzNUFglRu1halAk1UEEsg2zIBh5p0ZBq64feffrPLRFBOOHKdalsZwIiMHTh7OfJm/FN6dIm5d50bWF0lnz+KTDggabYRbTkeURomUNX+2ggqg9wR35uBFBEJQuIhPrLg1hFjV9L0FHmhV0G9oLIAAAAAA','image','processed','public','','png','visible','image/png','20100','',0,'[]','2026-07-07 10:34:33','2026-07-07 10:34:33'),(7,5,'App\\Models\\Post','uploads/post/images/86819fd1-176d-4deb-92f8-c2fd32d9ffac.webp','','data:image/webp;base64,UklGRuABAABXRUJQVlA4INQBAADwEQCdASqAAEgAP83c6G+/sy69JnILw/A5iWQAxCncO8DfCaIBUc+XZILEIUYfUIBqh/ltPkVI/Cu5gHVsrAfcBmBW6yryJGOhbvQ9Y/L6GWyjZZY04MZMBu0HggbkrfiuctabNMrsWSpc6SgQCQFX2wzQxYDANcZ+owy2cyJKWpuCbA6Cf3FJ514Dm38wBQUL467p8O4niAD92IQsgSnATDKAtHdy/8qaVhjNrVQRKMSrLwfmwKny2xnHpufMTqdJkRK/ecxiQhiwWD5ezCBwdryNbKY+p3bddktxyf8GuFRlPuuE1Do3Oxznrh7QPJBYNXETqUgtJ78XBwRc0zFOSXbua5MaUsgP/zMNC5Br3IFfn9DXhp5O6Wnw5ux0VgVxoPUifKRp1tPxBfPsqTziBUZ4m5AACIzVt8yVW+ARn4+E2eRYSUTV0+bf2AnG+07+i1cZbJ1HGzVPg+i5q0fAseoBdYNh8dOvt7NIJE4/+ceCpPkKHPFZwdhoBL7XwtPBJ+uX549SO4dVLCMaa6byBAB5MVkz2GtFCoHHXlfwRx/AEJH2edsa25d8ygiueop0KbG7cEmqLg6HvnKhyQCnqRVI/fQ5A6YqxoWKBvEmm/QAAAA=','image','processed','public','','webp','visible','image/webp','56528','',0,'[]','2026-07-07 11:29:51','2026-07-07 11:29:51'),(8,6,'App\\Models\\Post','uploads/post/images/0acca1b1-8174-4578-bd07-adbe21904409.webp','','data:image/webp;base64,UklGRtIBAABXRUJQVlA4IMYBAACQEQCdASqAAEgAP83Y5Gm/s7+2LNMN+/A5iWwAxNDXK+b2w8Op8141ljX/9dpdX1CuaO5vn4pBhtjieUFC4zvy0nn71MwyaI4QjRJhxNBg+nAjG5vSVAP36z7pmGAKBRMtyCzMT7yOoump3OASIELWY3lDkzqJq4O4x8CKG1oCkNPxIHHcdqSefflVHhstHwtPampXAAD52UIIC9f/cDsLcnds+zfHbIMKapWh0ED5rk9vYtPeUQ+4z0N9C4vAsp5VbvH9+PDRpamTf+MG76nXvKSE9Nx+s69mX95jugb2LnJ5T/6tHyiov+i/LzYILvMJjCPMTWLpExKYu/oOocu1nSP8MpDRR6cliyF4acZnDN46G/NKvMm/ewJczhxNWgO47WT+CUxX6Mbxa6B1qh38jvp0MZAboKJtCOkb6KcTZwG7R2C6k/HbRCJ1m5R1DQp3UDz4plwWpAvrKWeZE9euv9I4miIBRizejXLL8Ub9OjBjhstsgqFeUBgFlmcDYMLIBhaAImFK0DFYDkStjDJ03wD8VZEbB+Swtm2G6Dn6r7BACBEeTiRrt5ThQn3euAtjvGrrald7VM6HrL/LQHh3pQWXwAAA','image','processed','public','','jpg','visible','image/jpeg','22674','',0,'[]','2026-07-07 11:30:26','2026-07-07 11:30:26'),(9,5,'App\\Models\\StoryFrame','uploads/stories/images/844a6c7b-e5f1-40a7-b872-8fa117a92367.webp','','data:image/webp;base64,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','image','processed','public','','jpg','visible','image/jpeg','156884','',0,'[]','2026-07-07 11:31:38','2026-07-07 11:31:38'),(10,4,'App\\Models\\Message','uploads/chats/images/53c9732c-330f-44a8-bac4-a9a2b5c3105a.webp','',NULL,'image','processed','public','','webp','visible','image/webp','44746','',0,'[]','2026-07-09 05:02:50','2026-07-09 05:02:50'),(11,5,'App\\Models\\Message','uploads/chats/images/0c3488cc-531d-4136-a017-d3858b774ef2.webp','',NULL,'image','processed','public','','jpg','visible','image/jpeg','26762','',0,'[]','2026-07-09 05:02:58','2026-07-09 05:02:58'),(12,1,'App\\Models\\Ad','uploads/ads/creatives/78786ac7-2db5-48d1-a3d8-b0737fae0962.webp','',NULL,'image','processed','public','','jpg','visible','application/octet-stream','21358','',0,'[]','2026-07-09 05:08:50','2026-07-09 05:08:50'),(13,3,'App\\Models\\StoryFrame','uploads/stories/images/be30b8b8-8c69-48ab-a4e7-67f53e2eae70.webp','','data:image/webp;base64,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','image','processed','public','','jpg','visible','image/jpeg','112386','',0,'[]','2026-07-09 07:13:52','2026-07-09 07:13:52'),(14,9,'App\\Models\\StoryFrame','uploads/stories/images/5b5d4c98-06ac-4cf6-96bf-1ae8857aa217.webp','','data:image/webp;base64,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','image','processed','public','','jpg','visible','image/jpeg','184530','',0,'[]','2026-07-09 07:17:47','2026-07-09 07:17:47'),(15,10,'App\\Models\\StoryFrame','uploads/stories/images/ac41cf74-52a6-49a7-9e1a-44ecc99527d4.webp','','data:image/webp;base64,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','image','processed','public','','jpg','visible','image/jpeg','184530','',0,'[]','2026-07-09 07:18:07','2026-07-09 07:18:07'),(16,7,'App\\Models\\StoryFrame','uploads/stories/images/d7788b68-a065-4416-9c76-7c2655952824.webp','','data:image/webp;base64,UklGRsAPAABXRUJQVlA4ILQPAACQggCdASoAAYABP83S4GY/v7+/sLZt+/A5iWZuDkD5sLllbJVBOQnXLa+VXOuZPxJ/+ae2x+739uZ1v/nuH//PMlz/4H8m+zUf//rwukT693sgNurc6i2Gb+4cfNnUjs3ekSRDlwvgzON1SIUbV5UBtCP9/H1HAhQCqRwb0o0IwjVVFjU5TQ8G97rlPRsyzf2CTIlIXz3jq+TAfaOg8u7Qbaa2OWdArUbyWj0Zi34RJ+v/RzZSGiTIlmf/ac6YVIw0Q6CAYiSlR49sTs9y2OQao7QCtH2Wrc5BWkMIK+bVerRNMKJS+iT27FWNWz6sd3lSVlprS1i0mSNMz37IhqZKY0MwmxhMAz+e+MqI0abkawbRSnKIvlEnpqKLiCU9FfVtOTZiNbT7qp5TOxXPBsyo+vfHIR0vXU+gx1NDvnBaBH9xcgklgueErJIKy2stfXl3/VszcWzW1biMzzcCNO3QmrcX8aLVpz96RWC2F+bSjvIcAs0ASgQugGjVl16uGdzVjSABYd9iZcNvjziaYY3S9FkNqIO/Dcls52k/qEhDnl/WWsjkqSSVSc/WxYyVD8KOmLuEz+l/vK2h/C1M3iFCCIAoucwQnJwDhBmFEsAJqoJ92AbCVXK47mZYaCiElVYeYMnh3W+/PzMH+aJ5Pr2RulJ8WhvM6Dp/Jy0Y5kcTfyOEh/iAEgjGCfdgaNF2RQA2P1clDGLTtkBp3GxU+vXEuAJDnBewdS1X8ekA4uuYa+2VpXnqbzqeW2CFGGVA7DVjP4GeVONG54jImFWAkdTaTuyHbI9OywmguhcYXnDwA/0oXoMLx1lSeZxvb7jNeAoIn1/K23d1CjiBr36wQIouzXfmfdh0ho9IrF+ZAe3NBMh/pkpTGpsaHHaAB2tvNjXLi15MNCxjKL3TT7pplXDJvojoc6/YK+/KmcB8TSSMJXfCsG6G4YlTdyliJ0BT4GLxW3/Ka2v1d2lwfYn2bewYT/WwjaoTpA4HcXhTVvKadRjiZLnvUCKSdY7fX/sSLLC7RjJ3Y+uRK5Dmi01+2zN1KATRIXXeV33QsziMINW/njYx1Af4ob4XTe0JG7l4xsWwPPMqMm4j5R0Jby78aNIulB+iaCbhjaM7XMWMdciF1w9xc0Xq1xEcZ57H+0k1/IjRvCAbKM2sB1OHhVXc7j0hk2yOnEK9dHhYAZeAOzOQh7H3DHA/OirnIeEVSEMASw37vkbBC4it0so40+7gZ368JuzYiL/WmlhslRoL7HoL2Tozi4UvNO4SMPvD67SgPKF7tnK+Vv4RoDlBwVXqa7D9/2Y0UYoPuSrAbsgHRzj99mMPIHxQP3lWot9vJQ+x9SvpNVkho378+/pIAnuOqEV951uKZBGEem9pH19qLQpPeXiby3wy2/ktYGOyyOgAsSj/pW11Zfr+6G5viGbh2QzErEjkEDnyq0lKd//QDtWQFIY15OhEn6pC7u5wHPYltUXN5OxOy3A0z9EuFhlg2kTzRbiETWbgc3X0dl07IGSNFvYI3CXpk90bAdQxU+Mxs9NXaxkYHF4QgWgBtAcAbFpX5CEdrmTG53wLZR4e5VoS/EfTsf8A4nnNZDfF/zzodhFu6vyq8S8+O1GqagRYt3suX0emAuwiaEQ2/4cHOUUDkAOXecrVFUyf6AzPslCwIg2x67ypRiwT3cAU+yBY+zuWu5ZZhNHhMdgoZfeI24Zb49ZfPJx113l2N8h+EW0GbCcwXR/vxJda9T1L3SNJaTCZWqTB2DPWU5QPrMwcR1e0A+gqywKreTcDB0pmDASqkyf0HShdGQvoiREzPPAM8peRVfmnr2DhseuL+RTjAMQDNj/ggfE0onWv4VAEGV9ct2cZ2AUgCdyIAUbSajcdMYevChjt8r9Rfr9LnIpkY74/U6BluQQBMGFJV32H5j5Kp9HHCCAaAInUjQfxL7CPkpk1/QiHZEGM0RtdofiNkJ9/I/KCL6pKCkn757yiQLWclUd1Ecm++KYheAC+KNatFTNeEyQHhz1qP7R1174pVG9AeILsf3halzM02rWaZ3JuPUw/RUIIaf/pRyKqknBC+tuqp7BJn40ROhq8zNoOKbsHBzHBitah26dDJaEpXZzGZqQ2GSsq0RBHYsReIM66QzaDtwLb3NTjVXtRpiMAe1E5IHVY9VK/2aEiwnSnYe1usx5cxZmTOk0MdtfFnM0YMdcnr126/IUTzoLZX/CdBnPqNHQMM4ekp2/ktEEg1HjoiZQB6vZDIv6xOq+g94MK1eNiDVSU0Z5cAq7TStL3ewTsMdgCPLaZ3NuidV3MaUcIEvrX6yWigM3aBIt5spDzkslP9f+UkETIcMUA7LU1GzgDEwba24YrvCD/+yf13AdWyhvjY9HTqDUFak4gMFOMc38+euHdLT5wmcqGm+tDGSv3Q+hbDnTImSOjYKqWXkB/3lND5H71ol3WgaxrrAvQQSBgwA76/+64Zh9K8emsBZHSFJa5KKFBxgz2186qi5egK2/5oFzAE4wuQPotjUNsM3oNbLJ0jnch61YfYqmXIVvBGwnBa6ICJN8ss0LtieeIgYyx7pJLqbRR/XDnb76qKsWMO1mjthSkQT8pSjIf374EAAoaT8aZC5W0Ef1EPDKO1UUyuPj4dWeuMvjxUi0J2wBOs07q6soWvyugBaqwhyzp65GMIN76kuuGoN43/E3J0Al5Vy8SRxMkZy5UEs38VpaGgD/YFXrOPKXrKnlj6F0EFwTWogndKHORUGKHE3iLWD5fMHKoI2y65YsM2cloD9TsxLmbxmm9cbeC3WwVqKPql+Lvwlu4rnHB79S62jEZLlJj7lXw4R7e3f0He1R2iapZRUI4DOJY+8HOU3cRkerOC3Yq+CoVwb+LMmXtYXw5BMAMCR02jE20JXp/OSb3TEuBG78kBz7daASCG9TI3fP9TOhE/FV4v0W5Uficitf/kyGiExPHDAqkG1XQWeNZqx7DVEt/k3knohvD17RCA3Tqs1M/Y9/E2fwU3vP8RMXqK/FuQeorDhRVoYRQ/G/Zlky/wP0l7yp+rFQ7Ky5X3m/RFP0Dor+Vz1qA4i2JlKhX7/OlAmIhBeE88caVt7yRFdcSdK5ZlpP/VAoHCoYezTVB/EC0Zpg+QzKJ3U28oRaFjLelElvdZ27+orJbkr8ZtaqUnJ9gPcIpOKtuvHkl79dzvfmp4OXMovaP9eLSo9KTtQQU6Gb8TzZNSQA8/prl+dBnMbioSuXw8nAqxcAM7dwodWz58v+tjICKEhd/UolPUiiALXO7yYo89qYI1uO7tCbFHRS5x6PNv7ejSHiODCns4KghpX4rM6nsPgl8afxe5mGj5a/RXWpyoQW4NzZntdoZIedhttJk0cMt/mkD/+4ukCl55ueG0AOt5f3j/LcgLoRvt7VzeQLLbPzlaNgb6x2ZfrXdYIn3AkTfKHdrQ6aSvfuewNxyFMjivwjJzvaR21vO0qRH3rVLCSSsniQTnAaZOTRgC7708TNXm3bozCyZKxOKd9Vcg9jVNrLyK0/BZCaEczSaezUtiQnvZ9ZWXy//xibg5Qoht21wUZq/dW+1qtabI5wjNRiHZz8Q2D1gopFMV2meIhGy4nsZgEmduZ7pBA706w4NS33n50XnkM+5EzRn64W8MdT2cRxp5gJzquNO6zI3hpCEEBDuF5XZS9ydYspdYUS/TtdV1L8S5fBAPp/az9dBHJhEhXPcXuPrYuULoP5r0z0mnXAWoGdGjmuzRE2PRtpJ+xwn9nD4oQpRfzJjOrPYXFR+98yk57RFGOUWH0yh5HRE6ijq1IfwN2Cff+CKqXYVx6brLTu9CwbRVkTT837QQbv7S02vDwu+RGzShTUTbUBTHoxmkoq4QegReqxY+E8KHglhcRj/IuUSNu0r7HYIlCmnpzNqVueOWgfin0Zb+XquMxm+qBtrMATZs7CMhi0IP/iKg6rpH6gB/4ja17Yk+CTJL+/Ghy+sNyPc3xmXR9XehBsc7ayuVaFzgu7FORlkq7plMVz5Ci15lEJ/1Con9m2NwqOjzzlnwskreqr9wCf8lTTXE8w/1JqEvRvFzGx9ZZIEqe74qfZBIlN0iQhESHMs+hZ3MfKYD0NkQZz/xGts/nH0zj8s29Qnc2nsRhHf03HjH42dBOPUXgHa/R9oNAOJ0UDdUqra3T4VmhyQFCXd9I3s5PecRHW9rI/X16oJJr/NNfu7FSmoyrAbHI2q2FeCiR5IpYeebZ7AYKT0ncbO6UGTAZmHlAfsykOg3VvwRP2gSGECbtajS+v7/dHoXXdZ2VhF0gpuMWBAJVXE4JfYp09IY9hcebF2E5zICMsIIqlqq3XvdA68UalsAav9GF0mXR73bF0FOZPS2eaa285Faja7oyFgJ38oqssJAYqDyfFMgQpW8ojJjU459y9ayt0tIKfS8uaYUF4Xa0uDgrrcvcwnjzAq6svYkQ2POdjxzXX57AYmV0upU3ZlRg24Ezc+RbtPt6P/b1HbnBRiAnBLT3TOKPNFrEx29qNjMKaJkuD03mLWusq0KFVTlaYoFYlWnJKzgwxg2s01uudZBKih+FFQzPPgEf/4XE6CoqlSfTyeO34PXFWgOZhjcIqU34pHGGT/wWoTs3uPcmwfN4KmhrCInYgHAEbvK8yN+845BEeLqCn5MXc9zG8+RmLOnllIRxtM3Bd9oYFgegXRZcPFmv10uwOHT+0tE0SeZeSv4FE7KZVdNEGvHgjgyox44iWPHAPrgLgWrnZbxfVTsFM4W5OCFqGYtQx45PS4lrr2dsumto+VMN9VUgVEyhl62wfZnpfrSEhejcf+VhtgyfsMr5448iyaUidPdLDgKvowNLhax/uUQDnM4DbtoEEd5nReZlnnoj7pB2YhDQN6GgTYh9wRmAXLBzftExkgzV4BsP4H4Cnq9fxtJNxsNXd7GpoOIQK48EDyf50VQmixlmb38qxRRCyr24dQgeGUmbKx2+sSXal0nWrtmuFc7YwJUGDxxy3FKBHupa9z2+splx4bfJczL/G0IxCugxGj019qk/einTbQRpFRg23Wclsqv0G6cQyDY0OCD27WOznSAAACpVwrLxcj+VbyoyzkImPuB/iDDgsA749KgR34YkoJ+AnPQ8JDlNT+/CPYc2nCcIpLmMUUSaYkk4MxhgdAKdTu7z4EtqwqWM9ljI8byxezuXK8hS++9tWryvvB6DswCmbUovqU/0dJCJ2rFKjMkATUAgNCyUG8Fyghy+NUAoCYWeggAAAA5oZ0uodrNLm4ROWrCLjvoMzGzqpJ4ZteTrET0i00HI3IKWcsmj4WowpLPz/8k+hV7/yQZ0Ul5Qwl1cNoIuXeAsgCHZQzUDPZulMb/k3ga5Q/GAAAM5BAAAA=','image','processed','public','','jpg','visible','image/jpeg','146874','',0,'[]','2026-07-09 07:18:47','2026-07-09 07:18:47'),(17,12,'App\\Models\\StoryFrame','uploads/stories/images/1201e697-ab73-4d05-8111-b609678be1e1.webp','','data:image/webp;base64,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','image','processed','public','','jpg','visible','image/jpeg','146874','',0,'[]','2026-07-09 07:37:04','2026-07-09 07:37:04'),(18,14,'App\\Models\\StoryFrame','uploads/stories/images/637baf8c-0338-4443-9ddd-089f30c003c6.webp','','data:image/webp;base64,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','image','processed','public','','jpg','visible','image/jpeg','184530','',0,'[]','2026-07-09 07:50:17','2026-07-09 07:50:17'),(19,13,'App\\Models\\StoryFrame','uploads/stories/images/7ebcf923-1e6c-43a5-9d7a-63208f96af39.webp','','data:image/webp;base64,UklGRpoPAABXRUJQVlA4II4PAACwjACdASoAAYABP83U32a/v7+0MFY9O/A5iWNsZqQ5nfb7bCOxri6GG7Klmt38o3yTnlXTHMXPGZDxVoQ5m/jvIP95p6v/vs4Y/+UhVUn/96usZThxnpasalDjZGHJ5oT57fIMHYUISEjZ3vqIb+sBXtUPvFn278hw77p5R0NgR4h/ydP6W8/5o6mtJkTil9MnsqvtMy+fq1+/3EVpJ3crvSRdBhHXED0HxFWrTQr27f4SR8+WGneVaf7saqUopBPwi4eTPM2TMe35VVj2ATGJ8dN2Sh1+yCY9dKxaE/DT67nDrVRl6Da2c8H5nm5r8hOrGRzA36/J5JPaLCFtW2tAlqIBUzBKZBLqnFL4v0GC1dM8HBhM88F0xJKdP+8zKBFdGKbLxwnTaOL0jGoDB9R2T62EDpUZTiHUQXz7D4c2wl4axXjTcqi03KgJPjQ7E3URcFycG1afpC5g1gFwIY7Jmexo8JeUcgcFRVdrPMBZPm8sGDtHCPY+ORD0sWxUryXOM/VxI9ndrZhehBsSEnr91U/mQJS3+r+d3nn2rbJSTM404rCqAbXBp2JqmES8YgoVvDBduvjmpyo52Jfk+Lc3kKkMT5AuckYeZD/s4LNOjVhTkyQZ9u47IQDM+ltsJ7nezgbvkzcWK++Y1bF+lIfacRcYZaM8YBok/KvSZ+spHPZWM216hdwtv4FKsP5IXobYJsx8pWW3jmIrRFLvAMlOidQMIcsLgm9X1vMrdECHyLKtYSTxrn+PcN5DiEjnOQPB6wZIqJu8yaWbBa6YWjKAn12MzaCCmULI/bGYRVk9z3msi8PjWp7sjSs2PSFgWKvUg3Nlnc4OVpiH4P9WO0Lr5lohDpK39Yaqku1xg7jPt+ov4swlRk95HQNfJPfZnr2LOHmw9DQ//9JRGbQqOp/5JjhVl6BOvGAhz/mUouOnMfeg3oBx3swyAPZev4+xjGucBLyL2fVdtCpTnHHjrF9UBfodIMQyNDBswqy9mdUS4LI2B3atjvM/wD3ydDdXyM5L8LpP3e1hChRlCpPXPlBeRepo8YkBGcgilqCrGPYIvCnGvSWx4wz7xQuZGJqkRrGSxExsootMoCGvnyXr/BfJjS6MKK8S/FsT8u5FxyDgea+feQ8RUN8J2VHylOgyKAAohgZxFSUzX8VAUtfNr22yajepxXjYc0H4jfsMDMn8E0pPoO+lgFr+Fi4EYXGjXkOQYuKJWVGJqIAthbCOJN4SMyB6HTCWws8KIAeAewD/6CZgjBwunKI38sEWQB07qN/UahqkoCcAOg+mb5c6X0eRYW/j2Jm8Jq06W7rQ469kcDnUkZXfG6MFgRiCbZ7Js7Qj1RH41Kv0w7RjBgXLOFoJ43hgtzR3no4VQW+OV+4n3P1nm8S2DPOh/x4ACaxUMLktrPJXoYw1sDD0xuIFpJGMHuOQp/f/mcn73UmBnUi1ijHSF9GJNzzIv+tWX6aNy1vcWbod+U43rKBKJJi+/e8yaRdgLCLG7DTRrDSKJOAA/rlrWRR3u8KTo7Ya8qAgPXRn271amrGgjEnCi7eHiRvZD9xstPrtddIXOOo/Yd1IITYr5M2jsP8a2Td21z4EjlMdZKlNSGG/VRDvBpT0n4wHHmnTpdiFXpzxuZQSyIPYAf1hIS+PBouTdQZ4mYxxmxYOAfXWR27A1zBzS8OulnvhJmaG527gdM60a71ryPi8nFP4baiv/mE9M9nOyk/aa3UFR0Uhr28x1EtCfgxJy66pWJb3joXLYnOG1v0WAHXi4VpKcdQWarpBGJQ3rS6QUnfGyRNe3Og/eGrgg0XK/JWoalxKeSQjpbBRV+Pm2fG2EwR9EUWAMqs9SWVn+6pIjzrqOfWTTD3dq5z8I7NfdsTMbqQqwHsFhm90Rgm2RPnbZ2GVbrtHoOTeY7dM9owjX1Zx/V+P02Xg/I/ssCTatRFt7jB6/F+Yjt+kvBMaZVyXHLNosKJJzHHglTCJwTenhTBpI+q2UTCY9QNbv7F8KFfBj0rp+HRH+Jx7MggKUhHLX/9SJY/dVHD8ohfsG9phPdrZdiXSg97oUuOMb9Po6d8wUN3tC57KnWr6mZEFGe/rnBuZ/wWUmzIGBGl2SBcpiidyCu0bVGhLyRDd7IfEHHgot/VdWZ5Xx77SvLwzZnVrYob5XPE5nAKgsifAZQRJLdsMW/eX0aeZFIdeA2vypJGpsVUb7aB8Lf0R69zTnvWRUQrIu6L599O/c6an8BgisTqKZ4k215eQUvcOVq9zoEID3oqp9fSXlxLfqbRwyPwOX3kYzV3FlJVkZQQnN6sWJE0/qC9vULj+UwJ5oe/IdegdVm5l8EdNh+GoZ+gLGrmzxWxL/2Sx5AwybSEPM3GkBUHLmykoHwBVRjTtCCYoSEuTjkeWMtyjZj5YzrITrcV1pdPJeMOxRANH5feIEbbYWt7D/+h02QIZoctP/LmNkQeyL0y8mBnHz3pUdAWOrsFHt470ySgSPHtBSkvOOvlEVWEjavepdLPCpGtUng/Iy+clPGTTlG/8qS518UjLt8nJEiOYU99NAbUrAhJ2o5pnLumG3wFziql7bcwq9UXLuHdqp/m8VIKMt9qFe6qHaFbHrKhZOcYBe8DjJgAL53Dh1UdM3Pq9LtPQ60p4mYBQUBsDT7XUfkPNQwnWQbYke5WIxIBlaCiVNH+I2PMaGcSDJMr7WlVUnGndmHuEYkOVJjhoRJaHDmb5Tdsy0haDe5VwOE7XDs/dCGiY2RSv9YMXbYIF5wnR8fns/K07wd1z5lL8bcNGexbsv/yJSCiZknIIiJ9QB8zECDOMJxa3GXCqaZ2m3UPGzydB4qZ8pokXBnT9ZMJn2w8bRD3yoL/0ERHmJkCaV01ta24TOfJ8UQphEAbG7FjnTa1SRoXwYmf9Ra/QCFiyJ8RvPVWqUBDHkDD3GB+lhU2/OA1Ls66K5mxza7gl3Y5j29pY+Aps+AyolHvO0tvC0DMCN3RAOLVejfmku7X4bRpTwkY1bTs8iT2V1B3X96Otrx7RfOUZak7osLAJrmh7wlGbbAhIqTibqJ2ddJl8t+gZM4s8fuX5E89gs1jmx4jRnJdH3DzF78oZo8KzyJcam6FM69WZac+vvF1jOuDCVGLtbGEoByzCmzlnjGK87SYDHjo50Gl8pPkFTaEw/k2nAv7GE4Gr4ti7AZQy1eRU0wAzjDqnlnGF8d78GV3IfZakwR9Q+AGA/bvLz/1pV7dQ08kwkh0Cfu9c1eQ/qdTNvYklthR5PxxfyIq40q62UgsuzJQzPFscBNcmG2XTImSeHUKLnhj6vzg63jGkQYc4WIShvuSEVosYEzQUIsIlFYoPQVjXOURlI3EvF5jTKyvm73x8Dh8LLJWsVtTLrKLz9eALLp3ut/pCmC+vGBIOUmTwuPs0puJD+vYG0tlnB85AzM8nO+DOLMmSTSoPbv28IQXWcUgoHLN02NN+gr7vxOh19BtFJyWu3v9roXRcIrWQ4tBN0s/bMtygWtkOn2LlDaPlwEy3cxEIkdL+1i93Olgnbek4CuwzyJgBLV7iBp7yboJpnVfS8XR2eWqzlT6YjpxhaG4ieT1/AK6PjwLzDbO2cMxSIIDs5CdKhqfeC8bEmdbkaNAgWHrRzR4YMXncyplzsZYevIZ1SM4m0eGAF3kNXeSQtxi8GQ2Jrw4L5AfNlBM0/j7LokP6gLsFPdGhFvpnUuoxv2UPB5PSO5TQliRNLoEWdjgHHjWb4T5l5TxNwuqjqh0sk03TZvlg8CLu5dTlJ2Og6Iur4w4q5wWRrfpXhS5FwesDOkVTB6NSomB6gd8evPizGgrSMrODQjRPN/VBo8LLHsvZB2/ikAogMeVpMrzs4p+M6bHto/ft8qzYAVPPRg9bZKZ/SWwVui1YqLVGqiOr7VMSB9H992XYMJev2tt2jZxdrNtHbOrWeY3ZvOvj+3oxNj3QLsD61N1NS4ZqR4DLjZQSTbFKAE2bAiBjHeCpg/ElXZ3W2jMFvb1Y9fp66PuDnAQP/wa7FDmLx5soM6WIKofHMOE064kEcvpgitrnA4QncwpYjiJ9Xx5eJAfOISUSkwSWRXXyXBuC+FXW4sJ2+/KKO5vsIrSc3LkUwOz9kXh3TYR/GuB8V9MFXXEhI5CIV8BkrZj1oZ0W0jb4uns5yVlpccKwcWmAZT0AVSs9Smnl2EHMxEDHyOhXaFWSMIeJ742uGm04q7lwVrQirs525pgODbEl5ePDjihJ2r6WQSUahBKqa/jWH0MXUV4WUBzhtMU9RyivarSzeWHkLTn/Exv74ybv2NNdmGtXeShpbdR0sVbArkojEGQME+/i9wxLWV50RwvWHjVqZYG/yuGu+D51tUfg3o0B5HLqkqNRFM2AmkLTRHhQz/kYn4mGAnIY7ea+1IiJEIkhCAzFMIcvdlb+nsJoslKrRf3Y0qBs5lKpR90SO/cEKMCDfeg/oA0Ot1eCYoz/yPXGb4p9F/wdbscCIl51SeNrkCGtcbpdrJ8a7vkWoeZWTYUDEB5mY53Vq8hVp5SSjA7pi0BVzAntvYBEPXk3CAlzukZMEYw/DLTEZCNp+KLFDIBHvs31APZ/chwkstQcHLDhQ/TYbCx8xKB599lEoFoGfrNq/e+y7XXt9GGR2pQPcW5qLZa/XGI8fX/gp+c3chOJCUcHulHN8pPOcg4cQ75/DGuR4n4DDlW3v0btTocZXfiprVoF6f10bC450oVSAsjtXnp5FaW3/yKWjJfr9879M870RcjyBWwsmg9T56FnRP458khlQHjEyce6DKqc76qnhSZ6pLNSTqwdDV/VBMqs+v03eXUeXq07jSA4fFSGQSZf42CwMHYDHqhpmckvyE5APCbsQPF5/v0Fp9JAy2Zk/QH2QSdfKWO8TaIk/lawg1S8l34/B+dGIgc/pDBvUcON2t6oN0jw1pUw73mxuNrOe3ZLjqyc140a+cWun9J77+DfCxsk68ZRhNedbaiKxKwTVidocWEoKBXmn3rV9rqQ+BVusxrq+yFPQn4xOzUEblCt97rq6X0BmHaJP4hSuk3zPZ6+4rPS1w0B0sVWjkKiQ0SS02nrdNAmEELKL6Ys7SWbHfknc/bB8txz8c/B2GTe4pDUfzMpC4T9IoDZn6KtVjRRgjUN5vwN7OhSTT5/kOH0ost1JBpZZ32g3Gp4I0R23vXaVsed9auCNwRLEq4MMZZlLu02KF9YCfK6fPDerjBFXWFWq0azx07DnJeFbEGvCjwD1S/08fp1SZL4YHMRmZHIRY+Cuu302TbhBYb0f15hY8R9RkMb+5zXnia6k4J8eMNKYELTjoQmbwAA','image','processed','public','','jpg','visible','image/jpeg','184530','',0,'[]','2026-07-09 07:51:28','2026-07-09 07:51:28'),(20,1,'App\\Models\\Product','uploads/products/images/3338be7c-fa97-4a61-b7f5-59bdac07e9e0.webp','',NULL,'image','processed','public','','jpeg','visible','application/octet-stream','15502','',0,'[]','2026-07-09 09:13:43','2026-07-09 09:13:43'),(21,11,'App\\Models\\Message','uploads/chats/images/11cb446e-5ac3-43a0-8f7f-1221b842fcae.webp','',NULL,'image','processed','public','','jpeg','visible','image/jpeg','10142','',0,'[]','2026-07-09 10:02:25','2026-07-09 10:02:25'),(22,9,'App\\Models\\Post','uploads/post/images/3a4ff6fb-88a2-40a1-83f2-3620ee06f121.webp','','data:image/webp;base64,UklGRiIDAABXRUJQVlA4IBYDAADQHgCdASqAAMAAP83W42Y/v7+psBSte/A5iWMA0f+TvkP8Ri177N8CpcH8dKZoRZ4xnPN6d2IVCZFqYJsEGEy40pu3ZHXjyLKbOj5MsnvwoIN1CayXx7gPM9jhASlP+5ppMHa8CpXV2UEN45j0O9keILzmsj4azU0NRVo4Uig9bpf2Ku8YRn1W3ktId1QbY5mt3Ulr5OrcvzOBYVkd0Yu18Lo3bvTTRsjxYdn3N/Ks7EjXZnm6+CksQEwRz9bFPTLGF9Ksexo2sVUb50m1rsac2dxYtmtATmCl7CstYCr6IrsI//aEDoe6fY9HS9xEZWf3IinGBK8k6PTm6caD8AAA2WIbfYKUhu2TvRS4Qwu4HtOwP+dnmJD32PnkWRccoJ7NKsz03QPtMO4Ghtwor3dA5w/cXv7pkkVkXMgygZAzGDzmtBsJ8CG9oMKO7WSiRskSoVGAALS4I5YLgXYNBXQlhswKZohU6v4AGNAspMyR0oQoq7RdALJIepRkk0uo+SnuWLBYOCi/AJq7CFItTnhFC4i7GWlV1zCD6SV3Reatck2IcojbguD1s4ExEnWFHylP+QDRDnQmvaVJGrPy+F8sMlbUh173Pj4ZhvjfQC6oZdkUj4TDaJ25+ItUEB2lnmHSD8a1/PPMGySVJ2LynNhAkAr0ZsogDvArCFQ0sLTF6yejOStTZlr8XFCaN+L+V9smb2kv4nRrplZZ6kjsDf2i8L5kdziBhUvLMOBDpzDaCryZ/pg4vDhki15DfD5laCerNLD3PFbI6EFVioiWuLW0Sp7T5MB40FgwYV6vy/OQKnDfa4VqURbXwi4raowEVWqJ3rdYotrZU2Z52DBGDXzqlQxP3cP41xVSo7X04Quv0+uIXzNkY0S8zMI9Gpyg+mMt1oyNcDoVX6ISS5NLcboNAvAmfxjc4LQSxOulSp4YLktqg6GLdoFXngywLiN5Vm/XRBDlZZ7oNbE8kE00kh9zkb3hPsS0o6ibrtFGWTA/CZe7yh5PQA3FJmRgcRmHHQxHEXoMxhT0rtBfTYy6tyDIN8iC14AA','image','processed','public','','jpg','visible','image/jpeg','33892','',0,'[]','2026-07-09 10:05:48','2026-07-09 10:05:48'),(23,2,'App\\Models\\Ad','uploads/ads/creatives/31214e8a-c943-4381-8b25-9e84a0b36f69.webp','',NULL,'image','processed','public','','jpeg','visible','application/octet-stream','9644','',0,'[]','2026-07-09 10:12:21','2026-07-09 10:12:21');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chat_uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `participant_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `text_language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  PRIMARY KEY (`id`),
  KEY `messages_chat_id_foreign` (`chat_id`),
  KEY `messages_user_id_foreign` (`user_id`),
  KEY `messages_parent_id_foreign` (`parent_id`),
  KEY `messages_participant_id_foreign` (`participant_id`),
  CONSTRAINT `messages_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `chat_participants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'80ad4e96-fa17-4bb1-9976-a8bfee50a749',1,3,1,NULL,'hiii',0,'om','2026-07-09 04:59:37','2026-07-09 04:59:37','text'),(2,'80ad4e96-fa17-4bb1-9976-a8bfee50a749',1,3,1,NULL,'hiii',0,'om','2026-07-09 04:59:41','2026-07-09 04:59:41','text'),(3,'80ad4e96-fa17-4bb1-9976-a8bfee50a749',1,2,2,NULL,'hello',0,'br','2026-07-09 05:02:31','2026-07-09 05:02:31','text'),(4,'80ad4e96-fa17-4bb1-9976-a8bfee50a749',1,3,1,NULL,'',0,'','2026-07-09 05:02:50','2026-07-09 05:02:50','image'),(5,'80ad4e96-fa17-4bb1-9976-a8bfee50a749',1,3,1,NULL,'',0,'','2026-07-09 05:02:58','2026-07-09 05:02:58','image'),(6,'efdde58c-20a5-43e4-bbd0-0a3e5598f74d',2,1,3,NULL,'hiiiii',0,'','2026-07-09 09:47:22','2026-07-09 09:47:22','text'),(7,'efdde58c-20a5-43e4-bbd0-0a3e5598f74d',2,5,4,NULL,'hello',0,'br','2026-07-09 09:47:58','2026-07-09 09:47:58','text'),(8,'efdde58c-20a5-43e4-bbd0-0a3e5598f74d',2,1,3,NULL,'hihii',0,'','2026-07-09 09:48:37','2026-07-09 09:48:37','text'),(9,'c6ef18a7-7faa-495d-b92d-4fbe33ee8313',3,6,5,NULL,'hey',0,'ku','2026-07-09 10:01:40','2026-07-09 10:01:40','text'),(10,'c6ef18a7-7faa-495d-b92d-4fbe33ee8313',3,5,6,NULL,'hiii',0,'om','2026-07-09 10:01:51','2026-07-09 10:01:51','text'),(11,'c6ef18a7-7faa-495d-b92d-4fbe33ee8313',3,5,6,NULL,'',0,'','2026-07-09 10:02:24','2026-07-09 10:02:25','image');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2022_12_14_083707_create_settings_table',1),(5,'2024_06_08_162017_create_posts_table',1),(6,'2024_07_25_174509_create_bookmarks_table',1),(7,'2024_07_25_174648_create_data_stats_table',1),(8,'2024_07_31_214941_create_personal_access_tokens_table',1),(9,'2024_10_13_084646_create_social_accounts_table',1),(10,'2024_10_14_064550_create_onboards_table',1),(11,'2024_10_22_091823_create_email_confirmations_table',1),(12,'2024_11_07_064800_create_media_table',1),(13,'2024_11_21_074255_create_post_polls_table',1),(14,'2024_12_18_124342_create_confirmations_table',1),(15,'2024_12_23_090312_create_devices_table',1),(16,'2024_12_29_075605_create_account_deletion_feedback_table',1),(17,'2025_01_13_072444_create_reactions_table',1),(18,'2025_01_14_081142_create_comments_table',1),(19,'2025_01_23_074231_create_follows_table',1),(20,'2025_01_28_123644_create_categories_table',1),(21,'2025_02_03_084633_create_wallets_table',1),(22,'2025_02_03_085638_create_wallet_transactions_table',1),(23,'2025_02_03_114539_create_business_accounts_table',1),(24,'2025_02_05_141922_create_stores_table',1),(25,'2025_02_06_175245_create_products_table',1),(26,'2025_02_11_164525_create_telegraph_bots_table',1),(27,'2025_02_11_164526_create_telegraph_chats_table',1),(28,'2025_02_12_074754_create_chats_table',1),(29,'2025_02_12_080638_create_chat_participants_table',1),(30,'2025_02_13_131121_create_messages_table',1),(31,'2025_02_15_141458_create_hidden_messages_table',1),(32,'2025_02_18_080650_create_blacklist_table',1),(33,'2025_02_18_150945_create_hidden_chats_table',1),(34,'2025_03_02_110717_create_stories_table',1),(35,'2025_03_02_141849_create_story_frames_table',1),(36,'2025_03_07_112332_create_story_views_table',1),(37,'2025_03_13_195529_create_notifications_table',1),(38,'2025_03_29_012810_create_reports_table',1),(39,'2025_04_04_053543_create_link_snapshots_table',1),(40,'2025_04_19_152453_create_jobs_table',1),(41,'2025_04_30_111234_create_payments_table',1),(42,'2025_05_12_083605_create_censors_table',1),(43,'2025_05_21_080048_create_ads_table',1),(44,'2025_05_23_070018_create_currencies_table',1),(45,'2025_05_23_085454_create_locales_table',1),(46,'2025_06_25_054317_create_social_links_table',1),(47,'2025_06_25_092802_create_user_privacy_settings_table',1),(48,'2025_06_25_120655_create_user_permit_settings_table',1),(49,'2025_06_25_123348_create_user_notification_settings_table',1),(50,'2025_06_25_130210_create_user_security_settings_table',1),(51,'2025_08_05_084054_add_is_quoting_to_posts_table',1),(52,'2025_08_28_145057_create_groups_table',1),(53,'2025_09_07_163454_add_type_to_users_table',1),(54,'2025_09_09_090107_create_chat_invites_table',1),(55,'2025_09_11_104921_create_archived_chats_table',1),(56,'2025_09_12_092117_create_authorship_requests_table',1),(57,'2025_09_24_080317_add_status_to_categories_table',1),(58,'2025_11_23_163708_create_pins_table',1),(59,'2026_02_10_140337_create_app_settings',1),(60,'2026_02_25_142431_create_mail_settings',1),(61,'2026_02_26_133830_create_ffmpeg_settings',1),(62,'2026_03_02_131901_create_agent_conversations_table',1),(63,'2026_03_23_071431_create_acquiring_paypal_settings',1),(64,'2026_03_23_071442_create_acquiring_stripe_settings',1),(65,'2026_03_23_071451_create_acquiring_yk_settings',1),(66,'2026_03_23_071500_create_acquiring_rk_settings',1),(67,'2026_04_02_092539_create_google_login_settings',1),(68,'2026_04_02_141053_create_wallet_settings',1),(69,'2026_04_05_072240_create_auth_settings',1),(70,'2026_04_08_141753_add_type_to_messages_table',1),(71,'2026_04_12_080510_create_code_settings',1),(72,'2026_04_14_134045_create_brand_settings',1),(73,'2026_04_20_071824_create_mutes_table',1),(74,'2026_04_20_113719_create_blocks_table',1),(75,'2026_04_24_070931_create_cashouts_table',1),(76,'2026_07_10_055716_add_points_to_users_table',2),(77,'2026_07_10_060044_create_reward_logs_table',2),(78,'2026_07_10_060459_create_reward_settings',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mutes`
--

DROP TABLE IF EXISTS `mutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mutes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `muter_id` bigint unsigned NOT NULL,
  `muted_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_mute` (`muter_id`,`muted_id`),
  KEY `mutes_muted_id_foreign` (`muted_id`),
  CONSTRAINT `mutes_muted_id_foreign` FOREIGN KEY (`muted_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mutes_muter_id_foreign` FOREIGN KEY (`muter_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutes`
--

LOCK TABLES `mutes` WRITE;
/*!40000 ALTER TABLE `mutes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` json NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onboards`
--

DROP TABLE IF EXISTS `onboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `onboards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `step` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onboards`
--

LOCK TABLES `onboards` WRITE;
/*!40000 ALTER TABLE `onboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `onboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `payment_uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deposit',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_user_id_foreign` (`user_id`),
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pins`
--

DROP TABLE IF EXISTS `pins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `pinnable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profile',
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `pinnable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_pin_unique` (`user_id`,`pinnable_id`,`pinnable_type`),
  CONSTRAINT `pins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pins`
--

LOCK TABLES `pins` WRITE;
/*!40000 ALTER TABLE `pins` DISABLE KEYS */;
/*!40000 ALTER TABLE `pins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_polls`
--

DROP TABLE IF EXISTS `post_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_polls` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `choices` json DEFAULT NULL,
  `votes` json DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `is_cancellable` tinyint(1) NOT NULL DEFAULT '1',
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_polls_post_id_foreign` (`post_id`),
  CONSTRAINT `post_polls_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_polls`
--

LOCK TABLES `post_polls` WRITE;
/*!40000 ALTER TABLE `post_polls` DISABLE KEYS */;
INSERT INTO `post_polls` VALUES (2,8,'[{\"percentage\": 50, \"vote_count\": 1, \"choice_text\": \"test4\"}, {\"percentage\": 50, \"vote_count\": 1, \"choice_text\": \"test5\"}, {\"percentage\": 0, \"vote_count\": 0, \"choice_text\": \"trs6\"}]','[{\"user_id\": 2, \"choice_id\": 0, \"percentage\": 0, \"vote_count\": 0, \"times_stamp\": \"2026-07-09T04:55:36.777887Z\"}, {\"user_id\": 3, \"choice_id\": 1, \"percentage\": 0, \"vote_count\": 0, \"times_stamp\": \"2026-07-09T04:56:24.025819Z\"}]','[]',0,1,NULL,'2026-07-09 04:55:17','2026-07-09 04:56:24');
/*!40000 ALTER TABLE `post_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `quote_post_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text_language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `profile_pinned` tinyint(1) NOT NULL DEFAULT '0',
  `global_pinned` tinyint(1) NOT NULL DEFAULT '0',
  `is_sensitive` tinyint(1) NOT NULL DEFAULT '0',
  `is_ai_generated` tinyint(1) NOT NULL DEFAULT '0',
  `views_count` int NOT NULL DEFAULT '0',
  `comments_count` int NOT NULL DEFAULT '0',
  `shares_count` int NOT NULL DEFAULT '0',
  `bookmarks_count` int NOT NULL DEFAULT '0',
  `quotes_count` int NOT NULL DEFAULT '0',
  `preview_lqip_base64` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_quoting` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_quote_post_id_foreign` (`quote_post_id`),
  CONSTRAINT `posts_quote_post_id_foreign` FOREIGN KEY (`quote_post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,NULL,'','hiiii','active','text','om',0,0,0,0,0,14,1,0,0,0,NULL,'2026-07-07 09:18:38','2026-07-09 06:36:02',0),(3,1,NULL,'','','active','image','',0,0,0,0,0,7,0,0,0,0,'data:image/webp;base64,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','2026-07-07 10:14:03','2026-07-09 06:36:02',0),(4,1,NULL,'','','active','image','',0,0,0,0,0,7,1,0,0,0,'data:image/webp;base64,UklGRsIFAABXRUJQVlA4ILYFAABwTgCdASoAAYABP83k622/v7+7JnSau/A5iWdu/ELJW9v7i05eweZL2fz7P2aOlySCg1Uj/ccqNo255od54vLmJB49AhOp3G8ahJBYXiR2SePRwSuMTtTn/X+d60+IFoywen0cQd++mSILk4BF4Y3lIBXU5do8NSHaR1+5nZkqcAUpAEz62MP1kTI5QIyouGvg0XJN6E2gjHD88e7I2R+MGbHLNIVMygbgdYEmGLfmcZFHYXzRFAZRAHqgfhKebL0JaLmJhdEqn8htvspMIJzSmy3oqJIBLOCVEByvP9vm+UOFuz0diLgH9e4fqM2gfFRBF90E2ZXrOjxRAygaOGRg67N5DvFYnF/LlJsAZW0J5BJG9mAX0K8JfqZP5jYp+a8r0J8A17ipzTrCwOnc1UhQL/uEfIEctNLM3NTu5gEP8y6Er41IKvTH1Z+y7NdoEE582IU2aTpkpH6+FIKpJCi9tTPwE8aYMu094XYLhrh1SAsD1H6zMbPpSKczuf1xnzjK6x7pUJmDIT1iiEtCFaV2Z1+Nfo0+oyxOofaSsoy9bQ0JV54n/6F2e0MWLx6cqOYcO9dUNMl9pL84JHe1GcKn0XWISetWlG6DJQ181IWpAkZ4zB23e+CxGV6SRFYUVfkMvuSQvURdFo+VcAMIOGU7kdSBsAijCicFBpzTe3g1RfVFxPktEefIuLs+8yPWuIT5D/Uizxr554D6MyEzS2or7y4PlbfupdCfbwqdBFzAXiNb6wbqw8G3xEoTwoZNEpY4tVUHIgQcPO21Rz7LrS0Z0Mp0eMBJrUQvQqbXvm9GSKkTb4jTe0iej/a7kj2npqHQEec1X+Gaoh/fYAAA/qmkF1aC0EEbK2J97qDQ4lWiJkAOpAhBPqFHWDMNRkgKNAPmaKJkztBTfvleesUa0Z3GN7GO0zz7hjWPwXbJy/WFWGNKRmAyzpP7sI818i5IpQrk77LzIEtGmExcACR/Bl/h5SF8MTNV6Y4U2CRVNaprStyaMwEzrBe9NZ8iukYcOBiszGFNkC4D4SSy4WDVaIBu1jrvAsCUw3F5D73dX8Cx4RMdLUkE11A8ffbVlN90z2fW7wNHyOxL7xC5zCmEMFZpFSpjmmoR/h2oepZF9ypGamxmLLEGgl3FyN4tyhUjBftMupVy6r5IL6arOFoW/k38qFFKnI8f1b/43ZhtT228XjcuiEzwvqDAi3IN9ubQUIm6LsJk4lID9mlN93CrrGOcOJ1K15q4KQhh7iJsw3n0qP47VzneGw6eTMgL+NDJ2wX+dhpcRQUEro9P7pZ2TRt9Z/ozXFerHqO/wMYn7JpPkDVvWijQRC8zQu5bHjAw7se/hf1cX4/Yn2dN520itu5zrdGn3iOZ/d1gBMzClrh44soHN5TdB24ktHcdrfmFiXxKkoNW6znMcrfjhGfCkQcu3VCAIj+YwHoq4Cw7wgRBvLjP3OUnTjHbnvU8U7LyCQxagr4voLxsuD+EA7itZcb0rn9QstdF2cFxrIKlQOpTc3lDyTU/xzXYFoeIhEL9o8nCPfsxuZAGfq0DZW+c+RacwEQjfb8YLrZ7fyN+zT5n0MMgerQnubWQilHxF1MFqfmomzwh37UvKBSlmm82LdaBIGgtiYlJmpJ6B/HhdbbTqse5GZoVkEEpFFFNoL7pUjcTV2OwlNaSgvtGciLqymFQgOilbnbQYIy8zz+4YbeeZhguYVMshKDGxa+nzTf8yF3ZsAGt0M1r31578UnPW84qyACbDLYVhoHIRumI975fLrhQAnrQIHESVyKJBuLYm2eks7jM31xBqPSADpHz3lVmb1BoMFPfdZgE5tNxjWRN0NdD/wRhZ1cFH0uhlBa7z9afA3K0ljDbCMzK0oEXl+Fc/ax8yoDSiQBi3F/mSu7+bYlPjQu/dTco1a9QPfif7jJh/Sc6ViwF4a8yqDgCsLpxiQLqkAAA','2026-07-07 10:15:40','2026-07-09 06:36:02',0),(5,2,NULL,'','','active','image','',0,0,0,0,0,5,0,0,0,0,'data:image/webp;base64,UklGRq4GAABXRUJQVlA4IKIGAABwOACdASoAAZAAP83U4Gg/sq8/rvctE/A5iWQG+Bt3GO3mG0Xlf9Dxv96xY90/7aS89iCMR/d9nkmazn9vPwV9piwZT+zI8TClEz6VNFzm5yiSjTxKPzQoGnuJuK7MlkcSmOxN2R5Gf6A2PKIyhrDTxdCOKZ3W8506uzgPfoo0LUjY+7HnoxKP4SXrDajRrF5Gz6AG8FLuPf0UxLL8V3c0xjHicQiZkU043lH7ZMmXvhL7995lX0HJVXr22OCNPaQjHIhchDPt1YrXibsT53RzDaYITrq3GYT8CnvBBpSD0UfeabLYA4yzyCT6ofdL9kfDz2RXeI/p9Ms4AWoDG6mGTZIOTgdA3/d5N8yGwveZhbSQuA6KSc4pUh/h61um8aVZhNpb6jpFOFrrmniKcXQZg0sQHBw6rwAxG1wdfiqV1zJ/NeFIA5w01LmSLd6x/239ljsg6VpsnkxP9ImKrhB2BdqvIVH9AZvn3HV6/GjNYqZb5DlZLBMekSA2xf9q1EKiodVwlRCw00FNFO+r2HoUNxZ6DaQmdYi8Gpe/YPwh4rzVg8MduSNaTIFi9Xwdasb6KwOQc/CmV6ajvAbYVxpd1ToHi9y1eeT5jeWkAP7mmJybig6kKUIWcb6zfSBbAUmB53ECBRB/lDliGHFKBrNsgN34i4AylxU4DoP5YcJ26Qiw872gLz9nqquj7F/Y8J1BxoLnrWraaP3Vc/HL4geQGIWDjD8Aj2aWMFdNcH1jCGGH/3/RRqyqPlWqrw7vKzIx6ef12w3tas//+i4rKjWvNofmmJPW6DGuoaCWygtwUGLk1S4avIl8mZgYZ8IDarHg47Kq9Wi7DiTvyxkc6NHzJEuy47tEd7O0ojSy0aMCrQr80kq7FbDfF5b5e5hBRBqXgfDpfxT0+jqV5L8qhorxQcVKrBb52W8Z+7hWyMD762vvdyfcVC/fNs71l1Ppvf5T1zorWVFL8Hjn7tFKK7Z0cxeO4ZDQ4dKEJq11AWGQRyH1ddOJZ4KVNAxj2fQKhZMrJibwwPpQFKcVcazm2DIWE2am+tbUrleAaosapkHidS9NIWNc946Gln1A3RoJJj8oR0/A4KPqh/BNbhdsI3Sj8UF1GyjuMlAwguUOnNTerJInBaLq1VYU6FZ3a9clAozEV6zzZPENTT/semcbvNllacNjJgh+aQbFYbzhawryVgpr6zKvF2kLyyX6JNfwnOu8rDbCeBcu3F6JIctBgV1iOZVAUwyq5YLpZZJ5hoAUF5iqxto7Fd7gk8DEClNeT4zDPsW4mlu8G0SdDHEsvxaeGcxrFO4xx7RSEIBcsCaSJVCd4LI6lFECM6pPYqP6wJ6wdEMxKA+WmmhqsA0jd9n/NrQYOHAhU94YzWGgnmSgY231fG6FH04eNR1piQSxT5AHdhHCE93Nvgpqp6ziric6WjBY8zrP7t7SykdIwxoulZ84VofjP2f2PhIBMfHZsd0d8IddDRXV1hCmipxrODRVTbm6QCmLASnXxaTWjvnwS+njL4TGAbvBpAqyN5LQHODfi/P4NyuaCx0MyUwJfHpoGPuYwn2Phn+kQVCV5NJ8Ld7LiGMI3YXd+Pbt97lTJr84jPzDMlw2UrkRcKJqgaPM7dXe78UWX4iJoH4AKDpldboTs/1Gr86C4L/RTv9K2/hnJlFmaP39JjJ07/iwP7cD13GVmugQRcIe2MjKZGQeJJejnPMWZtKoNsL5+2S9z3IYQ9B7R6R3C00PpXDAx7gGsVHdl87CXApptBOpZcboIzvbX14T2UTtWJ04AXIFx9VRotcHnTjjt5of23yld2/K5FuNEKClFgwyD4ax1rylReR+j9rl5oauXtA4XImZyXAmTWPNtYcpV7XcK2L16bkeOkLkaOn27DY6tj3r0tGeUiCikQAHQ5rrpsCzUxTHM5RkvGQtNIzxZOw1ErpH6o3f7BTbL7iqDeDFaNfiLHmidC2trlAOx83WrlBOGiekokH/I/o64DZbjg5bPmveniVHGcVP1jod4QYACQGP0zV+017/OxhwUk8p/FDgOxaUoAPYpH7PWrdMTrtH97nS3YCSWz9ebfvVXcoUhWImXYRuo42meReQubzsXPgRVKOhu45ZP6hno0jXMf1BxC182a63Q8xoIT4ei4utKB8PjUA9D91Ef20kLXJ8WWs9pBoOErbtCIQOyPeXF5Kg40p4p1VPp07/lrh2Qh9pxhaWbG/j7aoCKyM2FAv3DpKE1JFfKSU54Kbf7S2ihGwUqBQ0Ea5AAAA=','2026-07-07 11:29:51','2026-07-09 05:00:13',0),(6,2,NULL,'','','active','image','',0,0,0,0,0,6,1,0,0,0,'data:image/webp;base64,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','2026-07-07 11:30:26','2026-07-09 05:00:13',0),(8,2,NULL,'','testtt','active','poll','et',0,0,0,0,0,2,0,0,0,0,NULL,'2026-07-09 04:55:17','2026-07-09 05:00:13',0),(9,6,NULL,'','','active','image','',0,0,0,0,0,2,0,0,0,0,'data:image/webp;base64,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','2026-07-09 10:05:48','2026-07-09 11:21:47',0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `approval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `views_count` int NOT NULL DEFAULT '0',
  `contacts_count` int NOT NULL DEFAULT '0',
  `reviews_count` int NOT NULL DEFAULT '0',
  `bookmarks_count` int NOT NULL DEFAULT '0',
  `last_contacted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_store_id_foreign` (`store_id`),
  KEY `products_user_id_foreign` (`user_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,2,NULL,5,'testtesttesttest','testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest','approved','active','acceptable','USD',30,'100','0','0','','physical',1,0,0,0,NULL,'2026-07-09 09:07:09','2026-07-09 09:49:20'),(2,NULL,NULL,5,'',NULL,'pending','draft','new','USD',0,'0','0','0',NULL,'physical',1,0,0,0,NULL,'2026-07-09 09:45:29','2026-07-09 09:45:32');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reactable_id` bigint unsigned NOT NULL,
  `reactable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reactions_count` int NOT NULL DEFAULT '0',
  `unified_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `native_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reactions`
--

LOCK TABLES `reactions` WRITE;
/*!40000 ALTER TABLE `reactions` DISABLE KEYS */;
INSERT INTO `reactions` VALUES (1,1,'App\\Models\\Post',1,'1f914',NULL,'[1]','2026-07-07 09:18:50','2026-07-07 09:18:50'),(2,4,'App\\Models\\Post',1,'1f496',NULL,'[1]','2026-07-07 10:16:17','2026-07-07 10:16:17'),(4,5,'App\\Models\\Post',1,'1f496',NULL,'[2]','2026-07-07 11:30:59','2026-07-07 11:30:59'),(5,6,'App\\Models\\Post',1,'1f496',NULL,'[2]','2026-07-07 11:31:10','2026-07-07 11:31:10'),(6,9,'App\\Models\\Message',1,'1f60d',NULL,'[5]','2026-07-09 10:02:20','2026-07-09 10:02:20');
/*!40000 ALTER TABLE `reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reporter_id` bigint unsigned NOT NULL,
  `reportable_id` bigint unsigned NOT NULL,
  `reportable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reason_index` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reporter_comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_reporter_id_foreign` (`reporter_id`),
  CONSTRAINT `reports_reporter_id_foreign` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward_logs`
--

DROP TABLE IF EXISTS `reward_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reward_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reward_logs_user_id_action_type_index` (`user_id`,`action_type`),
  CONSTRAINT `reward_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward_logs`
--

LOCK TABLES `reward_logs` WRITE;
/*!40000 ALTER TABLE `reward_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `payload` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_group_name_unique` (`group`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'app','name',0,'\"MannConnect\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(2,'app','description',0,'\"Social Network Web Application\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(3,'app','keywords',0,'\"social network, social media, news platform, news website\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(4,'app','documentation_url',0,'\"https://docs.colibriplus.social\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(5,'app','timezone',0,'\"UTC\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(6,'app','locale',0,'\"en\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(7,'app','fallback_locale',0,'\"en\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(8,'app','faker_locale',0,'\"en_US\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(9,'app','admin_locale',0,'\"en\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(10,'app','admin_prefix',0,'\"admin\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(11,'app','hide_sensitive_data',0,'false','2026-07-07 07:53:41','2026-07-07 10:26:21'),(12,'app','salt',0,'\"coL88jXc2NSFTGRv3MobRgRW0nv3Odl1\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(13,'app','api_key',0,'\"nOvEv4r67XH0ZawCgXT7zL0CpYOk0ELJhPnx2w0keWpBF73XLQfhs3rTlXW8Vt7g\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(14,'app','version',0,'\"2.1.0\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(15,'app','default_currency',0,'\"USD\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(16,'app','mobile_app_android_link',0,'\"#android\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(17,'app','mobile_app_ios_link',0,'\"#ios\"','2026-07-07 07:53:41','2026-07-07 10:26:21'),(18,'app','pwa_enabled',0,'true','2026-07-07 07:53:41','2026-07-07 10:26:21'),(19,'mail','transport',0,'\"smtp\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(20,'mail','host',0,'\"localhost\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(21,'mail','port',0,'2525','2026-07-07 07:53:41','2026-07-07 07:53:41'),(22,'mail','timeout',0,'60','2026-07-07 07:53:41','2026-07-07 07:53:41'),(23,'mail','username',0,'\"username\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(24,'mail','password',0,'\"password\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(25,'mail','encryption',0,'\"tls\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(26,'mail','from_address',0,'\"noreply@example.com\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(27,'mail','from_name',0,'\"Example\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(28,'mail','local_domain',0,'\"localhost\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(29,'ffmpeg','ffmpeg_path',0,'\"/usr/bin/ffmpeg\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(30,'ffmpeg','ffprobe_path',0,'\"/usr/bin/ffprobe\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(31,'ffmpeg','timeout',0,'3600','2026-07-07 07:53:41','2026-07-07 07:53:41'),(32,'ffmpeg','threads',0,'12','2026-07-07 07:53:41','2026-07-07 07:53:41'),(33,'ffmpeg','temporary_directory',0,'\"/var/ffmpeg-tmp\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(34,'acquiring','paypal_name',0,'\"PayPal\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(35,'acquiring','paypal_status',0,'false','2026-07-07 07:53:41','2026-07-07 07:53:41'),(36,'acquiring','paypal_client_id',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(37,'acquiring','paypal_secret_key',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(38,'acquiring','paypal_mode',0,'\"sandbox\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(39,'acquiring','paypal_webhook',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(40,'acquiring','stripe_name',0,'\"Stripe\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(41,'acquiring','stripe_status',0,'false','2026-07-07 07:53:41','2026-07-07 07:53:41'),(42,'acquiring','stripe_secret_key',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(43,'acquiring','stripe_public_key',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(44,'acquiring','stripe_webhook_tolerance',0,'300','2026-07-07 07:53:41','2026-07-07 07:53:41'),(45,'acquiring','stripe_webhook_secret',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(46,'acquiring','stripe_payment_method_types',0,'\"card, paypal, link\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(47,'acquiring','yk_name',0,'\"YooKassa\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(48,'acquiring','yk_status',0,'false','2026-07-07 07:53:41','2026-07-07 07:53:41'),(49,'acquiring','yk_shop_id',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(50,'acquiring','yk_secret_key',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(51,'acquiring','yk_webhook',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(52,'acquiring','yk_currency',0,'\"RUB\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(53,'acquiring','rk_name',0,'\"Robokassa\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(54,'acquiring','rk_status',0,'false','2026-07-07 07:53:41','2026-07-07 07:53:41'),(55,'acquiring','rk_merchant_login',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(56,'acquiring','rk_pass_one',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(57,'acquiring','rk_pass_two',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(58,'acquiring','rk_currency',0,'\"RUB\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(59,'acquiring','rk_mode',0,'\"sandbox\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(60,'acquiring','rk_webhook',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(61,'google_login','enabled',0,'false','2026-07-07 07:53:41','2026-07-07 07:53:41'),(62,'google_login','client_id',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(63,'google_login','client_secret',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(64,'wallet','name',0,'\"ColibriPay\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(65,'wallet','enabled',0,'true','2026-07-07 07:53:41','2026-07-07 07:53:41'),(66,'wallet','about_link',0,'\"#\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(67,'wallet','wallet_number_prefix',0,'\"CLB\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(68,'wallet','default_balance',0,'0','2026-07-07 07:53:41','2026-07-07 07:53:41'),(69,'wallet','deposit_min_amount',0,'10','2026-07-07 07:53:41','2026-07-07 07:53:41'),(70,'wallet','deposit_max_amount',0,'1000000','2026-07-07 07:53:41','2026-07-07 07:53:41'),(71,'wallet','transfer_min_amount',0,'10','2026-07-07 07:53:41','2026-07-07 07:53:41'),(72,'wallet','transfer_max_amount',0,'1000000','2026-07-07 07:53:41','2026-07-07 07:53:41'),(73,'wallet','commission_deposit',0,'3','2026-07-07 07:53:41','2026-07-07 07:53:41'),(74,'wallet','commission_transfer',0,'1','2026-07-07 07:53:41','2026-07-07 07:53:41'),(75,'wallet','commission_withdraw',0,'3','2026-07-07 07:53:41','2026-07-07 07:53:41'),(76,'wallet','withdraw_min_amount',0,'10','2026-07-07 07:53:41','2026-07-07 07:53:41'),(77,'wallet','withdraw_max_amount',0,'1000000','2026-07-07 07:53:41','2026-07-07 07:53:41'),(78,'wallet','cashout_methods',0,'\"Bank Transfer, PayPal, Stripe\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(79,'auth','captcha_enabled',0,'false','2026-07-07 07:53:41','2026-07-07 07:53:41'),(80,'auth','registration_enabled',0,'true','2026-07-07 07:53:41','2026-07-07 07:53:41'),(81,'auth','login_enabled',0,'true','2026-07-07 07:53:41','2026-07-07 07:53:41'),(82,'auth','reg_verification_enabled',0,'false','2026-07-07 07:53:41','2026-07-07 07:53:41'),(83,'auth','reg_verification_type',0,'\"email\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(84,'auth','switch_account_enabled',0,'false','2026-07-07 07:53:41','2026-07-07 07:53:41'),(85,'auth','link_accounts_enabled',0,'false','2026-07-07 07:53:41','2026-07-07 07:53:41'),(86,'code','header_code',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(87,'code','footer_code',0,'\"\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(88,'code','header_code_enabled',0,'false','2026-07-07 07:53:41','2026-07-07 07:53:41'),(89,'code','footer_code_enabled',0,'false','2026-07-07 07:53:41','2026-07-07 07:53:41'),(90,'brand','dark_theme_enabled',0,'true','2026-07-07 07:53:41','2026-07-07 07:53:41'),(91,'brand','default_theme',0,'\"light\"','2026-07-07 07:53:41','2026-07-07 07:53:41'),(92,'brand','images_watermark_enabled',0,'true','2026-07-07 07:53:41','2026-07-07 07:53:41'),(93,'brand','videos_watermark_enabled',0,'true','2026-07-07 07:53:41','2026-07-07 07:53:41'),(95,'reward','registration',0,'10','2026-07-10 06:14:28','2026-07-10 06:14:28'),(96,'reward','email_verification',0,'10','2026-07-10 06:14:28','2026-07-10 06:14:28'),(97,'reward','mobile_verification',0,'20','2026-07-10 06:14:28','2026-07-10 06:14:28'),(98,'reward','profile_photo_upload',0,'10','2026-07-10 06:14:28','2026-07-10 06:14:28'),(99,'reward','complete_profile',0,'50','2026-07-10 06:14:28','2026-07-10 06:14:28'),(100,'reward','daily_login',0,'5','2026-07-10 06:14:28','2026-07-10 06:14:28'),(101,'reward','create_post',0,'10','2026-07-10 06:14:28','2026-07-10 06:14:28'),(102,'reward','upload_image_post',0,'15','2026-07-10 06:14:28','2026-07-10 06:14:28'),(103,'reward','upload_video_post',0,'20','2026-07-10 06:14:28','2026-07-10 06:14:28'),(104,'reward','receive_like',0,'1','2026-07-10 06:14:28','2026-07-10 06:14:28'),(105,'reward','receive_comment',0,'2','2026-07-10 06:14:28','2026-07-10 06:14:28'),(106,'reward','share_content',0,'5','2026-07-10 06:14:28','2026-07-10 06:14:28'),(107,'reward','refer_new_user',0,'100','2026-07-10 06:14:28','2026-07-10 06:14:28');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_accounts`
--

DROP TABLE IF EXISTS `social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `provider_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_accounts_user_id_foreign` (`user_id`),
  CONSTRAINT `social_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_accounts`
--

LOCK TABLES `social_accounts` WRITE;
/*!40000 ALTER TABLE `social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_links`
--

DROP TABLE IF EXISTS `social_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `linkable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkable_id` bigint unsigned NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_links`
--

LOCK TABLES `social_links` WRITE;
/*!40000 ALTER TABLE `social_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `products_count` int NOT NULL DEFAULT '0',
  `reviews_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stores_user_id_foreign` (`user_id`),
  CONSTRAINT `stores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stories`
--

DROP TABLE IF EXISTS `stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `story_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `stories_user_id_foreign` (`user_id`),
  CONSTRAINT `stories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stories`
--

LOCK TABLES `stories` WRITE;
/*!40000 ALTER TABLE `stories` DISABLE KEYS */;
INSERT INTO `stories` VALUES (1,'9d8a07c6-819d-4776-8bb6-823144efeb5c',1,'2026-07-09 07:18:07'),(2,'bd5cc301-1c40-4961-8d53-32f3d8e0aa5c',2,'2026-07-09 07:18:47'),(3,'6c501ede-4ae3-442e-952a-884b31b9eb5e',3,'2026-07-07 11:26:15'),(4,'84879b57-0b94-42e2-8d48-b43b8173e5b5',4,'2026-07-07 11:51:57'),(5,'5e83d1b1-c6a2-43f0-91ef-9e79f14cfb54',5,'2026-07-09 07:50:17'),(6,'e7268c7f-88fc-4cf2-be44-9e3c690fb35f',6,'2026-07-09 07:51:28');
/*!40000 ALTER TABLE `stories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story_frames`
--

DROP TABLE IF EXISTS `story_frames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `story_frames` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `story_id` bigint unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `privacy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `views_count` int NOT NULL DEFAULT '0',
  `is_highlight` tinyint(1) NOT NULL DEFAULT '0',
  `duration_seconds` int NOT NULL DEFAULT '0',
  `meta` json NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `story_frames_story_id_foreign` (`story_id`),
  CONSTRAINT `story_frames_story_id_foreign` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story_frames`
--

LOCK TABLES `story_frames` WRITE;
/*!40000 ALTER TABLE `story_frames` DISABLE KEYS */;
INSERT INTO `story_frames` VALUES (1,1,'','active','image','all',1,0,10,'[]','2026-07-07 08:32:44','2026-07-08 10:19:01'),(2,1,'','active','image','all',0,0,10,'[]','2026-07-07 10:19:23','2026-07-08 10:34:34'),(3,1,'😍','active','image','all',1,0,10,'[]','2026-07-07 10:34:36','2026-07-10 07:14:16'),(5,2,'','active','image','all',0,0,10,'[]','2026-07-07 11:04:06','2026-07-08 11:31:39'),(6,3,NULL,'draft','image','all',0,0,0,'[]','2026-07-07 11:26:15',NULL),(7,2,'','active','image','all',0,0,10,'[]','2026-07-07 11:31:48','2026-07-10 07:18:48'),(8,4,NULL,'draft','image','all',0,0,0,'[]','2026-07-07 11:51:57',NULL),(9,1,'','active','image','all',0,0,10,'[]','2026-07-09 07:14:18','2026-07-10 07:17:48'),(10,1,'','active','image','all',0,0,10,'[]','2026-07-09 07:17:51','2026-07-10 07:18:08'),(11,1,NULL,'draft','image','all',0,0,0,'[]','2026-07-09 07:18:12',NULL),(12,5,'','active','image','all',1,0,10,'[]','2026-07-09 07:20:55','2026-07-10 07:37:05'),(13,6,'','active','image','all',1,0,10,'[]','2026-07-09 07:21:38','2026-07-10 07:51:29'),(14,5,'','active','image','all',1,0,10,'[]','2026-07-09 07:39:44','2026-07-10 07:50:18'),(15,5,NULL,'draft','image','all',0,0,0,'[]','2026-07-09 07:50:27',NULL),(16,6,NULL,'draft','image','all',0,0,0,'[]','2026-07-09 07:52:04',NULL);
/*!40000 ALTER TABLE `story_frames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story_views`
--

DROP TABLE IF EXISTS `story_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `story_views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `story_frame_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `story_views_story_frame_id_foreign` (`story_frame_id`),
  KEY `story_views_user_id_foreign` (`user_id`),
  CONSTRAINT `story_views_story_frame_id_foreign` FOREIGN KEY (`story_frame_id`) REFERENCES `story_frames` (`id`) ON DELETE CASCADE,
  CONSTRAINT `story_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story_views`
--

LOCK TABLES `story_views` WRITE;
/*!40000 ALTER TABLE `story_views` DISABLE KEYS */;
INSERT INTO `story_views` VALUES (1,1,2,'2026-07-07 11:03:21'),(3,3,2,'2026-07-09 07:15:32'),(4,12,6,'2026-07-09 07:38:57'),(5,14,6,'2026-07-09 07:50:41'),(6,13,5,'2026-07-09 07:51:35');
/*!40000 ALTER TABLE `story_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegraph_bots`
--

DROP TABLE IF EXISTS `telegraph_bots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telegraph_bots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telegraph_bots_token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegraph_bots`
--

LOCK TABLES `telegraph_bots` WRITE;
/*!40000 ALTER TABLE `telegraph_bots` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegraph_bots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegraph_chats`
--

DROP TABLE IF EXISTS `telegraph_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telegraph_chats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegraph_bot_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telegraph_chats_chat_id_telegraph_bot_id_unique` (`chat_id`,`telegraph_bot_id`),
  KEY `telegraph_chats_telegraph_bot_id_foreign` (`telegraph_bot_id`),
  CONSTRAINT `telegraph_chats_telegraph_bot_id_foreign` FOREIGN KEY (`telegraph_bot_id`) REFERENCES `telegraph_bots` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegraph_chats`
--

LOCK TABLES `telegraph_chats` WRITE;
/*!40000 ALTER TABLE `telegraph_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegraph_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notification_settings`
--

DROP TABLE IF EXISTS `user_notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notification_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direct_messages` tinyint(1) NOT NULL DEFAULT '0',
  `reactions` tinyint(1) NOT NULL DEFAULT '0',
  `comments` tinyint(1) NOT NULL DEFAULT '0',
  `shared_posts` tinyint(1) NOT NULL DEFAULT '0',
  `followers` tinyint(1) NOT NULL DEFAULT '0',
  `follow_request` tinyint(1) NOT NULL DEFAULT '0',
  `mentions` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_notification_settings_user_id_foreign` (`user_id`),
  CONSTRAINT `user_notification_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification_settings`
--

LOCK TABLES `user_notification_settings` WRITE;
/*!40000 ALTER TABLE `user_notification_settings` DISABLE KEYS */;
INSERT INTO `user_notification_settings` VALUES (1,2,'email',0,0,0,0,0,0,0),(2,2,'push',0,0,0,0,0,0,0),(3,3,'email',0,0,0,0,0,0,0),(4,3,'push',0,0,0,0,0,0,0),(5,4,'email',0,0,0,0,0,0,0),(6,4,'push',0,0,0,0,0,0,0),(7,5,'email',0,0,0,0,0,0,0),(8,5,'push',0,0,0,0,0,0,0),(9,6,'email',0,0,0,0,0,0,0),(10,6,'push',0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `user_notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permit_settings`
--

DROP TABLE IF EXISTS `user_permit_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permit_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `mentions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `followers` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `direct_messages` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `story_replies` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `group_invites` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `payment_transfers` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_permit_settings_user_id_unique` (`user_id`),
  CONSTRAINT `user_permit_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permit_settings`
--

LOCK TABLES `user_permit_settings` WRITE;
/*!40000 ALTER TABLE `user_permit_settings` DISABLE KEYS */;
INSERT INTO `user_permit_settings` VALUES (1,2,'all','approved','all','all','all','all'),(2,3,'all','all','all','all','all','all'),(3,4,'all','all','all','all','all','all'),(4,5,'all','all','all','all','all','all'),(5,6,'all','all','all','all','all','all');
/*!40000 ALTER TABLE `user_permit_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_privacy_settings`
--

DROP TABLE IF EXISTS `user_privacy_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_privacy_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `email_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `phone_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `birthdate_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `country_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `city_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `gender_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `online_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `last_seen_privacy` tinyint(1) NOT NULL DEFAULT '0',
  `search_privacy` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_privacy_settings_user_id_unique` (`user_id`),
  CONSTRAINT `user_privacy_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_privacy_settings`
--

LOCK TABLES `user_privacy_settings` WRITE;
/*!40000 ALTER TABLE `user_privacy_settings` DISABLE KEYS */;
INSERT INTO `user_privacy_settings` VALUES (1,2,0,0,0,0,0,0,0,0,0),(2,3,0,0,0,0,0,0,0,0,0),(3,4,0,0,0,0,0,0,0,0,0),(4,5,0,0,0,0,0,0,0,0,0),(5,6,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `user_privacy_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_security_settings`
--

DROP TABLE IF EXISTS `user_security_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_security_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `2fa` tinyint(1) NOT NULL DEFAULT '0',
  `2fa_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  `login_notification` tinyint(1) NOT NULL DEFAULT '0',
  `login_notification_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  PRIMARY KEY (`id`),
  KEY `user_security_settings_user_id_foreign` (`user_id`),
  CONSTRAINT `user_security_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_security_settings`
--

LOCK TABLES `user_security_settings` WRITE;
/*!40000 ALTER TABLE `user_security_settings` DISABLE KEYS */;
INSERT INTO `user_security_settings` VALUES (1,2,0,'email',0,'email'),(2,3,0,'email',0,'email'),(3,4,0,'email',0,'email'),(4,5,0,'email',0,'email'),(5,6,0,'email',0,'email');
/*!40000 ALTER TABLE `user_security_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `owner_account_id` bigint unsigned DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'onboarding',
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `verified_at` timestamp NULL DEFAULT NULL,
  `tips` json NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light',
  `publications_count` bigint unsigned NOT NULL DEFAULT '0',
  `followers_count` bigint unsigned NOT NULL DEFAULT '0',
  `points` bigint unsigned NOT NULL DEFAULT '0',
  `referred_by` bigint unsigned DEFAULT NULL,
  `following_count` bigint unsigned NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'reader',
  PRIMARY KEY (`id`),
  KEY `users_referred_by_foreign` (`referred_by`),
  CONSTRAINT `users_referred_by_foreign` FOREIGN KEY (`referred_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'neha','active','User','nehaaaa','@nehaaaa',NULL,'','IN','alwar','1','01','2019',NULL,'female','admin@example.com','','','2026-07-10 09:12:24','0.0.0.0','en','uploads/users/avatars/cb95af36-fc69-4094-b5c0-29fb786baf1d.webp',NULL,0,NULL,'[]','2026-07-07 07:57:06','$2y$12$7cenPbgHrDQt9sFb29BkBOF7jLK/4FDJan7SFVtbsyYyWmg8G8p5S','admin','light',3,0,0,NULL,1,'MU1fYJ4WZ0AUopCGZXK97RPvNcyEAGCcF7v6BtKBuxMtRez0T5xXJfBvoxcS',NULL,'2026-07-07 07:57:06','2026-07-10 09:12:24','author'),(2,NULL,'neha','active','','nehapanwal02','',NULL,'','US','New York','1','01','2024',NULL,'female','nehapanwal02@gmail.com','','','2026-07-09 07:21:07','169.150.207.210','en','uploads/users/avatars/7c2bf442-914e-43a2-b718-e2d3ecb7c6fe.webp','uploads/users/covers/bbbad929-2e75-43e1-9ebb-c561e07e115b.webp',0,NULL,'[]',NULL,'$2y$12$fy7APzRmNWhrW6WveeEv0ey1k6GP/tkeQgAWyYcv6hn3HSQ1NEcGu','user','light',3,1,0,NULL,0,'af6f3MdKqSuoZW2Ou9TJXAgWA7Bcw6JvnWyC86EKKdPX9r8cZRss8vjuqHRS',NULL,'2026-07-07 11:02:46','2026-07-09 07:21:07','author'),(3,NULL,'Neha panwal','active','','nehapanwal','',NULL,'','US','New York','1','01','2026',NULL,'female','nehapanwal@gmail.com','','','2026-07-09 06:12:10','169.150.207.210','en',NULL,'assets/covers/default-cover.png',0,NULL,'[]',NULL,'$2y$12$WVeYco4Mup0/IaoD2/ak9e5ELH10sy1nUPzRdOHmrFpAvxx91.eNK','user','light',0,0,0,NULL,0,'yUARSKHZglIR5zmCvH0BmO2GOKeXTz9oAxuQIPPP271fifY4KGJ8x8QEB4ue',NULL,'2026-07-07 11:25:52','2026-07-09 06:12:10','reader'),(4,NULL,'neha','active','','nehapanwal1','',NULL,'','GF','alwar','2','01','2026',NULL,'female','nehapanwal1@gmail.com','','','2026-07-07 11:51:14','169.150.207.210','en',NULL,'assets/covers/default-cover.png',0,NULL,'[]',NULL,'$2y$12$WMzD1n8o9l5KDOvaZzHVmuQxMk7zGMlbxo2rpvlyB18Gp2iQTjObS','user','light',0,0,0,NULL,0,'0YtyyjMtjB7Sd5phF4uPJalcmBb4YeJUhkkc3rKy57pEnFofGMYTBJP8oSyT',NULL,'2026-07-07 11:51:14','2026-07-07 11:52:01','reader'),(5,NULL,'riya','active','','riya','',NULL,'','US','New York','1','02','2026',NULL,'female','neha@gmail.com','','','2026-07-10 07:47:40','192.168.65.1','en',NULL,'assets/covers/default-cover.png',0,NULL,'[]',NULL,'$2y$12$3LRhk.E1FrAa9G6Led7wW.pp7MzQfytktK1/SGM1w0eMaPKwQ/Be.','user','light',0,1,0,NULL,0,'PYHku6BvQSadH2J0UGzsWYOJqYu0VKyh7MVtSDwpO8WIVVoQaMEVrB2xrPSG',NULL,'2026-07-09 07:20:24','2026-07-10 07:47:40','reader'),(6,NULL,'anjali','active','','neha2','',NULL,'','US','New York','1','01','2026',NULL,'female','neha2@gmail.com','','','2026-07-09 10:39:21','192.168.65.1','en',NULL,'assets/covers/default-cover.png',0,NULL,'[]',NULL,'$2y$12$o08DrTR2s6z83Shtrv7WbuLY6nAgtbcMvTmiM1o/u3CK/N22XN72a','user','light',1,0,0,NULL,1,'cM8vOpUTKxBhxqGVgrKHAhbxKj0Fm2PLDkzDXqHO0GjzSxkK08WshfdpnaiG',NULL,'2026-07-09 07:21:15','2026-07-09 10:39:21','reader');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `wallet_id` bigint unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `commission` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deposit',
  `is_internal` tinyint(1) NOT NULL DEFAULT '0',
  `direction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'incoming',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `metadata` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`),
  CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
INSERT INTO `wallet_transactions` VALUES (1,4,20.00,0.00,'USD','advertising',0,'outgoing','completed','{\"ad_id\": 2, \"source\": {\"name\": \"ColibriAds\"}}','2026-07-09 10:36:47','2026-07-09 10:36:47');
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wallets_user_id_wallet_number_unique` (`user_id`,`wallet_number`),
  CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (1,2,0.00,'USD','CLB-RIYEG27HCRXHUMAR'),(2,3,0.00,'USD','CLB-RBJHCSVAKOC2KBPN'),(3,4,0.00,'USD','CLB-XJ9OKOR0XSDJNX4L'),(4,5,0.00,'USD','CLB-3KINPJRKSIHC86LX'),(5,6,300.00,'USD','CLB-ISMPUG4TAWPTGEJR');
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-10  9:24:47
