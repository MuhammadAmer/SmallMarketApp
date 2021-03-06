USE [master]
GO
/****** Object:  Database [SmallMarketDB]    Script Date: 08/11/2016 15:22:09 ******/
CREATE DATABASE [SmallMarketDB] ON  PRIMARY 
( NAME = N'SmallMarketDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MUHAMMADGALAXY\MSSQL\DATA\SmallMarketDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SmallMarketDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MUHAMMADGALAXY\MSSQL\DATA\SmallMarketDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SmallMarketDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmallMarketDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmallMarketDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SmallMarketDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SmallMarketDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SmallMarketDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SmallMarketDB] SET ARITHABORT OFF
GO
ALTER DATABASE [SmallMarketDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SmallMarketDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SmallMarketDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SmallMarketDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SmallMarketDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SmallMarketDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SmallMarketDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SmallMarketDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SmallMarketDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SmallMarketDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SmallMarketDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [SmallMarketDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SmallMarketDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SmallMarketDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SmallMarketDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SmallMarketDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SmallMarketDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SmallMarketDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SmallMarketDB] SET  READ_WRITE
GO
ALTER DATABASE [SmallMarketDB] SET RECOVERY FULL
GO
ALTER DATABASE [SmallMarketDB] SET  MULTI_USER
GO
ALTER DATABASE [SmallMarketDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SmallMarketDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'SmallMarketDB', N'ON'
GO
USE [SmallMarketDB]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 08/11/2016 15:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerSuppliertype]    Script Date: 08/11/2016 15:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerSuppliertype](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_CustomerSuppliertype] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 08/11/2016 15:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 08/11/2016 15:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CategoryId] [int] NULL,
	[PurchasePrice] [decimal](18, 2) NULL,
	[SellPrice] [decimal](18, 2) NULL,
	[UnitId] [int] NULL,
	[ValidQuantity] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomersSuppliers]    Script Date: 08/11/2016 15:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomersSuppliers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [varchar](50) NULL,
	[TypeId] [int] NULL,
	[DiscountPurchasing] [decimal](18, 2) NULL,
	[DiscountSelling] [decimal](18, 2) NULL,
 CONSTRAINT [PK_CustomersSuppliers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseSellInvoice]    Script Date: 08/11/2016 15:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseSellInvoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[CustomerSupplierId] [int] NULL,
	[IsPurchase] [bit] NULL,
	[OrderNo] [varchar](50) NULL,
 CONSTRAINT [PK_PurchaseSellInvoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseSellInvoceDetails]    Script Date: 08/11/2016 15:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseSellInvoceDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseSellInvoiceId] [int] NULL,
	[ItemId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[TotalDiscount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PurchaseSellInvoceDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Items_Category]    Script Date: 08/11/2016 15:22:14 ******/
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Category]
GO
/****** Object:  ForeignKey [FK_Items_Unit]    Script Date: 08/11/2016 15:22:14 ******/
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Unit]
GO
/****** Object:  ForeignKey [FK_CustomersSuppliers_CustomerSuppliertype]    Script Date: 08/11/2016 15:22:14 ******/
ALTER TABLE [dbo].[CustomersSuppliers]  WITH CHECK ADD  CONSTRAINT [FK_CustomersSuppliers_CustomerSuppliertype] FOREIGN KEY([TypeId])
REFERENCES [dbo].[CustomerSuppliertype] ([Id])
GO
ALTER TABLE [dbo].[CustomersSuppliers] CHECK CONSTRAINT [FK_CustomersSuppliers_CustomerSuppliertype]
GO
/****** Object:  ForeignKey [FK_PurchaseSellInvoice_CustomersSuppliers]    Script Date: 08/11/2016 15:22:14 ******/
ALTER TABLE [dbo].[PurchaseSellInvoice]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseSellInvoice_CustomersSuppliers] FOREIGN KEY([CustomerSupplierId])
REFERENCES [dbo].[CustomersSuppliers] ([Id])
GO
ALTER TABLE [dbo].[PurchaseSellInvoice] CHECK CONSTRAINT [FK_PurchaseSellInvoice_CustomersSuppliers]
GO
/****** Object:  ForeignKey [FK_PurchaseSellInvoceDetails_Items]    Script Date: 08/11/2016 15:22:14 ******/
ALTER TABLE [dbo].[PurchaseSellInvoceDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseSellInvoceDetails_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
GO
ALTER TABLE [dbo].[PurchaseSellInvoceDetails] CHECK CONSTRAINT [FK_PurchaseSellInvoceDetails_Items]
GO
/****** Object:  ForeignKey [FK_PurchaseSellInvoceDetails_PurchaseSellInvoice]    Script Date: 08/11/2016 15:22:14 ******/
ALTER TABLE [dbo].[PurchaseSellInvoceDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseSellInvoceDetails_PurchaseSellInvoice] FOREIGN KEY([PurchaseSellInvoiceId])
REFERENCES [dbo].[PurchaseSellInvoice] ([Id])
GO
ALTER TABLE [dbo].[PurchaseSellInvoceDetails] CHECK CONSTRAINT [FK_PurchaseSellInvoceDetails_PurchaseSellInvoice]
GO
