--CREATE PROCEDURE InsertCustomerOrderDetails
--    @ProductID int,
--	@UnitPrice money,
--    @Quantity smallint,
--    @Discount real
--AS
--BEGIN
--    INSERT INTO [milanvaru_db].[dbo].[Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
--    VALUES ((SELECT MAX(OrderID) + 1 FROM [Orders]), @ProductID, @UnitPrice, @Quantity, @Discount)
--END;

---- Example data for calling the stored procedure
--DECLARE @ProductID int = 999999; -- Replace with an existing ProductID
--DECLARE @UnitPrice money = 75.00;
--DECLARE @Quantity smallint = 15;
--DECLARE @Discount real = 0.2;

---- Call the stored procedure to insert the row
--EXEC InsertCustomerOrderDetails
 
--    @ProductID,
--    @UnitPrice,
--    @Quantity,
--    @Discount;

--	select * from Products WHERE UnitPrice = 75.00;



Alter PROCEDURE InsertCustomerOrderDetails
	@OrderID int,
    @ProductID int,
	@UnitPrice money,
    @Quantity smallint,
    @Discount real
AS
BEGIN
    INSERT INTO [Order Details](OrderID, ProductID, UnitPrice, Quantity, Discount)
    VALUES (@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount)
END;

-- Example data for calling the stored procedure
DECLARE @OrderID int = 102675;
DECLARE @ProductID int = 999999; -- Replace with an existing ProductID
DECLARE @UnitPrice money = 75.00;
DECLARE @Quantity smallint = 15;
DECLARE @Discount real = 0.2;

-- Call the stored procedure to insert the row
EXEC InsertCustomerOrderDetails
 
	@OrderID,
    @ProductID,
    @UnitPrice,
    @Quantity,
    @Discount;


	SELECT * From [Order Details] where OrderID = 102675;