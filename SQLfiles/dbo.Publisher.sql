CREATE TABLE [dbo].[Publisher]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [BookName] VARCHAR(255) NOT NULL, 
    [Name] VARCHAR(50) NOT NULL, 
    [Address] VARCHAR(255) NOT NULL, 
    [NoOfDays] INT NOT NULL
)
