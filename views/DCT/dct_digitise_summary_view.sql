CREATE OR ALTER VIEW dct_digitise_summary as 
SELECT

coalesce([run Date], _date) as __date

,a.*
, b.*
FROM
virtual_ward_biweekly_current_capacity_and_prop a 

full JOIN
nhs_dscr_view b
ON
a.[Run Date]=b._date