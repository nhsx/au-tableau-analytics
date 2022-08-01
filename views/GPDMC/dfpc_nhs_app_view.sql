CREATE OR ALTER VIEW [dbo].[dfpc_nhs_app_view]
AS
with base as (
SELECT 
    a.[Unique ID] as [dfpc_unique_id]
    ,a.[Date] as [dfpc_date]
    ,a.[Practice code] as [dfpc_practice_code]	
    ,a.[Cumulative number of P9 NHS app registrations] as [M0148_cumulative_number_of_p9_nhs_app_registrations]
    ,a.[Number of GP registered patients] as [M0148_number_of_gp_registered_patients]

    ,b.[Number of NHS app registrations] as [M0144_number_of_nhs_app_registrations]
    ,d.[Number of P9 NHS app registrations] as [M0146_number_of_p9_app_registrations]
    ,e.[Cumulative number of P9 NHS app registrations] as [M0145_cumulative_number_of_P9_nhs_app_registrations]

    ,f.[Number of repeat prescriptions] as [M0152_number_of_repeat_prescriptions]
    ,g.[Number of organ donation lookups] as [M0159_number_of_organ_donation_lookup]
    ,i.[Number of record views] as [M0153_number_of_record_views]

    ,j.[Number of primary care appointments booked] as [M0150_number_of_primary_care_appointments_booked]
    ,k.[Number of primary care appointments cancelled] as [M0151_number_of_primary_care_appointments_cancelled]

FROM
    [dbo].[nhs_app_uptake_gp_registered_population_day_prop] a
LEFT JOIN   
     [dbo].[nhs_app_uptake_registrations_day_count] b
ON
    a.[Date] = b.[Date] 
    AND a.[Practice code]= b.[Practice code]
LEFT JOIN
    [dbo].[nhs_app_uptake_p9_registrations_day_count] d
ON
    a.[Date]=d.[Date]
    AND a.[Practice code]=d.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_uptake_p9_registrations_day_cumsum] e
ON
    a.[Date]=e.[Date]
    AND a.[Practice code]=e.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_repeat_prescriptions_day_count] f
ON
    a.[Date]=f.[Date]
    AND a.[Practice code]=f.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_organ_donation_lookup_day_count] g
ON
    a.[Date]=g.[Date]
    AND a.[Practice code]=g.[Practice code]
LEFT JOIN
    [dbo].[nhs_app_usage_record_views_day_count] i
ON
    a.[Date]=i.[Date]
    AND a.[Practice code]=i.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_primary_care_appointments_booked_day_count] j
ON
    a.[Date]=j.[Date]
    AND a.[Practice code]=j.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_primary_care_appointments_cancelled_day_count] k
ON
    a.[Date]=k.[Date]
    AND a.[Practice code]=k.[Practice code]
)
select 
    DATEADD(DAY, 1, EOMONTH(dfpc_date, -1)) as dfpc_month_date
    ,[dfpc_practice_code] as dfpc_practice_code

    ,SUM([M0146_number_of_p9_app_registrations]) as [M0146_number_of_p9_app_registrations]
    ,SUM([M0148_number_of_gp_registered_patients]) as [M0148_number_of_gp_registered_patients]
    ,SUM([M0144_number_of_nhs_app_registrations]) as [M0144_number_of_nhs_app_registrations]
    ,SUM([M0145_cumulative_number_of_P9_nhs_app_registrations]) as [M0145_cumulative_number_of_P9_nhs_app_registrations]
    ,SUM([M0152_number_of_repeat_prescriptions]) as [M0152_number_of_repeat_prescriptions]
    ,SUM([M0159_number_of_organ_donation_lookup]) as [M0159_number_of_organ_donation_lookup]
    ,SUM([M0153_number_of_record_views]) as [M0153_number_of_record_views]
    ,SUM([M0150_number_of_primary_care_appointments_booked]) as [M0150_number_of_primary_care_appointments_booked]
    ,SUM([M0151_number_of_primary_care_appointments_cancelled]) as [M0151_number_of_primary_care_appointments_cancelled]

FROM base
GROUP BY
    DATEADD(DAY, 1, EOMONTH(dfpc_date, -1))
    ,[dfpc_practice_code]   