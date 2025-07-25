/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment_appointment`
--

DROP TABLE IF EXISTS `appointment_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_appointment` (
  `id_appointment` int NOT NULL AUTO_INCREMENT,
  `reference` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nb_places` int NOT NULL DEFAULT '0',
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `id_action_cancelled` int DEFAULT NULL,
  `id_action_reported` int DEFAULT NULL,
  `notification` int NOT NULL DEFAULT '0',
  `id_admin_user` int DEFAULT '0',
  `date_appointment_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_access_code_create` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_user` int NOT NULL,
  `is_surbooked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_appointment`),
  UNIQUE KEY `reference_idx` (`reference`),
  KEY `fk_appointment_appointment_appointment_user_idx` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_appointment`
--

LOCK TABLES `appointment_appointment` WRITE;
/*!40000 ALTER TABLE `appointment_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_appointment_response`
--

DROP TABLE IF EXISTS `appointment_appointment_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_appointment_response` (
  `id_appointment_response` int NOT NULL AUTO_INCREMENT,
  `id_response` int NOT NULL,
  `id_appointment` int NOT NULL,
  PRIMARY KEY (`id_appointment_response`),
  UNIQUE KEY `appointment_appointment_response_unique` (`id_appointment`,`id_response`),
  KEY `fk_appointment_appointment_response_appointment_appointment_idx` (`id_appointment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_appointment_response`
--

LOCK TABLES `appointment_appointment_response` WRITE;
/*!40000 ALTER TABLE `appointment_appointment_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_appointment_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_appointment_slot`
--

DROP TABLE IF EXISTS `appointment_appointment_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_appointment_slot` (
  `id_appointment` int NOT NULL,
  `id_slot` int NOT NULL,
  `nb_places` int NOT NULL,
  PRIMARY KEY (`id_appointment`,`id_slot`),
  KEY `fk_appointment_appointment_slot_slot` (`id_slot`),
  KEY `idx_appointment_slot` (`id_appointment`,`id_slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_appointment_slot`
--

LOCK TABLES `appointment_appointment_slot` WRITE;
/*!40000 ALTER TABLE `appointment_appointment_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_appointment_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_calendar_template`
--

DROP TABLE IF EXISTS `appointment_calendar_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_calendar_template` (
  `id_calendar_template` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `template_path` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_calendar_template`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_calendar_template`
--

LOCK TABLES `appointment_calendar_template` WRITE;
/*!40000 ALTER TABLE `appointment_calendar_template` DISABLE KEYS */;
INSERT INTO `appointment_calendar_template` VALUES
(1,'Calendrier','Calendrier des créneaux disponibles et indisponibles','skin/plugins/appointment/calendar/appointment_form_calendar.html'),
(2,'Calendrier jours ouverts','Calendrier des créneaux disponibles et indisponibles (jours ouverts)','skin/plugins/appointment/calendar/appointment_form_calendar_opendays.html'),
(3,'Liste des creneaux disponibles','Liste des créneaux disponibles','skin/plugins/appointment/calendar/appointment_form_list_open_slots.html'),
(4,'Liste des creneaux disponibles jours ouverts','Liste des créneaux disponibles (jours ouverts)','skin/plugins/appointment/calendar/appointment_form_list_open_slots_opendays.html'),
(5,'Liste des creneaux disponible regroupés','Liste des creneaux disponible regroupés','skin/plugins/appointment/calendar/appointment_form_list_open_slots_grouped.html');
/*!40000 ALTER TABLE `appointment_calendar_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_category`
--

DROP TABLE IF EXISTS `appointment_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `nb_max_appointments_per_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `appointment_category_unique_label` (`label`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_category`
--

LOCK TABLES `appointment_category` WRITE;
/*!40000 ALTER TABLE `appointment_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_closing_day`
--

DROP TABLE IF EXISTS `appointment_closing_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_closing_day` (
  `id_closing_day` int NOT NULL AUTO_INCREMENT,
  `date_of_closing_day` date NOT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_closing_day`),
  UNIQUE KEY `appointment_closing_day_unique` (`id_form`,`date_of_closing_day`),
  KEY `fk_appointment_closing_day_appointment_form_idx` (`id_form`),
  KEY `date_of_closing_day` (`date_of_closing_day`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_closing_day`
--

LOCK TABLES `appointment_closing_day` WRITE;
/*!40000 ALTER TABLE `appointment_closing_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_closing_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_comment`
--

DROP TABLE IF EXISTS `appointment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_comment` (
  `id_comment` int NOT NULL AUTO_INCREMENT,
  `id_form` int NOT NULL DEFAULT '0',
  `starting_validity_date` date NOT NULL,
  `starting_validity_time` time DEFAULT NULL,
  `ending_validity_date` date NOT NULL,
  `ending_validity_time` time DEFAULT NULL,
  `comment` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `comment_creation_date` date NOT NULL,
  `comment_user_creator` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `fk_appointment_comment` (`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_comment`
--

LOCK TABLES `appointment_comment` WRITE;
/*!40000 ALTER TABLE `appointment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_comment_notification_cf`
--

DROP TABLE IF EXISTS `appointment_comment_notification_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_comment_notification_cf` (
  `notify_type` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sender_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb3_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_comment_notification_cf`
--

LOCK TABLES `appointment_comment_notification_cf` WRITE;
/*!40000 ALTER TABLE `appointment_comment_notification_cf` DISABLE KEYS */;
INSERT INTO `appointment_comment_notification_cf` VALUES
('CREATE','noreplay','Notification comment appointment',' '),
('DELETE','noreplay','Notification comment appointment',' '),
('UPDATE','noreplay','Notification comment appointment',' ');
/*!40000 ALTER TABLE `appointment_comment_notification_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_display`
--

DROP TABLE IF EXISTS `appointment_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_display` (
  `id_display` int NOT NULL AUTO_INCREMENT,
  `display_title_fo` tinyint(1) NOT NULL DEFAULT '0',
  `icon_form_content` mediumblob,
  `icon_form_mime_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nb_weeks_to_display` int NOT NULL DEFAULT '0',
  `is_displayed_on_portlet` tinyint(1) NOT NULL DEFAULT '1',
  `id_calendar_template` int NOT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_display`),
  UNIQUE KEY `appointment_display_unique` (`id_form`),
  KEY `fk_appointment_display_appointment_calendar_template_idx` (`id_calendar_template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_display`
--

LOCK TABLES `appointment_display` WRITE;
/*!40000 ALTER TABLE `appointment_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form`
--

DROP TABLE IF EXISTS `appointment_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_form` (
  `id_form` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  `starting_validity_date` date DEFAULT NULL,
  `ending_validity_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `id_workflow` int DEFAULT NULL,
  `workgroup` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_multislot_appointment` tinyint(1) NOT NULL DEFAULT '0',
  `role_fo` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `capacity_per_slot` int NOT NULL DEFAULT '0',
  `nb_consecutive_slots` int NOT NULL DEFAULT '1',
  `is_anonymizable` tinyint(1) NOT NULL DEFAULT '0',
  `anonymization_pattern` varchar(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_form`),
  KEY `starting_validity_date_idx` (`starting_validity_date`),
  KEY `ending_validity_date_idx` (`ending_validity_date`),
  KEY `fk_appointment_form_appointment_category_idx` (`id_category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form`
--

LOCK TABLES `appointment_form` WRITE;
/*!40000 ALTER TABLE `appointment_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form_message`
--

DROP TABLE IF EXISTS `appointment_form_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_form_message` (
  `id_form_message` int NOT NULL AUTO_INCREMENT,
  `calendar_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_firstname_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_firstname_help` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_lastname_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_lastname_help` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_email_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_email_help` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_confirmationEmail_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_confirmationEmail_help` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `text_appointment_created` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `url_redirect_after_creation` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `text_appointment_canceled` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `label_button_redirection` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `no_available_slot` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `calendar_description` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `calendar_reserve_label` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `calendar_full_label` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_form_message`),
  KEY `fk_appointment_form_message_appointment_form_idx` (`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form_message`
--

LOCK TABLES `appointment_form_message` WRITE;
/*!40000 ALTER TABLE `appointment_form_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_form_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form_portlet`
--

DROP TABLE IF EXISTS `appointment_form_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_form_portlet` (
  `id_portlet` int NOT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_portlet`,`id_form`),
  KEY `fk_appointment_form_portlet_appointment_form_idx` (`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form_portlet`
--

LOCK TABLES `appointment_form_portlet` WRITE;
/*!40000 ALTER TABLE `appointment_form_portlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_form_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form_rule`
--

DROP TABLE IF EXISTS `appointment_form_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_form_rule` (
  `id_form_rule` int NOT NULL AUTO_INCREMENT,
  `is_captcha_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_mandatory_email_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_active_authentication` tinyint(1) NOT NULL DEFAULT '0',
  `nb_days_before_new_appointment` int NOT NULL DEFAULT '0',
  `min_time_before_appointment` int NOT NULL DEFAULT '0',
  `nb_max_appointments_per_user` int NOT NULL DEFAULT '0',
  `nb_days_for_max_appointments_per_user` int NOT NULL DEFAULT '0',
  `bo_overbooking` tinyint(1) NOT NULL DEFAULT '0',
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_form_rule`),
  UNIQUE KEY `appointment_form_rule_unique` (`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form_rule`
--

LOCK TABLES `appointment_form_rule` WRITE;
/*!40000 ALTER TABLE `appointment_form_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_form_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_localization`
--

DROP TABLE IF EXISTS `appointment_localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_localization` (
  `id_localization` int NOT NULL AUTO_INCREMENT,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_localization`),
  KEY `fk_appointment_localization_appointment_form_idx` (`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_localization`
--

LOCK TABLES `appointment_localization` WRITE;
/*!40000 ALTER TABLE `appointment_localization` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_reservation_rule`
--

DROP TABLE IF EXISTS `appointment_reservation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_reservation_rule` (
  `id_reservation_rule` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `max_capacity_per_slot` int NOT NULL DEFAULT '0',
  `max_people_per_appointment` int NOT NULL DEFAULT '0',
  `duration_appointments` int NOT NULL DEFAULT '15',
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_reservation_rule`),
  KEY `fk_appointment_reservation_rule_appointment_form_idx` (`id_form`),
  KEY `fk_appointment_working_day_appointment_reservation_rule_idx` (`id_reservation_rule`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_reservation_rule`
--

LOCK TABLES `appointment_reservation_rule` WRITE;
/*!40000 ALTER TABLE `appointment_reservation_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_reservation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_slot`
--

DROP TABLE IF EXISTS `appointment_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_slot` (
  `id_slot` int NOT NULL AUTO_INCREMENT,
  `starting_date_time` timestamp NULL DEFAULT NULL,
  `ending_date_time` timestamp NULL DEFAULT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `is_specific` tinyint(1) NOT NULL DEFAULT '0',
  `max_capacity` int NOT NULL DEFAULT '0',
  `nb_remaining_places` int NOT NULL DEFAULT '0',
  `nb_potential_remaining_places` int NOT NULL DEFAULT '0',
  `nb_places_taken` int NOT NULL DEFAULT '0',
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_slot`),
  UNIQUE KEY `appointment_slot_unique_starting` (`id_form`,`starting_date_time`),
  UNIQUE KEY `appointment_slot_unique_ending` (`id_form`,`ending_date_time`),
  KEY `fk_appointment_slot_appointment_form_idx` (`id_form`),
  KEY `starting_date_time_idx` (`starting_date_time`),
  KEY `ending_date_time_idx` (`ending_date_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_slot`
--

LOCK TABLES `appointment_slot` WRITE;
/*!40000 ALTER TABLE `appointment_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_time_slot`
--

DROP TABLE IF EXISTS `appointment_time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_time_slot` (
  `id_time_slot` int NOT NULL AUTO_INCREMENT,
  `starting_time` time NOT NULL,
  `ending_time` time NOT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `max_capacity` int NOT NULL DEFAULT '0',
  `id_working_day` int NOT NULL,
  PRIMARY KEY (`id_time_slot`),
  UNIQUE KEY `appointment_time_slot_unique_starting` (`id_working_day`,`starting_time`),
  UNIQUE KEY `appointment_time_slot_unique_ending` (`id_working_day`,`ending_time`),
  KEY `fk_appointment_time_slot_appointment_working_day_idx` (`id_working_day`),
  KEY `starting_time_idx` (`starting_time`),
  KEY `ending_time_idx` (`ending_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_time_slot`
--

LOCK TABLES `appointment_time_slot` WRITE;
/*!40000 ALTER TABLE `appointment_time_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_user`
--

DROP TABLE IF EXISTS `appointment_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `email_idx` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_user`
--

LOCK TABLES `appointment_user` WRITE;
/*!40000 ALTER TABLE `appointment_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_week_definition`
--

DROP TABLE IF EXISTS `appointment_week_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_week_definition` (
  `id_week_definition` int NOT NULL AUTO_INCREMENT,
  `id_reservation_rule` int NOT NULL,
  `date_of_apply` date NOT NULL,
  `ending_date_of_apply` date NOT NULL,
  PRIMARY KEY (`id_week_definition`),
  UNIQUE KEY `appointment_week_definition_unique_date` (`id_reservation_rule`,`date_of_apply`),
  KEY `date_of_apply_idx` (`date_of_apply`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_week_definition`
--

LOCK TABLES `appointment_week_definition` WRITE;
/*!40000 ALTER TABLE `appointment_week_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_week_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_working_day`
--

DROP TABLE IF EXISTS `appointment_working_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_working_day` (
  `id_working_day` int NOT NULL AUTO_INCREMENT,
  `day_of_week` int NOT NULL,
  `id_reservation_rule` int NOT NULL,
  PRIMARY KEY (`id_working_day`),
  UNIQUE KEY `appointment_working_day_unique` (`id_reservation_rule`,`day_of_week`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_working_day`
--

LOCK TABLES `appointment_working_day` WRITE;
/*!40000 ALTER TABLE `appointment_working_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_working_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentgru_`
--

DROP TABLE IF EXISTS `appointmentgru_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointmentgru_` (
  `id_appointmentgru` int NOT NULL,
  `guid` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `cuid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_appointmentgru`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentgru_`
--

LOCK TABLES `appointmentgru_` WRITE;
/*!40000 ALTER TABLE `appointmentgru_` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentgru_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_dashboard`
--

DROP TABLE IF EXISTS `core_admin_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_dashboard` (
  `dashboard_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dashboard_column` int NOT NULL,
  `dashboard_order` int NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_dashboard`
--

LOCK TABLES `core_admin_dashboard` WRITE;
/*!40000 ALTER TABLE `core_admin_dashboard` DISABLE KEYS */;
INSERT INTO `core_admin_dashboard` VALUES
('usersAdminDashboardComponent',1,1),
('searchAdminDashboardComponent',1,2),
('editorAdminDashboardComponent',1,3),
('autoIncludesAdminDashboardComponent',1,4),
('featuresAdminDashboardComponent',1,5),
('xslExportAdminDashboardComponent',1,6),
('myluteceAuthenticationFilterAdminDashboardComponent',1,3),
('workflowAdminDashboardComponent',1,1);
/*!40000 ALTER TABLE `core_admin_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_mailinglist`
--

DROP TABLE IF EXISTS `core_admin_mailinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_mailinglist` (
  `id_mailinglist` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `workgroup` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_mailinglist`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_mailinglist`
--

LOCK TABLES `core_admin_mailinglist` WRITE;
/*!40000 ALTER TABLE `core_admin_mailinglist` DISABLE KEYS */;
INSERT INTO `core_admin_mailinglist` VALUES
(1,'admin','admin','all');
/*!40000 ALTER TABLE `core_admin_mailinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_mailinglist_filter`
--

DROP TABLE IF EXISTS `core_admin_mailinglist_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_mailinglist_filter` (
  `id_mailinglist` int NOT NULL DEFAULT '0',
  `workgroup` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_mailinglist`,`workgroup`,`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_mailinglist_filter`
--

LOCK TABLES `core_admin_mailinglist_filter` WRITE;
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` DISABLE KEYS */;
INSERT INTO `core_admin_mailinglist_filter` VALUES
(1,'all','super_admin');
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_right`
--

DROP TABLE IF EXISTS `core_admin_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_right` (
  `id_right` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `level_right` smallint DEFAULT NULL,
  `admin_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_updatable` int NOT NULL DEFAULT '0',
  `plugin_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_feature_group` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `documentation_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_order` int DEFAULT NULL,
  `is_external_feature` smallint DEFAULT '0',
  PRIMARY KEY (`id_right`),
  KEY `index_right` (`level_right`,`admin_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_right`
--

LOCK TABLES `core_admin_right` WRITE;
/*!40000 ALTER TABLE `core_admin_right` DISABLE KEYS */;
INSERT INTO `core_admin_right` VALUES
('CORE_ADMIN_SITE','portal.site.adminFeature.admin_site.name',2,'jsp/admin/site/AdminSite.jsp','portal.site.adminFeature.admin_site.description',1,NULL,'SITE','ti ti-home-edit','jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-site',1,0),
('CORE_ADMINDASHBOARD_MANAGEMENT','portal.admindashboard.adminFeature.right_management.name',0,NULL,'portal.admindashboard.adminFeature.right_management.description',0,'','SYSTEM','ti ti-dashboard',NULL,2,0),
('CORE_CACHE_MANAGEMENT','portal.system.adminFeature.cache_management.name',0,'jsp/admin/system/ManageCaches.jsp','portal.system.adminFeature.cache_management.description',1,'','SYSTEM','ti ti-clock-edit',NULL,0,0),
('CORE_DAEMONS_MANAGEMENT','portal.system.adminFeature.daemons_management.name',0,'jsp/admin/system/ManageDaemons.jsp','portal.system.adminFeature.daemons_management.description',0,'','SYSTEM','ti ti-timeline-event',NULL,1,0),
('CORE_DASHBOARD_MANAGEMENT','portal.dashboard.adminFeature.dashboard_management.name',0,NULL,'portal.dashboard.adminFeature.dashboard_management.description',0,'','SYSTEM','ti ti-layout-dashboard',NULL,3,0),
('CORE_EDITORS_MANAGEMENT','portal.admindashboard.editorManagement.right.name',2,NULL,'portal.admindashboard.editorManagement.right.description',1,'','SYSTEM','ti ti-tools',NULL,4,0),
('CORE_FEATURES_MANAGEMENT','portal.admin.adminFeature.features_management.name',0,NULL,'portal.admin.adminFeature.features_management.description',0,'','SYSTEM','ti ti-apps',NULL,0,0),
('CORE_LEVEL_RIGHT_MANAGEMENT','portal.users.adminFeature.level_right_management.name',2,NULL,'portal.users.adminFeature.level_right_management.description',0,'','MANAGERS','ti ti-list-detail',NULL,2,0),
('CORE_LINK_SERVICE_MANAGEMENT','portal.insert.adminFeature.linkService_management.name',2,NULL,'portal.insert.adminFeature.linkService_management.description',0,NULL,NULL,'ti ti-link',NULL,1,0),
('CORE_MAILINGLISTS_MANAGEMENT','portal.mailinglist.adminFeature.mailinglists_management.name',2,'jsp/admin/mailinglist/ManageMailingLists.jsp','portal.mailinglist.adminFeature.mailinglists_management.description',0,'','MANAGERS','ti ti-mail-cog',NULL,3,0),
('CORE_PAGE_TEMPLATE_MANAGEMENT','portal.style.adminFeature.page_template_management.name',0,'jsp/admin/style/ManagePageTemplates.jsp','portal.style.adminFeature.page_template_management.description',0,'','STYLE','ti ti-layout-board',NULL,1,0),
('CORE_PLUGINS_MANAGEMENT','portal.system.adminFeature.plugins_management.name',0,'jsp/admin/system/ManagePlugins.jsp','portal.system.adminFeature.plugins_management.description',1,'','SYSTEM','ti ti-apps-filled',NULL,0,0),
('CORE_PROPERTIES_MANAGEMENT','portal.site.adminFeature.properties_management.name',2,'jsp/admin/ManageProperties.jsp','portal.site.adminFeature.properties_management.description',0,NULL,'SITE','ti ti-checklist','jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-properties',2,0),
('CORE_RBAC_MANAGEMENT','portal.rbac.adminFeature.rbac_management.name',0,'jsp/admin/rbac/ManageRoles.jsp','portal.rbac.adminFeature.rbac_management.description',0,'','MANAGERS','ti ti-user-check',NULL,0,0),
('CORE_RIGHT_MANAGEMENT','portal.users.adminFeature.right_management.name',0,'jsp/admin/features/ManageRights.jsp','portal.users.adminFeature.right_management.description',0,'','MANAGERS','ti ti-gavel',NULL,4,0),
('CORE_ROLES_MANAGEMENT','portal.role.adminFeature.roles_management.name',2,'jsp/admin/role/ManagePageRole.jsp','portal.role.adminFeature.roles_management.description',0,'','USERS','ti ti-list-check',NULL,0,0),
('CORE_SEARCH_INDEXATION','portal.search.adminFeature.indexer.name',0,'jsp/admin/search/ManageSearchIndexation.jsp','portal.search.adminFeature.indexer.description',0,'','SYSTEM','ti ti-settings-search',NULL,0,0),
('CORE_SEARCH_MANAGEMENT','portal.search.adminFeature.search_management.name',0,NULL,'portal.search.adminFeature.search_management.description',0,'','SYSTEM','ti ti-database-search',NULL,0,0),
('CORE_STYLES_MANAGEMENT','portal.style.adminFeature.styles_management.name',0,'jsp/admin/style/ManageStyles.jsp','portal.style.adminFeature.styles_management.description',1,'','STYLE','ti ti-brush',NULL,3,0),
('CORE_STYLESHEET_MANAGEMENT','portal.style.adminFeature.stylesheet_management.name',0,'jsp/admin/style/ManageStyleSheets.jsp','portal.style.adminFeature.stylesheet_management.description',1,'','STYLE','ti ti-file-code',NULL,2,0),
('CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT','portal.templates.adminFeature.ManageAutoIncludes.name',1,NULL,'portal.templates.adminFeature.ManageAutoIncludes.description',1,'','STYLE','ti ti-code-circle-2',NULL,4,0),
('CORE_USERS_MANAGEMENT','portal.users.adminFeature.users_management.name',2,'jsp/admin/user/ManageUsers.jsp','portal.users.adminFeature.users_management.description',1,'','MANAGERS','ti ti-users',NULL,0,0),
('CORE_WORKGROUPS_MANAGEMENT','portal.workgroup.adminFeature.workgroups_management.name',2,'jsp/admin/workgroup/ManageWorkgroups.jsp','portal.workgroup.adminFeature.workgroups_management.description',0,'','MANAGERS','ti ti-users-group',NULL,1,0),
('CORE_XSL_EXPORT_MANAGEMENT','portal.xsl.adminFeature.xsl_export_management.name',2,NULL,'portal.xsl.adminFeature.xsl_export_management.description',1,'','SYSTEM','ti ti-file-export',NULL,5,0),
('CORE_SECURITY_HEADER_MANAGEMENT','portal.system.adminFeature.security_header_management.name',0,'jsp/admin/system/ManageSecurityHeaders.jsp','portal.system.adminFeature.security_header_management.description',1,'','SYSTEM','ti ti-box-align-top',NULL,6,0),
('APPOINTMENT_FORM_MANAGEMENT','appointment.adminFeature.ManageAppointmentForm.name',2,'jsp/admin/plugins/appointment/ManageAppointmentForms.jsp','appointment.adminFeature.ManageAppointmentForm.description',0,'appointment',NULL,NULL,NULL,6,0),
('APPOINTMENT_CALENDAR_TEMPLATE','appointment.adminFeature.manageCalendarTemplates.name',0,'jsp/admin/plugins/appointment/ManageCalendarTemplates.jsp','appointment.adminFeature.manageCalendarTemplates.name',0,'appointment',NULL,NULL,NULL,7,0),
('APPOINTMENT_CATEGORY_MANAGEMENT','appointment.adminFeature.manageCategories.name',2,'jsp/admin/plugins/appointment/ManageAppointmentCategory.jsp','appointment.adminFeature.manageCategories.name',0,'appointment',NULL,NULL,NULL,8,0),
('MULTIVIEW_APPOINTMENT','module.appointment.management.adminFeature.MultiviewAppointment.name',2,'jsp/admin/plugins/appointment/modules/management/MultiviewAppointment.jsp','module.appointment.management.adminFeature.MultiviewAppointment.description',0,'appointment-management',NULL,NULL,NULL,4,0),
('ELASTICDATA_MANAGEMENT','elasticdata.adminFeature.ManageElasticData.name',0,'jsp/admin/plugins/elasticdata/ManageElasticData.jsp','elasticdata.adminFeature.ManageElasticData.description',0,'elasticdata',NULL,NULL,NULL,11,0),
('VIEW_TEMP_FILES','filegenerator.adminFeature.temporary_files.name',2,'jsp/admin/plugins/filegenerator/ManageMyFiles.jsp','filegenerator.adminFeature.temporary_files.description',0,'','SYSTEM',NULL,NULL,0,0),
('ENTRY_TYPE_MANAGEMENT','genericattributes.adminFeature.manageEntryType.name',1,'jsp/admin/plugins/genericattributes/ManageEntryType.jsp','genericattributes.adminFeature.manageEntryType.description',0,'genericattributes',NULL,NULL,NULL,4,0),
('HTMLPAGE_MANAGEMENT','htmlpage.adminFeature.htmlpage_management.name',2,'jsp/admin/plugins/htmlpage/ManageHtmlPage.jsp','htmlpage.adminFeature.htmlpage_management.description',0,'htmlpage',NULL,NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-htmlpage',12,0),
('IDENTITYSTORE_MANAGEMENT','identitystore.adminFeature.ManageIdentities.name',1,'jsp/admin/plugins/identitystore/ManageIdentities.jsp','identitystore.adminFeature.ManageIdentities.description',0,'identitystore',NULL,NULL,NULL,4,0),
('IDENTITYSTORE_ADMIN_MANAGEMENT','identitystore.adminFeature.AdminIdentities.name',1,'jsp/admin/plugins/identitystore/ManageClientApplications.jsp','identitystore.adminFeature.AdminIdentities.description',0,'identitystore',NULL,NULL,NULL,4,0),
('KIBANA_MANAGEMENT','kibana.adminFeature.KibanaDashboard.name',0,'jsp/admin/plugins/kibana/KibanaDashboard.jsp','kibana.adminFeature.KibanaDashboard.description',0,'kibana',NULL,NULL,NULL,13,0),
('KIBANA_RBAC_MANAGEMENT','kibana.adminFeature.ManageKibana.name',1,'jsp/admin/plugins/kibana/ManageDashboards.jsp','kibana.adminFeature.ManageKibana.description',0,'kibana',NULL,NULL,NULL,14,0),
('MATOMO_MANAGEMENT','matomo.adminFeature.ManageMatomo.name',2,'jsp/admin/plugins/matomo/Matomo.jsp','matomo.adminFeature.ManageMatomo.description',0,'matomo',NULL,NULL,NULL,15,0),
('MODULENOTIFYGRUMAPPINGMANAGER_MANAGEMENT','modulenotifygrumappingmanager.adminFeature.ManageModulenotifygrumappingmanager.name',0,'jsp/admin/plugins/modulenotifygrumappingmanager/ManageNotifygruMappingManagers.jsp','modulenotifygrumappingmanager.adminFeature.ManageModulenotifygrumappingmanager.description',0,'modulenotifygrumappingmanager',NULL,NULL,NULL,16,0),
('MYDASHBOARD_PANEL_MANAGEMENT','mydashboard.adminFeature.ManageMydashboardPanel.name',0,'jsp/admin/plugins/mydashboard/ManageMyDashboardPanel.jsp','mydashboard.adminFeature.ManageMydashboardPanel.description',0,'mydashboard',NULL,NULL,NULL,17,0),
('MYLUTECE_MANAGEMENT','mylutece.adminFeature.mylutece_management.name',2,'jsp/admin/plugins/mylutece/ManageMylutece.jsp','mylutece.adminFeature.mylutece_management.description',0,'mylutece',NULL,NULL,NULL,18,0),
('MYLUTECE_MANAGE_AUTHENTICATION_FILTER','mylutece.adminFeature.mylutece_management_authentication_filter.name',3,'jsp/admin/plugins/mylutece/security/ManageAuthenticationFilter.jsp','mylutece.adminFeature.mylutece_management_authentication_filter.description',0,'mylutece',NULL,NULL,NULL,20,0),
('PROFILES_MANAGEMENT','profiles.adminFeature.profiles_management.name',0,'jsp/admin/plugins/profiles/ManageProfiles.jsp','profiles.adminFeature.profiles_management.description',0,'profiles',NULL,NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-profiles',21,0),
('PROFILES_VIEWS_MANAGEMENT','profiles.adminFeature.views_management.name',0,'jsp/admin/plugins/profiles/ManageViews.jsp','profiles.adminFeature.views_management.description',0,'profiles',NULL,NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-profiles',22,0),
('REFERENCELIST_MANAGEMENT','referencelist.adminFeature.ReferenceListManage.name',0,'jsp/admin/plugins/referencelist/ManageReferences.jsp','referencelist.adminFeature.ReferenceListManage.description',0,'referencelist',NULL,NULL,NULL,23,0),
('REGULAR_EXPRESSION_MANAGEMENT','regularexpression.adminFeature.regularexpression_management.name',0,'jsp/admin/plugins/regularexpression/ManageRegularExpression.jsp','regularexpression.adminFeature.regularexpression_management.description',0,'regularexpression',NULL,NULL,NULL,25,0),
('SITELABELS_MANAGEMENT','sitelabels.adminFeature.ManageSiteLabels.name',0,'jsp/admin/plugins/sitelabels/ManageLabels.jsp','sitelabels.adminFeature.ManageSiteLabels.description',0,'sitelabels',NULL,NULL,NULL,24,0),
('SOLR_INDEX_MANAGEMENT','search.solr.adminFeature.title',1,'jsp/admin/search/solr/ManageSearchIndexation.jsp','search.solr.adminFeature.description',0,'solr','SYSTEM',NULL,'',13,0),
('SOLR_CONFIGURATION_MANAGEMENT','search.solr.adminFeature.configuration.title',1,'jsp/admin/search/solr/ManageSearchConfiguration.jsp','search.solr.adminFeature.configuration.description',0,'solr','SYSTEM',NULL,'',14,0),
('SOLR_FIELDS_MANAGEMENT','search.solr.adminFeature.fields.title',1,'jsp/admin/search/solr/ManageSolrFields.jsp','search.solr.adminFeature.fields.description',0,'solr','SYSTEM',NULL,'',15,0),
('SYSTEMINFO_MANAGEMENT','systeminfo.adminFeature.systeminfo_management.name',0,'jsp/admin/plugins/systeminfo/ManageSystemInfo.jsp','systeminfo.adminFeature.systeminfo_management.description',0,'systeminfo',NULL,NULL,NULL,26,0),
('WORKFLOW_MANAGEMENT','workflow.adminFeature.workflow_management.name',3,'jsp/admin/plugins/workflow/ManageWorkflow.jsp','workflow.adminFeature.workflow_management.description',0,'workflow',NULL,NULL,NULL,27,0),
('APPOINTMENT_COMMENT_MANAGEMENT','appointment.adminFeature.manageComment.name',2,'jsp/admin/plugins/appointment/Comments.jsp','appointment.adminFeature.manageComment.name',0,'appointment',NULL,NULL,NULL,9,0),
('APPOINTMENT_SEARCH','module.appointment.management.adminFeature.AppointmentSearch.name',1,'jsp/admin/plugins/appointment/modules/management/AppointmentSearch.jsp','module.appointment.management.adminFeature.AppointmentSearch.description',0,'appointment-management',NULL,NULL,NULL,10,0),
('MYLUTECE_MANAGE_EXTERNAL_APPLICATION','mylutece.adminFeature.mylutece_management_external_application.name',3,'jsp/admin/plugins/mylutece/ManageExternalApplicationUser.jsp','mylutece.adminFeature.mylutece_management_external_application.description',0,'mylutece',NULL,NULL,NULL,19,0);
/*!40000 ALTER TABLE `core_admin_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_role`
--

DROP TABLE IF EXISTS `core_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_role` (
  `role_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_role`
--

LOCK TABLES `core_admin_role` WRITE;
/*!40000 ALTER TABLE `core_admin_role` DISABLE KEYS */;
INSERT INTO `core_admin_role` VALUES
('all_site_manager','Site Manager'),
('super_admin','Super Administrateur'),
('kibana_dashboards_manager','Gestion des tableaux de bords Kibana'),
('assign_roles','Assigner des roles aux utilisateurs'),
('assign_groups','Assigner des groupes aux utilisateurs'),
('mylutece_manager','Gérer les patramètres avancés Mylutece'),
('profiles_manager','Profiles management'),
('profiles_views_manager','Profiles Views management'),
('CREATE_REFERENCE_IMPORT','Import csv file'),
('workflow_manager','Workflow management');
/*!40000 ALTER TABLE `core_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_role_resource`
--

DROP TABLE IF EXISTS `core_admin_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_role_resource` (
  `rbac_id` int NOT NULL AUTO_INCREMENT,
  `role_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `resource_type` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `resource_id` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `permission` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`rbac_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1031 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_role_resource`
--

LOCK TABLES `core_admin_role_resource` WRITE;
/*!40000 ALTER TABLE `core_admin_role_resource` DISABLE KEYS */;
INSERT INTO `core_admin_role_resource` VALUES
(1,'all_site_manager','PAGE','*','VIEW'),
(2,'all_site_manager','PAGE','*','MANAGE'),
(3,'super_admin','INSERT_SERVICE','*','*'),
(4,'all_site_manager','PORTLET_TYPE','*','*'),
(5,'all_site_manager','ADMIN_USER','*','*'),
(6,'all_site_manager','SEARCH_SERVICE','*','*'),
(7,'all_site_manager','XSL_EXPORT','*','*'),
(1026,'super_admin','APPOINTMENT_FORM','*','*'),
(1029,'super_admin','APPOINTMENT_FORM_CREATE','*','*'),
(1030,'kibana_dashboards_manager','kibana_dashboard','*','*'),
(205,'assign_roles','ROLE_TYPE','*','ASSIGN_ROLE'),
(207,'mylutece_manager','MYLUTECE','*','*'),
(150,'profiles_manager','PROFILES','*','*'),
(151,'profiles_views_manager','PROFILES_VIEWS','*','*'),
(165,'CREATE_REFERENCE_IMPORT','REFERENCE_IMPORT','*','*'),
(912,'workflow_manager','WORKFLOW_ACTION_TYPE','*','*'),
(923,'workflow_manager','WORKFLOW_STATE_TYPE','*','*');
/*!40000 ALTER TABLE `core_admin_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_security_header`
--

DROP TABLE IF EXISTS `core_admin_security_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_security_header` (
  `id_security_header` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` varchar(1024) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `page_category` varchar(25) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active` smallint DEFAULT '0',
  PRIMARY KEY (`id_security_header`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_security_header`
--

LOCK TABLES `core_admin_security_header` WRITE;
/*!40000 ALTER TABLE `core_admin_security_header` DISABLE KEYS */;
INSERT INTO `core_admin_security_header` VALUES
(1,'Strict-Transport-Security','max-age=31536000; includeSubDomains','The HTTP Strict-Transport-Security response header (often abbreviated as HSTS) informs browsers that the site should only be accessed using HTTPS, and that any future attempts to access it using HTTP should automatically be converted to HTTPS. The value recommended by OWASP for this header is \'max-age=31536000; includeSubDomains\' and this is the value retained for Lutece. This setting means that the browser should remember that this site and all of his subdomains are only to be accessed using HTTPS for 31536000 seconds (1 year).','page','all',1),
(2,'X-Content-Type-Options','nosniff','The X-Content-Type-Options response HTTP header is a marker used by the server to indicate that the MIME types advertised in the Content-Type headers should be followed and not be changed. The header allows you to avoid MIME type sniffing by saying that the MIME types are deliberately configured. The value recommended by OWASP for this header is \'nosniff\' and this is the value retained for Lutece. \'nosniff\' value will prevent the browser from MIME-sniffing a response away from the declared content-type.','page','all',1),
(3,'Content-Security-Policy','default-src \'self\'; script-src \'self\' \'unsafe-inline\'; style-src \'self\' \'unsafe-inline\'; img-src \'self\' data: blob:; connect-src \'self\' blob:; object-src \'none\'; form-action \'self\'; frame-ancestors \'self\'; upgrade-insecure-requests','The HTTP Content-Security-Policy response header allows website administrators to control resources the user agent is allowed to load for a given page. With a few exceptions, policies mostly involve specifying server origins and script endpoints. This helps guard against cross-site scripting attacks (Cross-site_scripting). The directives recommended by OWASP are \"\"default-src \'self\'; form-action \'self\'; object-src \'none\'; frame-ancestors \'none\'; upgrade-insecure-requests; block-all-mixed-content\"\". For Lutece, the values of the directives of this policy have been defined as close as possible to this recommendation. However, hey are different because they take into account of the specificities of Lutece existing code and more specifically the constraints of tiny mce library that needs specific configuration for this header.','page','all',1),
(4,'X-Permitted-Cross-Domain-Policies','none','This header is used to limit which data external resources, such as Adobe Flash and PDF documents, can access on the domain. The value recommended by OWASP for this header is \'none\' and this is the value retained for Lutece. It means that o policy files are allowed anywhere on the target server, including this master policy file.','page','all',1),
(5,'Referrer-Policy','no-referrer','The Referrer-Policy HTTP header controls how much referrer information (sent with the Referer header) should be included with requests. Aside from the HTTP header, you can set this policy in HTML. The value recommended by OWASP for this header is \'no-referrer\' and this is the value retained for Lutece. The Referer header included with requests will be omitted entirely. No referrer information is sent along with requests.','page','all',1),
(6,'Cross-Origin-Embedder-Policy','require-corp','The HTTP Cross-Origin-Embedder-Policy (COEP) response header configures embedding cross-origin resources into the document. The value recommended by OWASP for this header is \'require-corp\' and this is the value retained for Lutece. It means that a document can only load resources from the same origin (i.e. protocol/scheme + host + port), or resources explicitly marked as loadable from another origin.','page','all',1),
(7,'Cross-Origin-Opener-Policy','same-origin','The HTTP Cross-Origin-Opener-Policy (COOP) response header allows you to ensure a top-level document does not share a browsing context group with cross-origin documents. The value recommended by OWASP for this header is \'same-origin\' and this is the value retained for Lutece. This value permits to isolates the browsing context exclusively to same-origin documents. Cross-origin documents are not loaded in the same browsing context.','page','all',1),
(8,'Cross-Origin-Resource-Policy','same-site','The HTTP Cross-Origin-Resource-Policy response header conveys a desire that the browser blocks no-cors cross-origin/cross-site requests to the given resource. The value recommended by OWASP for this header is \'same-origin\' and the value retained for Lutece is \'same-site\' which means that only requests from the same Site can read the resource. It is less restrictive than \'same-origin\' in order to allow Lutece sub-domains to access to resources.','page','all',1),
(9,'Cache-Control','max-age=0, must-revalidate, no-cache, no-store, private','The Cache-Control HTTP header field holds directives (instructions) — in both requests and responses — that control caching in browsers and shared caches (e.g. Proxies, CDNs). The value recommended by OWASP for this header is \'no-store, max-age=0\'. For Lutece, the directives retained are \'max-age=0, must-revalidate, no-cache, no-store, private\' and are applied to administration front office/back office pages with authentication in order to prevent caching of any information. Theoretically, OWASP recommended directives should be suficient but in practice some browsers may continue to use the cache or don\'t support no-store directive. So, for Lutece, more directives have been added to prevent caching. For instance, the login page of gmail uses the following directives : no-cache, no-store, max-age=0, must-revalidate','page','auth_admin_BO',1),
(10,'Cache-Control','max-age=0, must-revalidate, no-cache, no-store, private','The Cache-Control HTTP header field holds directives (instructions) — in both requests and responses — that control caching in browsers and shared caches (e.g. Proxies, CDNs). The value recommended by OWASP for this header is \'no-store, max-age=0\'. For Lutece, the directives retained are \'max-age=0, must-revalidate, no-cache, no-store, private\' and are applied to administration front office/back office pages with authentication in order to prevent caching of any information. Theoretically, OWASP recommended directives should be suficient but in practice some browsers may continue to use the cache or don\'t support no-store directive. So, for Lutece, more directives have been added to prevent caching. For instance, the login page of gmail uses the following directives : no-cache, no-store, max-age=0, must-revalidate','page','auth_admin_FO',1),
(11,'Clear-Site-Data','\"cache\",\"cookies\",\"storage\"','The Clear-Site-Data header clears browsing data (cookies, storage, cache) associated with the requesting website. It allows web developers to have more control over the data stored by a client browser for their origins. This header is useful for example, during a logout process, in order to ensure that all stored content on the client side like cookies, storage and cache are removed. The value recommended by OWASP for this header is \'\"cache\",\"cookies\",\"storage\"\' and this is the value retained for Lutece. It is added to the front office/back office logout pages of Lutece.','page','logout_BO',1),
(12,'Clear-Site-Data','\"cache\",\"cookies\",\"storage\"','The Clear-Site-Data header clears browsing data (cookies, storage, cache) associated with the requesting website. It allows web developers to have more control over the data stored by a client browser for their origins. This header is useful for example, during a logout process, in order to ensure that all stored content on the client side like cookies, storage and cache are removed. The value recommended by OWASP for this header is \'\"cache\",\"cookies\",\"storage\"\' and this is the value retained for Lutece. It is added to the front office/back office logout pages of Lutece.','page','logout_FO',1),
(13,'Strict-Transport-Security','max-age=31536000; includeSubDomains','The HTTP Content-Security-Policy response header allows website administrators to control resources the user agent is allowed to load for a given page. With a few exceptions, policies mostly involve specifying server origins and script endpoints. This helps guard against cross-site scripting attacks (Cross-site_scripting). The value recommended by OWASP for this header when used as a response of an API call is \'frame-ancestors \'none\'\' and this is the value retained for Lutece. It prevents any domain from framing the response returned by the API call.','rest_api',NULL,1),
(14,'Content-Security-Policy','frame-ancestors \'none\'','The HTTP Strict-Transport-Security response header (often abbreviated as HSTS) informs browsers that the site should only be accessed using HTTPS, and that any future attempts to access it using HTTP should automatically be converted to HTTPS. The value recommended by OWASP for this header when used as a response of an API call is \'max-age=31536000; includeSubDomains\' and this is the value retained for Lutece. This setting means that the browser should remember that this site and all of his subdomains are only to be accessed using HTTPS for 31536000 seconds (1 year).','rest_api',NULL,1);
/*!40000 ALTER TABLE `core_admin_security_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user`
--

DROP TABLE IF EXISTS `core_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `access_code` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(256) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '0',
  `password` mediumtext COLLATE utf8mb3_unicode_ci,
  `locale` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'fr',
  `level_user` smallint NOT NULL DEFAULT '0',
  `reset_password` smallint NOT NULL DEFAULT '0',
  `accessibility_mode` smallint NOT NULL DEFAULT '0',
  `password_max_valid_date` timestamp NULL DEFAULT NULL,
  `account_max_valid_date` bigint DEFAULT NULL,
  `nb_alerts_sent` int NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT '1980-01-01 00:00:00',
  `workgroup_key` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT 'all',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user`
--

LOCK TABLES `core_admin_user` WRITE;
/*!40000 ALTER TABLE `core_admin_user` DISABLE KEYS */;
INSERT INTO `core_admin_user` VALUES
(1,'admin','Admin','admin','admin@lutece.fr',0,'PBKDF2WITHHMACSHA512:210000:7804ba2859d756dfca7e1ee5ff4e67ca:0308ef00bb7a58a2dd692d0353f1bc4a35722033f1f6423ec88e969fcb913b58737bce6b0828eec46b8d46f9c923429ff8e4e22994232063c93fc51f2d8750b5fcb48463a5657d78869bf766db097e91b4999d623b3c35e346827406f9838b48de22f2d9856bb95dbb1461f778ccc8023bba25ae24fb182d43778fe1a12c5883','fr',0,0,0,'2025-11-14 14:02:49',1784360710869,0,'2025-07-18 09:45:11','all'),
(2,'lutece','Lutece','lutece','lutece@lutece.fr',1,'PLAINTEXT:adminadmin','fr',1,0,0,'1980-01-01 00:00:00',NULL,0,'1980-01-01 00:00:00','all'),
(3,'redac','redac','redac','redac@lutece.fr',1,'PLAINTEXT:adminadmin','fr',2,0,0,'1980-01-01 00:00:00',NULL,0,'1980-01-01 00:00:00','all'),
(4,'valid','valid','valid','valid@lutece.fr',1,'PLAINTEXT:adminadmin','fr',3,0,0,'1980-01-01 00:00:00',NULL,0,'1980-01-01 00:00:00','all');
/*!40000 ALTER TABLE `core_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user_anonymize_field`
--

DROP TABLE IF EXISTS `core_admin_user_anonymize_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_user_anonymize_field` (
  `field_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `anonymize` smallint NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user_anonymize_field`
--

LOCK TABLES `core_admin_user_anonymize_field` WRITE;
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` DISABLE KEYS */;
INSERT INTO `core_admin_user_anonymize_field` VALUES
('access_code',1),
('last_name',1),
('first_name',1),
('email',1);
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user_field`
--

DROP TABLE IF EXISTS `core_admin_user_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_user_field` (
  `id_user_field` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_attribute` int DEFAULT NULL,
  `id_field` int DEFAULT NULL,
  `id_file` int DEFAULT NULL,
  `user_field_value` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_user_field`),
  KEY `core_admin_user_field_idx_file` (`id_file`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user_field`
--

LOCK TABLES `core_admin_user_field` WRITE;
/*!40000 ALTER TABLE `core_admin_user_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_user_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user_preferences`
--

DROP TABLE IF EXISTS `core_admin_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_user_preferences` (
  `id_user` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `pref_key` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `pref_value` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_admin_user_preferences` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user_preferences`
--

LOCK TABLES `core_admin_user_preferences` WRITE;
/*!40000 ALTER TABLE `core_admin_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_workgroup`
--

DROP TABLE IF EXISTS `core_admin_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_workgroup` (
  `workgroup_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `workgroup_description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_workgroup`
--

LOCK TABLES `core_admin_workgroup` WRITE;
/*!40000 ALTER TABLE `core_admin_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_workgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_workgroup_user`
--

DROP TABLE IF EXISTS `core_admin_workgroup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_workgroup_user` (
  `workgroup_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`workgroup_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_workgroup_user`
--

LOCK TABLES `core_admin_workgroup_user` WRITE;
/*!40000 ALTER TABLE `core_admin_workgroup_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_workgroup_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_attribute`
--

DROP TABLE IF EXISTS `core_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_attribute` (
  `id_attribute` int NOT NULL AUTO_INCREMENT,
  `type_class_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` mediumtext COLLATE utf8mb3_unicode_ci,
  `help_message` mediumtext COLLATE utf8mb3_unicode_ci,
  `is_mandatory` smallint DEFAULT '0',
  `is_shown_in_search` smallint DEFAULT '0',
  `is_shown_in_result_list` smallint DEFAULT '0',
  `is_field_in_line` smallint DEFAULT '0',
  `attribute_position` int DEFAULT '0',
  `plugin_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `anonymize` smallint DEFAULT NULL,
  PRIMARY KEY (`id_attribute`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_attribute`
--

LOCK TABLES `core_attribute` WRITE;
/*!40000 ALTER TABLE `core_attribute` DISABLE KEYS */;
INSERT INTO `core_attribute` VALUES
(1,'fr.paris.lutece.portal.business.user.attribute.AttributeComboBox','Profil','',0,0,0,0,0,'profiles',NULL);
/*!40000 ALTER TABLE `core_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_attribute_field`
--

DROP TABLE IF EXISTS `core_attribute_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_attribute_field` (
  `id_field` int NOT NULL AUTO_INCREMENT,
  `id_attribute` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DEFAULT_value` mediumtext COLLATE utf8mb3_unicode_ci,
  `is_DEFAULT_value` smallint DEFAULT '0',
  `height` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `max_size_enter` int DEFAULT NULL,
  `is_multiple` smallint DEFAULT '0',
  `field_position` int DEFAULT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_attribute_field`
--

LOCK TABLES `core_attribute_field` WRITE;
/*!40000 ALTER TABLE `core_attribute_field` DISABLE KEYS */;
INSERT INTO `core_attribute_field` VALUES
(1,1,NULL,NULL,0,0,0,0,1,1);
/*!40000 ALTER TABLE `core_attribute_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_connections_log`
--

DROP TABLE IF EXISTS `core_connections_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_connections_log` (
  `access_code` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ip_address` varchar(63) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_status` int DEFAULT NULL,
  KEY `index_connections_log` (`ip_address`,`date_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_connections_log`
--

LOCK TABLES `core_connections_log` WRITE;
/*!40000 ALTER TABLE `core_connections_log` DISABLE KEYS */;
INSERT INTO `core_connections_log` VALUES
('MEGA_USER','0:0:0:0:0:0:0:1','2025-07-17 15:02:17',0);
/*!40000 ALTER TABLE `core_connections_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_dashboard`
--

DROP TABLE IF EXISTS `core_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_dashboard` (
  `dashboard_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dashboard_column` int NOT NULL,
  `dashboard_order` int NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_dashboard`
--

LOCK TABLES `core_dashboard` WRITE;
/*!40000 ALTER TABLE `core_dashboard` DISABLE KEYS */;
INSERT INTO `core_dashboard` VALUES
('CORE_SYSTEM',1,2),
('CORE_USERS',1,1),
('CORE_USER',4,1),
('CORE_PAGES',2,1),
('APPOINTMENT_FORM',3,2),
('WORKFLOW',3,1);
/*!40000 ALTER TABLE `core_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_datastore`
--

DROP TABLE IF EXISTS `core_datastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_datastore` (
  `entity_key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `entity_value` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`entity_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_datastore`
--

LOCK TABLES `core_datastore` WRITE;
/*!40000 ALTER TABLE `core_datastore` DISABLE KEYS */;
INSERT INTO `core_datastore` VALUES
('core.advanced_parameters.password_duration','120'),
('core.advanced_parameters.default_user_level','0'),
('core.advanced_parameters.default_user_notification','1'),
('core.advanced_parameters.default_user_language','fr'),
('core.advanced_parameters.default_user_status','0'),
('core.advanced_parameters.email_pattern','^[\\w_.\\-!\\#$\\%\\&\'\\*\\+\\/\\=\\?\\^\\`\\}\\{\\|\\~]+@[\\w_.\\-]+\\.[\\w]+$'),
('core.advanced_parameters.email_pattern_verify_by',''),
('core.advanced_parameters.force_change_password_reinit','false'),
('core.advanced_parameters.password_minimum_length','8'),
('core.advanced_parameters.password_format_upper_lower_case','false'),
('core.advanced_parameters.password_format_numero','false'),
('core.advanced_parameters.password_format_special_characters','false'),
('core.advanced_parameters.password_history_size',''),
('core.advanced_parameters.maximum_number_password_change',''),
('core.advanced_parameters.tsw_size_password_change',''),
('core.advanced_parameters.use_advanced_security_parameters',''),
('core.advanced_parameters.account_life_time','12'),
('core.advanced_parameters.time_before_alert_account','30'),
('core.advanced_parameters.nb_alert_account','2'),
('core.advanced_parameters.time_between_alerts_account','10'),
('core.advanced_parameters.access_failures_max','3'),
('core.advanced_parameters.access_failures_interval','10'),
('core.advanced_parameters.expired_alert_mail_sender','lutece@nowhere.com'),
('core.advanced_parameters.expired_alert_mail_subject','Votre compte a expiré'),
('core.advanced_parameters.first_alert_mail_sender','lutece@nowhere.com'),
('core.advanced_parameters.first_alert_mail_subject','Votre compte va bientôt expirer'),
('core.advanced_parameters.other_alert_mail_sender','lutece@nowhere.com'),
('core.advanced_parameters.other_alert_mail_subject','Votre compte va bientôt expirer'),
('core.advanced_parameters.account_reactivated_mail_sender','lutece@nowhere.com'),
('core.advanced_parameters.account_reactivated_mail_subject','Votre compte a bien été réactivé'),
('core.advanced_parameters.access_failures_captcha','1'),
('core.advanced_parameters.notify_user_password_expired',''),
('core.advanced_parameters.password_expired_mail_sender','lutece@nowhere.com'),
('core.advanced_parameters.password_expired_mail_subject','Votre mot de passe a expiré'),
('core.advanced_parameters.reset_token_validity','60'),
('core.advanced_parameters.lock_reset_token_to_session','false'),
('core.backOffice.defaultEditor','tinymce6'),
('core.frontOffice.defaultEditor','sceeditor'),
('core_banned_domain_names','yopmail.com'),
('portal.site.site_property.name','LUTECE'),
('portal.site.site_property.meta.author','<author>'),
('portal.site.site_property.meta.copyright','<copyright>'),
('portal.site.site_property.meta.description','<description>'),
('portal.site.site_property.meta.keywords','<keywords>'),
('portal.site.site_property.email','<webmaster email>'),
('portal.site.site_property.noreply_email','no-reply@mydomain.com'),
('portal.site.site_property.home_url','jsp/site/Portal.jsp'),
('portal.site.site_property.admin_home_url','jsp/admin/AdminMenu.jsp'),
('portal.site.site_property.popup_credits.textblock','&lt;credits text&gt;'),
('portal.site.site_property.popup_legal_info.copyright.textblock','&lt;copyright text&gt;'),
('portal.site.site_property.popup_legal_info.privacy.textblock','&lt;privacy text&gt;'),
('portal.site.site_property.logo_url','themes/admin/shared/images/logo-header-icon.svg'),
('portal.site.site_property.locale.default','fr'),
('portal.site.site_property.avatar_default','themes/admin/shared/images/unknown.svg'),
('portal.site.site_property.portlet.title.maxlength','75'),
('portal.site.site_property.back_images','themes/admin/tabler/images/bg_login1.svg, themes/admin/tabler/images/bg_login2.svg'),
('portal.site.site_property.bo.showXs.checkbox','1'),
('portal.site.site_property.bo.showXsWarning.checkbox','0'),
('portal.site.site_property.layout.login.image',''),
('portal.site.site_property.layout.menu.checkbox','0'),
('portal.site.site_property.layout.darkmode.checkbox','0'),
('portal.site.site_property.layout.readmode.checkbox','0'),
('portal.site.site_property.layout.user.readmode.show.checkbox','0'),
('portal.site.site_property.layout.user.darkmode.show.checkbox','1'),
('portal.site.site_property.layout.user.menumode.show.checkbox','1'),
('core.cache.status.appointment.appointmentFormCacheService.enabled','1'),
('appointment.site_property.nbplaces','5'),
('core.cache.status.EntryTypeServiceManagerCache.enabled','1'),
('core.plugins.status.identitystore.installed','true'),
('leaflet.icon.icons.default.installed','true'),
('leaflet.icon.icons.red.installed','true'),
('leaflet.icon.icons.yellow.installed','true'),
('leaflet.icon.icons.green.installed','true'),
('mylutece.security.public_url.mylutece.url.login.page','jsp/site/Portal.jsp?page=mylutece&action=login'),
('mylutece.security.public_url.mylutece.url.doLogin','jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp'),
('mylutece.security.public_url.mylutece.url.doLogout','jsp/site/plugins/mylutece/DoMyLuteceLogout.jsp'),
('mylutece.security.public_url.mylutece.url.createAccount.page','jsp/site/Portal.jsp?page=mylutece&action=createAccount'),
('mylutece.security.public_url.mylutece.url.modifyAccount.page','jsp/site/Portal.jsp?page=mylutece&action=modifyAccount'),
('mylutece.security.public_url.mylutece.url.lostPassword.page','jsp/site/Portal.jsp?page=mylutece&action=lostPassword'),
('mylutece.security.public_url.mylutece.url.lostLogin.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=lostLogin'),
('mylutece.security.public_url.mylutece.url.doActionsAll','jsp/site/plugins/mylutece/Do*'),
('core.cache.status.PortalMenuService.enabled','1'),
('core.cache.status.PortletCacheService.enabled','0'),
('core.cache.status.StaticFilesCachingFilter.timeToLiveSeconds','604800'),
('core.cache.status.MyPortalWidgetContentService.enabled','1'),
('core.cache.status.PageCachingFilter.enabled','0'),
('core.cache.status.MailAttachmentCacheService.timeToLiveSeconds','7200'),
('core.cache.status.MailAttachmentCacheService.overflowToDisk','true'),
('core.cache.status.MailAttachmentCacheService.maxElementsInMemory','10'),
('core.cache.status.MailAttachmentCacheService.enabled','1'),
('core.cache.status.BaseUserPreferencesCacheService.enabled','1'),
('core.cache.status.MailAttachmentCacheService.diskPersistent','true'),
('core.cache.status.StaticFilesCachingFilter.enabled','1'),
('core.cache.status.LinksIncludeCacheService.enabled','1'),
('core.cache.status.MyPortalWidgetService.enabled','1'),
('core.cache.status.LuteceUserCacheService.maxElementsInMemory','1000'),
('core.cache.status.LuteceUserCacheService.enabled','1'),
('core.cache.status.pathCacheService.enabled','1'),
('core.cache.status.BaseUserPreferencesCacheService.maxElementsInMemory','1000'),
('core.cache.status.SiteMapService.enabled','1'),
('core.cache.status.PageCacheService.enabled','1'),
('core.cache.status.workflow.notifyGruConfigCacheService.enabled','0'),
('core.cache.status.workflow.alertGruConfigCacheService.enabled','0'),
('core.plugins.status.rest.installed','true'),
('core.daemon.indexer.interval','300'),
('core.daemon.indexer.onStartUp','true'),
('core.daemon.mailSender.interval','86400'),
('core.daemon.mailSender.onStartUp','true'),
('core.daemon.anonymizationDaemon.interval','86400'),
('core.daemon.anonymizationDaemon.onStartUp','false'),
('core.daemon.accountLifeTimeDaemon.interval','86400'),
('core.daemon.accountLifeTimeDaemon.onStartUp','true'),
('core.daemon.threadLauncherDaemon.interval','86400'),
('core.daemon.threadLauncherDaemon.onStartUp','true'),
('core.daemon.notifyHistoryCleanerDaemon.interval','10'),
('core.daemon.notifyHistoryCleanerDaemon.onStartUp','false'),
('core.daemon.AppointmentReminderDaemon.interval','600'),
('core.daemon.AppointmentReminderDaemon.onStartUp','true'),
('core.cache.status.public_image_resource.enabled','0'),
('core.daemon.slotDaemon.interval','86400'),
('core.daemon.slotDaemon.onStartUp','true'),
('matomo.site_property.site.id','1'),
('matomo.site_property.server.http.url','http://localhost:8484/'),
('matomo.site_property.server.https.url','http://localhost:8484/'),
('matomo.site_property.widget.auth.token','cfa9a798abd584817e2eb94d7bc14bb0'),
('core.daemon.crmClientSender.interval','60'),
('core.daemon.crmClientSender.onStartUp','true'),
('core.daemon.automaticActionDaemon.interval','14400'),
('core.daemon.automaticActionDaemon.onStartUp','true'),
('core.daemon.archiveDaemon.interval','86400'),
('core.daemon.archiveDaemon.onStartUp','false'),
('core.daemon.chooseStateActionDaemon.interval','10'),
('core.daemon.chooseStateActionDaemon.onStartUp','false'),
('core.daemon.changeStateDaemon.interval','10'),
('core.daemon.changeStateDaemon.onStartUp','false'),
('core.daemon.fullIndexingDaemon.interval','86400'),
('core.daemon.fullIndexingDaemon.onStartUp','true'),
('core.daemon.incrementalIndexingDaemon.interval','3000'),
('core.daemon.incrementalIndexingDaemon.onStartUp','true'),
('core.daemon.temporaryfilesDaemon.interval','86400'),
('core.daemon.temporaryfilesDaemon.onStartUp','false'),
('core.daemon.solrindexer.interval','86400'),
('core.daemon.solrindexer.onStartUp','true'),
('core.daemon.AlertGruDaemon.interval','86400'),
('core.daemon.AlertGruDaemon.onStartUp','true'),
('core.templates.currentCommonsInclude','Corporate'),
('core.startup.time','18 juil. 2025, 09:41:56'),
('core.cache.status.DatastoreCacheService.enabled','0'),
('core.cache.status.PageCachingFilter(CAUTION:NEVERUSEWITHUSERDYNAMICDATA).enabled','0'),
('core.plugins.status.address.installed','true'),
('core.plugins.status.address-autocomplete.installed','true'),
('core.plugins.status.appointment.installed','true'),
('core.plugins.status.appointment.pool','portal'),
('core.plugins.status.appointment-desk.installed','true'),
('core.plugins.status.appointment-desk.pool','portal'),
('core.plugins.status.appointment-filling.installed','true'),
('core.plugins.status.appointment-filling.pool','portal'),
('core.plugins.status.appointment-mydashboard.installed','true'),
('core.plugins.status.appointment-mydashboard.pool','portal'),
('core.plugins.status.appointment-management.installed','true'),
('core.plugins.status.appointment-management.pool','portal'),
('core.plugins.status.appointment-leaflet.installed','true'),
('core.plugins.status.appointment-solr.installed','true'),
('core.plugins.status.asynchronous-upload.installed','true'),
('core.plugins.status.asynchronous-upload.pool','portal'),
('core.plugins.status.appointmentgru.installed','true'),
('core.plugins.status.appointmentgru.pool','portal'),
('core.plugins.status.appointment-solrsearchapp.installed','true'),
('core.plugins.status.captcha.installed','true'),
('core.plugins.status.crmclient.installed','true'),
('core.plugins.status.crmclient.pool','portal'),
('core.plugins.status.filegenerator.installed','true'),
('core.plugins.status.filegenerator.pool','portal'),
('core.plugins.status.elasticdata-appointment.installed','true'),
('core.plugins.status.elasticdata-appointment.pool','portal'),
('core.plugins.status.elasticdata.installed','true'),
('core.plugins.status.elasticdata.pool','portal'),
('core.plugins.status.genericalert.installed','true'),
('core.plugins.status.genericalert.pool','portal'),
('core.plugins.status.genericattributes.installed','true'),
('core.plugins.status.genericattributes.pool','portal'),
('core.plugins.status.genericattributes-address.installed','true'),
('core.plugins.status.htmlpage.installed','true'),
('core.plugins.status.htmlpage.pool','portal'),
('core.plugins.status.grusupply.installed','true'),
('core.plugins.status.grusupply.pool','portal'),
('core.plugins.status.genericattributes-googlemaps.installed','true'),
('core.plugins.status.jcaptcha.installed','true'),
('core.plugins.status.kibana.installed','true'),
('core.plugins.status.kibana.pool','portal'),
('core.plugins.status.matomo.installed','true'),
('core.plugins.status.lucene.installed','true'),
('core.plugins.status.leaflet.installed','true'),
('core.plugins.status.mermaidjs.installed','true'),
('core.plugins.status.mermaidjs.pool','portal'),
('core.plugins.status.modulenotifygrumappingmanager.installed','true'),
('core.plugins.status.modulenotifygrumappingmanager.pool','portal'),
('core.plugins.status.mydashboard.installed','true'),
('core.plugins.status.mydashboard.pool','portal'),
('core.plugins.status.notifygru-appointment.installed','true'),
('core.plugins.status.notifygru-appointment.pool','portal'),
('core.plugins.status.mylutece-oauth2.installed','true'),
('core.plugins.status.mylutece.installed','true'),
('core.plugins.status.mylutece.pool','portal'),
('core.plugins.status.oauth2.installed','true'),
('core.plugins.status.profiles.installed','true'),
('core.plugins.status.profiles.pool','portal'),
('core.plugins.status.referencelist.installed','true'),
('core.plugins.status.referencelist.pool','portal'),
('core.plugins.status.sitelabels.installed','true'),
('core.plugins.status.regularexpression.installed','true'),
('core.plugins.status.regularexpression.pool','portal'),
('core.plugins.status.systeminfo.installed','true'),
('core.plugins.status.swaggerui.installed','true'),
('core.plugins.status.swaggerui.pool','portal'),
('core.plugins.status.solr.installed','true'),
('core.plugins.status.solr.pool','portal'),
('core.plugins.status.workflow.installed','true'),
('core.plugins.status.workflow.pool','portal'),
('core.plugins.status.workflow-alertgru.installed','true'),
('core.plugins.status.workflow-alertgru.pool','portal'),
('core.plugins.status.workflow-appointment.installed','true'),
('core.plugins.status.workflow-appointment.pool','portal'),
('core.plugins.status.workflow-rest.installed','true'),
('core.plugins.status.workflow-notifygru.installed','true'),
('core.plugins.status.workflow-notifygru.pool','portal'),
('core.cache.status.XMLTransformerCacheService(XSLT).enabled','1'),
('themecitelibre.site_property.footer.cookieLink','#cookiecitelibrepack'),
('themecitelibre.site_property.footer.cookieLabel','Cookies management'),
('themecitelibre.site_property.footer.about.title','A propos'),
('themecitelibre.site_property.footer.about','CiteLibre is made for cities, by cities, upon open source principals. <br> <a class=\"btn btn-link ps-0\" href=\"//:lutece.paris.fr\" title=\"[#i18n{portal.site.portal_footer.newWindow}] LUTECE website\" target=\"_blank><img src=\"images/poweredby.png\" alt=\"Powered by LUTECE\"></a> '),
('themecitelibre.site_property.bannerMessage.Type','info'),
('themecitelibre.site_property.bannerMessage.Title',''),
('themecitelibre.site_property.bannerMessage.Position','bottom-right'),
('themecitelibre.site_property.bannerMessage.htmlblock',''),
('themecitelibre.site_property.bannerMessage.CloseButton.checkbox','1'),
('themecitelibre.site_property.footer.links.title','Liens importants'),
('themecitelibre.site_property.robotIndex.checkbox','1'),
('core.plugins.status.themecitelibre.installed','true');
/*!40000 ALTER TABLE `core_datastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_feature_group`
--

DROP TABLE IF EXISTS `core_feature_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_feature_group` (
  `id_feature_group` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `feature_group_description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `feature_group_label` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `feature_group_order` int DEFAULT NULL,
  `feature_group_icon` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_feature_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_feature_group`
--

LOCK TABLES `core_feature_group` WRITE;
/*!40000 ALTER TABLE `core_feature_group` DISABLE KEYS */;
INSERT INTO `core_feature_group` VALUES
('CONTENT','portal.features.group.content.description','portal.features.group.content.label',1,'ti ti-files'),
('APPLICATIONS','portal.features.group.applications.description','portal.features.group.applications.label',3,'ti ti-apps'),
('SYSTEM','portal.features.group.system.description','portal.features.group.system.label',7,'ti ti-shield-lock '),
('SITE','portal.features.group.site.description','portal.features.group.site.label',2,'ti ti-world'),
('STYLE','portal.features.group.charter.description','portal.features.group.charter.label',6,'ti ti-brush'),
('USERS','portal.features.group.users.description','portal.features.group.users.label',4,'ti ti-users'),
('MANAGERS','portal.features.group.managers.description','portal.features.group.managers.label',5,'ti ti-user-shield');
/*!40000 ALTER TABLE `core_feature_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_file`
--

DROP TABLE IF EXISTS `core_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_file` (
  `id_file` int NOT NULL AUTO_INCREMENT,
  `title` mediumtext COLLATE utf8mb3_unicode_ci,
  `id_physical_file` int DEFAULT NULL,
  `file_size` int DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_file`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_file`
--

LOCK TABLES `core_file` WRITE;
/*!40000 ALTER TABLE `core_file` DISABLE KEYS */;
INSERT INTO `core_file` VALUES
(125,'export_users_csv.xml',125,2523,'application/xml','2005-10-10 10:10:10','INIT_CORE'),
(126,'export_users_xml.xml',126,259,'application/xml','2005-10-10 10:10:10','INIT_CORE');
/*!40000 ALTER TABLE `core_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_id_generator`
--

DROP TABLE IF EXISTS `core_id_generator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_id_generator` (
  `class_name` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `current_value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`class_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_id_generator`
--

LOCK TABLES `core_id_generator` WRITE;
/*!40000 ALTER TABLE `core_id_generator` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_id_generator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_indexer_action`
--

DROP TABLE IF EXISTS `core_indexer_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_indexer_action` (
  `id_action` int NOT NULL AUTO_INCREMENT,
  `id_document` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_task` int NOT NULL DEFAULT '0',
  `indexer_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_portlet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_indexer_action`
--

LOCK TABLES `core_indexer_action` WRITE;
/*!40000 ALTER TABLE `core_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_level_right`
--

DROP TABLE IF EXISTS `core_level_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_level_right` (
  `id_level` smallint NOT NULL DEFAULT '0',
  `name` varchar(80) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_level_right`
--

LOCK TABLES `core_level_right` WRITE;
/*!40000 ALTER TABLE `core_level_right` DISABLE KEYS */;
INSERT INTO `core_level_right` VALUES
(0,'Level 0 - Technical administrator'),
(1,'Level 1 - Fonctionnal administrator'),
(2,'Level 2 - Site Manager - Webmaster'),
(3,'Level 3 - Contributor');
/*!40000 ALTER TABLE `core_level_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_mail_item`
--

DROP TABLE IF EXISTS `core_mail_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_mail_item` (
  `id_mail_queue` int NOT NULL DEFAULT '0',
  `mail_item` mediumblob,
  PRIMARY KEY (`id_mail_queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mail_item`
--

LOCK TABLES `core_mail_item` WRITE;
/*!40000 ALTER TABLE `core_mail_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_mail_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_mail_queue`
--

DROP TABLE IF EXISTS `core_mail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_mail_queue` (
  `id_mail_queue` int NOT NULL AUTO_INCREMENT,
  `is_locked` smallint DEFAULT '0',
  PRIMARY KEY (`id_mail_queue`),
  KEY `is_locked_core_mail_queue` (`is_locked`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mail_queue`
--

LOCK TABLES `core_mail_queue` WRITE;
/*!40000 ALTER TABLE `core_mail_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_mail_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_mode`
--

DROP TABLE IF EXISTS `core_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_mode` (
  `id_mode` int NOT NULL DEFAULT '0',
  `description_mode` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `path` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `output_xsl_method` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `output_xsl_version` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `output_xsl_media_type` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `output_xsl_encoding` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `output_xsl_indent` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `output_xsl_omit_xml_dec` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `output_xsl_standalone` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mode`
--

LOCK TABLES `core_mode` WRITE;
/*!40000 ALTER TABLE `core_mode` DISABLE KEYS */;
INSERT INTO `core_mode` VALUES
(0,'Normal','normal/','xml','1.0','text/xml','UTF-8','yes','yes',NULL),
(1,'Administration','admin/','xml','1.0','text/xml','UTF-8','yes','yes',NULL),
(2,'Wap','wml/','xml','1.0','text/xml','UTF-8','yes','yes',NULL);
/*!40000 ALTER TABLE `core_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_page`
--

DROP TABLE IF EXISTS `core_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_page` (
  `id_page` int NOT NULL AUTO_INCREMENT,
  `id_parent` int DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb3_unicode_ci,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint DEFAULT NULL,
  `page_order` int DEFAULT '0',
  `id_template` int DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `role` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code_theme` varchar(80) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `node_status` smallint NOT NULL DEFAULT '1',
  `image_content` mediumblob,
  `mime_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT 'NULL',
  `meta_keywords` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_authorization_node` int DEFAULT NULL,
  `display_date_update` smallint NOT NULL DEFAULT '0',
  `is_manual_date_update` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_page`),
  KEY `index_page` (`id_template`,`id_parent`),
  KEY `index_childpage` (`id_parent`,`page_order`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_page`
--

LOCK TABLES `core_page` WRITE;
/*!40000 ALTER TABLE `core_page` DISABLE KEYS */;
INSERT INTO `core_page` VALUES
(1,0,'Home','Home Page','2025-07-17 12:02:26',1,1,1,'2025-07-17 12:02:26','none','default',0,'','application/octet-stream',NULL,NULL,1,0,0),
(2,1,'Page 1','A child page','2025-07-17 12:02:26',0,1,2,'2025-07-17 12:02:26','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0);
/*!40000 ALTER TABLE `core_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_page_template`
--

DROP TABLE IF EXISTS `core_page_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_page_template` (
  `id_template` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_name` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `picture` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_template`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_page_template`
--

LOCK TABLES `core_page_template` WRITE;
/*!40000 ALTER TABLE `core_page_template` DISABLE KEYS */;
INSERT INTO `core_page_template` VALUES
(1,'Home page','skin/site/page_home_demo.html','layout-home.svg'),
(2,'One column','skin/site/page_template1.html','layout-one.svg'),
(3,'Two columns','skin/site/page_template2.html','layout-two.svg'),
(4,'1 + 2 columns','skin/site/page_template4.html','layout-three.svg'),
(5,'Two equal columns','skin/site/page_template5.html','layout-four.svg');
/*!40000 ALTER TABLE `core_page_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_physical_file`
--

DROP TABLE IF EXISTS `core_physical_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_physical_file` (
  `id_physical_file` int NOT NULL AUTO_INCREMENT,
  `file_value` mediumblob,
  PRIMARY KEY (`id_physical_file`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_physical_file`
--

LOCK TABLES `core_physical_file` WRITE;
/*!40000 ALTER TABLE `core_physical_file` DISABLE KEYS */;
INSERT INTO `core_physical_file` VALUES
(125,'<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:output method=\"text\"/>\r\n	\r\n	<xsl:template match=\"users\">\r\n		<xsl:apply-templates select=\"user\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"user\">\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:value-of select=\"access_code\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"last_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"first_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"email\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"status\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"locale\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"level\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"must_change_password\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"accessibility_mode\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"password_max_valid_date\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"account_max_valid_date\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"date_last_login\" />\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:apply-templates select=\"roles\" />\r\n		<xsl:apply-templates select=\"rights\" />\r\n		<xsl:apply-templates select=\"workgroups\" />\r\n		<xsl:apply-templates select=\"attributes\" />\r\n		<xsl:text>&#10;</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"roles\">\r\n		<xsl:apply-templates select=\"role\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"role\">\r\n		<xsl:text>;\"role:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"rights\">\r\n		<xsl:apply-templates select=\"right\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"right\">\r\n		<xsl:text>;\"right:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"workgroups\">\r\n		<xsl:apply-templates select=\"workgroup\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"workgroup\">\r\n		<xsl:text>;\"workgroup:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attributes\">\r\n		<xsl:apply-templates select=\"attribute\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attribute\">\r\n		<xsl:text>;\"</xsl:text>\r\n		<xsl:value-of select=\"attribute-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-field-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-value\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n</xsl:stylesheet>'),
(126,'<?xml version=\"1.0\" ?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:template match=\"/ | @* | node()\">\r\n		<xsl:copy>\r\n			<xsl:apply-templates select=\"@* | node()\" />\r\n		</xsl:copy>\r\n	</xsl:template>\r\n</xsl:stylesheet>');
/*!40000 ALTER TABLE `core_physical_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portal_component`
--

DROP TABLE IF EXISTS `core_portal_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_portal_component` (
  `id_portal_component` int NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_portal_component`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portal_component`
--

LOCK TABLES `core_portal_component` WRITE;
/*!40000 ALTER TABLE `core_portal_component` DISABLE KEYS */;
INSERT INTO `core_portal_component` VALUES
(0,'Portlet'),
(1,'Article'),
(2,'Article List Portlet'),
(3,'Menu Init'),
(4,'Main Menu'),
(5,'Breadcrum'),
(6,'Site Map'),
(7,'Tree View'),
(8,'Site Map (Admin mode)');
/*!40000 ALTER TABLE `core_portal_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portlet`
--

DROP TABLE IF EXISTS `core_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_portlet` (
  `id_portlet` int NOT NULL AUTO_INCREMENT,
  `id_portlet_type` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_page` int DEFAULT NULL,
  `name` varchar(70) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint NOT NULL DEFAULT '0',
  `portlet_order` int DEFAULT NULL,
  `column_no` int DEFAULT NULL,
  `id_style` int DEFAULT NULL,
  `accept_alias` smallint DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `display_portlet_title` int NOT NULL DEFAULT '0',
  `role` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `device_display_flags` int NOT NULL DEFAULT '15',
  PRIMARY KEY (`id_portlet`),
  KEY `index_portlet` (`id_page`,`id_portlet_type`,`id_style`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portlet`
--

LOCK TABLES `core_portlet` WRITE;
/*!40000 ALTER TABLE `core_portlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portlet_alias`
--

DROP TABLE IF EXISTS `core_portlet_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_portlet_alias` (
  `id_portlet` int NOT NULL DEFAULT '0',
  `id_alias` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_portlet`,`id_alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portlet_alias`
--

LOCK TABLES `core_portlet_alias` WRITE;
/*!40000 ALTER TABLE `core_portlet_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_portlet_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portlet_type`
--

DROP TABLE IF EXISTS `core_portlet_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_portlet_type` (
  `id_portlet_type` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url_creation` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url_update` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `home_class` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `plugin_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url_docreate` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_script` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_specific` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_specific_form` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url_domodify` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modify_script` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modify_specific` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modify_specific_form` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_portlet_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portlet_type`
--

LOCK TABLES `core_portlet_type` WRITE;
/*!40000 ALTER TABLE `core_portlet_type` DISABLE KEYS */;
INSERT INTO `core_portlet_type` VALUES
('ALIAS_PORTLET','portal.site.portletAlias.name','plugins/alias/CreatePortletAlias.jsp','plugins/alias/ModifyPortletAlias.jsp','fr.paris.lutece.portal.business.portlet.AliasPortletHome','alias','plugins/alias/DoCreatePortletAlias.jsp','/admin/portlet/script_create_portlet.html','/admin/portlet/alias/create_portlet_alias.html','','plugins/alias/DoModifyPortletAlias.jsp','/admin/portlet/script_modify_portlet.html','/admin/portlet/alias/modify_portlet_alias.html','','circles-relation'),
('MYDASHBOARD_PORTLET','mydashboard.portlet.myDashboardPortlet.name','plugins/mydashboard/GetCreateMyDashboardPortlet.jsp','plugins/mydashboard/GetModifyMyDashboardPortlet.jsp','fr.paris.lutece.plugins.mydashboard.business.portlet.MyDashboardPortletHome','mydashboard','plugins/mydashboard/DoCreateMyDashboardPortlet.jsp','/admin/portlet/script_create_portlet.html','','','plugins/mydashboard/DoModifyMyDashboardPortlet.jsp','/admin/portlet/script_modify_portlet.html','','',NULL),
('MYLUTECE_PORTLET','mylutece.portlet.name','plugins/mylutece/CreatePortletMyLutece.jsp','plugins/mylutece/ModifyPortletMyLutece.jsp','fr.paris.lutece.plugins.mylutece.business.portlet.MyLutecePortletHome','mylutece','plugins/mylutece/DoCreatePortletMyLutece.jsp','/admin/portlet/script_create_portlet.html','','','plugins/mylutece/DoModifyPortletMyLutece.jsp','/admin/portlet/script_modify_portlet.html','','',NULL),
('APPOINTMENT_PORTLET','appointment.portlet.appointmentAppointmentPortlet.name','plugins/appointment/CreatePortletAppointment.jsp','plugins/appointment/ModifyPortletAppointment.jsp','fr.paris.lutece.plugins.appointment.business.portlet.AppointmentPortletHome','appointment','plugins/appointment/DoCreatePortletAppointment.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/appointment/portlet/create_portletappointment.html','','plugins/appointment/DoModifyPortletAppointment.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/appointment/portlet/modify_portletappointment.html','',NULL);
/*!40000 ALTER TABLE `core_portlet_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_role`
--

DROP TABLE IF EXISTS `core_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_role` (
  `role` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `workgroup_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_role`
--

LOCK TABLES `core_role` WRITE;
/*!40000 ALTER TABLE `core_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_search_parameter`
--

DROP TABLE IF EXISTS `core_search_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_search_parameter` (
  `parameter_key` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `parameter_value` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`parameter_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_search_parameter`
--

LOCK TABLES `core_search_parameter` WRITE;
/*!40000 ALTER TABLE `core_search_parameter` DISABLE KEYS */;
INSERT INTO `core_search_parameter` VALUES
('type_filter','none'),
('default_operator','OR'),
('help_message','Message d aide pour la recherche'),
('date_filter','0'),
('tag_filter','0'),
('taglist',NULL);
/*!40000 ALTER TABLE `core_search_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_style`
--

DROP TABLE IF EXISTS `core_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_style` (
  `id_style` int NOT NULL DEFAULT '0',
  `description_style` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_portlet_type` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_portal_component` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_style`),
  KEY `index_style` (`id_portlet_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_style`
--

LOCK TABLES `core_style` WRITE;
/*!40000 ALTER TABLE `core_style` DISABLE KEYS */;
INSERT INTO `core_style` VALUES
(3,'Menu Init','',3),
(4,'Main Menu','',4),
(5,'Breadcrumb','',5),
(6,'Site Map','',6),
(7,'Tree View Menu','',7),
(8,'Site Map (Admin mode)',NULL,8),
(200,'Défaut','MYLUTECE_PORTLET',0);
/*!40000 ALTER TABLE `core_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_style_mode_stylesheet`
--

DROP TABLE IF EXISTS `core_style_mode_stylesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_style_mode_stylesheet` (
  `id_style` int NOT NULL DEFAULT '0',
  `id_mode` int NOT NULL DEFAULT '0',
  `id_stylesheet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_style`,`id_mode`,`id_stylesheet`),
  KEY `index_style_mode_stylesheet` (`id_stylesheet`,`id_mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_style_mode_stylesheet`
--

LOCK TABLES `core_style_mode_stylesheet` WRITE;
/*!40000 ALTER TABLE `core_style_mode_stylesheet` DISABLE KEYS */;
INSERT INTO `core_style_mode_stylesheet` VALUES
(3,0,211),
(4,0,213),
(5,0,215),
(6,0,217),
(7,0,253),
(8,1,279),
(200,0,310);
/*!40000 ALTER TABLE `core_style_mode_stylesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_stylesheet`
--

DROP TABLE IF EXISTS `core_stylesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_stylesheet` (
  `id_stylesheet` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `source` mediumblob,
  PRIMARY KEY (`id_stylesheet`)
) ENGINE=MyISAM AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_stylesheet`
--

LOCK TABLES `core_stylesheet` WRITE;
/*!40000 ALTER TABLE `core_stylesheet` DISABLE KEYS */;
INSERT INTO `core_stylesheet` VALUES
(211,'Menu Init','menu_init.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"menu-list\">\r\n<br /><br />\r\n	<div id=\"menu-init\">\r\n		<div id=\"menu-init-content\">\r\n            <ul id=\"menu-verti\">\r\n                <xsl:apply-templates select=\"menu\" />\r\n            </ul>\r\n        </div>\r\n     </div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"menu\">\r\n    <xsl:variable name=\"index\">\r\n    	<xsl:number level=\"single\" value=\"position()\" />\r\n    </xsl:variable>\r\n\r\n    <xsl:if test=\"$index &gt; 7\">\r\n        <li class=\"first-verti\">\r\n        	<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n          		<xsl:value-of select=\"page-name\" />\r\n	        </a>\r\n    	    <xsl:apply-templates select=\"sublevel-menu-list\" />\r\n        </li>\r\n   </xsl:if>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu-list\" >\r\n	<ul>\r\n    	<li class=\"last-verti\">\r\n		 	<xsl:apply-templates select=\"sublevel-menu\" />\r\n 	    </li>\r\n    </ul>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu\">\r\n   <xsl:variable name=\"index_sous_menu\">\r\n         <xsl:number level=\"single\" value=\"position()\" />\r\n   </xsl:variable>\r\n\r\n   <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n		<span><xsl:value-of select=\"page-name\" /></span>\r\n   </a>\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n'),
(213,'Main Menu','menu_main.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n    <xsl:param name=\"site-path\" select=\"site-path\" />\r\n    <xsl:template match=\"menu-list\">\r\n        <xsl:apply-templates select=\"menu\" />\r\n    </xsl:template>\r\n    <xsl:template match=\"menu\">\r\n        <li class=\"nav-item\">\r\n            <a href=\"{$site-path}?page_id={page-id}\" class=\"nav-link\" target=\"_top\">\r\n                <xsl:value-of select=\"page-name\" />\r\n            </a>\r\n        </li>\r\n    </xsl:template>\r\n</xsl:stylesheet>'),
(215,'Breadcrumb','page_path.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n\r\n<xsl:template match=\"page\">\r\n		<xsl:if test=\"position()!=last()-1\">\r\n			<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\"><xsl:value-of select=\"page-name\" /></a> >\r\n		</xsl:if>\r\n		<xsl:if test=\"position()=last()-1\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page_link\">\r\n		<xsl:if test=\"position()!=last()-1\">\r\n			<a href=\"{$site-path}?{page-url}\" target=\"_top\"><xsl:value-of select=\"page-name\" /></a> >\r\n		</xsl:if>\r\n		<xsl:if test=\"position()=last()-1\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n</xsl:stylesheet>'),
(217,'Site Map','site_map.xsl','<?xml version=\"1.0\"?> <xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\"> 	<xsl:param name=\"site-path\" select=\"site-path\" /> 	<xsl:variable name=\"current-page-id\" select=\"current-page-id\" /> 	<xsl:template match=\"page[page-level=0]\"> 		<div id=\"lutece-map-tree\" class=\"lutece-tree\"> 			<ul> 				<li id=\"node-{page-id}\" class=\"lutece-tree-node\" data-tree-icon=\"home\"> 					<xsl:value-of select=\"page-name\" /> 					<xsl:if test=\"not(string(page-role)=\'none\')\"> 						<strong> 							<xsl:text disable-output-escaping=\"yes\">- #i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text> 							<xsl:value-of select=\"page-role\" /> 						</strong> 					</xsl:if> 					<a href=\"{$site-path}?page_id={page-id}\" title=\"{page-description}\"><span class=\"ti ti-home-link ms-2\"></span></a> 					<ul> 						<xsl:apply-templates select=\"child-pages-list\" /> 					</ul> 				</li> 			</ul> 		</div> 	</xsl:template> 	<xsl:template match=\"page[page-level>0]\"> 		<xsl:variable name=\"index\" select=\"page-id\" /> 		<xsl:variable name=\"description\" select=\"page-description\" /> 		<xsl:choose> 			<xsl:when test=\"count(child-pages-list/*)>0\"> 			<li id=\"node-{$index}\" class=\"lutece-tree-node\" data-tree-icon=\"folder\"> 				<span class=\"node-name\"> 					<xsl:value-of select=\"page-name\" /> 					<xsl:if test=\"not(string(page-role)=\'none\')\"> 						<strong> 							<xsl:text disable-output-escaping=\"yes\">#i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text> 							<xsl:value-of select=\"page-role\" /> 						</strong> 					</xsl:if> 					<a href=\"{$site-path}?page_id={page-id}\" title=\"{page-name } - {$description}\"><span class=\"ti ti-link mx-2\"></span></a> 				</span> 				<ul> 					<xsl:apply-templates select=\"child-pages-list\" /> 				</ul> 			</li> 			</xsl:when> 			<xsl:otherwise> 				<li id=\"node-{$index}\" class=\"lutece-tree-item\" data-tree-icon=\"file-symlink\"> 					<a href=\"{$site-path}?page_id={page-id}\" title=\"{$description}\"> 						<span class=\"leaf-name\"><xsl:value-of select=\"page-name\" /></span> 						<xsl:if test=\"not(string(page-role)=\'none\')\"> 							<strong> 								<xsl:text disable-output-escaping=\"yes\">#i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text> 								<xsl:value-of select=\"page-role\" /> 							</strong> 						</xsl:if> 					</a> 				</li>    			</xsl:otherwise> 		</xsl:choose> 	</xsl:template> 	<xsl:template match=\"child-pages-list\"> 		<xsl:apply-templates select=\"page\" /> 	</xsl:template> </xsl:stylesheet>'),
(253,'Tree View Menu','menu_tree.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"menu-list\">\r\n	<xsl:variable name=\"menu-list\" select=\"menu\" />\r\n\r\n	<script type=\"text/javascript\">\r\n		$(document).ready(function(){\r\n			$(\"#tree\").treeview({\r\n				animated: \"fast\",\r\n				collapsed: false,\r\n				unique: true,\r\n				persist: \"cookie\"\r\n			});\r\n		\r\n		});\r\n	</script>    \r\n	\r\n	<xsl:if test=\"not(string(menu)=\'\')\">\r\n	    <xsl:text disable-output-escaping=\"yes\">		    \r\n            <div class=\"tree4\">		\r\n			<h2>&#160;</h2>\r\n			<ul id=\"tree\" class=\"tree4\">\r\n                <xsl:apply-templates select=\"menu\" />        \r\n			</ul>	\r\n			</div>\r\n		 	 <br />\r\n		</xsl:text> \r\n	</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"menu\">\r\n    <xsl:variable name=\"index\">\r\n    	<xsl:number level=\"single\" value=\"position()\" />\r\n    </xsl:variable>\r\n		<li>\r\n          <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\" >\r\n               <xsl:value-of select=\"page-name\" />\r\n           </a>	   \r\n		   <br />\r\n		   <xsl:value-of select=\"page-description\" />\r\n			<xsl:apply-templates select=\"sublevel-menu-list\" /> \r\n			\r\n		</li> 	\r\n		\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu-list\" > \r\n	\r\n	<xsl:apply-templates select=\"sublevel-menu\" /> 	    	\r\n\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"sublevel-menu\">\r\n   <xsl:variable name=\"index_sous_menu\">\r\n         <xsl:number level=\"single\" value=\"position()\" />\r\n   </xsl:variable>\r\n		 <ul >\r\n			<li>\r\n				<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n					<xsl:value-of select=\"page-name\" />\r\n				</a>\r\n			</li>			\r\n		</ul>\r\n		\r\n   \r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n'),
(279,'Site Map (Admin mode)','admin_site_map_admin.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n    <xsl:param name=\"site-path\" select=\"site-path\" />\r\n    <xsl:variable name=\"current-page-id\" select=\"current-page-id\" />\r\n    <xsl:template match=\"page[page-level=0]\">\r\n        <div id=\"lutece-map-tree\" class=\"lutece-tree\">\r\n            <ul>\r\n                <li class=\"lutece-tree-node\" data-tree-icon=\"home\">\r\n                    <xsl:value-of select=\"page-name\" />\r\n                    <xsl:if test=\"not(string(page-role)=\'none\')\">\r\n                        <strong>\r\n                            <xsl:text disable-output-escaping=\"yes\">- #i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text>\r\n                            <xsl:value-of select=\"page-role\" />\r\n                        </strong>\r\n                    </xsl:if>\r\n                    <a href=\"{$site-path}?page_id={page-id}\" title=\"{page-description}\"><span class=\"ti ti-link\"></span></a>\r\n                    <ul>\r\n                        <xsl:apply-templates select=\"child-pages-list\" />\r\n                    </ul>\r\n                </li>\r\n            </ul>\r\n        </div>\r\n    </xsl:template>\r\n    <xsl:template match=\"page[page-level>0]\">\r\n        <xsl:variable name=\"index\" select=\"page-id\" />\r\n        <xsl:variable name=\"description\" select=\"page-description\" />\r\n        <xsl:choose>\r\n            <xsl:when test=\"count(child-pages-list/*)>0\">\r\n            <li id=\"node-{$index}\" class=\"lutece-tree-node\" data-tree-icon=\"folder\">\r\n                <xsl:value-of select=\"page-name\" />\r\n                <xsl:if test=\"not(string(page-role)=\'none\')\">\r\n                    <strong>\r\n                        <xsl:text disable-output-escaping=\"yes\">#i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text>\r\n                        <xsl:value-of select=\"page-role\" />\r\n                    </strong>\r\n                </xsl:if>\r\n                <a href=\"{$site-path}?page_id={page-id}\" title=\"{$description}\"><span class=\"ti ti-link\"></span></a>\r\n                <ul>\r\n                    <xsl:apply-templates select=\"child-pages-list\" />\r\n                </ul>\r\n                </li>   \r\n            </xsl:when>\r\n            <xsl:otherwise>\r\n            <li id=\"node-{$index}\" class=\"lutece-tree-item\" data-tree-icon=\"file\">\r\n                <xsl:value-of select=\"page-name\" />\r\n                <xsl:if test=\"not(string(page-role)=\'none\')\">\r\n                    <strong>\r\n                        <xsl:text disable-output-escaping=\"yes\">#i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text>\r\n                        <xsl:value-of select=\"page-role\" />\r\n                    </strong>\r\n                </xsl:if>\r\n                <a href=\"{$site-path}?page_id={page-id}\" title=\"{$description}\"><span class=\"ti ti-link\"></span></a>\r\n                <xsl:apply-templates select=\"child-pages-list\" />\r\n            </li>    \r\n            </xsl:otherwise>\r\n        </xsl:choose>\r\n    </xsl:template>\r\n    <xsl:template match=\"child-pages-list\">\r\n        <xsl:apply-templates select=\"page\" />\r\n    </xsl:template>\r\n</xsl:stylesheet>'),
(310,'Rubrique MyLutece - Défaut','portlet_mylutece.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:template match=\"portlet\">\r\n\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n		<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n\r\n	<div class=\"portlet {$device_class}\">\r\n		<div class=\"well\">\r\n			<xsl:choose>\r\n	        <xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n				<h3><xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" /></h3>\r\n				<xsl:apply-templates select=\"mylutece-portlet\" />\r\n	        </xsl:when>\r\n	        <xsl:otherwise>\r\n				<xsl:apply-templates select=\"mylutece-portlet\" />\r\n	        </xsl:otherwise>\r\n			</xsl:choose>\r\n			<div class=\"clearfix\">&#160;</div>\r\n		</div>\r\n	</div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"mylutece-portlet\">\r\n	<xsl:apply-templates select=\"user-not-signed\" />\r\n	<xsl:apply-templates select=\"lutece-user\" />\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"user-not-signed\">\r\n	<form class=\"form\" action=\"jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp\" method=\"post\">\r\n		<xsl:apply-templates select=\"lutece-user-authentication-service[@delegated=\'true\']\" />\r\n		<xsl:apply-templates select=\"lutece-user-authentication-service[@loginpassword-required=\'true\']\" />\r\n		<xsl:if test=\"count(lutece-user-authentication-service[@loginpassword-required=\'true\']) &gt;= 1\">\r\n			<label for=\"username\">Code d\'acc&#232;s :</label>\r\n			<input name=\"username\" class=\"input-normal\" id=\"username\" autocomplete=\"off\" tabindex=\"1\" type=\"text\"/><br />\r\n			<label for=\"password\">Mot de passe :</label>\r\n			<input name=\"password\" class=\"input-normal\" id=\"password\" autocomplete=\"off\" tabindex=\"2\" type=\"password\" />\r\n			<button class=\"btn btn-small\" tabindex=\"3\" type=\"submit\"><i class=\"icon-user\">&#160;</i>&#160;Connexion</button>\r\n		</xsl:if>\r\n	</form>\r\n	<xsl:apply-templates select=\"lutece-user-new-account-url\" />\r\n	<xsl:apply-templates select=\"lutece-user-lost-password-url\" />\r\n</xsl:template>\r\n\r\n<xsl:template match=\"lutece-user-authentication-service[@loginpassword-required=\'true\']\">\r\n	<label class=\"radio\" for=\"auth_provider\" >\r\n		<input type=\"radio\" name=\"auth_provider\" value=\"{name}\" checked=\"checked\" />\r\n		<xsl:value-of select=\"display-name\" />\r\n	</label>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"lutece-user-authentication-service[@delegated=\'true\']\">\r\n	<a href=\"{url}?auth_provider={name}\">\r\n		<img src=\"{icon-url}\" alt=\"{display-name}\" title=\"{display-name}\"/>\r\n	</a>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user\">\r\n    <p>\r\n	<strong>Bienvenue&#160;\r\n		<xsl:value-of disable-output-escaping=\"yes\" select=\"lutece-user-name-given\" />&#160;\r\n		<xsl:value-of disable-output-escaping=\"yes\" select=\"lutece-user-name-family\" />\r\n	</strong>\r\n	</p>\r\n    <xsl:apply-templates select=\"lutece-user-logout-url\" />\r\n    <xsl:apply-templates select=\"lutece-user-view-account-url\" />\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user-logout-url\">\r\n   <form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n   	<button type=\"submit\" class=\"btn\"><i class=\"icon-off\">&#160;</i>&#160;D&#233;connexion</button>&#160;\r\n   </form>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user-new-account-url\">\r\n	<form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n		<button type=\"submit\" class=\"btn\"><i class=\"icon-plus\">&#160;</i>&#160;Cr&#233;er un compte</button>&#160;\r\n    </form>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user-lost-password-url\">\r\n	<form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n	   	<button type=\"submit\" class=\"btn\"><i class=\"icon-lock\">&#160;</i>&#160;Mot de passe perdu</button>&#160;\r\n   </form>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"lutece-user-view-account-url\">\r\n	<form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n	   	<button type=\"submit\" class=\"btn\"><i class=\"icon-edit\">&#160;</i>&#160;Voir mon compte</button>&#160;\r\n	</form>\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n\r\n');
/*!40000 ALTER TABLE `core_stylesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_template`
--

DROP TABLE IF EXISTS `core_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_template` (
  `template_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `template_value` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`template_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_template`
--

LOCK TABLES `core_template` WRITE;
/*!40000 ALTER TABLE `core_template` DISABLE KEYS */;
INSERT INTO `core_template` VALUES
('core_first_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive à expiration. Pour prolonger sa validité, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera désactivé.'),
('core_expiration_mail','Bonjour ${first_name} ! Votre compte a expiré. Vous ne pourrez plus vous connecter avec, et les données vous concernant ont été anonymisées'),
('core_other_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive à expiration. Pour prolonger sa validité, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera désactivé.'),
('core_account_reactivated_mail','Bonjour ${first_name} ! Votre compte utilisateur a bien été réactivé. Il est désormais valable jusqu\'au ${date_valid}.'),
('core_password_expired','Bonjour ! Votre mot de passe a expiré. Lors de votre prochaine connexion, vous pourrez le changer.');
/*!40000 ALTER TABLE `core_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_text_editor`
--

DROP TABLE IF EXISTS `core_text_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_text_editor` (
  `editor_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `editor_description` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `backOffice` smallint NOT NULL,
  PRIMARY KEY (`editor_name`,`backOffice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_text_editor`
--

LOCK TABLES `core_text_editor` WRITE;
/*!40000 ALTER TABLE `core_text_editor` DISABLE KEYS */;
INSERT INTO `core_text_editor` VALUES
('tinymce5','portal.admindashboard.editors.labelBackTinyMCE5',1),
('tinymce6','portal.admindashboard.editors.labelBackTinyMCE6',1),
('','portal.admindashboard.editors.labelBackNoEditor',1),
('','portal.admindashboard.editors.labelFrontNoEditor',0),
('sceeditor','portal.admindashboard.editors.labelFrontSceEditor',0);
/*!40000 ALTER TABLE `core_text_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_password_history`
--

DROP TABLE IF EXISTS `core_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_password_history` (
  `id_user` int NOT NULL,
  `password` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_password_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`date_password_change`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_password_history`
--

LOCK TABLES `core_user_password_history` WRITE;
/*!40000 ALTER TABLE `core_user_password_history` DISABLE KEYS */;
INSERT INTO `core_user_password_history` VALUES
(1,'PBKDF2WITHHMACSHA512:210000:7804ba2859d756dfca7e1ee5ff4e67ca:0308ef00bb7a58a2dd692d0353f1bc4a35722033f1f6423ec88e969fcb913b58737bce6b0828eec46b8d46f9c923429ff8e4e22994232063c93fc51f2d8750b5fcb48463a5657d78869bf766db097e91b4999d623b3c35e346827406f9838b48de22f2d9856bb95dbb1461f778ccc8023bba25ae24fb182d43778fe1a12c5883','2025-07-17 13:02:48');
/*!40000 ALTER TABLE `core_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_preferences`
--

DROP TABLE IF EXISTS `core_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_preferences` (
  `id_user` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `pref_key` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `pref_value` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_user_preferences` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_preferences`
--

LOCK TABLES `core_user_preferences` WRITE;
/*!40000 ALTER TABLE `core_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_right`
--

DROP TABLE IF EXISTS `core_user_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_right` (
  `id_right` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_right`,`id_user`),
  KEY `index_user_right` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_right`
--

LOCK TABLES `core_user_right` WRITE;
/*!40000 ALTER TABLE `core_user_right` DISABLE KEYS */;
INSERT INTO `core_user_right` VALUES
('APPOINTMENT_CALENDAR_TEMPLATE',1),
('APPOINTMENT_CATEGORY_MANAGEMENT',1),
('APPOINTMENT_COMMENT_MANAGEMENT',1),
('APPOINTMENT_FORM_MANAGEMENT',1),
('APPOINTMENT_SEARCH',1),
('CORE_ADMIN_SITE',1),
('CORE_ADMIN_SITE',2),
('CORE_ADMINDASHBOARD_MANAGEMENT',1),
('CORE_CACHE_MANAGEMENT',1),
('CORE_DAEMONS_MANAGEMENT',1),
('CORE_DASHBOARD_MANAGEMENT',1),
('CORE_EDITORS_MANAGEMENT',1),
('CORE_FEATURES_MANAGEMENT',1),
('CORE_LEVEL_RIGHT_MANAGEMENT',1),
('CORE_LINK_SERVICE_MANAGEMENT',1),
('CORE_LINK_SERVICE_MANAGEMENT',2),
('CORE_MAILINGLISTS_MANAGEMENT',1),
('CORE_MODES_MANAGEMENT',1),
('CORE_PAGE_TEMPLATE_MANAGEMENT',1),
('CORE_PAGE_TEMPLATE_MANAGEMENT',2),
('CORE_PLUGINS_MANAGEMENT',1),
('CORE_PROPERTIES_MANAGEMENT',1),
('CORE_PROPERTIES_MANAGEMENT',2),
('CORE_RBAC_MANAGEMENT',1),
('CORE_RIGHT_MANAGEMENT',1),
('CORE_ROLES_MANAGEMENT',1),
('CORE_ROLES_MANAGEMENT',2),
('CORE_SEARCH_INDEXATION',1),
('CORE_SEARCH_INDEXATION',2),
('CORE_SEARCH_MANAGEMENT',1),
('CORE_SEARCH_MANAGEMENT',2),
('CORE_SECURITY_HEADER_MANAGEMENT',1),
('CORE_STYLES_MANAGEMENT',1),
('CORE_STYLESHEET_MANAGEMENT',1),
('CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT',1),
('CORE_USERS_MANAGEMENT',1),
('CORE_USERS_MANAGEMENT',2),
('CORE_WORKGROUPS_MANAGEMENT',1),
('CORE_WORKGROUPS_MANAGEMENT',2),
('CORE_XSL_EXPORT_MANAGEMENT',1),
('ELASTICDATA_MANAGEMENT',1),
('ENTRY_TYPE_MANAGEMENT',1),
('HTMLPAGE_MANAGEMENT',1),
('IDENTITYSTORE_ADMIN_MANAGEMENT',1),
('IDENTITYSTORE_MANAGEMENT',1),
('KIBANA_MANAGEMENT',1),
('KIBANA_RBAC_MANAGEMENT',1),
('MATOMO_MANAGEMENT',1),
('MODULENOTIFYGRUMAPPINGMANAGER_MANAGEMENT',1),
('MULTIVIEW_APPOINTMENT',1),
('MYDASHBOARD_PANEL_MANAGEMENT',1),
('MYLUTECE_MANAGE_AUTHENTICATION_FILTER',1),
('MYLUTECE_MANAGE_EXTERNAL_APPLICATION',1),
('MYLUTECE_MANAGEMENT',1),
('PROFILES_MANAGEMENT',1),
('PROFILES_VIEWS_MANAGEMENT',1),
('REFERENCELIST_MANAGEMENT',1),
('REGULAR_EXPRESSION_MANAGEMENT',1),
('SITELABELS_MANAGEMENT',1),
('SOLR_CONFIGURATION_MANAGEMENT',1),
('SOLR_FIELDS_MANAGEMENT',1),
('SOLR_INDEX_MANAGEMENT',1),
('SYSTEMINFO_MANAGEMENT',1),
('VIEW_TEMP_FILES',1),
('WORKFLOW_MANAGEMENT',1);
/*!40000 ALTER TABLE `core_user_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_role`
--

DROP TABLE IF EXISTS `core_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_role` (
  `role_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_role`
--

LOCK TABLES `core_user_role` WRITE;
/*!40000 ALTER TABLE `core_user_role` DISABLE KEYS */;
INSERT INTO `core_user_role` VALUES
('all_site_manager',1),
('all_site_manager',2),
('assign_groups',1),
('assign_groups',2),
('assign_groups',3),
('assign_roles',1),
('assign_roles',2),
('assign_roles',3),
('CREATE_REFERENCE_IMPORT',1),
('kibana_dashboards_manager',1),
('mylutece_manager',1),
('profiles_manager',1),
('profiles_views_manager',1),
('super_admin',1),
('super_admin',2),
('workflow_manager',1),
('workflow_manager',2);
/*!40000 ALTER TABLE `core_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_xsl_export`
--

DROP TABLE IF EXISTS `core_xsl_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_xsl_export` (
  `id_xsl_export` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_file` int DEFAULT NULL,
  `plugin` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_xsl_export`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_xsl_export`
--

LOCK TABLES `core_xsl_export` WRITE;
/*!40000 ALTER TABLE `core_xsl_export` DISABLE KEYS */;
INSERT INTO `core_xsl_export` VALUES
(125,'Core - Export users to a CSV file','Export back office users to a CSV file','csv',125,'core'),
(126,'Core - Export users to a XML file','Export back office users to a XML file','xml',126,'core');
/*!40000 ALTER TABLE `core_xsl_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_client_crm_item`
--

DROP TABLE IF EXISTS `crm_client_crm_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_client_crm_item` (
  `id_crm_queue` int NOT NULL DEFAULT '0',
  `crm_item` mediumblob,
  PRIMARY KEY (`id_crm_queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_client_crm_item`
--

LOCK TABLES `crm_client_crm_item` WRITE;
/*!40000 ALTER TABLE `crm_client_crm_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_client_crm_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_client_crm_queue`
--

DROP TABLE IF EXISTS `crm_client_crm_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_client_crm_queue` (
  `id_crm_queue` int NOT NULL DEFAULT '0',
  `is_locked` smallint DEFAULT '0',
  PRIMARY KEY (`id_crm_queue`),
  KEY `is_locked_crm_client_crm_queue` (`is_locked`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_client_crm_queue`
--

LOCK TABLES `crm_client_crm_queue` WRITE;
/*!40000 ALTER TABLE `crm_client_crm_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_client_crm_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elastic_mapping`
--

DROP TABLE IF EXISTS `elastic_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `elastic_mapping` (
  `id_mapping` int NOT NULL,
  `id_customer` int NOT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_mapping`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elastic_mapping`
--

LOCK TABLES `elastic_mapping` WRITE;
/*!40000 ALTER TABLE `elastic_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `elastic_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elasticdata_indexer_action`
--

DROP TABLE IF EXISTS `elasticdata_indexer_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `elasticdata_indexer_action` (
  `id_action` int NOT NULL AUTO_INCREMENT,
  `id_resource` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_task` int NOT NULL DEFAULT '0',
  `id_datasource` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elasticdata_indexer_action`
--

LOCK TABLES `elasticdata_indexer_action` WRITE;
/*!40000 ALTER TABLE `elasticdata_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `elasticdata_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filegen_temporary_file`
--

DROP TABLE IF EXISTS `filegen_temporary_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filegen_temporary_file` (
  `id_file` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL DEFAULT '0',
  `title` mediumtext COLLATE utf8mb3_unicode_ci,
  `description` mediumtext COLLATE utf8mb3_unicode_ci,
  `id_physical_file` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_size` int DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_file`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filegen_temporary_file`
--

LOCK TABLES `filegen_temporary_file` WRITE;
/*!40000 ALTER TABLE `filegen_temporary_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `filegen_temporary_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_entry`
--

DROP TABLE IF EXISTS `genatt_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_entry` (
  `id_entry` int NOT NULL AUTO_INCREMENT,
  `id_resource` int NOT NULL DEFAULT '0',
  `resource_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_type` int NOT NULL DEFAULT '0',
  `id_parent` int DEFAULT NULL,
  `title` mediumtext COLLATE utf8mb3_unicode_ci,
  `code` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `help_message` mediumtext COLLATE utf8mb3_unicode_ci,
  `comment` mediumtext COLLATE utf8mb3_unicode_ci,
  `mandatory` smallint DEFAULT NULL,
  `fields_in_line` smallint DEFAULT NULL,
  `pos` int DEFAULT NULL,
  `id_field_depend` int DEFAULT NULL,
  `field_unique` smallint DEFAULT NULL,
  `css_class` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pos_conditional` int DEFAULT '0',
  `error_message` mediumtext COLLATE utf8mb3_unicode_ci,
  `is_only_display_back` smallint DEFAULT '0',
  `is_indexed` smallint DEFAULT '0',
  PRIMARY KEY (`id_entry`),
  KEY `index_genatt_entry_resource` (`id_resource`),
  KEY `index_genatt_entry_parent` (`id_parent`),
  KEY `index_genatt_code` (`code`),
  KEY `fk_genatt_entry_type` (`id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_entry`
--

LOCK TABLES `genatt_entry` WRITE;
/*!40000 ALTER TABLE `genatt_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_entry_type`
--

DROP TABLE IF EXISTS `genatt_entry_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_entry_type` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_group` smallint DEFAULT NULL,
  `is_comment` int DEFAULT NULL,
  `is_mylutece_user` smallint DEFAULT NULL,
  `class_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `plugin` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `display_order` int DEFAULT '0',
  `inactive` int DEFAULT '0',
  PRIMARY KEY (`id_type`),
  KEY `index_genatt_entry_type_plugin` (`plugin`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_entry_type`
--

LOCK TABLES `genatt_entry_type` WRITE;
/*!40000 ALTER TABLE `genatt_entry_type` DISABLE KEYS */;
INSERT INTO `genatt_entry_type` VALUES
(123,'Bouton radio',0,0,0,'appointment.entryTypeRadioButton','dot-circle','appointment',2,0),
(124,'Case à cocher',0,0,0,'appointment.entryTypeCheckBox','check-square','appointment',1,0),
(125,'Commentaire',0,1,0,'appointment.entryTypeComment','comment','appointment',3,0),
(126,'Date',0,0,0,'appointment.entryTypeDate','calendar','appointment',4,0),
(127,'Liste déroulante',0,0,0,'appointment.entryTypeSelect','list-alt','appointment',5,0),
(128,'Zone de texte court',0,0,0,'appointment.entryTypeText','file-alt','appointment',6,0),
(129,'Zone de texte long',0,0,0,'appointment.entryTypeTextArea','sticky-note','appointment',7,0),
(130,'Numérotation',0,0,0,'appointment.entryTypeNumbering','hashtag','appointment',8,0),
(131,'Regroupement',1,0,0,'appointment.entryTypeGroup','indent','appointment',9,0),
(132,'Liste déroulante SQL',0,0,0,'appointment.entryTypeSelectSQL','list-alt','appointment',10,0),
(133,'Géolocalisation',0,0,0,'appointment.entryTypeGeolocation','map-marked-alt','appointment',11,0),
(134,'Session',0,0,0,'appointment.entryTypeSession','user','appointment',12,0),
(135,'Utilisateur MyLutece',0,0,1,'appointment.entryTypeMyLuteceUser','user','appointment',13,0),
(136,'Image',0,0,0,'appointment.entryTypeImage','image','appointment',14,0),
(137,'Fichier',0,0,0,'appointment.entryTypeFile','file','appointment',15,0),
(138,'Numéro de téléphone',0,0,0,'appointment.entryTypePhone','phone-square','appointment',16,1);
/*!40000 ALTER TABLE `genatt_entry_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_field`
--

DROP TABLE IF EXISTS `genatt_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_field` (
  `id_field` int NOT NULL AUTO_INCREMENT,
  `id_entry` int NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb3_unicode_ci,
  `default_value` smallint DEFAULT NULL,
  `pos` int DEFAULT NULL,
  `value_type_date` date DEFAULT NULL,
  `no_display_title` smallint DEFAULT NULL,
  `comment` mediumtext COLLATE utf8mb3_unicode_ci,
  `id_file_key` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_field`),
  KEY `index_genatt_field_entry` (`id_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_field`
--

LOCK TABLES `genatt_field` WRITE;
/*!40000 ALTER TABLE `genatt_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_referenceitem_field`
--

DROP TABLE IF EXISTS `genatt_referenceitem_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_referenceitem_field` (
  `id_field` int NOT NULL DEFAULT '0',
  `id_item` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_referenceitem_field`
--

LOCK TABLES `genatt_referenceitem_field` WRITE;
/*!40000 ALTER TABLE `genatt_referenceitem_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_referenceitem_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_response`
--

DROP TABLE IF EXISTS `genatt_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_response` (
  `id_response` int NOT NULL AUTO_INCREMENT,
  `response_value` mediumtext COLLATE utf8mb3_unicode_ci,
  `id_entry` int DEFAULT NULL,
  `iteration_number` int DEFAULT '-1',
  `id_field` int DEFAULT NULL,
  `id_file` int DEFAULT NULL,
  `status` smallint DEFAULT '1',
  `sort_order` int DEFAULT '0',
  PRIMARY KEY (`id_response`),
  KEY `index_genatt_response_entry` (`id_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_response`
--

LOCK TABLES `genatt_response` WRITE;
/*!40000 ALTER TABLE `genatt_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_verify_by`
--

DROP TABLE IF EXISTS `genatt_verify_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_verify_by` (
  `id_field` int NOT NULL DEFAULT '0',
  `id_expression` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_field`,`id_expression`),
  KEY `index_genatt_verify_by_field` (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_verify_by`
--

LOCK TABLES `genatt_verify_by` WRITE;
/*!40000 ALTER TABLE `genatt_verify_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_verify_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htmlpage`
--

DROP TABLE IF EXISTS `htmlpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `htmlpage` (
  `id_htmlpage` int NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `html_content` mediumtext COLLATE utf8mb3_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `workgroup_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'all',
  `role` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id_htmlpage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htmlpage`
--

LOCK TABLES `htmlpage` WRITE;
/*!40000 ALTER TABLE `htmlpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `htmlpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_attribute`
--

DROP TABLE IF EXISTS `identitystore_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_attribute` (
  `id_attribute` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `key_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb3_unicode_ci,
  `key_type` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `key_name` (`key_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_attribute`
--

LOCK TABLES `identitystore_attribute` WRITE;
/*!40000 ALTER TABLE `identitystore_attribute` DISABLE KEYS */;
INSERT INTO `identitystore_attribute` VALUES
(1,'Genre','gender','0:Non défini /  1:Homme / 2:Femme',0),
(2,'Email','email','',0),
(3,'Date de naissance','birthdate','au format DD/MM/YYYY',0),
(4,'Lieu de naissance','birthplace','',0),
(5,'Téléphone portable','mobile_phone','Réservé pour l\'envoi de SMS',0),
(6,'Téléphone fixe','fixed_phone','',0),
(7,'Téléphone fixe ou mobile','phone','',0),
(8,'Nom usuel','preferred_username','',0),
(9,'Adresse postale','address','',0),
(10,'Prénom','first_name','Prénom usuel',0),
(11,'Nom de famille de naissance','family_name','',0),
(12,'Numéro de rue','address_number','Champ d\'adresse : numéro de rue ',0),
(13,'Suffixe','address_suffix','Champ d\'adresse : suffixe de numéro (bis,ter...)',0),
(14,'Rue','address_street','Champ d\'adresse :  rue, avenue...',0),
(15,'Immeuble','address_building','Champ d\'adresse : immeuble, résidence...',0),
(16,'Etage','address_stair','Champ d\'adresse : Etage, Numéro d appartement',0),
(17,'Code postal','address_postal_code','Champ d\'adresse : code postal',0),
(18,'Ville','address_city','Champ d\'adresse : ville',0),
(19,'Pays de naissance','birthcountry','',0),
(30,'(FC) Prénoms','fc_given_name','Format Pivot FranceConnect - Liste des prénoms',0),
(31,'(FC) Nom de naissance','fc_family_name','Format Pivot FranceConnect',0),
(32,'(FC) Date de naissance','fc_birthdate','Format Pivot FranceConnect - format YYYY-MM-DD',0),
(33,'(FC) Genre','fc_gender','Format Pivot FranceConnect - male / female',0),
(34,'(FC) Lieu de naissance','fc_birthplace','Format Pivot FranceConnect - Code INSEE du lieu de naissance (ou une chaîne vide si la personne est née à l\'étranger)',0),
(35,'(FC) Pays de naissance','fc_birthcountry','Format Pivot FranceConnect - Code INSEE du pays de naissance',0);
/*!40000 ALTER TABLE `identitystore_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_attribute_certificate`
--

DROP TABLE IF EXISTS `identitystore_attribute_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_attribute_certificate` (
  `id_attribute_certificate` int NOT NULL AUTO_INCREMENT,
  `certifier_code` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `certificate_date` timestamp NOT NULL,
  `certificate_level` int NOT NULL DEFAULT '0',
  `expiration_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_attribute_certificate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_attribute_certificate`
--

LOCK TABLES `identitystore_attribute_certificate` WRITE;
/*!40000 ALTER TABLE `identitystore_attribute_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `identitystore_attribute_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_attribute_right`
--

DROP TABLE IF EXISTS `identitystore_attribute_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_attribute_right` (
  `id_client_app` int NOT NULL,
  `id_attribute` int NOT NULL,
  `readable` int NOT NULL DEFAULT '0',
  `writable` int NOT NULL DEFAULT '0',
  `certifiable` int NOT NULL DEFAULT '0',
  `searchable` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_client_app`,`id_attribute`),
  KEY `fk_attribute_right_id_attribute` (`id_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_attribute_right`
--

LOCK TABLES `identitystore_attribute_right` WRITE;
/*!40000 ALTER TABLE `identitystore_attribute_right` DISABLE KEYS */;
INSERT INTO `identitystore_attribute_right` VALUES
(1,1,1,1,0,0),
(1,2,1,1,0,0),
(1,3,1,1,0,0),
(1,4,1,1,0,0),
(1,5,1,1,0,0),
(1,6,1,1,0,0),
(1,7,1,1,0,0),
(1,8,1,1,0,0),
(1,9,1,1,0,0),
(1,10,1,1,0,0),
(1,11,1,1,0,0),
(1,12,1,1,0,0),
(1,13,1,1,0,0),
(1,14,1,1,0,0),
(1,15,1,1,0,0),
(1,16,1,1,0,0),
(1,17,1,1,0,0),
(1,18,1,1,0,0);
/*!40000 ALTER TABLE `identitystore_attribute_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_client_application`
--

DROP TABLE IF EXISTS `identitystore_client_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_client_application` (
  `id_client_app` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_application_authorized_to_delete_value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_client_app`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_client_application`
--

LOCK TABLES `identitystore_client_application` WRITE;
/*!40000 ALTER TABLE `identitystore_client_application` DISABLE KEYS */;
INSERT INTO `identitystore_client_application` VALUES
(1,'My Application','MyApplication',0);
/*!40000 ALTER TABLE `identitystore_client_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_client_application_certifiers`
--

DROP TABLE IF EXISTS `identitystore_client_application_certifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_client_application_certifiers` (
  `id_client_app` int NOT NULL,
  `certifier_code` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_client_app`,`certifier_code`),
  KEY `id_client_app` (`id_client_app`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_client_application_certifiers`
--

LOCK TABLES `identitystore_client_application_certifiers` WRITE;
/*!40000 ALTER TABLE `identitystore_client_application_certifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `identitystore_client_application_certifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_history_identity_attribute`
--

DROP TABLE IF EXISTS `identitystore_history_identity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_history_identity_attribute` (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `change_type` int NOT NULL,
  `id_identity` int NOT NULL,
  `identity_connection_id` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `attribute_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `attribute_new_value` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `attribute_old_value` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `author_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `author_type` int NOT NULL,
  `author_application` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `certifier_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_history`),
  KEY `fk_history_identity_attribute_id_identity` (`id_identity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_history_identity_attribute`
--

LOCK TABLES `identitystore_history_identity_attribute` WRITE;
/*!40000 ALTER TABLE `identitystore_history_identity_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `identitystore_history_identity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_identity`
--

DROP TABLE IF EXISTS `identitystore_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_identity` (
  `id_identity` int NOT NULL AUTO_INCREMENT,
  `connection_id` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` smallint DEFAULT '0',
  `date_delete` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_identity`),
  UNIQUE KEY `connection_id` (`connection_id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  KEY `connection_id_2` (`connection_id`),
  KEY `customer_id_2` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_identity`
--

LOCK TABLES `identitystore_identity` WRITE;
/*!40000 ALTER TABLE `identitystore_identity` DISABLE KEYS */;
INSERT INTO `identitystore_identity` VALUES
(1,'azerty','3F2504E0-4F89-11D3-9A0C-0305E82C3301','2025-07-17 12:02:31',0,'2025-07-17 12:02:31');
/*!40000 ALTER TABLE `identitystore_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_identity_attribute`
--

DROP TABLE IF EXISTS `identitystore_identity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_identity_attribute` (
  `id_identity` int NOT NULL DEFAULT '0',
  `id_attribute` int NOT NULL DEFAULT '0',
  `attribute_value` mediumtext COLLATE utf8mb3_unicode_ci,
  `id_certification` int NOT NULL DEFAULT '0',
  `id_file` int DEFAULT '0',
  `lastupdate_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastupdate_application` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_identity`,`id_attribute`),
  KEY `fk_identity_attribute_id_attribute` (`id_attribute`),
  KEY `ix_attribute_value` (`attribute_value`(50)) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_identity_attribute`
--

LOCK TABLES `identitystore_identity_attribute` WRITE;
/*!40000 ALTER TABLE `identitystore_identity_attribute` DISABLE KEYS */;
INSERT INTO `identitystore_identity_attribute` VALUES
(1,1,'M',0,0,'2025-07-17 12:02:31',NULL),
(1,2,'john.doe@gmail.com',0,0,'2025-07-17 12:02:31',NULL),
(1,3,'11/10/1970',0,0,'2025-07-17 12:02:31',NULL),
(1,4,'Paris',0,0,'2025-07-17 12:02:31',NULL),
(1,5,'0623457896',0,0,'2025-07-17 12:02:31',NULL),
(1,6,'0123457896',0,0,'2025-07-17 12:02:31',NULL),
(1,7,'0123457896',0,0,'2025-07-17 12:02:31',NULL),
(1,8,'Joe',0,0,'2025-07-17 12:02:31',NULL),
(1,9,'Rue de Rennes',0,0,'2025-07-17 12:02:31',NULL),
(1,10,'John',0,0,'2025-07-17 12:02:31',NULL),
(1,11,'Doe',0,0,'2025-07-17 12:02:31',NULL),
(1,12,'8',0,0,'2025-07-17 12:02:31',NULL),
(1,13,'Bis',0,0,'2025-07-17 12:02:31',NULL),
(1,14,'Rue de Rennes',0,0,'2025-07-17 12:02:31',NULL),
(1,15,'Escalier B',0,0,'2025-07-17 12:02:31',NULL),
(1,16,'Etage 4',0,0,'2025-07-17 12:02:31',NULL),
(1,17,'75018',0,0,'2025-07-17 12:02:31',NULL),
(1,18,'Paris',0,0,'2025-07-17 12:02:31',NULL);
/*!40000 ALTER TABLE `identitystore_identity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kibana_dashboard`
--

DROP TABLE IF EXISTS `kibana_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `kibana_dashboard` (
  `id_dashboard` int NOT NULL,
  `idkibanadashboard` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `title` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `dataSourceName` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_dashboard`),
  UNIQUE KEY `idkibanadashboard` (`idkibanadashboard`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kibana_dashboard`
--

LOCK TABLES `kibana_dashboard` WRITE;
/*!40000 ALTER TABLE `kibana_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `kibana_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mydashboard_configuration`
--

DROP TABLE IF EXISTS `mydashboard_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mydashboard_configuration` (
  `my_dashboard_component_id` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_config` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dashboard_order` int NOT NULL,
  `hide_dashboard` smallint NOT NULL,
  PRIMARY KEY (`my_dashboard_component_id`,`id_config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydashboard_configuration`
--

LOCK TABLES `mydashboard_configuration` WRITE;
/*!40000 ALTER TABLE `mydashboard_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mydashboard_dashboard_association`
--

DROP TABLE IF EXISTS `mydashboard_dashboard_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mydashboard_dashboard_association` (
  `id_dashboard_association` int NOT NULL,
  `id_dashboard` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `id_panel` int NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_dashboard_association`),
  KEY `fk_id_panel` (`id_panel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydashboard_dashboard_association`
--

LOCK TABLES `mydashboard_dashboard_association` WRITE;
/*!40000 ALTER TABLE `mydashboard_dashboard_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_dashboard_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mydashboard_panel`
--

DROP TABLE IF EXISTS `mydashboard_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mydashboard_panel` (
  `id_panel` int NOT NULL,
  `code` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb3_unicode_ci,
  `is_default` smallint NOT NULL,
  PRIMARY KEY (`id_panel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydashboard_panel`
--

LOCK TABLES `mydashboard_panel` WRITE;
/*!40000 ALTER TABLE `mydashboard_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mydashboard_portlet_panel`
--

DROP TABLE IF EXISTS `mydashboard_portlet_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mydashboard_portlet_panel` (
  `id_portlet` int NOT NULL,
  `id_panel` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_portlet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydashboard_portlet_panel`
--

LOCK TABLES `mydashboard_portlet_panel` WRITE;
/*!40000 ALTER TABLE `mydashboard_portlet_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_portlet_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_attribute`
--

DROP TABLE IF EXISTS `mylutece_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_attribute` (
  `id_attribute` int NOT NULL DEFAULT '0',
  `type_class_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` mediumtext COLLATE utf8mb3_unicode_ci,
  `help_message` mediumtext COLLATE utf8mb3_unicode_ci,
  `is_mandatory` smallint DEFAULT '0',
  `is_shown_in_search` smallint DEFAULT '0',
  `attribute_position` int DEFAULT '0',
  `plugin_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `anonymize` smallint DEFAULT NULL,
  PRIMARY KEY (`id_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_attribute`
--

LOCK TABLES `mylutece_attribute` WRITE;
/*!40000 ALTER TABLE `mylutece_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_attribute_field`
--

DROP TABLE IF EXISTS `mylutece_attribute_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_attribute_field` (
  `id_field` int NOT NULL DEFAULT '0',
  `id_attribute` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DEFAULT_value` mediumtext COLLATE utf8mb3_unicode_ci,
  `is_DEFAULT_value` smallint DEFAULT '0',
  `height` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `max_size_enter` int DEFAULT NULL,
  `is_multiple` smallint DEFAULT '0',
  `field_position` int DEFAULT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_attribute_field`
--

LOCK TABLES `mylutece_attribute_field` WRITE;
/*!40000 ALTER TABLE `mylutece_attribute_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_attribute_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_connections_log`
--

DROP TABLE IF EXISTS `mylutece_connections_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_connections_log` (
  `ip_address` varchar(63) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_status` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_connections_log`
--

LOCK TABLES `mylutece_connections_log` WRITE;
/*!40000 ALTER TABLE `mylutece_connections_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_connections_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_user_anonymize_field`
--

DROP TABLE IF EXISTS `mylutece_user_anonymize_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_user_anonymize_field` (
  `field_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `anonymize` smallint NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_user_anonymize_field`
--

LOCK TABLES `mylutece_user_anonymize_field` WRITE;
/*!40000 ALTER TABLE `mylutece_user_anonymize_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_user_anonymize_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_user_field`
--

DROP TABLE IF EXISTS `mylutece_user_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_user_field` (
  `id_user_field` int NOT NULL DEFAULT '0',
  `id_user` int DEFAULT NULL,
  `id_attribute` int DEFAULT NULL,
  `id_field` int DEFAULT NULL,
  `user_field_value` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_user_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_user_field`
--

LOCK TABLES `mylutece_user_field` WRITE;
/*!40000 ALTER TABLE `mylutece_user_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_user_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifygru_alert_update_resource_state_queue`
--

DROP TABLE IF EXISTS `notifygru_alert_update_resource_state_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifygru_alert_update_resource_state_queue` (
  `id_resource_queue` int NOT NULL AUTO_INCREMENT,
  `id_resource` int NOT NULL,
  `id_resource_history` int NOT NULL,
  `id_task` int NOT NULL,
  `resource_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_external_parent` int NOT NULL DEFAULT '0',
  `id_workflow` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alert_reference_date` timestamp NOT NULL,
  `id_state` int NOT NULL,
  PRIMARY KEY (`id_resource_queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifygru_alert_update_resource_state_queue`
--

LOCK TABLES `notifygru_alert_update_resource_state_queue` WRITE;
/*!40000 ALTER TABLE `notifygru_alert_update_resource_state_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifygru_alert_update_resource_state_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_action`
--

DROP TABLE IF EXISTS `profile_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `name_key` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description_key` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action_permission` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_action`
--

LOCK TABLES `profile_action` WRITE;
/*!40000 ALTER TABLE `profile_action` DISABLE KEYS */;
INSERT INTO `profile_action` VALUES
(1,'profiles.action.modify_profile.name','profiles.action.modify_profile.description','jsp/admin/plugins/profiles/ModifyProfile.jsp','edit','MODIFY_PROFILE'),
(2,'profiles.action.delete_profile.name','profiles.action.delete_profile.description','jsp/admin/plugins/profiles/RemoveProfile.jsp','trash','DELETE_DELETE'),
(3,'profiles.action.manage_users_assignment.name','profiles.action.manage_users_assignment.description','jsp/admin/plugins/profiles/AssignUsersProfile.jsp','user','MANAGE_USERS_ASSIGNMENT'),
(4,'profiles.action.manage_rights_assignment.name','profiles.action.manage_rights_assignment.description','jsp/admin/plugins/profiles/AssignRightsProfile.jsp','lock','MANAGE_RIGHTS_ASSIGNMENT'),
(5,'profiles.action.manage_roles_assignment.name','profiles.action.manage_roles_assignment.description','jsp/admin/plugins/profiles/AssignRolesProfile.jsp','th-list','MANAGE_ROLES_ASSIGNMENT'),
(6,'profiles.action.manage_workgroups_assignment.name','profiles.action.manage_workgroups_assignment.description','jsp/admin/plugins/profiles/AssignWorkgroupsProfile.jsp','group','MANAGE_WORKGROUPS_ASSIGNMENT'),
(7,'profiles.action.manage_view_assignment.name','profiles.action.manage_view_assignment.description','jsp/admin/plugins/profiles/AssignViewProfile.jsp','eye','MANAGE_VIEW_ASSIGNMENT');
/*!40000 ALTER TABLE `profile_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_profile`
--

DROP TABLE IF EXISTS `profile_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_profile` (
  `profile_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `profile_description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`profile_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_profile`
--

LOCK TABLES `profile_profile` WRITE;
/*!40000 ALTER TABLE `profile_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_right`
--

DROP TABLE IF EXISTS `profile_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_right` (
  `profile_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_right` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_key`,`id_right`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_right`
--

LOCK TABLES `profile_right` WRITE;
/*!40000 ALTER TABLE `profile_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_role`
--

DROP TABLE IF EXISTS `profile_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_role` (
  `profile_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `role_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_key`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_role`
--

LOCK TABLES `profile_role` WRITE;
/*!40000 ALTER TABLE `profile_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_user`
--

DROP TABLE IF EXISTS `profile_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_user` (
  `profile_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`profile_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_user`
--

LOCK TABLES `profile_user` WRITE;
/*!40000 ALTER TABLE `profile_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_view`
--

DROP TABLE IF EXISTS `profile_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_view` (
  `view_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `view_description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`view_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_view`
--

LOCK TABLES `profile_view` WRITE;
/*!40000 ALTER TABLE `profile_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_view_action`
--

DROP TABLE IF EXISTS `profile_view_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_view_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `name_key` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description_key` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action_permission` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_view_action`
--

LOCK TABLES `profile_view_action` WRITE;
/*!40000 ALTER TABLE `profile_view_action` DISABLE KEYS */;
INSERT INTO `profile_view_action` VALUES
(1,'profiles.action.modify_view.name','profiles.action.modify_view.description','jsp/admin/plugins/profiles/ModifyView.jsp','edit','MODIFY_VIEW'),
(2,'profiles.action.delete_view.name','profiles.action.delete_view.description','jsp/admin/plugins/profiles/RemoveView.jsp','trash','DELETE_VIEW'),
(3,'profiles.action.manage_views_assignment.name','profiles.action.manage_views_assignment.description','jsp/admin/plugins/profiles/AssignProfilesView.jsp','user-tag','MANAGE_PROFILES_ASSIGNMENT'),
(4,'profiles.action.manage_dashboards.name','profiles.action.manage_dashboards.description','jsp/admin/plugins/profiles/ManageDashboards.jsp','wrench','MANAGE_DASHBOARDS');
/*!40000 ALTER TABLE `profile_view_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_view_dashboard`
--

DROP TABLE IF EXISTS `profile_view_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_view_dashboard` (
  `view_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `dashboard_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dashboard_column` int NOT NULL,
  `dashboard_order` int NOT NULL,
  PRIMARY KEY (`view_key`,`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_view_dashboard`
--

LOCK TABLES `profile_view_dashboard` WRITE;
/*!40000 ALTER TABLE `profile_view_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_view_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_view_profile`
--

DROP TABLE IF EXISTS `profile_view_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_view_profile` (
  `view_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `profile_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`view_key`,`profile_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_view_profile`
--

LOCK TABLES `profile_view_profile` WRITE;
/*!40000 ALTER TABLE `profile_view_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_view_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_workgroup`
--

DROP TABLE IF EXISTS `profile_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_workgroup` (
  `profile_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `workgroup_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_key`,`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_workgroup`
--

LOCK TABLES `profile_workgroup` WRITE;
/*!40000 ALTER TABLE `profile_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_workgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencelist_item`
--

DROP TABLE IF EXISTS `referencelist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencelist_item` (
  `id_reference_item` int NOT NULL AUTO_INCREMENT,
  `name` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `idreference` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_reference_item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencelist_item`
--

LOCK TABLES `referencelist_item` WRITE;
/*!40000 ALTER TABLE `referencelist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencelist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencelist_reference`
--

DROP TABLE IF EXISTS `referencelist_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencelist_reference` (
  `id_reference` int NOT NULL AUTO_INCREMENT,
  `name` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_reference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencelist_reference`
--

LOCK TABLES `referencelist_reference` WRITE;
/*!40000 ALTER TABLE `referencelist_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencelist_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencelist_translation`
--

DROP TABLE IF EXISTS `referencelist_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencelist_translation` (
  `id_translation` int NOT NULL AUTO_INCREMENT,
  `lang` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_reference_item` int NOT NULL,
  PRIMARY KEY (`id_translation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencelist_translation`
--

LOCK TABLES `referencelist_translation` WRITE;
/*!40000 ALTER TABLE `referencelist_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencelist_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regularexpression_regular_expression`
--

DROP TABLE IF EXISTS `regularexpression_regular_expression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `regularexpression_regular_expression` (
  `id_expression` int NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `regular_expression_value` mediumtext COLLATE utf8mb3_unicode_ci,
  `valid_exemple` mediumtext COLLATE utf8mb3_unicode_ci,
  `information_message` mediumtext COLLATE utf8mb3_unicode_ci,
  `error_message` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_expression`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regularexpression_regular_expression`
--

LOCK TABLES `regularexpression_regular_expression` WRITE;
/*!40000 ALTER TABLE `regularexpression_regular_expression` DISABLE KEYS */;
INSERT INTO `regularexpression_regular_expression` VALUES
(1,'Fichier JPG','image/jpeg','image/jpeg','Expression régulière pour les fichiers de type jpeg.','Le format du fichier n\'est pas valide. Veuillez choisir une image de type jpeg.'),
(2,'Email','(^([a-zA-Z0-9]+(([\\.\\-\\_]?[a-zA-Z0-9]+)+)?)\\@(([a-zA-Z0-9]+[\\.\\-\\_])+[a-zA-Z]{2,4})$)|(^$)','admin@lutece.fr','Expression régulière pour les emails.','Le format de l\'email est incorrect.');
/*!40000 ALTER TABLE `regularexpression_regular_expression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solr_facet_intersection`
--

DROP TABLE IF EXISTS `solr_facet_intersection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `solr_facet_intersection` (
  `id_field1` int DEFAULT NULL,
  `id_field2` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solr_facet_intersection`
--

LOCK TABLES `solr_facet_intersection` WRITE;
/*!40000 ALTER TABLE `solr_facet_intersection` DISABLE KEYS */;
/*!40000 ALTER TABLE `solr_facet_intersection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solr_fields`
--

DROP TABLE IF EXISTS `solr_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `solr_fields` (
  `id_field` int NOT NULL,
  `name` varchar(75) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_facet` tinyint(1) DEFAULT '0',
  `enable_facet` tinyint(1) DEFAULT '0',
  `is_sort` tinyint(1) DEFAULT '0',
  `enable_sort` tinyint(1) DEFAULT '0',
  `default_sort` tinyint(1) DEFAULT '0',
  `weight` float DEFAULT '0',
  `facet_mincount` int DEFAULT '1',
  `operator_type` varchar(30) COLLATE utf8mb3_unicode_ci DEFAULT 'OR',
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solr_fields`
--

LOCK TABLES `solr_fields` WRITE;
/*!40000 ALTER TABLE `solr_fields` DISABLE KEYS */;
INSERT INTO `solr_fields` VALUES
(1,'site','Site','Site',1,1,0,0,0,0,1,'OR'),
(2,'type','Type','Type',1,1,0,0,0,0,1,'OR'),
(3,'date','Date','Date',1,1,1,1,0,0,1,'OR'),
(4,'score','Score','Score',0,0,1,1,1,0,1,'OR'),
(5,'categorie','Categorie','Category',1,1,0,0,0,0,1,'OR'),
(6,'title','title','Title',0,0,0,0,0,10,1,'AND'),
(7,'content','content','Content',0,0,0,0,0,0.1,1,'AND'),
(8,'summary','summary','Summary',0,0,0,0,0,1,1,'AND');
/*!40000 ALTER TABLE `solr_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solr_indexer_action`
--

DROP TABLE IF EXISTS `solr_indexer_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `solr_indexer_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `id_document` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_task` int NOT NULL DEFAULT '0',
  `type_ressource` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_portlet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solr_indexer_action`
--

LOCK TABLES `solr_indexer_action` WRITE;
/*!40000 ALTER TABLE `solr_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `solr_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_action`
--

DROP TABLE IF EXISTS `workflow_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_action` (
  `id_action` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb3_unicode_ci,
  `id_workflow` int DEFAULT NULL,
  `id_state_after` int DEFAULT NULL,
  `id_alternative_state_after` int DEFAULT NULL,
  `id_icon` int DEFAULT NULL,
  `is_automatic` smallint DEFAULT '0',
  `is_mass_action` smallint DEFAULT '0',
  `display_order` int DEFAULT '0',
  `is_automatic_reflexive_action` smallint DEFAULT '0',
  `uid_action` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_action`),
  KEY `action_id_workflow_fk` (`id_workflow`),
  KEY `action_id_state_after_fk` (`id_state_after`),
  KEY `action_id_icon_fk` (`id_icon`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_action`
--

LOCK TABLES `workflow_action` WRITE;
/*!40000 ALTER TABLE `workflow_action` DISABLE KEYS */;
INSERT INTO `workflow_action` VALUES
(1,'action 1','test',1,2,-1,1,0,0,1,0,'ea85ae4d-7dc6-4859-bd85-2d6be662bbb5');
/*!40000 ALTER TABLE `workflow_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_action_action`
--

DROP TABLE IF EXISTS `workflow_action_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_action_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `id_linked_action` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`,`id_linked_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_action_action`
--

LOCK TABLES `workflow_action_action` WRITE;
/*!40000 ALTER TABLE `workflow_action_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_action_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_action_state_before`
--

DROP TABLE IF EXISTS `workflow_action_state_before`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_action_state_before` (
  `id_action` int NOT NULL,
  `id_state_before` int NOT NULL,
  PRIMARY KEY (`id_action`,`id_state_before`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_action_state_before`
--

LOCK TABLES `workflow_action_state_before` WRITE;
/*!40000 ALTER TABLE `workflow_action_state_before` DISABLE KEYS */;
INSERT INTO `workflow_action_state_before` VALUES
(1,1);
/*!40000 ALTER TABLE `workflow_action_state_before` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assignment_history`
--

DROP TABLE IF EXISTS `workflow_assignment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_assignment_history` (
  `id_history` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL,
  `workgroup_key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_history`,`id_task`,`workgroup_key`),
  KEY `assignment_id_history_fk` (`id_history`),
  KEY `assignment_id_task_fk` (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assignment_history`
--

LOCK TABLES `workflow_assignment_history` WRITE;
/*!40000 ALTER TABLE `workflow_assignment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assignment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_icon`
--

DROP TABLE IF EXISTS `workflow_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_icon` (
  `id_icon` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mime_type` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_value` mediumblob,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  PRIMARY KEY (`id_icon`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_icon`
--

LOCK TABLES `workflow_icon` WRITE;
/*!40000 ALTER TABLE `workflow_icon` DISABLE KEYS */;
INSERT INTO `workflow_icon` VALUES
(1,'Valider','image/png','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0ש��\0\0�PLTE�����������������������������������Ӳ�۳�������Ώ��w��c��}}}O~�Gq�NNN\r�����������������������������������������������������������������ʺ�������ï�ϭ�ة�֤�գ�Դ����������������ǧ����ɋ�ɣ�����������}���z��x��v�����r�����f��b��_��]�����Y��X��W��U��T��yyywwwuuuN}�sssLy�nnnIt�Hs�Gr�[htGl�Bj�Bi�___@f�]^^=b�<`�VY[<_~PZ`VVV5VtOOOKOR3Rn3Qk2Qm@LT:M^HHH<AC<?A)AX<<<1>I(=Q&<Q$:O\'9J&9I$7I,5;-01!2B&08,,,-=+:\'\'\'#(,%%%$$$(	�S%\0\0\0tRNS\0@��f\0\0\0�IDATx�c`���Ffl�\\bb\Z�X$ll�Kx90�\r�E�������)�U�/�f��Ue⑺�\Z��u�;yY�|V&�\Z�S?�Xu�7ؒ��Y�6����Z��5pV��;�10����r#�fv��c�r�Μ�Ɖd�t��g�OtOX{��J\05\n����L\nTFq+Kz����}Tm��[BBE�%R5т�ɮN$&�R�I��2i	�z,���U�!颈%�ٛ\'Gp�`�:%v5Vi���\0\0�K+�; ��\0\0\0\0IEND�B`�',14,14),
(2,'Refuser','image/png','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0ש��\0\0CPLTE�������������L6���������������������;\"�:\"�����������������Ǵ��;�����������������������ž���������������xhqqq�N7�M7�M6mmm�;\"�;\"�;\"___�;\"�;\"�;\"�;$�9\"\\\\\\�8!WWWTTT�.NL<--������������������������������������������������������������������������ݍ}�������������p�������������p[�o[�ra�ra����m[�n^�������fS�cN�_I~~~zzz�cTxxxvvv�VA�R:ttt�[Jrrrnnn�M6llljjj�F/�A)ccc�F2�?\'�?(�=%�;\"�>\'�<$�=&�:\"�:#�9\"�9\"�7 �6 �:&�5!QQQ�1�1�/�0�/�/�,�&�&>>>P3.;86e$F/*\\%50.W!B 9\";\Z&&&<N\rI$$$3A7\Z5.- ,.107%\Z&\Z/$(\n\"\r#%\n,!			V�o\0\0\0tRNS\0@��f\0\0sIDATx�c`�.��fc�q��1s�k��A؁K�qA��f�d��r0پkS�7K�1�%�e�Y�\nq00�.��4���\r��<�ESK}F�8��x�I�T�����YxxXf�lIn���L�jW�5����讜��;���`Nd��b��7,*��W� ��\nw/+{�%/�j붩����H^��6Z����kl�!i��w&�\r�5M��zmV�ܜH>��k\'l-��n��fGؑ�P٠ww��(��-k��ʛ��l�\'[�[e���f�j.�?��%���(W�b�0�P��X%\"������d�Y�$L�U�V	A�b�[�]\'��h\'��Ίu���PK��Ed�����Uv��#���=��l�nN6H��c3�q��K\071P����\0\0\0\0IEND�B`�',14,14),
(3,'Commentaire','image/png','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szz�\0\0\0gAMA\0\0�ܲ�\0\0xIDATx�ŖMl����e��͇��\rd�4��!(@�\"N8J�{�máj�H��Q��R7�j�*=��*U����\n@|�@L�l�ކuL$\'1��g<��3�>=�D٬�v�~���4���y�y��\0�g	�nܿ��ӧO�<�˲��4-��\0+�x�ԩ����߬����۷�x<�M$����	���H$�m:�~�]\0��s��ի�w:�wuu���vlA�$I���rH&���x��KKKQƘV�l\"�$I\\ ���~Y	`���l��T(H7ʛ&es9�f����(��S�P�J511�Ȱ��ܹs�޵kW��H�2�dln��	N�@�������e�q0Ms���j\r�B!�\\	x�GN�����Lb~dz>��\Z �q�Z�1�ܹ�vhh�����v��������Y\n��P]Ws|ZK,}}\0c�\\aQq�p8�]$Y�=:244t�ƍI$Y������\0����,X\Z\Z�:0\0�iª� ���}�Ń[,��ᘮ�	�ҥKWc����ŋ�utt�����������?-,,�cE?���8���4��\n\0����\0Y ��`0����=�g��޽{�aؚ��ۈ�����n��^Vd3�<���%	*��\r	�\0UU166v+�=\0茱��O��N�R����]�������߽{W�o�>���=��$a��/P�N���x�ZY+]�$!�Hеk�FE�f=�<�^�z�*\nٝN�ޞ�����nW>��(��$���_ce~m�ðUU��v���`0�\Z�3���\Z�\0�g�<y�X,����x<��(H�*ҙҟ|���|�������(�ٳg�����\0d�^\"�R%899�e�������x��p���?��Q]U\"�V��\0/_�\\�}���\0�X�u��w���R�e<�]��n�E�qx�/[��׵�}K9a���K����z����F4\Z���0�ZP���Yo]��y��Ȯ�.� �z���l�������Z����\'�r�`h͖7�\nSL�\0D�߿o�দ&:t������@(���\08\0��2,R�l6[�����T*EDD�a�a�(\n]�|�DQ�;vБ#G�֭[DDd�&i�F��Q>����/[UURU�2�ݼy3\0��$@ggg���K&��0M����ݻG�w�&\0���JW�\\!UUI�u�4m#�:@&�!EQ�������\0Ԕ8{��o��,-//`3ě7ohpp�\0���L&C����UU�دi\Z��I�?�ZZZ�\0��HΟ?�����s��v;\0������p��I�|>���B�$477�j��1�0 �\"�\0c�@�8s��W�D�\0JΏ��N���Q�4����ڣG��Ν;�)��S*�\"EQ(�JQ8����Y\0{�i^�1p��Z���~��1��	��q��ፎ \"躎l6���9H��0\0����J�\'� kjj���ŋ�rC&c�L�$]��0\"\"Z]]�h4J<�H$BDDǎ���@?��4$�ɕB��i9���k�&��4^�~�t:������@�e�F�* \0��.��n���b>�� Q����k�nwC{{{CgggM__�V+\0`qq�x<>_)��އB�?�i��7@�Z��?r�\\n�����|�����X,�����O��%\0�\0�\0��h�0@�o�z�*����M]<6�H \0\0\0\0IEND�B`�',14,14);
/*!40000 ALTER TABLE `workflow_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_prerequisite`
--

DROP TABLE IF EXISTS `workflow_prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_prerequisite` (
  `id_prerequisite` int NOT NULL AUTO_INCREMENT,
  `id_action` int NOT NULL,
  `prerequisite_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `uid_prerequisite` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_prerequisite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_prerequisite`
--

LOCK TABLES `workflow_prerequisite` WRITE;
/*!40000 ALTER TABLE `workflow_prerequisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_prerequisite_duration_cf`
--

DROP TABLE IF EXISTS `workflow_prerequisite_duration_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_prerequisite_duration_cf` (
  `id_prerequisite` int NOT NULL,
  `duration` int NOT NULL,
  PRIMARY KEY (`id_prerequisite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_prerequisite_duration_cf`
--

LOCK TABLES `workflow_prerequisite_duration_cf` WRITE;
/*!40000 ALTER TABLE `workflow_prerequisite_duration_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_prerequisite_duration_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_history`
--

DROP TABLE IF EXISTS `workflow_resource_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_resource_history` (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `id_resource` int DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_workflow` int DEFAULT NULL,
  `id_action` int DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_access_code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_history`),
  KEY `history_id_workflow_fk` (`id_workflow`),
  KEY `history_id_action_fk` (`id_action`),
  KEY `history_id_resource_fk` (`id_resource`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_history`
--

LOCK TABLES `workflow_resource_history` WRITE;
/*!40000 ALTER TABLE `workflow_resource_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_user_history`
--

DROP TABLE IF EXISTS `workflow_resource_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_resource_user_history` (
  `id_history` int NOT NULL,
  `user_access_code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `realm` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_history`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_user_history`
--

LOCK TABLES `workflow_resource_user_history` WRITE;
/*!40000 ALTER TABLE `workflow_resource_user_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_workflow`
--

DROP TABLE IF EXISTS `workflow_resource_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_resource_workflow` (
  `id_resource` int NOT NULL DEFAULT '0',
  `resource_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_state` int DEFAULT NULL,
  `id_workflow` int NOT NULL,
  `id_external_parent` int DEFAULT NULL,
  `is_associated_workgroups` smallint DEFAULT '0',
  PRIMARY KEY (`id_resource`,`resource_type`,`id_workflow`),
  KEY `workflow_resource_workflow_id_resource_fk` (`id_resource`),
  KEY `workflow_resource_workflow_resource_type_fk` (`resource_type`),
  KEY `workflow_resource_workflow_id_workflow_fk` (`id_workflow`),
  KEY `fk_document_id_state` (`id_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_workflow`
--

LOCK TABLES `workflow_resource_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_resource_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_workgroup`
--

DROP TABLE IF EXISTS `workflow_resource_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_resource_workgroup` (
  `id_resource` int NOT NULL DEFAULT '0',
  `resource_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_workflow` int DEFAULT NULL,
  `workgroup_key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `workflow_resource_workgroup_id_resource_fk` (`id_resource`),
  KEY `workflow_resource_workgroup_resource_type_fk` (`resource_type`),
  KEY `workflow_resource_workgroup_id_workflow_fk` (`id_workflow`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_workgroup`
--

LOCK TABLES `workflow_resource_workgroup` WRITE;
/*!40000 ALTER TABLE `workflow_resource_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_workgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_state`
--

DROP TABLE IF EXISTS `workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_state` (
  `id_state` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb3_unicode_ci,
  `id_workflow` int DEFAULT NULL,
  `is_initial_state` smallint DEFAULT '0',
  `is_required_workgroup_assigned` smallint DEFAULT '0',
  `id_icon` int DEFAULT NULL,
  `display_order` int DEFAULT '0',
  `uid_state` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_state`),
  KEY `fk_state_id_workflow` (`id_workflow`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_state`
--

LOCK TABLES `workflow_state` WRITE;
/*!40000 ALTER TABLE `workflow_state` DISABLE KEYS */;
INSERT INTO `workflow_state` VALUES
(1,'depart','test',1,1,0,1,1,'23b7dc57-c6f2-4645-a211-7e04a28ea58b'),
(2,'stop','test',1,0,0,NULL,2,'11b5e20b-aa66-4ac5-926b-269eb876e24b');
/*!40000 ALTER TABLE `workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task`
--

DROP TABLE IF EXISTS `workflow_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task` (
  `id_task` int NOT NULL AUTO_INCREMENT,
  `task_type_key` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_action` int NOT NULL DEFAULT '0',
  `display_order` int DEFAULT '0',
  `uid_task` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`),
  KEY `task_id_action_fk` (`id_action`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task`
--

LOCK TABLES `workflow_task` WRITE;
/*!40000 ALTER TABLE `workflow_task` DISABLE KEYS */;
INSERT INTO `workflow_task` VALUES
(1,'taskTypeNotification',1,1,'e0d4ec65-47d6-46c7-add9-efbc8473a5b6'),
(2,'taskNotifyGru',1,2,'84faa318-7b34-469a-80ad-6b586d8b2175');
/*!40000 ALTER TABLE `workflow_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_alert_gru_cf`
--

DROP TABLE IF EXISTS `workflow_task_alert_gru_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_alert_gru_cf` (
  `id_task` int NOT NULL,
  `id_spring_provider` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `marker_provider_ids` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_status` int DEFAULT NULL,
  `crm_status_id` int DEFAULT '1',
  `set_onglet` smallint DEFAULT NULL,
  `message_guichet` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status_text_guichet` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_guichet` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_guichet` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_max_step_guichet` smallint DEFAULT '1',
  `demand_user_current_step_guichet` smallint DEFAULT '1',
  `is_active_onglet_guichet` smallint DEFAULT '0',
  `status_text_agent` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_active_onglet_agent` smallint NOT NULL DEFAULT '0',
  `subject_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sender_name_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cc_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_email` smallint DEFAULT '0',
  `message_sms` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `billing_account_sms` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `billing_group_sms` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_sms` smallint NOT NULL DEFAULT '0',
  `id_mailing_list_broadcast` int DEFAULT NULL,
  `email_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_broadcast` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `recipients_cc_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_broadcast` smallint DEFAULT '0',
  `days_to_alert` int DEFAULT NULL,
  `id_state_after` int DEFAULT NULL,
  `alert_subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `marker_alert` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `alert_after_before` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_alert_gru_cf`
--

LOCK TABLES `workflow_task_alert_gru_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_alert_gru_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_alert_gru_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_archive_cf`
--

DROP TABLE IF EXISTS `workflow_task_archive_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_archive_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `next_state` int NOT NULL,
  `type_archival` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `delay_archival` int DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_archive_cf`
--

LOCK TABLES `workflow_task_archive_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_archive_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_archive_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_archive_resource`
--

DROP TABLE IF EXISTS `workflow_task_archive_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_archive_resource` (
  `id_resource` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL DEFAULT '0',
  `initial_date` timestamp NULL DEFAULT NULL,
  `archival_date` timestamp NULL DEFAULT NULL,
  `is_archived` smallint DEFAULT '0',
  PRIMARY KEY (`id_resource`,`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_archive_resource`
--

LOCK TABLES `workflow_task_archive_resource` WRITE;
/*!40000 ALTER TABLE `workflow_task_archive_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_archive_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_assignment_cf`
--

DROP TABLE IF EXISTS `workflow_task_assignment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_assignment_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_multiple_owner` smallint DEFAULT '0',
  `is_notify` smallint DEFAULT '0',
  `message` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_use_user_name` smallint DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_assignment_cf`
--

LOCK TABLES `workflow_task_assignment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_assignment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_assignment_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_change_appointment_status_cf`
--

DROP TABLE IF EXISTS `workflow_task_change_appointment_status_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_change_appointment_status_cf` (
  `id_task` int NOT NULL,
  `appointment_status` int DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_change_appointment_status_cf`
--

LOCK TABLES `workflow_task_change_appointment_status_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_change_appointment_status_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_change_appointment_status_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_change_state_config`
--

DROP TABLE IF EXISTS `workflow_task_change_state_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_change_state_config` (
  `id_task` int NOT NULL DEFAULT '0',
  `id_next_state` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_change_state_config`
--

LOCK TABLES `workflow_task_change_state_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_change_state_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_change_state_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_change_state_information`
--

DROP TABLE IF EXISTS `workflow_task_change_state_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_change_state_information` (
  `id_history` int NOT NULL,
  `id_task` int NOT NULL,
  `new_state` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_change_state_information`
--

LOCK TABLES `workflow_task_change_state_information` WRITE;
/*!40000 ALTER TABLE `workflow_task_change_state_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_change_state_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_choice_config`
--

DROP TABLE IF EXISTS `workflow_task_choice_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_choice_config` (
  `id_task` int NOT NULL DEFAULT '0',
  `message` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_choice_config`
--

LOCK TABLES `workflow_task_choice_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_choice_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_choice_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_choose_state_config`
--

DROP TABLE IF EXISTS `workflow_task_choose_state_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_choose_state_config` (
  `id_task` int NOT NULL DEFAULT '0',
  `controller_name` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_state_ok` int NOT NULL,
  `id_state_ko` int NOT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_choose_state_config`
--

LOCK TABLES `workflow_task_choose_state_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_choose_state_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_choose_state_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_choose_state_information`
--

DROP TABLE IF EXISTS `workflow_task_choose_state_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_choose_state_information` (
  `id_history` int NOT NULL,
  `id_task` int NOT NULL,
  `new_state` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_choose_state_information`
--

LOCK TABLES `workflow_task_choose_state_information` WRITE;
/*!40000 ALTER TABLE `workflow_task_choose_state_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_choose_state_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_comment_config`
--

DROP TABLE IF EXISTS `workflow_task_comment_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_comment_config` (
  `id_task` int NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_mandatory` smallint DEFAULT '0',
  `is_richtext` smallint DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_comment_config`
--

LOCK TABLES `workflow_task_comment_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_comment_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_comment_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_comment_value`
--

DROP TABLE IF EXISTS `workflow_task_comment_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_comment_value` (
  `id_history` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL,
  `comment_value` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_history`,`id_task`),
  KEY `comment_value_id_history_fk` (`id_history`),
  KEY `comment_value_id_task_fk` (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_comment_value`
--

LOCK TABLES `workflow_task_comment_value` WRITE;
/*!40000 ALTER TABLE `workflow_task_comment_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_comment_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_confirm_action_config`
--

DROP TABLE IF EXISTS `workflow_task_confirm_action_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_confirm_action_config` (
  `id_task` int NOT NULL DEFAULT '0',
  `message` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_confirm_action_config`
--

LOCK TABLES `workflow_task_confirm_action_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_confirm_action_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_confirm_action_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_manual_app_notify`
--

DROP TABLE IF EXISTS `workflow_task_manual_app_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_manual_app_notify` (
  `id_notif` int NOT NULL,
  `id_history` int DEFAULT NULL,
  `id_appointment` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_notif`),
  KEY `idx_wf_task_manual_app_notify` (`id_appointment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_manual_app_notify`
--

LOCK TABLES `workflow_task_manual_app_notify` WRITE;
/*!40000 ALTER TABLE `workflow_task_manual_app_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_manual_app_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notification_cf`
--

DROP TABLE IF EXISTS `workflow_task_notification_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notification_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `id_mailing_list` int DEFAULT NULL,
  `sender_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notification_cf`
--

LOCK TABLES `workflow_task_notification_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notification_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notification_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_admin_appointment_cf`
--

DROP TABLE IF EXISTS `workflow_task_notify_admin_appointment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_admin_appointment_cf` (
  `id_task` int NOT NULL,
  `id_admin_user` int DEFAULT NULL,
  `sender_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb3_unicode_ci,
  `recipients_cc` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `recipients_bcc` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_action_cancel` int DEFAULT NULL,
  `id_action_validate` int DEFAULT NULL,
  `ical_notification` smallint DEFAULT '0',
  `create_notif` smallint DEFAULT '0',
  `location` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_admin_appointment_cf`
--

LOCK TABLES `workflow_task_notify_admin_appointment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_admin_appointment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_admin_appointment_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_appointment_cf`
--

DROP TABLE IF EXISTS `workflow_task_notify_appointment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_appointment_cf` (
  `id_task` int NOT NULL,
  `sender_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb3_unicode_ci,
  `recipients_cc` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `recipients_bcc` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_action_cancel` int DEFAULT NULL,
  `ical_notification` smallint DEFAULT '0',
  `create_notif` smallint DEFAULT '0',
  `location` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `is_sms` smallint DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_appointment_cf`
--

LOCK TABLES `workflow_task_notify_appointment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_appointment_crm`
--

DROP TABLE IF EXISTS `workflow_task_notify_appointment_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_appointment_crm` (
  `id_task` int NOT NULL,
  `id_demand_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status_text` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_status_crm` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `object` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_appointment_crm`
--

LOCK TABLES `workflow_task_notify_appointment_crm` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_crm` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_crm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_gru_cf`
--

DROP TABLE IF EXISTS `workflow_task_notify_gru_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_gru_cf` (
  `id_task` int NOT NULL,
  `id_spring_provider` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `marker_provider_ids` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_status` int DEFAULT NULL,
  `crm_status_id` int DEFAULT '1',
  `set_onglet` smallint DEFAULT NULL,
  `message_guichet` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status_text_guichet` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_guichet` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_guichet` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_max_step_guichet` smallint DEFAULT '1',
  `demand_user_current_step_guichet` smallint DEFAULT '1',
  `is_active_onglet_guichet` smallint DEFAULT '0',
  `status_text_agent` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_active_onglet_agent` smallint NOT NULL DEFAULT '0',
  `subject_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sender_name_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cc_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_email` smallint DEFAULT '0',
  `message_sms` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `billing_account_sms` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `billing_group_sms` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_sms` smallint NOT NULL DEFAULT '0',
  `id_mailing_list_broadcast` int DEFAULT NULL,
  `email_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_broadcast` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `recipients_cc_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_broadcast` smallint DEFAULT '0',
  `content_cleaned` smallint DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_gru_cf`
--

LOCK TABLES `workflow_task_notify_gru_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_gru_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_gru_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_gru_mapping_manager`
--

DROP TABLE IF EXISTS `workflow_task_notify_gru_mapping_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_gru_mapping_manager` (
  `id_notifygrumappingmanager` int NOT NULL,
  `beankey` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `connection_id` int NOT NULL DEFAULT '0',
  `customer_id` int NOT NULL DEFAULT '0',
  `mobilephonenumber` int NOT NULL DEFAULT '0',
  `fixedphonenumber` int NOT NULL DEFAULT '0',
  `email` int NOT NULL DEFAULT '0',
  `demandetype` int NOT NULL DEFAULT '0',
  `demand_reference` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_notifygrumappingmanager`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_gru_mapping_manager`
--

LOCK TABLES `workflow_task_notify_gru_mapping_manager` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_gru_mapping_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_gru_mapping_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_reminder_cf`
--

DROP TABLE IF EXISTS `workflow_task_notify_reminder_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_reminder_cf` (
  `id_task` int NOT NULL,
  `id_form` int NOT NULL DEFAULT '0',
  `nb_alerts` int DEFAULT '0',
  PRIMARY KEY (`id_task`,`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_reminder_cf`
--

LOCK TABLES `workflow_task_notify_reminder_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_reminder_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_reminder_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_update_admin_appointment`
--

DROP TABLE IF EXISTS `workflow_task_update_admin_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_update_admin_appointment` (
  `id_update` int NOT NULL,
  `id_history` int DEFAULT NULL,
  `id_appointment` int DEFAULT NULL,
  `id_admin_user` int DEFAULT NULL,
  PRIMARY KEY (`id_update`),
  KEY `idx_wf_task_update_admin_app` (`id_appointment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_update_admin_appointment`
--

LOCK TABLES `workflow_task_update_admin_appointment` WRITE;
/*!40000 ALTER TABLE `workflow_task_update_admin_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_update_admin_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_update_appointment_cancel_cf`
--

DROP TABLE IF EXISTS `workflow_task_update_appointment_cancel_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_update_appointment_cancel_cf` (
  `id_task` int NOT NULL,
  `id_action_cancel` int DEFAULT NULL,
  `id_action_report` int DEFAULT NULL,
  PRIMARY KEY (`id_task`),
  KEY `fk_wf_task_up_app_cancel_cf` (`id_action_cancel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_update_appointment_cancel_cf`
--

LOCK TABLES `workflow_task_update_appointment_cancel_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_update_appointment_cancel_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_update_appointment_cancel_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workflow`
--

DROP TABLE IF EXISTS `workflow_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_workflow` (
  `id_workflow` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb3_unicode_ci,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_enabled` smallint DEFAULT '0',
  `workgroup_key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uid_workflow` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_workflow`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workflow`
--

LOCK TABLES `workflow_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_workflow` DISABLE KEYS */;
INSERT INTO `workflow_workflow` VALUES
(1,'test','test','2025-07-18 10:27:20',0,'all','64290e56-cf04-43a9-8fa5-71da4e47add3');
/*!40000 ALTER TABLE `workflow_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workgroup_cf`
--

DROP TABLE IF EXISTS `workflow_workgroup_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_workgroup_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `workgroup_key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_mailing_list` int DEFAULT NULL,
  PRIMARY KEY (`id_task`,`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workgroup_cf`
--

LOCK TABLES `workflow_workgroup_cf` WRITE;
/*!40000 ALTER TABLE `workflow_workgroup_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_workgroup_cf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-18 20:24:05
