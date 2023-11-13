select top 10 ProductID,
ProductName,
UnitsInStock,
UnitPrice,
UnitsInStock * UnitPrice as 'Stock Value' -- created new column for stock value
from Products
order by 'Stock Value' desc -- most valubale orders first
-- inserted top 10 into line 1
