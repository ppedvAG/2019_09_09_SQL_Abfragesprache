-- Procedure

CREATE PROC pDemo
AS
SELECT TOP 1 * FROM Orders
SELECT TOP 3 FREIGHT FROM Orders WHERE Freight < 30
SELECT Country FROM Customers

EXEC pDemo



CREATE PROC pAllCustomers @City varchar(30)
AS 
SELECT * FROM Customers WHERE City = @City


EXEC pAllCustomers @City = 'Salzburg'