CREATE DATABASE `db_inmobiliaria` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_inmobiliaria`;


CREATE TABLE `tb_administrador` (
  `int` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  PRIMARY KEY (`int`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `tb_contactos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `urlWhatsapp` varchar(450) DEFAULT NULL,
  `urlInstagram` varchar(450) DEFAULT NULL,
  `urlFacebook` varchar(450) DEFAULT NULL,
  `urlMaps` varchar(450) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `tb_imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(250) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;


CREATE TABLE `tb_propiedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `idImagenPrincipal` int(11) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `resenia` varchar(45) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  `urlMaps` varchar(400) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `fechaUltMod` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;



CREATE TABLE `tb_imagenes_propiedades` (
  `id_imagen` int(11) NOT NULL,
  `id_propiedad` int(11) NOT NULL,
  KEY `ff_imagenes_idx` (`id_imagen`),
  KEY `fk_propiedades_idx` (`id_propiedad`),
  CONSTRAINT `ff_imagenes` FOREIGN KEY (`id_imagen`) REFERENCES `tb_imagenes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_propiedades` FOREIGN KEY (`id_propiedad`) REFERENCES `tb_propiedades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tb_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` varchar(45) NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


insert into db_inmobiliaria.tb_contactos (direccion, urlWhatsapp, urlInstagram, urlMaps) value ('Av. 9 de Julio 201, Tapalque, Prov. de Buenos Aires.','https://wa.me/5492281683888','https://www.instagram.com/paulauzubiagainmobiliaria/', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d200.8338315100126!2d-60.031102302418006!3d-36.35251097953135!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9595c3c9a58f9d35%3A0x40049df05896e1ad!2sPaula%20Uzubiaga%20Casas%20%26%20Campos!5e0!3m2!1ses-419!2sar!4v1732820835774!5m2!1ses-419!2sar')

INSERT INTO `db_inmobiliaria`.`tb_administrador` (`usuario`, `contrasenia`) VALUES ('admin', 'admin');

