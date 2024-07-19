CREATE OR ALTER VIEW shcr_partners_icb_data_month_count_view as 

SELECT

CAST([For Month] as DATE) as date
,[ICB ODS code]
,[ICB Name (if applicable)]
,[ShCR Programme Name]
,[Name of ShCR System]
,[Care Providers]
,[Access to Advanced (EoL) Care Plans]
,[Number of users with access to the ShCR]
,[Number of ShCR views in the past month]
,[Number of unique user ShCR views in the past month]
-- ,[Completed by (email)]
-- ,[Date completed]
,LatestSubmission_Flg
,GETDATE() as date_updated



FROM
shcr_partners_icb_data_month_count

