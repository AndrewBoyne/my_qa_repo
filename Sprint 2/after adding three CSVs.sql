use Quay_Banking EXEC sp_changedbowner 'sa'
select * from Events
--Issue - when importing flat file Events, error message that one of the lines of customer narrative would be truncated.  I amended to NVARCHAR MAX but we now have loads of Nulls##
--That may already have been the case
