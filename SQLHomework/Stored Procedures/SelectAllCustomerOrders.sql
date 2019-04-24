CREATE PROCEDURE [dbo].[SelectAllCustomerOrders](@customerId INT)
AS SELECT Item.ItemName
	FROM Item AS it INNER JOIN Orders on i
	WHERE CustomerId = @customerId
RETURN 0
