USE [master]
GO
/****** Object:  Database [petdb]    Script Date: 01.03.2022 23:27:07 ******/
CREATE DATABASE [petdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'petdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\petdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'petdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\petdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [petdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [petdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [petdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [petdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [petdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [petdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [petdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [petdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [petdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [petdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [petdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [petdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [petdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [petdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [petdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [petdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [petdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [petdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [petdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [petdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [petdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [petdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [petdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [petdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [petdb] SET RECOVERY FULL 
GO
ALTER DATABASE [petdb] SET  MULTI_USER 
GO
ALTER DATABASE [petdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [petdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [petdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [petdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [petdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [petdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'petdb', N'ON'
GO
ALTER DATABASE [petdb] SET QUERY_STORE = OFF
GO
USE [petdb]
GO
/****** Object:  Table [dbo].[Owners]    Script Date: 01.03.2022 23:27:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owners](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Owners] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pet_Owner_relations]    Script Date: 01.03.2022 23:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet_Owner_relations](
	[pet_id] [int] NOT NULL,
	[owner_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetInfo]    Script Date: 01.03.2022 23:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetInfo](
	[name] [nvarchar](50) NOT NULL,
	[breed] [nvarchar](50) NOT NULL,
	[birthdate] [date] NOT NULL,
	[count_of_medal] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PetInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Owners] ON 

INSERT [dbo].[Owners] ([id], [name]) VALUES (1, N'Дмитрий')
INSERT [dbo].[Owners] ([id], [name]) VALUES (2, N'Александр')
INSERT [dbo].[Owners] ([id], [name]) VALUES (3, N'Владимир')
INSERT [dbo].[Owners] ([id], [name]) VALUES (4, N'Никита')
INSERT [dbo].[Owners] ([id], [name]) VALUES (5, N'Эдуард')
SET IDENTITY_INSERT [dbo].[Owners] OFF
GO
INSERT [dbo].[Pet_Owner_relations] ([pet_id], [owner_id]) VALUES (1, 5)
INSERT [dbo].[Pet_Owner_relations] ([pet_id], [owner_id]) VALUES (2, 4)
INSERT [dbo].[Pet_Owner_relations] ([pet_id], [owner_id]) VALUES (3, 3)
INSERT [dbo].[Pet_Owner_relations] ([pet_id], [owner_id]) VALUES (4, 2)
GO
SET IDENTITY_INSERT [dbo].[PetInfo] ON 

INSERT [dbo].[PetInfo] ([name], [breed], [birthdate], [count_of_medal], [id]) VALUES (N'Рекс', N'Нем. Овчарка', CAST(N'2015-02-01' AS Date), 4, 1)
INSERT [dbo].[PetInfo] ([name], [breed], [birthdate], [count_of_medal], [id]) VALUES (N'Макс', N'Пудель', CAST(N'2015-02-02' AS Date), 8, 2)
INSERT [dbo].[PetInfo] ([name], [breed], [birthdate], [count_of_medal], [id]) VALUES (N'Фекс', N'Шпиц', CAST(N'2015-02-03' AS Date), 6, 3)
INSERT [dbo].[PetInfo] ([name], [breed], [birthdate], [count_of_medal], [id]) VALUES (N'Мухтар', N'Дворняга', CAST(N'2015-02-04' AS Date), 1, 4)
INSERT [dbo].[PetInfo] ([name], [breed], [birthdate], [count_of_medal], [id]) VALUES (N'Вольф', N'Корги', CAST(N'2022-02-10' AS Date), 3, 5)
SET IDENTITY_INSERT [dbo].[PetInfo] OFF
GO
ALTER TABLE [dbo].[Pet_Owner_relations]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Owner_relations_Owners] FOREIGN KEY([owner_id])
REFERENCES [dbo].[Owners] ([id])
GO
ALTER TABLE [dbo].[Pet_Owner_relations] CHECK CONSTRAINT [FK_Pet_Owner_relations_Owners]
GO
ALTER TABLE [dbo].[Pet_Owner_relations]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Owner_relations_PetInfo] FOREIGN KEY([pet_id])
REFERENCES [dbo].[PetInfo] ([id])
GO
ALTER TABLE [dbo].[Pet_Owner_relations] CHECK CONSTRAINT [FK_Pet_Owner_relations_PetInfo]
GO
USE [master]
GO
ALTER DATABASE [petdb] SET  READ_WRITE 
GO
