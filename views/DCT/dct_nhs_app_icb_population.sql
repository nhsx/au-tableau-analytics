CREATE OR ALTER VIEW dct_nhs_app_icb_population_view as

SELECT
    a.DATE
    ,a.ICB_ONS_Code
    ,a.OBS_VALUE
    ,b.ICB22CDH as ICB_Code
    ,GETDATE() as date_updated

FROM 
    [dbo].[ons_population_api] a
LEFT JOIN
    icb_ons_ods_mapping b
ON
    a.ICB_ONS_Code=b.ICB22CD
