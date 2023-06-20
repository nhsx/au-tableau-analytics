CREATE OR ALTER VIEW dct_nhs_app_view as

SELECT
    *
    ,GETDATE() as date_updated

FROM 
    [dbo].[dct_nhs_app]    