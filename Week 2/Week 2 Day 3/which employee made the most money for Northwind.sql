select -- How many unique products per each category? (category name, not just the ID).  How many products in beverages?
c.CategoryName, -- decide what is the key field
count(distinct p.productID) as 'No of Products', -- this is what counts the number of products per category
count(distinct p.productname) as 'No of Prod Names' -- this gives the names
from Products as p -- which 2 tables do we need?
join Categories as c
on p.CategoryID = c.CategoryID --keys matching on each table
group by CategoryName -- need this to tell SQL how to represent the info

--which employee made the most money for Northwind - order details and employee tables - employee name.  Revenue = (unit price* qty)* 1-discount)

--which table has the fields we require?

Select -- remember to include which table (e.) the EmployeeID comes from
top 1 e.FirstName,e.LastName, --which employee.  Can change the 1 to any other number to find the top x number of employees
round(sum((od.UnitPrice* od.Quantity)*(1- od.Discount)),2) as revenue -- made the most money
from [Order Details] as od -- this is where the information is held
join Orders as o
on od.OrderID=o.OrderID
join Employees as e
on o.EmployeeID=e.EmployeeID
group by e.FirstName, e.LastName -- this tells SQL how to return the results
order by revenue desc -- in this order





