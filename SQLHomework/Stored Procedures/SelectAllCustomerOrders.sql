CREATE PROCEDURE [dbo].[SelectAllCustomerOrders](@customerId INT)
AS SELECT o.Id, i.ItemName, o.IsArrived
	FROM Customers AS c 
		INNER JOIN Orders AS o ON c.Id = o.CustomerId
		INNER JOIN Item AS i ON i.Id = o.ItemId
	WHERE c.Id = @customerId
RETURN 0
