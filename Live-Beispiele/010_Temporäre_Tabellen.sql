-- tempor�re Tabellen

/*

-- lokale #Tabellenname
-- existiert nur in der aktuellen Session

-- globale ##Tabellenname
-- Zugriff auch von anderen Sessions


-- h�lt so lange, wie die Verbindung da ist
-- kann auch gel�scht werden

*/


SELECT CustomerID, Freight
INTO #t1
FROM Orders

SELECT *
FROM #t1
