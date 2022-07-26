CREATE OR ALTER VIEW [dbo].[dfpc_nhs_app_view]
AS
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
    ,c.[Number of primary care appointments booked] as [M0150_number_of_primary_care_appointments_booked]
    ,g.[Number of organ donation lookups] as [M0159_number_of_organ_donation_lookup]
    ,i.[Number of record views] as [M0153_number_of_record_views]

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
    [dbo].[nhs_app_usage_primary_care_appointments_booked_day_count] c
ON
    a.[Date]=c.[Date]
    AND a.[Practice code]=c.[Practice code]
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
