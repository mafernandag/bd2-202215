CREATE TRIGGER ValidarCandidatoBeforeInsert
BEFORE INSERT
ON se_postula FOR EACH ROW
BEGIN
 CALL validarCandidato(NEW.cedula);
END

CREATE DEFINER=`bd2_202215_28162752`@`%` PROCEDURE `validarCandidato`(cedula VARCHAR (8))
BEGIN
    DECLARE validado BOOLEAN;
    
    SET validado = EXISTS(
        SELECT * FROM candidato AS C WHERE C.cedula = cedula AND codigo_validacion = 'Validado'
    );

    IF NOT (validado) THEN
        SIGNAL SQLSTATE'45000' SET MESSAGE_TEXT = 'Candidato no validado';
    END IF;    
END