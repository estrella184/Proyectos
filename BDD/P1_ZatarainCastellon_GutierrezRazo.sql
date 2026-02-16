create database departamento;
use departamento;

CREATE TABLE Proveedores(
IdProveedor CHAR(5) PRIMARY KEY NOT NULL, 
Nombre VARCHAR(30), 
Direccion VARCHAR(40), 
Correo VARCHAR(40), 
RFC VARCHAR(20), 
Telefono VARCHAR(15) 
) ENGINE=InnoDB; 
 
CREATE TABLE Departamentos(
IdDepartamento CHAR(5) PRIMARY KEY NOT NULL, 
NombreD VARCHAR(20), 
Sueldo FLOAT
) ENGINE=InnoDB;
 
CREATE TABLE Clientes (
IdCliente CHAR(5) PRIMARY KEY NOT NULL, 
Nombre VARCHAR(20), 
Direccion VARCHAR(40), 
Correo VARCHAR(40), 
RFC VARCHAR(40), 
Telefono VARCHAR(15) 
) ENGINE=InnoDB;
 
CREATE TABLE Facturas (
IdFactura CHAR(5) PRIMARY KEY NOT NULL,
Fecha DATE, 
IdCliente CHAR(5),
FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente) 
) ENGINE=InnoDB; 
 
CREATE TABLE Productos ( 
IdProductos CHAR(5) PRIMARY KEY NOT NULL,
Nombre VARCHAR(20),
Descripcion VARCHAR(50), 
Existencia INT, 
Precio FLOAT, 
IdProveedor CHAR(5), 
FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor) 
) ENGINE=InnoDB; 
 
CREATE TABLE Registro (
IdRegistro CHAR(5) PRIMARY KEY NOT NULL,
IdFactura CHAR(5),
IdProducto CHAR(5), 
FOREIGN KEY (IdFactura) REFERENCES Facturas(IdFactura), FOREIGN KEY (IdProducto) REFERENCES Productos(IdProductos) 
) ENGINE=InnoDB;  
CREATE TABLE Empleados (
IdEmpleado CHAR(5) PRIMARY KEY NOT NULL, 
Nombre VARCHAR(20), 
FechaContrato DATE, 
Direccion VARCHAR(40),
Correo VARCHAR(40), 
NumSS VARCHAR(30), 
Telefono VARCHAR(15), 
IdDepartamento CHAR(5),
FOREIGN KEY (IdDepartamento) REFERENCES Departamentos(IdDepartamento) 
) ENGINE=InnoDB; 
 
INSERT INTO Proveedores VALUES 
('P001','Proveedor Uno','Los Robles','uno@mail.com','RFC001','1111111111'),
('P002','Proveedor Dos','Guadalajara','dos@mail.com','RFC002','2222222222');
 
INSERT INTO Departamentos VALUES 
('D001','Ventas',8000),
('D002','Almacén',6000);
 
INSERT INTO Clientes VALUES 
('C123','Ana López','CDMX','ana@mail.com','RFC123','9999999999'), 
('C999','Pedro Ruiz','Monterrey','pedro@mail.com','RFC999','8888888888'); 
 
INSERT INTO Facturas VALUES 
('F006','2025-01-10','C124'), 
('F004','2025-02-10','C125'), 
('F003','2025-01-01','C126'), 
('F002','2024-12-20','C127'); 
 
INSERT INTO Productos VALUES 
('P001','Tostadas','Caja de Tostadas',5,120.00,'P001'), 
('P002','Galletas','Paquete Galletas',0,50.00,'P002'); 
 
INSERT INTO Empleados VALUES 
('E001','Juan Pérez','2023-01-10','CDMX','juan@mail.com','SS001','7777777777','D001'),
('E002','María Torres','2022-03-15','CDMX','maria@mail.com','SS002','6666666666','D002'); 
 
INSERT INTO Registro VALUES 
('R001','F001','P001'), ('R002','F002','P001'); 
 
select * from productos; 
select * from clientes; 
select * from productos where existencia < 10; 
select * from Facturas where fecha > "2025-01-01";
select * from Empleados where IdDepartamento = "D001"; 
select * from Proveedores where direccion = "Los Robles"; 
 
update Clientes set telefono = "6693195648" where IdCliente="C123";
update Departamentos set sueldo = 8000 where IdDepartamento = "A001";
update Productos set precio = 150 where IdProductos = "P001";
delete from Clientes where IdCliente = "C999";
delete from Productos where existencia = 0; 
show tables;

CREATE TABLE TelefonosEmp (
    IdTelefono CHAR(5) PRIMARY KEY,
    IdEmpleado CHAR(5),
    Telefono VARCHAR(15),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleados(IdEmpleado)
) ENGINE=InnoDB;

CREATE TABLE CorreosEmp (
    IdCorreo CHAR(5) PRIMARY KEY,
    IdEmpleado CHAR(5),
    Correo VARCHAR(40),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleados(IdEmpleado)
) ENGINE=InnoDB;

DELIMITER //
-- 1. Alta Clientes
CREATE PROCEDURE AltaCliente(
    IN p_IdCliente CHAR(5),
    IN p_Nombre VARCHAR(20),
    IN p_Direccion VARCHAR(40),
    IN p_Correo VARCHAR(40),
    IN p_RFC VARCHAR(40),
    IN p_Telefono VARCHAR(15)
)
BEGIN
    INSERT INTO Clientes
    VALUES(p_IdCliente, p_Nombre, p_Direccion, p_Correo, p_RFC, p_Telefono);
END //

-- 2. Alta TelefonosEmp
CREATE PROCEDURE AltaTelefonoEmp(
    IN p_IdTelefono CHAR(5),
    IN p_IdEmpleado CHAR(5),
    IN p_Telefono VARCHAR(15)
)
BEGIN
    INSERT INTO TelefonosEmp
    VALUES(p_IdTelefono, p_IdEmpleado, p_Telefono);
END //

-- 3. Alta CorreosEmp
CREATE PROCEDURE AltaCorreoEmp(
    IN p_IdCorreo CHAR(5),
    IN p_IdEmpleado CHAR(5),
    IN p_Correo VARCHAR(40)
)
BEGIN
    INSERT INTO CorreosEmp
    VALUES(p_IdCorreo, p_IdEmpleado, p_Correo);
END //

-- 4. Modificar existencia de producto
CREATE PROCEDURE ModificarExistencia(
    IN p_IdProducto CHAR(5),
    IN p_NuevaExistencia INT
)
BEGIN
    UPDATE Productos
    SET Existencia = p_NuevaExistencia
    WHERE IdProducto = p_IdProducto;
END //

-- 5. Mostrar todos los productos
CREATE PROCEDURE MostrarProductos()
BEGIN
    SELECT * FROM Productos;
END //

-- 6. Empleados y sus teléfonos
CREATE PROCEDURE EmpleadosConTelefonos()
BEGIN
    SELECT e.IdEmpleado, e.Nombre, t.Telefono
    FROM Empleados e
    JOIN TelefonosEmp t ON e.IdEmpleado = t.IdEmpleado;
END //

-- 7. Empleados y sus sueldos
CREATE PROCEDURE EmpleadosConSueldos()
BEGIN
    SELECT e.IdEmpleado, e.Nombre, d.Sueldo
    FROM Empleados e
    JOIN Departamentos d 
    ON e.IdDepartamento = d.IdDepartamento;
END //

-- 8. Buscar factura por ID
CREATE PROCEDURE BuscarFactura(
    IN p_IdFactura CHAR(5)
)
BEGIN
    SELECT * FROM Facturas
    WHERE IdFactura = p_IdFactura;
END //

-- 9. Alta Productos
CREATE PROCEDURE AltaProducto(
    IN p_IdProducto CHAR(5),
    IN p_Nombre VARCHAR(20),
    IN p_Descripcion VARCHAR(50),
    IN p_Existencia INT,
    IN p_Precio FLOAT,
    IN p_IdProveedor CHAR(5)
)
BEGIN
    INSERT INTO Productos
    VALUES(p_IdProducto, p_Nombre, p_Descripcion, 
           p_Existencia, p_Precio, p_IdProveedor);
END //
DELIMITER ;
 
-- prueba
CALL AltaCliente('C777','Mario Luna','CDMX','mario@mail.com','RFC777','5512345678');
CALL AltaTelefonoEmp('T001','E001','5555555555');
CALL AltaCorreoEmp('CO01','E001','nuevo@mail.com');
CALL ModificarExistencia('P001', 50);
CALL MostrarProductos();
CALL EmpleadosConTelefonos();
CALL EmpleadosConSueldos();
CALL BuscarFactura('F001');
CALL AltaProducto('P010','Refresco','Botella 2L',30,25.50,'PR01');