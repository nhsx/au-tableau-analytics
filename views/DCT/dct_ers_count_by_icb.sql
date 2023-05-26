CREATE OR ALTER VIEW 
dct_ers_count_by_ICB as 
SELECT

    [E_RS Submitted Trusts]
    ,[Acute Trusts]
    ,[STP_Code]
    ,CONVERT(datetime,[Report_End _Date]) as [Report_End _Date]

FROM
    e_rs_api_month_prop_by_ICB 
