CREATE OR ALTER VIEW dct_transform_summary_view as 

-- Join dim date with list of ICBs to get full list for every date
with 
icbs as (
    SELECT 
      DISTINCT [GP_STP_Code]
      
  FROM [dbo].[odscodes_gp_mapping]

  UNION ALL
    SELECT 'N/A' as GP_STP_Code
)
, _DimDate as (
SELECT
a.[Date]
,b.GP_STP_Code
FROM
DimDate a 
left join 
icbs b
ON
1=1
)





-- NHS app processing


,app_ons as (
SELECT 
    DATE
    ,ICB_ONS_CODE
    ,OBS_VALUE as ons_population
    FROM
    ons_population_api b

)
,app1 as (
SELECT
    uptake_date
    ,b.GP_STP_Code
    ,SUM(M0144_number_of_nhs_app_registrations) as M0144_number_of_nhs_app_registrations
    ,SUM(M0148_number_of_gp_registered_patients) as M0148_number_of_gp_registered_patients
FROM
    dct_nhs_app_view a
LEFT JOIN
    odscodes_gp_mapping b
ON
    a.uptake_practice_code=b.GP_Code
GROUP BY
    uptake_date
    ,b.GP_STP_Code
)
,app as (
SELECT
    a.*
    ,b.ons_population
FROM
app1 a 
LEFT JOIN
icb_ons_ods_mapping icb
ON
a.GP_STP_Code=icb.ICB22CDH

LEFT JOIN
app_ons b
ON
icb.ICB22CD=b.ICB_ONS_Code
)

-- eRS processing
,ers1 as (

SELECT 
[Report_End _Date]
,STP_Code
,SUM([E_RS Submitted Trusts]) as has_api
,SUM([Acute Trusts]) as total_trusts
FROM e_rs_api_month_prop_by_ICB
group by 
[Report_End _Date]
,STP_Code

)


-- Clinical trials
,CT as (
SELECT 
[Date]
,'N/A' as ICB_code
,[value]
FROM
dct_clinical_trials
WHERE
metric='Trial volume acual'
)


-- DSCR
,DSCR as (
SELECT 
    _date
    ,ICB_ONS_Code
    ,icb.ICB22CDH as ICB_code
    ,SUM(
        CASE 
        WHEN [Use a Digital Social Care Record system?]='Yes' THEN 1
        ELSE 0
        END
    ) as PIR_YES
    ,count(*) as PIR_COUNT
FROM
    nhs_dscr_2_view a
LEFT JOIN
    icb_ons_ods_mapping icb
ON
    a.ICB_ONS_Code=icb.ICB22CD

group by 
    _date
    ,ICB_ONS_Code
    ,icb.ICB22CDH
)


-- FINAL SELECT
SELECT
    dd.date
    ,dd.GP_STP_Code
    ,a.M0144_number_of_nhs_app_registrations
    ,a.ons_population as M0148_ons_population
    ,b.has_api as M387_has_api
    ,b.total_trusts as M387_total_trusts
    ,c.[value] as M384_no_of_clinical_trials
    ,d.PIR_YES as M392_PIR_YES
    ,d.PIR_COUNT as M392_PIR_COUNT

    ,GETDATE() as date_updated


FROM
    _DimDate dd
LEFT JOIN
    app a
ON
    dd.[Date]=a.uptake_date
    AND dd.GP_STP_Code=a.GP_STP_Code

LEFT JOIN
    ers1 b
ON
    dd.[Date]=b.[Report_End _Date]
    AND dd.GP_STP_Code=b.STP_Code

LEFT JOIN
    CT c
ON
    dd.[Date]=c.[Date]
    AND dd.GP_STP_Code=c.ICB_code

LEFT JOIN
    DSCR d
ON
    dd.[Date]=d._date
    AND dd.GP_STP_Code=d.ICB_code



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