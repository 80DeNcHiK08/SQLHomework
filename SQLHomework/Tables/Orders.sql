CREATE TABLE [dbo].[Orders]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [CustomerId] INT NOT NULL,
	FOREIGN KEY(CustomerId) REFERENCES Customers(Id),
    [ItemId] INT NOT NULL, 
	FOREIGN KEY(ItemId) REFERENCES Item(Id),
    [IsArrived] BIT NOT NULL DEFAULT 0
)
