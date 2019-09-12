-- Tabellen miteinander verknüpfen: JOINS

/*

INNER JOIN

LEFT JOIN
					(Outer Joins)
RIGHT JOIN



*/


SELECT *
FROM Customers INNER JOIN Orders 
		ON Customers.CustomerID = Orders.CustomerID


-- wenn Name eindeutig, muss ich nicht angeben, aus welcher Tabelle
-- wenn Name mehrfach vorkommt (CustomerID), muss ich sagen aus welcher Tabelle
SELECT	  OrderID
		, Customers.CustomerID
		, CompanyName
		, Freight
FROM Customers INNER JOIN Orders 
		ON Customers.CustomerID = Orders.CustomerID


-- ich darf aber, wenn ich will, auch immer angeben, aus welcher Tabelle
SELECT	  Orders.OrderID
		, Customers.CustomerID
		, Customers.CompanyName
		, Orders.Freight
FROM Customers INNER JOIN Orders 
		ON Customers.CustomerID = Orders.CustomerID
ORDER BY CompanyName

-- alle, die noch nichts bestellt haben
SELECT	  Orders.OrderID
		, Customers.CustomerID
		, Customers.CompanyName
		, Orders.Freight
FROM Customers LEFT JOIN Orders 
		ON Customers.CustomerID = Orders.CustomerID
WHERE OrderID IS NULL
ORDER BY CompanyName


-- INNER JOIN CompanyName, Country, City, OrderID, Freight, RequiredDate, CustomerID
SELECT	  
		-- aus Customers Tabelle:
		  CompanyName
		, Country
		, City
		-- aus Orders Tabelle:
		, OrderID
		, Freight
		, RequiredDate
		-- aus Customers ODER aus Orders Tabelle, beides möglich:
		, Customers.CustomerID
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID


-- kürzere Schreibweise bei Join
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
FROM Customers c INNER JOIN Orders o
		ON c.CustomerID = o.CustomerID
ORDER BY c.CompanyName


-- INNER JOIN:
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
FROM Customers c INNER JOIN Orders o
		ON c.CustomerID = o.CustomerID
ORDER BY c.CompanyName
-- INNER JOIN: Kunde taucht mehrfach auf, aber nur die, die auch etwas bestellt haben



-- LEFT JOIN:
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
FROM Customers c LEFT JOIN Orders o
		ON c.CustomerID = o.CustomerID
ORDER BY c.CompanyName
-- da stehen auch die Kunden drin, die noch nichts bestellt haben


-- RIGHT JOIN:
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
FROM Customers c RIGHT JOIN Orders o
		ON c.CustomerID = o.CustomerID
ORDER BY c.CompanyName
-- alle Bestellungen 
-- also nicht die Kunden, die noch nichts bestellt haben, weil jede Bestellung muss einen Kunden haben


-- alle Kunden aus den USA und deren Frachtkosten
-- CustomerID, CompanyName, Country, Freight

SELECT c.CustomerID
	,CompanyName
	--,Country
	,Freight
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE Country = 'USA'


-- alle Bestellungen, wo Chai Tee verkauft worden ist
-- ProductName, Quantity, UnitPrice, OrderID
select p.ProductName, d.Quantity, d.UnitPrice, d.OrderID
from [Order Details] d inner join Products p
ON d.ProductID = p.ProductID
where ProductName LIKE '%chai%'



-- alle Bestellungen, wo Chai Tee verkauft worden ist
-- ProductName, Quantity, UnitPrice, OrderID
-- Frachtkosten
SELECT p.ProductName, d.Quantity, d.UnitPrice, d.OrderID, o.Freight
FROM [Order Details] d
		INNER JOIN Products p
			ON d.ProductID = p.ProductID
		
		
		INNER JOIN Orders o
			ON o.OrderID = d.OrderID
WHERE ProductName LIKE '%chai%'
ORDER BY Freight


/*

Syntax für das Joinen von mehreren Tabellen

SELECT Spalte, Spalte,...
FROM 
	tab1 INNER JOIN tab2 ON tab1.spalteX = tab2.spalteX
		 INNER JOIN tab3 ON tab3.spalteY = tab2.spalteY (oder tab1.spalteY)
		 INNER JOIN tab4 ON tab4.spalteZ = tab1.spalteZ (oder tab2.spalteZ/tab3.spalteZ)
											(wo spalteY/Z vorkommt
											 z.B.: Orders.CustomerID = Customers.CustomerID)
		 ...
		 ...
WHERE Bedingung
ORDER BY Spalte...


*/

-- alle Bestellungen, wo Chai Tee verkauft worden ist
-- ProductName, Quantity, UnitPrice, OrderID
-- Frachtkosten
-- Kundenname (CompanyName)
SELECT	  o.OrderID
		, CompanyName
		-- , ProductName
		, Quantity
		, p.UnitPrice
		, Freight
FROM	Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE ProductName LIKE '%chai%'
ORDER BY CompanyName




SELECT
		  o.OrderID
		, c.CompanyName
		, od.Quantity
		, p.ProductName
FROM Customers c INNER JOIN Orders o
	    ON c.CustomerID = o.CustomerID
		INNER JOIN [Order Details] od
		    ON o.OrderID = od.OrderID
				INNER JOIN Products p
				    ON od.ProductID = p.ProductID
WHERE p.ProductName LIKE ('%Lager%')
	OR p.ProductName LIKE ('%bier%')
	OR p.ProductName LIKE ('%ale')
ORDER BY Quantity DESC, CompanyName ASC


