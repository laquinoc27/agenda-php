-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2021 a las 19:18:54
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agenda_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `hora_inicio` varchar(20) DEFAULT NULL,
  `fecha_finalizacion` varchar(20) DEFAULT NULL,
  `hora_finalizacion` varchar(20) DEFAULT NULL,
  `allday` tinyint(1) NOT NULL,
  `fk_usuarios` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `titulo`, `fecha_inicio`, `hora_inicio`, `fecha_finalizacion`, `hora_finalizacion`, `allday`, `fk_usuarios`) VALUES
(1, 'Primer Evento Demo', '2017-10-01', '06:00:00', '2017-10-01', '07:00:00', 0, 'usuario@mail.com'),
(2, 'Segundo Evento Demo', '2017-10-03', '08:30:00', '2017-10-03', '10:30:00', 0, 'usuario@mail.com'),
(3, 'Tercer Evento Demo - Dia entero', '2017-10-05', '', '', '', 1, 'usuario@mail.com'),
(4, 'Primer Evento Juan - Dia entero', '2017-10-02', ':00', '', ':00', 1, 'luis@mail.com'),
(5, 'Segundo Evento Juan', '2017-10-02', '12:30:00', '2017-10-05', '17:30:00', 0, 'luis@mail.com'),
(6, 'Tercer Evento Juan', '2017-10-11', '12:30:00', '2017-10-12', '17:30:00', 0, 'luis@mail.com'),
(7, 'Primer Evento Carla', '2017-10-05', '05:00:00', '2017-10-07', '15:00:00', 0, 'marisol@mail.com'),
(8, 'Segundo Evento Carla', '2017-10-11', '16:00:00', '2017-10-11', '17:00:00', 0, 'marisol@mail.com'),
(9, 'Tercer Evento Carla - Dia entero', '2017-10-15', ':00', '', ':00', 1, 'marisol@mail.com'),
(10, 'Cuarto Evento Carla - Dia entero', '2017-10-16', '', '', '', 1, 'marisol@mail.com'),
(12, 'Cumpleaños', '2021-10-27', '06:30:00', '2021-10-27', '07:30:00', 0, 'marisol@mail.com'),
(13, 'Revisión de avance', '2021-11-03', '16:00:00', '2021-11-03', '17:00:00', 0, 'marisol@mail.com'),
(14, 'Procesión del señor de los milagros', '2021-10-28', '15:00:00', '2021-10-28', '18:00:00', 0, 'luis@mail.com'),
(15, 'Cumpleaños', '2021-10-27', ':00', '', ':00', 1, 'luis@mail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `email` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`email`, `nombre`, `password`, `fecha_nacimiento`) VALUES
('luis@mail.com', 'Luis Aquino', '$2y$10$rUNipkbIkuD9i0SS1beoauf3vI.H64ifn/8wWDAHWKlqn1kdBrpLS', '1997-12-21'),
('marisol@mail.com', 'Marisol Gerónimo', '$2y$10$jKtuUYl6SCCnPt1D1XVPvepTnxWQBRY6S58NGB3AhTt4F0SVZhaum', '1990-04-15'),
('usuario@mail.com', 'Usuario agenda', '$2y$10$/0sQ3gkcfaIShTsthJeQPuWIGDyssIZz88be0IyLp5moRNnfOj6dq', '1998-09-08');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuarios` (`fk_usuarios`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_usuarioemail_evento` FOREIGN KEY (`fk_usuarios`) REFERENCES `usuarios` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
