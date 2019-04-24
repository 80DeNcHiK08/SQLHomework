CREATE TABLE [dbo].[Customers]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NULL, 
    [Email] VARCHAR(MAX) NOT NULL, 
    [PasswordHashed] VARCHAR(MAX) NOT NULL
)
