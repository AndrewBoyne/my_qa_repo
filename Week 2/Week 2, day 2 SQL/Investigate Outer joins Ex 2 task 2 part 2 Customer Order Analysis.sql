select 
c.CompanyName
,count (o.OrderID) as 'Num Orders' -- count of order ID from orders table
from Customers as c
join orders as o
on o.CustomerID = c.CustomerID
group by CompanyName -- group by common theme
order by 'Num Orders' desc -- this shows the customers with the largest orders first

