CREATE VIEW dfpc_gp_survey_view
AS
SELECT A.[Unique ID]  AS [dfpc_gp_survey_Unique ID]
      ,A.[Date]  AS [dfpc_gp_survey_Date]
      ,A.[Practice code] AS [dfpc_gp_survey_Practice code]
      ,A.[Total number of responses] AS [M90_Total number of responses]
      ,A.[Number of patients reporting using GP practice online services] AS [M90_Number of patients reporting using GP practice online services] 
      ,B.[Total number of responses] AS [M091_Total number of responses]
      ,B.[Number of patients reporting having booked an appointment online] AS [M091_Number of patients reporting having booked an appointment online]
      ,C.[Total number of responses] AS [M092_Total number of responses]
      ,C.[Number of patients reporting having tried to use their GP practices website] AS [M092_Number of patients reporting having tried to use their GP practices website]
      ,D.[Number of patients reporting that their GP practice website was easy to use] AS [M093_Number of patients reporting that their GP practice website was easy to use]
      ,D.[Number of patients reporting having tried to use their GP practices website] AS [M093_Total number of responses]
FROM [dbo].[results_use_online_services_year_prop]  A

left join [dbo].[results_booked_appointment_online_year_prop] B 

     on A.[Date] = B.[Date] and  A.[Practice code] = B.[Practice code]

left join  [dbo].[results_use_gp_website_year_prop]  C
    on A.[Date] = C.[Date] and  A.[Practice code] = C.[Practice code]

left join  [dbo].[results_easyuse_gp_website_year_prop]  D
    on A.[Date] = D.[Date] and  A.[Practice code] = D.[Practice code]
ORDER BY [dfpc_gp_survey_Unique ID] OFFSET 0 ROWS