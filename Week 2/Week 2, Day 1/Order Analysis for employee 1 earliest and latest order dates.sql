
select COUNT(*) as 'Number of Orders', --remove the select * from the first query
min (orderdate) as 'Earliest Order',
max (orderdate) as 'Latest Ortder'
from orders
where EmployeeID = 1