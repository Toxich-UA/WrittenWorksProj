CREATE DATABASE  IF NOT EXISTS `university_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `university_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: university_db
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
-- Table structure for table `Departments`
--

DROP TABLE IF EXISTS `Departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(100) NOT NULL,
  `fac_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_FacultyDep` (`fac_id`),
  CONSTRAINT `FK_FacultyDep` FOREIGN KEY (`fac_id`) REFERENCES `Faculties` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departments`
--

LOCK TABLES `Departments` WRITE;
/*!40000 ALTER TABLE `Departments` DISABLE KEYS */;
INSERT INTO `Departments` VALUES (1,'Інформаційних технологій',1),(2,'Філософії, політології та українознавства',1),(3,'Вищої математики і математичного моделювання',1),(4,'Інформаційно-вимірювальних технологій електроніки та інженерії',1),(5,'Дизайну',1),(6,'Технічної кібернетики',1),(7,'Іноземних мов',1),(8,'Інформатики і комп’ютерних наук',1),(9,'Економіки і підприємництва',2),(10,'Економічної кібернетики та управління проектами',2),(11,'Обліку і аудиту',2),(12,'Податкової та бюджетної політики',2),(13,'Фінансів і кредиту',2),(14,'Товарознавства, стандартизації та сертифікації',4),(15,'Економічної кібернетики та управління проектами',4),(16,'Експертизи, технології і дизайну текстилю',4),(17,'Харчових технологій',4),(18,'Хімії і екології',4),(19,'Хімічних технологій, експертизи та безпеки харчової продукції',4),(20,'Державного управління і місцевого самоврядування',3),(21,'Зовнішньоекономічної діяльності',3),(22,'Менеджменту та маркетингу',3),(23,'Теорії та практики галузевого перекладу',3),(24,'Cистем технологій та менеджменту виробництва',5),(25,'Транспортні системи і технічний сервіс',5),(26,'Енергетики, електротехніки і фізики',5),(27,'Фізичного виховання',5);
/*!40000 ALTER TABLE `Departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documents`
--

DROP TABLE IF EXISTS `Documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `creation_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_UserDoc` (`user_id`),
  CONSTRAINT `FK_UserDoc` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documents`
--

LOCK TABLES `Documents` WRITE;
/*!40000 ALTER TABLE `Documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `Documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculties`
--

DROP TABLE IF EXISTS `Faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fac_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculties`
--

LOCK TABLES `Faculties` WRITE;
/*!40000 ALTER TABLE `Faculties` DISABLE KEYS */;
INSERT INTO `Faculties` VALUES (1,'Кібернетики та системної інженерії'),(2,'Економіки'),(3,'Міжнародних економічних відносин, управління і бізнесу'),(4,'Інтегрованих технологій'),(5,'Інженерії та транспорту');
/*!40000 ALTER TABLE `Faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Groups`
--

DROP TABLE IF EXISTS `Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(10) NOT NULL,
  `dep_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DepGroup` (`dep_id`),
  CONSTRAINT `FK_DepGroup` FOREIGN KEY (`dep_id`) REFERENCES `Departments` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groups`
--

LOCK TABLES `Groups` WRITE;
/*!40000 ALTER TABLE `Groups` DISABLE KEYS */;
INSERT INTO `Groups` VALUES (1,'1А',1),(2,'2КСМ',1),(3,'4ПР',1),(4,'2ЕП',9),(5,'3Ф',9),(6,'4ЕК',9),(7,'1Х',17),(8,'2ХТ',17),(9,'4ХО',17),(10,'1МР',21),(11,'2МЕВ',21),(12,'3МОс',21),(13,'2ТТ',26),(14,'3НД',26),(15,'4М',26);
/*!40000 ALTER TABLE `Groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `FK_GroupStudent` (`group_id`),
  CONSTRAINT `FK_UserStudent` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_GroupStudent` FOREIGN KEY (`group_id`) REFERENCES `Groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (1,2,1),(2,3,1),(3,4,1);
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subjects`
--

DROP TABLE IF EXISTS `Subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subj_name` varchar(100) NOT NULL,
  `dep_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DepSubj` (`dep_id`),
  CONSTRAINT `FK_DepSubj` FOREIGN KEY (`dep_id`) REFERENCES `Departments` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subjects`
--

LOCK TABLES `Subjects` WRITE;
/*!40000 ALTER TABLE `Subjects` DISABLE KEYS */;
INSERT INTO `Subjects` VALUES (1,'Дискретна математика',1),(2,'Основи програмування',1),(3,'Алгоритми та структури даних',1),(4,'Філософія',2),(5,'Соціологія',2),(6,'Історія України',2),(7,'Математичний аналіз',3),(8,'Теорія ймовірностій',3),(9,'Математичне програмування та дослідження операцій',3),(10,'Ціноутворення',9),(11,'Стратегія підприємства',9),(12,'процеси і апарати харчових виробництв',17),(13,'технологія молока та молочних продуктів',17),(14,'Європейська інтеграція',21),(15,'Корпоративне управління',21),(16,'Нетрадиційна енергетика та акумулювання',26),(17,'Фізика і технологія ФЕП',26);
/*!40000 ALTER TABLE `Subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Task_Doc`
--

DROP TABLE IF EXISTS `Task_Doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Task_Doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DocTDoc` (`task_id`),
  CONSTRAINT `FK_TaskTDoc` FOREIGN KEY (`task_id`) REFERENCES `Tasks` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_DocTDoc` FOREIGN KEY (`task_id`) REFERENCES `Documents` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Task_Doc`
--

LOCK TABLES `Task_Doc` WRITE;
/*!40000 ALTER TABLE `Task_Doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `Task_Doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tasks`
--

DROP TABLE IF EXISTS `Tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(100) NOT NULL,
  `description` text,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `estimated_time` datetime DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TeacherTask` (`teacher_id`),
  KEY `FK_GroupTask` (`group_id`),
  CONSTRAINT `FK_TeacherTask` FOREIGN KEY (`teacher_id`) REFERENCES `Teachers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_GroupTask` FOREIGN KEY (`group_id`) REFERENCES `Groups` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tasks`
--

LOCK TABLES `Tasks` WRITE;
/*!40000 ALTER TABLE `Tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teachers`
--

DROP TABLE IF EXISTS `Teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `FK_UserTeacher` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teachers`
--

LOCK TABLES `Teachers` WRITE;
/*!40000 ALTER TABLE `Teachers` DISABLE KEYS */;
INSERT INTO `Teachers` VALUES (1,1);
/*!40000 ALTER TABLE `Teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teachers_Subjects`
--

DROP TABLE IF EXISTS `Teachers_Subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teachers_Subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `subj_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SubjectTSubj` (`teacher_id`),
  CONSTRAINT `FK_TeacherTSubj` FOREIGN KEY (`teacher_id`) REFERENCES `Teachers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_SubjectTSubj` FOREIGN KEY (`teacher_id`) REFERENCES `Subjects` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teachers_Subjects`
--

LOCK TABLES `Teachers_Subjects` WRITE;
/*!40000 ALTER TABLE `Teachers_Subjects` DISABLE KEYS */;
INSERT INTO `Teachers_Subjects` VALUES (1,1,2);
/*!40000 ALTER TABLE `Teachers_Subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `regkey` varchar(100) NOT NULL,
  `email` varchar(70) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'test_teacher1','f30586ba52c3dea50a2432adef065dd8','test_key1',NULL,'Пупкин','Аристарх','Сократович'),(2,'test_student1','a0f88cc778f5b4582da52b18d76ed5d8','test_key2',NULL,'Крючковський','Олександр','Михайлович'),(3,'test_student2','0d275885fea21ff4263bcba2fb75fffe','test_key3',NULL,'Осауленко','Георгій','Петрович'),(4,'test_student3','7a9183f782fce6f092884d8fb7329536','test_key4',NULL,'Антонов','Кирило','Леонідович');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'university_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_groups_deps_facs_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_groups_deps_facs_info`()
BEGIN
	set @rank=0;
    
	select 
			@rank:=@rank+1 as row_num, 
			Groups.group_name, 
			Departments.id, 
			Departments.dep_name, 
			Faculties.id, Faculties.fac_name 
        from Groups
		inner join Departments on Groups.dep_id = Departments.id
		inner join Faculties on Departments.fac_id = Faculties.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `students_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `students_info`()
BEGIN
select 
	Users.last_name, 
	Users.first_name, 
	Users.login, 
	Users.pass, 
	Groups.group_name,
	Departments.dep_name,
	Faculties.fac_name
from Users
inner join Students on Students.user_id = Users.id
inner join Groups on Students.group_id = Groups.id
inner join Departments on Groups.dep_id = Departments.id
inner join Faculties on Departments.fac_id = Faculties.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `teachers_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `teachers_info`()
BEGIN
	select 
		Users.last_name, 
		Users.first_name, 
		Users.login, 
		Users.pass, 
		Subjects.subj_name,
		Departments.dep_name,
		Faculties.fac_name
	from Users
	inner join Teachers on Teachers.user_id = Users.id
	inner join Teachers_Subjects on Teachers_Subjects.teacher_id = Teachers.id	
	inner join Subjects on Teachers_Subjects.subj_id = Subjects.id
	inner join Departments on Subjects.dep_id = Departments.id
	inner join Faculties on Departments.fac_id = Faculties.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-10 15:09:33
