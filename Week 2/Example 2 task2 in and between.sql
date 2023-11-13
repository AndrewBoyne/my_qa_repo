SELECT *
FROM Orders
WHERE CustomerID IN ('ALFKI', 'ERNSH', 'SIMOB')
AND OrderDate between '19970801' and '19970831'
