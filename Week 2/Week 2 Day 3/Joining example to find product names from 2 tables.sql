select -- How many unique products per each category? (category name, not just the ID).  How many products in beverages?
c.CategoryName, -- decide what is the key field
count(distinct p.productID) as 'No of Products', -- this is what counts the number of products per category
count(distinct p.productname) as 'No of Prod Names' -- this gives the names
from Products as p -- which 2 tables do we need?
join Categories as c
on p.CategoryID = c.CategoryID --keys matching on each table
group by CategoryName -- need this to tell SQL how to represent the info



