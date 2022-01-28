#Una vista de lectura que muestre un listado de todos los candidatos que aplicaron a una vacante, sin información de contacto.

CREATE VIEW aplicacion_candidatos AS
SELECT C.cedula, C.nombre, C.edad, C.genero, C.direccion
FROM candidato AS C
INNER JOIN se_postula ON C.cedula = se_postula.cedula
GROUP BY cedula