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
-- Table structure for table `detalles_pedidos`
--

DROP TABLE IF EXISTS `detalles_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_pedidos` (
  `ID_detalles` int NOT NULL AUTO_INCREMENT,
  `ID_pedidos` int DEFAULT NULL,
  `ID_productos` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Precio_unitario` int DEFAULT NULL,
  `Estado_proceso` varchar(45) DEFAULT NULL,
  `Fecha_estado` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_detalles`),
  KEY `fk_detalles_pedidos1_idx` (`ID_pedidos`),
  KEY `fk_detalles_productos1_idx` (`ID_productos`),
  CONSTRAINT `fk_detalles_pedidos1` FOREIGN KEY (`ID_pedidos`) REFERENCES `pedidos` (`ID_pedidos`) ON DELETE CASCADE,
  CONSTRAINT `fk_detalles_productos1` FOREIGN KEY (`ID_productos`) REFERENCES `productos` (`ID_productos`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_pedidos`
--

LOCK TABLES `detalles_pedidos` WRITE;
/*!40000 ALTER TABLE `detalles_pedidos` DISABLE KEYS */;
INSERT INTO `detalles_pedidos` VALUES (6,62,33,4,49,'En preparacion','2025-03-12 12:22:00'),(7,63,34,3,49,'En Transito','2025-01-22 13:21:00'),(16,72,43,5,99,'En Transito','2025-05-25 08:00:00'),(17,73,44,6,3,'En preparacion','2025-01-22 15:36:20'),(19,75,46,6,89,'En preparacion','2025-03-21 09:30:22');
/*!40000 ALTER TABLE `detalles_pedidos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `detalles_pedidos_AFTER_UPDATE` AFTER UPDATE ON `detalles_pedidos` FOR EACH ROW BEGIN
  INSERT INTO log_eventos (Tipo_actividad, Usuario, Fecha_hora, Detalles)
  VALUES (
    'UPDATE',
    CURRENT_USER(),
    CURRENT_TIMESTAMP(),
    CONCAT(
      'Detalle actualizado: ID ', OLD.ID_detalles,
      ', Estado: ', OLD.Estado_proceso, ' → ', NEW.Estado_proceso,
      ', Cantidad: ', OLD.Cantidad, ' → ', NEW.Cantidad,
      ', Precio: ', OLD.Precio_unitario, ' → ', NEW.Precio_unitario
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `detalles_pedidos_AFTER_DELETE` AFTER DELETE ON `detalles_pedidos` FOR EACH ROW BEGIN
  INSERT INTO log_eventos (Tipo_actividad, Usuario, Fecha_hora, Detalles)
  VALUES (
    'DELETE',
    CURRENT_USER(),
    CURRENT_TIMESTAMP(),
    CONCAT('Detalle eliminado: ID ', OLD.ID_detalles, ', Pedido: ', OLD.ID_pedidos, ', Producto: ', OLD.ID_productos)
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
