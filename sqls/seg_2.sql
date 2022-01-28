#Otorgue permisos de ejecución de funciones y procedimientos almacenados a alguno de sus compañeros.

CREATE USER 'usr_sitio_web_28611790'@'%' IDENTIFIED BY '28611790';
GRANT EXECUTE ON bd2_202215_28162752.* TO 'usr_sitio_web_28611790'@'%';