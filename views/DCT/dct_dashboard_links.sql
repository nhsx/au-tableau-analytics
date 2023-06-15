DROP TABLE IF EXISTS dct_dashboard_links;
CREATE TABLE dct_dashboard_links 
(
    Organisation varchar(20)
    ,dashboard varchar(50)
    ,description varchar(400)
    ,link varchar(250)
);

INSERT INTO dct_dashboard_links
VALUES
('NHS England','GP DM&C', 'Dashboard showing GP digital maturity metrics', 'https://tabanalytics.data.england.nhs.uk/#/views/GPDMC-Overview/Overview')
,('NHS England','NHS App', 'Dashboard showing NHS App metrics', 'https://tabanalytics.data.england.nhs.uk/#/views/NHSAppReportingDashboard-Uptake/Summary')
,('DHSC','Datahub', 'A central, DHSC-focussed dashboard containing SoS priorities around primary and secondary care performance, manifesto commitments, and other useful datasets. Sections contain high-level metrics and visualisations alongside more detailed charts and data tables.', 'https://app.powerbi.com/groups/me/apps/250e97cf-7a01-42f9-a293-2e78a9fbb5ec/reports/3b849ce3-56d1-4a8f-bcca-b954bd2d649f/ReportSectiond207e4428002be9da632?ctid=61278c30-91a8-4c31-8c1f-ef4de8973a1c')
,('NHS England','Digital Social Care Record','Dashboard showing DSCR implementation status','https://tabanalytics.data.england.nhs.uk/#/views/DigitalSocialCareRecord/CumulativeDigitalSocialCareRecordAdoption?:iid=1')
;


-- select * from dct_dashboard_links