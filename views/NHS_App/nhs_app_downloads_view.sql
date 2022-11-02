CREATE OR ALTER VIEW nhs_app_downloads_view AS 
SELECT
a.Date
,CAST(a.[No. of downloads per week] as INT) as M0160_apple_downloads
,CAST(b.[No. of downloads per week] as INT) as M0160_google_downloads

FROM
[dbo].[nhs_app_downloads_week_count] a

INNER JOIN
[dbo].[nhs_app_downloads_month_count] b
ON
a.Date=b.Date
