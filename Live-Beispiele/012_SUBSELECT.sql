-- SUBSELECT (Unterabfragen)

-- Unterabfrage wie Spalte verwenden (darf nur einen Wert haben)

SELECT
		  'Text'
		, Freight
		, (SELECT TOP 1 Freight FROM Orders) -- steht dann in allen Zeilen
FROM Orders


-- Unterabfrage wie eine Tabelle verwenden (als Datenquelle)

SELECT *
FROM -- Tabelle
	(SELECT OrderID, Freight FROM Orders WHERE EmployeeID = 3) t1 -- NAME MUSS VERGEBEN WERDEN!! (weil diese Abfrage so tut, als wäre sie eine eigene Tabelle)
WHERE t1.Freight > 100



--SELECT *
--FROM Customers c INNER JOIN Orders o
--	ON c.CustomerID = o.CustomerID


-- SUBSELECT auch im WHERE als Bedingung möglich
SELECT *
FROM Orders
WHERE
	Freight > (Select AVG(Freight) from orders)


-- kann auch miteinander kombiniert werden
SELECT	  Freight
		, (SELECT AVG(Freight) FROM Orders)
FROM 
	(SELECT OrderID, Freight, EmployeeID FROM Orders WHERE EmployeeID = 3) t2
WHERE t2.Freight > (Select AVG(Freight) from orders)
	

-- Gib mittels Subselect alle Kunden aus, die in einem Land wohnen, aus dem auch Bestellungen verschifft werden

SELECT *
FROM Customers
WHERE Country IN(SELECT Shipcountry FROM Orders)


-- Gib alle Bestellungen aus, deren Frachtkosten kleiner sind als der Durchschnitt der Frachtkosten

SELECT *
FROM Orders
WHERE Freight < (SELECT AVG(Freight) FROM Orders)

-- In absteigender Reihenfolge geordnet (vom größten zum kleinsten Wert)
SELECT *
FROM Orders
WHERE Freight < (SELECT AVG(Freight) FROM Orders)
ORDER BY Freight DESC







