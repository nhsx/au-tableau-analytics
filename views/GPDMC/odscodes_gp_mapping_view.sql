CREATE OR ALTER VIEW odscodes_gp_mapping_view
AS
SELECT
GP_Code
,GP_Name
,GP_Postcode
,GP_CCG_Code
,GP_CCG_Name
,GP_STP_Code
,REPLACE(GP_STP_Name, 'INTEGRATED CARE BOARD', '') as GP_STP_Name
,GP_Region_Code
,GP_Region_Name
,Region_Name
,GP_PCN_Name
FROM
odscodes_gp_mapping

