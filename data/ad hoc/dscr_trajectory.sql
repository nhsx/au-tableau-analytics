DROP TABLE dscr_trajectory_test;
CREATE TABLE dscr_trajectory_test (

Objective_No varchar(10),
Objective_Name varchar(1000),
Month DATE,
Measure float,
Measure_desc varchar(1000),
Commitment_Version varchar(5),
Date varchar(10)

);

INSERT INTO dscr_trajectory_test VALUES
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2022-06-30',0.45,'of social care providers have a digitised social care record in place.','1','2022-06'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2022-07-31',0.466666667,'of social care providers have a digitised social care record in place.','','2022-07'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2022-08-31',0.483333333,'of social care providers have a digitised social care record in place.','','2022-08'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2022-09-30',0.5,'of social care providers have a digitised social care record in place.','1.1','2022-09'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2022-10-31',0.516666667,'of social care providers have a digitised social care record in place.','','2022-10'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2022-11-30',0.533333333,'of social care providers have a digitised social care record in place.','','2022-11'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2022-12-31',0.55,'of social care providers have a digitised social care record in place.','1.2','2022-12'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2023-01-31',0.566666667,'of social care providers have a digitised social care record in place.','','2023-01'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2023-02-28',0.583333333,'of social care providers have a digitised social care record in place.','','2023-02'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2023-03-31',0.6,'of social care providers have a digitised social care record in place.','1.3','2023-03'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2023-04-30',0.616666667,'of social care providers have a digitised social care record in place.','','2023-04'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2023-05-31',0.633333333,'of social care providers have a digitised social care record in place.','','2023-05'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2023-06-30',0.65,'of social care providers have a digitised social care record in place.','','2023-06'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2023-07-31',0.666666667,'of social care providers have a digitised social care record in place.','','2023-07'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2023-08-31',0.683333333,'of social care providers have a digitised social care record in place.','','2023-08'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2023-09-30',0.7,'of social care providers have a digitised social care record in place.','','2023-09'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2023-10-31',0.716666667,'of social care providers have a digitised social care record in place.','','2023-10'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2023-11-30',0.733333333,'of social care providers have a digitised social care record in place.','','2023-11'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2023-12-31',0.75,'of social care providers have a digitised social care record in place.','','2023-12'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2024-01-31',0.766666667,'of social care providers have a digitised social care record in place.','','2024-01'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2024-02-29',0.783333333,'of social care providers have a digitised social care record in place.','','2024-02'),
('disc6','We will ensure that at least 80% of social care providers have a digitised care record in place that can connect to a shared care record.','2024-03-31',0.8,'of social care providers have a digitised social care record in place.','1.4','2024-03')
;

SELECT * FROM dscr_trajectory_test;