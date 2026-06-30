CREATE OR ALTER VIEW dbo.vw_Dim_Cliente AS
SELECT 
    c.CustomerID,
    c.TerritoryID,
    CASE 
        WHEN c.PersonID IS NOT NULL THEN p.FirstName + ' ' + ISNULL(p.LastName, '')
        WHEN c.StoreID IS NOT NULL THEN s.Name
        ELSE 'Cliente Não Identificado'
    END AS NomeCliente,
    CASE 
        WHEN c.PersonID IS NOT NULL THEN 'B2C - Internet'
        WHEN c.StoreID IS NOT NULL THEN 'B2B - Loja'
        ELSE 'Desconhecido'
    END AS TipoCliente
FROM Sales.Customer c
LEFT JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
LEFT JOIN Sales.Store s ON c.StoreID = s.BusinessEntityID;