--GUIA 04
use TiendaElectronica

DECLARE @EmpleadoID INT;
DECLARE @Nombres NVARCHAR(50);
DECLARE @Apellidos NVARCHAR(50);
DECLARE @Email varchar(255);
DECLARE @DUI varchar(10);
DECLARE @CursorEmpleado cursor;

SET @CursorEmpleado = CURSOR FOR
SELECT EmpleadoId, Nombres, Apellidos, Email, DUI
FROM empleados;

OPEN @CursorEmpleado;

--crear un bucle
FETCH NEXT FROM @CursorEmpleado INTO @EmpleadoID, @Nombres, @Apellidos,@Email,@DUI;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Tu lógica o operaciones con los datos del empleado aquí
	-- Recupera los datos del siguiente registro
FETCH NEXT FROM @CursorEmpleado INTO @EmpleadoID, @Nombres, @Apellidos,@Email,@DUI;
END

CLOSE @CursorEmpleado;
DEALLOCATE @CursorEmpleado;



