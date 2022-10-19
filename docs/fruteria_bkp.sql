-- Adminer 4.8.1 MySQL 8.0.31 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE DATABASE `fruteria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fruteria`;

CREATE TABLE `ALBARAN` (
  `cod_albaran` int unsigned NOT NULL AUTO_INCREMENT,
  `producto` varchar(60) NOT NULL,
  `bulto` int NOT NULL,
  `cajas` int NOT NULL,
  `cod_prov` char(9) NOT NULL,
  `fecha_entrada` datetime NOT NULL,
  PRIMARY KEY (`cod_albaran`),
  KEY `cod_prov` (`cod_prov`),
  CONSTRAINT `albaran_ibfk_1` FOREIGN KEY (`cod_prov`) REFERENCES `PROVEEDOR` (`CIF`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `CLIENTE` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `FRU_ALB` (
  `cod_fruta` int unsigned NOT NULL,
  `cod_albaran` int unsigned NOT NULL,
  PRIMARY KEY (`cod_fruta`,`cod_albaran`),
  KEY `cod_albaran` (`cod_albaran`),
  CONSTRAINT `fru_alb_ibfk_1` FOREIGN KEY (`cod_albaran`) REFERENCES `ALBARAN` (`cod_albaran`) ON UPDATE CASCADE,
  CONSTRAINT `fru_alb_ibfk_2` FOREIGN KEY (`cod_fruta`) REFERENCES `FRUTA` (`cod_fruta`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `FRUTA` (
  `cod_fruta` int unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `calibre` tinyint NOT NULL,
  `categoria` char(1) NOT NULL,
  `origen` varchar(30) NOT NULL,
  `precio` float(5,2) NOT NULL,
  PRIMARY KEY (`cod_fruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `PROVEEDOR` (
  `CIF` char(9) NOT NULL,
  `nombre_resp` varchar(30) NOT NULL,
  `apellido_resp` varchar(45) NOT NULL,
  `empresa` varchar(120) NOT NULL,
  `email` varchar(60) NOT NULL,
  `telfono` char(9) NOT NULL,
  `cod_postal` smallint NOT NULL,
  PRIMARY KEY (`CIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `RECIBO` (
  `cod_recibo` int unsigned NOT NULL AUTO_INCREMENT,
  `detalle` varchar(60) NOT NULL,
  `cantidad` int NOT NULL,
  `precio` float(5,2) NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `cod_cliente` bigint unsigned NOT NULL,
  PRIMARY KEY (`cod_recibo`),
  KEY `cod_cliente` (`cod_cliente`),
  CONSTRAINT `recibo_ibfk_1` FOREIGN KEY (`cod_cliente`) REFERENCES `CLIENTE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- 2022-10-19 13:48:58
