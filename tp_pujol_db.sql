-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-05-2024 a las 13:47:28
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tp_pujol_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(244) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `descripcion`, `codigo`) VALUES
(1, 'ADMINISTRADOR DEL SISTEMA', 'ADMIN'),
(2, 'ENCARGADO DE CAJA', 'CAJERO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_asignados`
--

DROP TABLE IF EXISTS `roles_asignados`;
CREATE TABLE IF NOT EXISTS `roles_asignados` (
  `id_rol_asignado` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_rol_asignado`),
  KEY `id_rol` (`id_rol`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles_asignados`
--

INSERT INTO `roles_asignados` (`id_rol_asignado`, `id_rol`, `id_usuario`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tokens_de_sesion`
--

DROP TABLE IF EXISTS `tokens_de_sesion`;
CREATE TABLE IF NOT EXISTS `tokens_de_sesion` (
  `id_token` int NOT NULL AUTO_INCREMENT,
  `token` varchar(244) NOT NULL,
  `id_usuario` int NOT NULL,
  `habilitado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_token`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tokens_de_sesion`
--

INSERT INTO `tokens_de_sesion` (`id_token`, `token`, `id_usuario`, `habilitado`) VALUES
(1, 'cec4704f0776b2a30efc57ddde6c408c', 1, 0),
(2, 'e2e8852eec2757e7dc147dc7c578fbfe', 1, 0),
(3, '44ba454353b51ee080205a927db1d417', 1, 0),
(4, '67e81801cb114e59deefd667e7d252a8', 1, 0),
(5, 'de293c5847ebece54dd68ee3650b3020', 1, 0),
(6, '9478ea877acff6181a566d6c3aeb0b1c', 1, 0),
(7, 'c20221dfcad293802a76e80fa056f318', 1, 0),
(8, 'd8c58c2ddd49f377d41ee0cb92da77c2', 1, 0),
(9, '5cacd4b149498809e17dd4ce1744c59b', 1, 0),
(10, '46b4e3982b55975be4e390720e695603', 1, 0),
(11, '89ebb84a0a228dcf278848bbc4dbb419', 1, 0),
(12, '885a74a9752d4edd171c3153a5bcfb82', 1, 0),
(13, 'f7f125cae7f19338bf2b12fa842ce0ea', 1, 0),
(14, '20784af1ddb9e6e68f26eca978b52845', 1, 0),
(15, '93d825938eb594d0632473a5a1c9c15c', 1, 0),
(16, 'a9e39bd796426dba807e0f954c84b3ee', 1, 0),
(17, '41814212c3c578b404f6f37d24b71c3c', 1, 0),
(18, '279a8ad069483076fdb6a63c21a72131', 1, 0),
(19, 'd5324e8a8b89b4717e9146aa49c6c967', 1, 0),
(20, '235236aad2875143a7e6caa4bdb37969', 1, 0),
(21, 'b35fce7d4712cef4aab47e25e4c1150d', 1, 0),
(22, '5630aa4b3ff79ff1a239626b1a32431d', 1, 0),
(23, 'bce984789340f713d911b387cb42ff48', 1, 0),
(24, '7bfa2af75505dfc11c424bb2774da8db', 1, 0),
(25, 'f8c917b5597a3da9166f11a574c003e8', 1, 0),
(26, '1a3fb5440c1a6ba2b51c08a79324ae23', 1, 0),
(27, 'c1b2f16f52eb03c67ff5301be5f11ba7', 1, 0),
(28, 'bba3d27def220f275a75d577f8f19638', 1, 0),
(29, 'd2923d83bb4c8bc0a5460b6f97913bb9', 1, 0),
(30, '6fd751495ea895237951368df51e8c11', 1, 0),
(31, 'e8d4d2a08ce509af2aad883800d9614a', 1, 0),
(32, 'ebcbb3232286317b5496d30b3041f4fc', 1, 0),
(33, 'f16ebee558b7c3fec77b532e34994a5e', 1, 0),
(34, 'eeb0540f6cea9c435f8539148327ae50', 1, 0),
(35, '10d1a6e68865918867d1c41123fee1bb', 1, 0),
(36, '07c59403d06d0e645d522ac086d008bf', 1, 0),
(37, 'a2c36fa15932b9213e2069f0bc189258', 1, 0),
(38, '2d129e79b326d372905a897bdbbb43d2', 1, 0),
(39, 'a1e006d30e1d85f22a64fa748ef41d99', 1, 0),
(40, '50f3b39b5480184d2829c176477708c5', 1, 0),
(41, '1d7fd7b92a01717bf29cdaea2d8b20a9', 1, 0),
(42, '4e895aaf6e7b24ec4603b31f45ed8139', 1, 0),
(43, 'c6ea5ed7abb791c8d1315b45535d3583', 1, 0),
(44, '2051dca57577ffb621457f4985a04d68', 1, 0),
(45, 'ed390adcdd4c27020af3adb086a713e3', 1, 0),
(46, 'd722cf3793e9f9aa4f7f13d135b88493', 1, 0),
(47, '8bec6d84e513262b400e4ad5858c5e34', 1, 0),
(48, '1e1bf74714dc237e24401d05a1481f0f', 1, 0),
(49, '398db73d99b02b86c49300d40aba4729', 1, 0),
(50, '6833c56747b33197801d1faa82be8489', 1, 0),
(51, '8832a09b60ae18b6887ab673f5df306a', 1, 0),
(52, '08438cbbf491915bee87358c93fc786d', 1, 0),
(53, '1618f66d8c2ba2131dd33c398856af91', 1, 0),
(54, '537e0541006e32a3b6596cf8f16df80f', 1, 0),
(55, 'e694942c459a2f3a841f8032d3d38c4d', 1, 0),
(56, 'def8ff620d3700dd970c6c413c9c7eac', 1, 0),
(57, 'c5652add1aa8f725e349cd6393f8fc7b', 1, 0),
(58, 'fa353ef683fcd98170a9d4e64806a9fe', 1, 0),
(59, '15e47cdb09a959f8c1ef7db71ae2a90f', 1, 0),
(60, '57a22b3a6b74b496ad6f8910e8062e28', 1, 0),
(61, '67c9f25ef51487051852743feeba2f1f', 1, 0),
(62, '8ed8ba8bfd86524710cc88300eea7e09', 1, 0),
(63, 'c82cdfec37f9e60f3a2fa7369ef30cb4', 1, 0),
(64, 'be54646dfe1401113112e845049d950c', 1, 0),
(65, 'bdb4eaf2b183550a0b8d6605d75af630', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(244) NOT NULL,
  `email` varchar(120) NOT NULL,
  `nombre` varchar(244) NOT NULL,
  `apellido` varchar(244) NOT NULL,
  `palabra_secreta` varchar(244) NOT NULL,
  `habilitado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `username`, `password`, `email`, `nombre`, `apellido`, `palabra_secreta`, `habilitado`) VALUES
(1, 'Administrador', 'admin', 'admin@admin.com.ar', 'Administrador', 'Administrador', 'Pure de papas', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `roles_asignados`
--
ALTER TABLE `roles_asignados`
  ADD CONSTRAINT `roles_asignados_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_asignados_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tokens_de_sesion`
--
ALTER TABLE `tokens_de_sesion`
  ADD CONSTRAINT `tokens_de_sesion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
