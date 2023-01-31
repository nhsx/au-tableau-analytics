CREATE OR ALTER VIEW nhs_dscr_view AS 
SELECT

DATEFROMPARTS(RIGHT(month_year, 4),LEFT(month_year, CHARINDEX('-',month_year)-1),1) as _date
,*


FROM
[dbo].[dscr_all_variables_month_count] a

--shapefile_stp_boundaries_snapshot