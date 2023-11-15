
select COUNT(*) as 'Number of Orders', --remove the select * from the first query
min (orderdate) as 'Earliest Order',
convert (nvarchar, max(orderdate), 101) as 'Latest Order' --converting date format to dd/mm/yyyy
from orders
where EmployeeID = 1