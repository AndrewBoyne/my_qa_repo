select 
ProductID,
sum(quantity) as 'Total Sold' -- adds the totals
from [Order Details]
group by ProductID
