CREATE VIEW dfpc_dspt_gp_practice_historical_view AS
SELECT 

    A.[Unique ID]  AS [dfpc_DSPT_historical_Unique ID] 
    ,A.[Date]  AS [dfpc_DSPT_historical_Date]
    ,A.[Practice code] AS [dfpc_DSPT_historical_Practice code] 
    ,A.[Financial year] AS [dfpc_DSPT_historical_financial_year] 
    ,A.[Number of GP practices that meet or exceed the DSPT standard (historical)] AS [M76A_Number of GP practices that meet or exceed the DSPT standard (historical)]
    ,B.[Number of GP practices that exceed the DSPT standard (historical)] AS [M77A_Number of GP practices that exceed the DSPT standard (historical)]
    ,C.[Number of GP practices that have not submitted a DSPT assessment (historical)] as [M78A_Number of GP practices that have not submitted a DSPT assessment (historical)]




FROM    
    [dbo].[dspt_gp_practices_standards_meet_exceed_year_count_prop] A

LEFT JOIN
    [dbo].[dspt_gp_practices_standards_exceed_year_count_prop] B

ON

    A.[Date]  = B.[Date]
    AND A.[Practice code]  = B.[Practice code]
    AND A.[Financial year] = B.[Financial year]

LEFT JOIN
    [dbo].[dspt_gp_practices_standards_nosubmission_year_count_prop] C

ON

    A.[Date]  = C.[Date]
    AND A.[Practice code]  = C.[Practice code]
    AND A.[Financial year] = C.[Financial year]

ORDER BY [dfpc_DSPT_historical_Unique ID] OFFSET 0 ROWS