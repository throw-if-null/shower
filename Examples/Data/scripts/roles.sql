USE [rat]
GO
/****** Object:  User [gaming_configuration_app]    Script Date: 2017-10-05 13:42:07 ******/
CREATE USER rat_user FOR LOGIN [rat_app] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_executor] ADD MEMBER [rat_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rat_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rat_user]
GO