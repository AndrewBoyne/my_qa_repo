--group by examples
--what's the minimum unit price per supplier
select 
supplierid,
categoryid,
min (unitprice) as 'Cheapest Product',
count (productid) as 'No of Products' -- adds number of products (comma needed ot be added above (after Cheapest Product)
from products
group by supplierid, CategoryID -- adding Category 
order by Supplierid -- changing the order by Supplier.  If we wanted to order by cheapest product we could say order by 3 (column) asc