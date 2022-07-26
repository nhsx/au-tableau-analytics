CREATE OR ALTER VIEW dfpc_nhs_app_M146_view as

select 
    DATEADD(DAY, 1, EOMONTH(Date, -1)) as dfpc_month_date
        ,[Practice code] as dfpc_practice_code
    ,SUM([Number of P9 NHS app registrations]) as M0146_number_of_p9_app_registrations

FROM nhs_app_uptake_p9_registrations_day_count
GROUP BY
    DATEADD(DAY, 1, EOMONTH(Date, -1))
    ,[Practice code]   