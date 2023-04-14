CREATE OR ALTER VIEW dct_dspt as 
SELECT
'Trust' as org_type

,ICB_CODE as ICB_CODE
,[Number of Trusts with the standard status] as number_of_orgs_with_status
,[Standard status] as dspt_status
,[Report Date] as report_date
,[Dspt_edition] as dspt_edition
,[Total number of Trusts] as total_orgs

FROM
dspt_nhs_trusts_standards_compliance_by_ICB 

UNION ALL

SELECT
'Social Care' as org_type
,ICB_Code as ICB_CODE
,[Number of locations with the standard status] as number_of_orgs_with_status
,[Standard status] as dspt_status
,[Report Date] as report_date
,null as dspt_edition
,[Total number of locations] as total_orgs

FROM
dspt_socialcare_standards_compliance_by_ICB
