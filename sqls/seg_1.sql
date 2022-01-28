#Realice las sentencias SQL para definir el usuario "usr_sitio_web_<cédula>" con acceso de lectura a todas las tablas de la base de datos respectiva a la <cédula> y que, además, posea permisos de escritura sobre la tabla de candidatos siempre que se conecte desde el equipo "serverweb".

CREATE USER 'usr_sitio_web_28162752'@'%' IDENTIFIED BY '28162752';
GRANT SELECT ON bd2_202215_28162752.* TO 'usr_sitio_web_28162752'@'%';
GRANT INSERT, UPDATE, DELETE ON bd2_202215_28162752.candidato TO 'usr_sitio_web_28162752'@'serverweb';