--6. Create another table – Logs(LogID, AccountID, OldSum, NewSum).
--    Add a trigger to the Accounts table that enters a new entry into the Logs table every time the sum on an account changes.

USE DatabseHWTSQL
GO

CREATE TABLE dbo.Logs
(LogID int IDENTITY NOT NULL,
AccountID int,
OldSum money,
NewSum money,
CONSTRAINT PK_Log PRIMARY KEY(LogID)
)
GO

CREATE TRIGGER tr_BalanceUpdate ON Accounts
FOR UPDATE, INSERT
AS
DECLARE @AccountID int,
		@OldSum money,
		@NewSum money
SELECT @AccountID = a.AccountID, @NewSum = i.Balance
FROM Accounts a 
INNER JOIN inserted i ON a.AccountID = i.AccountID
SELECT @OldSum = Balance
FROM deleted
INSERT INTO Logs VALUES
(@AccountID, @OldSum, @NewSum)
GO

INSERT INTO Accounts VALUES (3,500)

