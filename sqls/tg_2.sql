CREATE TRIGGER ValidarPagoPostulacionBeforeInsert
BEFORE INSERT
ON se_postula FOR EACH ROW
BEGIN
 CALL validarPagoPostulacion(NEW.id_cargo, NEW.id_empresa);
END

CREATE DEFINER=`bd2_202215_28162752`@`%` PROCEDURE `validarPagoPostulacion`(id_cargo VARCHAR(8), id_empresa VARCHAR(8))
BEGIN
    DECLARE pagada BOOLEAN;
    
    SET pagada = EXISTS(
        SELECT * FROM registra AS R WHERE R.id_cargo = id_cargo AND R.id_empresa = id_empresa AND vacante_pagada = 's'
    );

    IF NOT (pagada) THEN
        SIGNAL SQLSTATE'45000' SET MESSAGE_TEXT = 'La postulacion no ha sido pagada, no se pueden recibir candidaturas.';
    END IF;    