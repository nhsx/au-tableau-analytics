CREATE OR ALTER VIEW nhs_app_totals_view as 
SELECT
    a.*
    ,b.M0149_number_of_logins
    ,b.M0152_number_of_repeat_prescriptions
    ,b.M0150_number_of_primary_care_appointments_booked
    ,b.M0151_number_of_primary_care_appointments_cancelled
    ,b.M0159_number_of_organ_donation_lookup
    ,b.M0156_number_of_organ_donation_registrations
    ,b.M0158_number_of_organ_donation_updates
    ,b.M0157_number_of_organ_donation_withdrawals
    ,b.M0153_number_of_record_views
    ,b.M0154_number_of_summary_care_record_views
    ,b.M0155_number_of_detail_coded_record_views

FROM
    [dbo].[nhs_app_uptake_totals] a
LEFT JOIN
    [dbo].[nhs_app_usage_totals] b
on
    a.uptake_practice_code=b.usage_practice_code