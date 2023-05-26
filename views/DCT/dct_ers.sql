CREATE OR ALTER VIEW dct_ers as 
SELECT
    a.[ODS] as ods_code
    ,a.[Organisation]
    ,a.[DateCreated]
    ,a.[Report_End _Date] as Report_End_Date
    ,a.[STP_Code]
    ,1 as has_api
    ,GETDATE() as date_updated
    
FROM
    e_rs_api_month_count a
