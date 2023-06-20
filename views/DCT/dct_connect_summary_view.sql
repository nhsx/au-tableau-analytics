CREATE OR ALTER VIEW dct_connect_summary_view as 

SELECT
    *
    ,GETDATE() as date_updated

FROM
    dct_phm