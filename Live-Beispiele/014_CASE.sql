-- CASE

--SELECT CustomerID, Country, 'EU'  -- EU würde hier bei ALLEN Ländern dabeistehen
--FROM Customers


SELECT CustomerID, Country, 'Testtext' AS Test,
	CASE
		WHEN Country = 'Austria' THEN 'EU'
		WHEN Country = 'Germany' THEN 'EU'
		WHEN Country = 'Italy' THEN 'EU'
		WHEN Country = 'UK' THEN 'Brexit'
		ELSE 'nicht EU'
	END AS Region
FROM Customers


SELECT Country, 
	CASE
		WHEN Country IN('Austria', 'Germany', 'Italy') THEN 'EU'
		ELSE 'nicht EU'
	END,
	CASE
		WHEN Country LIKE'U%' THEN 'Ulander'
	END
FROM Customers







