CREATE OR ALTER VIEW DimDate_View as 
SELECT
    *
    , case
    when month >=4 then DATEADD(YEAR,1,[Date])
    else [Date]
    end
    as FY_date

FROM
    DimDate