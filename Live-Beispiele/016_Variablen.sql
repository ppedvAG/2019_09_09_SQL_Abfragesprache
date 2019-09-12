-- Variablen

-- lokale Variablen
	-- @var1
	-- Lebenszeit: nur solange der Batch l‰uft
	-- Zugriff nur in der Session, wo sie erstellt wurde

-- globale Variablen
	-- @@var1
	-- Lebenszeit: nur solange der Batch l‰uft
	-- Zugriff auch von auﬂerhalb der Session


-- Variable deklarieren
-- Syntax:
-- DECLARE @Name AS Datentyp

-- Bsp.:
DECLARE @var1 as int

-- Wert zuweisen:

SET @var1 = 100

SELECT @var1



DECLARE @fracht as money = 100

SELECT *
FROM Orders
WHERE Freight < @fracht