
CREATE OR ALTER VIEW dct_dscr_view as 
SELECT
[Location_Id]
,[Location_Primary_Inspection_Category]
,[Location_Local_Authority]
,[CCG_ONS_Code]
,[Location_ONSPD_CCG_Name]
,[ICB_ONS_Code]
,[ICB_Name]
,[Region_Code]
,[Region_Name]
,[Provider_ID]
,[eo_monthly_date]
,[NOtodate]
,[PIR_todate]
,GETDATE() as date_updated

,CASE
when
PIR_todate='Yes' then 1
END as YEStodate

,CASE
when
PIR_todate='Yes' then 1
when PIR_todate='No' then 1

END as YESNOtodate


FROM
dscr_all_variables_cum_count
