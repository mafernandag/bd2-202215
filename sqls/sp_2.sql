DELIMITER $$
CREATE PROCEDURE sp_2(ci VARCHAR (8), ide VARCHAR (40), idc VARCHAR (40)) 
BEGIN
	UPDATE registra
	SET candidato_seleccionado = ci
	WHERE id_cargo = idc
	AND id_empresa = ide;
END$$
delimiter;