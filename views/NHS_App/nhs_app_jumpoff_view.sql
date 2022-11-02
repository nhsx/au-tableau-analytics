CREATE OR ALTER VIEW nhs_app_jumpoff_view as

SELECT 
Provider
,Date
,[Practice code]
,'Covid Pass' as jumpoff_measure
,[Number of Covid Pass Jump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_covid_pass_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Covid Pass P5' AS jumpoff_measure
,[Number of Covid Pass P5 Jump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_covid_pass_p5_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Covid Vaccine Record Views' AS jumpoff_measure
,[Number of Covid Vaccine Record ViewJump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_covid_vaccine_record_view_day_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,JumpOff as jumpoff_measure
,[Number of Online Consultation Jump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_econsult_day_count

UNION ALL

SELECT

Provider
,Date
,[Practice code]
,'Admin' as jumpoff_measure
,[Number of Engage admin] as jumpoff_value

FROM
nhs_app_jumpoff_engage_admin_day_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Medical' as jumpoff_measure
,[Number of Engage - medicalJump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_engage_medical_day_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Messages' as jumpoff_measure
,[Number of Engage Messages] as jumpoff_value

FROM
nhs_app_jumpoff_engage_messages_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Manage Your Referral' as jumpoff_measure
,[Number of Manage Your Referral Jump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_esr_manageYourReferra_day_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Appointments' as jumpoff_measure
,[Number of PKB - appointments Jump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_pkb_appointments_day_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Care Plans' as jumpoff_measure
,[Number of PKB carePlans] as jumpoff_value

FROM
nhs_app_jumpoff_PKB_carePlans_day_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Health Trackers' as jumpoff_measure
,[Number of Health Trackers Jump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_pkb_healthTrackers_day_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Medicine' as jumpoff_measure
,[Number of Medicine Jump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_pkb_medicines_day_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Messages' as jumpoff_measure
,[Number of PKB - messagesJump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_PKB_messages_day_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Shared links' as jumpoff_measure
,[Number of PKB sharedlinks] as jumpoff_value

FROM
nhs_app_jumpoff_pkb_sharedlinks_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Test results' as jumpoff_measure
,[Number of PKB - test results Jump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_pkb_test_results_day_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Account Admin' as jumpoff_measure
,[Number of Substrakt - accountAdminJump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_substrakt_accountAdmin_day_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Messages' as jumpoff_measure
,[Number of Substrakt Messages] as jumpoff_value

FROM
nhs_app_jumpoff_substrakt_messages_day_count

UNION ALL

SELECT
Provider
,Date
,[Practice code]
,'Patient Participation Group' as jumpoff_measure
,[Number of Substrakt Patient Participation Group Jump Off Clicks] as jumpoff_value

FROM
nhs_app_jumpoff_substrakt_patientparticipationgroup_day_count