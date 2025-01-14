CREATE OR ALTER VIEW dct_epr_funding AS

SELECT 

    Date
    ,[Cumulative in year '000]*1000 as cum_year_total
    ,[Cumulative total '000]*1000 as cum_total
    ,GETDATE() as date_updated

FROM 

epr_total_expenditure_month_count
where Date<=GETDATE()
and [Cumulative in year '000] is not null
and [Cumulative total '000] is not null
