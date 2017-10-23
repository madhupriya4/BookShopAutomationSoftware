CREATE TABLE [dbo].[Order] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [BookId]    INT           NOT NULL,
    [BookName]  VARCHAR (255) NOT NULL,
    [Publisher] VARCHAR (255) NOT NULL,
    [Quantity]  INT           NOT NULL,
    [Urgent]    INT           NULL,
    [UserId]    VARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

