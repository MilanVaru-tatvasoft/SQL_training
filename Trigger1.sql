

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

CREATE TRIGGER Trigger1ON Orders	FOR INSERT, UPDATEAS BEGIN   DECLARE @AvgFreight DECIMAL;   DECLARE @Freight DECIMAL;   EXEC @AvgFreight = Procedure1;   SELECT @Freight = i.Freight FROM inserted i;   IF @Freight > @AvgFreight   BEGIN	   RAISERROR ('Freight does exceed the average freight!', 16, 1)	   ROLLBACK TRANSACTION	ENDENDALTER TRIGGER Trigger1ON Orders	FOR INSERT, UPDATEAS BEGIN   DECLARE @AvgFreight DECIMAL;   DECLARE @Freight DECIMAL;   EXEC @AvgFreight = Procedure1;   SELECT @Freight = i.Freight FROM inserted i;   IF @Freight > @AvgFreight   BEGIN	   RAISERROR ('Freight does exceed the average freight!', 16, 1)	   ROLLBACK TRANSACTION	ENDEND

