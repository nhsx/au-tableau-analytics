CREATE OR ALTER VIEW nhs_dscr_2_view AS 
SELECT

DATEFROMPARTS(RIGHT(month_year, 4),LEFT(month_year, CHARINDEX('-',month_year)-1),1) as _date

    ,[Location_Id]
      ,[Location_Primary_Inspection_Category]
      ,[Location_Local_Authority]
      ,[CCG_ONS_Code]
      ,[Location_ONSPD_CCG_Name]
      ,[ICB_ONS_Code]
      ,[ICB_Name]
      ,[Region_Code]
      ,[Region_Name]
      ,[Provider_ID]
      ,[monthly_date]
      ,[Is_Care_Home]
      -- ,cast([Care_Home_Beds] as float) as [Care_Home_Beds]
      ,try_convert(float, Care_Home_Beds)  as [Care_Home_Beds]

      -- ,[Date]
      -- ,[IsActive]
      -- ,[IsDomcare]
      ,[ServiceUserCount]
      ,[PIR submission date]
      ,[month_year]
      ,CAST([PIR type] as VARCHAR(20)) as [PIR type]
      ,CAST([Use a Digital Social Care Record system?] as VARCHAR(10)) as [Use a Digital Social Care Record system?]
      ,[PIRm_n]
      ,[run_date]


FROM
[dbo].[dscr_all_variables_care_home_beds] a

--shapefile_stp_boundaries_snapshot