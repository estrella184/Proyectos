show databases;
create database practica_estrella;
use practica_estrella;

-- TABLA ESTACION
create table estacion(Identificador mediumint unsigned primary key, 
Latitud varchar(40), 
Longitud varchar(40), 
Altitud varchar(40));
describe estacion;
insert into estacion values(1, '23.2494', '-106.4111', '10'),
(2, '19.4326', '-99.1332', '2240'),
(3, '25.2495', '-99.1453', '2220');
select * from estacion;

-- TABLA MUESTRAS
create table muestras(identificador_estacion mediumint unsigned,fecha date,temperatura_minima tinyint,temperatura_maxima tinyint,precipitaciones tinyint,humedad_minima smallint unsigned,humedad_maxima smallint unsigned,VientoMinima tinyint unsigned,VientoMaxima smallint unsigned);
describe muestras;
insert into muestras values
(1, '2025-06-02', 25, 34, 12, 50, 90, 7, 22),
(2, '2025-06-03', 15, 27, 20, 42, 80, 5, 17);
select * from muestras;
select * from muestras where identificador_estacion = 1;
select * from muestras where temperatura_maxima > 30;
select identificador, latitud, longitud from estacion;

show databases;
use practica_estrella;
show tables;
describe estacion;
select * from estacion;
describe muestras;
select * from muestras;