select UnitPrice,
OrderID,
Quantity,
unitprice * quantity as 'Totalvalue'
from [Order Details]
order by 'totalvalue' desc
