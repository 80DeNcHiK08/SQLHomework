/*
Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут добавлены в скрипт построения.		
 Используйте синтаксис SQLCMD для включения файла в скрипт после развертывания.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте после развертывания.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

USE [SQLHomework];
PRINT('PostDeployment Script')

IF(EXISTS(SELECT * FROM [Customers]))
BEGIN
	PRINT N'Creating [dbo].[Customers]'
	DROP TABLE Customers
	CREATE TABLE [dbo].[Customers]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
		[Name] VARCHAR(50) NULL, 
		[Email] VARCHAR(MAX) NOT NULL, 
		[PasswordHashed] VARCHAR(MAX) NOT NULL
	)
	PRINT N'Inserting data into [dbo].[Customers]'
	INSERT INTO [dbo].[Customers] (Name, Email, PasswordHashed)
	VALUES
		("Denis", "den_kr1234@gmail.com", "$5$MnfsQ4iN$ZMTppKN16y/tIsUYs/obHlhdP.Os80yXhTurpBMUbA5$5$rounds=5000$usesomesillystri$KqJWpanXZHKq2BOB43TSaYhEWsQ1Lr5QNyPCDH/Tp.6"),
		("Maria", "pineapple.friend@gmail.com", "$6$zWwwXKNj$gLAOoZCjcr8p/.VgV/FkGC3NX7BsXys3KHYePfuIGMNjY83dVxugPYlxVg/evpcVEJLT/rSwZcDMlVVf/bhf.1$6$rounds=5000$usesomesillystri$D4IrlXatmP7rx3P3InaxBeoomnAihCKRVQP22JZ6EY47Wc6BkroIuUUBOov1i.S5KPgErtP/EN5mcO.ChWQW21"),
		("Vladimir", "go.Vlad141295@gmail.com", "0E6A48F765D0FFFFF6247FA80D748E615F91DD0C7431E4D9");
END

IF(EXISTS(SELECT * FROM [Item]))
BEGIN
	PRINT N'Creating [dbo].[Item]'
	DROP TABLE Item
	CREATE TABLE [dbo].[Item]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
		[ItemName] VARCHAR(MAX) NOT NULL, 
		[Description] TEXT NULL, 
		[Price] REAL NOT NULL
	)
	PRINT N'Inserting data into [dbo].[Item]'
	INSERT INTO [dbo].[Item](ItemName, Description, Price)
	VALUES
		("item-1", "description-1", 13.99),
		("item-2", "description-2", 2.59),
		("item-3", "description-3", 3.99),
		("item-4", "description-4", 99.99),
		("item-5", "description-5", 73.49);
END

IF(EXISTS(SELECT * FROM [Orders]))
BEGIN
	PRINT N'Creating [dbo].[Orders]'
	DROP TABLE Orders
	CREATE TABLE [dbo].[Orders]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
		[CustomerId] INT NOT NULL,
		FOREIGN KEY(CustomerId) REFERENCES Customers(Id),
		[ItemId] INT NOT NULL, 
		FOREIGN KEY(ItemId) REFERENCES Item(Id),
		[IsArrived] BIT NOT NULL DEFAULT 0
	)
	PRINT N'Inserting data into [dbo].[Orders]'
	INSERT INTO [dbo].[Orders](CustomerId, ItemId, IsArrived)
	VALUES
		( 2, 1, 0),
		( 1, 1, 1),
		( 3, 4, 1),
		( 3, 2, 0),
		( 2, 2, 1);
END