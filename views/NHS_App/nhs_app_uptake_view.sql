CREATE OR ALTER VIEW nhs_app_uptake_view AS 

SELECT

    a.[Unique ID] as [uptake_unique_id]
    ,a.[Date] as [uptake_date]
    ,a.[Practice code] as [uptake_practice_code]	
    ,a.[Cumulative number of P9 NHS app registrations] as [M0148_cumulative_number_of_p9_nhs_app_registrations]
    ,a.[Number of GP registered patients] as [M0148_number_of_gp_registered_patients]

    ,b.[Number of NHS app registrations] as [M0144_number_of_nhs_app_registrations]
    ,c.[Cumulative number of NHS app registrations] as [M0143_cumulative_number_of_nhs_app_registrations]
    ,d.[Number of P9 NHS app registrations] as [M0146_number_of_p9_app_registrations]
    ,e.[Cumulative number of P9 NHS app registrations] as [M0145_cumulative_number_of_P9_nhs_app_registrations]
 
    ,'1' as JoinCond

FROM
    [dbo].[nhs_app_uptake_gp_registered_population_day_prop] a
LEFT JOIN
 [dbo].[nhs_app_uptake_registrations_day_count] b
ON
 a.[Date] = b.[Date] AND a.[Practice code]= b.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_uptake_registrations_day_cumsum] c
ON
    a.[Date]=c.[Date] AND a.[Practice code]=c.[Practice code]
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
