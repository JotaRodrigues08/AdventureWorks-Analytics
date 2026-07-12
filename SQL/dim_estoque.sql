CREATE OR ALTER VIEW dbo.PBI_Dim_Estoque
AS
SELECT 
    ProductID     AS [Id Produto],
    SUM(Quantity) AS [Estoque Total]
FROM
    Production.ProductInventory
GROUP BY 
    ProductID;