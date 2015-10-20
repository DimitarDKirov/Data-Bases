--3. Create a function that accepts as parameters – sum, yearly interest rate and number of months.
--   It should calculate and return the new sum.
--   Write a SELECT to test whether the function works as expected.
USE DatabseHWTSQL
GO

CREATE FUNCTION dbo.ufn_CalcInterestRate
	(@sum money, 
	@interestRate float,
	@monthsNumber int)
	RETURNS money
AS
BEGIN
RETURN @sum*(1+@interestRate*@monthsNumber/1200)
END
GO

--expected value 1020.00
SELECT dbo.ufn_CalcInterestRate(1000, 12.0, 2)



