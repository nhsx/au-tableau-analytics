CREATE OR ALTER VIEW dct_summary_view as 
SELECT
    a.*

    ,c.M0144_number_of_nhs_app_registrations
    ,c.M0148_ons_population
    ,c.M387_has_api
    ,c.M387_total_trusts
    ,c.M384_no_of_clinical_trials
    ,c.M392_PIR_YES
    ,c.M392_PIR_COUNT

    ,GETDATE() as date_updated_view



FROM
dct_digitise_summary a 

-- LEFT JOIN 
-- dct_connect_summary_view b 
-- ON
-- a.__date=b.
-- AND a.GP_STP_Code=b.

LEFT JOIN
dct_transform_summary_view c 
ON a.__date=c.date
AND a.GP_STP_Code=c.GP_STP_Code