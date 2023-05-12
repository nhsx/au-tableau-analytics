CREATE OR ALTER VIEW dct_dscr_finance_tracker as
SELECT 
    * 
    ,DATEFROMPARTS(
    SUBSTRING([Quartly Timeperiod], 4, 4) 
    -- ,SUBSTRING([Quartly Timeperiod], 2, 1) as q
    ,CASE 
    WHEN SUBSTRING([Quartly Timeperiod], 2, 1) =1 THEN 1
    WHEN SUBSTRING([Quartly Timeperiod], 2, 1) =2 THEN 4
    WHEN SUBSTRING([Quartly Timeperiod], 2, 1) =3 THEN 7
    WHEN SUBSTRING([Quartly Timeperiod], 2, 1) =4 THEN 10
    END
    ,1) as full_date

FROM
dscr_finance_tracker