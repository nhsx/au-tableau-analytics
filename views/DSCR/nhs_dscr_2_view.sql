CREATE OR ALTER VIEW nhs_dscr_2_view AS 
SELECT

DATEFROMPARTS(RIGHT(month_year, 4),LEFT(month_year, 1),1) as _date
,*


FROM
[dbo].[dbrks_dscr_all_variables_collated_count] a

--shapefile_stp_boundaries_snapshot