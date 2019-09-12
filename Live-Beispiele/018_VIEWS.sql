-- VIEWS (Sichten)

CREATE VIEW vName
AS
SELECT 
		  CompanyName
		, ContactName
		, Phone
		, OrderID
		, Freight
FROM Customers c INNER JOIN Orders o
	ON c.CustomerID = o.CustomerID
WHERE Country = 'Germany'

SELECT * FROM vName

-- kann wie eine Tabelle behandelt werden

SELECT CompanyName, Freight
FROM vName