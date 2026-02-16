-- MARTES 17 DE JUNIO DE 2025
show databases; -- este comando me permite ver las BD creadas
create database prueba_estrella; -- crear la BD
use prueba_estrella; -- meternos a la BD con las que vasmoa trabajar
create table pruebas(prueba varchar(40), fecha date); -- crear tablas
show tables; -- mostrar tablas
describe pruebas; -- mostrar los campos y valores de las tablas
create table pruebas2(mascotas varchar(40), fecha date, edad int, nombre varchar(40), apellido varchar(40));
describe pruebas2;


-- JUEVES 26 DE JUNIO DE 2025
show databases;
use prueba_estrella; -- para meternos a la tabla
show tables;
describe pruebas2; -- mostrar los atributos de las tablas
-- ejercicio clase
create table gente(nmbre varchar(40), fecha date);
describe gente;

create table ciudad1 (nombre char(20) not null, poblacion int null); -- NOT NULL no acepta datos nulos, NULL lo toma por dafault
show tables;
describe ciudad1;

create table ciudad2 (nombre char(20) not null, poblacion int null default 5000); -- DEFAULT un valor por defecto
show tables;
describe ciudad2;
-- drop table ciudad1; -- sirve para borrar tabla

create table ciudad3(nombre char(20) not null primary key, poblacion int null default 5000);
show tables;
describe ciudad3;

create table ciudad5(clave int auto_increment primary key, nombre char(20) not null, poblacion int null default 5000); -- AUTO_INCREMENT es para no tener que especificar los espacios
describe ciudad5;

create table ciudad6(clave int auto_increment primary key comment "Clave Principal", nombre char(50) not null, poblacion int null default 5000); -- comment es para comentar
describe ciudad6;

create table ciudad4(nombre char(40) not null, poblacion int null default 5000, primary key (nombre)); -- primary key y entre parentesis el campo al que queremos hacer como la llave primaria
describe ciudad4;

-- INDEX y KEY son igual pero son dos maneras distinas de ponerse
create table mitabla2(id int, nombre char(19), index (nombre)); -- es un campo indice, permite buscar de una forma mas agil por ese campo
create table mitabla3(id int, nombre char(19), key (nombre));
describe mitabla2;
describe mitabla3;

create table mitabla5(id int, nombre char(19), unique(nombre)); -- UNIQUE: indice unico. Es decir, si yo quiero poner otro no me va adejar porque ya existe
describe mitabla5;

create table personas(id int auto_increment primary key, nombre varchar(40), fecha date);
create table telefonos(numero char(12), id int not null references personas (id) on delete cascade on update cascade); -- REFERENCES: es para la tabla a la que quiero hacer relacion. ON DELETE CASCADE...: es para que las modificaciones que hagamos se guarden en las dos tablas
describe personas;


-- MARTES 1 DE JULIO DE 2025
show databases;
describe personas;
use prueba_estrella;
show tables;

create table personas2(id int auto_increment primary key, nombre varchar(40), fecha date) engine=InnoDB;
create table telefonos2(numero char(12), id int not null, key(id), foreign key (id) references personas2(id) on delete cascade on update cascade) engine=InnoDB;
show tables;
describe telefonos2;
describe personas2;
show tables;
describe gente;
insert into gente values ("Carlos", '1974-04-12'); -- INSERT INTO: insertar datos en las tablas
describe gente; -- DESCRIBE solo es para consultar los datos de mi tabla
select * from gente; -- para mostrar los datos de la tabla
insert into gente values ("Estrella", '2006-12-28');
select * from gente;
insert into gente values ("Helen", '2006-03-16'), ("Alondra", '2005-01-28'), ("Joshua", '2006-09-24'); -- AÑO/MES/DIA para que agarre la fecha
select * from gente;
describe ciudad2;
insert into ciudad2 values ("Mazatlan", default);
insert into ciudad2 values ("Villa", 700000); -- el valor no va en comillas porque es numerico
insert into ciudad2 values ("Culiacan", 20000);
select * from ciudad2;
select * from ciudad2;

describe ciudad5;
insert into ciudad5 (poblacion, nombre) values 
(700000, 'Merida'), (9000000, 'Puebla'), (24444, 'cancun');
select * from ciudad5;

insert into ciudad5 set nombre="La Paz", poblacion=800000; -- intercambia el valor del VALUES, solo que el SET va a exponiendo valor por valor
select * from ciudad5;
replace into ciudad5(nombre, poblacion) values ("Cancún", 3000000);
describe mitabla5;
insert into mitabla5 (id, nombre) values (1, 'Carlos'),
(2, 'Felipe'),
(3, 'Antonio'),
(4, 'Estrella'),
(5, 'Juan');
select * from mitabla5;
describe ciudad3;
insert into ciudad3 (poblacion, nombre)
values (80000, "Mazatlan"); 
insert into ciudad3(poblacion, nombre)
values (90000, "Guadalajara"),
(75000, "Mazatlan") on duplicate key update poblacion = values (poblacion);-- ON DUPLICATE...:si se encuentra un dato duplicado lo actualiza automaticamente

replace into ciudad3(nombre, poblacion) values
('Madrid', 7204000),
('Guadalajara', 200000),
('Berlin', 630304);
select * from ciudad3;
update ciudad3 set poblacion = poblacion * 1.10; -- actualizar
update ciudad3 set poblacion = poblacion * 5.6 where nombre = 'Berlin';
use prueba_estrella;
delete from ciudad3; -- Eliminar los datos
delete from ciudad3 where nombre ="Berlin";

replace into ciudad3 (nombre, poblacion) values
('Malpica', 50000), ('Mazatlan', 4000), ('Berlin', 50000);
select * from ciudad3;