-- Datumsfunktionen

SELECT GETDATE() -- auf ms genau

SELECT DATEADD(hh, 20, '2019-09-09')  -- '09.09.2019' '9.9.2019'
SELECT DATEADD(hh, 20, GETDATE())
SELECT DATEADD(hh, 20, '2019-09-09 10:00:00.000')


-- Welches Datum haben wir in 100 Tagen?
SELECT DATEADD(dd, 100, GETDATE())

-- Welches Datum hatten wir vor 100 Tagen?
SELECT DATEADD(dd, -100, GETDATE())
select dateadd(dd, -100, getdate()) -- nicht case-sensitiv! Gleiches Ergebnis wie oben


-- Differenz zwischen zwei Zeiten (Datum)
SELECT DATEDIFF(dd, '2019-09-09', '2019-01-01')

-- oder mit GETDATE()
SELECT DATEDIFF(dd, GETDATE(), '2019-01-01') -- Ergebnis: -251

SELECT DATEDIFF(dd, '2019-01-01', GETDATE()) -- Ergebnis: 251


SELECT DATEPART(dd,'2019-09-09')

-- In welchem Quartal?
SELECT DATEPART(qq, '2019-10-26')

SELECT DATENAME(dd, '2019-09-09') -- dd ist hier falsch! 
SELECT DATENAME(dw, '2019-09-09') AS Wochentag -- dw = day of week


SELECT YEAR(GETDATE())
SELECT YEAR('2019-09-09')


SELECT YEAR(HireDate)
FROM Employees


SELECT FORMAT(GETDATE(), 'dd.MM.yyyy') AS Datum










