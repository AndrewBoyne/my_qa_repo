select e.FirstName, e.LastName,
count (orders.orderid) as nooforders
from orders
join employees as e
on orders.EmployeeID = E.EmployeeID--the thing they have in common
group by e.FirstName, e.LastName -- longwinded so can abbreviate the word employees to e by 'join employees as e'