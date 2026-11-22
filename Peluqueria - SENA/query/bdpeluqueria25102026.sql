-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2026 a las 20:58:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdpeluqueria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `tipoDocumento` varchar(3) NOT NULL,
  `numeroDocumento` varchar(10) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(250) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcliente`, `tipoDocumento`, `numeroDocumento`, `nombres`, `direccion`, `telefono`, `correo`, `contrasena`, `estado`) VALUES
(1, 'CC', '1001001001', 'Pepito Mazo', 'avenida siempre viva 1', '3001234567', 'pepitom@gmail.com', '$2b$10$NdVGT.dNNH0mGAVaJIFKS.Gx/bKko7.N1Ga.cmbV79KESRYpRWKw6', 'Activo'),
(2, 'CC', '1001001002', 'Pepito Queso', 'avenida siempre viva 2', '3001234561', 'pepitoq@gmail.com', '$2b$10$tkhBDPsUV9ZH6RapT.dvtuA7UQ7GmkQPqOX6HLUs5hHKQ4osgRmSG', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `idHorario` int(11) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `horaInicio` varchar(10) NOT NULL,
  `horaFinal` varchar(10) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`idHorario`, `fecha`, `horaInicio`, `horaFinal`, `estado`) VALUES
(1, '2026-10-10', '7:00 am', '8:00 am', 'Inactivo'),
(2, '2026-10-10', '8:00 am', '9:00 am', 'Inactivo'),
(3, '2026-10-10', '9:00 am', '10:00 am', 'Inactivo'),
(4, '2026-10-10', '10:00 am', '11:00 am', 'Inactivo'),
(5, '2026-10-10', '11:00 am', '12:00 m', 'Inactivo'),
(6, '2026-10-10', '1:00 pm', '2:00 pm', 'Inactivo'),
(7, '2026-10-10', '2:00 pm', '3:00 pm', 'Inactivo'),
(8, '2026-10-10', '3:00 pm', '4:00 pm', 'Activo'),
(9, '2026-10-10', '4:00 pm', '5:00 pm', 'Activo'),
(10, '2026-10-10', '5:00 pm', '6:00 pm', 'Activo'),
(11, '2026-10-10', '6:00 pm', '7:00 pm', 'Activo'),
(12, '2026-10-10', '7:00 pm', '8:00 pm', 'Activo'),
(13, '2026-10-10', '8:00 pm', '9:00 pm', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reghorarios`
--

CREATE TABLE `reghorarios` (
  `idRegHorario` int(11) NOT NULL,
  `idHorario` int(11) NOT NULL,
  `idTrabajador` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reghorarios`
--

INSERT INTO `reghorarios` (`idRegHorario`, `idHorario`, `idTrabajador`, `estado`) VALUES
(1, 1, 1, 'Inactivo'),
(2, 2, 1, 'Inactivo'),
(3, 3, 1, 'Inactivo'),
(4, 4, 1, 'Inactivo'),
(5, 5, 1, 'Inactivo'),
(6, 6, 1, 'Inactivo'),
(7, 7, 1, 'Inactivo'),
(8, 8, 1, 'Activo'),
(9, 9, 1, 'Activo'),
(10, 10, 1, 'Activo'),
(11, 11, 1, 'Activo'),
(12, 12, 1, 'Activo'),
(13, 13, 1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `idtrabajador` int(11) NOT NULL,
  `tipoDocumento` varchar(3) NOT NULL,
  `numeroDocumento` varchar(10) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(250) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`idtrabajador`, `tipoDocumento`, `numeroDocumento`, `nombres`, `direccion`, `telefono`, `correo`, `contrasena`, `rol`, `estado`) VALUES
(1, 'CC', '9009009001', 'Juanito Alimaña', 'avenida siempre viva 2', '3001234561', 'juanito@gmail.com', '$2b$10$SM2rXYPdpiibd23hfeplkeXzw.ItGllfSA3yNrdBrRD5qPqXlm4LC', 'Admin', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`idHorario`);

--
-- Indices de la tabla `reghorarios`
--
ALTER TABLE `reghorarios`
  ADD PRIMARY KEY (`idRegHorario`),
  ADD KEY `idHorario` (`idHorario`),
  ADD KEY `idTrabajador` (`idTrabajador`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`idtrabajador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `idHorario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `reghorarios`
--
ALTER TABLE `reghorarios`
  MODIFY `idRegHorario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `idtrabajador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reghorarios`
--
ALTER TABLE `reghorarios`
  ADD CONSTRAINT `reghorarios_ibfk_1` FOREIGN KEY (`idHorario`) REFERENCES `horarios` (`idHorario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reghorarios_ibfk_2` FOREIGN KEY (`idTrabajador`) REFERENCES `trabajadores` (`idtrabajador`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
