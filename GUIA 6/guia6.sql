USE TiendaElectronica

create procedure AgregarClientes
--Variables
	@NombresCliente varchar(60),
	@ApellidosCliente varchar(60),
	@Email varchar(60),
	@DUI varchar(10),
	@Telefono varchar(10),
	@FechaNac date,
	@Direccion varchar(50)
as 
begin
insert into Clientes values
	(@NombresCliente,
	@ApellidosCliente,
	@Email,
	@DUI,
	@Telefono,
	@FechaNac,
	@Direccion);

	select * from Clientes;
end

execute AgregarClientes
	@NombresCliente = 'Raul Alejandro',
	@ApellidosCliente = 'Rojas Tejada',
	@Email = 'raul@gmail.com',
	@DUI = '1234556-9',
	@Telefono = '1234555',
	@FechaNac = '01-01-2005',
	@Direccion = 'Sonsonate'


Create Procedure MostrarClienteConCargo
as
begin
	Select EMP.DUI, EMP.Nombres, EMP.Apellidos, CAR.Cargo
	from Empleados EMP, Cargo CAR
	where CAR.CargoId = EMP.CargoId
	order by EMP.CargoId
end

exec MostrarClienteConCargo