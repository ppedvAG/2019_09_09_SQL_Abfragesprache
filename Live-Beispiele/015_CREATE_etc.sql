-- Datenbank erstellen
-- CREATE DATABASE Name


CREATE DATABASE MyFirstDB


-- ganze DB UNWIEDERRUFLICH Löschen!!! NEEEEEEIIIIIIINN!!!!!!
-- DROP DATABASE MyFirstDB

USE MyFirstDB



-- Tabelle erstellen mit CREATE TABLE Name

CREATE TABLE Produkte
	(
		ProduktID int identity,
		Bezeichnung varchar(30),
		Preis money

	)


-- Tabelle verändern mit ALTER TABLE
-- hinzufügen:
ALTER TABLE Produkte
ADD SupplierID int


-- Spalte rauslöschen:
ALTER TABLE Produkte
DROP COLUMN SupplierID


SELECT * FROM Produkte

-- manuell Datensätze einfügen:

INSERT INTO Produkte (Bezeichnung, Preis)
VALUES ('Tiramisu', 4.50)

INSERT INTO Produkte (Bezeichnung, Preis)
VALUES ('Profiterols', 4.80)

INSERT INTO Produkte (Bezeichnung, Preis)
VALUES ('Panna Cotta', 3.50)

-- oder kürzer:
INSERT INTO Produkte (Bezeichnung, Preis)
VALUES 
		  ('Limoncello', 3.90)
		, ('Tartufo', 4.70)


-- Kundentabelle: KundenID, KName, GebDat
-- 3 Einträge

CREATE TABLE Kunden
	(
		  KundenID int identity
		, KName varchar(50)
		, GebDat date
	)

INSERT INTO Kunden (KName, GebDat)
VALUES
	  ('James Bond', '1940-08-07')
	, ('Bruce Wayne', '1968-10-02')
	, ('Peter Parker', '1974-03-19')

SELECT * FROM Kunden

-- Datensätze aus anderen Tabellen einfügen

USE Northwind
CREATE TABLE TestProdukte
(
		ProduktID int identity,
		Bezeichnung varchar(30),
		Preis money

	)

INSERT INTO TestProdukte (Bezeichnung, Preis)
SELECT ProductName, UnitPrice
FROM Products
WHERE CategoryID = 1

SELECT * FROM TestProdukte


-- ****************************************************


-- Werte ändern

USE MyFirstDB

UPDATE Produkte
SET Preis = 5.20
WHERE Bezeichnung = 'Tiramisu' -- unbedingt eingrenzen!!! Sonst gültig für ALLE!!

SELECT * FROM Produkte

DELETE FROM Produkte
WHERE Bezeichnung = 'Limoncello'


ALTER TABLE Produkte
ALTER COLUMN Bezeichnung varchar(50)



CREATE TABLE testdel
(testtext varchar(20))

INSERT INTO testdel
VALUES
	  ('ddel')
	, ('edel')
	, ('fdel')
	, ('del')
	, ('Ernst Handel')
	, ('dxxxxxxdel')
	, ('dxxxxxxxel')

SELECT * FROM testdel
WHERE testtext LIKE '[d-f]%d_l'


sp_help 'Produkte'