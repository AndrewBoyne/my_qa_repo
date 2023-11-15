select 
ProductID,
sum(quantity * UnitPrice) as 'Total Value' -- adds the totals
from [Order Details]
group by ProductID
having
sum(quantity * unitprice) <=5000
order by 'Total Value'
