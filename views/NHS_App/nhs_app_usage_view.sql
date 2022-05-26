CREATE OR ALTER VIEW nhs_app_usage_view AS 

SELECT

    a.[Unique ID] as [usage_unique_id]
    ,a.[Date] as [usage_date]
    ,a.[Practice code] as [usage_practice_code]
    ,a.[Number of logins] as [M0149_number_of_logins]

    ,b.[Number of repeat prescriptions] as [M0152_number_of_repeat_prescriptions]
    ,c.[Number of primary care appointments booked] as [M0150_number_of_primary_care_appointments_booked]
    ,d.[Number of primary care appointments cancelled] as [M0151_number_of_primary_care_appointments_cancelled]
    ,e.[Number of organ donation lookups] as [M0159_number_of_organ_donation_lookup]
    ,f.[Number of organ donation registrations] as [M0156_number_of_organ_donation_registrations]
    ,g.[Number of organ donation updates] as [M0158_number_of_organ_donation_updates]
    ,h.[Number of organ donation withdrawals] as [M0157_number_of_organ_donation_withdrawals]
    ,i.[Number of record views] as [M0153_number_of_record_views]
    ,j.[Number of summary care record views] as [M0154_number_of_summary_care_record_views]
    ,k.[Number of detail coded record views] as [M0155_number_of_detail_coded_record_views]

    ,'1' as JoinCond    

FROM
    [dbo].[nhs_app_usage_logins_day_count] a

LEFT JOIN
    [dbo].[nhs_app_usage_repeat_prescriptions_day_count] b 
ON
    a.[Date]=b.[Date]
    AND a.[Practice code]=b.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_primary_care_appointments_booked_day_count] c
ON
    a.[Date]=c.[Date]
    AND a.[Practice code]=c.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_primary_care_appointments_cancelled_day_count] d
ON
    a.[Date]=d.[Date]
    AND a.[Practice code]=d.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_organ_donation_lookup_day_count] e
ON
    a.[Date]=e.[Date]
    AND a.[Practice code]=e.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_organ_donation_registration_day_count] f
ON
    a.[Date]=f.[Date]
    AND a.[Practice code]=f.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_organ_donation_update_day_count] g
ON
    a.[Date]=g.[Date]
    AND a.[Practice code]=g.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_organ_donation_withdrawal_day_count] h
ON
    a.[Date]=h.[Date]
    AND a.[Practice code]=h.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_record_views_day_count] i
ON
    a.[Date]=i.[Date]
    AND a.[Practice code]=i.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_summary_record_views_day_count] j
ON
    a.[Date]=j.[Date]
    AND a.[Practice code]=j.[Practice code]

LEFT JOIN
    [dbo].[nhs_app_usage_detail_coded_record_views_day_count] k
ON
    a.[Date]=k.[Date]
    AND a.[Practice code]=k.[Practice code]
