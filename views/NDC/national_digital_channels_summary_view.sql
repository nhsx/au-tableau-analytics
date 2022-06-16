CREATE OR ALTER VIEW national_digital_channels_summary_view as 

with M220 as (
SELECT
   [Unique ID] AS [ndc_Unique_ID]
   ,[Date] AS [ndc_Date]
   ,'M220' as metric_name
   ,cast([Number of users with an NHS App registration] as float)/cast([Adult population] as float) as metric_value
FROM
   ndc_dashboard_nhsapp_registered_population_month_prop A
)
,M221 as (
SELECT
   [Unique ID] AS [ndc_Unique_ID]
   ,[Date] AS [ndc_Date]
   ,'M221' as metric_name
   ,cast([Number of unique NHS App logins] as float)/CAST([Number of users with an NHS App registration] as float) as metric_value

FROM
   ndc_dashboard_user_base_loggingin_month_prop B


)
,M223 as (
select 
   [Unique ID] AS [ndc_Unique_ID]
   ,[Date] AS [ndc_Date]
   ,'M223' as metric_name
   -- ,[Number of primary care appointments managed online]
   -- ,[Number of primary care appointments]
   ,CAST(C.[Number of primary care appointments managed online] as float) /CAST(NULLIF([Number of primary care appointments],0) as float) as metric_value
from

   ndc_dashboard_primary_care_appts_managed_online_month_prop C

)

,M224 as (
select 
   [Unique ID] AS [ndc_Unique_ID]
   ,[Date] AS [ndc_Date]
   ,'M224' as metric_name
    ,cast([Number of repeat prescriptions ordered via the NHS App] as float) as metric_value
from

   ndc_dashboard_nhsapp_repeat_prescriptions_ordered_month_count D

)

,M227 as (
select 
   [Unique ID] AS [ndc_Unique_ID]
   ,[Date] AS [ndc_Date]
   ,'M227' as metric_name
    ,cast([Number of primary care appointments managed via the NHS App] as float) as metric_value
from

   ndc_dashboard_nhsapp_primary_appointments_managed_month_count E

)

,M228 as (
select 
   [Unique ID] AS [ndc_Unique_ID]
   ,[Date] AS [ndc_Date]
   ,'M228' as metric_name
    ,cast([Number of views of conditions information] as float) as M228
from

   ndc_dashboard_nhsuk_view_of_conditions_month_count F

)
,M230 as (
select 
   [Unique ID] AS [ndc_Unique_ID]
   ,[Date] AS [ndc_Date]
   ,'M230' as metric_name
    ,cast([Number of gp record views] as float) as M230
from

   ndc_dashboard_gp_record_view_month_count G

)
,final as (
select * from M220
UNION all 
select * from M221
UNION all 
select * from M223
UNION all 
select * from M224
UNION all 
select * from M227
UNION all 
select * from M228
UNION all 
select * from M230
)

select 
    a.[ndc_Date] as ndc_date
    ,b.[ndc_Date] as previous_date
    ,a.metric_name
    ,a.metric_value
    ,b.metric_value as p_value

from
    final as a
left join 
    final as b
on
    dateadd(month, -1,a.[ndc_date])=b.[ndc_date]
and
    a.metric_name=b.metric_name
