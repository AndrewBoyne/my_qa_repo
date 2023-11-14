select 
customerid, -- task 2
count(*) as 'Number of Orders' --simple count of number of rows
from orders
group by CustomerID
order by 'Number of Orders' desc -- changes order of table depending on the highest number of orders placed
