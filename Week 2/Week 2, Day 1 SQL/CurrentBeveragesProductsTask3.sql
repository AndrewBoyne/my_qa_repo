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
--FILTER TO EXPENSIVE PRODUCTS IN CAT1
AND UnitPrice >= 40