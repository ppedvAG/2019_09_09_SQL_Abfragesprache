-- UNION
-- Spalten m�ssen kompatibel sein (Datentypen)
-- gleich viele Spalten!

-- bisher: Ergebnis ist eine neue Tabelle (Ansicht)
SELECT CompanyName, OrderID
FROM Customers c INNER JOIN Orders o
	ON c.CustomerID = o.CustomerID


SELECT 'Testtext1'
UNION
SELECT 'Testtext2'


-- geht NICHT:
SELECT Phone, CustomerID
FROM Customers
UNION
SELECT HomePhone
FROM Employees


-- geht auch nicht, DATENTYP muss gleich sein:
SELECT Phone, CustomerID
FROM Customers
UNION
SELECT HomePhone, EmployeeID
FROM Employees


-- w�rde funktionieren:
SELECT Phone, Country
FROM Customers
UNION
SELECT HomePhone, Country
FROM Employees


-- Spielerei:
SELECT Phone, Country, 'Customer' AS Kategorie
FROM Customers
UNION
SELECT HomePhone, Country, 'Employee' -- AS Kategorie
FROM Employees


-- geht, aber macht nicht viel Sinn:
SELECT Phone, CustomerID
FROM Customers
UNION
SELECT HomePhone, 'Blabla'
FROM Employees


-- geht auch, Sinn??
SELECT Phone, CustomerID
FROM Customers
UNION
SELECT HomePhone, NULL
FROM Employees


-- UNION macht auch ein DISTINCT
SELECT 'Testtext'
UNION
SELECT 'Testtext'


-- wenn ich das nicht m�chte, kann man UNION ALL verwenden
SELECT 'Testtext'
UNION ALL
SELECT 'Testtext'

-- Gib den Firmennamen, die Kontaktperson und die Telefonnummern aller Kunden und aller Supplier in einer Liste aus

SELECT CompanyName, ContactName, Phone
FROM Customers
UNION
SELECT CompanyName, ContactName, Phone
FROM Suppliers

-- F�ge eine Kategorie �C� f�r Customer und �S� f�r Supplier hinzu
SELECT CompanyName, ContactName, Phone, 'C' AS Category
FROM Customers
UNION
SELECT CompanyName, ContactName, Phone, 'S' AS Category
FROM Suppliers

-- Gib alle Regionen der Kunden und der Angestellten aus.
SELECT Region, 'C' AS Category
FROM Customers
UNION
SELECT Region, 'E' AS Category
FROM Employees


-- Aufgabe: eine ABC-Analyse
-- wir bewerten die Bestellungen mit A, B oder C, je nachdem, wieviel Frachtkosten entstanden sind
-- OrderID, CustomerID, Freight, 'Bewertung'
-- < 100 = A
-- zwischen 100 und 500 = B
-- > 500 = C



-- h�chsten Frachtkostenwert (Freight), OrderID, 'h�chster Wert'
-- niedrigsten Frachtkostenwert (Freight), OrderID, 'niedrigster Wert'
-- in einer Liste


-- geht NICHT:
SELECT TOP 1 OrderID, Freight, 'niedrigster Wert' AS Typ
FROM Orders
Order By Freight ASC -- dieses Order By funktioniert NICHT!
UNION
SELECT TOP 1 OrderID, Freight, 'h�chster Wert' AS Typ
FROM Orders
Order By Freight DESC -- das letzte Order By gilt f�r die gesamte Abfrage!!


-- mit tempor�rer Tabelle funktioniert es:

SELECT TOP 1 OrderID, Freight, 'niedrigster Wert' AS Typ
INTO #niedrigster
FROM Orders
Order By Freight ASC


SELECT TOP 1 OrderID, Freight, 'h�chster Wert' AS Typ
INTO #hoechster
FROM Orders
Order By Freight DESC


SELECT *
FROM #hoechster
UNION
SELECT *
FROM #niedrigster


SELECT OrderID, Freight
FROM Orders
ORDER BY Freight


-- geht auch mit Unterabfrage (siehe SUBSELECT):

SELECT *
FROM
(SELECT TOP 1 OrderID, Freight, 'niedrigster Wert' AS Typ
FROM Orders
Order By Freight ASC) n
UNION
SELECT *
FROM
(SELECT TOP 1 OrderID, Freight, 'h�chster Wert' AS Typ
FROM Orders
Order By Freight DESC) h