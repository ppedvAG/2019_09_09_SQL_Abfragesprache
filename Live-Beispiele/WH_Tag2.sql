-- WH von Tag 2

SELECT *
FROM Customers
WHERE Country = 'Germany'


-- Company Name, OrderDate
SELECT CompanyName, OrderDate
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT CompanyName, OrderDate
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID


-- alle Länder, in denen wir Kunden haben
SELECT DISTINCT Country
FROM Customers



-- Anweisungen, wenn an der Datenbank etwas verändert werden soll

-- BEGIN TRAN

-- ROLLBACK - setzt Veränderung zurück

-- COMMIT - führt aus