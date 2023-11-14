-- example for total freight shipped per country
select 
sum(freight) as 'Total Shipped Weight', --create new column with totals
ShipCountry -- needs to be here or we get an error
from Orders
group by ShipCountry
order by 1

