use TiendaElectronica

CREATE ROLE SysAdmin;
--EMPLEADOS
GRANT SELECT ON Empleados TO SysAdmin;
GRANT INSERT ON Empleados TO SysAdmin;
GRANT DELETE ON Empleados TO SysAdmin;
GRANT UPDATE ON Empleados TO SysAdmin;
--CARGOS
GRANT select ON Cargo TO SysAdmin;
GRANT INSERT ON Cargo TO SysAdmin;
GRANT delete ON Cargo TO SysAdmin;
GRANT update ON Cargo TO SysAdmin;
--Roles
GRANT select ON roles TO SysAdmin;
GRANT INSERT ON roles TO SysAdmin;
GRANT delete ON roles TO SysAdmin;
GRANT update ON roles TO SysAdmin;


CREATE ROLE Vendedor;
--Productos
GRANT select ON Productos TO Vendedor;
GRANT update ON Productos TO Vendedor;

CREATE ROLE RRHH
--EMPLEADOS
GRANT select ON Empleados TO RRHH;
GRANT insert ON Empleados TO RRHH;
GRANT update ON Empleados TO RRHH;
--CARGOS
GRANT delete ON cargo TO RRHH;
GRANT insert ON cargo TO RRHH;
GRANT update ON cargo TO RRHH;

CREATE ROLE Atencion_Al_cliente
--PRODUCTOS
GRANT SELECT ON PRODUCTOS TO Atencion_Al_cliente;
--CLIENTES
GRANT UPDATE ON CLIENTES TO Atencion_Al_cliente;

CREATE ROLE BODEGUERO
--PRODUCTOS
GRANT SELECT ON PRODUCTOS TO BODEGUERO;
GRANT INSERT ON PRODUCTOS TO BODEGUERO;
GRANT UPDATE ON PRODUCTOS TO BODEGUERO;

CREATE ROLE MOTORISTA
--PRODUCTOS
GRANT SELECT ON PRODUCTOS TO MOTORISTA;

