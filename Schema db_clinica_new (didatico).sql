CREATE DATABASE  IF NOT EXISTS `db_clinica_new` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_clinica_new`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: db_clinica_new
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Temporary view structure for view `qtd_estado_regiao`
--

DROP TABLE IF EXISTS `qtd_estado_regiao`;
/*!50001 DROP VIEW IF EXISTS `qtd_estado_regiao`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `qtd_estado_regiao` AS SELECT 
 1 AS `cod_regiao`,
 1 AS `Desc_regiao`,
 1 AS `COUNT(A.cod_regiao)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tb_consulta`
--

DROP TABLE IF EXISTS `tb_consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_consulta` (
  `ID_Consulta` int NOT NULL,
  `Observacao` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Data` datetime DEFAULT NULL,
  `TB_Medico_CRM` varchar(10) NOT NULL,
  `TB_Paciente_CPF` varchar(11) NOT NULL,
  PRIMARY KEY (`ID_Consulta`,`TB_Medico_CRM`,`TB_Paciente_CPF`),
  KEY `fk_TB_Consulta_TB_Medico_idx` (`TB_Medico_CRM`),
  KEY `fk_TB_Consulta_TB_Paciente1_idx` (`TB_Paciente_CPF`),
  CONSTRAINT `fk_TB_Consulta_TB_Medico` FOREIGN KEY (`TB_Medico_CRM`) REFERENCES `tb_medico` (`CRM`),
  CONSTRAINT `fk_TB_Consulta_TB_Paciente1` FOREIGN KEY (`TB_Paciente_CPF`) REFERENCES `tb_paciente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_consulta`
--

LOCK TABLES `tb_consulta` WRITE;
/*!40000 ALTER TABLE `tb_consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_especialidade`
--

DROP TABLE IF EXISTS `tb_especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_especialidade` (
  `Id_Especialidade` int NOT NULL,
  `Descricao` varchar(45) DEFAULT NULL,
  `TB_Medico_CRM` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_Especialidade`,`TB_Medico_CRM`),
  KEY `fk_TB_Especialidade_TB_Medico1_idx` (`TB_Medico_CRM`),
  CONSTRAINT `fk_TB_Especialidade_TB_Medico1` FOREIGN KEY (`TB_Medico_CRM`) REFERENCES `tb_medico` (`CRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_especialidade`
--

LOCK TABLES `tb_especialidade` WRITE;
/*!40000 ALTER TABLE `tb_especialidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estado`
--

DROP TABLE IF EXISTS `tb_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_estado` (
  `Cod_estado` tinyint NOT NULL,
  `Desc_estado` char(30) DEFAULT NULL,
  `Cod_regiao` tinyint DEFAULT NULL,
  PRIMARY KEY (`Cod_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estado`
--

LOCK TABLES `tb_estado` WRITE;
/*!40000 ALTER TABLE `tb_estado` DISABLE KEYS */;
INSERT INTO `tb_estado` VALUES (1,'São Paulo',1),(2,'Rio de Janeiro',1),(3,'Minas Gerais',1),(4,'Espirito Santo',1),(6,'Bahia',NULL),(7,'Sergipe',NULL),(8,'Paraíba',2),(9,'Alagoas',2),(10,'Pernambuco',2),(11,'Rio Grande do Sul',4),(12,'Santa Catarina',4),(13,'Paraná',4),(14,'PARÁ',3),(15,'Amazonas',3);
/*!40000 ALTER TABLE `tb_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_exames`
--

DROP TABLE IF EXISTS `tb_exames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_exames` (
  `ID_Exames` int NOT NULL,
  `Descricao` varchar(60) DEFAULT NULL,
  `Categoria` varchar(20) DEFAULT NULL,
  `TB_Consulta_ID_Consulta` int NOT NULL,
  `TB_Consulta_TB_Medico_CRM` varchar(10) NOT NULL,
  `TB_Consulta_TB_Paciente_CPF` varchar(11) NOT NULL,
  `TB_Paciente_CPF` varchar(11) NOT NULL,
  PRIMARY KEY (`ID_Exames`,`TB_Consulta_ID_Consulta`,`TB_Consulta_TB_Medico_CRM`,`TB_Consulta_TB_Paciente_CPF`,`TB_Paciente_CPF`),
  KEY `fk_TB_Exames_TB_Consulta1_idx` (`TB_Consulta_ID_Consulta`,`TB_Consulta_TB_Medico_CRM`,`TB_Consulta_TB_Paciente_CPF`),
  KEY `fk_TB_Exames_TB_Paciente1_idx` (`TB_Paciente_CPF`),
  CONSTRAINT `fk_TB_Exames_TB_Consulta1` FOREIGN KEY (`TB_Consulta_ID_Consulta`, `TB_Consulta_TB_Medico_CRM`, `TB_Consulta_TB_Paciente_CPF`) REFERENCES `tb_consulta` (`ID_Consulta`, `TB_Medico_CRM`, `TB_Paciente_CPF`),
  CONSTRAINT `fk_TB_Exames_TB_Paciente1` FOREIGN KEY (`TB_Paciente_CPF`) REFERENCES `tb_paciente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_exames`
--

LOCK TABLES `tb_exames` WRITE;
/*!40000 ALTER TABLE `tb_exames` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_exames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medico`
--

DROP TABLE IF EXISTS `tb_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_medico` (
  `CRM` varchar(10) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Endereco` varchar(100) DEFAULT NULL,
  `Telefone` varchar(9) DEFAULT NULL,
  `DDD` varchar(3) DEFAULT NULL,
  `Numero` varchar(5) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  `CEP` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`CRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medico`
--

LOCK TABLES `tb_medico` WRITE;
/*!40000 ALTER TABLE `tb_medico` DISABLE KEYS */;
INSERT INTO `tb_medico` VALUES ('0023656SP','Maria da Silva ','Rua Z','996326333','11','36','SP','04455021'),('00553355SP','João Paulo da Santana ','Rua YH','978866999','11','10566','SP','3899632');
/*!40000 ALTER TABLE `tb_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paciente`
--

DROP TABLE IF EXISTS `tb_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_paciente` (
  `CPF` varchar(11) NOT NULL,
  `Nome` char(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Endereco` varchar(500) DEFAULT NULL,
  `Numero` varchar(5) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  `CEP` varchar(8) DEFAULT NULL,
  `Telefone` varchar(9) DEFAULT NULL,
  `DDD` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`CPF`),
  KEY `IDX_` (`UF`,`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente`
--

LOCK TABLES `tb_paciente` WRITE;
/*!40000 ALTER TABLE `tb_paciente` DISABLE KEYS */;
INSERT INTO `tb_paciente` VALUES ('1258482366','Andressa Albuquerque','Rua 21 de Novembro','38856','SP','03344065','96565363','11');
/*!40000 ALTER TABLE `tb_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pagamento`
--

DROP TABLE IF EXISTS `tb_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pagamento` (
  `ID_Pagamento` int NOT NULL,
  `Tipo_pagamento` varchar(15) DEFAULT NULL,
  `Data_Pagamento` datetime DEFAULT NULL,
  `Status` binary(2) DEFAULT NULL,
  `TB_Consulta_ID_Consulta` int NOT NULL,
  `TB_Consulta_TB_Medico_CRM` varchar(10) NOT NULL,
  `TB_Consulta_TB_Paciente_CPF` varchar(11) NOT NULL,
  `TB_Exames_ID_Exames` int NOT NULL,
  `TB_Exames_TB_Consulta_ID_Consulta` int NOT NULL,
  `TB_Exames_TB_Consulta_TB_Medico_CRM` varchar(10) NOT NULL,
  `TB_Exames_TB_Consulta_TB_Paciente_CPF` varchar(11) NOT NULL,
  `TB_Exames_TB_Paciente_CPF` varchar(11) NOT NULL,
  PRIMARY KEY (`ID_Pagamento`,`TB_Consulta_ID_Consulta`,`TB_Consulta_TB_Medico_CRM`,`TB_Consulta_TB_Paciente_CPF`,`TB_Exames_ID_Exames`,`TB_Exames_TB_Consulta_ID_Consulta`,`TB_Exames_TB_Consulta_TB_Medico_CRM`,`TB_Exames_TB_Consulta_TB_Paciente_CPF`,`TB_Exames_TB_Paciente_CPF`),
  KEY `fk_TB_Pagamento_TB_Consulta1_idx` (`TB_Consulta_ID_Consulta`,`TB_Consulta_TB_Medico_CRM`,`TB_Consulta_TB_Paciente_CPF`),
  KEY `fk_TB_Pagamento_TB_Exames1_idx` (`TB_Exames_ID_Exames`,`TB_Exames_TB_Consulta_ID_Consulta`,`TB_Exames_TB_Consulta_TB_Medico_CRM`,`TB_Exames_TB_Consulta_TB_Paciente_CPF`,`TB_Exames_TB_Paciente_CPF`),
  CONSTRAINT `fk_TB_Pagamento_TB_Consulta1` FOREIGN KEY (`TB_Consulta_ID_Consulta`, `TB_Consulta_TB_Medico_CRM`, `TB_Consulta_TB_Paciente_CPF`) REFERENCES `tb_consulta` (`ID_Consulta`, `TB_Medico_CRM`, `TB_Paciente_CPF`),
  CONSTRAINT `fk_TB_Pagamento_TB_Exames1` FOREIGN KEY (`TB_Exames_ID_Exames`, `TB_Exames_TB_Consulta_ID_Consulta`, `TB_Exames_TB_Consulta_TB_Medico_CRM`, `TB_Exames_TB_Consulta_TB_Paciente_CPF`, `TB_Exames_TB_Paciente_CPF`) REFERENCES `tb_exames` (`ID_Exames`, `TB_Consulta_ID_Consulta`, `TB_Consulta_TB_Medico_CRM`, `TB_Consulta_TB_Paciente_CPF`, `TB_Paciente_CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pagamento`
--

LOCK TABLES `tb_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_regiao`
--

DROP TABLE IF EXISTS `tb_regiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_regiao` (
  `Cod_regiao` tinyint NOT NULL,
  `Desc_regiao` char(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_regiao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_regiao`
--

LOCK TABLES `tb_regiao` WRITE;
/*!40000 ALTER TABLE `tb_regiao` DISABLE KEYS */;
INSERT INTO `tb_regiao` VALUES (1,'Sudeste'),(2,'Nordeste'),(3,'Norte'),(4,'Sul'),(5,'Centro-Oeste');
/*!40000 ALTER TABLE `tb_regiao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_resultado`
--

DROP TABLE IF EXISTS `tb_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_resultado` (
  `ID_Resultado` int NOT NULL,
  `Data` datetime DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `TB_Paciente_CPF` varchar(11) NOT NULL,
  `TB_Exames_ID_Exames` int NOT NULL,
  `TB_Exames_TB_Consulta_ID_Consulta` int NOT NULL,
  `TB_Exames_TB_Consulta_TB_Medico_CRM` varchar(10) NOT NULL,
  `TB_Exames_TB_Consulta_TB_Paciente_CPF` varchar(11) NOT NULL,
  `TB_Exames_TB_Paciente_CPF` varchar(11) NOT NULL,
  PRIMARY KEY (`ID_Resultado`,`TB_Paciente_CPF`,`TB_Exames_ID_Exames`,`TB_Exames_TB_Consulta_ID_Consulta`,`TB_Exames_TB_Consulta_TB_Medico_CRM`,`TB_Exames_TB_Consulta_TB_Paciente_CPF`,`TB_Exames_TB_Paciente_CPF`),
  KEY `fk_TB_Resultado_TB_Paciente1_idx` (`TB_Paciente_CPF`),
  KEY `fk_TB_Resultado_TB_Exames1_idx` (`TB_Exames_ID_Exames`,`TB_Exames_TB_Consulta_ID_Consulta`,`TB_Exames_TB_Consulta_TB_Medico_CRM`,`TB_Exames_TB_Consulta_TB_Paciente_CPF`,`TB_Exames_TB_Paciente_CPF`),
  CONSTRAINT `fk_TB_Resultado_TB_Exames1` FOREIGN KEY (`TB_Exames_ID_Exames`, `TB_Exames_TB_Consulta_ID_Consulta`, `TB_Exames_TB_Consulta_TB_Medico_CRM`, `TB_Exames_TB_Consulta_TB_Paciente_CPF`, `TB_Exames_TB_Paciente_CPF`) REFERENCES `tb_exames` (`ID_Exames`, `TB_Consulta_ID_Consulta`, `TB_Consulta_TB_Medico_CRM`, `TB_Consulta_TB_Paciente_CPF`, `TB_Paciente_CPF`),
  CONSTRAINT `fk_TB_Resultado_TB_Paciente1` FOREIGN KEY (`TB_Paciente_CPF`) REFERENCES `tb_paciente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_resultado`
--

LOCK TABLES `tb_resultado` WRITE;
/*!40000 ALTER TABLE `tb_resultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_clinica_new'
--
/*!50003 DROP PROCEDURE IF EXISTS `INSERIR_ESTADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERIR_ESTADO`(IN p_codigo_estado INT, IN p_nome_estado VARCHAR(30),
    IN p_codigo_regiao INT)
BEGIN
   INSERT INTO tb_estado (Cod_estado, Desc_estado, cod_regiao)
    VALUES (p_codigo_estado, p_nome_estado, p_codigo_regiao);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `qtd_estado_regiao`
--

/*!50001 DROP VIEW IF EXISTS `qtd_estado_regiao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `qtd_estado_regiao` AS select `a`.`Cod_regiao` AS `cod_regiao`,`b`.`Desc_regiao` AS `Desc_regiao`,count(`a`.`Cod_regiao`) AS `COUNT(A.cod_regiao)` from (`tb_estado` `a` join `tb_regiao` `b` on((`a`.`Cod_regiao` = `b`.`Cod_regiao`))) group by `a`.`Cod_regiao` order by `a`.`Cod_regiao` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-08  8:39:02
