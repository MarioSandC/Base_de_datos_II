USE [TiendaElectronica]
GO
/****** Object:  UserDefinedFunction [dbo].[IngresoProducto] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[IngresoProducto] (@Producto INT)
RETURNS TABLE
AS
RETURN (
    SELECT 
    a.ID_Producto,
    
    CONCAT(d.Nombres) AS Titulo,
    CONCAT(b.Nombre) AS Categoria,
FROM
    Productos AS a
    INNER JOIN Categorias AS b ON a.CategoriaID = b.CategoriaID
WHERE
    a.ProductoID = @Producto
)
