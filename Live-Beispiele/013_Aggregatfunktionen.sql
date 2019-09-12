-- Aggregatfunktionen

SELECT	  min(UnitPrice) AS niedrigster
		, max(UnitPrice) AS höchster
		, avg(UnitPrice) AS mittlerer
		, count(UnitPrice) AS Anzahl
FROM Products

SELECT count(ShipRegion)
FROM Orders


-- Summe Frachtkosten PRO Kunde
SELECT sum(Freight), CustomerID
FROM Orders
GROUP BY CustomerID


SELECT Country, City, count(*) as Anzahl
FROM Customers
GROUP By Country, City  -- PRO was? count() wieviele Kunden gibts pro Stadt im jeweiligen Land
Order By Country, City

--SELECT Country, City
--From Customers
--Order by country

SELECT OrderID, unitprice*quantity AS Preis, ProductID, Quantity
FROM [Order Details]


SELECT orderid, sum(unitprice*quantity) AS Preis
FROM [Order Details]
GROUP BY orderid -- Summe PRO Bestellung (Rechnungssumme)



