CREATE OR ALTER VIEW national_digital_channels_view AS 
SELECT

cast(a.[Date] as date) AS [ndc_Date],
all_time_nhs_app_registered_users AS [M220_NRM_Number_of_users_with_an_NHS_App_registration],
47996895 AS [M220_DENOM_Adult_population],
unique_logins_nhs_app AS [M221_NRM_Number_of_unique_NHS_App_logins],
all_time_nhs_app_registered_users AS [M221_DENOM_Number_of_users_with_an_NHS_App_registration],
primary_care_appointments AS [M223_DENOM_Number of primary care appointments],
b.[Number of GP appointments managed online] AS [M223_NRM_Number_of_primary_care_appointments_managed_online],
Prescriptions AS [M224_Number_of_repeat_prescriptions_ordered_via_the_NHS_App],
UsersAppointmentsBooked + UsersAppointmentsCancelled AS [M227_Number of primary care appointments managed via the NHS App],
conditions_nhsuk AS [M228_Number_of_views_of_conditions_information],
RecordViews AS [M230_Number_of_gp_record_views],
Covid_Vaccine_Record_View AS [M244_Number_of_Covid_Vaccine_Record_View],
all_time_nhs_app_registered_users AS [M245_Population_registered_with_NHS_App],
all_time_nhs_app_registered_users AS [M246_Number_of_all_time_NHS_App_registered_users],
--b.[Number of patients enabled to manage appointments online] AS [M246_Total_number_of_patients_registered_to_use_an_patient_online_transactional_services],
--b.[Number of patients enabled to manage appointments online] - all_time_nhs_app_registered_users AS [M246_Number_of_patients_registered_with_an_other_patient_online_service],
--b.[Number of patients enabled to manage appointments online] AS [M247_Total_number_of_patients_registered_to_use_an_patient_online_transactional_services],
--44715443 AS [M247_Adult_population],
--44715443 - b.[Number of patients enabled to manage appointments online] AS [M247_Adult_population_not_registered_to_use_an_patient_online_transactional_services],
Logins AS [M253_Total_app_logins],
confirmed_accounts_nhs_login AS [M255_Number_of_confirmed_accounts_NHS_login],
RecordViewsDCR AS [M257_NRM_Number_of_Detail_Coded_Record_Views],
RecordViews AS [M257_DENOM_Number_of_all_Record Views],
UsersODRegistrations AS [M258_Number_of_NHS_App_organ_donation_registrations],
total_dose_1 + total_dose_2 + dose_3 + booster AS [M262_Number_of_all_covid_vaccination_bookings],
total_dose_1 AS [M264_Number_of_NHS.UK_vaccination_bookings_1st_dose],
total_dose_2 AS [M265_Number_of_NHS.UK_vaccination_bookings_2nd_dose],
booster AS [M266_Number_of_NHS.UK_vaccination_bookings_booster],
dose_3 AS [M267_Number_of_NHS.UK_vaccination_bookings_3rd_dose],

manageYourReferral as [M225_Number_of_referrals_managed_via_the_NHS_App]
,PKB_appointments as [M226_Number_of_secondary_care_appointments_made_via_the_NHS_App]
,[nhs-services_nhsuk] as [M229_Number_of_find_a_service_uses_on_NHS.uk]
,PKB_testResults as [M231_Number_of_test_result_views_via_the_NHS_App]
,Covid_Pass + Covid_Pass_P5 as [M232_Number_of_NHS_app_covid_pass_uses]
,Substrakt_accountAdmin
+ Substrakt_patientParticipationGroups
+ PKB_carePlans
+ PKB_healthTrackers
+ PKB_messages
+ PKB_recordSharing
+ PKB_sharedLinks
+ PKB_testResults
+ RecordViews
+ Covid_Vaccine_Record_View
+ UsersODRegistrations
+ Substrakt_messages
as [M233_Number_of_record_information_and_results_views_on_the_NHS_App]
,estimated_visits_nhs_uk as [M256_Number_of_estimated_visits_to_NHS_UK]
,PKB_appointments + manageYourReferral as [M235_Number_of_appointments_managed_on_the_NHS_App]
,(accuRx_medical
+ accuRx_messages
+ ISNULL([eConsult Consultation],0)
+ Engage_admin
+ Engage_medical
+ Engage_messages
+ [PATCHS - admin]
+ [PATCHS - medical])
 as [M236_Number_of_messages_and_consultations_on_the_NHS_App]

,b.[Number of repeat prescription transactions] / nullif(eps_repeat_prescriptions,0) as [M222_Proportion_of_repeat_prescriptions_ordered_online]
,prescriptions + PKB_medicines as [M234_Number_of_prescriptions_managed_on_the_NHS_App]
,0 as [M238_Number_of_views_of_other_information]
,[live-well_nhsuk] as [M239_Number_of_views_of_live_well_information]
,[book-a-coronavirus-vaccination_nhsuk] as [M241_Number_of_views_of_book_a_covid19_vaccination]
,medicines_nhsuk as [M242_Number_of_views_of_medicines_information]
,[nhs-app_nhsuk] as [M243_Number_of_views_of_NHS_app_online_information]

,b.[Number of repeat prescription transactions] - prescriptions as [M249_Number_of_repeat_prescriptions_through_an_other_POL_service]
,eps_repeat_prescriptions - b.[Number of repeat prescription transactions] as [M250_Number_of_offline_repeat_prescriptions]

,RecordViewsDCR as [M251_Number_of_DCR_views_through_the_NHS_app]
,b.[Number of detailed coded record views] - RecordViewsDCR as [M252_DCR_views_through_other_POL_service]
,PKB_messages + Substrakt_messages as [M260_Number_of_Secondary_Care_Messages_sent_via_NHS_App]
,services_nhsuk as [MXXX_services]
,covid_pass_transactions as [M269_Number_of_Covid_Pass_Transactions_Undertaken]
,bporResearch as M270_Research
,wayfinder as [M271_Number_of_Wayfinder_Clicks]
,wayfinder_views as [M271_Number_of_Wayfinder_Views]
,c.[Messages Sent Notification] as M273_Messages_Sent_Notification
,c.[Messages Sent No Notification] as M273_Messages_Sent_No_Notification
,c.[Messages Read Notification] as M273_Messages_Read_Notification
,c.[Messages Read No Notification] as M273_Messages_Read_No_Notification
,ISNULL(nbs, 0)  as M274_Number_of_NBS_jumpoff_clicks_via_the_NHS_App
,ISNULL(register_gp,0) as M275_Number_of_GP_Registration_jumpoff_clicks_via_the_NHS_App
,ISNULL(pregnancy_nhsuk,0) as MYYY_pregnancy_nhsuk
,ISNULL([mental-health_nhsuk],0) as MZZZ_mental_health_nhsuk
,ISNULL([service-search_nhsuk],0) as MAAA_service_search_nhsuk
,covid_winter as MBBB_Number_of_NHS_UK_vaccination_bookings_COVID_Autumn_Winter
,flu_winter as MCCC_Number_of_NHS_UK_vaccination_bookings_Flu_Autumn_Winter

FROM
ndc_actuals_all a

LEFT JOIN
ndc_pomi_view b
ON
a.Date=b.Date

LEFT JOIN
ndc_messages_nhsapp_messages_read c
ON
a.[Date]=c.[Date]