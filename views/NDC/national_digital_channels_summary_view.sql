CREATE OR ALTER VIEW national_digital_channels_summary_view as 

with M220 as (
SELECT
   [Date] AS [ndc_Date]
   ,'M220' as metric_name
   ,cast([Number of users with an NHS App registration] as float)/cast([Adult population] as float) as metric_value
FROM
   ndc_dashboard_nhsapp_registered_population_month_prop 
)

,M221 as (
SELECT
   [Date] AS [ndc_Date]
   ,'M221' as metric_name
   ,cast([Number of unique NHS App logins] as float)/CAST([Number of users with an NHS App registration] as float) as metric_value

FROM
   ndc_dashboard_user_base_loggingin_month_prop 
)

,M222 as (
select 
   [Date] AS [ndc_Date]
   ,'M222' as metric_name
   ,CAST([Proportion of repeat prescriptions ordered online] as float) as metric_value
from

   ndc_dashboard_repeat_prescriptions_online_month_prop 
)

,M223 as (
select 
   [Date] AS [ndc_Date]
   ,'M223' as metric_name
   -- ,[Number of primary care appointments managed online]
   -- ,[Number of primary care appointments]
   ,CAST([Number of primary care appointments managed online] as float) /CAST(NULLIF([Number of primary care appointments],0) as float) as metric_value
from

   ndc_dashboard_primary_care_appts_managed_online_month_prop 
)

,M224 as (
select 
   [Date] AS [ndc_Date]
   ,'M224' as metric_name
    ,cast([Number of repeat prescriptions ordered via the NHS App] as float) as metric_value
from

   ndc_dashboard_nhsapp_repeat_prescriptions_ordered_month_count 
)

,M225 as (
select 
   [Date] AS [ndc_Date]
   ,'M225' as metric_name
   ,CAST([Number of referrals managed via the NHS App] as float)  as metric_value
from

   ndc_dashboard_nhsapp_refferrals_managed_month_count 
)

,M226 as (
select 
   [Date] AS [ndc_Date]
   ,'M226' as metric_name
   ,CAST([Number of secondary care appointments made via the NHS App] as float) as metric_value
from

   ndc_dashboard_nhsapp_secondary_care_appointments_month_count

)

,M227 as (
select 
   [Date] AS [ndc_Date]
   ,'M227' as metric_name
    ,cast([Number of primary care appointments managed via the NHS App] as float) as metric_value
from

   ndc_dashboard_nhsapp_primary_appointments_managed_month_count E
)

,M228 as (
select 
   [Date] AS [ndc_Date]
   ,'M228' as metric_name
    ,cast([Number of views of conditions information] as float) as M228
from

   ndc_dashboard_nhsuk_view_of_conditions_month_count F
)

,M229 as (
select 
   [Date] AS [ndc_Date]
   ,'M229' as metric_name
   ,CAST([Number of find a service uses on NHS.uk] as float) as metric_value
from

   ndc_dashboard_nhsuk_findservice_uses_month_count
)

,M230 as (
select 
   [Date] AS [ndc_Date]
   ,'M230' as metric_name
    ,cast([Number of gp record views] as float) as M230
from

   ndc_dashboard_gp_record_view_month_count G
)

,M231 as (
select 
   [Date] AS [ndc_Date]
   ,'M231' as metric_name
   ,CAST([Number of test result views via the NHS App] as float) as metric_value
from

   ndc_dashboard_nhsapp_test_result_views_month_count
)
,hlts as (
select * from ndc_insights_highlights

)

,final as (
select * from M220
UNION all 
select * from M221
UNION all 
select * from M222
UNION all 
select * from M223
UNION all 
select * from M224
UNION all 
select * from M225
UNION all 
select * from M226
UNION all 
select * from M227
UNION all 
select * from M228
UNION all 
select * from M229
UNION all 
select * from M230
UNION all 
select * from M231
)

select 
    a.[ndc_Date] as ndc_date
    ,b.[ndc_Date] as previous_date
    ,a.metric_name
    ,a.metric_value
    ,b.metric_value as p_value
    ,hlts.highlight

from
    final as a
left join 
    final as b
on
    dateadd(month, -1,a.[ndc_date])=b.[ndc_date]
and
    a.metric_name=b.metric_name
left JOIN
   hlts
ON
   a.ndc_date=hlts.ndc_date