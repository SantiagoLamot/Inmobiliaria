CREATE DATABASE `db_inmobiliaria` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_inmobiliaria`;

CREATE TABLE `tb_propiedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `idImagenPrincipal` int(11) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `resenia` varchar(45) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE `tb_imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(250) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

CREATE TABLE `tb_imagenes_propiedades` (
  `id_imagen` int(11) NOT NULL,
  `id_propiedad` int(11) NOT NULL,
  KEY `ff_imagenes_idx` (`id_imagen`),
  KEY `fk_propiedades_idx` (`id_propiedad`),
  CONSTRAINT `ff_imagenes` FOREIGN KEY (`id_imagen`) REFERENCES `tb_imagenes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_propiedades` FOREIGN KEY (`id_propiedad`) REFERENCES `tb_propiedades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
