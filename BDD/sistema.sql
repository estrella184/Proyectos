create database sistema;
use sistema;
create table cotizacion(
    idCotizacion int primary key auto_increment,
    folio varchar (20),
    descripcion varchar(100),
    precio float,
    porcentaje int,
    plazos int,
    fecha date,
    status int default 0
    );
    describe cotizacion;
    drop table if exists cotizacion;
    insert into cotizacion values (null, "KDFIHF9S", "Auto nuevo", 200000, 30, 12, "2025-07-15", 0);
    
    update cotizacion set descripcion = "otro auto", precio = 250000, porcentaje = 35, plazos = 24, 
    fecha = "2025-07-15", status = 0
    where folio = "KDFIHF9S";
    select * from cotizacion;
    
    select * from cotizacion where status = 0 order by folio; -- los que están activos
    select * from cotizacion where status = 1 order by folio;
	update cotizacion set status = 1 where folio = "KDFIHF9S"; -- para actualizar 
	update cotizacion set status = 0 where folio = "KDFIHF9S";
    
    select * from cotizacion where folio = "KDFIHF9S" and status = 0;
    
    /* Consulta de resumen */
    select avg (precio) as precio from cotizacion where status = 0;
    
    select max(precio) as mayor from cotizacion where status = 0;
    
    select count(*) as activas from cotizacion where status = 0; -- el asterisco da resultados aunque no tenga datos
    
    select sum(precio) as total from cotizacion where status = 0;