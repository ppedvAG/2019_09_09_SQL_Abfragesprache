-- WHERE
-- wenn man nur bestimmte Ergebnisse ausgeben möchte

/*
SELECT Spalten,....
FROM Tabelle
WHERE Bedingung zutrifft
ORDER BY Spalte ASC|DESC



WHERE Spalte =, <, >, <=, >=
			 !=, <>  -- darf NICHT diesem Wert entsprechen
			 LIKE, IN, BETWEEN


		-- nicht so gut für Performance:
			 NOT IN
			 NOT LIKE
			 NOT BETWEEN 

		AND, OR

*/


-- alle, die in Deutschland wohnen
SELECT *
FROM Customers
WHERE Country = 'Germany'


-- alle, die in Deutschland wohnen, und zwar in Berlin
SELECT *
FROM Customers
WHERE Country = 'Germany'
		AND City = 'Berlin'

-- alle, die in Deutschland und alle, die in Österreich wohnen
SELECT *
FROM Customers
WHERE Country = 'Germany'
		OR Country = 'Austria'
ORDER BY Country, CustomerID


-- alle Kunden aus Frankreich
SELECT *
FROM Customers
WHERE Country = 'France'

-- alle in Argentinien, Buenos Aires
SELECT *
FROM Customers
WHERE Country = 'Argentina'
		AND City = 'Buenos Aires'


-- Bestellungen, wo Frachtkosten kleiner als 50 sind
SELECT *
FROM Orders
WHERE Freight < 50
ORDER BY Freight DESC


-- Bestellungen, wo Frachtkosten NICHT 50 sind
SELECT *
FROM Orders
WHERE Freight != 77.92  -- oder Freight <> 50
ORDER BY Freight DESC


-- Bestellungen, wo Frachtkosten zwischen 50 und 80 liegen (inklusive)
SELECT *
FROM Orders
WHERE Freight >= 50 AND Freight <= 80
ORDER BY Freight

-- oder:
SELECT *
FROM Orders
WHERE Freight BETWEEN 50 AND 80
ORDER BY Freight

-- alle Bestellungen, die von Angestellten 3, 4, 7 bearbeitet worden sind
SELECT *
FROM Orders
WHERE EmployeeID = 3
		OR EmployeeID = 4
			OR EmployeeID = 7

-- oder:
SELECT *
FROM Orders
WHERE EmployeeID IN(3, 4, 7)

-- mehr als 100 vorhanden (Produkte)
SELECT *
FROM Products
WHERE UnitsInStock > 100
ORDER BY UnitsInStock DESC

-- ProduktID zwischen 10 und 15
SELECT *
FROM Products
WHERE ProductID BETWEEN 10 AND 15

-- alle Produkte vom Anbieter 2, 7 oder 15
SELECT *
FROM Products
WHERE SupplierID IN(2, 7, 15)
ORDER BY SupplierID


/*

Wildcards nur beim LIKE 
(außer SELECT * ... alle Spalten)


% steht für beliebig viele unbekannte Zeichen

*/


-- am Anfang steht 'AL....'
SELECT *
FROM Customers
WHERE CustomerID = 'ALFKI'

-- alle, die mit AL... beginnen
SELECT *
FROM Customers
WHERE CustomerID LIKE 'AL%'


-- alle, die mit ...kiste enden
SELECT *
FROM Customers
WHERE CompanyName LIKE '%kiste'


-- alle, die ...futter... im Namen haben
SELECT *
FROM Customers
WHERE CompanyName LIKE '%futter%'



-- alle, deren Firmenname mit d beginnt
SELECT *
FROM Customers
WHERE CompanyName LIKE 'd%'

-- alle, deren Firmenname mit d endet
SELECT *
FROM Customers
WHERE CompanyName LIKE '%d'

-- alle, die ein d enthalten
SELECT *
FROM Customers
WHERE CompanyName LIKE '%d%'


-- alle, die mit Coffee enden
SELECT *
FROM Products
WHERE ProductName LIKE '%coffee'

-- alle, die mit L beginnen
SELECT *
FROM Products
WHERE ProductName LIKE 'L%'

-- alle, die ein ost im Namen haben
SELECT *
FROM Products
WHERE ProductName LIKE '%ost%'

-- nur bestimmte Spalten ausgeben: ProduktID, Name, wieviele sind vorrätig?
SELECT	  ProductID
		, ProductName
		, UnitsInStock
FROM Products
WHERE ProductName LIKE '%ost%'

-- auch ordnen möglich:
SELECT	  ProductID
		, ProductName
		, UnitsInStock
FROM Products
WHERE ProductName LIKE '%ost%'
ORDER BY ProductName

SELECT	  ProductID
		, ProductName
		, UnitsInStock
		, UnitPrice
FROM Products
WHERE ProductName LIKE '%ost%'
ORDER BY UnitPrice DESC


-- zählen! COUNT()

-- wieviele Kunden gibts?
SELECT COUNT(*)
FROM Customers

-- oder:
SELECT COUNT(CustomerID)
FROM Customers

-- weiter einschränken
SELECT COUNT(CustomerID)
FROM Customers
WHERE CompanyName LIKE '%d%'


-- alle, die ein d im Namen haben und mit e enden
SELECT *
FROM customers
WHERE CompanyName LIKE '%D%e'


-- alle, die mit a beginnen, ein f irgendwo haben und aus Deutschland stammen
SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%f%'
	AND Country = 'Germany'

-- Bestellungen: alle Bestellungen von den Angestellten 1, 3 oder 5,
-- von Kunde, der mit r beginnt
-- und Frachtkosten von mehr als 300 hat

SELECT *
FROM Orders
WHERE EmployeeID IN(1, 3, 5)
	AND CustomerID LIKE 'R%'
	AND Freight > 300

-- Übung 10 Übungsblatt:
SELECT *
FROM Products
WHERE SupplierID IN(5, 10, 15)
	AND UnitsInStock > 10
	AND UnitPrice < 100
ORDER BY UnitPrice DESC


-- Übung 11 Übungsblatt:
SELECT COUNT(ProductID) AS Anzahl
FROM Products
WHERE SupplierID = 17



/*
SELECT *
FROM [Order Details]
*/

-- Wertebereiche []
-- in Abfrage steht [] für genau 1 Zeichen - da drin ist auch kein % möglich
-- einerseits für Sonderzeichen
-- andererseits für von - bis

SELECT *
FROM CUSTOMERS
WHERE CompanyName LIKE '%[%]%'

-- CompanyName beginnt mit a-c
SELECT *
FROM Customers
WHERE CompanyName LIKE '[a-c]%'
-- alle, die mit a ODER B ODER C beginnen

-- CompanyName beginnt mit a oder c
SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%'
	OR CompanyName LIKE 'c%'

-- oder:

SELECT *
FROM Customers
WHERE CompanyName LIKE '[ac]%'


-- wie bekomme ich alle mit Hochkomma im Namen?
SELECT *
FROM Customers
WHERE CompanyName LIKE '%''%' -- zwei Hochkommata werden zu einem gesuchten '


-- andere Schreibweise für Suche nach Sonderzeichen: ESCAPE

SELECT *
FROM Customers
WHERE CompanyName LIKE '%!%%' ESCAPE '!'


-- alle CompanyNames, die mit d, e oder f beginnen
SELECT *
FROM Customers
WHERE CompanyName LIKE '[d-f]%'

-- alle CompanyNames, die mit a oder c beginnen und mit m oder e enden
SELECT *
FROM Customers
WHERE CompanyName LIKE '[ac]%[me]'


-- angenommen, beim eingeben der CustomerID wäre ein Fehler passiert
-- soll aus 5 Buchstaben bestehen
-- CMX3 ... wie finde ich die falschen?

-- wie würde ich die richtigen finden?
SELECT *
FROM Customers
WHERE CustomerID LIKE '[a-z][a-z][a-z][a-z][a-z]'

-- die falschen finden:
SELECT *
FROM Customers
WHERE CustomerID NOT LIKE '[a-z][a-z][a-z][a-z][a-z]'



-- angenommen, wir hätten eine vierstellige PIN
-- muss aus 4 Ziffern bestehen

/*

SELECT *
FROM Tabelle
WHERE Pin NOT LIKE '[0-9][0-9][0-9][0-9]'

*/

-- alle Kunden, die NICHT mit a, b oder c beginnen
SELECT *
FROM Customers
WHERE CompanyName NOT LIKE '[a-c]%'

-- oder:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[d-z]%'

-- oder:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[^a-c]%' -- ^ steht hier für NICHT, also alle, die eben NICHT mit a, b oder c beginnen


-- alle, die mit a-c oder m-o beginnen
SELECT *
FROM Customers
WHERE CompanyName LIKE '[a-c|m-o]%'


-- (5) 555-47[0-9]9
SELECT *
FROM Customers
WHERE Phone LIKE '(5) 555-47[0-9]9'


-- oder besser:

SELECT *
FROM Customers
WHERE Phone LIKE '(5) 555-47_9' -- genau 1 unbekanntes Zeichen


-- alle Kunden, die mit d-f beginnen, der letzte Buchstabe ist ein l und der drittletzte ein d
SELECT *
FROM Customers
WHERE CompanyName LIKE '[d-f]%[d]_l'   
-- ddel ddxl  edel fdel dslkdjlskjkdjlkdel






-- Übung 12 Übungsblatt:
SELECT *
FROM Products
WHERE ProductName LIKE '[d-l]%[a-d|m-o]'



