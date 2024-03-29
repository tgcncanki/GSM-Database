USE [master]
GO
/****** Object:  Database [GSM]    Script Date: 18.10.2019 12:23:28 ******/
CREATE DATABASE [GSM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GSM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GSM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GSM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GSM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GSM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GSM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GSM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GSM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GSM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GSM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GSM] SET ARITHABORT OFF 
GO
ALTER DATABASE [GSM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GSM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GSM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GSM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GSM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GSM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GSM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GSM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GSM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GSM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GSM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GSM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GSM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GSM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GSM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GSM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GSM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GSM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GSM] SET  MULTI_USER 
GO
ALTER DATABASE [GSM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GSM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GSM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GSM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GSM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GSM] SET QUERY_STORE = OFF
GO
USE [GSM]
GO
/****** Object:  User [ardaa]    Script Date: 18.10.2019 12:23:28 ******/
CREATE USER [ardaa] FOR LOGIN [arda] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 18.10.2019 12:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[b_ID] [int] NOT NULL,
	[sub_ID] [int] NOT NULL,
	[t_ID] [int] NOT NULL,
	[b_Minutes] [int] NOT NULL,
	[b_SMS] [int] NOT NULL,
	[b_Total_Debt] [float] NOT NULL,
	[b_Last_Discharge_Time] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[b_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delay_Test]    Script Date: 18.10.2019 12:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delay_Test](
	[dt_ID] [int] NOT NULL,
	[b_ID] [int] NOT NULL,
	[dt_Delayed] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delayed_Debt]    Script Date: 18.10.2019 12:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delayed_Debt](
	[dd_ID] [int] NOT NULL,
	[dt_ID] [int] NOT NULL,
	[dd_New_Debt] [float] NOT NULL,
	[dd_New_Last_Discharge] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dd_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operators]    Script Date: 18.10.2019 12:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operators](
	[op_ID] [int] NOT NULL,
	[op_Name] [varchar](250) NOT NULL,
	[op_Region_Name] [varchar](250) NOT NULL,
	[op_Offices] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[op_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 18.10.2019 12:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[ow_ID] [int] NOT NULL,
	[op_ID] [int] NOT NULL,
	[ow_Name] [varchar](250) NOT NULL,
	[ow_Surname] [varchar](250) NOT NULL,
	[ow_Address] [varchar](max) NOT NULL,
	[ow_Country] [varchar](50) NOT NULL,
	[ow_Phone_Number] [varchar](50) NOT NULL,
	[ow_Fax_Number] [varchar](50) NULL,
	[ow_Company_Name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ow_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sub_Web]    Script Date: 18.10.2019 12:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub_Web](
	[subw_ID] [int] NOT NULL,
	[sub_ID] [int] NOT NULL,
	[subw_Nick_Name] [varchar](250) NOT NULL,
	[subw_Password] [varchar](max) NOT NULL,
	[subw_Last_Login] [date] NOT NULL,
	[subw_Login_Amount_Per_Month] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subw_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscribers]    Script Date: 18.10.2019 12:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribers](
	[sub_ID] [int] NOT NULL,
	[sub_Phone_Number] [varchar](20) NOT NULL,
	[sub_Name] [varchar](250) NOT NULL,
	[sub_Surname] [varchar](100) NOT NULL,
	[sub_Main_Address] [varchar](max) NOT NULL,
	[sub_Work_Address] [varchar](max) NULL,
	[sub_Country] [varchar](100) NOT NULL,
	[sub_Identity_Documents_Number] [varchar](20) NOT NULL,
	[t_ID] [int] NOT NULL,
	[sub_Abroad_Connection] [varchar](20) NOT NULL,
	[op_ID] [int] NOT NULL,
	[sub_Create_Time] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sub_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tariff]    Script Date: 18.10.2019 12:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tariff](
	[t_ID] [int] NOT NULL,
	[t_Name] [varchar](250) NOT NULL,
	[t_Costs_Per_Minutes] [float] NULL,
	[t_Costs_Per_SMS] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[t_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [t_ID], [b_Minutes], [b_SMS], [b_Total_Debt], [b_Last_Discharge_Time]) VALUES (1, 1, 1, 320, 250, 172.5, CAST(N'2019-11-10' AS Date))
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [t_ID], [b_Minutes], [b_SMS], [b_Total_Debt], [b_Last_Discharge_Time]) VALUES (2, 2, 3, 500, 100, 150, CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [t_ID], [b_Minutes], [b_SMS], [b_Total_Debt], [b_Last_Discharge_Time]) VALUES (3, 3, 2, 150, 334, 59.52, CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [t_ID], [b_Minutes], [b_SMS], [b_Total_Debt], [b_Last_Discharge_Time]) VALUES (4, 4, 2, 250, 500, 97.5, CAST(N'2019-11-15' AS Date))
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [t_ID], [b_Minutes], [b_SMS], [b_Total_Debt], [b_Last_Discharge_Time]) VALUES (5, 5, 1, 236, 421, 139.05, CAST(N'2019-11-12' AS Date))
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [t_ID], [b_Minutes], [b_SMS], [b_Total_Debt], [b_Last_Discharge_Time]) VALUES (6, 6, 1, 168, 756, 121.8, CAST(N'2019-11-16' AS Date))
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [t_ID], [b_Minutes], [b_SMS], [b_Total_Debt], [b_Last_Discharge_Time]) VALUES (7, 7, 4, 50, 1534, 53.01, CAST(N'2019-11-12' AS Date))
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [t_ID], [b_Minutes], [b_SMS], [b_Total_Debt], [b_Last_Discharge_Time]) VALUES (8, 8, 1, 200, 800, 140, CAST(N'2019-11-14' AS Date))
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [t_ID], [b_Minutes], [b_SMS], [b_Total_Debt], [b_Last_Discharge_Time]) VALUES (9, 9, 2, 628, 789, 230.91, CAST(N'2019-11-13' AS Date))
INSERT [dbo].[Bills] ([b_ID], [sub_ID], [t_ID], [b_Minutes], [b_SMS], [b_Total_Debt], [b_Last_Discharge_Time]) VALUES (10, 10, 4, 80, 2684, 88.26, CAST(N'2019-11-16' AS Date))
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delayed]) VALUES (1, 1, N'DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delayed]) VALUES (2, 2, N'DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delayed]) VALUES (3, 3, N'NOT DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delayed]) VALUES (4, 4, N'NOT DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delayed]) VALUES (5, 5, N'NOT DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delayed]) VALUES (6, 6, N'NOT DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delayed]) VALUES (7, 7, N'DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delayed]) VALUES (8, 8, N'NOT DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delayed]) VALUES (9, 9, N'DELAYED')
INSERT [dbo].[Delay_Test] ([dt_ID], [b_ID], [dt_Delayed]) VALUES (10, 10, N'NOT DELAYED')
INSERT [dbo].[Delayed_Debt] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (1, 1, 183.6, CAST(N'2019-12-10' AS Date))
INSERT [dbo].[Delayed_Debt] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (2, 2, 162, CAST(N'2019-12-11' AS Date))
INSERT [dbo].[Delayed_Debt] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (7, 7, 57.25, CAST(N'2019-12-12' AS Date))
INSERT [dbo].[Delayed_Debt] ([dd_ID], [dt_ID], [dd_New_Debt], [dd_New_Last_Discharge]) VALUES (9, 9, 249.38, CAST(N'2019-11-13' AS Date))
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (1, N'Istanbul', N'Marmara', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (2, N'Tekirdağ', N'Marmara', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (3, N'Bursa', N'Marmara', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (4, N'Gaziantep', N'Southeastern Anatolia', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (5, N'Adana', N'Mediterranean', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (6, N'Şanlıurfa', N'Southeastern Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (7, N'Kahramanmaraş', N'Southeastern Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (8, N'İzmir', N'Aegean', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (9, N'Denizli', N'Aegean', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (10, N'Manisa', N'Aegean', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (11, N'Aydın', N'Aegean', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (12, N'Erzurum', N'Eastern Anatolia', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (13, N'Malatya', N'Eastern Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (14, N'Muş', N'Eastern Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (15, N'Erzincan', N'Eastern Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (16, N'Ankara', N'Central Anatolia', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (17, N'Konya', N'Central Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (18, N'Eskişehir', N'Central Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (19, N'Sivas', N'Central Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (20, N'Trabzon', N'Black Sea', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (21, N'Rize', N'Black Sea', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (22, N'Samsun', N'Black Sea', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (23, N'Çorum', N'Black Sea', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (24, N'Kastamonu', N'Black Sea', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (25, N'Antalya', N'Mediterranean', N'Main Office')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (26, N'Mersin', N'Mediterranean', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (27, N'Bodrum', N'Mediterranean', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (28, N'Isparta', N'Mediterranean', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (29, N'Adıyaman', N'Southeastern Anatolia', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (30, N'Çanakkale', N'Marmara', N'Branch')
INSERT [dbo].[Operators] ([op_ID], [op_Name], [op_Region_Name], [op_Offices]) VALUES (31, N'Balıkesir', N'Marmara', N'Branch')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (1, 1, N'Nihat', N'KEŞMİŞ', N'İstanbul Bahçelievler', N'Malatya', N'+90 535 154 5878', NULL, N'YOUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (2, 8, N'Kerem', N'SANCAK', N'İzmir Karşıyaka', N'Bursa', N'+90 532 225 8430', N'+90 850 848 2556', N'FISHO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (3, 30, N'Ali İhsan', N'SAKIR', N'Çanakkale Ezine', N'Ankara', N'+90 523 156 2323', N'+90 850 456 8489', N'GREATSM')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (4, 25, N'Burak Ali', N'KIVIRIK', N'Mersin Anamur', N'Mersin', N'+90 536 787 1535', N'+90 850 029 5950', N'CODERROR')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (5, 26, N'Burak Ali', N'KIVIRIK', N'Mersin Anamur', N'Mersin', N'+90 536 787 1535', N'+90 850 029 5950', N'CODERROR')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (6, 27, N'Burak Ali', N'KIVIRIK', N'Mersin Anamur', N'Mersin', N'+90 536 787 1535', N'+90 850 029 5950', N'CODERROR')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (7, 28, N'Burak Ali', N'KIVIRIK', N'Mersin Anamur', N'Mersin', N'+90 539 787 1535', N'+90 850 029 5950', N'CODERROR')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (8, 20, N'Tuğcan', N'IKNAÇ', N'İstanbul Kadıköy', N'Gaziantep', N'+90 532 454 1515', N'+90 850 003 2378', N'GREYTECH')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (9, 21, N'Tuğcan', N'IKNAÇ', N'İstanbul Kadıköy', N'Gaziantep', N'+90 532 454 1515', N'+90 850 003 2378', N'GREYTECH')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (10, 22, N'Tuğcan', N'IKNAÇ', N'İstanbul Kadıköy', N'Gaziantep', N'+90 532 454 1515', N'+90 850 003 2378', N'GREYTECH')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (11, 16, N'Arda', N'NAZOK', N'Antalya Finike', N'Gaziantep', N'+90 534 789 5522', N'+90 850 789 4545', N'CODEVER')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (12, 4, N'Arda', N'NAZOK', N'Antalya Finike', N'Gaziantep', N'+90 534 789 5522', N'+90 850 789 4545', N'CODEVER')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (13, 3, N'Arda', N'NAZOK', N'Antalya Finike', N'Gaziantep', N'+90 534 789 5522', N'+90 850 789 4545', N'CODEVER')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (14, 9, N'Arda', N'NAZOK', N'Antalya Finike', N'Gaziantep', N'+90 534 789 5522', N'+90 850 789 4545', N'CODEVER')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (15, 10, N'Arda', N'NAZOK', N'Antalya Finike', N'Gaziantep', N'+90 534 789 5522', N'+90 850 789 4545', N'CODEVER')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (16, 11, N'Arda', N'NAZOK', N'Antalya Finike', N'Gaziantep', N'+90 534 789 5522', N'+90 850 789 4545', N'CODEVER')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (17, 2, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (18, 5, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (19, 6, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (20, 7, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (21, 12, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (22, 13, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (23, 14, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (24, 15, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (25, 17, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (26, 18, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (27, 19, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (28, 23, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (29, 24, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Owner] ([ow_ID], [op_ID], [ow_Name], [ow_Surname], [ow_Address], [ow_Country], [ow_Phone_Number], [ow_Fax_Number], [ow_Company_Name]) VALUES (30, 29, N'Serdar', N'VOLKAN', N'İzmir Bayraklı', N'Kütahya', N'+90 526 565 8742', N'+90 850 545 4589', N'LUDEVO')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (1, 1, N'ilkut_27', N'27ilkut27', CAST(N'2019-10-10' AS Date), N'15')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (2, 2, N'utkubas1', N'utkubasturk27', CAST(N'2019-10-12' AS Date), N'18')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (3, 3, N'yvzbrk', N'159753123456', CAST(N'2019-10-05' AS Date), N'12')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (4, 4, N'nesrin.karatas', N'nesrin123karatas', CAST(N'2019-10-16' AS Date), N'20')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (5, 5, N'sebnem16', N'senbem1661', CAST(N'2019-10-09' AS Date), N'16')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (6, 6, N'nisakurtar', N'nisanurkurtar', CAST(N'2019-10-14' AS Date), N'26')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (7, 7, N'alptun', N'alper_tuncel123', CAST(N'2019-10-03' AS Date), N'19')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (8, 8, N'bartu_lev', N'bertu33levni', CAST(N'2019-10-15' AS Date), N'21')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (9, 9, N'ayca_22', N'22ayca22kaymak22', CAST(N'2019-10-08' AS Date), N'17')
INSERT [dbo].[Sub_Web] ([subw_ID], [sub_ID], [subw_Nick_Name], [subw_Password], [subw_Last_Login], [subw_Login_Amount_Per_Month]) VALUES (10, 10, N'a.kalkan', N'ahmetkalkan', CAST(N'2019-10-11' AS Date), N'16')
INSERT [dbo].[Subscribers] ([sub_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [t_ID], [sub_Abroad_Connection], [op_ID], [sub_Create_Time]) VALUES (1, N'+90 505 551 2261', N'İlkut', N'İPEKÇİ', N'İstanbul Bahçelievler', NULL, N'Gaziantep', N'XYG5VEECE', 1, N'ALLOW', 1, CAST(N'2018-12-15' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [t_ID], [sub_Abroad_Connection], [op_ID], [sub_Create_Time]) VALUES (2, N'+90 535 554 7362', N'Utku', N'BAŞTÜRK', N'Gaziantep Şehitkamil', N'Gaziantep Sanayi', N'Gaziantep', N'3NA75FZ56', 3, N'DENY', 4, CAST(N'2017-09-20' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [t_ID], [sub_Abroad_Connection], [op_ID], [sub_Create_Time]) VALUES (3, N'+90 535 553 8740', N'Yavuz', N'BURUK', N'İzmir Karşıyaka', N'İzmir Karşıyaka Starbucks', N'İzmir', N'7ZEMD3D6Y', 2, N'ALLOW', 8, CAST(N'2019-05-08' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [t_ID], [sub_Abroad_Connection], [op_ID], [sub_Create_Time]) VALUES (4, N'+90 505 558 2068', N'Nesrin', N'Karataş', N'Erzurum Merkez', NULL, N'Erzurum', N'LSV8H7NR9', 2, N'DENY', 12, CAST(N'2019-07-03' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [t_ID], [sub_Abroad_Connection], [op_ID], [sub_Create_Time]) VALUES (5, N'+90 535 551 4881', N'Şebnem', N'TERZİOĞLU', N'Aydın Merkez', N'Aydın BurgerKing', N'Bursa', N'QFT3KBDL4', 1, N'DENY', 11, CAST(N'2018-02-26' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [t_ID], [sub_Abroad_Connection], [op_ID], [sub_Create_Time]) VALUES (6, N'+90 555 553 5758', N'Nisanur', N'KURTAR', N'Malatya Merkez', N'Malatya Kardeşler Holding', N'Malatya', N'DN3NC3254', 1, N'ALLOW', 13, CAST(N'2016-03-01' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [t_ID], [sub_Abroad_Connection], [op_ID], [sub_Create_Time]) VALUES (7, N'+90 545 551 6887', N'Alper', N'TUNCEL', N'Ankara Kızılay', NULL, N'Giresun', N'2JXFNCNK4', 4, N'DENY', 16, CAST(N'2018-04-11' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [t_ID], [sub_Abroad_Connection], [op_ID], [sub_Create_Time]) VALUES (8, N'+90 505 557 5732', N'Bartu', N'LEVNİ', N'Antalya Finike', N'Antalya Memur', N'Mersin', N'H23KD652T', 1, N'DENY', 25, CAST(N'2019-10-16' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [t_ID], [sub_Abroad_Connection], [op_ID], [sub_Create_Time]) VALUES (9, N'+90 505 553 7116', N'Ayça', N'Kaymak', N'Trabzon Merkez', NULL, N'Edirne', N'D7H533525', 2, N'DENY', 20, CAST(N'2017-09-11' AS Date))
INSERT [dbo].[Subscribers] ([sub_ID], [sub_Phone_Number], [sub_Name], [sub_Surname], [sub_Main_Address], [sub_Work_Address], [sub_Country], [sub_Identity_Documents_Number], [t_ID], [sub_Abroad_Connection], [op_ID], [sub_Create_Time]) VALUES (10, N'+90 505 552 8471', N'Ahmet', N'KALKAN', N'Aydın Merkez', NULL, N'Denizli', N'GJQXGW56G', 4, N'DENY', 11, CAST(N'2016-11-11' AS Date))
INSERT [dbo].[Tariff] ([t_ID], [t_Name], [t_Costs_Per_Minutes], [t_Costs_Per_SMS]) VALUES (1, N'ZOOM', 0.5, 0.05)
INSERT [dbo].[Tariff] ([t_ID], [t_Name], [t_Costs_Per_Minutes], [t_Costs_Per_SMS]) VALUES (2, N'STUDENTS', 0.33, 0.03)
INSERT [dbo].[Tariff] ([t_ID], [t_Name], [t_Costs_Per_Minutes], [t_Costs_Per_SMS]) VALUES (3, N'TALKTIVE', 0.2, 0.5)
INSERT [dbo].[Tariff] ([t_ID], [t_Name], [t_Costs_Per_Minutes], [t_Costs_Per_SMS]) VALUES (4, N'SILENT', 0.6, 0.015)
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD FOREIGN KEY([sub_ID])
REFERENCES [dbo].[Subscribers] ([sub_ID])
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD FOREIGN KEY([t_ID])
REFERENCES [dbo].[Tariff] ([t_ID])
GO
ALTER TABLE [dbo].[Delay_Test]  WITH CHECK ADD FOREIGN KEY([b_ID])
REFERENCES [dbo].[Bills] ([b_ID])
GO
ALTER TABLE [dbo].[Delayed_Debt]  WITH CHECK ADD FOREIGN KEY([dt_ID])
REFERENCES [dbo].[Delay_Test] ([dt_ID])
GO
ALTER TABLE [dbo].[Owner]  WITH CHECK ADD FOREIGN KEY([op_ID])
REFERENCES [dbo].[Operators] ([op_ID])
GO
ALTER TABLE [dbo].[Sub_Web]  WITH CHECK ADD FOREIGN KEY([sub_ID])
REFERENCES [dbo].[Subscribers] ([sub_ID])
GO
ALTER TABLE [dbo].[Subscribers]  WITH CHECK ADD FOREIGN KEY([op_ID])
REFERENCES [dbo].[Operators] ([op_ID])
GO
ALTER TABLE [dbo].[Subscribers]  WITH CHECK ADD FOREIGN KEY([t_ID])
REFERENCES [dbo].[Tariff] ([t_ID])
GO
USE [master]
GO
ALTER DATABASE [GSM] SET  READ_WRITE 
GO
