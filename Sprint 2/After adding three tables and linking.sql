--ALTER TABLE CallCentreLogs ADD CONSTRAINT PK_CallCentreLogs PRIMARY KEY (Complaint_ID);
--ALTER TABLE CallCentreLogs
--ALTER COLUMN Complaint_ID nvarchar NOT NULL;
--Above no longer required as I linked Events using Client ID
select * from Reviews