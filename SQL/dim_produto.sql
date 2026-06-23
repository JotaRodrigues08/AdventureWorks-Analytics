CREATE OR ALTER VIEW dbo.PBI_Dim_Produto AS 
SELECT 
 p.ProductID
,p.Name								AS Nome_Produto
,p.ProductNumber					AS Codigo_Produto
,ISNULL(p.Color, 'Não Informado')   AS Cor
,p.StandardCost					AS Custo_Padrao
,p.ListPrice						AS Preco_Lista
,ps.[Name]							AS SubCategoria
,pc.[Name]							AS Categoria

FROM [Production].[Product] p
LEFT JOIN Production.ProductSubcategory ps 
	ON p.ProductSubcategoryID = ps.ProductSubcategoryID
LEFT JOIN Production.ProductCategory pc
	ON ps.ProductCategoryID = pc.ProductCategoryID