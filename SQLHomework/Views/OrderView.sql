CREATE VIEW [dbo].[OrderView]
	AS SELECT c.Name, i.ItemName FROM [Orders] o, [Customers] c, [Item] i where o.CustomerId = c.Id AND o.ItemId = i.Id AND o.IsArrived = 0;
