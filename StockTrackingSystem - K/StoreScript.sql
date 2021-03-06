USE [master]
GO
/****** Object:  Database [StockTrackingMVC]    Script Date: 15.05.2022 18:08:40 ******/
CREATE DATABASE [StockTrackingMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockTrackingMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StockTrackingMVC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StockTrackingMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StockTrackingMVC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StockTrackingMVC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockTrackingMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockTrackingMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockTrackingMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockTrackingMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockTrackingMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockTrackingMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockTrackingMVC] SET  MULTI_USER 
GO
ALTER DATABASE [StockTrackingMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockTrackingMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockTrackingMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockTrackingMVC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StockTrackingMVC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StockTrackingMVC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StockTrackingMVC] SET QUERY_STORE = OFF
GO
USE [StockTrackingMVC]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 15.05.2022 18:08:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 15.05.2022 18:08:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 15.05.2022 18:08:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Balance] [money] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15.05.2022 18:08:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 15.05.2022 18:08:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UrunId] [int] NULL,
	[EmployeeId] [int] NULL,
	[CustomerId] [int] NULL,
	[Price] [money] NULL,
	[Date] [smalldatetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15.05.2022 18:08:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[Stock] [int] NULL,
	[PurchasePrice] [money] NULL,
	[SalePrice] [money] NULL,
	[CategoryId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [Username], [Password]) VALUES (1, N'kubraozyakisir', N'1905')
INSERT [dbo].[Admin] ([Id], [Username], [Password]) VALUES (2, N'melisamert', N'2005')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name]) VALUES (1, N'Casual wear')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (4, N'Formal wear')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (5, N'Business attire ')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (6, N'Lingerie')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (7, N'Sports wear')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (8, N'Coat')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (9, N'Jacket')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (10, N'Jeans')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [Surname], [City], [Balance], [Status]) VALUES (1, N'Mehmet ', N'Öztürk', N'İstanbul', 7000.0000, 1)
INSERT [dbo].[Customer] ([Id], [Name], [Surname], [City], [Balance], [Status]) VALUES (2, N'Mesut', N'Arslanoğlu', N'Bartın', 5000.0000, 1)
INSERT [dbo].[Customer] ([Id], [Name], [Surname], [City], [Balance], [Status]) VALUES (3, N'Emre', N'Coşkun', N'Kilis', 5000.0000, 1)
INSERT [dbo].[Customer] ([Id], [Name], [Surname], [City], [Balance], [Status]) VALUES (4, N'Kübra', N' Şahin', N'Ordu', 6000.0000, 1)
INSERT [dbo].[Customer] ([Id], [Name], [Surname], [City], [Balance], [Status]) VALUES (5, N'Cüneyt', N'Ulusu', N'Rize', 4500.0000, 1)
INSERT [dbo].[Customer] ([Id], [Name], [Surname], [City], [Balance], [Status]) VALUES (7, N'Zeynep', N'Köse', N'Rize', 4500.0000, 1)
INSERT [dbo].[Customer] ([Id], [Name], [Surname], [City], [Balance], [Status]) VALUES (8, N'Ayşenur', N'Uğuz', N'Antalya', 8000.0000, 1)
INSERT [dbo].[Customer] ([Id], [Name], [Surname], [City], [Balance], [Status]) VALUES (9, N'Özge', N'Gülten', N'İstanbul', 7000.0000, 1)
INSERT [dbo].[Customer] ([Id], [Name], [Surname], [City], [Balance], [Status]) VALUES (10, N'Rükna', N'Kavraş', N'İstanbul', 6000.0000, 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Surname], [Department]) VALUES (1, N'Nazlı', N'Güner', N'Woman')
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [Department]) VALUES (2, N'Muhammed', N'Cimiş', N'Man')
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [Department]) VALUES (3, N'Sena ', N'Ustaoğlu', N'Kids')
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [Department]) VALUES (4, N'Cemre', N'Vuranel', N'Divided')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [UrunId], [EmployeeId], [CustomerId], [Price], [Date]) VALUES (1, 1, 1, 1, 350.0000, CAST(N'2022-05-15T01:11:00' AS SmallDateTime))
INSERT [dbo].[Order] ([Id], [UrunId], [EmployeeId], [CustomerId], [Price], [Date]) VALUES (2, 2, 2, 5, 100.0000, CAST(N'2022-05-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[Order] ([Id], [UrunId], [EmployeeId], [CustomerId], [Price], [Date]) VALUES (3, 3, 1, 1, 100.0000, CAST(N'2022-05-15T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Brand], [Stock], [PurchasePrice], [SalePrice], [CategoryId], [Status]) VALUES (1, N'Blue Jeans', N'Mavi', 500, 150.0000, 350.0000, 10, 1)
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Stock], [PurchasePrice], [SalePrice], [CategoryId], [Status]) VALUES (2, N'White Jacket', N'H&M', 500, 100.0000, 250.0000, 9, 1)
INSERT [dbo].[Product] ([ID], [Name], [Brand], [Stock], [PurchasePrice], [SalePrice], [CategoryId], [Status]) VALUES (3, N'Crop T-Shirt', N'Zara', 500, 30.0000, 100.0000, 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [StockTrackingMVC] SET  READ_WRITE 
GO
