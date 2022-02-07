#Desarrollar una tarea programada para que diariamente a las 11pm se suspendan las publicaciones vencidas.
SET GLOBAL event_scheduler = ON;
CREATE EVENT publicaciones_vencidas
ON SCHEDULE EVERY 1 DAY STARTS '2022-02-07 23:00:00'
ON COMPLETION PRESERVE
DO UPDATE registra SET estado = 'i' WHERE (fecha_vencimiento < CURRENT_DATE) AND (estado = NULL);
