USE [gaming_configuration]
GO
/****** Object:  User [gaming_configuration_app]    Script Date: 2017-10-05 13:42:07 ******/
CREATE USER gaming_account_app FOR LOGIN [gaming_account_app] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_executor] ADD MEMBER [gaming_account_app]
GO
ALTER ROLE [db_datareader] ADD MEMBER [gaming_account_app]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [gaming_account_app]
GO