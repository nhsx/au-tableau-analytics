CREATE OR ALTER VIEW nhs_app_jumpoff_view as

SELECT 

    a.Date as jumpoff_date
    ,a.[Practice code] as jumpoff_practice_code
    ,a.[Number of Engage admin] as M0174_Number_of_Engage_admin

    ,b.[Number of Engage - medicalJump Off Clicks] as M0175_Number_of_Engage_medicalJump_Off_Clicks
    ,c.[Number of Engage Messages] as M0172_Number_of_Engage_Messages
    ,d.[Number of Manage Your Referral Jump Off Clicks] as M0164_Number_of_Manage_Your_Referral_Jump_Off_Clicks
    ,e.[Number of PKB - appointments Jump Off Clicks] as M0167_Number_of_PKB_appointments_Jump_Off_Clicks
    ,f.[Number of PKB carePlans] as M0171_Number_of_PKB_carePlans
    ,g.[Number of Health Trackers Jump Off Clicks] as M0170_Number_of_Health_Trackers_Jump_Off_Clicks
    ,h.[Number of Medicine Jump Off Clicks] as M0169_Number_of_Medicine_Jump_Off_Clicks
    ,i.[Number of PKB - messagesJump Off Clicks] as M0166_Number_of_PKB_messagesJump_Off_Clicks
    ,j.[Number of PKB sharedlinks] as M0173_Number_of_PKB_sharedlinks
    ,k.[Number of PKB - test results Jump Off Clicks] as M0168_Number_of_PKB_test_results_Jump_Off_Clicks
    ,l.[Number of Substrakt - accountAdminJump Off Clicks] as M0177_Number_of_Substrakt_accountAdminJump_Off_Clicks
    ,m.[Number of Substrakt Messages] as M0176_Number_of_Substrakt_Messages
    ,n.[Number of Substrakt Patient Participation Group Jump Off Clicks] as M0178_Number_of_Substrakt_Patient_Participation_Group_Jump_Off_Clicks
    ,o.[Number of Covid Pass P5 Jump Off Clicks] as [M0163_Number_of_Covid_Pass_P5_Jump_Off_Clicks]
    ,p.[Number of Covid Vaccine Record ViewJump Off Clicks] as [M0165_Number_of_Covid_Vaccine_Record_ViewJump_Off_Clicks]
    ,q.[Number of Covid Pass Jump Off Clicks] as M0162_Number_of_Covid_Pass_Jump_Off_Clicks

    ,'1' as JoinCond    

FROM
    nhs_app_jumpoff_engage_admin_day_count a

LEFT JOIN
    nhs_app_jumpoff_engage_medical_day_count b
ON
    a.[Date]=b.[Date]
    AND a.[Practice code]=b.[Practice code]
    AND 1=2

LEFT JOIN
    nhs_app_jumpoff_engage_messages_count c
ON
    a.[Date]=c.[Date]
    AND a.[Practice code]=c.[Practice code]
    AND 1=2

LEFT JOIN
    nhs_app_jumpoff_esr_manageYourReferra_day_count d
ON
    a.[Date]=d.[Date]
    AND a.[Practice code]=d.[Practice code]
    AND 1=2

LEFT JOIN
    nhs_app_jumpoff_pkb_appointments_day_count e
ON
    a.[Date]=e.[Date]
    AND a.[Practice code]=e.[Practice code]
    AND 1=2

LEFT JOIN
    nhs_app_jumpoff_PKB_carePlans_day_count f
ON
    a.[Date]=f.[Date]
    AND a.[Practice code]=f.[Practice code]
    AND 1=2

LEFT JOIN
    nhs_app_jumpoff_pkb_healthTrackers_day_count g
ON
    a.[Date]=g.[Date]
    AND a.[Practice code]=g.[Practice code]
    AND 1=2

LEFT JOIN
    nhs_app_jumpoff_pkb_medicines_day_count h
ON
    a.[Date]=h.[Date]
    AND a.[Practice code]=h.[Practice code]
    AND 1=2

LEFT JOIN
    nhs_app_jumpoff_PKB_messages_day_count i 
ON
    a.[Date]=i.[Date]
    AND a.[Practice code]=i.[Practice code]
    AND 1=2

LEFT JOIN
    nhs_app_jumpoff_pkb_sharedlinks_count j
ON
    a.[Date]=j.[Date]
    AND a.[Practice code]=j.[Practice code]
    AND 1=2

LEFT JOIN
    nhs_app_jumpoff_pkb_test_results_day_count k
ON
    a.[Date]=k.[Date]
    AND a.[Practice code]=k.[Practice code]
    AND 1=2

LEFT JOIN
    nhs_app_jumpoff_substrakt_accountAdmin_day_count l
ON
    a.[Date]=l.[Date]
    AND a.[Practice code]=l.[Practice code]
    AND 1=2

LEFT JOIN
    nhs_app_jumpoff_substrakt_messages_day_count m
ON
    a.[Date]=m.[Date]
    AND a.[Practice code]=m.[Practice code]
    AND 1=2

LEFT JOIN
    nhs_app_jumpoff_substrakt_patientparticipationgroup_day_count n
ON
    a.[Date]=n.[Date]
    AND a.[Practice code]=n.[Practice code]
    AND 1=2

LEFT JOIN
    [dbo].[nhs_app_jumpoff_covid_pass_p5_count] o
ON
    a.[Date]=o.[Date]
    AND a.[Practice code]=o.[Practice code]
    AND 1=2

LEFT JOIN
    [dbo].[nhs_app_jumpoff_covid_vaccine_record_view_day_count] p
ON
    a.[Date]=p.[Date]
    AND a.[Practice code]=p.[Practice code]
    AND 1=2

LEFT JOIN
    [dbo].[nhs_app_jumpoff_covid_pass_count] q
ON
    a.[Date]=q.[Date]
    AND a.[Practice code]=q.[Practice code]
    AND 1=2
