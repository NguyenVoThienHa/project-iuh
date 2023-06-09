USE [master]
GO
/****** Object:  Database [QLKS]    Script Date: 5/13/2021 9:43:16 PM ******/
CREATE DATABASE [QLKS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLKS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QLKS.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLKS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QLKS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLKS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLKS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLKS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLKS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLKS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLKS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLKS] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLKS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLKS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLKS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLKS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLKS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLKS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLKS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLKS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLKS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLKS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLKS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLKS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLKS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLKS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLKS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLKS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLKS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLKS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLKS] SET  MULTI_USER 
GO
ALTER DATABASE [QLKS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLKS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLKS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLKS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLKS]
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 5/13/2021 9:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[AUTO_IDKH]()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(maKH) FROM KhachHang ) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(maKH, 5)) FROM KhachHang
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'KH0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'KH000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[AUTO_IDNV]()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(maNV) FROM NhanVien ) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(maNV, 5)) FROM NhanVien
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NV0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'NV000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[AUTO_IDMP]()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(maPhong) FROM Phong ) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(maPhong, 5)) FROM Phong
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'MP1100' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'MP110' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[AUTO_IDHD]()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(maHD) FROM HoaDon ) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(maHD, 5)) FROM HoaDon
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'HD0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'HD000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[ChiTietHD](
	[maHD] [nvarchar](10) NOT NULL,
	[maPhong] [nvarchar](10) NOT NULL,
	[ngayDen] [date] NULL,
	[ngayDi] [date] NULL,
 CONSTRAINT [PK_ChiTietHD] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC,
	[maPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 5/13/2021 9:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHD] [nvarchar](10) NOT NULL,
	[ngayLapHD] [date] NULL,
	[maNV] [nvarchar](10) NULL,
	[maKH] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/13/2021 9:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKH] [nvarchar](10) NOT NULL,
	[hoTen] [nvarchar](255) NULL,
	[gioiTinh] [bit] NULL,
	[cmt] [nchar](12) NULL,
	[soDienThoai] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 5/13/2021 9:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[maLoaiPhong] [nvarchar](10) NOT NULL,
	[tenLoaiPhong] [nvarchar](255) NULL,
 CONSTRAINT [PK_LoaiPhong] PRIMARY KEY CLUSTERED 
(
	[maLoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/13/2021 9:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNV] [nvarchar](10) NOT NULL,
	[hoTen] [nvarchar](255) NULL,
	[gioiTinh] [bit] NULL,
	[ngaySinh] [date] NULL,
	[diaChi] [nvarchar](255) NULL,
	[soDienThoai] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[chucVu] [nvarchar](255) NULL,
	[tenDangNhap] [nvarchar](255) NULL,
	[matKhau] [nvarchar](255) NULL,
 PRIMARY KEY CLUSTERED 
(
	[maNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 5/13/2021 9:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[maPhong] [nvarchar](10) NOT NULL,
	[giaPhong] [float] NULL,
	[soGiuong] [int] NULL,
	[chiTietPhong] [nvarchar](max) NULL,
	[trangThai] [bit] NULL,
	[maLoaiPhong] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[maPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00001', N'MP11010', CAST(N'2015-04-03' AS Date), CAST(N'2015-06-04' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00002', N'MP11011', CAST(N'2015-04-07' AS Date), CAST(N'2015-07-18' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00003', N'MP11013', CAST(N'2015-07-25' AS Date), CAST(N'2015-08-22' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00004', N'MP11004', CAST(N'2015-10-26' AS Date), CAST(N'2015-10-29' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00005', N'MP11025', CAST(N'2015-11-05' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00006', N'MP11021', CAST(N'2015-12-03' AS Date), CAST(N'2015-12-05' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00007', N'MP11020', CAST(N'2015-11-26' AS Date), CAST(N'2015-12-03' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00008', N'MP11009', CAST(N'2015-12-20' AS Date), CAST(N'2016-01-08' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00009', N'MP11010', CAST(N'2016-01-12' AS Date), CAST(N'2016-01-29' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00010', N'MP11011', CAST(N'2016-02-12' AS Date), CAST(N'2016-02-17' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00011', N'MP11007', CAST(N'2016-05-03' AS Date), CAST(N'2016-10-03' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00012', N'MP11002', CAST(N'2016-04-30' AS Date), CAST(N'2016-10-05' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00013', N'MP11011', CAST(N'2016-06-13' AS Date), CAST(N'2016-06-14' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00014', N'MP11008', CAST(N'2016-09-20' AS Date), CAST(N'2016-09-21' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00015', N'MP11020', CAST(N'2017-06-24' AS Date), CAST(N'2017-06-28' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00016', N'MP11005', CAST(N'2017-09-18' AS Date), CAST(N'2017-09-22' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00017', N'MP11002', CAST(N'2017-05-10' AS Date), CAST(N'2017-10-23' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00018', N'MP11014', CAST(N'2017-06-11' AS Date), CAST(N'2017-11-19' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00019', N'MP11020', CAST(N'2018-06-01' AS Date), CAST(N'2018-01-19' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00020', N'MP11015', CAST(N'2018-01-25' AS Date), CAST(N'2018-01-29' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00021', N'MP11020', CAST(N'2018-03-02' AS Date), CAST(N'2018-02-13' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00022', N'MP11008', CAST(N'2018-05-10' AS Date), CAST(N'2018-05-28' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00023', N'MP11019', CAST(N'2018-09-23' AS Date), CAST(N'2018-09-26' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00024', N'MP11006', CAST(N'2018-11-13' AS Date), CAST(N'2018-11-23' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00025', N'MP11014', CAST(N'2019-11-01' AS Date), CAST(N'2019-01-13' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00026', N'MP11020', CAST(N'2019-01-21' AS Date), CAST(N'2019-01-24' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00027', N'MP11001', CAST(N'2019-12-03' AS Date), CAST(N'2019-03-26' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00028', N'MP11025', CAST(N'2019-03-28' AS Date), CAST(N'2019-03-29' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00029', N'MP11019', CAST(N'2019-03-05' AS Date), CAST(N'2019-06-02' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00030', N'MP11005', CAST(N'2019-04-06' AS Date), CAST(N'2019-10-06' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00031', N'MP11024', CAST(N'2019-09-18' AS Date), CAST(N'2019-09-25' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00032', N'MP11021', CAST(N'2019-11-01' AS Date), CAST(N'2019-11-23' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00033', N'MP11008', CAST(N'2019-04-12' AS Date), CAST(N'2019-05-12' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00034', N'MP11021', CAST(N'2020-01-11' AS Date), CAST(N'2020-01-15' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00035', N'MP11001', CAST(N'2020-02-20' AS Date), CAST(N'2020-02-24' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00036', N'MP11004', CAST(N'2020-03-04' AS Date), CAST(N'2020-04-18' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00037', N'MP11003', CAST(N'2020-05-12' AS Date), CAST(N'2020-05-15' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00038', N'MP11012', CAST(N'2020-05-14' AS Date), CAST(N'2020-05-27' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00039', N'MP11014', CAST(N'2020-06-08' AS Date), CAST(N'2020-06-18' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00040', N'MP11018', CAST(N'2020-08-30' AS Date), CAST(N'2020-09-06' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00041', N'MP11018', CAST(N'2020-09-06' AS Date), CAST(N'2020-09-16' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00042', N'MP11006', CAST(N'2020-11-12' AS Date), CAST(N'2020-12-17' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00043', N'MP11010', CAST(N'2021-01-05' AS Date), CAST(N'2021-01-09' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00044', N'MP11025', CAST(N'2021-01-29' AS Date), CAST(N'2021-02-02' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00045', N'MP11004', CAST(N'2021-02-27' AS Date), CAST(N'2021-03-01' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00046', N'MP11005', CAST(N'2021-04-30' AS Date), CAST(N'2021-05-04' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00047', N'MP11023', CAST(N'2020-09-19' AS Date), CAST(N'2020-09-21' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00048', N'MP11020', CAST(N'2020-10-06' AS Date), CAST(N'2020-10-22' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00049', N'MP11013', CAST(N'2020-10-17' AS Date), CAST(N'2020-10-28' AS Date))
INSERT [dbo].[ChiTietHD] ([maHD], [maPhong], [ngayDen], [ngayDi]) VALUES (N'HD00050', N'MP11023', CAST(N'2021-03-27' AS Date), CAST(N'2021-03-28' AS Date))
GO
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00001', CAST(N'2015-02-25' AS Date), N'NV00001', N'KH00001')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00002', CAST(N'2015-03-21' AS Date), N'NV00003', N'KH00010')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00003', CAST(N'2015-10-22' AS Date), N'NV00002', N'KH00017')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00004', CAST(N'2015-11-19' AS Date), N'NV00008', N'KH00002')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00005', CAST(N'2015-12-21' AS Date), N'NV00008', N'KH00005')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00006', CAST(N'2015-12-29' AS Date), N'NV00011', N'KH00009')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00007', CAST(N'2016-02-15' AS Date), N'NV00006', N'KH00003')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00008', CAST(N'2016-04-17' AS Date), N'NV00009', N'KH00004')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00009', CAST(N'2016-01-06' AS Date), N'NV00011', N'KH00007')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00010', CAST(N'2016-06-20' AS Date), N'NV00010', N'KH00006')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00011', CAST(N'2016-06-28' AS Date), N'NV00005', N'KH00008')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00012', CAST(N'2016-09-04' AS Date), N'NV00010', N'KH00011')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00013', CAST(N'2016-01-31' AS Date), N'NV00011', N'KH00019')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00014', CAST(N'2016-11-16' AS Date), N'NV00003', N'KH00024')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00015', CAST(N'2016-12-20' AS Date), N'NV00005', N'KH00016')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00016', CAST(N'2016-12-28' AS Date), N'NV00001', N'KH00015')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00017', CAST(N'2017-03-23' AS Date), N'NV00001', N'KH00013')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00018', CAST(N'2017-11-10' AS Date), N'NV00008', N'KH00018')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00019', CAST(N'2017-11-27' AS Date), N'NV00007', N'KH00020')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00020', CAST(N'2017-12-15' AS Date), N'NV00009', N'KH00014')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00021', CAST(N'2018-03-22' AS Date), N'NV00003', N'KH00023')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00022', CAST(N'2018-06-27' AS Date), N'NV00006', N'KH00025')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00023', CAST(N'2018-08-16' AS Date), N'NV00005', N'KH00012')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00024', CAST(N'2018-09-13' AS Date), N'NV00006', N'KH00028')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00025', CAST(N'2018-12-10' AS Date), N'NV00011', N'KH00027')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00026', CAST(N'2018-11-23' AS Date), N'NV00001', N'KH00029')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00027', CAST(N'2018-12-16' AS Date), N'NV00001', N'KH00021')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00028', CAST(N'2019-05-15' AS Date), N'NV00009', N'KH00022')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00029', CAST(N'2019-05-19' AS Date), N'NV00009', N'KH00030')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00030', CAST(N'2019-06-27' AS Date), N'NV00004', N'KH00031')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00031', CAST(N'2019-08-24' AS Date), N'NV00007', N'KH00034')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00032', CAST(N'2019-09-12' AS Date), N'NV00009', N'KH00037')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00033', CAST(N'2019-10-10' AS Date), N'NV00006', N'KH00033')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00034', CAST(N'2019-10-17' AS Date), N'NV00002', N'KH00026')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00035', CAST(N'2019-12-15' AS Date), N'NV00003', N'KH00045')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00036', CAST(N'2019-12-27' AS Date), N'NV00009', N'KH00032')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00037', CAST(N'2020-01-18' AS Date), N'NV00002', N'KH00036')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00038', CAST(N'2020-02-28' AS Date), N'NV00004', N'KH00038')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00039', CAST(N'2020-05-24' AS Date), N'NV00010', N'KH00035')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00040', CAST(N'2020-08-17' AS Date), N'NV00005', N'KH00045')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00041', CAST(N'2020-11-28' AS Date), N'NV00008', N'KH00042')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00042', CAST(N'2020-12-19' AS Date), N'NV00003', N'KH00046')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00043', CAST(N'2021-01-14' AS Date), N'NV00009', N'KH00041')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00044', CAST(N'2021-03-16' AS Date), N'NV00001', N'KH00047')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00045', CAST(N'2021-03-27' AS Date), N'NV00006', N'KH00048')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00046', CAST(N'2021-04-21' AS Date), N'NV00011', N'KH00043')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00047', CAST(N'2021-04-28' AS Date), N'NV00011', N'KH00044')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00048', CAST(N'2021-04-30' AS Date), N'NV00001', N'KH00040')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00049', CAST(N'2021-05-13' AS Date), N'NV00007', N'KH00049')
INSERT [dbo].[HoaDon] ([maHD], [ngayLapHD], [maNV], [maKH]) VALUES (N'HD00050', CAST(N'2021-05-14' AS Date), N'NV00009', N'KH00050')
GO
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00001', N'Nguyễn Thảo Ly', 1, N'734601944   ', N'038 936 3252')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00002', N'Nguyễn Quốc Toàn', 0, N'750416174   ', N'060 690 0653')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00003', N'Trần Ngọc Tuyết', 1, N'420955854   ', N'018 370 5720')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00004', N'Lê Thị Đăng Vy', 1, N'724518543   ', N'038 379 9678')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00005', N'Phạm Trần Hận', 0, N'852550450   ', N'085 171 0399')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00006', N'Nguyễn Lê Yến Nhi', 1, N'871810216   ', N'054 282 4120')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00007', N'Nguyễn Thị Yến My', 1, N'762237654   ', N'087 313 2309')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00008', N'Võ Thị Ni Na', 1, N'808925311   ', N'048 527 7781')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00009', N'Trần Thị Ngọc Phương', 1, N'137605046   ', N'030 369 9397')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00010', N'Nguyễn Trần Triệu Vĩ', 0, N'642486224   ', N'028 882 0623')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00011', N'Lê Hồng Phát', 0, N'760796018   ', N'088 835 4643')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00012', N'Võ Thị Thanh Trúc', 1, N'263225157   ', N'013 413 3675')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00013', N'Trịnh Lê Thị Bích Huyền', 1, N'511310073   ', N'021 225 8069')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00014', N'Nguyễn Thị Bảo Trâm', 1, N'679320997   ', N'091 768 3800')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00015', N'Dương Quang Hùng', 0, N'734343895   ', N'083 413 5454')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00016', N'Huỳnh Thị Thiên Trúc', 1, N'779188217   ', N'026 384 4566')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00017', N'Trần Minh Thái', 1, N'892825045   ', N'057 866 0491')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00018', N'Huỳnh Ngọc Thanh', 1, N'360843917   ', N'087 850 6687')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00019', N'Huỳnh Thị Ngọc Yên', 1, N'134239203   ', N'082 955 4443')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00020', N'Nguyễn Lê Huy', 0, N'941624497   ', N'051 995 1104')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00021', N'Trần Thị Hải Oanh', 1, N'784654473   ', N'013 452 8380')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00022', N'Ngô Huỳnh Thiên Thảo', 1, N'948174410   ', N'084 604 1745')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00023', N'Nguyễn Nhựt Hào', 0, N'261773607   ', N'036 588 9464')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00024', N'Nguyễn Trọng Khoa', 0, N'831466473   ', N'043 463 9922')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00025', N'Nguyễn Thị Thúy', 1, N'544486456   ', N'028 395 7364')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00026', N'Nguyễn Thị Quỳnh Anh', 1, N'680871480   ', N'032 712 8538')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00027', N'Nguyễn Lê Thành Nguyên', 0, N'832349973   ', N'065 203 7817')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00028', N'Trần Nguyễn Phương Tuyền', 1, N'538247414   ', N'025 324 6900')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00029', N'Nguyễn Thị Hồng Hạnh', 1, N'815680107   ', N'052 800 9923')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00030', N'Đặng Thị Ái Liên', 1, N'292680477   ', N'074 415 3186')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00031', N'Trương Thị Quỳnh Như', 1, N'523940621   ', N'035 772 7514')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00032', N'Lê Thị Ngọc Đa', 1, N'326939661   ', N'093 968 6762')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00033', N'Trương Thị Hà Phương', 1, N'928057113   ', N'034 379 6633')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00034', N'Lê Công Thành', 0, N'646753485   ', N'098 156 9066')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00035', N'Lê Thị Như Tiên', 1, N'200445108   ', N'057 788 0563')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00036', N'Trần Minh Châu', 1, N'193205958   ', N'028 222 9209')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00037', N'Phạm Ái Hằng', 1, N'264473647   ', N'059 146 8274')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00038', N'Nguyễn Văn Thoại', 0, N'603236258   ', N'073 103 6564')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00039', N'Phùng Kim Trang', 1, N'898602122   ', N'069 463 3299')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00040', N'Lê Trung Hoàng', 0, N'208414226   ', N'067 470 8380')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00041', N'Đỗ Thị Loan', 1, N'509681261   ', N'032 485 5371')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00042', N'Đoàn Nguyễn Tiểu Khương', 0, N'133154957   ', N'023 680 6142')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00043', N'Đỗ Trường Giang', 0, N'448168193   ', N'095 659 0631')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00044', N'Hồ Võ Thùy Dương', 1, N'286648015   ', N'060 399 3469')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00045', N'Nguyễn Thị Thùy Dương', 1, N'482908388   ', N'084 398 9053')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00046', N'Trần Tuyết Giao', 1, N'558474526   ', N'091 491 2194')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00047', N'Nguyễn Văn Tình', 0, N'464347099   ', N'094 375 6700')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00048', N'Đặng Thị Ngọc Bích', 1, N'210440803   ', N'094 571 1615')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00049', N'Lê Thị Diễm Trang', 1, N'870487852   ', N'031 777 8642')
INSERT [dbo].[KhachHang] ([maKH], [hoTen], [gioiTinh], [cmt], [soDienThoai]) VALUES (N'KH00050', N'Nguyễn Quốc Huy', 0, N'297545182   ', N'074 202 5586')
GO
INSERT [dbo].[LoaiPhong] ([maLoaiPhong], [tenLoaiPhong]) VALUES (N'LP22001', N'Phòng Thường')
INSERT [dbo].[LoaiPhong] ([maLoaiPhong], [tenLoaiPhong]) VALUES (N'LP22002', N'Phòng VIP')
GO
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00001', N'Chu Thị Quỳnh', 1, CAST(N'1997-10-26' AS Date), N'Hồ Chí Minh', N'035 271 3214', N'chuquyn12340@gmail.com', N'Lễ tân', N'Letan01', N'Lt1234')
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00002', N'Nguyễn Thị Trà My', 1, CAST(N'1994-08-28' AS Date), N'Vĩnh Long', N'061 418 4079', N'mytra.ngu12349@gmail.com', N'Lễ tân', N'Letan02', N'Lt4321')
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00003', N'Nguyễn Thị Phương Thảo ', 1, CAST(N'1997-05-20' AS Date), N'An Giang', N'021 545 7811', N'nguyenphuongtha1234p@gmail.com', N'Lễ tân', N'Letan03', N'Lt5678')
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00004', N'Quách Tuyết Hương', 1, CAST(N'1996-07-16' AS Date), N'Thanh Hóa', N'065 718 1339', N'quachtuyethuong112346@gmail.com', N'Lễ tân', N'Letan04', N'Lt8765')
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00005', N'Nguyễn Tùng Dương ', 0, CAST(N'1997-11-17' AS Date), N'Quảng Trị', N'037 339 0050', N'nguyenduong22112347@gmail.com', N'Quản lí', N'Quanli01', N'Ql1234')
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00006', N'Vũ Thị Hiền', 1, CAST(N'1997-09-27' AS Date), N'Long An', N'094 651 1829', N'hienvu1234d@gmail.com', N'Quản lí', N'Quanli02', N'Ql4321')
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00007', N'Ngô Thị Phương ', 1, CAST(N'1990-08-10' AS Date), N'Tiền Giang', N'042 103 9195', N'matbi1234m@gmail.com', N'Kế toán', N'Ketoan01', N'Kt1234')
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00008', N'TrịinhjThanh Châu', 1, CAST(N'1985-10-27' AS Date), N'Đồng Tháp', N'050 226 7167', N'trinhthan1234u@gmail.com', N'Kế toán', N'Ketoan02', N'Kt4321')
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00009', N'Nguyễn Mai Hương', 1, CAST(N'1996-01-25' AS Date), N'Hồ Chí Minh', N'085 529 6297', N'nguyenmaihuong30012346@gmail.com', N'Lễ tân', N'Letan05', N'Lt2345')
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00010', N'Lê Thị Tuyết', 1, CAST(N'1984-09-11' AS Date), N'Kiên Giang', N'053 578 7819', N'letuy12347@gmail.com', N'Quản lí', N'Quanli03', N'Ql5678')
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00011', N'Nguyễn Thị Lan Hương', 1, CAST(N'1996-03-07' AS Date), N'Thanh Hóa', N'063 519 7641', N'huongnt.1234x@gmail.com', N'Kế toán', N'Ketoan03', N'Kt5678')
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00012', N'Trần Đức Tú', 0, CAST(N'1993-08-29' AS Date), N'Vĩnh Long', N'056 439 7554', N'tranduc12341@gmail.com', N'Bảo vệ', NULL, NULL)
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00013', N'Dương Minh Huy', 0, CAST(N'1987-03-20' AS Date), N'Thanh Hóa', N'074 185 0153', N'hu1234o@gmail.com', N'Bảo vệ', NULL, NULL)
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00014', N'Nguyễn Thị Đào', 1, CAST(N'1992-04-13' AS Date), N'Tiền Giang', N'016 975 8994', N'thanhd12344@gmail.com', N'Nhân viên dọn phòng', NULL, NULL)
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00015', N'Trịnh Thị Thanh Tâm', 1, CAST(N'1996-01-26' AS Date), N'Hồ Chí Minh', N'014 626 0610', N'tamtrinhtha1234t@gmail.com', N'Nhân viên dọn phòng', NULL, NULL)
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00016', N'Nguyễn Thị Huệ', 1, CAST(N'1992-06-02' AS Date), N'Long An', N'040 335 1989', N'hue12342@gmail.com', N'Nhân viên dọn phòng', NULL, NULL)
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00017', N'Tạ Thị Hương ', 1, CAST(N'1995-11-06' AS Date), N'Hồ Chí Minh', N'027 318 9183', N'huonghuong11111234a@gmail.com', N'Nhân viên dọn phòng', NULL, NULL)
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00018', N'Nguyễn Thị Tâm', 1, CAST(N'1989-03-24' AS Date), N'Vĩnh Long', N'093 847 3856', N'tamnguyen12349@gmail.com', N'Nhân viên dọn phòng', NULL, NULL)
INSERT [dbo].[NhanVien] ([maNV], [hoTen], [gioiTinh], [ngaySinh], [diaChi], [soDienThoai], [email], [chucVu], [tenDangNhap], [matKhau]) VALUES (N'NV00019', N'Nguyễn Thị Phương Thảo', 1, CAST(N'1993-07-29' AS Date), N'Cần Thơ', N'017 509 5502', N'thaobe12341@gmail.com', N'Nhân viên dọn phòng', NULL, NULL)
GO
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11001', 1500000, 3, N'Tầng 3 #PhongVIP#View sông Sài Gòn#Với quang cảnh hướng về sông Sài Gòn,là sự lựa chọn hoàn hảo. Những ô cửa kính lớn xung quanh cho quý khách nhìn toàn cảnh của sông và thành phố từ trên cao. Mang đến khung cảnh hữu tình giữa lòng phố.', 1, N'LP22002')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11002', 1200000, 2, N'Tầng 2 #PhongVIP#View sông Sài Gòn#Với quang cảnh hướng về sông Sài Gòn,là sự lựa chọn hoàn hảo. Những ô cửa kính lớn xung quanh cho quý khách nhìn toàn cảnh của sông và thành phố từ trên cao. Mang đến khung cảnh hữu tình giữa lòng phố.', 1, N'LP22002')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11003', 1200000, 2, N'Tầng 3 #PhongVIP#View thành phố#Thiết kế của phòng được thiết kế tinh tế sang trọng với nội thất đầy đủ tiện nghi hiện đại. Cửa sổ kính rộng thoáng bao quát toàn cảnh thành phố mang đến cho bạn một không gian thanh bình và dễ chịu.', 0, N'LP22002')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11004', 1000000, 1, N'Tầng 3 #PhongVIP# View sông Sài Gòn#Với quang cảnh hướng về sông Sài Gòn,là sự lựa chọn hoàn hảo. Những ô cửa kính lớn xung quanh cho quý khách nhìn toàn cảnh của sông và thành phố từ trên cao. Mang đến khung cảnh hữu tình giữa lòng phố.', 0, N'LP22002')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11005', 1000000, 1, N'Tầng 3 #PhongVIP#View thành phố#Với quang cảnh hướng về sông Sài Gòn,là sự lựa chọn hoàn hảo. Những ô cửa kính lớn xung quanh cho quý khách nhìn toàn cảnh của sông và thành phố từ trên cao. Mang đến khung cảnh hữu tình giữa lòng phố.', 1, N'LP22002')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11006', 300000, 3, N'Tầng 1#Phòng Thường#Không view#Đây là phòng tiêu chuẩn, đơn giản nhất trong khách sạn. Với những trang bị tối thiểu, có diện tích nhỏ, không có view.Phòng dành cho những khách hàng không có nhu cầu cao về lưu trú hoặc thời gian lưu trú rất ngắn', 0, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11007', 600000, 3, N'Tầng 2#Phòng Thường#View cửa sổ#Với kiến trúc hiện đại và tiện nghi nhất giúp bạn làm việc hiệu quả hoặc thư giãn cùng gia đình vào những ngày nghỉ. Cửa sổ với không gian mở mang đến tầm nhìn thoáng đãng,đón bình minh sớm mai và tận hưởng không khí trong lành mà tài nguyên biển mang lại. Cùng với các trang thiết bị hiện đại và an toàn nhất sẽ giúp quý khách hoàn toàn thư giãn rũ bỏ tất cả những xô bồ của đời sống thường nhật', 0, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11008', 400000, 2, N'Tầng 2#Phòng Thường#View cửa sổ#Với kiến trúc hiện đại và tiện nghi nhất giúp bạn làm việc hiệu quả hoặc thư giãn cùng gia đình vào những ngày nghỉ. Cửa sổ với không gian mở mang đến tầm nhìn thoáng đãng,đón bình minh sớm mai và tận hưởng không khí trong lành mà tài nguyên biển mang lại. Cùng với các trang thiết bị hiện đại và an toàn nhất sẽ giúp quý khách hoàn toàn thư giãn rũ bỏ tất cả những xô bồ của đời sống thường nhật', 1, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11009', 200000, 2, N'Tầng 1#Phòng Thường#Không view#Đây là phòng tiêu chuẩn, đơn giản nhất trong khách sạn. Với những trang bị tối thiểu, có diện tích nhỏ, không có view.Phòng dành cho những khách hàng không có nhu cầu cao về lưu trú hoặc thời gian lưu trú rất ngắn', 0, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11010', 200000, 2, N'Tầng 1#Phòng Thường#Không view#Đây là phòng tiêu chuẩn, đơn giản nhất trong khách sạn. Với những trang bị tối thiểu, có diện tích nhỏ, không có view.Phòng dành cho những khách hàng không có nhu cầu cao về lưu trú hoặc thời gian lưu trú rất ngắn', 0, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11011', 200000, 2, N'Tầng 1#Phòng Thường#Không view#Đây là phòng tiêu chuẩn, đơn giản nhất trong khách sạn. Với những trang bị tối thiểu, có diện tích nhỏ, không có view.Phòng dành cho những khách hàng không có nhu cầu cao về lưu trú hoặc thời gian lưu trú rất ngắn', 0, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11012', 250000, 1, N'Tầng 2#Phòng Thường#View cửa sổ#Với kiến trúc hiện đại và tiện nghi nhất giúp bạn làm việc hiệu quả hoặc thư giãn cùng gia đình vào những ngày nghỉ. Cửa sổ với không gian mở mang đến tầm nhìn thoáng đãng,đón bình minh sớm mai và tận hưởng không khí trong lành mà tài nguyên biển mang lại. Cùng với các trang thiết bị hiện đại và an toàn nhất sẽ giúp quý khách hoàn toàn thư giãn rũ bỏ tất cả những xô bồ của đời sống thường nhật', 0, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11013', 250000, 1, N'Tầng 2#Phòng Thường#View cửa sổ#Với kiến trúc hiện đại và tiện nghi nhất giúp bạn làm việc hiệu quả hoặc thư giãn cùng gia đình vào những ngày nghỉ. Cửa sổ với không gian mở mang đến tầm nhìn thoáng đãng,đón bình minh sớm mai và tận hưởng không khí trong lành mà tài nguyên biển mang lại. Cùng với các trang thiết bị hiện đại và an toàn nhất sẽ giúp quý khách hoàn toàn thư giãn rũ bỏ tất cả những xô bồ của đời sống thường nhật', 0, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11014', 150000, 1, N'Tầng 1#Phòng Thường#Không view#Đây là phòng tiêu chuẩn, đơn giản nhất trong khách sạn. Với những trang bị tối thiểu, có diện tích nhỏ, không có view.Phòng dành cho những khách hàng không có nhu cầu cao về lưu trú hoặc thời gian lưu trú rất ngắn', 1, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11015', 250000, 1, N'Tầng 2#Phòng Thường#View cửa sổ#Với kiến trúc hiện đại và tiện nghi nhất giúp bạn làm việc hiệu quả hoặc thư giãn cùng gia đình vào những ngày nghỉ. Cửa sổ với không gian mở mang đến tầm nhìn thoáng đãng,đón bình minh sớm mai và tận hưởng không khí trong lành mà tài nguyên biển mang lại. Cùng với các trang thiết bị hiện đại và an toàn nhất sẽ giúp quý khách hoàn toàn thư giãn rũ bỏ tất cả những xô bồ của đời sống thường nhật', 1, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11016', 300000, 3, N'Tầng 1#Phòng Thường#Không view#Đây là phòng tiêu chuẩn, đơn giản nhất trong khách sạn. Với những trang bị tối thiểu, có diện tích nhỏ, không có view.Phòng dành cho những khách hàng không có nhu cầu cao về lưu trú hoặc thời gian lưu trú rất ngắn', 0, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11017', 300000, 3, N'Tầng 1#Phòng Thường#Không view#Đây là phòng tiêu chuẩn, đơn giản nhất trong khách sạn. Với những trang bị tối thiểu, có diện tích nhỏ, không có view.Phòng dành cho những khách hàng không có nhu cầu cao về lưu trú hoặc thời gian lưu trú rất ngắn', 0, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11018', 200000, 2, N'Tầng 1#Phòng Thường#Không view#Đây là phòng tiêu chuẩn, đơn giản nhất trong khách sạn. Với những trang bị tối thiểu, có diện tích nhỏ, không có view.Phòng dành cho những khách hàng không có nhu cầu cao về lưu trú hoặc thời gian lưu trú rất ngắn', 1, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11019', 150000, 2, N'Tầng 1#Phòng Thường#Không view#Đây là phòng tiêu chuẩn, đơn giản nhất trong khách sạn. Với những trang bị tối thiểu, có diện tích nhỏ, không có view.Phòng dành cho những khách hàng không có nhu cầu cao về lưu trú hoặc thời gian lưu trú rất ngắn', 1, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11020', 225000, 2, N'Tầng 1#Phòng Thường#View cửa sổ#Với kiến trúc hiện đại và tiện nghi nhất giúp bạn làm việc hiệu quả hoặc thư giãn cùng gia đình vào những ngày nghỉ. Cửa sổ với không gian mở mang đến tầm nhìn thoáng đãng,đón bình minh sớm mai và tận hưởng không khí trong lành mà tài nguyên biển mang lại. Cùng với các trang thiết bị hiện đại và an toàn nhất sẽ giúp quý khách hoàn toàn thư giãn rũ bỏ tất cả những xô bồ của đời sống thường nhật', 0, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11021', 225000, 2, N'Tầng 1#Phòng Thường#View cửa sổ#Với kiến trúc hiện đại và tiện nghi nhất giúp bạn làm việc hiệu quả hoặc thư giãn cùng gia đình vào những ngày nghỉ. Cửa sổ với không gian mở mang đến tầm nhìn thoáng đãng,đón bình minh sớm mai và tận hưởng không khí trong lành mà tài nguyên biển mang lại. Cùng với các trang thiết bị hiện đại và an toàn nhất sẽ giúp quý khách hoàn toàn thư giãn rũ bỏ tất cả những xô bồ của đời sống thường nhật', 1, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11022', 150000, 1, N'Tầng 1#Phòng Thường#View cửa sổ#Với kiến trúc hiện đại và tiện nghi nhất giúp bạn làm việc hiệu quả hoặc thư giãn cùng gia đình vào những ngày nghỉ. Cửa sổ với không gian mở mang đến tầm nhìn thoáng đãng,đón bình minh sớm mai và tận hưởng không khí trong lành mà tài nguyên biển mang lại. Cùng với các trang thiết bị hiện đại và an toàn nhất sẽ giúp quý khách hoàn toàn thư giãn rũ bỏ tất cả những xô bồ của đời sống thường nhật', 1, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11023', 150000, 1, N'Tầng 1#Phòng Thường#Không view#Đây là phòng tiêu chuẩn, đơn giản nhất trong khách sạn. Với những trang bị tối thiểu, có diện tích nhỏ, không có view.Phòng dành cho những khách hàng không có nhu cầu cao về lưu trú hoặc thời gian lưu trú rất ngắn', 1, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11024', 150000, 1, N'Tầng 1#Phòng Thường#Không view#Đây là phòng tiêu chuẩn, đơn giản nhất trong khách sạn. Với những trang bị tối thiểu, có diện tích nhỏ, không có view.Phòng dành cho những khách hàng không có nhu cầu cao về lưu trú hoặc thời gian lưu trú rất ngắn', 0, N'LP22001')
INSERT [dbo].[Phong] ([maPhong], [giaPhong], [soGiuong], [chiTietPhong], [trangThai], [maLoaiPhong]) VALUES (N'MP11025', 150000, 1, N'Tầng 1#Phòng Thường#View cửa sổ#Với kiến trúc hiện đại và tiện nghi nhất giúp bạn làm việc hiệu quả hoặc thư giãn cùng gia đình vào những ngày nghỉ. Cửa sổ với không gian mở mang đến tầm nhìn thoáng đãng,đón bình minh sớm mai và tận hưởng không khí trong lành mà tài nguyên biển mang lại. Cùng với các trang thiết bị hiện đại và an toàn nhất sẽ giúp quý khách hoàn toàn thư giãn rũ bỏ tất cả những xô bồ của đời sống thường nhật', 1, N'LP22001')
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [PK_KhachHang]  DEFAULT ([DBO].[AUTO_IDKH]()) FOR [maKH]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [PK_NhanVien]  DEFAULT ([DBO].[AUTO_IDNV]()) FOR [maNV]
GO
ALTER TABLE [dbo].[Phong] ADD  CONSTRAINT [PK_Phong]  DEFAULT ([DBO].[AUTO_IDMP]()) FOR [maPhong]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [PK_HoaDon]  DEFAULT ([DBO].[AUTO_IDHD]()) FOR [maHD]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_HoaDon] FOREIGN KEY([maHD])
REFERENCES [dbo].[HoaDon] ([maHD])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_Phong] FOREIGN KEY([maPhong])
REFERENCES [dbo].[Phong] ([maPhong])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_Phong]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([maKH])
REFERENCES [dbo].[KhachHang] ([maKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_LoaiPhong] FOREIGN KEY([maLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([maLoaiPhong])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_LoaiPhong]
GO
USE [master]
GO
ALTER DATABASE [QLKS] SET  READ_WRITE 
GO
