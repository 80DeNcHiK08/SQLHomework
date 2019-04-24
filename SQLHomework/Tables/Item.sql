CREATE TABLE [dbo].[Item]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ItemName] VARCHAR(MAX) NOT NULL, 
    [Description] TEXT NULL, 
    [Price] REAL NOT NULL
)
