CREATE OR ALTER VIEW dct_epr_funding AS

SELECT 

    Date
    ,[Revenue '000]*1000 as revenue
    ,[Capital'000]*1000 as capital
    ,[Cumulative total '000]*1000 as cum_total
    ,GETDATE() as date_updated

FROM 

epr_total_expenditure_month_count
where Date<=GETDATE()
