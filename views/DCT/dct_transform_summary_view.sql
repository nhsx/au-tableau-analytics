CREATE OR ALTER VIEW dct_transform_summary_view as 

-- NHS app processing
with app_ons as (
SELECT 
    sum(OBS_VALUE) as ons_population
    FROM
    ons_population_api b
)
,app1 as (
SELECT
    uptake_date
    ,SUM(M0144_number_of_nhs_app_registrations) as M0144_number_of_nhs_app_registrations
    ,SUM(M0148_number_of_gp_registered_patients) as M0148_number_of_gp_registered_patients
FROM
    dct_nhs_app_view a
GROUP BY
    uptake_date
)
,app as (
SELECT
    a.*
    ,b.ons_population
FROM
app1 a 
LEFT JOIN
app_ons b
ON
1=1
)

-- eRS processing
,ers1 as (
-- SELECT 
--     STP_Code
--     ,Report_End_Date
--     ,SUM(has_api) as api_count
--     FROM dct_ers
-- group by 
--     STP_Code
--     ,Report_End_Date
SELECT 
[Report_End _Date]
,SUM([E_RS Submitted Trusts]) as has_api
,SUM([Acute Trusts]) as total_trusts
FROM e_rs_api_month_prop_by_ICB
group by 
[Report_End _Date]

)


-- Clinical trials
,CT as (
SELECT 
[Date]
,[value]
FROM
dct_clinical_trials
WHERE
metric='Number of researcher actual'
)


-- DSCR
,DSCR as (
SELECT 
_date
,SUM(PIR_YES) as PIR_YES
,SUM(PIR_COUNT) as PIR_COUNT
FROM
nhs_dscr_view
group by 
_date

)






-- FINAL SELECT
SELECT
    dd.date
    ,a.M0144_number_of_nhs_app_registrations
    ,a.ons_population as M0148_ons_population
    ,b.has_api as M387_has_api
    ,b.total_trusts as M387_total_trusts
    ,c.[value] as M384_no_of_clinical_trials
    ,d.PIR_YES as M392_PIR_YES
    ,d.PIR_COUNT as M392_PIR_COUNT

FROM
DimDate dd
LEFT JOIN
    app a
ON
dd.[Date]=a.uptake_date
LEFT JOIN
    ers1 b
ON
dd.[Date]=b.[Report_End _Date]
LEFT JOIN
    CT c
ON
    dd.[Date]=c.[Date]
LEFT JOIN
    DSCR d
ON
    dd.[Date]=d._date



WHERE
CONCAT(

    a.M0144_number_of_nhs_app_registrations
    ,a.ons_population
    ,b.has_api
    ,b.total_trusts
    ,c.[value] 
    ,d.PIR_YES
    ,d.PIR_COUNT

)
!= ''