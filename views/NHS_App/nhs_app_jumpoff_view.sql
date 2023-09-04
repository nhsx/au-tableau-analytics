CREATE OR ALTER VIEW nhs_app_jumpoff_view as

SELECT 

    Provider as Provider
    ,Date as Date
    ,[Practice code] as [Practice code] 
    ,Service as jumpoff_measure
    ,Clicks as jumpoff_value

FROM
    nhs_app_jumpoff_all_dynamic