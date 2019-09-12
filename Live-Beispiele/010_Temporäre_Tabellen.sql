-- temporäre Tabellen

/*

-- lokale #Tabellenname
-- existiert nur in der aktuellen Session

-- globale ##Tabellenname
-- Zugriff auch von anderen Sessions


-- hält so lange, wie die Verbindung da ist
-- kann auch gelöscht werden

*/


SELECT CustomerID, Freight
INTO #t1
FROM Orders

SELECT *
FROM #t1
