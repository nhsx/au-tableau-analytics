CREATE OR ALTER VIEW dct_epr AS

SELECT 

    ODS as trust_ods_code
    ,Trust_Type
    ,EPR_Group
    ,Current_EPR_Status
    ,CAST(Bi_Weekly_Report_Date as date) as Bi_Weekly_Report_Date
    ,STP_Code
    ,Organisation_Name
    ,Current_Forecast_Go_Live
    ,GETDATE() as date_updated

FROM 

epr_data_biweekly_count