DELIMITER $$
CREATE PROCEDURE sp_3(ci VARCHAR (8), clave VARCHAR (10)) 
BEGIN
	DECLARE valido VARCHAR(10);	
	DECLARE codigo VARCHAR(8);
	
	SET valido = "Validado";
	SET codigo =  LEFT(UUID(), 8);
	
	IF @clave IS NULL THEN		
		UPDATE candidato
		SET codigo_validacion = codigo
		WHERE cedula = @ci;
	ELSE
		IF @clave = (SELECT codigo_validacion FROM candidato WHERE cedula = ci) THEN
			UPDATE candidato
			SET codigo_validacion = valido
			WHERE cedula = @ci;
		END IF;
	END IF;
	
END$$
delimiter;