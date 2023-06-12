CREATE OR ALTER VIEW dct_virtual_ward as 
SELECT
ICB_CODE
,[STP Population)]
,[Virtual Ward Capacity at stp level]
,[VW Capacity (per 100,000 )]
,CAST([Run Date] as datetime) as [Run Date]
,GETDATE() as date_updated
FROM
-- virtual_ward_biweekly_current_capacity_and_prop a 
virtual_ward_biweekly_capacity_and_prop a