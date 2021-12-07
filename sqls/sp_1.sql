DELIMITER $$
CREATE PROCEDURE sp_1(ide VARCHAR (40), idc VARCHAR (40)) 
BEGIN
    UPDATE registra
    SET vacante_pagada = 's', fecha_vencimiento = "2022-12-31"
    WHERE id_cargo = idc
    AND id_empresa = ide;
END$$
delimiter;