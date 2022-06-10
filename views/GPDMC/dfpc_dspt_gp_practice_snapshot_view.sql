CREATE VIEW dfpc_dspt_gp_practice_snapshot_view AS
SELECT 

    A.[Unique ID]  AS [dfpc_DSPT_snapshot_Unique ID] 
    ,A.[Date]  AS [dfpc_DSPT_snapshot_Date]
    ,A.[Practice code] AS [dfpc_DSPT_snapshot_Practice code] 
    ,A.[Financial year] AS [dfpc_DSPT_snapshot_financial_year] 
    ,A.[Number of GP practices that meet or exceed the DSPT standard (snapshot)] AS [M76AB_Number of GP practices that meet or exceed the DSPT standard (snapshot)]
    ,B.[Number of GP practices that exceed the DSPT standard (snapshot)] AS [M77B_Number of GP practices that exceed the DSPT standard (snapshot)]
    ,C.[Number of GP practices that have not submitted a DSPT assessment (snapshot)] as [M78B_Number of GP practices that have not submitted a DSPT assessment (snapshot)]




FROM    
    [dbo].[dspt_gp_practices_standards_meet_exceed_month_count_prop] A

LEFT JOIN
    [dbo].[dspt_gp_practices_standards_exceed_month_count_prop] B

ON

    A.[Date]  = B.[Date]
    AND A.[Practice code]  = B.[Practice code]
    AND A.[Financial year] = B.[Financial year]

LEFT JOIN
    [dbo].[dspt_gp_practices_standards_nosubmission_month_count_prop] C

ON

    A.[Date]  = C.[Date]
    AND A.[Practice code]  = C.[Practice code]
    AND A.[Financial year] = C.[Financial year]

ORDER BY [dfpc_DSPT_snapshot_Unique ID] OFFSET 0 ROWS