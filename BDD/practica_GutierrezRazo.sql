create database biblioteca;
use biblioteca;

create table if not exists Editoriales(
	id_editorial char (4) primary key not null,
    nombre varchar (50),
    direccion varchar (70),
    codigo_postal int,
    ciudad varchar(70),
    pais varchar (70),
    telefono varchar(20),
    fax varchar (60),
    correo varchar (60),
    direccion_web varchar(60)
)engine=InnoDB;

create table if not exists Autores(
	codigo_autor char (4) primary key not null,
	nombre varchar (50),
    apellidos varchar (50),
    nacionalidad varchar (20)
) engine=InnoDB;

create table if not exists Socios(
	codigo_socio char (4) primary key not null,
	DNI varchar (20) unique,
	Nombre varchar (20),
    apellidos varchar (50),
    domicilio varchar (50),
    codigo_postal int,
    ciudad varchar (50),
    telefono varchar (20),
    fecha_nacimiento date
)engine=InnoDB;

create table if not exists Temas(
	codigo_tema char(4) primary key not null,
	nombre_completo varchar (40),
	descripcion varchar (100)
)Engine=InnoDB;

create table if not exists Libros(
	codigo_libro char (4) primary key not null,
	id_editorial char  (4) not null,
	codigo_tema char (4)not null,
	titulo varchar (30) not null,
	ISBN varchar (20) not null,
	deposito_legal varchar (40) not null,
    idioma varchar (15),
    ano_edicion year,
    numero_paginas int,
    foreign key (id_editorial) references Editoriales(id_editorial) on delete cascade on update cascade,
	foreign key (codigo_tema) references Temas(codigo_tema) on delete cascade on update cascade
)Engine=InnoDB;

create table if not exists Ejemplares(
	codigo_ejemplar int auto_increment primary key,
	codigo_libro char (4) not null,
	numero_ejemplar int,
	foreign key (codigo_libro) references Libros(codigo_libro) on delete cascade on update cascade
)Engine=InnoDB;

create table if not exists prestamos(
	codigo_prestamo int auto_increment primary key,
    fecha_prestamo date not null,
    fecha_devolucion date,
    codigo_socio char (4) not null,
    codigo_ejemplar int not null,
    foreign key (codigo_socio) references Socios(codigo_socio) on delete cascade on update cascade,
	foreign key (codigo_ejemplar) references Ejemplares(codigo_ejemplar) on delete cascade on update cascade
    )Engine=InnoDB;
    
create table if not exists LibrosAutores(
		codigo int auto_increment primary key,
        codigo_Autor char (4),
        codigo_Libro char (4),
        foreign key (codigo_autor) references Autores(codigo_autor) on delete cascade on update cascade,
        foreign key (codigo_libro) references Libros (codigo_libro) on delete cascade on update cascade
    )Engine=InnoDB;

INSERT INTO Editoriales VALUES
('E001','Alfa Editorial','Av. Central 123',28001,'Madrid','España','910000001','910000002','contacto@alfa.com','www.alfa.com'),
('E002','Beta Libros','Calle Norte 45',08001,'Barcelona','España','930000001','930000002','info@beta.com','www.beta.com'),
('E003','Gamma Press','Av. Reforma 200',11000,'CDMX','México','550000001','550000002','ventas@gamma.com','www.gamma.com');

INSERT INTO Autores VALUES
('V111','Juan','Pérez','Española'),
('V112','Ana','Gómez','Mexicana'),
('V113','Alonso','López','Argentina'),
('V114','Genesis','Torres','Española');

INSERT INTO Autores VALUES
('V115','Alejandra','Garcia','Venezolana');

INSERT INTO Socios VALUES
('S001','12345678A','Alfonso','Ramírez','Calle Sol 10',28001,'Madrid','600111111','1998-05-10'),
('S002','87654321B','Ana Maria','Betancourt','Av. Luna 22',08001,'Barcelona','600222222','2000-08-15'),
('S003','11223344C','Marco','Sánchez','Calle Norte 9',28001,'Madrid','600333333','1995-03-20'),
('S004','99887766D','Victoria','Martínez','Av. Sur 45',11000,'CDMX','600444444','2002-11-01'),
('S005','55443322E','Luis','Gutierrez','Calle Centro 3',28001,'Madrid','600555555','1999-01-30'),
('S006','66778899F','Malena','Chavez','Av. Este 18',08001,'Barcelona','600666666','1997-07-07');

INSERT INTO Temas VALUES
('A001','Ciencias Naturales','Libros sobre la Ciencia y Naturaleza'),
('A002','Matematicas','Libros de Matematicas Avanzadas'),
('A003','Redes','Libros sobre redes informáticas'),
('A004','Ingles','Libros del Idioma Ingles');

INSERT INTO Libros VALUES
('L001','E001','A001','Introducción a las Ciencias','ISBN001','DL001','Español',2023,250),
('L002','E002','A002','Matematicas en Ingeniería','ISBN002','DL002','Español',2022,400),
('L003','E001','A003','Redes Básicas','ISBN003','DL003','Español',2023,320),
('L004','E003','A004','Idiomas en el Mundo','ISBN004','DL004','Español',2021,280);

INSERT INTO Ejemplares (codigo_libro, numero_ejemplar) VALUES
('L001',1),('L001',2),('L002',1),('L002',2),('L002',3),('L003',1),('L003',2),('L004',1);

INSERT INTO prestamos (fecha_prestamo, fecha_devolucion, codigo_socio, codigo_ejemplar) VALUES
('2025-01-10','2025-01-20','S001',1),
('2025-01-12',NULL,'S003',3),
('2025-01-15','2025-01-25','S002',4);

INSERT INTO LibrosAutores (codigo_autor, codigo_libro) VALUES
('V111','L001'),('V112','L003'),('V113','L002'),('V114','L004'),('V115','L003');

describe LibrosAutores;
SELECT * FROM Temas;

-- CONSULTAS --

-- select * from Autores;
-- select * from Libros where ano_edicion=2023;
-- select * from Socios where ciudad='Madrid';
-- select titulo from Libros order by titulo ASC;
-- select * from Socios order by codigo_socio desc limit 5;
-- select L.titulo, E.nombre as editorial from Libros L inner join Editoriales E on L.id_editorial = E.id_editorial;
-- select L.titulo, COUNT(EJ.codigo_ejemplar) as total_ejemplares from Libros L inner join Ejemplares EJ on L.codigo_libro = EJ.codigo_libro group by L.titulo;
-- select * from Libros where titulo like '%SQL%';
-- update Editoriales set telefono = '911234567' where id_editorial = 'E001';
-- delete from Temas where codigo_tema = 'A004';

describe prestamos;
select * from Autores;
select * from Libros;

insert into Editoriales values 
("E004","Planeta","Av. Insurgentes", "80065", "Cartagena", "Colombia", "7869465786", "768403756","planeta@gmail.com","www.planeta.com");

insert into prestamos values 
("7","2025-01-15","2025-01-22","S004","2"),
("5","2025-01-04","2025-02-12","S005","5"),
("6","2025-02-13","2025-02-15","S006","6");

update Editoriales set ciudad="Madrid" where id_editorial="E002";

update Autores set nombre="Alexis" where codigo_autor="V113";

update Socios set codigo_postal="28675" where codigo_socio="S001";
update Socios set codigo_postal="78965" where codigo_socio="S002";
update Socios set codigo_postal="35472" where codigo_socio="S003";
update Socios set codigo_postal="47684" where codigo_socio="S004";
update Socios set codigo_postal="86740" where codigo_socio="S005";

select * from Autores,Libros where nombre="Ana";

select * from Libros where ano_edicion=2022;
select * from Libros;
select * from Libros where titulo like "%code%";

select * from Socios;
select * from Socios limit 2;



