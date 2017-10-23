SET IDENTITY_INSERT [dbo].[User] ON
INSERT INTO [dbo].[User] ([Id], [RoleId], [Name], [UserId], [Password], [emailId], [DOB]) VALUES (1, 3, N'Administrator', N'admin', N'admin123', N'admin@example.com', NULL)
INSERT INTO [dbo].[User] ([Id], [RoleId], [Name], [UserId], [Password], [emailId], [DOB]) VALUES (2, 2, N'SalesClerk1', N'clerk1', N'clerk1abc', N'clerk1@gmail.com', NULL)
INSERT INTO [dbo].[User] ([Id], [RoleId], [Name], [UserId], [Password], [emailId], [DOB]) VALUES (3, 2, N'SalesClerk2', N'clerk2', N'clerk2abc', N'clerk2@gmail.com', NULL)
INSERT INTO [dbo].[User] ([Id], [RoleId], [Name], [UserId], [Password], [emailId], [DOB]) VALUES (4, 1, N'Madhu', N'madhu', N'abc', N'mappi94@gmail.com', N'1994-04-12')
INSERT INTO [dbo].[User] ([Id], [RoleId], [Name], [UserId], [Password], [emailId], [DOB]) VALUES (5, 1, N'priya', N'priya', N'def', N'deef@exe.com', N'1994-04-12')
SET IDENTITY_INSERT [dbo].[User] OFF
