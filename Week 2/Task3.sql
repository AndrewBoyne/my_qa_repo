SELECT --REMOVED THE ASTERISK
ProductID, --SELECTED EACH PRODUCT LINE REQUIRED
ProductName,
UnitPrice,
UnitsInStock,
UnitsOnOrder, --added Unitsonorder
UnitPrice*UnitsInStock AS 'Current Stock Value', -- multiplies UnitPrice by unitsinstock and titles new column Current stock value
(UnitsOnOrder+UnitsInStock)*UnitPrice AS 'Future Stock Value' -- new column with multiplication for value (brackets added to calculation)
FROM Products -- SELECT ALL QUERIES AND F5 TO RUN