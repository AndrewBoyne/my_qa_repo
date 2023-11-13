select ProductID,
ProductName,
CategoryID,
Discontinued,
UnitPrice
from Products
--filter to not discontinued
WHERE Discontinued = 0
--filter to Cat ID 1 (beverages)
AND CategoryID = 1
--filter unit price under 40
AND UnitPrice <40
