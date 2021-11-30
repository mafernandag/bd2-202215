ALTER TABLE `bd2_202215_28162752`.`se_postula`
ADD COLUMN `id_empresa` varchar(8) NOT NULL AFTER `fecha`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id_cargo`, `cedula`, `id_empresa`) USING BTREE,  
ADD CONSTRAINT `fk_se_postula_empresa_1` FOREIGN KEY (`id_empresa`) REFERENCES `bd2_202215_28162752`.`empresa` (`id_empresa`) ON DELETE RESTRICT ON UPDATE CASCADE;