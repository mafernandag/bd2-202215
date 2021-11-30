#2. Desarrollar una función almacenada que reciba el id de una empresa y devuelva verdadero si la misma es una "empresa de alta demanda".
#Nota: Una empresa de alta demanda es aquella que tiene más de 15 ofertas en el último año y además más de la mitad de sus ofertas reciben al menos 10 postulaciones.

DELIMITER $$
CREATE PROCEDURE sf_2(ide VARCHAR (40)) 
BEGIN
	DECLARE ofertas int;
	DECLARE postulaciones int;
	DECLARE alta_demanda VARCHAR(15);
	
	SELECT count(id_empresa) INTO ofertas 
	FROM registra
	WHERE id_empresa = ide
	AND fecha < '2021-12-31';
	
	SELECT count(id_empresa) INTO postulaciones 
	FROM se_postula
	WHERE id_empresa = ide;
	
	IF ofertas >= 15 AND postulaciones >= 10 THEN
		SET alta_demanda = "Verdadero";
	ELSE
		SET alta_demanda = "Falso";
	END IF;
	
	SELECT alta_demanda;

END$$
delimiter;