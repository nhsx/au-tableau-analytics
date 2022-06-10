CREATE VIEW national_digital_channels_view AS 
SELECT
A.[Unique ID] AS [ndc_Unique_ID],
A.[Date] AS [ndc_Date],
A.[Number of users with an NHS App registration] AS [M220_NRM_Number_of_users_with_an_NHS_App_registration],
A.[Adult population] AS [M220_DENOM_Adult_population],
B.[Number of unique NHS App logins] AS [M221_NRM_Number_of_unique_NHS_App_logins],
B.[Number of users with an NHS App registration] AS [M221_DENOM_Number_of_users_with_an_NHS_App_registration],
C.[Number of primary care appointments] AS [M223_NRM_Number of primary care appointments],
C.[Number of primary care appointments managed online] AS [M223_DENOM_Number_of_primary_care_appointments_managed_online],
D.[Number of repeat prescriptions ordered via the NHS App] AS [M224_Number_of_repeat_prescriptions_ordered_via_the_NHS_App],
E.[Number of primary care appointments managed via the NHS App] AS [M227_Number of primary care appointments managed via the NHS App],
F.[Number of views of conditions information] AS [M228_Number_of_views_of_conditions_information],
G.[Number of gp record views] AS [M230_Number_of_gp_record_views],
H.[Number of Covid_Vaccine_Record_View] AS [M244_Number_of_Covid_Vaccine_Record_View],
I.[Population registered with NHS App] AS [M245_Population_registered_with_NHS_App],
J.[Number of all time NHS App registered users] AS [M246_Number_of_all_time_NHS_App_registered_users],
J.[Total number of patients registered to use an patient online transactional services] AS [M246_Total_number_of_patients_registered_to_use_an_patient_online_transactional_services],
J.[Number of patients registered with an other patient online service] AS [M246_Number_of_patients_registered_with_an_other_patient_online_service],
K.[Total number of patients registered to use an patient online transactional services] AS [M247_Total_number_of_patients_registered_to_use_an_patient_online_transactional_services],
K.[Adult population] AS [M247_Adult_population],
K.[Adult population not registered to use an patient online transactional services] AS [M247_Adult_population_not_registered_to_use_an_patient_online_transactional_services],
L.[Total app logins] AS [M253_Total_app_logins],
M.[Number of confirmed accounts NHS login] AS [M255_Number_of_confirmed_accounts_NHS_login],
N.[Number of Detail Coded Record Views] AS [M257_NRM_Number_of_Detail_Coded_Record_Views],
N.[Number of all Record Views] AS [M257_DENOM_Number_of_all_Record Views],
O.[Number of NHS App organ donation registrations] AS [M258_Number_of_NHS_App_organ_donation_registrations],
P.[Number of all covid vaccination bookings] AS [M262_Number_of_all_covid_vaccination_bookings],
Q.[Number of NHS.UK vaccination bookings 1st dose] AS [M264_Number_of_NHS.UK_vaccination_bookings_1st_dose],
R.[Number of NHS.UK vaccination bookings 2nd dose] AS [M265_Number_of_NHS.UK_vaccination_bookings_2nd_dose],
S.[Number of NHS.UK vaccination bookings booster] AS [M266_Number_of_NHS.UK_vaccination_bookings_booster],
T.[Number of NHS.UK vaccination bookings 3rd dose] AS [M267_Number_of_NHS.UK_vaccination_bookings_3rd_dose]
FROM
ndc_dashboard_nhsapp_registered_population_month_prop A
LEFT JOIN
ndc_dashboard_user_base_loggingin_month_prop B
ON A.[Date] = B.[Date]
LEFT JOIN
ndc_dashboard_primary_care_appts_managed_online_month_prop C
ON 
A.[Date] = C.[Date]
LEFT JOIN
ndc_dashboard_nhsapp_repeat_prescriptions_ordered_month_count D
ON 
A.[Date] = D.[Date]
LEFT JOIN 
ndc_dashboard_nhsapp_primary_appointments_managed_month_count E
ON 
A.[Date] = E.[Date]
LEFT JOIN
ndc_dashboard_nhsuk_view_of_conditions_month_count F
ON 
A.[Date] = F.[Date]
LEFT JOIN
ndc_dashboard_gp_record_view_month_count G
ON 
A.[Date] = G.[Date]
LEFT JOIN
ndc_transactions_covid_vaccine_record_views_month_count H
ON 
A.[Date] = H.[Date]
LEFT JOIN
ndc_channel_shift_population_registered_with_nhs_app_month_count I
ON 
A.[Date] = I.[Date]
LEFT JOIN
ndc_channel_shift_population_registered_other_pol_service_month_count J
ON 
A.[Date] = J.[Date]
LEFT JOIN
ndc_channel_shift_adult_population_offline_month_count K
ON 
A.[Date] = K.[Date]
LEFT JOIN
ndc_access_total_app_logins_month_count L
ON 
A.[Date] = L.[Date]
LEFT JOIN
ndc_access_nhslogin_confirmed_accounts_month_count M
ON 
A.[Date] = M.[Date]
LEFT JOIN
ndc_transactions_detail_coded_record_views_month_prop N
ON 
A.[Date] = N.[Date]
LEFT JOIN
ndc_transaction_nhsapp_organ_donation_registration_month_count O
ON 
A.[Date] = O.[Date]
LEFT JOIN
ndc_vaccine_nhsuk_covid_vaccination_appointments_booked_month_count P
ON 
A.[Date] = P.[Date]
LEFT JOIN
ndc_vaccine_nhsuk_covid_vaccination_booking_first_dose_month_count Q
ON 
A.[Date] = Q.[Date]
LEFT JOIN
ndc_vaccine_nhsuk_covid_vaccination_booking_second_dose_month_count R
ON 
A.[Date] = R.[Date]
LEFT JOIN
ndc_vaccine_nhsuk_covid_vaccination_booking_booster_month_count S
ON 
A.[Date] = S.[Date]
LEFT JOIN
ndc_vaccine_nhsuk_covid_vaccination_booking_third_dose_month_count T
ON 
A.[Date] = T.[Date]
















