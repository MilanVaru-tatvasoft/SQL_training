

--CREATE TRIGGER CheckFreight ON [Orders] 
--AFTER INSERT, UPDATE 
--AS 
--BEGIN
--	DECLARE @CustomerID nchar(5)

--		IF EXISTS (SELECT 1 FROM inserted)
--		BEGIN
--			SELECT @CustomerID = CustomerID
--			FROM inserted
--		END
--		ELSE
--		BEGIN
--			SELECT @CustomerID = CustomerID
--			FROM deleted
--		END

--		DECLARE @AverageFreight DECIMAL

--		EXEC CalculateAverageFreight @CustomerID, @AverageFright OUTPUT
--		IF EXISTS (SELECT 1 FROM inserted i WHERE i.Freight > @AverageFreight)
--		BEGIN
--			 RAISERROR('Freight exceeds average value.', 16, 1)
--			 ROLLBACK TRANSACTION
--		END;
			
-- END


