SELECT *
FROM Orders
WHERE CustomerID IN ('ALFKI', 'ERNSH', 'SIMOB')
AND OrderDate >= '19970801'
AND OrderDate <= '19970831'