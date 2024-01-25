

----CREATE PROCEDURE CalculateAverageFreight
ALTER PROCEDURE CalculateAverageFreight
@CustomerID nchar(20),
@AvgFreight MONEY OUT

AS
BEGIN
	SELECT @AvgFreight = AVG(Freight) FROM Orders where @CustomerID = CustomerID  ;

	--PRINT @AvgFreight;
	RETURN @AvgFreight;
END
GO


	SELECT  AVG(Freight) FROM Orders where CustomerID = 'VINET';

			execute CalculateAverageFreight 'VINET';
