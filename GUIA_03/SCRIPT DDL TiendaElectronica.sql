create database TiendaElectronica;

use TiendaElectronica;

-- Tabla de Categorías
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY identity(1, 1),
    Nombres VARCHAR(50) NOT NULL,
    Descripcion varchar(100)
);

-- Tabla de Productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY identity(1, 1),
    Nombre VARCHAR(100) NOT NULL,
    Descripcion varchar(100),
    Precio DECIMAL(8, 2) NOT NULL,
    CategoriaID INT,
);

alter table Productos add foreign key(CategoriaID) references Categorias(CategoriaID);

-- Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY identity(1, 1),
    Nombres VARCHAR(50) NOT NULL,
	Apellidos varchar(50) NOT NULL,
    Email VARCHAR(255) NOT NULL,
	DUI varchar(10) not null,
    Telefono VARCHAR(12),
	FechaNac date not null,
    Direccion VARCHAR(100) NOT NULL
);

-- Tabla de Cargo
CREATE TABLE Cargo (
    CargoId INT PRIMARY KEY identity(1, 1),
    Cargo VARCHAR(50) NOT NULL,
);

-- Tabla de Empleados
CREATE TABLE Empleados (
    EmpleadoId INT PRIMARY KEY identity(1, 1),
    Nombres VARCHAR(50) NOT NULL,
	Apellidos varchar(50) NOT NULL,
    Email VARCHAR(255) NOT NULL,
	DUI varchar(10) not null,
    Telefono VARCHAR(12),
	FechaNac date not null,
    Direccion VARCHAR(100) NOT NULL,
	CargoId int,
);

alter table Empleados add foreign key(CargoID) references Cargo(CargoID);


-- Tabla de Pedidos
CREATE TABLE Factura (
    FacturaId INT PRIMARY KEY identity(1, 1),
    ClienteID INT,
	EmpleadoId int,
    FechaFactura DATE NOT NULL,
);

alter table Factura add foreign key(ClienteID) references Clientes(ClienteID);
alter table Factura add foreign key(EmpleadoId) references Empleados(EmpleadoId);

-- Tabla de Detalles de Pedidos
CREATE TABLE DetallesFactura(
    DetalleID INT PRIMARY KEY identity(1, 1),
    FacturaId INT,
    ProductoID INT,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(8, 2) NOT NULL,
	Total decimal(8,2) not null
);

alter table DetallesFactura add foreign key(FacturaId) references Factura(FacturaId);
alter table DetallesFactura add foreign key(ProductoID) references Productos(ProductoID);

create table Usuario(
Id_usuario int primary key not null identity(1,1),
Id_empleado int not null,
Id_rol int not null,
Usuario varchar(50) not null,
Clave varchar(50) not null)

ALTER TABLE Usuario
ADD FOREIGN KEY(Id_empleado) REFERENCES Empleados(EmpleadoId)

ALTER TABLE Usuario
ADD FOREIGN KEY(Id_rol) REFERENCES Roles(Id_Rol)


create table Roles(
Id_Rol int not null primary key identity(1,1),
NombreRol varchar(50) not null
)


create table AsignacionRolesOpciones(
ID_AsignacionRol int not null primary key identity(1,1),
ID_Rol int not null,
ID_Opcion int not null
)

ALTER TABLE AsignacionRolesOpciones
ADD FOREIGN KEY(Id_Rol) REFERENCES Roles(Id_Rol)

ALTER TABLE AsignacionRolesOpciones
ADD FOREIGN KEY(ID_Opcion) REFERENCES Opciones(ID_Opcion)

create table Opciones(
ID_Opcion int not null primary key identity(1,1),
NombreOpcion varchar(50)not null,
)

insert into Cargo VALUES ('RRHH');

select * from Cargo