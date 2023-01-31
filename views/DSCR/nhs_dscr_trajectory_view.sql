CREATE OR ALTER VIEW nhs_dscr_trajectory_view as

SELECT [Objective_No]
      ,[Objective_Name]
      ,dateadd(MONTH, -1, dateadd(DAY, 1, cast([Month] as date))) as _date
      ,[Month]
      ,[Measure]
      ,[Measure_desc]
      ,[Commitment_Version]
      
  FROM [dbo].[dscr_trajectory]
