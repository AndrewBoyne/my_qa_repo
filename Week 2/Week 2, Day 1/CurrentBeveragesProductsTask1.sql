SELECT ProductID,
ProductName,
CategoryID,
Discontinued,
UnitPrice
FROM Products
--FILTER TO DISC VALUE ZERO
WHERE Discontinued = 0