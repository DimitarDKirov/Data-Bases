--4.  Create a stored procedure that uses the function from the previous example to give an interest to a person's account for one month.
--    It should take the AccountId and the interest rate as parameters.

USE DatabseHWTSQL
GO

CREATE PROCEDURE usp_AddInterest
	@accountId int,
	@interesrRate float
AS
DECLARE @initialAmount money
SELECT @initialAmount = Balance
FROM Accounts
WHERE AccountId = @accountId
IF @initialAmount IS NOT NULL 
	BEGIN
	BEGIN TRANSACTION
	UPDATE Accounts
	SET Balance = dbo.ufn_CalcInterestRate(@initialAmount, @interesrRate,1)
	WHERE AccountId = @accountId
	COMMIT TRANSACTION
	END
ELSE
	RAISERROR('Account not found', 16, 1)
GO