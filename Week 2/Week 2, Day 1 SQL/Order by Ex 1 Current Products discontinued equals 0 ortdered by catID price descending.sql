select 
ProductID,
ProductName,
CategoryID,
Discontinued,
UnitPrice --relevant columns selected
from Products
where Discontinued = 0 --returning current products only
order by CategoryID,
UnitPrice desc
