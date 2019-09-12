-- SELECT auf Tabellen
-- Immer überprüfen, welche Datenbank verwendet wird!!

USE Northwind;
GO  -- kein TSQL-Befehl; Batchdelimiter


-- Syntax:
-- SELECT Spalte1, Spalte2, Spalte3, 'Text', Funktion(), Berechnung
-- FROM Tabelle


-- * ist Wildcard für alles (alle Spalten einer Tabelle)


SELECT *
FROM Customers


SELECT CompanyName
FROM Customers


-- SELECT 100, 'Text', 100*3

SELECT	  CompanyName
		, ContactName
		, Phone
FROM Customers


SELECT	  CompanyName AS Firmenname
		, ContactName AS Kontaktperson
		, Phone AS Telefonnummer
FROM Customers


SELECT	  Freight AS Nettofrachtkosten
		, Freight*1.20 AS Bruttofrachtkosten
		, (Freight*1.20)-Freight AS MwSt
-- oder:		, Freight*0.20  -- Tipp von Peter :)
FROM Orders;


SELECT	  OrderID
		, OrderDate
		, ShippedDate
FROM Orders;


SELECT	  CustomerID
		, CompanyName
		, ContactName
		, Phone
FROM Customers;


SELECT DATEDIFF(dd, RequiredDate, ShippedDate) AS Lieferverzögerung
FROM Orders;

SELECT	  OrderID AS Bestellnummer
		, RequiredDate
		, ShippedDate
		, DATEDIFF(dd, RequiredDate, ShippedDate) AS Lieferverzögerung
FROM Orders
-- WHERE ... Bedingung
ORDER BY Lieferverzögerung DESC  -- descending - in absteigender Reihenfolge

-- ASC - ascending - in aufsteigender Reihenfolge


SELECT	  OrderID AS Bestellnummer
		, RequiredDate
		, ShippedDate
		, DATEDIFF(dd, RequiredDate, ShippedDate) AS Lieferverzögerung
FROM Orders
WHERE DATEDIFF(dd, RequiredDate, ShippedDate) > 0
ORDER BY Lieferverzögerung DESC