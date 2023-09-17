use TiendaElectronica;

INSERT INTO Cargo (Cargo) VALUES
('Empleado'),
('Bodeguero'),
('Motorista'),
('Cajero'),
('Atencion al cliente');

select * from Cargo;

INSERT INTO Categorias (Nombres,Descripcion) VALUES 
('Audio', 'equipo de sonido'),
('Computacion','electronico'),
('Electronica' , 'piezas'),
('Instrumentos', 'todo tipo de instrumentos'),
('Repuesto','electrodomesticos');

INSERT INTO Clientes(Nombres, Apellidos,Email,DUI,Telefono,FechaNac,Direccion) VALUES
('Juan', 'Perez','juan@gmail.com','12345','12345','01-01-2000','sonsonate'),
('Gerson', 'Daniel','gerson@gmail.com', '12345','12435','01-01-2023','sonsonate'),
('Juana','Javier','juana@gmail.com','123455','65424','03-05-2002','sonsonate'),
('Ivan','Sanchez','ivan@gmail.com','821763','7623763','10-02-2001','sonsonate'),
('Tania','De avila','tania@gmail.com','38383','12376','10-02-2001','sonsonate');

INSERT INTO Empleados(Nombres, Apellidos,Email,DUI,Telefono,FechaNac,Direccion,CargoId) VALUES
('Luis', 'Perez','luis@gmail.com','12345','12345','01-01-2000','sonsonate',1),
('Maria', 'Daniel','maria@gmail.com', '12345','12435','01-01-2023','sonsonate',2),
('Josue','Javier','josue@gmail.com','123455','65424','03-05-2002','sonsonate',3),
('Melvin','Sanchez','melvin@gmail.com','821763','7623763','10-02-2001','sonsonate',4),
('Kevin','De avila','kevin@gmail.com','38383','12376','10-02-2001','sonsonate',5);

INSERT INTO Productos(Nombre, Descripcion,Precio,CategoriaID) VALUES
('Audifonos', 'Audio',5.00,1),
('Teclado', 'Electronico',8.50,2),
('Diodo','piezas',0.6,3),
('Trompeta','viento',75,4),
('Fuente de poder','licuadora',5.50,5);

INSERT INTO Factura(ClienteID, EmpleadoId,FechaFactura) VALUES
(1, 1,'10-02-2001'),
(1, 2,'10-02-2022'),
(1, 3,'10-02-2019'),
(1, 4,'10-02-2020');

select * from Factura;

INSERT INTO DetallesFactura(FacturaId, ProductoID,Cantidad,PrecioUnitario,Total) VALUES
(8,1,3,2.50,7.5),
(9,2,3,2.00,6.00),
(10,3,3,8.00,24.00),
(11,4,3,5.00,15.00),
(12,5,3,10.00,30.00);

--consulta para listar los clientes que han comprado y vendedor--
select c.Nombres, c.Apellidos, c.Email,c.FechaNac from clientes c 
inner join Factura r on r.ClienteID = c.ClienteID;

--consulta para conocer los cargos de los empleados--
select Nombres,
(select avg(ProductoID) from Productos where ProductoID = r.ProductoID) as Id_cargo
from Empleados h inner join Productos r on r.ProductoID = h.EmpleadoId;

-- consulta para conocer la descripcion y el ID de los productos desde el detalleFactura
select Descripcion,FacturaId FROM Productos
INNER JOIN DetallesFactura ON Productos.ProductoID = DetallesFactura.FacturaId;

-- consulta para conocer los productos y el cliente a quein se le vendio
SELECT *
FROM Productos
     INNER JOIN Factura 
ON Productos.ProductoID = Factura.FacturaId

-- consulta para conocer los clientes, cantidad de producto y el total
SELECT c.Nombres, p.Descripcion, d.Cantidad, d.Total FROM Clientes c 
INNER JOIN Productos p ON c.ClienteID = p.ProductoID
INNER JOIN DetallesFactura d ON p.ProductoID = d.DetalleID;
