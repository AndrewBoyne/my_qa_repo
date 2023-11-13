select ProductID,
ProductName,
CategoryID,
Discontinued,
UnitPrice
from Products
--filter to not discontinued
WHERE Discontinued = 0
