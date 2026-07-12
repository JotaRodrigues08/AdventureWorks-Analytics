/*
SELECT top 1 * FROM Production.ProductInventory

-- ProductID / Quantity
*/

SELECT 
ProductID	  as [Id Produto],
SUM(Quantity) as [Estoque Total]
FROM
Production.ProductInventory
GROUP BY 
ProductID ;

