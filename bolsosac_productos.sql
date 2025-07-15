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
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ID_productos` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `Descripción` varchar(45) DEFAULT NULL,
  `Precio` int DEFAULT NULL,
  `Material` varchar(45) DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `Fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_productos`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (29,'Mochila Antirrobo','Bolso','Pulsera con piedras preciosas',98,'Poliéster',15,'2024-03-29 00:00:00'),(30,'Collar de Perlas','Accesorio','Bolso grande para viajar',150,'Perla',12,'2024-03-30 00:00:00'),(31,'Gafas de Sol Vintage','Accesorio','Gafas estilo retro con marco de madera',110,'Madera',18,'2024-03-31 00:00:00'),(32,'Bolso de Lona','Bolso','Bolso casual resistente',70,'Lona',25,'2024-04-01 00:00:00'),(33,'Collar de Oro','Accesorio','Pulsera trenzada artesanal',45,'Cuero',30,'2024-04-02 00:00:00'),(34,'Cartera Formal','Accesorio','Cartera elegante para reuniones',95,'Cuero',14,'2024-04-03 00:00:00'),(36,'Mochila Compacta','Bolso','Mochila liviana para uso diario',100,'Nylon',20,'2024-04-05 00:00:00'),(38,'Anillo de Plata','Accesorio','Anillo de plata 925 con grabado',85,'Plata',25,'2024-04-07 00:00:00'),(39,'Gafas con Filtro Azul','Accesorio','Gafas para protección frente a pantallas',90,'Metal',23,'2024-04-08 00:00:00'),(40,'Bolso Clutch','Bolso','Bolso pequeño para eventos',105,'Tela',13,'2024-04-09 00:00:00'),(41,'Pulsera de Cuentas','Accesorio','Pulsera artesanal con piedras naturales',55,'Titanio',35,'2024-04-10 00:00:00'),(42,'Cartera Urbana','Accesorio','Diseño moderno y funcional',88,'Sintético',19,'2024-04-11 00:00:00'),(43,'Bolso Impermeable','Bolso','Bolso resistente al agua',115,'PVC',16,'2024-04-12 00:00:00'),(44,'Mochila con USB','Bolso','Mochila con puerto de carga USB',165,'Poliéster',10,'2024-04-13 00:00:00'),(46,'Gafas Redondas','Accesorio','Estilo clásico con cristales claros',92,'Metal',20,'2024-04-15 00:00:00');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `productos_AFTER_INSERT` AFTER INSERT ON `productos` FOR EACH ROW BEGIN
INSERT INTO log_eventos(Tipo_actividad, Usuario, Fecha_hora, Detalles)
VALUES ('INSERT', CURRENT_USER(), CURRENT_TIMESTAMP(),concat('Producto agregado: ', NEW.Nombre, ', Precio: ', NEW.Precio));
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `productos_AFTER_UPDATE` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
INSERT INTO log_eventos(Tipo_actividad, Usuario, Fecha_Hora, Detalles)
    VALUES('UPDATE', CURRENT_USER(), CURRENT_TIMESTAMP(),
           CONCAT('Producto actualizado: ', OLD.Nombre, ' → ', NEW.Nombre));
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `productos_AFTER_DELETE` AFTER DELETE ON `productos` FOR EACH ROW BEGIN
    INSERT INTO log_eventos(Tipo_actividad, Usuario, Fecha_hora, Detalles)
    VALUES('DELETE', CURRENT_USER(), CURRENT_TIMESTAMP(),
           CONCAT('Producto eliminado: ', OLD.Nombre));
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
