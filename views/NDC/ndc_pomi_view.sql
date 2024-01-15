CREATE OR ALTER VIEW ndc_pomi_view as 

with m223 as (

SELECT 
    [Date]
    ,[Number of GP appointments managed online]
FROM 
    [dbo].[pomi_appointments_month_count]
)

,m246 as (
SELECT
    Date
    ,[Number of patients enabled to manage appointments online]
FROM
    pomi_patient_enabled_month_prop
)

,m222 as (
SELECT
    Date
    ,SUM([Number of repeat prescription transactions]) as [Number of repeat prescription transactions]
FROM
    pomi_repeat_prescription_month_count
GROUP BY
    Date
)

, m252 as (
SELECT
    Date
    ,SUM([Number of detailed coded record views]) AS [Number of detailed coded record views]
FROM
    pomi_record_views_month_count
GROUP BY
    Date
)

SELECT
    DATEADD(month, -1,DATEADD(day, 1, a.[Date])) as Date
    ,a.[Number of GP appointments managed online]
    ,b.[Number of patients enabled to manage appointments online]
    ,c.[Number of repeat prescription transactions]
    ,d.[Number of detailed coded record views]

FROM 
    m223 a

LEFT JOIN
    m246 b
ON
    a.Date=b.[Date]

LEFT JOIN
    m222 c
ON
    a.Date=c.[Date]

LEFT JOIN
    m252 d
ON
    a.Date=d.[Date]
