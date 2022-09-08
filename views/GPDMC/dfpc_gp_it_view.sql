CREATE OR ALTER VIEW dfpc_gp_it_view
AS
SELECT 
      A.[Date]  AS [dfpc_gp_it_Date]
      ,A.[Financial Year]  AS [dfpc_gp_it_Financial_Year]
      ,A.[Practice code] AS [dfpc_gp_it_Practice code]
      ,A.[GP practice compliance with IT standards] AS [M074_GP practice compliance with IT standards]
FROM [dbo].[gp_it_standards_year_count_prop]  A
