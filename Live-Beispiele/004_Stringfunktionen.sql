-- Stringfunktionen

SELECT 'Text'

SELECT 'Text    '

SELECT RTRIM('Text    ')

SELECT LEN('Text    ')

SELECT DATALENGTH('Text    ')

SELECT DATALENGTH(RTRIM('Text    '))


-- ltrim: links Leerzeichen weg, rtrim: rechts Leerzeichen weg

SELECT LTRIM('   Text')

SELECT TRIM('    Text    ')

SELECT DATALENGTH('    Text    ')

SELECT DATALENGTH(TRIM('    Text    '))


SELECT REVERSE('REITTIER')

SELECT REVERSE('Trug Tim eine so helle Hose nie mit Gurt?')

-- schneidet die ersten (linken) drei Zeichen aus
SELECT LEFT('Testtext', 3)


-- schneidet die letzten (rechten) drei Zeichen aus
SELECT RIGHT('Testtext', 3)


SELECT SUBSTRING('Testtext', 4, 2) -- ab Stelle 4 werden 2 ausgeschnitten (tt)


SELECT STUFF('Testtext', 5, 1, 'Hallo') -- 2. Zahl steht für: wieviele sollen gelöscht werden


-- Strings zusammenfügen:
SELECT CONCAT('abc', 'def', 'ghi', 'jkl', 'mno', 'pqr', 'stu', 'vwx', 'yz')

SELECT CONCAT('Ich weiß ', 'dass ich', ' ', 'nichts weiß.') AS Zitat

SELECT CONCAT('James', ' ', 'Bond')

SELECT CONCAT(TRIM(FirstName), ' ', TRIM(LastName)) AS FullName
FROM Employees

-- letzten 3 Stellen der Telefonnummer mit xxx ersetzen
SELECT REVERSE(STUFF(REVERSE('+49 86779889123'), 1, 3, 'xxx'))

-- andere Möglichkeit:
SELECT LEFT('+49 86779889123', DATALENGTH('+49 86779889123')-3)+'xxx'

-- Leerzeichen vorher und nachher weg
SELECT TRIM('     Test     ')

SELECT	  DATALENGTH('     Test     ') AS Vorher
		, DATALENGTH(TRIM('     Test     ')) AS Nachher


-- Wilham Shakesbeer -> William Shakespeare

SELECT	  
	CONCAT(
		  SUBSTRING(STUFF('Wilham Shakesbeer', 4, 1, 'li'), 1, 14)
		, SUBSTRING(STUFF('Wilham Shakesbeer', 14, 4, 'peare'), 14, 5)
		) AS [richtiger Name]

