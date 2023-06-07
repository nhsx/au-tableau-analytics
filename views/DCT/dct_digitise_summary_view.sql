CREATE OR ALTER VIEW dct_digitise_summary as 

with 

-- Join dim date with list of ICBs to get full list for every date
icbs as (
    SELECT 
      DISTINCT [GP_STP_Code]
      
  FROM [dbo].[odscodes_gp_mapping]
)
, _DimDate as (
SELECT
a.[Date]
,b.GP_STP_Code
FROM
DimDate a 
left join 
icbs b
ON
1=1
)

-- Virtual Ward
,VW as (

    SELECT
    ICB_CODE
    ,[STP Population)] as STP_population
    ,[Run Date]
    ,[Virtual Ward Capacity at stp level]
    FROM
    virtual_ward_biweekly_current_capacity_and_prop
)

-- EPR 
,EPR1 as (
SELECT 
    [Bi_Weekly_Report_Date]
    ,STP_Code
    ,count(*) as trust_count
    ,SUM(
        CASE WHEN EPR_Group IN ('Group 2', 'Group 3') THEN 1
        ELSE 0
        END
    ) as count_EPR

FROM
    dct_epr
group by 
    [Bi_Weekly_Report_Date]
    ,STP_Code
    
)

-- DSPT 
, DSPT as (
SELECT 
    report_date
    ,ICB_CODE
    ,SUM(
        CASE
        WHEN dspt_status in (
            '21/22 Standards Exceeded'
            ,'21/22 Standards Met'
            ,'21/22 Standards Exceeded.'
            ,'21/22 Standards Met.'
        ) 
        THEN number_of_orgs_with_status
        ELSE 0
        END
    ) as orgs_met
    ,MAX(total_orgs) as total_orgs

FROM [dbo].[dct_dspt]
GROUP BY
    report_date
    ,ICB_CODE
)

-- FINAL SELECT

SELECT
    dd.date as __date
    ,dd.GP_STP_Code

    ,a.STP_population as M398_STP_population
    ,a.[Virtual Ward Capacity at stp level] as M398_Virtual_Ward_Capacity_at_stp_level

    ,b.count_EPR as M390_count_EPR
    ,b.trust_count as M390_trust_count

    ,c.orgs_met as M394_orgs_met
    ,c.total_orgs as M394_total_orgs

FROM
    _DimDate dd

LEFT JOIN
    VW a 
ON
    dd.[Date]=a.[Run Date]
    and dd.GP_STP_Code=a.ICB_CODE

LEFT JOIN
    EPR1 b
ON
    dd.[Date]=b.[Bi_Weekly_Report_Date]
    and dd.GP_STP_Code=b.STP_Code

LEFT JOIN
    DSPT c
ON
    dd.[Date]=c.report_date
    and dd.GP_STP_Code=c.ICB_CODE

WHERE
CONCAT(

    a.[Virtual Ward Capacity at stp level]
    ,b.count_EPR
    ,b.trust_count
    ,c.orgs_met
    ,c.total_orgs

)
!= ''