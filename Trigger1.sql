


--CREATE TRIGGER Trigger1
ALTER TRIGGER Trigger1

ON Orders
	FOR INSERT, UPDATE
AS 
BEGIN
   DECLARE @AvgFreight DECIMAL;
   DECLARE @Freight DECIMAL;
   EXEC @AvgFreight = CalculateAverageFreight;

   SELECT @Freight = i.Freight FROM inserted i;
   IF @Freight > @AvgFreight
   BEGIN
	   RAISERROR ('Freight does exceed the average freight!', 16, 1)
	   ROLLBACK TRANSACTION
	END
END




