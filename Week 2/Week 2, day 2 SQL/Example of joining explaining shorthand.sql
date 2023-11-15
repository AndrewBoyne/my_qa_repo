select
o.orderID, --this is the column (orderID) in the table orders (o)
o.orderDate, -- this is the column (orderDate) in the table orders (o)
c.CompanyName -- this is the column (CompanyName) in the table Customers (c)
from Orders as o
full join customers as c
on c.CustomerID = o.CustomerID -- CustomerID is the common column in each of the tables (c and o)
full join Employees as e
on o.EmployeeID = e.EmployeeID -- EmployeeID is the commomn column (ie; appears in both the table orders and the table employees)
-- on left join, the table mentioned first is the left hand table. So in this example - Orders is the left hand table