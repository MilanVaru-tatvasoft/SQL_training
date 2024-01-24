
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- ============================================
--CREATE PROCEDURE CalculateAverageFreight
--	@CustomerID nchar(5)
--	AS
--BEGIN
--	SELECT AVG(Freight) AS AverageFreight
--	FROM [orders]
--	WHERE CustomerID = @CustomerID
--END;



--CREATE PROCEDURE CalculateAverageFreight
--AS
--BEGIN
--	DECLARE @AvgFreight DECIMAL;
--	SELECT @AvgFreight = AVG(o.Freight) FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID GROUP BY o.CustomerID;
--	RETURN @AvgFreight;
--END
--GO

ALTER PROCEDURE CalculateAverageFreight
AS
BEGIN
	DECLARE @AvgFreight DECIMAL;
	SELECT @AvgFreight = AVG(o.Freight) FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID GROUP BY o.CustomerID;
	RETURN @AvgFreight;
END
GO