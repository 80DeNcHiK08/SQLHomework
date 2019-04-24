CREATE PROCEDURE [dbo].[DeleteAllCompletedOrdersForCustomer](@customerId INTEGER, @toDelete INT OUTPUT)
AS SELECT @toDelete = COUNT(*)
	FROM Orders
	WHERE CustomerId = @customerId AND IsArrived = 1
DELETE FROM Orders
	WHERE CustomerId = @customerId AND IsArrived = 1
RETURN 0
