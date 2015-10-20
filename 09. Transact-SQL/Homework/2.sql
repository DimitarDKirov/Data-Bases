--2.  Create a stored procedure that accepts a number as a parameter and returns all persons who have more money in their accounts than the supplied number.

USE DatabseHWTSQL
GO

CREATE PROCEDURE usp_SelectPersonsByAmounts
(@amountValue money)
AS
SELECT p.FirstName + ' ' + p.LastName AS 'Full name', a.Balance 
FROM Persons p
INNER JOIN Accounts a
ON p.PersonId = a.PersonId
WHERE a.Balance > @amountValue
GO

EXEC usp_SelectPersonsByAmounts 2000


