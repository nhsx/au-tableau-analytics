CREATE VIEW dfpc_pomi_view
AS
SELECT A.[Unique ID]  AS [dfpc_POMI_Unique ID] 
      ,A.[Date]  AS [dfpc_POMI_Date]
      ,A.[Practice code] AS [dfpc_POMI_Practice code] 
      ,[GP practice appointment functionality enabled] AS [M050_GP practice appointment functionality enabled]
      ,[GP practice repeat prescription functionality enabled] AS [M051_GP practice repeat prescription functionality enabled]
      ,[GP practice detailed coded record functionality enabled] AS [M052_GP practice detailed coded record functionality enabled]
      ,[Number of GP appointments managed online] AS [M053_Number of GP appointments managed online]
      ,[Number of repeat prescription transactions] AS [M054_Number of repeat prescription transactions]
      ,[Number of detailed coded record views] AS [M055_Number of detailed coded record views]
      ,G.[Number of registered patients] AS [REF_Number of GP practice registered patients]
      ,[EMIS GP Practices] AS [M056_EMIS GP Practices]
      ,[TPP GP Practices] AS [M057_TPP GP Practices] 
      ,[VISION GP Practices] AS [M058_VISION GP Practices]
      ,[MICROTEST GP Practices] AS [M058B_MICROTEST GP Practices] 
      ,[Number of patients registered for appointment functionality] AS [M0140_Number of patients registered for appointment functionality] 
      ,[Number of patients registered for repeat prescription functionality] AS [M0141_Number of patients registered for repeat prescription functionality] 
      ,[Number of patients registered for detailed coded record functionality] AS [M0142_Number of patients registered for detailed coded record functionality] 

 
FROM [dbo].[pomi_appointments_func_enabled_month_count_prop]  A

left join [dbo].[pomi_repeat_prescription_enabled_month_count_prop] B 

     on A.[Date] = B.[Date] and  A.[Practice code] = B.[Practice code]

left join  [dbo].[pomi_record_func_enabled_month_count_prop]  C
    on A.[Date] = C.[Date] and  A.[Practice code] = C.[Practice code]

left join  [dbo].[pomi_appointments_transaction_month_count]  D
    on A.[Date] = D.[Date] and  A.[Practice code] = D.[Practice code]

left join  [dbo].[pomi_repeat_prescription_month_count]  E
    on A.[Date] = E.[Date] and  A.[Practice code] = E.[Practice code]

left join  [dbo].[pomi_record_views_month_count]  F
    on A.[Date] = F.[Date] and  A.[Practice code] = F.[Practice code]

left join  [dbo].[pomi_patient_appointments_func_month_count_prop]  G
    on A.[Date] = G.[Date] and  A.[Practice code] = G.[Practice code]

left join  [dbo].[pomi_patient_repeat_prescription_func_month_count_prop]  H
    on A.[Date] = H.[Date] and  A.[Practice code] = H.[Practice code]

left join  [dbo].[pomi_patient_record_func_month_count_prop]  I
    on A.[Date] = I.[Date] and  A.[Practice code] = I.[Practice code]

left join  [dbo].[pomi_emis_gp_practice_month_count]  J
    on A.[Date] = J.[Date] and  A.[Practice code] = J.[Practice code]

left join  [dbo].[pomi_tpp_gp_practice_month_count]  K
    on A.[Date] = K.[Date] and  A.[Practice code] = K.[Practice code]

left join  [dbo].[pomi_vision_gp_practice_month_count]  L
    on A.[Date] = L.[Date] and  A.[Practice code] = L.[Practice code]

left join  [dbo].[pomi_microtest_gp_practice_month_count]  M
    on A.[Date] = M.[Date] and  A.[Practice code] = M.[Practice code]
    
ORDER BY [dfpc_POMI_Unique ID] OFFSET 0 ROWS