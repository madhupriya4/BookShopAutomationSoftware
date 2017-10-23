CREATE TABLE [dbo].[Book] (
    [ISBN]         INT           NOT NULL,
    [Name]         VARCHAR (255) NOT NULL,
    [Author]       VARCHAR (255) NOT NULL,
    [Publisher]    VARCHAR (255) NULL,
    [Category]     VARCHAR (50)  NOT NULL,
    [Availability] INT           NOT NULL,
    [Price]        MONEY         NOT NULL,
    [Address] VARCHAR(255) NULL, 
    [NoOfDays] INT NULL, 
    PRIMARY KEY CLUSTERED ([ISBN] ASC)
);

