show databases;
use prueba_estrella;
show tables;
select * from gente;
insert into gente values("Martin","2006-12-28");
select * from ciudad5;
select * from ciudad5 where nombre="cancun";
select clave,poblacion from ciudad5 where poblacion>=24444  and poblacion<= 700000;
select * from gente;
select nmbre,fecha from gente where fecha="2006-12-28";
select * from gente where nmbre="Estrella";
select fecha from gente;
select distinct fecha from gente;

select current_time() as horaActual; -- hora actual del sistema
select current_date() as fechaActual; -- la fecha actual del sistema
select current_timestamp(); -- fecha y hora del sistema
select current_user(); -- usuario y servidor al que estamos conectados actualmente
select now();

select datediff("2025-07-08","2006-04-02")/365;
select * from gente;
select nmbre,fecha, datediff (current_date(),fecha)/365 as edad from gente;
select 5*7 as Multiplicacion, 9+4 as Suma, 5-2 as Resta, 9%2 as Residuo, 6/2 as Division;
select datediff("2022-02-22", "2019-06-05")/365 as fecha;
select sin(3.1416/2), 3+5, 7*4;
select abs(-5) as ValorAbsoluto; -- Valor absoluto
select floor(3.1416); -- redondea el valor
select round(3.1416,2) as LimiteDecimal; -- solo nos muestra dos decimales
select power(5,2); -- eleva a una potencia;

select * from gente where nmbre ="Estrella";
select * from alumno;
select * from alumnos where matricula="240303303";
select nombre, apellido, grupo from alumnos where matricula="224444";
select fecha from gente group by fecha;
select fecha from gente order by fecha ASC;
select fecha from gente order by fecha DESC;
use practica;
select * from estaciones;
select * from muestras where idestaciones=1;
select * from muestras where idestacion=2;
