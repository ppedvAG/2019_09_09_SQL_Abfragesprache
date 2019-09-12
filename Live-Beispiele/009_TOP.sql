-- TOP Abfragen
-- ORDER BY zwingend notwendig!

-- SYNTAX: 
-- SELECT TOP # [percent] *|Spalte, Spalte,... FROM  Tabelle WHERE Bedingung ORDER BY Spalte

SELECT * FROM Customers


SELECT TOP 1 *
FROM Customers
ORDER BY CustomerID


SELECT TOP 10 PERCENT *
FROM Customers

SELECT TOP 10 PERCENT CustomerID, CompanyName, ContactName, Phone
FROM Customers
ORDER BY City


SELECT TOP 7 *
FROM Customers
ORDER BY CustomerID


-- Kunde mit den geringsten Frachtkosten
SELECT TOP 1 CustomerID, Freight
FROM Orders
ORDER BY Freight

-- Kunde mit den höchsten Frachtkosten
SELECT TOP 1 CustomerID, Freight
FROM Orders
ORDER BY Freight DESC

-- teuerstes Produkt
SELECT TOP 1 ProductName, UnitPrice
FROM Products 
Order BY UnitPrice DESC

-- Suche die Top 10% der Produkte mit den größten Einkaufsmengen (Produktname, Anzahl)

SELECT TOP 10 PERCENT WITH TIES
		  ProductName
		, Quantity
FROM [Order Details] od INNER JOIN Products p
	ON od.ProductID = p.ProductID
ORDER BY Quantity DESC

-- Gib die drei Mitarbeiter, die als erste eingestellt wurden, aus (die schon am längsten beim Unternehmen sind)

SELECT TOP 3
		  FirstName
		, LastName
		, Title
		, BirthDate
		, HireDate
FROM Employees
ORDER BY HireDate ASC



SELECT *
FROM Orders
ORDER BY Freight


-- erste 13 Kunden (geringste Frachtkosten) bekommen Bonus (Annahme)

SELECT TOP 13 WITH TIES
		  OrderID
		, CustomerID
		, Freight
FROM Orders
ORDER BY Freight

