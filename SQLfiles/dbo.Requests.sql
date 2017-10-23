CREATE TABLE [dbo].[Requests] (
    [Id]        INT          IDENTITY (1, 1) NOT NULL,
    [BookId]    INT          NOT NULL,
    [UserId]    VARCHAR (50) NOT NULL,
    [Timestamp] DATETIME     NOT NULL,
    [Processed] INT NOT NULL, 
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

