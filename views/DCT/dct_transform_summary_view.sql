CREATE OR ALTER VIEW dct_transform_summary_view as 

with app as (
SELECT
    uptake_date
    ,SUM(M0144_number_of_nhs_app_registrations) as M0144_number_of_nhs_app_registrations
    ,SUM(M0148_number_of_gp_registered_patients) as M0148_number_of_gp_registered_patients

FROM
    dct_nhs_app_view a
GROUP BY
    uptake_date
)
SELECT
    a.*
FROM
    app a
