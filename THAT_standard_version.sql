USE [master]
GO
/****** Object:  Database [THAT]    Script Date: 08/06/2023 11:28:00 CH ******/
CREATE DATABASE [THAT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'THAT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\THAT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'THAT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\THAT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [THAT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [THAT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [THAT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [THAT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [THAT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [THAT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [THAT] SET ARITHABORT OFF 
GO
ALTER DATABASE [THAT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [THAT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [THAT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [THAT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [THAT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [THAT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [THAT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [THAT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [THAT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [THAT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [THAT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [THAT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [THAT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [THAT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [THAT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [THAT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [THAT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [THAT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [THAT] SET  MULTI_USER 
GO
ALTER DATABASE [THAT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [THAT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [THAT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [THAT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [THAT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [THAT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [THAT] SET QUERY_STORE = OFF
GO
USE [THAT]
GO
/****** Object:  Table [dbo].[_USER]    Script Date: 08/06/2023 11:28:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_USER](
	[user_phone] [varchar](64) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[user_email] [varchar](50) NOT NULL,
	[user_password] [varchar](60) NOT NULL,
	[user_role] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BILL]    Script Date: 08/06/2023 11:28:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL](
	[bill_id] [int] IDENTITY(1000,1) NOT NULL,
	[bill_address] [nvarchar](255) NOT NULL,
	[bill_date] [date] NOT NULL,
	[bill_status] [bit] NOT NULL,
	[bill_note] [nvarchar](255) NULL,
	[user_phone] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BILL_DETAIL]    Script Date: 08/06/2023 11:28:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL_DETAIL](
	[bill_id] [int] NOT NULL,
	[product_id] [varchar](20) NOT NULL,
	[bill_detail_price] [float] NOT NULL,
	[bill_detail_amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 08/06/2023 11:28:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[category_id] [varchar](10) NOT NULL,
	[category_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMAGE]    Script Date: 08/06/2023 11:28:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE](
	[image_link] [varchar](255) NOT NULL,
	[product_id] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[image_link] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCER]    Script Date: 08/06/2023 11:28:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCER](
	[producer_id] [varchar](30) NOT NULL,
	[producer_email] [varchar](50) NOT NULL,
	[producer_name] [nvarchar](50) NOT NULL,
	[producer_phone] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[producer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 08/06/2023 11:28:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[product_id] [varchar](20) NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[product_quantity] [int] NOT NULL,
	[product_price] [float] NOT NULL,
	[category_id] [varchar](10) NOT NULL,
	[producer_id] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPEC]    Script Date: 08/06/2023 11:28:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPEC](
	[spec_id] [int] IDENTITY(100,1) NOT NULL,
	[spec_key] [nvarchar](20) NOT NULL,
	[spec_value] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[spec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPEC_DETAIL]    Script Date: 08/06/2023 11:28:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPEC_DETAIL](
	[spec_id] [int] NOT NULL,
	[product_id] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[spec_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD FOREIGN KEY([user_phone])
REFERENCES [dbo].[_USER] ([user_phone])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BILL_DETAIL]  WITH CHECK ADD FOREIGN KEY([bill_id])
REFERENCES [dbo].[BILL] ([bill_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BILL_DETAIL]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCT] ([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[IMAGE]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCT] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[CATEGORY] ([category_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([producer_id])
REFERENCES [dbo].[PRODUCER] ([producer_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SPEC_DETAIL]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCT] ([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SPEC_DETAIL]  WITH CHECK ADD FOREIGN KEY([spec_id])
REFERENCES [dbo].[SPEC] ([spec_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BILL_DETAIL]  WITH CHECK ADD CHECK  (([bill_detail_price]>(0)))
GO
ALTER TABLE [dbo].[BILL_DETAIL]  WITH CHECK ADD CHECK  (([bill_detail_amount]>(0)))
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD CHECK  (([product_quantity]>=(0)))
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD CHECK  (([product_price]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [THAT] SET  READ_WRITE 
GO
