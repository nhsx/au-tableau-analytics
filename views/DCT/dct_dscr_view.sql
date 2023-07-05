
CREATE OR ALTER VIEW dct_dscr_view as 

SELECT
*
,GETDATE() as date_updated

FROM
dscr_all_variables_cum_count