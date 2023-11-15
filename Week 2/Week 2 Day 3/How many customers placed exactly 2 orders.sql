--how many customers place exactly 2 orders?

select c.CustomerID, c.CompanyName,
count( o.orderID) as NoofOrders 
from orders as o join customers as c
on o.CustomerID = c.CustomerID
group by c.CustomerID, c.CompanyName
having count(o.OrderID) = 2