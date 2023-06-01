CREATE OR ALTER VIEW dct_clinical_trials AS
SELECT 
    *
    ,GETDATE() as date_updated

FROM
    number_of_clinical_trial_researcher_month_count
