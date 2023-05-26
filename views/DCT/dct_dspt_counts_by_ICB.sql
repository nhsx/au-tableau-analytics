CREATE OR ALTER VIEW dct_dspt_counts_by_ICB as
SELECT
    org_type
    ,report_date
    ,ICB_CODE
    ,MAX(total_orgs) as total_orgs
FROM
    dct_dspt
group by 
    org_type
    ,report_date
    ,ICB_CODE
