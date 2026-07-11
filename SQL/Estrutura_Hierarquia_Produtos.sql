SELECT 
    p.ProductID                 AS [ID PRODUTO],
    p.Name                      AS [NOME PRODUTO],
    c.ProductCategoryID         AS [ID CATEGORIA],
    c.Name                      AS [CATEGORIA],
    s.ProductSubcategoryID      AS [ID SUB CATEGORIA],
    s.Name                      AS [NOME SUB CATEGORIA]
FROM [Production].[Product] p
INNER JOIN Production.ProductSubcategory s 
    ON p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory c
    ON S.ProductCategoryID = C.ProductCategoryID