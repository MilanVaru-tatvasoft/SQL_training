

--CREATE PROCEDURE CalculateAverageFreight
ALTER PROCEDURE CalculateAverageFreight
AS
BEGIN
	DECLARE @AvgFreight MONEY;
	SELECT @AvgFreight = AVG(o.Freight) FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID GROUP BY o.CustomerID;
--	PRINT @AvgFreight;
	RETURN @AvgFreight;
END
GO

