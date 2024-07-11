CREATE OR ALTER VIEW shcr_connecting_care_golive_supplier_website_view AS

SELECT 
        [ICB ODS Code]
      ,[ICB Name]
      ,[System Supplier]
      ,[Website]
      ,[Go ive Date] as go_live_date
  FROM [dbo].[shcr_connecting_care_golive_supplier_website]