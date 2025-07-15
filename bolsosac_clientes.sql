-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: bolsosac
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_clientes` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Teléfono` varchar(45) DEFAULT NULL,
  `Dirección` varchar(45) DEFAULT NULL,
  `Fecha_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (6,'Garrik','Becket','gbecket5@google.fr','1114697162','Avenida 3','2024-07-01 10:00:00'),(7,'Dougy','Shine','nuevo6@correo.com','7618964340','Cali','2025-06-25 07:58:31'),(8,'Marcela','Bowcock','mbowcock7@dell.com','3011112222','Calle 1','2025-02-04 12:59:05'),(9,'Carlos','Ramírez','dcaulket8@sourceforge.net','3973177105','Calle 4','2025-05-06 06:24:41'),(10,'Juliette','Cockings','jcockings9@gov.uk','4635335821','Barranquilla','2024-08-01 17:07:06'),(11,'Cart','Angliss','canglissa@ucoz.ru','8246935943','Carrera 5','2024-11-13 02:00:59'),(12,'Lesley','Cradey','lcradeyb@lulu.com','5639459110','Avenida 3','2024-10-31 00:12:33'),(13,'Zorine','Denington','zdeningtonc@webs.com','4909250742','Carrera 2','2024-09-18 20:01:58'),(14,'Taite','Cheeke','tcheeked@opensource.org','6948200570','Cartagena','2025-04-23 17:31:57'),(15,'Rosalyn','Karys','rkaryse@state.tx.us','2616361744','Medellín','2025-05-14 00:52:13'),(16,'Ivy','Manuele','imanuelef@technorati.com','1264972570','Calle 4','2025-06-08 12:49:18'),(17,'Sergei','Pybworth','spybworthg@skyrock.com','2151009822','Avenida 3','2024-07-19 20:04:30'),(18,'Dione','Ailmer','dailmerh@youtube.com','5048160963','Cartagena','2024-12-27 10:58:06'),(19,'Euphemia','Sallows','esallowsi@tuttocitta.it','7459007914','Carrera 2','2024-09-03 04:19:23'),(20,'Kirstyn','Pithcock','kpithcockj@theguardian.com','4398553987','Cartagena','2025-02-09 07:09:53');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `clientes_AFTER_INSERT` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN
  INSERT INTO log_eventos (Tipo_actividad, Usuario, Fecha_hora, Detalles)
  VALUES (
    'INSERT',
    CURRENT_USER(),
    CURRENT_TIMESTAMP(),
    CONCAT('Cliente agregado: ', NEW.Nombre, ' ', NEW.Apellido)
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `clientes_AFTER_UPDATE` AFTER UPDATE ON `clientes` FOR EACH ROW BEGIN
  INSERT INTO log_eventos (Tipo_actividad, Usuario, Fecha_hora, Detalles)
  VALUES (
    'UPDATE',
    CURRENT_USER(),
    CURRENT_TIMESTAMP(),
    CONCAT(
      'Cliente actualizado: ID ', OLD.ID_clientes,
      ', Nombre: ', OLD.Nombre, ' → ', NEW.Nombre,
      ', Apellido: ', OLD.Apellido, ' → ', NEW.Apellido,
      ', Correo: ', OLD.Correo, ' → ', NEW.Correo
    )
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `clientes_AFTER_DELETE` AFTER DELETE ON `clientes` FOR EACH ROW BEGIN
  INSERT INTO log_eventos (Tipo_actividad, Usuario, Fecha_hora, Detalles)
  VALUES (
    'DELETE',
    CURRENT_USER(),
    CURRENT_TIMESTAMP(),
    CONCAT('Cliente eliminado: ID ', OLD.ID_clientes, ', Nombre: ', OLD.Nombre, ' ', OLD.Apellido)
  );
END */;;
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

-- Dump completed on 2025-07-14 21:36:13
