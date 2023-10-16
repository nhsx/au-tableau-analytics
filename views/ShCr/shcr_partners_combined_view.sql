CREATE OR ALTER VIEW shcr_partners_combined_view AS

SELECT
'Trust' as org_type

,CAST([For Month] as DATE) as date
,[ICB ODS code]
,[ICS Name (if applicable)]
,[Partner Organisation connected to ShCR?]
,[Partner Organisation plans to be connected by March 2023?]
,[ODS trust Code] as org_ods_code
,[trust Name] as org_name

FROM
shcr_partners_trust_data_month_count


UNION ALL 
SELECT
'pcn' as org_type
,CAST([For Month] as DATE) as date
,[ICB ODS code]
,[ICS Name (if applicable)]
,[Partner Organisation connected to ShCR?]
,[Partner Organisation plans to be connected by March 2023?]
,[ODS pcn Code] as org_ods_code
,[pcn Name] as org_name

FROM
shcr_partners_pcn_data_month_count

UNION ALL 
SELECT
'LA' as org_type

,CAST([For Month] as DATE) as date
,[ICB ODS code]
,[ICS Name (if applicable)]
,[Partner Organisation connected to ShCR?]
,[Partner Organisation plans to be connected by March 2023?]
,[ODS la Code] as org_ods_code
,[la Name] as org_name

FROM
shcr_partners_la_data_month_count

UNION ALL 
SELECT
'Community' as org_type

,CAST([For Month] as DATE) as date
,[ICB ODS code]
,[ICS Name (if applicable)]
,[Partner Organisation connected to ShCR?]
,[Partner Organisation plans to be connected by March 2023?]
,[ODS community Code] as org_ods_code
,[community Name] as org_name

FROM
shcr_partners_community_data_month_count

UNION ALL 
SELECT
'Other' as org_type

,CAST([For Month] as DATE) as date
,[ICB ODS code]
,[ICS Name (if applicable)]
,[Partner Organisation connected to ShCR?]
,[Partner Organisation plans to be connected by March 2023?]
,[ODS other Code] as org_ods_code
,[other Name] as org_name

FROM
shcr_partners_other_data_month_count
