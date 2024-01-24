
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- ============================================
CREATE PROCEDURE CalculateAverageFreight
	@CustomerID nchar(5)
	AS
BEGIN
	SELECT AVG(Freight) AS AverageFreight
	FROM [orders]
	WHERE CustomerID = @CustomerID
END;
