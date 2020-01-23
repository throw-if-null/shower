USE [master]
GO
/****** Object:  Database [gaming_configuration]    Script Date: 2018-01-12 10:33:02 ******/
CREATE DATABASE [gaming_configuration]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gaming_configuration', FILENAME = N'/var/opt/mssql/data/gaming_configuration.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'gaming_configuration_log', FILENAME = N'/var/opt/mssql/data/gaming_configuration_log.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [gaming_configuration] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gaming_configuration].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gaming_configuration] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gaming_configuration] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gaming_configuration] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gaming_configuration] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gaming_configuration] SET ARITHABORT OFF 
GO
ALTER DATABASE [gaming_configuration] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gaming_configuration] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gaming_configuration] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gaming_configuration] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gaming_configuration] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gaming_configuration] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gaming_configuration] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gaming_configuration] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gaming_configuration] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gaming_configuration] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gaming_configuration] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gaming_configuration] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gaming_configuration] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gaming_configuration] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gaming_configuration] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gaming_configuration] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gaming_configuration] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gaming_configuration] SET RECOVERY FULL 
GO
ALTER DATABASE [gaming_configuration] SET  MULTI_USER 
GO
ALTER DATABASE [gaming_configuration] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gaming_configuration] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gaming_configuration] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gaming_configuration] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [gaming_configuration] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'gaming_configuration', N'ON'
GO






















USE [gaming_configuration]
GO
/****** Object:  User [gaming_configuration_app]    Script Date: 2018-01-12 10:33:02 ******/
CREATE USER [gaming_configuration_app] FOR LOGIN [gaming_configuration_app] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [db_executor]    Script Date: 2018-01-12 10:33:02 ******/
CREATE ROLE [db_executor]
GO
GRANT EXECUTE TO [db_executor]
GO
ALTER ROLE [db_executor] ADD MEMBER [gaming_configuration_app]
GO
ALTER ROLE [db_datareader] ADD MEMBER [gaming_configuration_app]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [gaming_configuration_app]
GO
/****** Object:  Table [dbo].[tbiGameClassification]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbiGameClassification](
	[biGameClassificationId] [int] NOT NULL,
	[biGameClassificationName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tbiGameClassification] PRIMARY KEY CLUSTERED 
(
	[biGameClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbiGameSubClassification]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbiGameSubClassification](
	[biGameSubClassificationId] [int] NOT NULL,
	[biGameSubClassificationName] [nvarchar](100) NOT NULL,
	[biGameClassificationId] [int] NOT NULL,
 CONSTRAINT [PK_tBiGameSubClassification] PRIMARY KEY CLUSTERED 
(
	[biGameSubClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbrand]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbrand](
	[brandId] [int] NOT NULL,
	[brandName] [nvarchar](100) NOT NULL,
    [active] [bit] NOT NULL CONSTRAINT [DF_tbrand_active]  DEFAULT ((1)),
 CONSTRAINT [PK_tbrand] PRIMARY KEY CLUSTERED 
(
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbrand_jurisdictionProviderGameplayInstance]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbrand_jurisdictionProviderGameplayInstance](
	[brandId] [int] NOT NULL,
	[providerId] [int] NOT NULL,
	[jurisdictionId] [int] NOT NULL,
	[instanceId] [int] NOT NULL,
 CONSTRAINT [PK_tbrand_jurisdictionProviderGameplayInstance] PRIMARY KEY CLUSTERED 
(
	[brandId] ASC,
	[providerId] ASC,
	[jurisdictionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbrand_productBlockContext]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbrand_productBlockContext](
	[brandId] [int] NOT NULL,
	[productBlockContextId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productBlockContextId] ASC,
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbrand_provider]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbrand_provider](
	[brandId] [int] NOT NULL,
	[providerId] [int] NOT NULL,
	[useGpiWinners] [bit] NOT NULL,
 CONSTRAINT [PK_tbrand_provider] PRIMARY KEY CLUSTERED 
(
	[brandId] ASC,
	[providerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[tChangeLog]    Script Date: 24/04/2018 16:53:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tchangeLog](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user] [nvarchar](50) NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[area] [nvarchar](100) NOT NULL,
	[methodName] [nvarchar](100) NOT NULL,
	[activityId] [uniqueidentifier] NOT NULL,
	[before] [nvarchar](max) NULL,
	[after] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tChangeLog] ADD  DEFAULT (getutcdate()) FOR [timestamp]
GO

/****** Object:  Table [dbo].[tchannel]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tchannel](
	[channelId] [int] NOT NULL,
	[channelName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tchannel] PRIMARY KEY CLUSTERED 
(
	[channelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tgame]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tgame](
	[gameId] [nvarchar](100) NOT NULL,
	[gameName] [nvarchar](255) NOT NULL,
	[providerId] [int] NOT NULL,
	[providerGameId] [nvarchar](100) NOT NULL,
	[walletGameId] [int] NOT NULL,
	[providerGPIGameId] [nvarchar](100) NULL,
	[height] [int] NULL,
	[width] [int] NULL,
	[gameLaunchType] [nvarchar](50) NULL,
	[funModeDisabled] [bit] NULL,
	[gameType] [nvarchar](50) NULL,
 CONSTRAINT [PK_tgame] PRIMARY KEY CLUSTERED 
(
	[gameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[tgame_aams]    Script Date: 2018-03-29 12:59:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tgame_aams](
	[gameId] [nvarchar](100) NOT NULL,
	[providerId] [int] NOT NULL,
	[gameName] [nvarchar](255) NOT NULL,
	[allowFunBonusMoney] [bit] NOT NULL,
	[AamsGameCode] [int] NOT NULL,
 CONSTRAINT [PK_tgame_aams] PRIMARY KEY CLUSTERED 
(
	[gameId] ASC,
	[providerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 93) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[tgame_channel]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tgame_channel](
	[gameId] [nvarchar](100) NOT NULL,
	[channelId] [int] NOT NULL,
 CONSTRAINT [UQ_gameId_channelId] UNIQUE NONCLUSTERED 
(
	[gameId] ASC,
	[channelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tgame_gameStudio]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tgame_gameStudio](
	[gameId] [nvarchar](100) NOT NULL,
	[gameStudioId] [int] NOT NULL,
	[providerId] [int] NOT NULL,
 CONSTRAINT [PK_tgame_gameStudio] PRIMARY KEY CLUSTERED 
(
	[gameId] ASC,
	[gameStudioId] ASC,
	[providerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tgameBiMetaData]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tgameBiMetaData](
	[gameId] [nvarchar](100) NOT NULL,
	[biGameSubClassificationId] [int] NOT NULL,
UNIQUE NONCLUSTERED 
(
	[gameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tgameBlock_countryBlock]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tgameBlock_countryBlock](
	[gameId] [nvarchar](100) NOT NULL,
	[blockedCountry] [char](2) NOT NULL,
 CONSTRAINT [PK_tgameBlock_countryBlock] PRIMARY KEY CLUSTERED 
(
	[gameId] ASC,
	[blockedCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tgameBlock_ipCountryBlock]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tgameBlock_ipCountryBlock](
	[gameId] [nvarchar](100) NOT NULL,
	[blockedIpCountry] [char](2) NOT NULL,
	[blockTypeBitMask] [tinyint] NOT NULL CONSTRAINT [DF_tgameBlock_ipCountryBlock_blockTypeBitMask]  DEFAULT ((3)),
 CONSTRAINT [PK_tgameBlock_ipCountryBlock] PRIMARY KEY CLUSTERED 
(
	[gameId] ASC,
	[blockedIpCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tgameLaunchType]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tgameLaunchType](
	[gameLaunchType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tgameLaunchType_1] PRIMARY KEY CLUSTERED 
(
	[gameLaunchType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tgameMetaInformation]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tgameMetaInformation](
	[gameId] [nvarchar](100) NOT NULL,
	[rtp] [decimal](20, 4) NULL,
	[hitFrequency] [decimal](18, 4) NULL,
	[volatility] [int] NULL,
	[multiplier] [int] NULL,
	[reelSet] [nvarchar](50) NULL,
	[betLines] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[gameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tgameStudio]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tgameStudio](
	[gameStudioId] [int] NOT NULL,
	[gameStudioName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tgameStudio] PRIMARY KEY CLUSTERED 
(
	[gameStudioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tgameType]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tgameType](
	[gameType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tgameType] PRIMARY KEY CLUSTERED 
(
	[gameType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tjurisdiction]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tjurisdiction](
	[jurisdictionId] [smallint] NOT NULL,
	[jurisdictionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tjurisdiction] PRIMARY KEY CLUSTERED 
(
	[jurisdictionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tproduct]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tproduct](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tproduct_context]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tproduct_context](
	[productId] [int] NOT NULL,
	[contextId] [int] NOT NULL,
	[contextCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tproduct_context] PRIMARY KEY CLUSTERED 
(
	[contextCode] ASC,
	[contextId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tproductBlockContext]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tproductBlockContext](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[isEditable] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tprovider]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tprovider](
	[providerId] [int] NOT NULL,
	[providerName] [nvarchar](100) NOT NULL,
	[integrationType] [nvarchar](100) NOT NULL,
	[gameSessionType] [nvarchar](50) NULL,
	[gameLaunchTypeOrder] [nvarchar](50) NULL,
	[providerParameters] [bit] NULL CONSTRAINT [DF_tprovider_providerParameters]  DEFAULT ((0)),
	[accountCreationType] [nvarchar](50) NULL CONSTRAINT [DF_tprovider_accountCreationType]  DEFAULT (N'LocalOnly'),
	[active] [bit] NOT NULL CONSTRAINT [DF_tprovider_active]  DEFAULT ((1)),
 CONSTRAINT [PK_tprovider] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tprovider_evolutionCasinoDGLEndpoint]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tprovider_evolutionCasinoDGLEndpoint](
	[id] [int] NOT NULL,
	[endpointURL] [nvarchar](1024) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tprovider_evolutionCasinoDGLEndpoint_Brand]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tprovider_evolutionCasinoDGLEndpoint_Brand](
	[brandId] [int] NOT NULL,
	[endpointId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[tprovider_gameStudio]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tprovider_gameStudio](
	[providerId] [int] NOT NULL,
	[gameStudioId] [int] NOT NULL,
 CONSTRAINT [PK_tprovider_gameStudio] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[gameStudioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[tprovider_product]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tprovider_product](
	[providerId] [int] NOT NULL,
	[productId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC,
	[providerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tprovider_subproduct]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tprovider_subproduct](
	[providerId] [int] NOT NULL,
	[subproductId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subproductId] ASC,
	[providerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tproviderblock_countryBlock]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tproviderblock_countryBlock](
	[providerId] [int] NOT NULL,
	[blockedCountry] [char](2) NOT NULL,
 CONSTRAINT [PK_tproviderblock_countryBlock] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[blockedCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tproviderblock_ipCountryBlock]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tproviderblock_ipCountryBlock](
	[providerId] [int] NOT NULL,
	[blockedIpCountry] [char](2) NOT NULL,
 CONSTRAINT [PK_tproviderblock_ipCountryBlock] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[blockedIpCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tproviderblock_ipWhiteList]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tproviderblock_ipWhiteList](
	[providerId] [int] NOT NULL,
	[allowedIpAddress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tproviderblock_ipWhiteList] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[allowedIpAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tproviderGameLaunchTypes]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tproviderGameLaunchTypes](
	[providerId] [int] NOT NULL,
	[gameLaunchType] [nvarchar](50) NOT NULL,
    [gameplayLogicType] BIT           CONSTRAINT [DF_tproviderGameLaunchTypes_gameplayLogicType] DEFAULT ((0)) NOT NULL,	
	CONSTRAINT [PK_tproviderGameLaunchTypes] PRIMARY KEY CLUSTERED ([providerId] ASC, [gameLaunchType] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tproviderGameplayInstance]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tproviderGameplayInstance](
	[instanceId] [int] IDENTITY(1,1) NOT NULL,
	[providerId] [int] NOT NULL,
	[sessionTimeoutInSeconds] [int] NOT NULL,
 CONSTRAINT [PK_tproviderInstance] PRIMARY KEY CLUSTERED 
(
	[instanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tproviderGameplayInstanceParameters]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tproviderGameplayInstanceParameters](
	[instanceId] [int] NOT NULL,
	[parameterName] [nvarchar](50) NOT NULL,
	[parameterValue] [nvarchar](max) NOT NULL,
	[gameModeType] [int] NOT NULL,
	[gameLaunchType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tproviderInstanceParameters] PRIMARY KEY CLUSTERED 
(
	[instanceId] ASC,
	[parameterName] ASC,
	[gameModeType] ASC,
	[gameLaunchType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tproviderGameplayParameters]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tproviderGameplayParameters](
	[providerId] [int] NOT NULL,
	[parameterName] [nvarchar](50) NOT NULL,
	[parameterValue] [nvarchar](max) NOT NULL,
	[gameModeType] [int] NOT NULL,
	[isCustom] [bit] NOT NULL,
	[comment] [nvarchar](max) NULL,
	[gameLaunchType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tproviderGameplayParameters] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[parameterName] ASC,
	[gameModeType] ASC,
	[gameLaunchType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tproviderGameType]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tproviderGameType](
	[providerId] [int] NOT NULL,
	[gameType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tproviderGameType] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[gameType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tproviderInstanceConfigurationParameterValues]    Script Date: 2018-08-23 13:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tproviderInstanceConfigurationParameterValues](
	[instanceId] [int] NOT NULL,
	[key] [nvarchar](100) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tproviderInstanceConfigurationParameterValues] PRIMARY KEY CLUSTERED 
(
	[instanceId] ASC,
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 93) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[tproviderLanguage]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tproviderLanguage](
	[providerId] [int] NOT NULL,
	[languageCode] [char](2) NOT NULL,
	[providerLanguageCode] [nvarchar](10) NOT NULL,
	[defaultLanguage] [bit] NOT NULL,
 CONSTRAINT [PK_tproviderLanguage] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[languageCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tstandardGameplay_compare]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tstandardGameplay_compare](
	[requestId] [uniqueidentifier] NOT NULL,
	[entryDate] [datetime] NOT NULL,
	[requestType] [nvarchar](50) NOT NULL,
	[oldExectutionTime] [int] NOT NULL,
	[newExecutionTime] [int] NOT NULL,
	[oldErrorCode]        INT              NULL,
    [newErrorId]          NVARCHAR (50)    NULL,
	[parameterDifference] [nvarchar](max) NULL,
	[brandId] INT NULL, 
    [providerId] INT NULL, 
	[requestParameters] [nvarchar](max) NULL,
 CONSTRAINT [PK_tstandardGameplay_compare] PRIMARY KEY CLUSTERED 
(
	[requestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tstandardPokerProviderConfiguration]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tstandardPokerProviderConfiguration](
	[providerId] [int] NOT NULL,
	[brandId] [int] NOT NULL,
	[callerName] [nvarchar](50) NOT NULL,
	[callerPassword] [nvarchar](50) NOT NULL,
	[defaultBonusContext] [nvarchar](50) NOT NULL,
	[allowOfflineWithdraw] [bit] NOT NULL,
	[allowCredentialLogin] [bit] NOT NULL,
	[isAliasHandledOnProviderSide] [bit] NOT NULL,
	[aliasUniqueness] [nvarchar](50) NOT NULL,
	[aliasMaxLength] [int] NOT NULL,
	[allowedAliasCharacters] [nvarchar](255) NOT NULL,
	[defaultGameId] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tstandardPokerProviderConfiguration] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tstandardPokerProviderGameClient]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tstandardPokerProviderGameClient](
	[providerId] [int] NOT NULL,
	[brandId] [int] NOT NULL,
	[gameId] [nvarchar](255) NOT NULL,
	[gameUrl] [nvarchar](max) NOT NULL,
	[doCreateSession] [bit] NOT NULL,
 CONSTRAINT [PK_tstandardPokerProviderGameClient] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[brandId] ASC,
	[gameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tstandardProviderAccountAPIConfiguration]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tstandardProviderAccountAPIConfiguration](
	[providerId] [int] NOT NULL,
	[brandId] [int] NOT NULL,
	[callerName] [nvarchar](50) NOT NULL,
	[callerPassword] [nvarchar](50) NOT NULL,
	[registrationApiUrl] [nvarchar](max) NULL,
	[registrationServiceType] [nvarchar](50) NULL,
	[updateApiUrl] [nvarchar](max) NULL,
	[updateServiceType] [nvarchar](50) NULL,
 CONSTRAINT [PK_tstandardProviderAccountAPIConfiguration] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tstandardProviderFreeSpinsAPIConfiguration]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tstandardProviderFreeSpinsAPIConfiguration](
	[providerId] [int] NOT NULL,
	[brandId] [int] NOT NULL,
	[callerName] [nvarchar](50) NOT NULL,
	[callerPassword] [nvarchar](50) NOT NULL,
	[apiUrl] [nvarchar](max) NOT NULL,
	[serviceType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tstandardProviderFreeSpinsAPIConfiguration] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tstandarProviderInstanceConfiguration]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tstandarProviderInstanceConfiguration](
	[providerId] [int] NOT NULL,
	[brandId] [int] NOT NULL,
	[callerName] [nvarchar](50) NOT NULL,
	[callerPassword] [nvarchar](50) NOT NULL,
	[defaultBonusContext] [nvarchar](50) NULL,
	[freespinBonusDefinitionId] [int] NULL,
	[ignoreSessionRef] [bit] NOT NULL,
	[allowOfflineWithdraw] [bit] NOT NULL,
	[allowedCustomerProperties] [nvarchar](max) NULL,
 CONSTRAINT [PK_tstandarProviderInstanceConfiguration] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tstandarProviderJackpotAPIConfiguration]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tstandarProviderJackpotAPIConfiguration](
	[providerId] [int] NOT NULL,
	[brandId] [int] NOT NULL,
	[callerName] [nvarchar](50) NOT NULL,
	[callerPassword] [nvarchar](50) NOT NULL,
	[apiUrl] [nvarchar](max) NOT NULL,
	[serviceType] [nvarchar](50) NOT NULL,
	[operatorId] [nvarchar](50) NULL,
 CONSTRAINT [PK_tstandarProviderJackpotAPIConfiguration] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tstandarSportsbookProviderInstanceConfiguration]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tstandarSportsbookProviderInstanceConfiguration](
	[providerId] [int] NOT NULL,
	[brandId] [int] NOT NULL,
	[callerName] [nvarchar](50) NOT NULL,
	[callerPassword] [nvarchar](50) NOT NULL,
	[defaultBonusContext] [nvarchar](50) NULL,
	[freespinBonusDefinitionId] [int] NULL,
	[allowOfflineWithdraw] [bit] NOT NULL,
	[allowedCustomerProperties] [nvarchar](max) NULL,
	[oddsRangeMappingId] [int] NOT NULL,
 CONSTRAINT [PK_tstandarSportsbookProviderInstanceConfiguration] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC,
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tsubproduct]    Script Date: 2018-01-12 10:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tsubproduct](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[productId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Index [IX_tgame__walletGameId]    Script Date: 2018-01-12 10:33:02 ******/
CREATE NONCLUSTERED INDEX [IX_tgame__walletGameId] ON [dbo].[tgame]
(
	[walletGameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 93) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tgame_channel__channelId_incl_gameId]    Script Date: 2018-01-12 10:33:02 ******/
CREATE NONCLUSTERED INDEX [IX_tgame_channel__channelId_incl_gameId] ON [dbo].[tgame_channel]
(
	[channelId] ASC
)
INCLUDE ( 	[gameId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO






ALTER TABLE [dbo].[tbiGameSubClassification]  WITH CHECK ADD  CONSTRAINT [FK_tBiGameSubClassification_REF_tBiGameClassification_biGameClassificationId] FOREIGN KEY([biGameClassificationId])
REFERENCES [dbo].[tbiGameClassification] ([biGameClassificationId])
GO
ALTER TABLE [dbo].[tbiGameSubClassification] CHECK CONSTRAINT [FK_tBiGameSubClassification_REF_tBiGameClassification_biGameClassificationId]
GO
ALTER TABLE [dbo].[tbrand_jurisdictionProviderGameplayInstance]  WITH CHECK ADD  CONSTRAINT [FK_tbrand_jurisdictionProviderGameplayInstance_tprovider] FOREIGN KEY([providerId])
REFERENCES [dbo].[tprovider] ([providerId])
GO
ALTER TABLE [dbo].[tbrand_jurisdictionProviderGameplayInstance] CHECK CONSTRAINT [FK_tbrand_jurisdictionProviderGameplayInstance_tprovider]
GO
ALTER TABLE [dbo].[tbrand_jurisdictionProviderGameplayInstance]  WITH CHECK ADD  CONSTRAINT [FK_tbrand_jurisdictionProviderGameplayInstance_tproviderInstance] FOREIGN KEY([instanceId])
REFERENCES [dbo].[tproviderGameplayInstance] ([instanceId])
GO
ALTER TABLE [dbo].[tbrand_jurisdictionProviderGameplayInstance] CHECK CONSTRAINT [FK_tbrand_jurisdictionProviderGameplayInstance_tproviderInstance]
GO
ALTER TABLE [dbo].[tbrand_productBlockContext]  WITH CHECK ADD  CONSTRAINT [FK_tbrand_productBlockContext_tproductBlockContext] FOREIGN KEY([productBlockContextId])
REFERENCES [dbo].[tproductBlockContext] ([id])
GO
ALTER TABLE [dbo].[tbrand_productBlockContext] CHECK CONSTRAINT [FK_tbrand_productBlockContext_tproductBlockContext]
GO
ALTER TABLE [dbo].[tbrand_provider]  WITH CHECK ADD  CONSTRAINT [FK_tbrand_provider_REF_tbrand_brandId] FOREIGN KEY([brandId])
REFERENCES [dbo].[tbrand] ([brandId])
GO
ALTER TABLE [dbo].[tbrand_provider] CHECK CONSTRAINT [FK_tbrand_provider_REF_tbrand_brandId]
GO
ALTER TABLE [dbo].[tbrand_provider]  WITH CHECK ADD  CONSTRAINT [FK_tbrand_provider_REF_tprovider_providerId] FOREIGN KEY([providerId])
REFERENCES [dbo].[tprovider] ([providerId])
GO
ALTER TABLE [dbo].[tbrand_provider] CHECK CONSTRAINT [FK_tbrand_provider_REF_tprovider_providerId]
GO
ALTER TABLE [dbo].[tgame]  WITH CHECK ADD  CONSTRAINT [FK_tgame_REF_tprovider_providerId] FOREIGN KEY([providerId])
REFERENCES [dbo].[tprovider] ([providerId])
GO
ALTER TABLE [dbo].[tgame] CHECK CONSTRAINT [FK_tgame_REF_tprovider_providerId]
GO
ALTER TABLE [dbo].[tgame_channel]  WITH CHECK ADD  CONSTRAINT [FK_tgame_channel_REF_tchannel_channelId] FOREIGN KEY([channelId])
REFERENCES [dbo].[tchannel] ([channelId])
GO
ALTER TABLE [dbo].[tgame_channel] CHECK CONSTRAINT [FK_tgame_channel_REF_tchannel_channelId]
GO
ALTER TABLE [dbo].[tgame_channel]  WITH CHECK ADD  CONSTRAINT [FK_tgame_channel_REF_tgame_gameId] FOREIGN KEY([gameId])
REFERENCES [dbo].[tgame] ([gameId])
GO
ALTER TABLE [dbo].[tgame_channel] CHECK CONSTRAINT [FK_tgame_channel_REF_tgame_gameId]
GO
ALTER TABLE [dbo].[tgame_gameStudio]  WITH CHECK ADD  CONSTRAINT [FK_tgame_gameStudio_tgame] FOREIGN KEY([gameId])
REFERENCES [dbo].[tgame] ([gameId])
GO
ALTER TABLE [dbo].[tgame_gameStudio] CHECK CONSTRAINT [FK_tgame_gameStudio_tgame]
GO
ALTER TABLE [dbo].[tgame_gameStudio]  WITH CHECK ADD  CONSTRAINT [FK_tgame_gameStudio_tprovider_gameStudio] FOREIGN KEY([providerId], [gameStudioId])
REFERENCES [dbo].[tprovider_gameStudio] ([providerId], [gameStudioId])
GO
ALTER TABLE [dbo].[tgame_gameStudio] CHECK CONSTRAINT [FK_tgame_gameStudio_tprovider_gameStudio]
GO
ALTER TABLE [dbo].[tgameBiMetaData]  WITH CHECK ADD  CONSTRAINT [FK_tgameBiMetaData_REF_tbiGameSubClassification_biGameSubClassification] FOREIGN KEY([biGameSubClassificationId])
REFERENCES [dbo].[tbiGameSubClassification] ([biGameSubClassificationId])
GO
ALTER TABLE [dbo].[tgameBiMetaData] CHECK CONSTRAINT [FK_tgameBiMetaData_REF_tbiGameSubClassification_biGameSubClassification]
GO
ALTER TABLE [dbo].[tgameBiMetaData]  WITH CHECK ADD  CONSTRAINT [FK_tgameBiMetaData_REF_tgame_gameId] FOREIGN KEY([gameId])
REFERENCES [dbo].[tgame] ([gameId])
GO
ALTER TABLE [dbo].[tgameBiMetaData] CHECK CONSTRAINT [FK_tgameBiMetaData_REF_tgame_gameId]
GO
ALTER TABLE [dbo].[tgameMetaInformation]  WITH CHECK ADD  CONSTRAINT [FK_tgameMetaInformation_tgame] FOREIGN KEY([gameId])
REFERENCES [dbo].[tgameMetaInformation] ([gameId])
GO
ALTER TABLE [dbo].[tgameMetaInformation] CHECK CONSTRAINT [FK_tgameMetaInformation_tgame]
GO
ALTER TABLE [dbo].[tproduct_context]  WITH CHECK ADD  CONSTRAINT [FK_tproduct_context_tproductBlockContext] FOREIGN KEY([contextId])
REFERENCES [dbo].[tproductBlockContext] ([id])
GO
ALTER TABLE [dbo].[tproduct_context] CHECK CONSTRAINT [FK_tproduct_context_tproductBlockContext]
GO
ALTER TABLE [dbo].[tprovider_evolutionCasinoDGLEndpoint_Brand]  WITH CHECK ADD  CONSTRAINT [FK_tprovider_evolutionCasinoDGLEndpoint_Brand-tbrand] FOREIGN KEY([brandId])
REFERENCES [dbo].[tbrand] ([brandId])
GO
ALTER TABLE [dbo].[tprovider_evolutionCasinoDGLEndpoint_Brand] CHECK CONSTRAINT [FK_tprovider_evolutionCasinoDGLEndpoint_Brand-tbrand]
GO
ALTER TABLE [dbo].[tprovider_evolutionCasinoDGLEndpoint_Brand]  WITH CHECK ADD  CONSTRAINT [FK_tprovider_evolutionCasinoDGLEndpoint_Brand-tprovider_evolutionCasinoDGLEndpoint] FOREIGN KEY([endpointId])
REFERENCES [dbo].[tprovider_evolutionCasinoDGLEndpoint] ([id])
GO
ALTER TABLE [dbo].[tprovider_evolutionCasinoDGLEndpoint_Brand] CHECK CONSTRAINT [FK_tprovider_evolutionCasinoDGLEndpoint_Brand-tprovider_evolutionCasinoDGLEndpoint]
GO
ALTER TABLE [dbo].[tprovider_gameStudio]  WITH CHECK ADD  CONSTRAINT [FK_tprovider_gameStudio_tgameStudio] FOREIGN KEY([gameStudioId])
REFERENCES [dbo].[tgameStudio] ([gameStudioId])
GO
ALTER TABLE [dbo].[tprovider_gameStudio] CHECK CONSTRAINT [FK_tprovider_gameStudio_tgameStudio]
GO
ALTER TABLE [dbo].[tprovider_product]  WITH CHECK ADD  CONSTRAINT [FK_tprovider_product_tproduct] FOREIGN KEY([productId])
REFERENCES [dbo].[tproduct] ([id])
GO
ALTER TABLE [dbo].[tprovider_product] CHECK CONSTRAINT [FK_tprovider_product_tproduct]
GO
ALTER TABLE [dbo].[tprovider_subproduct]  WITH CHECK ADD  CONSTRAINT [FK_tprovider_subproduct_tsubproduct] FOREIGN KEY([subproductId])
REFERENCES [dbo].[tsubproduct] ([id])
GO
ALTER TABLE [dbo].[tprovider_subproduct] CHECK CONSTRAINT [FK_tprovider_subproduct_tsubproduct]
GO
ALTER TABLE [dbo].[tproviderGameLaunchTypes]  WITH CHECK ADD  CONSTRAINT [FK_tproviderGameLaunchTypes_tgameLaunchType] FOREIGN KEY([gameLaunchType])
REFERENCES [dbo].[tgameLaunchType] ([gameLaunchType])
GO
ALTER TABLE [dbo].[tproviderGameLaunchTypes] CHECK CONSTRAINT [FK_tproviderGameLaunchTypes_tgameLaunchType]
GO
ALTER TABLE [dbo].[tproviderGameLaunchTypes]  WITH CHECK ADD  CONSTRAINT [FK_tproviderGameLaunchTypes_tprovider] FOREIGN KEY([providerId])
REFERENCES [dbo].[tprovider] ([providerId])
GO
ALTER TABLE [dbo].[tproviderGameLaunchTypes] CHECK CONSTRAINT [FK_tproviderGameLaunchTypes_tprovider]
GO
ALTER TABLE [dbo].[tproviderGameplayInstance]  WITH CHECK ADD  CONSTRAINT [FK_tproviderInstance_tprovider] FOREIGN KEY([providerId])
REFERENCES [dbo].[tprovider] ([providerId])
GO
ALTER TABLE [dbo].[tproviderGameplayInstance] CHECK CONSTRAINT [FK_tproviderInstance_tprovider]
GO
ALTER TABLE [dbo].[tproviderGameplayInstanceParameters]  WITH CHECK ADD  CONSTRAINT [FK_tproviderInstanceParameters_tgameLaunchType] FOREIGN KEY([gameLaunchType])
REFERENCES [dbo].[tgameLaunchType] ([gameLaunchType])
GO
ALTER TABLE [dbo].[tproviderGameplayInstanceParameters] CHECK CONSTRAINT [FK_tproviderInstanceParameters_tgameLaunchType]
GO
ALTER TABLE [dbo].[tproviderGameplayInstanceParameters]  WITH CHECK ADD  CONSTRAINT [FK_tproviderInstanceParameters_tproviderInstance] FOREIGN KEY([instanceId])
REFERENCES [dbo].[tproviderGameplayInstance] ([instanceId])
GO
ALTER TABLE [dbo].[tproviderGameplayInstanceParameters] CHECK CONSTRAINT [FK_tproviderInstanceParameters_tproviderInstance]
GO
ALTER TABLE [dbo].[tproviderGameplayParameters]  WITH CHECK ADD  CONSTRAINT [FK_tproviderGameplayParameters_tgameLaunchType] FOREIGN KEY([gameLaunchType])
REFERENCES [dbo].[tgameLaunchType] ([gameLaunchType])
GO
ALTER TABLE [dbo].[tproviderGameplayParameters] CHECK CONSTRAINT [FK_tproviderGameplayParameters_tgameLaunchType]
GO
ALTER TABLE [dbo].[tproviderGameplayParameters]  WITH CHECK ADD  CONSTRAINT [FK_tproviderGameplayParameters_tprovider] FOREIGN KEY([providerId])
REFERENCES [dbo].[tprovider] ([providerId])
GO
ALTER TABLE [dbo].[tproviderGameplayParameters] CHECK CONSTRAINT [FK_tproviderGameplayParameters_tprovider]
GO
ALTER TABLE [dbo].[tproviderGameType]  WITH CHECK ADD  CONSTRAINT [FK_tproviderGameType_tprovider] FOREIGN KEY([providerId])
REFERENCES [dbo].[tprovider] ([providerId])
GO
ALTER TABLE [dbo].[tproviderGameType] CHECK CONSTRAINT [FK_tproviderGameType_tprovider]
GO
ALTER TABLE [dbo].[tsubproduct]  WITH CHECK ADD  CONSTRAINT [FK_tsubproduct_tproduct] FOREIGN KEY([productId])
REFERENCES [dbo].[tproduct] ([id])
GO
ALTER TABLE [dbo].[tsubproduct] CHECK CONSTRAINT [FK_tsubproduct_tproduct]
GO

/****** Object:  Table [dbo].[tproviderZeroBalanceThreshold]    Script Date: 27/06/2018 12:18:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tproviderZeroBalanceThreshold](
	[providerId] [int] NOT NULL,
	[thresholdValue] [decimal](18, 4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[providerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tproviderZeroBalanceThreshold]  WITH CHECK ADD  CONSTRAINT [FK_tproviderZeroBalanceThreshold_REF_tprovider__providerid__providerid] FOREIGN KEY([providerId])
REFERENCES [dbo].[tprovider] ([providerId])
GO

ALTER TABLE [dbo].[tproviderZeroBalanceThreshold] CHECK CONSTRAINT [FK_tproviderZeroBalanceThreshold_REF_tprovider__providerid__providerid]
GO


/****** Object:  StoredProcedure [dbo].[biGameClassification_add]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[biGameClassification_add]
	@classificationId int,
	@classificationName nvarchar(100)
AS

BEGIN

	SET NOCOUNT ON;

    IF NOT EXISTS (SELECT * FROM [dbo].[tBiGameClassification] 
                   WHERE [biGameClassificationId] = @classificationId)
    BEGIN 
        INSERT INTO [dbo].[tBiGameClassification]
               ([biGameClassificationId]
               ,[biGameClassificationName])
         VALUES
               (@classificationId
               ,@classificationName)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[biGameMetaData_add]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[biGameMetaData_add]
    @gameId nvarchar(100),
    @biGameSubClassificationId int
AS

BEGIN

    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT * FROM [dbo].[tgameBiMetaData] 
                   WHERE [gameId] = @gameId)
    BEGIN 
    INSERT INTO [dbo].[tgameBiMetaData]
           ([gameId]
           ,[biGameSubClassificationId])
     VALUES
           (@gameId
           ,@biGameSubClassificationId)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[biGameSubClassification_add]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[biGameSubClassification_add]
    @subClassificationId int,
    @subClassificationName nvarchar(100),
    @classificationId int
AS

BEGIN

    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT * FROM [dbo].[tBiGameSubClassification] 
                   WHERE [biGameSubClassificationId] = @subClassificationId)
    BEGIN 
        INSERT INTO [dbo].[tBiGameSubClassification]
               ([biGameSubClassificationId]
               ,[biGameSubClassificationName]
               ,[biGameClassificationId])
         VALUES
               (@subClassificationId
               ,@subClassificationName
               ,@classificationId)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[channel_add]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[channel_add]
	@channelId int,
	@channelName nvarchar(100)
AS

BEGIN

    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT * FROM [dbo].[tchannel] 
                   WHERE [channelId] = @channelId)
    BEGIN 
        INSERT INTO [dbo].[tchannel]
               ([channelId]
               ,[channelName])
         VALUES
               (@channelId
               ,@channelName)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[channelForGame_add]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[channelForGame_add]
    @gameId nvarchar(100),
    @channelId int
AS

BEGIN

    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT * FROM [dbo].[tgame_channel] 
                   WHERE [gameId] = @gameId AND [channelId] = @channelId )
    BEGIN 
       INSERT INTO [dbo].[tgame_channel]
               ([gameId]
               ,[channelId])
         VALUES
               (@gameId
               ,@channelId)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[CreateProviderGameplayInstance]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CreateProviderGameplayInstance]
@brandId INT,
@providerId INT,
@jurisdictionId INT,
@sessionTimeoutInSeconds INT
AS
BEGIN

	DECLARE @instanceId INT
	INSERT INTO dbo.tproviderGameplayInstance(providerId, sessionTimeoutInSeconds) VALUES (@providerId, @sessionTimeoutInSeconds)
	SELECT @instanceId = ISNULL(MAX(instanceId), 1) FROM dbo.tproviderGameplayInstance WITH(NOLOCK)
	INSERT INTO tbrand_jurisdictionProviderGameplayInstance VALUES (@brandId, @providerId, @jurisdictionId, @instanceId)

	SELECT @instanceId 
END
GO
/****** Object:  StoredProcedure [dbo].[game_add]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[game_add]
	@gameId nvarchar(100),
	@gameName nvarchar(255),
    @providerId int,
    @providerGameId [nvarchar](100),
    @walletGameId int
AS

BEGIN

    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT * FROM [dbo].[tgame] 
            WHERE [gameId] = @gameId)
    BEGIN 
       INSERT INTO [dbo].[tgame]
               ([gameId]          
               ,[gameName]
               ,[providerId]      
               ,[providerGameId]  
               ,[walletGameId])
         VALUES
               (@gameId
               ,@gameName
               ,@providerId
               ,@providerGameId
               ,@walletGameId)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductBlockContexts]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProductBlockContexts]
	
AS

SET NOCOUNT ON;

SELECT 
	id,
	name,
	isEditable
FROM tproductBlockContext
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProducts]
	
AS

SET NOCOUNT ON;

SELECT 
	id,
	name
FROM tproduct
GO
/****** Object:  StoredProcedure [dbo].[GetCountryBlockGameConfiguration]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCountryBlockGameConfiguration]

AS

SET NOCOUNT ON;

SELECT
	g.gameId,
	p.providerName,
	p.providerId,
	countryBlockedGames.blockedCountry
FROM (
	SELECT 
		gameId,
		blockedCountry
	FROM tgameBlock_countryBlock cb with(nolock)

	union

	SELECT 
		gameId,
		blockedCountry
	FROM tproviderblock_countryBlock cb with(nolock)
	INNER JOIN tgame g with(nolock) ON g.providerId = cb.providerId
	) countryBlockedGames
INNER JOIN tgame g with(nolock) ON g.gameId = countryBlockedGames.gameId
INNER JOIN tprovider p with(nolock) ON p.providerId = g.providerId
ORDER BY 1


GO
/****** Object:  StoredProcedure [dbo].[GetIPCountryBlockGameConfiguration]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIPCountryBlockGameConfiguration]

AS

SET NOCOUNT ON;

SELECT
	g.gameId,
	p.providerName,
	p.providerId,
	ipBlockedGames.blockedIpCountry
FROM (
	SELECT
		gameId,
		blockedIpCountry
	FROM tgameBlock_ipCountryBlock with(nolock)

	UNION all

	SELECT
		gameId,
		blockedIpCountry
	FROM tproviderblock_ipCountryBlock ib with(nolock)
	INNER JOIN tgame g with(nolock) ON g.providerId = ib.providerId
	) ipBlockedGames
INNER JOIN tgame g with(nolock) ON g.gameId = ipBlockedGames.gameId
INNER JOIN tprovider p with(nolock) ON p.providerId = g.providerId
ORDER BY 1

GO
/****** Object:  StoredProcedure [dbo].[GetIPWhiteListGameConfiguration]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIPWhiteListGameConfiguration]

AS

SET NOCOUNT ON;

SELECT
	g.gameId,
	p.providerName,
	p.providerId,
	allowedIpAddress
FROM tproviderblock_ipWhiteList iw with(nolock)
INNER JOIN tgame g with(nolock) ON g.providerId = iw.providerId
INNER JOIN tprovider p with(nolock) ON p.providerId = g.providerId


GO
/****** Object:  StoredProcedure [dbo].[GetProductBlockContextsByBrandId]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductBlockContextsByBrandId]
	@brandId int
AS

SET NOCOUNT ON;

SELECT 
	bc.id,
	bc.name,
	bc.isEditable
FROM tproductBlockContext bc
JOIN tbrand_productBlockContext b ON b.productBlockContextId = bc.id
WHERE b.brandId = @brandId
GO
/****** Object:  StoredProcedure [dbo].[GetProductIdByContextCode]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductIdByContextCode]
	@contextId int,
	@contextCode nvarchar(50)
AS

SET NOCOUNT ON;

SELECT 
	productId
FROM tproduct_context
where contextId = @contextId
and contextCode = @contextCode
GO
/****** Object:  StoredProcedure [dbo].[GetProductsByProviderId]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductsByProviderId]
	@providerId int
AS

SET NOCOUNT ON;

SELECT  
	pp.providerId,
	pp.productId,
	sp.id as subproductId
FROM gaming_configuration..tprovider_product pp
LEFT JOIN gaming_configuration..tsubproduct sp 
ON pp.productId = sp.productId
WHERE providerId = @providerId

UNION

SELECT 
	ps.providerId, 
	sp.productId as productId, 
	ps.subproductId
FROM gaming_configuration..tprovider_subproduct ps
JOIN gaming_configuration..tsubproduct sp
ON sp.id = ps.subproductId
WHERE providerId = @providerId
GO
/****** Object:  StoredProcedure [dbo].[GetProvidersByProduct]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProvidersByProduct]
	@productId int
AS

SET NOCOUNT ON;

SELECT 
	product.providerId,
	provider.providerName
FROM tprovider_product product
JOIN tprovider provider ON provider.providerId = product.providerId
WHERE product.productId = @productId
GO
/****** Object:  StoredProcedure [dbo].[GetProvidersBySubproduct]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProvidersBySubproduct]
	@subproductId int
AS

SET NOCOUNT ON;

SELECT 
	subproduct.providerId,
	provider.providerName
FROM tprovider_subproduct subproduct
JOIN tprovider provider ON provider.providerId = subproduct.providerId
WHERE subproduct.subproductId = @subproductId
GO
/****** Object:  StoredProcedure [dbo].[GetSubproductsByProductId]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSubproductsByProductId]
	@productId int 
AS

SET NOCOUNT ON;

SELECT 
	id,
	name,
	productId
FROM tsubproduct 
WHERE productId = @productId
GO
/****** Object:  StoredProcedure [dbo].[jurisdiction_add]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[jurisdiction_add]
	@jurisdictionId INT,
	@jurisdictionName NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS(SELECT * FROM dbo.tjurisdiction WHERE jurisdictionId = @jurisdictionId AND jurisdictionName = @jurisdictionName)
	BEGIN
		INSERT INTO dbo.tjurisdiction VALUES(@jurisdictionId, @jurisdictionName)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ProviderGameplayInstanceParameters_Get]    Script Date: 2018-01-12 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProviderGameplayInstanceParameters_Get]

@instanceId		int,
@isRealMode		bit,
@gameLaunchType nvarchar(50)

AS

select 
	pgp.parameterName, 
	CASE 
		WHEN pgp.isCustom = 1 then gip.parameterValue
		else pgp.parameterValue
	end as parameterValue
FROM tproviderGameplayInstance pgi with(nolock)
Inner join tproviderGameplayParameters pgp with(nolock) on pgp.providerId = pgi.providerId
	AND (pgp.gameModeType = -1 OR pgp.gameModeType = @isRealMode)
	AND (pgp.gameLaunchType = 'All' OR pgp.gameLaunchType = @gameLaunchType)
	AND pgi.instanceId = @instanceId 
LEFT OUTER JOIN tproviderGameplayInstanceParameters gip with(nolock) ON gip.instanceId = pgi.instanceId	
	and (gip.gameModeType = -1 OR gip.gameModeType = @isRealMode)
	and (gip.gameLaunchType = 'All' OR gip.gameLaunchType = @gameLaunchType)
	AND gip.parameterName = pgp.parameterName

GO

/****** Object:  Index [IX_tChangeLog_timeStamp]    Script Date: 2018-04-24 16:51:20 ******/
CREATE CLUSTERED INDEX [IX_tChangeLog_timeStamp] ON [dbo].[tChangeLog]
(
	[timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 93)
GO

CREATE NONCLUSTERED INDEX [IX_tChangeLog_area_methodName] ON [dbo].[tChangeLog]
(
	[area] ASC,
	[methodName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 93)
GO

USE [master]
GO
ALTER DATABASE [gaming_configuration] SET  READ_WRITE 
GO