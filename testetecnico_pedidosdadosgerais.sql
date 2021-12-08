-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: testetecnico
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `pedidosdadosgerais`
--

DROP TABLE IF EXISTS `pedidosdadosgerais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidosdadosgerais` (
  `Pedido` int NOT NULL,
  `DtEmissao` date NOT NULL,
  `CodCliente` int NOT NULL,
  `ValorTotal` date DEFAULT NULL,
  PRIMARY KEY (`Pedido`),
  KEY `pedidosdadosgerais_FK` (`CodCliente`),
  CONSTRAINT `pedidosdadosgerais_FK` FOREIGN KEY (`CodCliente`) REFERENCES `clientes` (`CodCliente`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosdadosgerais`
--

LOCK TABLES `pedidosdadosgerais` WRITE;
/*!40000 ALTER TABLE `pedidosdadosgerais` DISABLE KEYS */;
INSERT INTO `pedidosdadosgerais` VALUES (3,'2021-12-07',1,'0000-00-00'),(4,'2021-12-07',1,'0000-00-00'),(6,'2021-12-07',1,'0000-00-00'),(7,'2021-12-07',1,'0000-00-00'),(8,'2021-12-07',2,'0000-00-00'),(9,'2021-12-07',3,'0000-00-00'),(10,'2021-12-07',1,'0000-00-00'),(11,'2021-12-07',3,'0000-00-00'),(12,'2021-12-07',15,'0000-00-00'),(13,'2021-12-08',1,'0000-00-00');
/*!40000 ALTER TABLE `pedidosdadosgerais` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-08 13:04:39
