CREATE OR ALTER VIEW dbo.Pbi_Fato_Vendas AS
SELECT 
    h.SalesOrderID,
    h.OrderDate AS DataPedido,
    h.CustomerID,
    ISNULL(h.SalesPersonID, -1) AS SalesPersonID, -- -1 para vendas online sem vendedor
    h.TerritoryID,
    h.OnlineOrderFlag, -- 0 = B2B (Loja), 1 = B2C (Internet)
    d.ProductID,
    d.OrderQty AS QtdPedido,
    d.UnitPrice AS PreçoUnitario,
    d.UnitPriceDiscount AS DescontoUnitario
FROM Sales.SalesOrderHeader h
INNER JOIN Sales.SalesOrderDetail d ON h.SalesOrderID = d.SalesOrderID;