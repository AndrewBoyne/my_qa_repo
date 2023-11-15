SELECT ProductID,
ProductName,
CategoryID,
Discontinued,
UnitPrice
FROM Products
--FILTER TO DISC VALUE ZERO
WHERE Discontinued = 0
--ADD A FILTER CAT ID1
AND CategoryID = 1