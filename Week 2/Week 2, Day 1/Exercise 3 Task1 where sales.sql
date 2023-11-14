select 
CustomerID,
CompanyName,
ContactName,
ContactTitle,
Phone
from Customers
where ContactTitle like 'sales%'