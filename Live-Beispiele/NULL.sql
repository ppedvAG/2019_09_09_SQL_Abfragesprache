-- jede mathematische Operation bzw. Vergleiche im WHERE f�hrt wieder zu NULL

-- NEIN: xx = NULL, xx != NULL, xx < NULL
-- JA: xx IS NULL, xx IS NOT NULL


-- NEIN:
SELECT *
FROM Customers
WHERE Region < 'A'


-- JA:
SELECT *
FROM Customers
WHERE Region IS NULL