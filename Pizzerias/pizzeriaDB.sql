-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-05-2021 a las 02:55:12
-- Versión del servidor: 10.1.8-MariaDB
-- Versión de PHP: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pizzeria`
--
CREATE DATABASE IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pizzeria`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `IDDetallePedido` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float(11,2) NOT NULL,
  `IDPizza` int(11) NOT NULL,
  `IDPedido` int(11) NOT NULL,
  `IDEstadoPedido` int(11) NOT NULL,
  `IDFactura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallepedido`
--

INSERT INTO `detallepedido` (`IDDetallePedido`, `cantidad`, `precio`, `IDPizza`, `IDPedido`, `IDEstadoPedido`, `IDFactura`) VALUES
(1, 2, 125.00, 1, 1, 1, 1237),
(2, 1, 80.00, 3, 1, 1, 1237),
(3, 1, 150.00, 1, 2, 1, 1238);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadofactura`
--

CREATE TABLE `estadofactura` (
  `IDEstadoFactura` int(11) NOT NULL,
  `nombre` varchar(156) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadofactura`
--

INSERT INTO `estadofactura` (`IDEstadoFactura`, `nombre`) VALUES
(1, 'Generada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopedido`
--

CREATE TABLE `estadopedido` (
  `IDEstadoPedido` int(11) NOT NULL,
  `nombre` varchar(156) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadopedido`
--

INSERT INTO `estadopedido` (`IDEstadoPedido`, `nombre`) VALUES
(1, 'Pendiente de Facturación'),
(2, 'Facturado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `IDFactura` int(11) NOT NULL,
  `fechaHoraEmision` datetime NOT NULL,
  `IDEstadoFactura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`IDFactura`, `fechaHoraEmision`, `IDEstadoFactura`) VALUES
(1237, '2017-05-11 18:09:22', 1),
(1238, '2017-08-11 10:25:33', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `IDPedido` int(11) NOT NULL,
  `fechaHoraCracion` datetime NOT NULL,
  `fechaHoraEntrega` datetime NOT NULL,
  `nombreCliente` varchar(156) NOT NULL,
  `IDFactura` int(11) NOT NULL,
  `IDEstadoPedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`IDPedido`, `fechaHoraCracion`, `fechaHoraEntrega`, `nombreCliente`, `IDFactura`, `IDEstadoPedido`) VALUES
(1, '2017-04-11 21:30:00', '2017-04-11 21:37:00', 'Joaquín', 1237, 2),
(2, '2017-04-12 12:00:00', '2017-04-12 12:30:00', 'Mariano', 1238, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizza`
--

CREATE TABLE `pizza` (
  `IDPizza` int(11) NOT NULL,
  `nombre` varchar(156) NOT NULL,
  `precio` float(11,2) NOT NULL,
  `IDTamanoPizza` int(11) NOT NULL,
  `IDVariedadPizza` int(11) NOT NULL,
  `IDTipoPizza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pizza`
--

INSERT INTO `pizza` (`IDPizza`, `nombre`, `precio`, `IDTamanoPizza`, `IDVariedadPizza`, `IDTipoPizza`) VALUES
(1, 'Napolitana Normal', 125.00, 2, 1, 2),
(2, 'Especial grande', 150.00, 3, 2, 1),
(3, 'Mozzarella chica', 80.00, 1, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tamanopizza`
--

CREATE TABLE `tamanopizza` (
  `IDTamanoPizza` int(11) NOT NULL,
  `nombre` varchar(156) NOT NULL,
  `cantPorciones` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tamanopizza`
--

INSERT INTO `tamanopizza` (`IDTamanoPizza`, `nombre`, `cantPorciones`) VALUES
(1, 'Pequeña', 4),
(2, 'Normal', 8),
(3, 'Grande', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopizza`
--

CREATE TABLE `tipopizza` (
  `IDTipoPizza` int(11) NOT NULL,
  `nombre` varchar(156) NOT NULL,
  `descripcion` varchar(156) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipopizza`
--

INSERT INTO `tipopizza` (`IDTipoPizza`, `nombre`, `descripcion`) VALUES
(1, 'Horno', 'Pizza cocinada en horno industrial.'),
(2, 'Parrilla', 'Pizza cocinada en parrilla.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variedadpizza`
--

CREATE TABLE `variedadpizza` (
  `IDVariedadPizza` int(11) NOT NULL,
  `nombre` varchar(156) NOT NULL,
  `ingredientes` varchar(156) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `variedadpizza`
--

INSERT INTO `variedadpizza` (`IDVariedadPizza`, `nombre`, `ingredientes`) VALUES
(1, 'Napolitana', 'muzarella, salsa, tomates, aceitunas, oregano, ajo'),
(2, 'Especial', 'mozzarella, salsa, jamón cocido, morrón, aceitunas, oregano'),
(3, 'Muzzarella', 'mozzarella, salsa, aceitunas, oregano');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`IDDetallePedido`),
  ADD KEY `IDPizza` (`IDPizza`,`IDPedido`,`IDEstadoPedido`,`IDFactura`),
  ADD KEY `IDFactura` (`IDFactura`),
  ADD KEY `IDEstadoPedido` (`IDEstadoPedido`),
  ADD KEY `IDPedido` (`IDPedido`);

--
-- Indices de la tabla `estadofactura`
--
ALTER TABLE `estadofactura`
  ADD PRIMARY KEY (`IDEstadoFactura`);

--
-- Indices de la tabla `estadopedido`
--
ALTER TABLE `estadopedido`
  ADD PRIMARY KEY (`IDEstadoPedido`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`IDFactura`),
  ADD KEY `IDEstadoFactura` (`IDEstadoFactura`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`IDPedido`),
  ADD KEY `IDFactura` (`IDFactura`,`IDEstadoPedido`),
  ADD KEY `IDEstadoPedido` (`IDEstadoPedido`);

--
-- Indices de la tabla `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`IDPizza`),
  ADD KEY `IDTamanoPizza` (`IDTamanoPizza`,`IDVariedadPizza`,`IDTipoPizza`),
  ADD KEY `IDVariedadPizza` (`IDVariedadPizza`),
  ADD KEY `IDTipoPizza` (`IDTipoPizza`);

--
-- Indices de la tabla `tamanopizza`
--
ALTER TABLE `tamanopizza`
  ADD PRIMARY KEY (`IDTamanoPizza`);

--
-- Indices de la tabla `tipopizza`
--
ALTER TABLE `tipopizza`
  ADD PRIMARY KEY (`IDTipoPizza`);

--
-- Indices de la tabla `variedadpizza`
--
ALTER TABLE `variedadpizza`
  ADD PRIMARY KEY (`IDVariedadPizza`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`IDFactura`) REFERENCES `factura` (`IDFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`IDEstadoPedido`) REFERENCES `estadofactura` (`IDEstadoFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detallepedido_ibfk_3` FOREIGN KEY (`IDPedido`) REFERENCES `pedido` (`IDPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detallepedido_ibfk_4` FOREIGN KEY (`IDPizza`) REFERENCES `pizza` (`IDPizza`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`IDEstadoFactura`) REFERENCES `estadofactura` (`IDEstadoFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`IDFactura`) REFERENCES `factura` (`IDFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`IDEstadoPedido`) REFERENCES `estadopedido` (`IDEstadoPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`IDVariedadPizza`) REFERENCES `variedadpizza` (`IDVariedadPizza`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pizza_ibfk_2` FOREIGN KEY (`IDTamanoPizza`) REFERENCES `tamanopizza` (`IDTamanoPizza`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pizza_ibfk_3` FOREIGN KEY (`IDTipoPizza`) REFERENCES `tipopizza` (`IDTipoPizza`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
