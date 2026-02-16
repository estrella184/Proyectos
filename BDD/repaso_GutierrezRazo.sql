CREATE DATABASE tienda; -- crear base de datos
SHOW databases; -- mostrar bases de datos

USE tienda; -- usar la base de datos "tienda"


CREATE TABLE productos(
	codigo_p INT AUTO_INCREMENT, 
    codigo_provee INT,
    nombre VARCHAR(40),
    precio FLOAT,
    disponible INT,
    PRIMARY KEY(codigo_p),
    FOREIGN KEY(codigo_provee) REFERENCES proveedores(codigo)
    );
    
CREATE TABLE empleado2(
	cedula INT(10),
    nombre VARCHAR (30),
    apellido VARCHAR (30),
    cargo VARCHAR (10),
    tiempo_servicio INT(10)
    );
    
CREATE TABLE proveedores(
	codigo INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    direccion VARCHAR(50),
    pago FLOAT,
    PRIMARY KEY(codigo)
);

    
CREATE TABLE empleados(
	cedula INT(10),
    nombre VARCHAR (30),
    apellido VARCHAR (30),
    cargo VARCHAR (10),
    tiempo_servicio INT(10)
    ); -- creación de tabla
SHOW TABLES; -- mostrar tablas
DESCRIBE proveedores; -- mostrar campos de la tabla

DROP TABLE empleados; -- eliminación de la tabla
DROP TABLE IF EXISTS empleados; -- este se utiliza para que ya no aparecezca un mensaje de emergencia
DROP DATABASE tienda; -- eliminar base de datos
SHOW DATABASES; -- mostrar bases de datos

ALTER TABLE empleados DROP COLUMN tiempo_servicio, DROP COLUMN apellido; -- campos a eliminar
ALTER TABLE empleados CHANGE cargo cargo_em VARCHAR(30); -- cambiar el nombre de un campo
ALTER TABLE empleado MODIFY cargo_em VARCHAR(30); -- modificar la info de un campo
ALTER TABLE empleados ADD tiempo_servicio INT; -- agregar un campo a la tabla
ALTER TABLE empleados ADD apellido VARCHAR(30);
ALTER TABLE empleados ADD direccion VARCHAR(100) AFTER apellido; -- orden de los campos
ALTER TABLE empleados RENAME empleado; -- cambiar el nombre de la tabla
ALTER TABLE empleado ADD PRIMARY KEY(cedula); -- agregar primary key
DESCRIBE empleado;

INSERT INTO empleado (cedula, nombre, apellido, cargo_em, tiempo_servicio) VALUES
(20230556, 'Mario', 'Perez', 'Admin', 4); -- añadir info a la tabla
INSERT INTO empleado (cedula, nombre, apellido, cargo_em, tiempo_servicio) VALUES
(20267543, 'Estrella', 'Gutiérrez', 'Admin', 2);
describe empleado2;
INSERT INTO empleado2(cedula, nombre, apellido, cargo, tiempo_servicio) VALUES
(23457665, 'Helen', 'Zatarain', 'Auxiliar', '4'),
(76634527, 'Alondra', 'Alvarado', 'Vendedor', '5'),
(23457665, 'Emanuel', 'López', 'Gerente', '8');
SELECT * FROM empleado2; -- mostrar info de la tabla
SELECT cedula, nombre, apellido, cargo_em, tiempo_servicio FROM empleado; -- mostrar campos especificos de la tabla
SELECT nombre, apellido, cargo_em FROM empleado WHERE nombre='Estrella'; -- mostrar la info de los campos
SELECT nombre, apellido, cargo_em FROM empleado WHERE cedula='20267543';
SELECT nombre, apellido FROM empleado WHERE nombre<>'Mario'; -- mostrar un nombre diferente a 'Mario'
SELECT nombre, apellido FROM empleado WHERE tiempo_servicio>3; -- mostrar un tiempo de servicio mayor que (>) 3
SELECT nombre, apellido, tiempo_servicio FROM empleado WHERE tiempo_servicio<=10; 

DELETE FROM empleado; -- eliminar todos los empleados de la tabla
DELETE FROM empleado WHERE nombre='Mario'; -- eliminar un empleado en especifico
DESCRIBE empleado;
SELECT * FROM empleado;
UPDATE empleado SET tiempo_servicio=5; -- actualizar la info de un campo
UPDATE empleado SET tiempo_servicio=7 WHERE nombre='Estrella'; -- actualizar la info de un empleado
UPDATE empleado SET nombre='Ana', tiempo_servicio=9 WHERE nombre='Estrella'; -- actualizar campo por campo


INSERT INTO proveedores (nombre, direccion,pago) VALUES ('proveedor 1', 'Porlamar', 3000);
INSERT INTO proveedores (nombre, direccion, pago) VALUES ('proveedor 2', 'Insurgentes', 6000);
INSERT INTO proveedores (codigo, nombre, direccion, pago) VALUES ('12','proveedor 12', 'NULL', 10.98);
SELECT * FROM productos
SELECT * FROM proveedores;
INSERT INTO proveedores (codigo, nombre, direccion, pago) VALUES (6, 'proveedores 3', 'Caracas', 34.56);
INSERT INTO productos (codigo_provee, nombre, precio) VALUES 
(1, 'desktop', 3000), 
(1,'desktop', 4500), 
(2, 'laptop', 3000),
(3, 'laptop', 5000),
(4, 'teclado', 500),
(4,'mouse', 300),
(5, 'desktop', 5000),
(6, 'desktop', 3200),
(1, 'Monitor', 1000),
(7, 'Monitor', 2000),
(8, 'impresora', 3000),
(9, 'impresora', 5000);

CREATE TABLE productos (
codigo_p INT AUTO_INCREMENT, 
codigo_provee INT, 
nombre VARCHAR(40), 
precio FLOAT, 
disponible INT, 
PRIMARY KEY(codigo_p), 
FOREIGN KEY(codigo_provee) REFERENCES proveedores(codigo) ON DELETE CASCADE ON UPDATE CASCADE); -- 

ALTER TABLE productos DROP FOREIGN KEY productos_ibfk_1; -- id de la clave foranea
ALTER TABLE productos ADD FOREIGN KEY(codigo_provee) REFERENCES proveedores(codigo) ON DELETE CASCADE ON UPDATE CASCADE; -- agregar una llave foranea a una tabla ya existente
TRUNCATE TABLE proveedores; -- vacia la tabla, no la elimina

INSERT INTO proveedores (nombre, direccion, pago) VALUES 
('provee3', 'La Asuncion', NULL); -- NULL cuando desconocemos el valor
select * from proveedores WHERE pago IS NULL;
select * from proveedores WHERE pago=0;
SELECT * FROM proveedores WHERE direccion is NULL;
SELECT * FROM proveedores WHERE direccion='' '';
INSERT INTO proveedores (nombre, direccion, pago) VALUES 
('provee4', 'Maracaibo', 25.7);
INSERT INTO proveedores (direccion, pago) VALUES 
('Maracaibo', 25.7);
INSERT INTO proveedores (nombre, direccion) VALUES 
('provee10','Valencia');

CREATE TABLE proveedores2(
codigo INt UNSIGNED AUTO_INCREMENT,
nombre varchar(40) NOT NULL,
direccion varchar(50) DEFAULT 'Desconocido',
pago decimal(5,2) UNSIGNED DEFAULT 1.11,
PRIMARY KEY(codigo)
);
DESCRIBE proveedores;

CREATE TABLE ventas(
codigo INt(6) ZEROFILL AUTO_INCREMENT,
cod_empleado VARCHAR(40) NOT NULL,
cod_producto VARCHAR(30),
precio DECIMAL(5,2) UNSIGNED,
cantidad SMALLINT ZEROFILL,
fecha_hora DATETIME,
PRIMARY KEY(codigo)
);

SELECT codigo, fecha_hora, precio, cantidad FROM ventas; -- ver los campos especificados 
SELECT codigo, fecha_hora, precio ,cantidad, precio*cantidad FROM ventas;
SELECT ORD ('A'); -- ORD retoma el codigo ASCII para el caracter enviado como argumento
SELECT CHAR(65,66,67); -- CHAR etorna una cadena con los caracteres en codigo ASCII
SELECT concat ('Hola,',' ','como esta?'); -- CONCAT devuelve la cadena resultado
SELECT CONCAT_WS ('-','Juan','Pedro','Luis'); -- WS son las iniciales de WITH SEPARATOR. El primer argumento especifica el separador
SELECT FIND_IN_SET('hola','como esta,hola,buen dia'); -- FIND-IN-SET devulve un valor entre 0 a n (correspondiente a la posicion)
SELECT LENGTH('Hola'); -- LENGTH retorna la longitud de la cadena enviada como argumento
SELECT LOCATE('o','como le va'); -- LOCATE retorna la posicion de la primera ocurrencia 
SELECT LOCATE('ar','Margarita',1);
SELECT LOCATE('ar','Margarita',3);
SELECT POSITION ('o' IN 'como le va'); -- POSITION retorna 0 si la subcadena no se encuentra en la cadena
SELECT INSTR('como le va','om'); -- INSTR retorna la posición de la primera ocurrencia de la subcadena
SELECT LPAD('hola',10,'0'); -- LPAD retorna la cadena enviada como primer argumento
SELECT LEFT ('buenos dias',8); -- LEFT retorna la cantidad (longitud) de caracteres de la cadena
SELECT RIGHT('buenos dias',8);
SELECT SUBSTRING ('Buenas tardes',3,5);
SELECT SUBSTRING ('Margarita',4);
SELECT SUBSTRING ('Margarita' FROM 4);
SELECT SUBSTRING_INDEX ('margarita','ar',2);
SELECT MID('Buenas tardes' FROM 3 FOR 5);
SELECT SUBSTRING_INDEX ( 'margarita','ar',-2);
SELECT LTRIM(' Hola '); -- LTRIM retorna la cadena con los espacios de la izquierda eliminados
SELECT RTRIM(' Hola '); -- RTRIM retorna la cadena con los espacios de la derecha eliminados.
SELECT TRIM (' Hola '); -- retorna 'Hola'
SELECT TRIM (LEADING '0' FROM '00hola00'); -- retorna "hola00"
SELECT TRIM (TRAILING '0' FROM '00hola00'); -- retorna "00hola"
SELECT TRIM (BOTH '0' FROM '00hola00'); -- retorna "hola"
SELECT TRIM ('0' FROM '00hola00'); -- retorna "hola"
SELECT TRIM (' hola '); -- retorna "hola"
SELECT REPLACE('xxx.mysql.com','x','w'); -- retorna la cadena con todas las ocurrencias
-- SELECT REPEAT('hola',3);
SELECT REVERSE ('hola'); -- retorna "aloh"
SELECT INSERT ('buenas tardes',2,6,'xx');
SELECT LOWER('HoLa EstUdIANte');
SELECT LCASE ('hola ESTUDIANTE');
SELECT UPPER('hola estudiante');
SELECT UCASE('hola estudiante');
SELECT STRCMP('hola','chau');
SELECT 5/0;
SELECT ABS(-20);
SELECT CEILING(12.34);
SELECT FLOOR(12.34);
SELECT MOD(10,3);
SELECT MOD(10,2);
SELECT 10%3;
SELECT 10%2;
SELECT POWER(2,3);
SELECT ROUND(12.34);
SELECT ROUND(12.64);
SELECT TRUNCATE(123.4567,2);
SELECT TRUNCATE (123.4567,0);

SELECT DATE_ADD('2006-08-10', INTERVAL 1 MONTH);
SELECT DATE_ADD('2006-08-10', INTERVAL -1 DAY);
SELECT DATE_SUB('2006-08-10 18:55:44', INTERVAL 2 MINUTE);
SELECT DATE_SUB('2006-08-10 18:55:44', INTERVAL '2:3' MINUTE_SECOND);
SELECT DATEDIFF(fecha1, fecha2);
SELECT DAYNAME('2006-08-10');
SELECT DAYOFMONTH('2006-08-10');
SELECT DAYOFWEEK('2006-08-10');
SELECT EXTRACT(YEAR FROM '2006-10-10');
SELECT EXTRACT(YEAR_MONTH FROM '2006-10-10 10:15:25');
SELECT EXTRACT(DAY_MINUTE FROM '2006-10-10 10:15:25');
SELECT HOUR('18:25:09');
SELECT MONTHNAME('2006-08-10');
SELECT PERIOD_ADD(200608, 2);
SELECT PERIOD_DIFF(200608, 200602);
SELECT SEC_TO_TIME(90);
SELECT WEEKDAY('2006-08-10');
SELECT YEAR('2006-08-10');

SELECT codigo, nombre, direccion FROM proveedores ORDER BY nombre;
SELECT * FROM proveedores ORDER BY pago;
SELECT * FROM proveedores ORDER BY nombre DESC;
SELECT * FROM proveedores ORDER BY nombre, pago;
SELECT * FROM proveedores ORDER BY nombre ASC, direccion DESC;
SELECT * FROM proveedores WHERE (nombre='provee1') AND (pago<=3000);
SELECT * FROM proveedores WHERE nombre='provee2' OR direccion='Maracibo';
SELECT * FROM proveedores WHERE nombre='provee3' XOR (direccion='Porlamar');
SELECT * FROM proveedores WHERE NOT (direccion='Porlamar');
SELECT * FROM proveedores WHERE (nombre='provee1') OR (direccion='Maracaibo' AND
pago<3000);
SELECT * FROM proveedores WHERE (nombre='provee2' OR direccion='Valencia') AND
(pago<3000);
SELECT * FROM empleado WHERE tiempo_servicio>=5 AND tiempo_servicio<=9;
SELECT * FROM empleado WHERE tiempo_servicio BETWEEN 5 AND 9;
SELECT * FROM empleado WHERE nombre='Mario' OR nombre='Ana';
SELECT * FROM empleado WHERE nombre IN('Mario','Ana');
SELECT * FROM empleado WHERE nombre<>'Mario' AND nombre<>'Ana';
SELECT * FROM empleado WHERE nombre NOT IN ('Mario','Ana');
SELECT * FROM empleado WHERE nombre LIKE "%Mario%";
SELECT * FROM empleado WHERE nombre LIKE 'A%';
SELECT * FROM empleado WHERE nombre NOT LIKE 'A%';
SELECT * FROM empleado WHERE apellido LIKE "%Lope_";
SELECT * FROM proveedores WHERE direccion REGEXP 'Ma';
SELECT nombre FROM proveedores WHERE nombre REGEXP '[hkw]';
SELECT nombre FROM proveedores WHERE nombre NOT REGEXP '[hkw]';
SELECT nombre FROM proveedores WHERE nombre REGEXP '[a-d]';
SELECT * FROM proveedores WHERE nombre REGEXP '^A';
SELECT * FROM proveedores WHERE nombre REGEXP 'HP$';
SELECT * FROM proveedores WHERE direccion REGEXP 'a.e';
SELECT * FROM proveedores WHERE nombre REGEXP 'a..e';
SELECT * FROM proveedores WHERE nombre REGEXP '^......$';
SELECT * FROM proveedores WHERE nombre REGEXP '......';
SELECT * FROM proveedores WHERE direccion REGEXP 'a.*a';
SELECT COUNT(*) FROM productos;
SELECT COUNT(*) FROM productos WHERE codigo_provee=1;
SELECT COUNT(*) FROM productos WHERE nombre LIKE '%monitor%';
SELECT COUNT(precio) FROM productos;
SELECT SUM(disponible) FROM productos;
SELECT SUM(disponible) FROM productos WHERE codigo_provee ='4';
SELECT MAX(precio) FROM productos;
SELECT MIN(precio) FROM productos WHERE codigo_provee LIKE '%4%';
SELECT AVG(precio) FROM productos WHERE nombre LIKE '%monitor%';
SELECT COUNT(*) FROM productos WHERE codigo_provee=1;
SELECT COUNT(*) FROM productos WHERE codigo_provee=2;
SELECT COUNT(*) FROM productos WHERE codigo_provee=3;
SELECT nombre, COUNT(*) FROM productos GROUP BY codigo_provee;
SELECT direccion, SUM(pago) FROM proveedores GROUP BY direccion;
SELECT direccion, MAX(pago) FROM proveedores GROUP BY direccion;
SELECT direccion, MIN(pago) FROM proveedores GROUP BY direccion;
SELECT direccion, MIN(pago), MAX(pago) FROM proveedores GROUP BY direccion;
SELECT direccion, AVG(pago) FROM proveedores GROUP BY direccion;
SELECT nombre,direccion, COUNT(*) FROM proveedores GROUP BY nombre,direccion;
SELECT nombre, direccion, COUNT(*) FROM proveedores WHERE direccion<>'Porlamar' GROUP BY
direccion;
SELECT nombre, direccion, COUNT(*) FROM proveedores WHERE direccion<>'Porlamar' GROUP BY
direccion DESC;
SELECT nombre,direccion, COUNT(*) FROM proveedores GROUP BY nombre, direccion;
SELECT nombre, direccion, COUNT(*) FROM proveedores GROUP BY direccion HAVING pago>37.6;
SELECT nombre, AVG(precio) FROM productos GROUP BY codigo_provee;
SELECT nombre, AVG(precio) FROM productos GROUP BY codigo_provee HAVING AVG(precio)>25;
SELECT nombre, COUNT(*) FROM productos WHERE codigo_provee<>2 GROUP BY codigo_provee;
SELECT nombre, COUNT(*) FROM productos GROUP BY codigo_provee HAVING codigo_provee<>2;
SELECT nombre, COUNT(*) FROM producto WHERE precio is NOT NULL GROUP BY codigo_provee
HAVING codigo_provee<>3;
SELECT codigo_provee, AVG(precio) FROM productos GROUP BY codigo_provee HAVING
COUNT(cod_fabricante) >=2;
SELECT codigo_provee, MAX(precio) FROM productos GROUP BY codigo_provee HAVING
MAX(precio)>=30;
SELECT codigo_provee, MAX(precio) AS 'mayor' FROM productos GROUP BY codigo_provee HAVING
mayor>=30;
SELECT nombre FROM productos;
SELECT DISTINCT nombre FROM productos;
SELECT nombre FROM productos GROUP BY nombre;
SELECT DISTINCT nombre FROM productos WHERE nombre IS NOT NULL;
SELECT COUNT(DISTINCT nombre) FROM productos;
SELECT COUNT(nombre) FROM productos;
SELECT nombre FROM proveedores;
SELECT DISTINCT nombre FROM proveedores;
SELECT nombre, COUNT(DISTINCT nombre) FROM productos GROUP BY codigo_provee;
SELECT DISTINCT cargo_em FROM empleado ORDER BY cargo_em;
SELECT DISTINCT nombre, cargo_em FROM empleado ORDER BY nombre;
SELECT * FROM proveedores INNER JOIN productos ON
proveedores.codigo=productos.codigo_provee;
SELECT codigo, codigo_p FROM proveedores INNER JOIN productos ON
proveedores.codigo=productos.codigo_provee;
SELECT codigo, codigo_p FROM proveedores,productos WHERE
proveedores.codigo=productos.codigo_provee;
SELECT proveedores.nombre, productos.nombre FROM proveedores, productos WHERE
proveedores.codigo=productos.codigo_provee;
SELECT proveedores.nombre, COUNT( * ) FROM proveedores INNER JOIN productos ON
proveedores.codigo = productos.codigo_provee GROUP BY codigo_provee;
SELECT proveedores.nombre, COUNT( * ) FROM proveedores INNER JOIN productos ON
proveedores.codigo = productos.codigo_provee GROUP BY codigo_provee HAVING COUNT(*) >=2;
SELECT proveedores.nombre, COUNT( * ) FROM proveedores INNER JOIN productos ON
proveedores.codigo = productos.codigo_provee GROUP BY codigo_provee HAVING
proveedores.nombre <> 'provee1';
ALTER TABLE ventas ADD cod_provee INT;
ALTER TABLE ventas ADD FOREIGN KEY(cod_provee) REFERENCES proveedores(codigo) ON DELETE
CASCADE ON UPDATE CASCADE;
ALTER TABLE ventas ADD FOREIGN KEY(cod_producto) REFERENCES productos(codigo_p) ON DELETE
CASCADE ON UPDATE CASCADE;
ALTER TABLE ventas DROP COLUMN precio;
SELECT proveedores.nombre, productos.nombre, ventas.precio, ventas.cantidad,
ventas.fecha_hora, precio*cantidad AS 'Total a pagar'FROM proveedores INNER JOIN
productos ON proveedores.codigo=productos.codigo_provee INNER JOIN ventas ON
proveedores.codigo=ventas.cod_provee AND productos.codigo_p=ventas.cod_producto;