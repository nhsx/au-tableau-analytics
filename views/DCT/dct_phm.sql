CREATE OR ALTER VIEW dct_phm as 
SELECT

    [ICB Code]
    ,[Date]
    ,[PHM Platform Vision]
    ,GETDATE() as date_refreshed

FROM
    population_health_platform
