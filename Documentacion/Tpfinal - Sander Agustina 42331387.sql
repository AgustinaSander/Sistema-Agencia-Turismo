-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 21-12-2021 a las 02:47:22
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpfinal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IDPERSONA` int(11) NOT NULL,
  `HABILITADO` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IDPERSONA`, `HABILITADO`) VALUES
(302, 1),
(352, 0),
(709, 1),
(716, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_venta`
--

CREATE TABLE `cliente_venta` (
  `Cliente_IDPERSONA` int(11) NOT NULL,
  `listaVentas_IDVENTA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `IDDIRECCION` int(11) NOT NULL,
  `CALLE` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CODIGOPOSTAL` int(11) DEFAULT NULL,
  `DEPARTAMENTO` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `LOCALIDAD` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `NUMERO` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PAIS` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PROVINCIA` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`IDDIRECCION`, `CALLE`, `CODIGOPOSTAL`, `DEPARTAMENTO`, `LOCALIDAD`, `NUMERO`, `PAIS`, `PROVINCIA`) VALUES
(2, 'Castelli', 3000, '', 'Santa Fe', '1621', 'Argentina', 'Santa Fe (sÃ³lo deptos. Rosario, La Capital, Gral. LÃ³pez, Caseros, ContituciÃ³n, San Lorenzo, Las Colonias y Castellanos)'),
(52, 'Cabral', 3000, '2A`', 'Santa Fe', '2456', 'Argentina', 'Santa Fe'),
(301, 'J.Paso', 3000, '', 'Rosario', '432', 'Argentina', 'Santa Fe'),
(351, 'Renua', 3030, '', 'Parana', '435', 'Argentina', 'Entre Rios'),
(704, 'Castelli', 3000, '2A', 'Santa Fe', '1621', 'Argentina', 'Santa Fe '),
(708, 'WER', 3222, '', 'Santa Fe', '324', 'Argentina', 'Santa Fe'),
(711, 'J.Paso', 3000, '', 'Santa Fe', '1621', 'Argentina', 'Santa Fe'),
(715, 'Castelli', 3000, '', 'Santa Fe', '1621', 'Argentina', 'Santa Fe (sÃ³lo deptos. Rosario, La Capital, Gral. LÃ³pez, Caseros, ContituciÃ³n, San Lorenzo, Las Colonias y Castellanos)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `IDPERSONA` int(11) NOT NULL,
  `CARGO` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `SUELDO` double DEFAULT NULL,
  `USUARIO_IDUSUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`IDPERSONA`, `CARGO`, `SUELDO`, `USUARIO_IDUSUARIO`) VALUES
(3, 'FullStack Developer', 80000, 1),
(53, 'Vendedor', 50600, 51),
(705, 'Vendedor', 45000, 703),
(712, 'FullStack Developer', 80000, 710);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_venta`
--

CREATE TABLE `empleado_venta` (
  `Empleado_IDPERSONA` int(11) NOT NULL,
  `listaVentas_IDVENTA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paqueteturistico`
--

CREATE TABLE `paqueteturistico` (
  `IDPAQUETE` int(11) NOT NULL,
  `COSTO` double DEFAULT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `HABILITADO` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `paqueteturistico`
--

INSERT INTO `paqueteturistico` (`IDPAQUETE`, `COSTO`, `DESCRIPCION`, `HABILITADO`) VALUES
(501, 19675, ' Entrada a evento -  Alquiler de vehiculo - ', 0),
(551, 79675, ' Alquiler de vehiculo -  Pasaje de avion - ', 0),
(651, 10353, ' Alquiler de vehiculo -  Excursion - ', 1),
(701, 10353, ' Alquiler de vehiculo -  Excursion - ', 0),
(702, 35813, ' Hotel por noche -  Entrada a evento -  Alquiler de vehiculo -  Excursion - ', 1),
(707, 26853, ' Entrada a evento -  Alquiler de vehiculo -  Excursion - ', 0),
(714, 19313, ' Hotel por noche -  Alquiler de vehiculo -  Excursion - ', 1),
(718, 13635, ' Hotel por noche -  Alquiler de vehiculo - ', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paqueteturistico_servicioturistico`
--

CREATE TABLE `paqueteturistico_servicioturistico` (
  `PaqueteTuristico_IDPAQUETE` int(11) NOT NULL,
  `listaServicios_IDSERVICIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `IDPERSONA` int(11) NOT NULL,
  `DTYPE` varchar(31) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `APELLIDO` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CELULAR` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECHANAC` datetime DEFAULT NULL,
  `NACIONALIDAD` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DIRECCION_IDDIRECCION` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`IDPERSONA`, `DTYPE`, `APELLIDO`, `CELULAR`, `DNI`, `EMAIL`, `FECHANAC`, `NACIONALIDAD`, `NOMBRE`, `DIRECCION_IDDIRECCION`) VALUES
(3, 'Empleado', 'Sander', '5493424227082', '42331387', 'asander00@hotmail.com', '2000-12-01 00:38:44', 'Argentina', 'Agustina', 2),
(53, 'Empleado', 'Sander', '5493425491104', '17414432', 'gsander65@hotmail.com', '1970-11-02 00:39:19', 'Argentina', 'Gustavo', 52),
(302, 'Cliente', 'Sander', '5493425667788', '45654345', 'agus24@hotmail.com', '2021-12-20 00:00:00', NULL, 'Agustina belen', 301),
(352, 'Cliente', 'Ramirez', '5493424227546', '34567905', 'nachosander102004@hotmail.com', '2021-12-20 00:00:00', NULL, 'Ignacio Nicolas', 351),
(705, 'Empleado', 'Suarez', '5493424227082', '42332456', 'camila@hotmail.com', NULL, 'Argentina', 'Camila', 704),
(709, 'Cliente', 'Artale', '5493424220782', '17414332', 'm@hotmail.com', '2021-12-20 00:00:00', NULL, 'Marisa Belen', 708),
(712, 'Empleado', 'Suarez', '5493424227082', '234534534', 'asander00@hotmail.com', NULL, 'Argentina', 'Pablo', 711),
(716, 'Cliente', 'Lopez', '5493424227082', '42331387', 'asander00@hotmail.com', '2000-03-10 00:00:00', NULL, 'Juan', 715);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sequence`
--

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '750');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicioturistico`
--

CREATE TABLE `servicioturistico` (
  `IDSERVICIO` int(11) NOT NULL,
  `COSTO` double DEFAULT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DESTINO` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECHA` datetime DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `HABILITADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `servicioturistico`
--

INSERT INTO `servicioturistico` (`IDSERVICIO`, `COSTO`, `DESCRIPCION`, `DESTINO`, `FECHA`, `NOMBRE`, `HABILITADO`) VALUES
(101, 8960, 'Hotel 4 estrellas - Holiday Inn. Vista a la playa', 'Cancun, Mexico', '2021-12-23 20:52:12', 'Hotel por noche', 1),
(151, 16500, 'Concierto de Justin Bieber 2022', 'Estadio Unico de la Plata, Buenos Aires', '2021-12-20 00:00:00', 'Entrada a evento', 0),
(201, 4675, 'Vehiculo de 4 puertas Chery Tiggo 4 - Color rojo', 'Santa Fe, Capital', '2022-01-23 00:00:00', 'Alquiler de vehiculo', 1),
(251, 75000, 'Vuelo con 3 escalas', 'Nueva York, Estados Unidos', '2022-03-03 00:00:00', 'Pasaje de avion', 0),
(601, 5678, 'Visita al edificio Empire States', 'Nueva York, Estados Unidos', '2021-12-20 00:00:00', 'Excursion', 1),
(706, 3000, 'Hotel 3 estrellas', 'Cancun, Mexico', '2021-12-31 00:00:00', 'Hotel por noche', 0),
(713, 2000, 'Concierto a beneficio 2022', 'Buenos Aires', '2021-12-20 00:00:00', 'Entrada a evento', 1),
(717, 2345, 'Pasajeee', 'Cancun, Mexico', '2021-12-23 00:00:00', 'Pasaje de avion', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IDUSUARIO` int(11) NOT NULL,
  `CONTRASENA` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `NOMBRE` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `CONTRASENA`, `NOMBRE`) VALUES
(1, '12345', 'AgustinaSander'),
(51, '123', 'gsander'),
(703, '12', 'camila'),
(710, '1234', 'pablo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `IDVENTA` int(11) NOT NULL,
  `FECHA` datetime DEFAULT NULL,
  `MEDIODEPAGO` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PAQUETETURISTICO_IDPAQUETE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_servicioturistico`
--

CREATE TABLE `venta_servicioturistico` (
  `Venta_IDVENTA` int(11) NOT NULL,
  `listaServicios_IDSERVICIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IDPERSONA`);

--
-- Indices de la tabla `cliente_venta`
--
ALTER TABLE `cliente_venta`
  ADD PRIMARY KEY (`Cliente_IDPERSONA`,`listaVentas_IDVENTA`),
  ADD KEY `FK_CLIENTE_VENTA_listaVentas_IDVENTA` (`listaVentas_IDVENTA`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`IDDIRECCION`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`IDPERSONA`),
  ADD KEY `FK_EMPLEADO_USUARIO_IDUSUARIO` (`USUARIO_IDUSUARIO`);

--
-- Indices de la tabla `empleado_venta`
--
ALTER TABLE `empleado_venta`
  ADD PRIMARY KEY (`Empleado_IDPERSONA`,`listaVentas_IDVENTA`),
  ADD KEY `FK_EMPLEADO_VENTA_listaVentas_IDVENTA` (`listaVentas_IDVENTA`);

--
-- Indices de la tabla `paqueteturistico`
--
ALTER TABLE `paqueteturistico`
  ADD PRIMARY KEY (`IDPAQUETE`);

--
-- Indices de la tabla `paqueteturistico_servicioturistico`
--
ALTER TABLE `paqueteturistico_servicioturistico`
  ADD PRIMARY KEY (`PaqueteTuristico_IDPAQUETE`,`listaServicios_IDSERVICIO`),
  ADD KEY `PQTTURISTICOSERVICIOTURISTICOlstSrviciosIDSERVICIO` (`listaServicios_IDSERVICIO`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`IDPERSONA`),
  ADD KEY `FK_PERSONA_DIRECCION_IDDIRECCION` (`DIRECCION_IDDIRECCION`);

--
-- Indices de la tabla `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Indices de la tabla `servicioturistico`
--
ALTER TABLE `servicioturistico`
  ADD PRIMARY KEY (`IDSERVICIO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IDUSUARIO`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`IDVENTA`),
  ADD KEY `FK_VENTA_PAQUETETURISTICO_IDPAQUETE` (`PAQUETETURISTICO_IDPAQUETE`);

--
-- Indices de la tabla `venta_servicioturistico`
--
ALTER TABLE `venta_servicioturistico`
  ADD PRIMARY KEY (`Venta_IDVENTA`,`listaServicios_IDSERVICIO`),
  ADD KEY `VENTA_SERVICIOTURISTICO_listaServicios_IDSERVICIO` (`listaServicios_IDSERVICIO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_CLIENTE_IDPERSONA` FOREIGN KEY (`IDPERSONA`) REFERENCES `persona` (`IDPERSONA`);

--
-- Filtros para la tabla `cliente_venta`
--
ALTER TABLE `cliente_venta`
  ADD CONSTRAINT `FK_CLIENTE_VENTA_Cliente_IDPERSONA` FOREIGN KEY (`Cliente_IDPERSONA`) REFERENCES `persona` (`IDPERSONA`),
  ADD CONSTRAINT `FK_CLIENTE_VENTA_listaVentas_IDVENTA` FOREIGN KEY (`listaVentas_IDVENTA`) REFERENCES `venta` (`IDVENTA`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_EMPLEADO_IDPERSONA` FOREIGN KEY (`IDPERSONA`) REFERENCES `persona` (`IDPERSONA`),
  ADD CONSTRAINT `FK_EMPLEADO_USUARIO_IDUSUARIO` FOREIGN KEY (`USUARIO_IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`);

--
-- Filtros para la tabla `empleado_venta`
--
ALTER TABLE `empleado_venta`
  ADD CONSTRAINT `FK_EMPLEADO_VENTA_Empleado_IDPERSONA` FOREIGN KEY (`Empleado_IDPERSONA`) REFERENCES `persona` (`IDPERSONA`),
  ADD CONSTRAINT `FK_EMPLEADO_VENTA_listaVentas_IDVENTA` FOREIGN KEY (`listaVentas_IDVENTA`) REFERENCES `venta` (`IDVENTA`);

--
-- Filtros para la tabla `paqueteturistico_servicioturistico`
--
ALTER TABLE `paqueteturistico_servicioturistico`
  ADD CONSTRAINT `PQTTURISTICOSERVICIOTURISTICOPqtTuristicoIDPAQUETE` FOREIGN KEY (`PaqueteTuristico_IDPAQUETE`) REFERENCES `paqueteturistico` (`IDPAQUETE`),
  ADD CONSTRAINT `PQTTURISTICOSERVICIOTURISTICOlstSrviciosIDSERVICIO` FOREIGN KEY (`listaServicios_IDSERVICIO`) REFERENCES `servicioturistico` (`IDSERVICIO`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FK_PERSONA_DIRECCION_IDDIRECCION` FOREIGN KEY (`DIRECCION_IDDIRECCION`) REFERENCES `direccion` (`IDDIRECCION`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_VENTA_PAQUETETURISTICO_IDPAQUETE` FOREIGN KEY (`PAQUETETURISTICO_IDPAQUETE`) REFERENCES `paqueteturistico` (`IDPAQUETE`);

--
-- Filtros para la tabla `venta_servicioturistico`
--
ALTER TABLE `venta_servicioturistico`
  ADD CONSTRAINT `FK_VENTA_SERVICIOTURISTICO_Venta_IDVENTA` FOREIGN KEY (`Venta_IDVENTA`) REFERENCES `venta` (`IDVENTA`),
  ADD CONSTRAINT `VENTA_SERVICIOTURISTICO_listaServicios_IDSERVICIO` FOREIGN KEY (`listaServicios_IDSERVICIO`) REFERENCES `servicioturistico` (`IDSERVICIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
