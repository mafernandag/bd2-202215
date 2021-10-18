--FECHA: 18/10/2021, HORA: 5:33 pm
CREATE TABLE `candidato`  (
  `cedula` varchar(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `edad` int NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `genero` char(1) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  PRIMARY KEY (`cedula`)
);

CREATE TABLE `empresa`  (
  `id_empresa` varchar(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_empresa`)
);

CREATE TABLE `habilidades`  (
  `id_habilidad` varchar(8) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `id_cargo` varchar(8) NOT NULL,
  `cedula` varchar(8) NOT NULL,
  PRIMARY KEY (`id_habilidad`)
);

CREATE TABLE `registra`  (
  `id_empresa` varchar(8) NOT NULL,
  `id_cargo` varchar(8) NOT NULL,
  PRIMARY KEY (`id_empresa`, `id_cargo`)
);

CREATE TABLE `se_postula`  (
  `id_cargo` varchar(8) NOT NULL,
  `cedula` varchar(8) NOT NULL,
  PRIMARY KEY (`id_cargo`, `cedula`)
);

CREATE TABLE `vacante`  (
  `id_cargo` varchar(8) NOT NULL,
  `nombre_cargo` varchar(50) NOT NULL,
  `salario` float NOT NULL,
  PRIMARY KEY (`id_cargo`)
);

ALTER TABLE `candidato` ADD CONSTRAINT `fk_candidato_habilidades_1` FOREIGN KEY (`cedula`) REFERENCES `habilidades` (`cedula`);
ALTER TABLE `empresa` ADD CONSTRAINT `fk_empresa_registra_1` FOREIGN KEY (`id_empresa`) REFERENCES `registra` (`id_empresa`);
ALTER TABLE `se_postula` ADD CONSTRAINT `fk_se_postula_candidato_1` FOREIGN KEY (`cedula`) REFERENCES `candidato` (`cedula`);
ALTER TABLE `vacante` ADD CONSTRAINT `fk_vacante_registra_1` FOREIGN KEY (`id_cargo`) REFERENCES `registra` (`id_cargo`);
ALTER TABLE `vacante` ADD CONSTRAINT `fk_vacante_se_postula_1` FOREIGN KEY (`id_cargo`) REFERENCES `se_postula` (`id_cargo`);
ALTER TABLE `vacante` ADD CONSTRAINT `fk_vacante_habilidades_1` FOREIGN KEY (`id_cargo`) REFERENCES `habilidades` (`id_cargo`);

