CREATE VIEW dfpc_gp_eps_view
AS
SELECT A.[Unique ID]  AS [dfpc_gp_eps_Unique ID]
      ,A.[Date]  AS [dfpc_gp_eps_Date]
      ,A.[Practice code] AS [dfpc_gp_eps_Practice code]
      ,A.[Number of registered patients with a nominated pharmacy] AS [M083_Number of registered patients with a nominated pharmacy]
      ,A.[Number of registered patients] AS [REF_Number of GP registered patients] 
      ,B.[Number of EPS items] AS [M084_Number of items prescribed and dispensed via EPS during the reporting period]
      ,B.[All items] AS [REF_All dispensing items prescribed and dispensed during the reporting period]
      ,C.[Number of eRD items] AS [M085_Number of repeat dispensing items prescribed and dispensed during the reporting period]
FROM [dbo].[eps_usage_patient_nominated_pharmacy_month_prop]  A

left join [dbo].[eps_usage_eps_utilisation_month_prop] B 

     on A.[Date] = B.[Date] and  A.[Practice code] = B.[Practice code]

left join  [dbo].[eps_usage_erd_utilisation_month_prop]  C
    on A.[Date] = C.[Date] and  A.[Practice code] = C.[Practice code]
ORDER BY [dfpc_gp_eps_Unique ID] OFFSET 0 ROWS