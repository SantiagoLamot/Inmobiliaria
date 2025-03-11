CREATE DATABASE db_inmobiliaria;
USE db_inmobiliaria;

DROP TABLE IF EXISTS `tb_administrador`;
CREATE TABLE `tb_administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `tb_administrador` VALUES (1, 'UsuarioDefault', 'PassDefault');

DROP TABLE IF EXISTS `tb_contactos`;
CREATE TABLE `tb_contactos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `urlWhatsapp` varchar(450) DEFAULT NULL,
  `urlInstagram` varchar(450) DEFAULT NULL,
  `urlFacebook` varchar(450) DEFAULT NULL,
  `urlMaps` varchar(450) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

INSERT INTO `tb_contactos` VALUES (1, 'https://wa.me/5492281683888', 'https://www.instagram.com/paulauzubiagainmobiliaria/', 'https://www.facebook.com', 'https://www.google.com/maps/...', 'Av. 9 de Julio 201, Tapalque');

DROP TABLE IF EXISTS `tb_propiedades`;
CREATE TABLE `tb_propiedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `idImagenPrincipal` int(11) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `resenia` TEXT DEFAULT NULL,
  `descripcion` TEXT DEFAULT NULL,
  `urlMaps` varchar(400) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `fechaUltMod` datetime NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `tb_propiedades` VALUES (16, 'Los jacintos', 81, '', '1, 2', '1, 2, 3', 'https://maps.google.com', 'tapalque', 1, '2024-12-17 17:26:06');

DROP TABLE IF EXISTS `tb_imagenes`;
CREATE TABLE `tb_imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(250) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `tb_imagenes_propiedades`;
CREATE TABLE `tb_imagenes_propiedades` (
  `id_imagen` int(11) NOT NULL,
  `id_propiedad` int(11) NOT NULL,
  FOREIGN KEY (`id_imagen`) REFERENCES `tb_imagenes` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`id_propiedad`) REFERENCES `tb_propiedades` (`id`) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `tb_servicios`;
CREATE TABLE `tb_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` varchar(45) NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
);

INSERT INTO `tb_servicios` VALUES (3, 'Alquiler', 1), (8, 'Administracion', 1), (9, 'Ventas', 1);
