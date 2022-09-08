CREATE OR ALTER VIEW [dbo].[dfpc_online_consultation_view]
AS

SELECT 
          A.[Week Commencing] AS [dfpc_online_consultation_Date]
      ,A.[Practice code]  AS [dfpc_online_consultation_Practice code]
      ,A.[Number of patient online consultation submissions] AS [M60_Number of patient online consultation submissions]
      ,B.[Number of patient online consultation submissions] AS [M61_Number of patient online consultation submissions]
      ,B.[GP practice population] AS [REF_GP practice population]
      ,C.[Online consultation system supplier] AS [Online consultation system supplier]
      ,C.[Count] As [M62_GP practice OC supplier count]
FROM   [dbo].[online_consultation_gp_practice_submissions_week_count] A

left join [dbo].[online_consultation_gp_practice_submissions_week_rate] B 
     on A.[Week Commencing] = B.[Week Commencing] and  A.[Practice code] = B.[Practice code]

left join [dbo].[online_consultation_gp_practice_supplier_week_count] C
     on A.[Week Commencing] = C.[Week Commencing] and  A.[Practice code] = C.[Practice code]

