#1. Desarrollar una función almacenada que reciba el id de una vacante y devuelva verdadero si la misma está activa.
#Una vacante está activa cuando ya ha sido pagada y está entre su fecha de creación y de vencimiento.
DELIMITER $$
CREATE PROCEDURE sf_1(idv VARCHAR (40), ide VARCHAR (40)) 
BEGIN
	DECLARE pagada CHAR;
	DECLARE activa VARCHAR(15);
	SELECT vacante_pagada INTO pagada 
	FROM registra
	WHERE id_cargo = idv 
	AND id_empresa = ide
	AND fecha < '2021-11-29'
	AND fecha_vencimiento > '2021-11-29';
	
	IF pagada = 's' THEN
		SET activa = "Verdadero";
	ELSE
		SET activa = "Falso";
	END IF;
	
	SELECT activa;

END$$
delimiter;