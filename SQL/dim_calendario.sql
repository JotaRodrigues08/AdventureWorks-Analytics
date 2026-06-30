CREATE OR ALTER VIEW dbo.PBI_Dim_Calendario AS
SELECT 
    DateKey = CAST(CONVERT(VARCHAR(8), d, 112) AS INT),
    Data = CAST(d AS DATE),
    Ano = YEAR(d),
    MesNum = MONTH(d),
    NomeMes = CASE MONTH(d)
        WHEN 1 THEN 'Janeiro' WHEN 2 THEN 'Fevereiro' WHEN 3 THEN 'Março'
        WHEN 4 THEN 'Abril' WHEN 5 THEN 'Maio' WHEN 6 THEN 'Junho'
        WHEN 7 THEN 'Julho' WHEN 8 THEN 'Agosto' WHEN 9 THEN 'Setembro'
        WHEN 10 THEN 'Outubro' WHEN 11 THEN 'Novembro' WHEN 12 THEN 'Dezembro'
    END,
    Trimestre = 'T' + CAST(DATEPART(QUARTER, d) AS VARCHAR(1)),
    DiaSemanaNum = DATEPART(WEEKDAY, d),
    NomeDiaSemana = CASE DATEPART(WEEKDAY, d)
        WHEN 1 THEN 'Domingo' WHEN 2 THEN 'Segunda-feira' WHEN 3 THEN 'Terça-feira'
        WHEN 4 THEN 'Quarta-feira' WHEN 5 THEN 'Quinta-feira' WHEN 6 THEN 'Sexta-feira'
        WHEN 7 THEN 'Sábado'
    END
FROM (
    -- Usando formato ISO grudado (AAAAMMDD) para evitar erro de idioma do servidor
    SELECT DATEADD(DAY, number, '20200101') AS d
    FROM master.dbo.spt_values
    WHERE type = 'P' AND DATEADD(DAY, number, '20200101') <= '20261231'
) AS dates;