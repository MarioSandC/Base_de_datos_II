-- Secuencia para llave primaria
create sequence Id_detallefactura
	start with 1
	increment by 1
	minvalue 1
	maxvalue 1000

-- Tabla de reporte de detalle facturas
create table ReporteDetalleFactura(
	Id_detallefactura int primary key, -- Sin identity
	DetalleID int,
	FacturaId int,
	ProductoID int, 
	Cantidad int,
	PrecioUnitario decimal,
	Total decimal
);