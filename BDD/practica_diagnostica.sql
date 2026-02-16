create database escuela;
use escuela;

-- 1. crear tablas
create table estudiante (codigoEstudiante int auto_increment primary key,
nombre varchar(20), correo varchar(30), fechaNacimiento DATE);
describe estudiante;

create table docente (IdDocente int auto_increment primary key,
nombre varchar(20), especialidad varchar(30), correo varchar(20));

show tables;

create table curso (codigoCurso int auto_increment primary key,
nombre varchar(20), creditos int(15), IdDocente int, foreign key (IdDocente) references docente(IdDocente));

create table inscripcion (IdInscripcion int auto_increment primary key,
fecha DATE, nota int(10), codigoEstudiante int, foreign key (codigoEstudiante) references estudiante(codigoEstudiante), 
codigoCurso int, foreign key (codigoCurso) references curso(codigoCurso));

insert into estudiante(nombre,correo,fechaNacimiento) values
("Estrella", "estrella@gmail.com", "2006/12/28"),
("Helen", "helen@gmail.com", "2006/03/16");
select * from estudiante;

insert into docente(nombre,especialidad,correo) values
("Jorge", "Programacion", "jorge@gmail.com"),
("Isabel", "Redes", "isabel@gmail.com");
select * from docente;

insert into curso(nombre,creditos,IdDocente) values
("Programacion", 4, 1),
("Redes", 5, 2);
select * from curso;

insert into inscripcion(codigoEstudiante, codigoCurso, fecha, nota) values
(1, 2, "2024-01-10", 9.5),
(1, 1, "2024-01-11", 8.2),
(2, 1, "2024-01-12", 8.7);
select * from inscripcion;

-- 2. mostrar nombre y correo de los estudiantes inscritos en un curso determinado
-- select e.nombre, e.correo from estudiante e
-- join inscripcion i on e.codigoEstudiante = i.codigoEstudiante
-- join curso c on i.codigoCurso = c.codigoCurso
-- where c.nombre = 'Programacion';

-- 3. listar los cursos dictados por un docente, mostrando nombre y créditos
-- select c.nombre, c.creditos from curso c
-- join docente d on c.IdDocente = d.IdDocente
-- where d.nombre = 'Jorge';

-- 4. Obtener el promedio de notas por cada curso
-- select c.nombre as curso, AVG(i.nota) as promedio
-- from curso c
-- join inscripcion i on c.codigoCurso = i.codigoCurso
-- group by c.nombre;

-- 5. mostrar estudiantes inscritos en mas de un curso
-- select e.nombre from estudiante e
-- join inscripcion i ON e.codigoEstudiante = i.codigoEstudiante
-- group by e.codigoEstudiante
-- having COUNT(i.codigoCurso) > 1;

-- 6. listar estudiante, curso y nota final de quienes tengan nota mayor a 9
-- select e.nombre as estudiante, c.nombre as curso, i.nota from inscripcion i
-- join estudiante e on i.codigoEstudiante = e.codigoEstudiante
-- join curso c on i.codigoCurso = c.codigoCurso
-- where i.nota >= 9;

