


CREATE VIEW Vista_Facturas_Detalles AS
SELECT f.FacturaId, f.ClienteID, p.Nombre, dp.cantidad, dp.PrecioUnitario, dp.Total
FROM Factura f
JOIN DetallesFactura dp ON f.FacturaId = dp.FacturaId
JOIN Productos p ON dp.ProductoID = p.ProductoID;