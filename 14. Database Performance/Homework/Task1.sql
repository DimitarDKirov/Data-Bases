---------------------------------------------------------------------
--Use database TelerikAcademy
---------------------------------------------------------------------

USE TelerikAcademy
GO

---------------------------------------------------------------------
-- Create table Logs and populate 10 000 000 rows in it
---------------------------------------------------------------------

CREATE TABLE Logs(
  LogId int NOT NULL PRIMARY KEY IDENTITY,
  LogText varchar(100),
  LogDate datetime
)

INSERT INTO Logs VALUES 
('Some random log', GETDATE()),
('Important event log', DATEADD(day, -10, GETDATE())),
('User logged', DATEADD(day, -20, GETDATE()))

DECLARE @Counter int = 0
WHILE (SELECT COUNT(*) FROM Logs) < 10000000
BEGIN
  INSERT INTO Logs
  SELECT LogText + CONVERT(varchar, @Counter), DATEADD(month, CONVERT(varbinary, newid()) % (50 * 12), getdate()) FROM Logs
  SET @Counter = @Counter + 3
END

SELECT COUNT(*) FROM Logs


