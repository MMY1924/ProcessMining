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
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `ID_pedidos` int NOT NULL AUTO_INCREMENT,
  `ID_clientes` int DEFAULT NULL,
  `Fecha_pedido` date DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Método_pago` varchar(45) DEFAULT NULL,
  `Total` int DEFAULT NULL,
  `Fecha_envío` datetime DEFAULT NULL,
  `Fecha_entrega` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_pedidos`),
  KEY `fk_pedidos_clientes1_idx` (`ID_clientes`),
  CONSTRAINT `fk_pedidos_clientes1` FOREIGN KEY (`ID_clientes`) REFERENCES `clientes` (`ID_clientes`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (62,6,'2024-03-06','Entregado','Efectivo',120,'2025-06-07 14:10:00','2025-06-10 14:30:00'),(63,7,'2024-03-07','Cancelado','PayPal',180,'2025-06-08 11:20:00','2025-06-10 10:00:00'),(64,8,'2024-03-08','Pendiente','Transferencia',116,'2025-06-09 09:00:00','2025-06-11 10:30:00'),(67,11,'2024-03-11','Enviado','PayPal',112,'2025-06-12 13:00:00','2025-06-14 13:55:00'),(68,12,'2024-03-12','Enviado','Tarjeta de débito',76,'2025-06-13 08:45:00','2025-06-15 10:30:00'),(69,13,'2024-03-13','Entregado','Efectivo',88,'2025-06-14 10:50:00','2025-06-16 17:45:00'),(70,14,'2024-03-14','Pendiente','Transferencia',600,'2025-06-15 16:10:00','2025-06-17 16:45:00'),(71,15,'2024-03-15','Enviado','PayPal',110,'2025-06-16 11:05:00','2025-06-18 13:30:00'),(72,16,'2024-03-16','Pendiente','Tarjeta de crédito',95,'2025-06-17 09:45:00','2025-06-19 14:00:00'),(73,17,'2024-03-17','Entregado','Efectivo',120,'2025-06-18 10:30:00','2025-06-20 15:30:00'),(74,18,'2024-03-18','Enviado','Transferencia',150,'2025-06-19 14:15:00','2025-06-21 13:15:00'),(75,19,'2024-03-19','Pendiente','PayPal',68,'2025-06-20 08:50:00','2025-06-22 10:30:00');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pedidos_AFTER_INSERT` AFTER INSERT ON `pedidos` FOR EACH ROW BEGIN
  INSERT INTO log_eventos (Tipo_actividad, Usuario, Fecha_hora, Detalles)
  VALUES (
    'INSERT',
    CURRENT_USER(),
    CURRENT_TIMESTAMP(),
    CONCAT('Pedido agregado: ID ', NEW.ID_pedidos, ' para Cliente ', NEW.ID_clientes, ', Estado: ', NEW.Estado)
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pedidos_AFTER_UPDATE` AFTER UPDATE ON `pedidos` FOR EACH ROW BEGIN
  INSERT INTO log_eventos (Tipo_actividad, Usuario, Fecha_hora, Detalles)
  VALUES (
    'UPDATE',
    CURRENT_USER(),
    CURRENT_TIMESTAMP(),
    CONCAT(
      'Pedido actualizado: ID ', OLD.ID_pedidos,
      ', Estado: ', OLD.Estado, ' → ', NEW.Estado,
      ', Método_pago: ', OLD.Método_pago, ' → ', NEW.Método_pago,
      ', Total: ', OLD.Total, ' → ', NEW.Total
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pedidos_AFTER_DELETE` AFTER DELETE ON `pedidos` FOR EACH ROW BEGIN
  INSERT INTO log_eventos (Tipo_actividad, Usuario, Fecha_hora, Detalles)
  VALUES (
    'DELETE',
    CURRENT_USER(),
    CURRENT_TIMESTAMP(),
    CONCAT('Pedido eliminado: ID ', OLD.ID_pedidos, ', Cliente: ', OLD.ID_clientes, ', Estado: ', OLD.Estado)
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
