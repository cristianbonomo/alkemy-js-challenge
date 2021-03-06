USE [master]
GO
/****** Object:  Database [alkemy-db]    Script Date: 3/3/2021 3:16:14 PM ******/
CREATE DATABASE [alkemy-db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'alkemy-db', FILENAME = N'K:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\alkemy-db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'alkemy-db_log', FILENAME = N'K:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\alkemy-db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [alkemy-db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [alkemy-db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [alkemy-db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [alkemy-db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [alkemy-db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [alkemy-db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [alkemy-db] SET ARITHABORT OFF 
GO
ALTER DATABASE [alkemy-db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [alkemy-db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [alkemy-db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [alkemy-db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [alkemy-db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [alkemy-db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [alkemy-db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [alkemy-db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [alkemy-db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [alkemy-db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [alkemy-db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [alkemy-db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [alkemy-db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [alkemy-db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [alkemy-db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [alkemy-db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [alkemy-db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [alkemy-db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [alkemy-db] SET  MULTI_USER 
GO
ALTER DATABASE [alkemy-db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [alkemy-db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [alkemy-db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [alkemy-db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [alkemy-db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [alkemy-db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [alkemy-db] SET QUERY_STORE = OFF
GO
USE [alkemy-db]
GO
/****** Object:  User [alkemy]    Script Date: 3/3/2021 3:16:14 PM ******/
CREATE USER [alkemy] FOR LOGIN [alkemy] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [alkemy]
GO
ALTER ROLE [db_datareader] ADD MEMBER [alkemy]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [alkemy]
GO
/****** Object:  Table [dbo].[Balances]    Script Date: 3/3/2021 3:16:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Balances](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[balance] [decimal](10, 2) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 3/3/2021 3:16:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[type] [varchar](50) NOT NULL,
	[category] [varchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[concept] [varchar](100) NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/3/2021 3:16:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[password] [char](60) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [alkemy-db] SET  READ_WRITE 
GO
