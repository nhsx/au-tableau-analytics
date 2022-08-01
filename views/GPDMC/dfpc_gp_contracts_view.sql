CREATE OR ALTER VIEW dfpc_gp_contracts_view AS

SELECT

    a.[Date] as [dfpc_gp_contracts_Date]
    ,a.[Practice code] as [dfpc_gp_contracts_Practice code]
    ,a.[GP practice repeat prescription functionality enabled] AS [M051_GP practice repeat prescription functionality enabled]
    ,b.[GP practice detailed coded record functionality enabled] AS [M052_GP practice detailed coded record functionality enabled]
    ,c.[Number of detailed coded record views] AS [M055_Number of detailed coded record views]
    -- ,e.[Number of patient online consultation submissions] AS [M60_Number of patient online consultation submissions]
    ,j.[Number of registered patients with a nominated pharmacy] AS [M083_Number of registered patients with a nominated pharmacy]
    ,k.[Number of EPS items] AS [M084_Number of items prescribed and dispensed via EPS during the reporting period]
    ,k.[All items] AS [REF_All dispensing items prescribed and dispensed during the reporting period]

    ,l.[Number of eRD items] AS [M085_Number of repeat dispensing items prescribed and dispensed during the reporting period]
    ,m.[Total number of responses] AS [M091_Total number of responses]
    ,m.[Number of patients reporting having booked an appointment online] AS [M091_Number of patients reporting having booked an appointment online]
    ,n.[Total number of responses] AS [M092_Total number of responses]
    ,n.[Number of patients reporting having tried to use their GP practices website] AS [M092_Number of patients reporting having tried to use their GP practices website]
    ,o.[Number of patients reporting that their GP practice website was easy to use] AS [M093_Number of patients reporting that their GP practice website was easy to use]

    ,p.[Number of patients registered for appointment functionality] AS [M0140_Number of patients registered for appointment functionality] 
    ,q.[Number of patients registered for detailed coded record functionality] AS [M0142_Number of patients registered for detailed coded record functionality] 
    ,r.[Number of registered patients] AS [REF_Number of GP practice registered patients]

FROM

    pomi_repeat_prescription_enabled_month_count_prop	a
LEFT JOIN
    pomi_record_func_enabled_month_count_prop	b
ON
    a.[Date]=b.[Date] AND a.[Practice code]=b.[Practice code]
LEFT JOIN
    pomi_record_views_month_count	c
ON
    a.[Date]=c.[Date] AND a.[Practice code]=c.[Practice code]
-- LEFT JOIN
--     online_consultation_gp_practice_submissions_week_count	e
-- ON
--     a.[Date]=e.[Date] AND a.[Practice code]=e.[Practice code]
LEFT JOIN
    eps_usage_patient_nominated_pharmacy_month_prop	j
ON
    a.[Date]=EOMONTH(j.[Date]) AND a.[Practice code]=j.[Practice code]
LEFT JOIN
    eps_usage_eps_utilisation_month_prop	k
ON
    a.[Date]=EOMONTH(k.[Date]) AND a.[Practice code]=k.[Practice code]
LEFT JOIN
    eps_usage_erd_utilisation_month_prop	l
ON
    a.[Date]=EOMONTH(l.[Date]) AND a.[Practice code]=l.[Practice code]
LEFT JOIN
    results_booked_appointment_online_year_prop	m
ON
    a.[Date]=EOMONTH(m.[Date]) AND a.[Practice code]=m.[Practice code]
LEFT JOIN
    results_use_gp_website_year_prop	n
ON
    a.[Date]=EOMONTH(n.[Date]) AND a.[Practice code]=n.[Practice code]
LEFT JOIN
    results_easyuse_gp_website_year_prop	o
ON
    a.[Date]=EOMONTH(o.[Date]) AND a.[Practice code]=o.[Practice code]
LEFT JOIN
    pomi_patient_appointments_func_month_count_prop	p
ON
    a.[Date]=p.[Date] AND a.[Practice code]=p.[Practice code]
LEFT JOIN
    pomi_patient_record_func_month_count_prop	q
ON
    a.[Date]=q.[Date] AND a.[Practice code]=q.[Practice code]
left join  [dbo].[pomi_patient_appointments_func_month_count_prop]  r
    on A.[Date] = r.[Date] and  A.[Practice code] = r.[Practice code]
