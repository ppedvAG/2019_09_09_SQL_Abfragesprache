

SELECT Country
FROM Customers

-- Länder sind mehrfach... pro Kunde jeweils das Land... mehrere Kunden in Germany usw.
-- 91 Zeilen Ergebnis, 1 Zeile pro Kunde


SELECT DISTINCT Country
FROM Customers
-- 21 Ergebniszeilen - jedes Land wird nur einmal erwähnt


-- bringt nix, weil CustomerID gibts nur einmal!
SELECT DISTINCT CustomerID, Country
FROM Customers


-- so viele Ergebnisse wie Städte; Land kommt öfter vor, weil mehrere Städte pro Land
SELECT DISTINCT Country, City
FROM Customers


-- Liste von allen Städten, in denen es Kunden gibt?
SELECT DISTINCT City
FROM Customers
-- 69 Ergebnisse


-- Liste von allen Ländern, in denen Angestellte wohnen
SELECT DISTINCT Country
FROM Employees
-- UK, USA

-- zur Kontrolle
SELECT * FROM Employees