SELECT -- started with asterisk to select all
FirstName, -- selected from available data
LastName,
FirstName + ' ' + LastName AS 'Full Name' -- create new column and add title (space required hence added the ' ' with a new +
FROM Employees -- source
