#Desarrollar una tarea programada, para que, mensualmente, elimine los usuarios registrados hace más de 6 meses y que nunca han validado su correo.
SET GLOBAL event_scheduler = ON;
CREATE EVENT usuario_sin_validar
ON SCHEDULE EVERY 1 MONTH STARTS '2022-02-07 23:00:00'
ON COMPLETION PRESERVE
DO DELETE FROM candidato WHERE ((DATEDIFF(CURRENT_DATE,fecha_registro)/30)>6) AND (codigo_validacion = NULL);