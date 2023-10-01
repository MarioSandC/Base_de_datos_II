use TiendaElectronica


-- ROLES
go 
create role SysAdmin;
create role Vendedor;
create role RRHH;
create role Atencion_Al_Cliente;
create role Bodeguero;
create role Motorista;

--LOGINS
--ADMINISTRADOR
go 
create login login_admin_SYSAdmin
with password = 'root';
--VENDEDOR
go
create login login_ventas
with password = 'ventas_01';
--RRHH
go 
create login login_RRHH
with password = 'rrhh_01';
--ATENCION AL CLIENTE
go 
create login At_Cliente
with password = 'ATT_Cliente';
--BODEGUERO
go 
create login Bodega_login
with password = 'Store_user';
--MOTORISTA
go 
create login Motorista_login
with password = '1234';


---------------------------------------------------------------------------------------------------------
--USUARIOS

--ADMINISTRADOR
go
create user Administrator
for login login_admin_SYSAdmin;
--VENDEDOR
go
create user Ventas
for login login_ventas;
--RRHH
go 
create user user_RRHH
for login login_RRHH;
--ATENCION AL CLIENTE
go 
create user user_At_Cliente
for login At_Cliente;
--BODEGUERO
go 
create user user_Bodega
for login Bodega_login;
--MOTORISTA
go 
create user user_Motorista
for login Motorista_login;

-- OTORGAR PERMISOS
go
-- Administrador
grant control on database::TiendaElectronica to Administrator;
--Vendedor
grant select, update on dbo.Productos to Vendedor;
--RRHH
grant select, select, update on dbo.Empleados to RRHH;
grant select, delete, update on dbo.Cargo to RRHH;
--Atencion al cliente
grant select on dbo.Productos to Atencion_al_cliente;
grant update on dbo.Clientes to Atencion_al_cliente;
--Bodeguero
grant select, insert, delete on dbo.Productos to Bodeguero;
--Motorista
grant select on dbo.Productos to Motorista;

-- CONSULTAS
go
-- Consulta para obtener una lista de logins en la instancia de SQL Server
select name from sys.server_principals where type_desc = 'SQL_LOGIN';
go
-- Consulta para obtener una lista de usuarios en la instancia de SQL Server
select name from sys.database_principals where type_desc = 'SQL_USER';
go
-- Consulta para obtener una lista de roles en la instancia de SQL Server
select name from sys.database_principals where type_desc = 'DATABASE_ROLE';

