/*
 Navicat Premium Data Transfer

 Source Server         : Practicas BBDD2
 Source Server Type    : MariaDB
 Source Server Version : 100507
 Source Host           : labs-dbservices01.ucab.edu.ve:3306
 Source Schema         : bd2_202215_27948813

 Target Server Type    : MariaDB
 Target Server Version : 100507
 File Encoding         : 65001

 Date: 26/10/2021 17:22:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cand_por_empresa
-- ----------------------------
DROP TABLE IF EXISTS `cand_por_empresa`;
CREATE TABLE `cand_por_empresa`  (
  `ci` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rif` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ci`, `rif`) USING BTREE,
  INDEX `fk_CAND_POR_EMPRESA_CAND_POR_EMPRESA_2`(`rif`) USING BTREE,
  CONSTRAINT `fk_CAND_POR_EMPRESA_CAND_POR_EMPRESA_1` FOREIGN KEY (`ci`) REFERENCES `candidatos` (`ci`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CAND_POR_EMPRESA_CAND_POR_EMPRESA_2` FOREIGN KEY (`rif`) REFERENCES `empresas` (`rif`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cand_por_empresa
-- ----------------------------
INSERT INTO `cand_por_empresa` VALUES ('10288345', '10288');
INSERT INTO `cand_por_empresa` VALUES ('10288345', '123456');
INSERT INTO `cand_por_empresa` VALUES ('10288345', '27948');
INSERT INTO `cand_por_empresa` VALUES ('10288345', '789012');
INSERT INTO `cand_por_empresa` VALUES ('26500626', '27948');
INSERT INTO `cand_por_empresa` VALUES ('26500626', '389956');
INSERT INTO `cand_por_empresa` VALUES ('2651444', '123456');
INSERT INTO `cand_por_empresa` VALUES ('2651444', '27948');
INSERT INTO `cand_por_empresa` VALUES ('27948813', '10288');
INSERT INTO `cand_por_empresa` VALUES ('27948813', '123456');
INSERT INTO `cand_por_empresa` VALUES ('27948813', '27948');
INSERT INTO `cand_por_empresa` VALUES ('27948813', '389956');
INSERT INTO `cand_por_empresa` VALUES ('8242993', '123456');
INSERT INTO `cand_por_empresa` VALUES ('8266061', '123456');
INSERT INTO `cand_por_empresa` VALUES ('8266061', '27948');
INSERT INTO `cand_por_empresa` VALUES ('8266061', '789012');

-- ----------------------------
-- Table structure for candidatos
-- ----------------------------
DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE `candidatos`  (
  `ci` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ci`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of candidatos
-- ----------------------------
INSERT INTO `candidatos` VALUES ('10288345', 'Jesus Lopez');
INSERT INTO `candidatos` VALUES ('26500626', 'Angie Ordoñez');
INSERT INTO `candidatos` VALUES ('2651444', 'Germán Guerra');
INSERT INTO `candidatos` VALUES ('27948813', 'Luisa Lopez');
INSERT INTO `candidatos` VALUES ('8242993', 'Maria Guerra');
INSERT INTO `candidatos` VALUES ('8266061', 'Natalia Guerra');

-- ----------------------------
-- Table structure for empresas
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas`  (
  `rif` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`rif`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empresas
-- ----------------------------
INSERT INTO `empresas` VALUES ('10288', 'JL1290 CA');
INSERT INTO `empresas` VALUES ('123456', 'El artesano');
INSERT INTO `empresas` VALUES ('27948', 'Panificadora Real');
INSERT INTO `empresas` VALUES ('389956', 'MyM San Félix');
INSERT INTO `empresas` VALUES ('789012', 'Palermo CA');

-- ----------------------------
-- Table structure for hab_por_cand
-- ----------------------------
DROP TABLE IF EXISTS `hab_por_cand`;
CREATE TABLE `hab_por_cand`  (
  `ci` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `habilidad` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ci`, `habilidad`) USING BTREE,
  INDEX `fk_HAB_POR_CAND_HAB_POR_CAND_id`(`habilidad`) USING BTREE,
  CONSTRAINT `fk_HAB_POR_CAND_HAB_POR_CAND_1` FOREIGN KEY (`ci`) REFERENCES `candidatos` (`ci`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_HAB_POR_CAND_HAB_POR_CAND_id` FOREIGN KEY (`habilidad`) REFERENCES `habilidades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hab_por_cand
-- ----------------------------
INSERT INTO `hab_por_cand` VALUES ('10288345', 2);
INSERT INTO `hab_por_cand` VALUES ('10288345', 3);
INSERT INTO `hab_por_cand` VALUES ('10288345', 4);
INSERT INTO `hab_por_cand` VALUES ('10288345', 5);
INSERT INTO `hab_por_cand` VALUES ('10288345', 6);
INSERT INTO `hab_por_cand` VALUES ('26500626', 6);
INSERT INTO `hab_por_cand` VALUES ('26500626', 7);
INSERT INTO `hab_por_cand` VALUES ('2651444', 1);
INSERT INTO `hab_por_cand` VALUES ('2651444', 3);
INSERT INTO `hab_por_cand` VALUES ('27948813', 1);
INSERT INTO `hab_por_cand` VALUES ('27948813', 2);
INSERT INTO `hab_por_cand` VALUES ('27948813', 3);
INSERT INTO `hab_por_cand` VALUES ('27948813', 4);
INSERT INTO `hab_por_cand` VALUES ('27948813', 5);
INSERT INTO `hab_por_cand` VALUES ('27948813', 6);
INSERT INTO `hab_por_cand` VALUES ('27948813', 7);
INSERT INTO `hab_por_cand` VALUES ('8242993', 2);
INSERT INTO `hab_por_cand` VALUES ('8242993', 4);
INSERT INTO `hab_por_cand` VALUES ('8242993', 5);
INSERT INTO `hab_por_cand` VALUES ('8266061', 1);
INSERT INTO `hab_por_cand` VALUES ('8266061', 2);
INSERT INTO `hab_por_cand` VALUES ('8266061', 3);
INSERT INTO `hab_por_cand` VALUES ('8266061', 4);
INSERT INTO `hab_por_cand` VALUES ('8266061', 5);
INSERT INTO `hab_por_cand` VALUES ('8266061', 6);

-- ----------------------------
-- Table structure for hab_por_vac
-- ----------------------------
DROP TABLE IF EXISTS `hab_por_vac`;
CREATE TABLE `hab_por_vac`  (
  `vacante` int(11) NOT NULL,
  `habilidad` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`vacante`, `habilidad`) USING BTREE,
  INDEX `fk_HAB_POR_VAC_HAB_POR_VAC_hab`(`habilidad`) USING BTREE,
  CONSTRAINT `fk_HAB_POR_VAC_HAB_POR_VAC_hab` FOREIGN KEY (`habilidad`) REFERENCES `habilidades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_HAB_POR_VAC_HAB_POR_VAC_vac` FOREIGN KEY (`vacante`) REFERENCES `vacantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hab_por_vac
-- ----------------------------
INSERT INTO `hab_por_vac` VALUES (1, 1);
INSERT INTO `hab_por_vac` VALUES (1, 2);
INSERT INTO `hab_por_vac` VALUES (1, 3);
INSERT INTO `hab_por_vac` VALUES (1, 4);
INSERT INTO `hab_por_vac` VALUES (1, 5);
INSERT INTO `hab_por_vac` VALUES (2, 1);
INSERT INTO `hab_por_vac` VALUES (2, 2);
INSERT INTO `hab_por_vac` VALUES (2, 3);
INSERT INTO `hab_por_vac` VALUES (2, 4);
INSERT INTO `hab_por_vac` VALUES (2, 5);
INSERT INTO `hab_por_vac` VALUES (2, 6);
INSERT INTO `hab_por_vac` VALUES (2, 7);
INSERT INTO `hab_por_vac` VALUES (3, 1);
INSERT INTO `hab_por_vac` VALUES (3, 2);
INSERT INTO `hab_por_vac` VALUES (3, 3);
INSERT INTO `hab_por_vac` VALUES (3, 4);
INSERT INTO `hab_por_vac` VALUES (3, 5);
INSERT INTO `hab_por_vac` VALUES (3, 6);
INSERT INTO `hab_por_vac` VALUES (3, 7);
INSERT INTO `hab_por_vac` VALUES (4, 1);
INSERT INTO `hab_por_vac` VALUES (4, 2);
INSERT INTO `hab_por_vac` VALUES (4, 3);
INSERT INTO `hab_por_vac` VALUES (4, 4);
INSERT INTO `hab_por_vac` VALUES (4, 5);
INSERT INTO `hab_por_vac` VALUES (4, 6);
INSERT INTO `hab_por_vac` VALUES (4, 7);
INSERT INTO `hab_por_vac` VALUES (5, 1);
INSERT INTO `hab_por_vac` VALUES (5, 2);
INSERT INTO `hab_por_vac` VALUES (5, 3);
INSERT INTO `hab_por_vac` VALUES (5, 4);
INSERT INTO `hab_por_vac` VALUES (5, 5);
INSERT INTO `hab_por_vac` VALUES (5, 6);
INSERT INTO `hab_por_vac` VALUES (5, 7);
INSERT INTO `hab_por_vac` VALUES (6, 1);
INSERT INTO `hab_por_vac` VALUES (6, 2);
INSERT INTO `hab_por_vac` VALUES (6, 3);
INSERT INTO `hab_por_vac` VALUES (6, 4);
INSERT INTO `hab_por_vac` VALUES (6, 5);
INSERT INTO `hab_por_vac` VALUES (6, 6);
INSERT INTO `hab_por_vac` VALUES (6, 7);
INSERT INTO `hab_por_vac` VALUES (7, 1);
INSERT INTO `hab_por_vac` VALUES (7, 2);
INSERT INTO `hab_por_vac` VALUES (7, 3);
INSERT INTO `hab_por_vac` VALUES (7, 4);
INSERT INTO `hab_por_vac` VALUES (7, 5);
INSERT INTO `hab_por_vac` VALUES (7, 6);
INSERT INTO `hab_por_vac` VALUES (7, 7);
INSERT INTO `hab_por_vac` VALUES (8, 1);
INSERT INTO `hab_por_vac` VALUES (8, 2);
INSERT INTO `hab_por_vac` VALUES (8, 3);
INSERT INTO `hab_por_vac` VALUES (8, 4);
INSERT INTO `hab_por_vac` VALUES (8, 5);
INSERT INTO `hab_por_vac` VALUES (8, 6);
INSERT INTO `hab_por_vac` VALUES (9, 1);
INSERT INTO `hab_por_vac` VALUES (9, 2);
INSERT INTO `hab_por_vac` VALUES (9, 3);
INSERT INTO `hab_por_vac` VALUES (9, 4);
INSERT INTO `hab_por_vac` VALUES (9, 5);
INSERT INTO `hab_por_vac` VALUES (9, 6);
INSERT INTO `hab_por_vac` VALUES (10, 1);
INSERT INTO `hab_por_vac` VALUES (10, 2);
INSERT INTO `hab_por_vac` VALUES (10, 7);

-- ----------------------------
-- Table structure for habilidades
-- ----------------------------
DROP TABLE IF EXISTS `habilidades`;
CREATE TABLE `habilidades`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of habilidades
-- ----------------------------
INSERT INTO `habilidades` VALUES (1, 'trabajo en equipo');
INSERT INTO `habilidades` VALUES (2, 'trabajo bajo presion');
INSERT INTO `habilidades` VALUES (3, 'manejo de word');
INSERT INTO `habilidades` VALUES (4, 'manejo de excel');
INSERT INTO `habilidades` VALUES (5, 'manejo de powerpoint');
INSERT INTO `habilidades` VALUES (6, 'toma de decisiones');
INSERT INTO `habilidades` VALUES (7, 'ingles');

-- ----------------------------
-- Table structure for postulaciones
-- ----------------------------
DROP TABLE IF EXISTS `postulaciones`;
CREATE TABLE `postulaciones`  (
  `ci` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `oferta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`ci`, `oferta`) USING BTREE,
  INDEX `fk_POSTULACIONES_POSTULACIONES_2`(`oferta`) USING BTREE,
  CONSTRAINT `fk_POSTULACIONES_POSTULACIONES_1` FOREIGN KEY (`ci`) REFERENCES `candidatos` (`ci`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_POSTULACIONES_POSTULACIONES_2` FOREIGN KEY (`oferta`) REFERENCES `vacantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of postulaciones
-- ----------------------------
INSERT INTO `postulaciones` VALUES ('10288345', 1, '2021-10-26');
INSERT INTO `postulaciones` VALUES ('26500626', 7, '2021-10-26');
INSERT INTO `postulaciones` VALUES ('2651444', 6, '2021-10-26');
INSERT INTO `postulaciones` VALUES ('27948813', 1, '2021-10-26');
INSERT INTO `postulaciones` VALUES ('8242993', 4, '2021-10-26');
INSERT INTO `postulaciones` VALUES ('8266061', 5, '2021-10-26');

-- ----------------------------
-- Table structure for telefonos
-- ----------------------------
DROP TABLE IF EXISTS `telefonos`;
CREATE TABLE `telefonos`  (
  `rif` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tlf` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`rif`, `tlf`) USING BTREE,
  CONSTRAINT `fk_TELEFONOS_TELEFONOS_1` FOREIGN KEY (`rif`) REFERENCES `empresas` (`rif`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telefonos
-- ----------------------------
INSERT INTO `telefonos` VALUES ('10288', '04125698521');
INSERT INTO `telefonos` VALUES ('123456', '02869569548');
INSERT INTO `telefonos` VALUES ('123456', '0414489696');
INSERT INTO `telefonos` VALUES ('123456', '04268569696');
INSERT INTO `telefonos` VALUES ('27948', '02812713478');
INSERT INTO `telefonos` VALUES ('27948', '041425695');
INSERT INTO `telefonos` VALUES ('389956', '02125696964');
INSERT INTO `telefonos` VALUES ('789012', '02835698985');
INSERT INTO `telefonos` VALUES ('789012', '04127896352');

-- ----------------------------
-- Table structure for vac_por_empresa
-- ----------------------------
DROP TABLE IF EXISTS `vac_por_empresa`;
CREATE TABLE `vac_por_empresa`  (
  `rif` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `oferta` int(11) NOT NULL AUTO_INCREMENT,
  `sueldo` decimal(65, 0) NOT NULL,
  PRIMARY KEY (`rif`, `oferta`) USING BTREE,
  INDEX `fk_VAC_POR_EMPRESA_VAC_POR_EMPRESA_2`(`oferta`) USING BTREE,
  CONSTRAINT `fk_VAC_POR_EMPRESA_VAC_POR_EMPRESA_1` FOREIGN KEY (`rif`) REFERENCES `empresas` (`rif`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_VAC_POR_EMPRESA_VAC_POR_EMPRESA_2` FOREIGN KEY (`oferta`) REFERENCES `vacantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vac_por_empresa
-- ----------------------------
INSERT INTO `vac_por_empresa` VALUES ('10288', 1, 1589);
INSERT INTO `vac_por_empresa` VALUES ('10288', 2, 25274);
INSERT INTO `vac_por_empresa` VALUES ('10288', 3, 40450);
INSERT INTO `vac_por_empresa` VALUES ('123456', 4, 78314);
INSERT INTO `vac_por_empresa` VALUES ('123456', 6, 7963);
INSERT INTO `vac_por_empresa` VALUES ('123456', 7, 36786);
INSERT INTO `vac_por_empresa` VALUES ('27948', 1, 1589);
INSERT INTO `vac_por_empresa` VALUES ('389956', 8, 36786);
INSERT INTO `vac_por_empresa` VALUES ('389956', 9, 7963);
INSERT INTO `vac_por_empresa` VALUES ('389956', 10, 78314);
INSERT INTO `vac_por_empresa` VALUES ('789012', 1, 75363);
INSERT INTO `vac_por_empresa` VALUES ('789012', 5, 377732);
INSERT INTO `vac_por_empresa` VALUES ('789012', 10, 73278);

-- ----------------------------
-- Table structure for vacantes
-- ----------------------------
DROP TABLE IF EXISTS `vacantes`;
CREATE TABLE `vacantes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `puesto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vacantes
-- ----------------------------
INSERT INTO `vacantes` VALUES (1, 'gerente');
INSERT INTO `vacantes` VALUES (2, 'supervisor');
INSERT INTO `vacantes` VALUES (3, 'cajero');
INSERT INTO `vacantes` VALUES (4, 'almacenista');
INSERT INTO `vacantes` VALUES (5, 'recepcionista');
INSERT INTO `vacantes` VALUES (6, 'manejo al cambio');
INSERT INTO `vacantes` VALUES (7, 'mensajero');
INSERT INTO `vacantes` VALUES (8, 'programador');
INSERT INTO `vacantes` VALUES (9, 'UX/UI designer');
INSERT INTO `vacantes` VALUES (10, 'tester');

SET FOREIGN_KEY_CHECKS = 1;
