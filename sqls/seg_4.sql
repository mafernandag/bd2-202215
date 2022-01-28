#Una vista de lectura, que permita modificar la "Espectativa salarial" en las ofertas publicadas

CREATE VIEW expectativa_salarial AS
SELECT SP.cedula CedulaCandidato, vacante.nombre_cargo CargoOferta, SP.expectativa_salarial ExpectativaSalarial 
FROM se_postula AS SP
INNER JOIN vacante ON SP.id_cargo = vacante.id_cargo
WHERE SP.id_empresa = '10288'