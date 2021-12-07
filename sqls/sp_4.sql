DELIMITER $$
CREATE PROCEDURE sp_4() 
BEGIN
	DECLARE pago char;
	DECLARE nrow int;
	DECLARE i int;
	DECLARE ide VARCHAR(8);
	DECLARE idc VARCHAR(8);
	DECLARE fven DATE;
	DECLARE fecha DATE;
	
	SET fecha = CAST(GETDATE() AS date);
	SET i = 1;
	
	SELECT COUNT(*) INTO nrow FROM registra;
	
	WHILE (i <= nrow)
	BEGIN
		SELECT vacante_pagada, id_empresa, id_cargo, fecha_vencimiento INTO pago, ide, idc, fven FROM registra;
		
		IF pago = 'n' OR fecha > fven THEN
			UPDATE registra
			SET estado = 'i'
			WHERE id_empresa = ide AND id_cargo = idc;
		END IF;
		SET i += 1;	
	END;
	
END$$
delimiter;