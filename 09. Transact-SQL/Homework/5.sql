--5. Add two more stored procedures WithdrawMoney(AccountId, money) and DepositMoney(AccountId, money) that operate in transactions.

USE DatabseHWTSQL
GO

CREATE PROC usp_WithdrawMoney
	@AccountId int,
	@money money
AS
DECLARE @initialAmount money
SELECT @initialAmount = Balance
FROM Accounts
WHERE AccountId = @accountId
IF @initialAmount IS NOT NULL
BEGIN
	BEGIN TRANSACTION
	IF @initialAmount >= @money
		BEGIN
		UPDATE Accounts SET Balance = @initialAmount - @money
		WHERE AccountId = @accountId
		COMMIT TRANSACTION
		END
	ELSE
		BEGIN
		RAISERROR('Not enough amount in the account',16,1)
		ROLLBACK TRANSACTION
		END	
END
ELSE
RAISERROR('Account not found',16,1)
GO

CREATE PROC usp_DepositMoney
	@AccountId int,
	@money money
AS
DECLARE @initialAmount money
SELECT @initialAmount = Balance
FROM Accounts
WHERE AccountId = @accountId
BEGIN TRANSACTION
IF @initialAmount IS NOT NULL
	BEGIN
		UPDATE Accounts SET Balance = @initialAmount + @money
		WHERE AccountId = @accountId
		COMMIT TRANSACTION
	END
ELSE
	BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('Account not found',16,1)
	END
GO

EXEC usp_WithdrawMoney 1, 20
EXEC usp_DepositMoney 1, 120



	
