--join fundamentals.  Ex 1 
-- Task1
select
c.CustomerID, -- c. means from the table Customers
c.CompanyName,
c.ContactName,
c.City
from Customers as c
join orders as o -- adds information from orders table
on c.CustomerID = o.CustomerID -- the common link is CustomerID

--task 2
select
c.CustomerID, -- c. means from the table Customers
c.CompanyName,
c.ContactName,
c.City,
o.OrderID,
convert (nvarchar, o.OrderDate, 101) as 'Order Date' -- amends date format.  Note the convert comes before orderDate
from Customers as c
join orders as o -- adds information from orders table
on c.CustomerID = o.CustomerID -- the common link is CustomerID
where c.Country = 'UK'
order by c.CompanyName, o.OrderDate

--Task 3
select
c.CustomerID, -- c. means from the table Customers
c.CompanyName,
c.ContactName,
c.City,
o.OrderID,
convert (nvarchar, o.OrderDate, 101) as 'Order Date', -- amends date format.  Note the convert comes before orderDate
od.ProductID,
od.Quantity,
-- productID was added twice.  Having deleted this one the second column (after quantity) is removed
p.ProductName
from Customers as c
join orders as o -- adds information from orders table
on c.CustomerID = o.CustomerID -- the common link is CustomerID
join [Order Details] as od
on o.OrderID = od.OrderID
join Products as p
on od.ProductID = p.ProductID
where c.Country = 'UK'
order by c.CompanyName, o.OrderDate


