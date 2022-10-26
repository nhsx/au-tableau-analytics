CREATE OR ALTER VIEW national_digital_channels_view AS 
SELECT
cast(A.[Date] as date) AS [ndc_Date],
A.[Number of users with an NHS App registration] AS [M220_NRM_Number_of_users_with_an_NHS_App_registration],
A.[Adult population] AS [M220_DENOM_Adult_population],
B.[Number of unique NHS App logins] AS [M221_NRM_Number_of_unique_NHS_App_logins],
B.[Number of users with an NHS App registration] AS [M221_DENOM_Number_of_users_with_an_NHS_App_registration],
C.[Number of primary care appointments] AS [M223_DENOM_Number of primary care appointments],
C.[Number of primary care appointments managed online] AS [M223_NRM_Number_of_primary_care_appointments_managed_online],
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

,u.[Number of referrals managed via the NHS App] as [M225_Number_of_referrals_managed_via_the_NHS_App]
,v.[Number of secondary care appointments made via the NHS App] as [M226_Number_of_secondary_care_appointments_made_via_the_NHS_App]
,w.[Number of find a service uses on NHS.uk] as [M229_Number_of_find_a_service_uses_on_NHS.uk]
,x.[Number of test result views via the NHS App] as [M231_Number_of_test_result_views_via_the_NHS_App]
,y.[Number of NHS app covid pass uses] as [M232_Number_of_NHS_app_covid_pass_uses]
,z.[Number of record, information and results views on the NHS App] as [M233_Number_of_record_information_and_results_views_on_the_NHS_App]
,aa.[Number of estimated visits to NHS UK] as [M256_Number_of_estimated_visits_to_NHS_UK]
,ab.[Number of appointments managed on the NHS App] as [M235_Number_of_appointments_managed_on_the_NHS_App]
,ac.[OLCs on the NHS App] as [M236_Number_of_messages_and_consultations_on_the_NHS_App]

,ad.[Proportion of repeat prescriptions ordered online] as [M222_Proportion_of_repeat_prescriptions_ordered_online]
,ae.[Number of prescriptions managed on the NHS App] as [M234_Number_of_prescriptions_managed_on_the_NHS_App]
,af.[Number of views of other information] as [M238_Number_of_views_of_other_information]
,ag.[Number of views of live well information] as [M239_Number_of_views_of_live_well_information]
,ah.[Number of views of book a covid19 vaccination] as [M241_Number_of_views_of_book_a_covid19_vaccination]
,ai.[Number of views of medicines information] as [M242_Number_of_views_of_medicines_information]
,aj.[Number of views of NHS app online information] as [M243_Number_of_views_of_NHS_app_online_information]
,ak.[Number of repeat prescriptions through an other POL service] as [M249_Number_of_repeat_prescriptions_through_an_other_POL_service]
,al.[Number of offline repeat prescriptions] as [M250_Number_of_offline_repeat_prescriptions]
,am.[Number of DCR views through the NHS app] as [M251_Number_of_DCR_views_through_the_NHS_app]
,an.[DCR views through other POL service] as [M252_DCR_views_through_other_POL_service]
,ao.[Number of Secondary Care Messages sent via NHS App] as [M260_Number_of_Secondary_Care_Messages_sent_via_NHS_App]
,ap.[services] as [MXXX_services]
,aq.[Number of Covid Pass Transactions Undertaken] as [M269_Number_of_Covid_Pass_Transactions_Undertaken]

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

LEFT JOIN
ndc_dashboard_nhsapp_refferrals_managed_month_count	 	u
ON
a.[Date]=u.[Date]
LEFT JOIN
ndc_dashboard_nhsapp_secondary_care_appointments_month_count	 	v
ON
a.[Date]=v.[Date]
LEFT JOIN
ndc_dashboard_nhsuk_findservice_uses_month_count	 	w
ON
a.[Date]=w.[Date]
LEFT JOIN
ndc_dashboard_nhsapp_test_result_views_month_count	 	x
ON
a.[Date]=x.[Date]
LEFT JOIN
ndc_transactions_covid_pass_usage_month_count	 	y
ON
a.[Date]=y.[Date]
LEFT JOIN
ndc_transactions_nhsapp_records_information_results_month_count	 	z
ON
a.[Date]=z.[Date]
LEFT JOIN
ndc_access_nhsuk_estimated_visits_month_count	 	aa
ON
a.[Date]=aa.[Date]
LEFT JOIN
ndc_transactions_nhsapp_appointment_management_month_count	 	ab
ON
a.[Date]=ab.[Date]
LEFT JOIN
ndc_transactions_nhsapp_messaging_consultations_month_count	 	ac
ON
a.[Date]=ac.[Date]
LEFT JOIN
ndc_dashboard_repeat_prescriptions_online_month_prop	 	ad
ON
a.[Date]=ad.[Date]
LEFT JOIN
ndc_transactions_nhsapp_prescriptions_medicine_month_count	 	ae
ON
a.[Date]=ae.[Date]
LEFT JOIN
ndc_transactions_nhsuk_view_of_other_month_count	 	af
ON
a.[Date]=af.[Date]
LEFT JOIN
ndc_transactions_nhsuk_view_of_live_well_month_count	 	ag
ON
a.[Date]=ag.[Date]
LEFT JOIN
ndc_transactions_nhsuk_view_of_book_covid_vaccine_month_count	 	ah
ON
a.[Date]=ah.[Date]
LEFT JOIN
ndc_transactions_nhsuk_view_of_medicines_month_count	 	ai
ON
a.[Date]=ai.[Date]
LEFT JOIN
ndc_transactions_nhsuk_view_of_nhs_app_online_month_count	 	aj
ON
a.[Date]=aj.[Date]
LEFT JOIN
ndc_channel_shift_repeat_prescriptions_other_pol_month_count	 	ak
ON
a.[Date]=ak.[Date]
LEFT JOIN
ndc_channel_shift_repeat_prescriptions_offline_month_count	 	al
ON
a.[Date]=al.[Date]
LEFT JOIN
ndc_channel_shift_dcr_views_nhs_month_count	 	am
ON
a.[Date]=am.[Date]
LEFT JOIN
ndc_channel_shift_dcr_views_other_pol_nhs_month_count	 	an
ON
a.[Date]=an.[Date]
LEFT JOIN
ndc_transactions_secondary_care_messages_month_count	 	ao
ON
a.[Date]=ao.[Date]
LEFT JOIN
ndc_transactions_nhsuk_view_of_services_month_count	 	ap
ON
a.[Date]=ap.[Date]
LEFT JOIN
ndc_transactions_nhsapp_covid_pass_transactions_month_count aq
ON
a.[Date]=aq.[Date]