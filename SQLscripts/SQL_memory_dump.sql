CREATE DATABASE  IF NOT EXISTS `university_db_test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `university_db_test`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: university_db_test
-- ------------------------------------------------------
-- Server version	5.5.53

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
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(100) NOT NULL,
  `fac_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Department_fac_id_324cf15f_fk_Faculty_id` (`fac_id`),
  CONSTRAINT `Department_fac_id_324cf15f_fk_Faculty_id` FOREIGN KEY (`fac_id`) REFERENCES `Faculty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'Інформаційних технологій',1),(2,'Філософії, політології та українознавства',1),(3,'Вищої математики і математичного моделювання',1),(4,'Інформаційно-вимірювальних технологій електроніки та інженерії',1),(5,'Дизайну',1),(6,'Технічної кібернетики',1),(7,'Іноземних мов',1),(8,'Інформатики і комп’ютерних наук',1),(9,'Економіки і підприємництва',2),(10,'Економічної кібернетики та управління проектами',2),(11,'Обліку і аудиту',2),(12,'Податкової та бюджетної політики',2),(13,'Фінансів і кредиту',2),(14,'Товарознавства, стандартизації та сертифікації',4),(15,'Економічної кібернетики та управління проектами',4),(16,'Експертизи, технології і дизайну текстилю',4),(17,'Харчових технологій',4),(18,'Хімії і екології',4),(19,'Хімічних технологій, експертизи та безпеки харчової продукції',4),(20,'Державного управління і місцевого самоврядування',3),(21,'Зовнішньоекономічної діяльності',3),(22,'Менеджменту та маркетингу',3),(23,'Теорії та практики галузевого перекладу',3),(24,'Cистем технологій та менеджменту виробництва',5),(25,'Транспортні системи і технічний сервіс',5),(26,'Енергетики, електротехніки і фізики',5),(27,'Фізичного виховання',5);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fac_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (1,'Кібернетики та системної інженерії'),(2,'Економіки'),(3,'Міжнародних економічних відносин, управління і бізнесу'),(4,'Інтегрованих технологій'),(5,'Інженерії та транспорту');
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login_user`
--

DROP TABLE IF EXISTS `Login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `login` varchar(50) NOT NULL,
  `regkey` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login_user`
--

LOCK TABLES `Login_user` WRITE;
/*!40000 ALTER TABLE `Login_user` DISABLE KEYS */;
INSERT INTO `Login_user` VALUES (1,'md5$QHx8dvERf8Qc$59fd3bd6ef1051615ddce23bfaab900a','2017-07-29 13:54:27',1,'siteadmin','',NULL,'','','',1,1),(2,'md5$SUCjHMiaCgbp$ec9b57c23618f1dd0ab768817b1b3ffe','2017-07-29 08:28:04',0,'test_teacher1','test_key1',NULL,'Пупкин','Аристарх','Сократович',1,0),(3,'md5$ArNomJvOYZsF$033d58cfed2df0764dd76c6d45ed80fd','2017-07-29 14:17:16',0,'test_student1','test_key2',NULL,'Крючковський','Олександр','Михайлович',1,0),(4,'md5$HJ9it2LFYmd6$189e55b888277761adf6a83fad4b13c7','2017-07-29 11:39:07',0,'test_student2','test_key3',NULL,'Осауленко','Георгій','Петрович',1,0),(5,'md5$OdYfHScWC0Xp$d5e305662dfde703637a476e67220a17',NULL,0,'test_student3','test_key4',NULL,'Антонов','Кирило','Леонідович',1,0);
/*!40000 ALTER TABLE `Login_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login_user_groups`
--

DROP TABLE IF EXISTS `Login_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Login_user_groups_user_id_group_id_e38488d9_uniq` (`user_id`,`group_id`),
  KEY `Login_user_groups_group_id_7d4f5164_fk_auth_group_id` (`group_id`),
  CONSTRAINT `Login_user_groups_group_id_7d4f5164_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `Login_user_groups_user_id_1bf00fd4_fk_Login_user_id` FOREIGN KEY (`user_id`) REFERENCES `Login_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login_user_groups`
--

LOCK TABLES `Login_user_groups` WRITE;
/*!40000 ALTER TABLE `Login_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `Login_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login_user_user_permissions`
--

DROP TABLE IF EXISTS `Login_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Login_user_user_permissions_user_id_permission_id_49d842f7_uniq` (`user_id`,`permission_id`),
  KEY `Login_user_user_perm_permission_id_23e2afaa_fk_auth_perm` (`permission_id`),
  CONSTRAINT `Login_user_user_permissions_user_id_7facbddd_fk_Login_user_id` FOREIGN KEY (`user_id`) REFERENCES `Login_user` (`id`),
  CONSTRAINT `Login_user_user_perm_permission_id_23e2afaa_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login_user_user_permissions`
--

LOCK TABLES `Login_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `Login_user_user_permissions` DISABLE KEYS */;
INSERT INTO `Login_user_user_permissions` VALUES (1,2,38),(2,3,37),(3,4,37),(4,5,37);
/*!40000 ALTER TABLE `Login_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login_wwp_session`
--

DROP TABLE IF EXISTS `Login_wwp_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login_wwp_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  `ip_addr` varchar(20) DEFAULT NULL,
  `login_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `Login_wwp_session_expire_date_1218fccc` (`expire_date`),
  KEY `Login_wwp_session_user_id_c72875c2_fk_Login_user_id` (`user_id`),
  CONSTRAINT `Login_wwp_session_user_id_c72875c2_fk_Login_user_id` FOREIGN KEY (`user_id`) REFERENCES `Login_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login_wwp_session`
--

LOCK TABLES `Login_wwp_session` WRITE;
/*!40000 ALTER TABLE `Login_wwp_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `Login_wwp_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudGroup`
--

DROP TABLE IF EXISTS `StudGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(10) NOT NULL,
  `dep_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `StudGroup_dep_id_f307020d_fk_Department_id` (`dep_id`),
  CONSTRAINT `StudGroup_dep_id_f307020d_fk_Department_id` FOREIGN KEY (`dep_id`) REFERENCES `Department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudGroup`
--

LOCK TABLES `StudGroup` WRITE;
/*!40000 ALTER TABLE `StudGroup` DISABLE KEYS */;
INSERT INTO `StudGroup` VALUES (1,'1А',1),(2,'2КСМ',1),(3,'4ПР',1),(4,'2ЕП',9),(5,'3Ф',9),(6,'4ЕК',9),(7,'1Х',17),(8,'2ХТ',17),(9,'4ХО',17),(10,'1МР',21),(11,'2МЕВ',21),(12,'3МОс',21),(13,'2ТТ',26),(14,'3НД',26),(15,'4М',26);
/*!40000 ALTER TABLE `StudGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `Student_group_id_cadf8b30` (`group_id`),
  CONSTRAINT `Student_group_id_cadf8b30_fk_StudGroup_id` FOREIGN KEY (`group_id`) REFERENCES `StudGroup` (`id`),
  CONSTRAINT `Student_user_id_a3b33364_fk_Login_user_id` FOREIGN KEY (`user_id`) REFERENCES `Login_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (1,3,3),(2,3,4),(3,3,5);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teacher`
--

DROP TABLE IF EXISTS `Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Teacher_user_id_cb44dc21_fk_Login_user_id` FOREIGN KEY (`user_id`) REFERENCES `Login_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teacher`
--

LOCK TABLES `Teacher` WRITE;
/*!40000 ALTER TABLE `Teacher` DISABLE KEYS */;
INSERT INTO `Teacher` VALUES (1,2);
/*!40000 ALTER TABLE `Teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add content type',2,'add_contenttype'),(5,'Can change content type',2,'change_contenttype'),(6,'Can delete content type',2,'delete_contenttype'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add department',5,'add_department'),(14,'Can change department',5,'change_department'),(15,'Can delete department',5,'delete_department'),(16,'Can add faculty',6,'add_faculty'),(17,'Can change faculty',6,'change_faculty'),(18,'Can delete faculty',6,'delete_faculty'),(19,'Can add student',7,'add_student'),(20,'Can change student',7,'change_student'),(21,'Can delete student',7,'delete_student'),(22,'Can add studgroup',8,'add_studgroup'),(23,'Can change studgroup',8,'change_studgroup'),(24,'Can delete studgroup',8,'delete_studgroup'),(25,'Can add teacher',9,'add_teacher'),(26,'Can change teacher',9,'change_teacher'),(27,'Can delete teacher',9,'delete_teacher'),(28,'Can add ww p_session',10,'add_wwp_session'),(29,'Can change ww p_session',10,'change_wwp_session'),(30,'Can delete ww p_session',10,'delete_wwp_session'),(31,'Can add user',11,'add_user'),(32,'Can change user',11,'change_user'),(33,'Can delete user',11,'delete_user'),(34,'Can add users rights support',12,'add_usersrightssupport'),(35,'Can change users rights support',12,'change_usersrightssupport'),(36,'Can delete users rights support',12,'delete_usersrightssupport'),(37,'Global student rights',12,'student_rights'),(38,'Global teacher rights',12,'teacher_rights');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_Login_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_Login_user_id` FOREIGN KEY (`user_id`) REFERENCES `Login_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-07-27 10:44:52','2','2 ',1,'[{\"added\": {}}]',11,1),(2,'2017-07-27 11:05:38','2','2 Пупкин',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"middle_name\", \"regkey\"]}}]',11,1),(3,'2017-07-27 11:09:05','1','Teacher object',1,'[{\"added\": {}}]',9,1),(4,'2017-07-27 11:30:32','2','2 Пупкин',2,'[]',11,1),(5,'2017-07-27 11:33:22','3','3 ',1,'[{\"added\": {}}]',11,1),(6,'2017-07-27 11:35:13','3','3 Крючковський',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"middle_name\", \"regkey\"]}}]',11,1),(7,'2017-07-27 11:35:42','4','4 ',1,'[{\"added\": {}}]',11,1),(8,'2017-07-27 11:36:38','4','4 Осауленко',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"middle_name\", \"regkey\"]}}]',11,1),(9,'2017-07-27 11:37:19','5','5 ',1,'[{\"added\": {}}]',11,1),(10,'2017-07-27 11:38:04','5','5 Антонов',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"middle_name\", \"regkey\"]}}]',11,1),(11,'2017-07-27 11:38:39','1','3 Крючковський ',1,'[{\"added\": {}}]',7,1),(12,'2017-07-27 11:40:56','2','4 Осауленко ',1,'[{\"added\": {}}]',7,1),(13,'2017-07-27 11:41:08','3','5 Антонов ',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(2,'contenttypes','contenttype'),(5,'Login','department'),(6,'Login','faculty'),(7,'Login','student'),(8,'Login','studgroup'),(9,'Login','teacher'),(11,'Login','user'),(12,'Login','usersrightssupport'),(10,'Login','wwp_session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-07-27 10:12:15'),(2,'contenttypes','0002_remove_content_type_name','2017-07-27 10:12:16'),(3,'auth','0001_initial','2017-07-27 10:12:18'),(4,'auth','0002_alter_permission_name_max_length','2017-07-27 10:12:18'),(5,'auth','0003_alter_user_email_max_length','2017-07-27 10:12:18'),(6,'auth','0004_alter_user_username_opts','2017-07-27 10:12:18'),(7,'auth','0005_alter_user_last_login_null','2017-07-27 10:12:18'),(8,'auth','0006_require_contenttypes_0002','2017-07-27 10:12:18'),(9,'auth','0007_alter_validators_add_error_messages','2017-07-27 10:12:18'),(10,'auth','0008_alter_user_username_max_length','2017-07-27 10:12:18'),(11,'Login','0001_initial','2017-07-27 10:12:23'),(12,'admin','0001_initial','2017-07-27 10:12:24'),(13,'admin','0002_logentry_remove_auto_add','2017-07-27 10:12:24'),(14,'Login','0002_usersrightssupport','2017-07-27 10:58:31'),(15,'Login','0003_auto_20170727_1440','2017-07-27 11:40:46');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'university_db_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-29 17:34:20
