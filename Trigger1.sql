


--CREATE PROC spAvgFreightALTER PROC spAvgFreight@customer_id nchar(5)ASBEGIN	DECLARE @AVG_FREIGHT MONEY;	SELECT 		@AVG_FREIGHT = AVG(Freight)	FROM 		[Orders]	WHERE 		CustomerID = @customer_id	GROUP BY		CustomerID;	PRINT @AVG_FREIGHT;	RETURN @AVG_FREIGHT;END;spAvgFreight "VINET"CREATE TRIGGER FreightTrigger--ALTER TRIGGER FreightTriggerON [Orders]	FOR INSERT ,UPDATEASBEGIN	DECLARE @AVG_Freight MONEY;	DECLARE @Current_Freight MONEY;	DECLARE @Customer_id nchar(5);		SELECT @Current_Freight = Freight FROM inserted;	SELECT @Customer_id = CustomerID FROM inserted;	Execute @AVG_Freight = spAvgFreight @Customer_id;	IF @AVG_Freight < @Current_Freight	BEGIN		RAISERROR('above value.', 16, 1);		ROLLBACK TRANSACTION;	ENDENDUPDATE [Orders] SET Freight = 9 where OrderID = 10248;



