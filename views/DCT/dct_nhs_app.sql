CREATE OR ALTER VIEW dct_nhs_app as

with a as (
SELECT 
-- TOP(100) 
* FROM nhs_app_uptake_gp_registered_population_day_prop where Date>'2023-01-01' and LEFT([Practice code],1)='A'
)
,b as (
SELECT 
-- TOP(100) 
* FROM nhs_app_uptake_registrations_day_count where Date>'2023-01-01' and LEFT([Practice code],1)='A'
)
,d as (
SELECT 
-- TOP(100) 
* FROM nhs_app_uptake_p9_registrations_day_count where Date>'2023-01-01' and LEFT([Practice code],1)='A'
)

SELECT

    DATETRUNC(month, a.Date) as uptake_date
    ,a.[Practice code] as uptake_practice_code	
    ,MAX(a.[Number of GP registered patients]) as M0148_number_of_gp_registered_patients

    ,SUM(b.[Number of NHS app registrations]) as M0144_number_of_nhs_app_registrations
    ,SUM(d.[Number of P9 NHS app registrations]) as M0146_number_of_p9_app_registrations
    
 

FROM
    -- nhs_app_uptake_gp_registered_population_day_prop a
    a
LEFT JOIN
--  nhs_app_uptake_registrations_day_count b
    b
ON
 a.Date = b.Date AND a.[Practice code]= b.[Practice code]


LEFT JOIN
    -- nhs_app_uptake_p9_registrations_day_count d
    d
ON
    a.Date=d.Date
    AND a.[Practice code]=d.[Practice code]
GROUP BY
DATETRUNC(month, a.Date) , a.[Practice code]
;