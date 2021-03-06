USE [master]
GO
/****** Object:  Database [Task1_DB]    Script Date: 09.10.2015 г. 18:33:08 ******/
CREATE DATABASE [Task1_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Task1_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Task1_DB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Task1_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Task1_DB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Task1_DB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Task1_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Task1_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Task1_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Task1_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Task1_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Task1_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Task1_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Task1_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Task1_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Task1_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Task1_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Task1_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Task1_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Task1_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Task1_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Task1_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Task1_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Task1_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Task1_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Task1_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Task1_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Task1_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Task1_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Task1_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Task1_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Task1_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Task1_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Task1_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Task1_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Task1_DB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Task1_DB]
GO
/****** Object:  Table [dbo].[ADDRESS]    Script Date: 09.10.2015 г. 18:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADDRESS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address_text] [nvarchar](100) NOT NULL,
	[town_id] [int] NOT NULL,
 CONSTRAINT [PK_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CONTINENT]    Script Date: 09.10.2015 г. 18:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTINENT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CONTINENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COUNTRY]    Script Date: 09.10.2015 г. 18:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUNTRY](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[continent_id] [int] NOT NULL,
 CONSTRAINT [PK_COUNTRY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 09.10.2015 г. 18:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TOWN]    Script Date: 09.10.2015 г. 18:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOWN](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK_TOWN] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ADDRESS] ON 

INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (1, N'Linkoln Blvd.', 1)
INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (2, N'Hollywood Boulevard‎ ', 2)
INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (3, N'Vladislav Varnenchik Blvd., 15', 3)
INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (5, N'Stefan Stambolov Blvd., 10', 4)
INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (7, N'Unter den Linden Blvd., 23', 5)
INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (8, N'Leopoldstrasse, 6', 6)
SET IDENTITY_INSERT [dbo].[ADDRESS] OFF
SET IDENTITY_INSERT [dbo].[CONTINENT] ON 

INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (1, N'Europe')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (2, N'Asia')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (3, N'North America')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (4, N'South America')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (5, N'Africa')
SET IDENTITY_INSERT [dbo].[CONTINENT] OFF
SET IDENTITY_INSERT [dbo].[COUNTRY] ON 

INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (1, N'USA', 3)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (2, N'Bulgaria', 1)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (3, N'Germany', 1)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (4, N'Mexico', 3)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (5, N'Japan', 2)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (6, N'India', 2)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (7, N'Maroco', 5)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (8, N'Egypt', 5)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (9, N'Brasil', 4)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (10, N'Argentina', 4)
SET IDENTITY_INSERT [dbo].[COUNTRY] OFF
SET IDENTITY_INSERT [dbo].[PERSON] ON 

INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (1, N'John', N'Dow', 1)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (2, N'George', N'Tiborn', 2)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (3, N'Ivan', N'Dimitrov', 3)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (5, N'Maria', N'Petrova', 5)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (8, N'Gunter', N'Schünemann', 7)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (9, N'Michaela', N'Merkel', 8)
SET IDENTITY_INSERT [dbo].[PERSON] OFF
SET IDENTITY_INSERT [dbo].[TOWN] ON 

INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (1, N'New York', 1)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (2, N'Los Angeles', 2)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (3, N'Varna', 2)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (4, N'Burgas', 2)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (5, N'Berlin', 3)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (6, N'Munich', 3)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (7, N'Mexico City', 4)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (8, N'Tokyo', 5)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (9, N'Okinava', 5)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (10, N'Delhi', 6)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (11, N'Cairo', 8)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (12, N'Casablanca', 7)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (13, N'Rio de Janeiro', 9)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (14, N'Buenos Aires', 10)
SET IDENTITY_INSERT [dbo].[TOWN] OFF
ALTER TABLE [dbo].[ADDRESS]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESS_TOWN] FOREIGN KEY([town_id])
REFERENCES [dbo].[TOWN] ([id])
GO
ALTER TABLE [dbo].[ADDRESS] CHECK CONSTRAINT [FK_ADDRESS_TOWN]
GO
ALTER TABLE [dbo].[COUNTRY]  WITH CHECK ADD  CONSTRAINT [FK_COUNTRY_CONTINENT] FOREIGN KEY([continent_id])
REFERENCES [dbo].[CONTINENT] ([id])
GO
ALTER TABLE [dbo].[COUNTRY] CHECK CONSTRAINT [FK_COUNTRY_CONTINENT]
GO
ALTER TABLE [dbo].[PERSON]  WITH CHECK ADD  CONSTRAINT [FK_PERSON_ADDRESS] FOREIGN KEY([address_id])
REFERENCES [dbo].[ADDRESS] ([id])
GO
ALTER TABLE [dbo].[PERSON] CHECK CONSTRAINT [FK_PERSON_ADDRESS]
GO
ALTER TABLE [dbo].[TOWN]  WITH CHECK ADD  CONSTRAINT [FK_TOWN_COUNTRY] FOREIGN KEY([country_id])
REFERENCES [dbo].[COUNTRY] ([id])
GO
ALTER TABLE [dbo].[TOWN] CHECK CONSTRAINT [FK_TOWN_COUNTRY]
GO
USE [master]
GO
ALTER DATABASE [Task1_DB] SET  READ_WRITE 
GO
