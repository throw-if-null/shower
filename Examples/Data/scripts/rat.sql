-- Create a new database called 'rat'
-- Connect to the 'master' database to run this snippet
USE master
GO

-- Create the new database if it does not exist already
IF EXISTS (SELECT [name] FROM sys.databases WHERE [name] = N'Rat')
	ALTER DATABASE Rat SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE rat

CREATE DATABASE Rat
GO

USE Rat

CREATE TABLE [dbo].[Configuration]
(
	[Id] INT NOT NULL IDENTITY(1, 1),
	[Key] NVARCHAR(254) NOT NULL,
	[Value] NVARCHAR(500) NOT NULL,
	[Expires] INT NOT NULL DEFAULT(60)

	CONSTRAINT [PK_Configuration_Id] PRIMARY KEY ([Id] ASC),
	CONSTRAINT [UQ_Configuration_Key] UNIQUE ([Key])
);

GO

CREATE NONCLUSTERED INDEX [UX_Rat_Key] ON [dbo].[Configuration] ([Key]);

GO

-- Insert rows into table 'Configuration' in schema '[dbo]'
INSERT INTO [dbo].[Configuration]
( -- Columns to insert data into
 [Key], [Value], [Expires]
)
VALUES
('A1', 'Hellow SQL', 300),
('A2', 'Jello SQL', 240),
('B1', 'Hallo SQL', 60),
('C1', 'Hi SQL Value', 3000)
GO