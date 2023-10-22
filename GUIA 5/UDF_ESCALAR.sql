USE [TiendaElectronica]
GO
/****** Object:  UserDefinedFunction [dbo].[CalcularPromedio] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[CalcularPromedio]()
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @Precio DECIMAL(5, 2)

    SELECT @Precio = AVG([Precio])
    FROM [dbo].[Productos]

    RETURN @Precio
END