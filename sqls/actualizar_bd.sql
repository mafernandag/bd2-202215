ALTER TABLE `bd2_202215_28162752`.`registra`
ADD COLUMN `candidato_seleccionado` varchar(8) AFTER `vacante_pagada`,
ADD COLUMN `estado` char AFTER `candidato_seleccionado`;

ALTER TABLE `bd2_202215_28162752`.`candidato`
ADD COLUMN `codigo_validacion` varchar(10) AFTER `telefono`;
