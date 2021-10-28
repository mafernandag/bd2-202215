/*
 Navicat Premium Data Transfer

 Source Server         : bbdd2
 Source Server Type    : MySQL
 Source Server Version : 100507
 Source Host           : labs-dbservices01.ucab.edu.ve:3306
 Source Schema         : bd2_202215_28162752

 Target Server Type    : MySQL
 Target Server Version : 100507
 File Encoding         : 65001

 Date: 27/10/2021 17:44:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for candidato
-- ----------------------------
DROP TABLE IF EXISTS `candidato`;
CREATE TABLE `candidato`  (
  `cedula` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `edad` int(11) NOT NULL,
  `direccion` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `genero` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`cedula`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of candidato
-- ----------------------------
INSERT INTO `candidato` VALUES ('15745232', 'Angel Hernandez', 32, 'Puerto Ordaz', 'M', '04165852654');
INSERT INTO `candidato` VALUES ('18474521', 'Karen Lopez', 28, 'San Felix', 'F', '04245852652');
INSERT INTO `candidato` VALUES ('27485123', 'Luis Perez', 22, 'San Felix', 'M', '04245897712');
INSERT INTO `candidato` VALUES ('28162752', 'Maria Guerra', 20, 'Puerto Ordaz', 'F', '04148894122');

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa`  (
  `id_empresa` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_empresa`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO `empresa` VALUES ('1', 'Alcasa');
INSERT INTO `empresa` VALUES ('2', 'Venalum');
INSERT INTO `empresa` VALUES ('3', 'Bauxilum');
INSERT INTO `empresa` VALUES ('4', 'Sidor');

-- ----------------------------
-- Table structure for habilidad_requerida
-- ----------------------------
DROP TABLE IF EXISTS `habilidad_requerida`;
CREATE TABLE `habilidad_requerida`  (
  `id_cargo` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_habilidad` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_cargo`, `id_habilidad`) USING BTREE,
  INDEX `fk_habilidades`(`id_habilidad`) USING BTREE,
  CONSTRAINT `fk_vacante_habilidad_requerida_1` FOREIGN KEY (`id_cargo`) REFERENCES `vacante` (`id_cargo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_habilidades` FOREIGN KEY (`id_habilidad`) REFERENCES `habilidades` (`id_habilidad`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of habilidad_requerida
-- ----------------------------
INSERT INTO `habilidad_requerida` VALUES ('adm', 'excl');
INSERT INTO `habilidad_requerida` VALUES ('arq', 'dpln');
INSERT INTO `habilidad_requerida` VALUES ('cont', 'excl');
INSERT INTO `habilidad_requerida` VALUES ('inf', 'dweb');

-- ----------------------------
-- Table structure for habilidades
-- ----------------------------
DROP TABLE IF EXISTS `habilidades`;
CREATE TABLE `habilidades`  (
  `id_habilidad` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_habilidad`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of habilidades
-- ----------------------------
INSERT INTO `habilidades` VALUES ('dpln', 'Diseño de planos');
INSERT INTO `habilidades` VALUES ('dweb', 'Desarrollo web');
INSERT INTO `habilidades` VALUES ('excl', 'Uso de Excel');

-- ----------------------------
-- Table structure for posee_habilidad
-- ----------------------------
DROP TABLE IF EXISTS `posee_habilidad`;
CREATE TABLE `posee_habilidad`  (
  `cedula` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_habilidad` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`cedula`, `id_habilidad`) USING BTREE,
  INDEX `fk_posee_habilidad`(`id_habilidad`) USING BTREE,
  CONSTRAINT `fk_candidato_habilidades_1` FOREIGN KEY (`cedula`) REFERENCES `candidato` (`cedula`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_posee_habilidad` FOREIGN KEY (`id_habilidad`) REFERENCES `habilidades` (`id_habilidad`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posee_habilidad
-- ----------------------------
INSERT INTO `posee_habilidad` VALUES ('15745232', 'dpln');
INSERT INTO `posee_habilidad` VALUES ('18474521', 'excl');
INSERT INTO `posee_habilidad` VALUES ('27485123', 'excl');
INSERT INTO `posee_habilidad` VALUES ('28162752', 'dweb');

-- ----------------------------
-- Table structure for registra
-- ----------------------------
DROP TABLE IF EXISTS `registra`;
CREATE TABLE `registra`  (
  `id_empresa` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_cargo` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_empresa`, `id_cargo`) USING BTREE,
  INDEX `id_cargo`(`id_cargo`) USING BTREE,
  INDEX `id_empresa`(`id_empresa`) USING BTREE,
  CONSTRAINT `fk_empresa_registra_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vacante_registra_1` FOREIGN KEY (`id_cargo`) REFERENCES `vacante` (`id_cargo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of registra
-- ----------------------------
INSERT INTO `registra` VALUES ('1', 'adm');
INSERT INTO `registra` VALUES ('2', 'arq');
INSERT INTO `registra` VALUES ('2', 'cont');
INSERT INTO `registra` VALUES ('3', 'inf');
INSERT INTO `registra` VALUES ('4', 'cont');

-- ----------------------------
-- Table structure for se_postula
-- ----------------------------
DROP TABLE IF EXISTS `se_postula`;
CREATE TABLE `se_postula`  (
  `id_cargo` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cedula` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_cargo`, `cedula`) USING BTREE,
  INDEX `fk_se_postula_candidato_1`(`cedula`) USING BTREE,
  INDEX `id_cargo`(`id_cargo`) USING BTREE,
  CONSTRAINT `fk_se_postula_candidato_1` FOREIGN KEY (`cedula`) REFERENCES `candidato` (`cedula`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vacante_se_postula_1` FOREIGN KEY (`id_cargo`) REFERENCES `vacante` (`id_cargo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of se_postula
-- ----------------------------
INSERT INTO `se_postula` VALUES ('adm', '27485123');
INSERT INTO `se_postula` VALUES ('arq', '15745232');
INSERT INTO `se_postula` VALUES ('cont', '18474521');
INSERT INTO `se_postula` VALUES ('inf', '28162752');

-- ----------------------------
-- Table structure for vacante
-- ----------------------------
DROP TABLE IF EXISTS `vacante`;
CREATE TABLE `vacante`  (
  `id_cargo` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_cargo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `salario` float NOT NULL,
  PRIMARY KEY (`id_cargo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vacante
-- ----------------------------
INSERT INTO `vacante` VALUES ('adm', 'Administrador', 80);
INSERT INTO `vacante` VALUES ('arq', 'Arquitecto', 95);
INSERT INTO `vacante` VALUES ('cont', 'Contador', 85);
INSERT INTO `vacante` VALUES ('inf', 'Ing informatico', 100);

SET FOREIGN_KEY_CHECKS = 1;
