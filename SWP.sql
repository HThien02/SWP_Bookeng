USE [master]
GO
/****** Object:  Database [SWP1]    Script Date: 6/28/2023 9:13:44 AM ******/
CREATE DATABASE [SWP1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP1', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\SWP1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP1_log', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\SWP1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWP1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP1] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWP1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP1] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP1] SET  MULTI_USER 
GO
ALTER DATABASE [SWP1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP1] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP1]
GO
/****** Object:  Table [dbo].[AccountRole]    Script Date: 6/28/2023 9:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRole](
	[role] [varchar](10) NOT NULL,
	[roleID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_AccountRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accountss]    Script Date: 6/28/2023 9:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accountss](
	[AccountID] [varchar](20) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[roleID] [varchar](10) NOT NULL,
	[email] [varchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[phone] [varchar](20) NULL,
	[birthday] [varchar](50) NULL,
	[nation] [varchar](50) NULL,
	[gender] [varchar](10) NULL,
	[identitycard] [varchar](30) NULL,
 CONSTRAINT [PK_Accountss] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 6/28/2023 9:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[AccountID] [varchar](20) NOT NULL,
	[HotelID] [varchar](20) NOT NULL,
	[HotelName] [varchar](50) NOT NULL,
	[HotelAddress] [varchar](255) NOT NULL,
	[HotelInfo] [varchar](255) NOT NULL,
	[Province] [varchar](50) NULL,
	[StartPrice] [varchar](20) NULL,
	[HotelImage] [varchar](255) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/28/2023 9:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[RoomID] [varchar](20) NOT NULL,
	[RoomName] [varchar](200) NOT NULL,
	[AccountID] [varchar](20) NOT NULL,
	[CheckIn] [varchar](20) NOT NULL,
	[CheckOut] [varchar](20) NOT NULL,
	[email] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[phone] [varchar](20) NULL,
	[nation] [varchar](50) NULL,
	[RoomType] [varchar](50) NULL,
	[RoomQualtity] [int] NULL,
	[BedQualtity] [int] NULL,
	[PayMethod] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/28/2023 9:13:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[HotelID] [varchar](20) NOT NULL,
	[RoomID] [varchar](20) NOT NULL,
	[RoomName] [varchar](100) NOT NULL,
	[RoomInfo] [varchar](255) NOT NULL,
	[RoomPrice] [varchar](20) NOT NULL,
	[BedQuantity] [varchar](20) NOT NULL,
	[Wifi] [binary](1) NOT NULL,
	[Window] [binary](1) NOT NULL,
	[Smoking] [binary](1) NOT NULL,
	[RoomImage] [varchar](255) NULL,
	[RoomAvailable] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AccountRole] ([role], [roleID]) VALUES (N'Admin', N'R001')
INSERT [dbo].[AccountRole] ([role], [roleID]) VALUES (N'Owner', N'R002')
INSERT [dbo].[AccountRole] ([role], [roleID]) VALUES (N'User', N'R003')
GO
INSERT [dbo].[Accountss] ([AccountID], [username], [password], [roleID], [email], [name], [phone], [birthday], [nation], [gender], [identitycard]) VALUES (N'A001', N'admin1', N'password1', N'R001', N'admin4@example.com', N'Admin1', N'987654321', N'1991-07-15', N'USA', N'Female', N'5678904321')
INSERT [dbo].[Accountss] ([AccountID], [username], [password], [roleID], [email], [name], [phone], [birthday], [nation], [gender], [identitycard]) VALUES (N'A002', N'admin2', N'password1', N'R001', N'admin5@example.com', N'Admin2', N'123456789', N'1996-04-20', N'USA', N'Male', N'3456789012')
INSERT [dbo].[Accountss] ([AccountID], [username], [password], [roleID], [email], [name], [phone], [birthday], [nation], [gender], [identitycard]) VALUES (N'O001', N'Owner1', N'owner123', N'R002', N'owner1@example.com', N'Owner 1', N'987654321', N'1994-08-05', N'USA', N'Female', N'2345678901')
INSERT [dbo].[Accountss] ([AccountID], [username], [password], [roleID], [email], [name], [phone], [birthday], [nation], [gender], [identitycard]) VALUES (N'O002', N'Owner2', N'owner123', N'R002', N'owner2@example.com', N'Owner 2', N'543216789', N'1999-03-18', N'USA', N'Male', N'1234567890')
INSERT [dbo].[Accountss] ([AccountID], [username], [password], [roleID], [email], [name], [phone], [birthday], [nation], [gender], [identitycard]) VALUES (N'OW34885794', N'owner', N'123123', N'R002', N'chienthang200@gmail.com', N' ', N' ', N' ', N'  ', N' ', N' ')
INSERT [dbo].[Accountss] ([AccountID], [username], [password], [roleID], [email], [name], [phone], [birthday], [nation], [gender], [identitycard]) VALUES (N'U001', N'user1', N'user123', N'R003', N'user1@example.com', N'User 1', N'987654321', N'1994-08-05', N'USA', N'Female', N'2345678901')
INSERT [dbo].[Accountss] ([AccountID], [username], [password], [roleID], [email], [name], [phone], [birthday], [nation], [gender], [identitycard]) VALUES (N'U002', N'user2', N'user123', N'R003', N'user2@example.com', N'User 2', N'543216789', N'1999-03-18', N'USA', N'Male', N'1234567890')
INSERT [dbo].[Accountss] ([AccountID], [username], [password], [roleID], [email], [name], [phone], [birthday], [nation], [gender], [identitycard]) VALUES (N'US16458339', N'chienthang1', N'123', N'R003', N'chienthang200@gmail.com', N' ', N' ', N' ', N'  ', N' ', N' ')
INSERT [dbo].[Accountss] ([AccountID], [username], [password], [roleID], [email], [name], [phone], [birthday], [nation], [gender], [identitycard]) VALUES (N'US61084281', N'top123', N'123456', N'R003', N'citygym1708@gmail.com', N' ', N' ', N' ', N'  ', N' ', N' ')
INSERT [dbo].[Accountss] ([AccountID], [username], [password], [roleID], [email], [name], [phone], [birthday], [nation], [gender], [identitycard]) VALUES (N'US94445301', N'chienthang', N'123123', N'R003', N'chienthang200@gmail.com', N'Chi?n Th?ng', N'+84818307567', N'11-6-2003', N'Vietnam', N'male', N'123123')
INSERT [dbo].[Accountss] ([AccountID], [username], [password], [roleID], [email], [name], [phone], [birthday], [nation], [gender], [identitycard]) VALUES (N'US34412301', N'chienthang3', N'123123', N'R003', N'chienthang2001@gmail.com', N'Chiến Thắng', N'+84818307567', N'11-6-2003', N'Vietnam', N'male', N'123123')
GO
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HDL004', N'Bazan Hotel Dalat', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Da Lat', N'Đà L?t', N'700,000   ', NULL)
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HDL005', N'Feliz Dalat Homestay', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Da Lat', N'Da Lat', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HDL006', N'GREENECO DA LAT HOTEL - Khach san Green Eco Da Lat', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Da Lat', N'Da Lat', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HDL007', N'HANZ Chuong Hotel Dalat', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Da Lat', N'Da Lat', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HDN001', N'Hotel 1', N'178 Đư?ng Tr?n Phú', N'This is Hotel 1 in Da Nang', N'Da Nang', N'300,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HDN002', N'Hotel 2', N'178 Đư?ng Tr?n Phú', N'This is Hotel 1 in Da Nang', N'Da Nang', N'300,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HDN003', N'Hotel 3', N'178 Đư?ng Tr?n Phú', N'This is Hotel 1 in Da Nang', N'Da Nang', N'300,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HDN004', N'Adina 3 Star Hotel', N'178 Đư?ng Tr?n Phú', N'This is Hotel 1 in Da Nang', N'Da Nang', N'300,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HDN005', N'Menora Premium Da Nang - Sea Corner Boutique', N'178 Đư?ng Tr?n Phú', N'This is Hotel 1 in Da Nang', N'Da Nang', N'300,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HDN006', N'Minh Quan Hotel - Da Nang Center', N'178 Đư?ng Tr?n Phú', N'This is Hotel 1 in Da Nang', N'Da Nang', N'300,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HDN007', N'Raon Apartment and Hotel', N'178 Đư?ng Tr?n Phú', N'This is Hotel 1 in Da Nang', N'Da Nang', N'300,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HH001', N'DMZ Hotel', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Hue', N'Hue', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HH002', N'Jade Scene Hotel', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Hue', N'Hue', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HH003', N'Nana Homestay & Villa', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Hue', N'Hue', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HH004', N'Purple Hue Central Hub', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Hue', N'Hue', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HH005', N'Silk Path Grand Hue Hotel', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Hue', N'Hue', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HH006', N'Thanh Lich Royal Boutique', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Hue', N'Hue', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O002', N'HH007', N'Nana Homestay & Villa', N'26/1/147 Phan Đ?nh Phùng 3', N'This is Hotel 2 in Hue', N'Hue', N'320,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O002', N'HH008', N'Jade Scene Hotel', N'30/42 Nguyen Cong Tru', N'This is Hotel 1 in Hue', N'Hue', N'275,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHA001', N'Crony Villa', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Hoi An', N'Hoi An', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHA002', N'iHome Hoi An', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Hoi An', N'Hoi An', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHA003', N'Phuc Hung Riverside Villa Hoi An', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Hoi An', N'Hoi An', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHA004', N'Sea and Sand Hotel', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Hoi An', N'Hoi An', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHA005', N'iHome Hoi An', N'54 Nguy?n Tri Phương, C?m Nam', N'This is Hotel 1 in Hoi An', N'Hoi An', N'380,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHA006', N'Blooms Boutique Village', N'85 Le Hong Phong Street, Tan An Ward, Tân An', N'This is Hotel 2 in Hoi An', N'Hoi An', N'400,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O002', N'HHA007', N'Hoi An Golden Holiday Hotel & Spa', N'467 Hai Ba Trung, C?m Phô', N'This is Hotel 4 in Hoi An', N'Hoi An', N'270,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHCM001', N'Hotel 1', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Ho Chi Minh', N'Ho Chi Minh', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHCM002', N'Hotel 2', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Ho Chi Minh', N'Ho Chi Minh', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHCM003', N'Hotel 3', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Ho Chi Minh', N'Ho Chi Minh', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHCM004', N'Elvita Landmark 81 Luxury Vinhomes Central Park', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Ho Chi Minh', N'Ho Chi Minh', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHCM005', N'KunKin Garden Aparthotel & Spa', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Ho Chi Minh', N'Ho Chi Minh', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHCM006', N'Triple E Hotel Metro Ben Thanh', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Ho Chi Minh', N'Ho Chi Minh', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHCM007', N'ZO APARTMENT MILLENNIUM - Free pool & gym', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Ho Chi Minh', N'Ho Chi Minh', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O002', N'HHCM008', N'Icon Saigon - LifeStyle Design Hotel', N'65-67 Hai Ba Trung, Qu?n 1', N'This is Hotel 1 in Ho Chi Minh', N'Ho Chi Minh', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O002', N'HHCM009', N'Triple E Hotel Metro Ben Thanh', N'Phư?ng Nguy?n Thái B?nh 146- 148 Đư?ng K? Con, Qu?n 1', N'This is Hotel 2 in Ho Chi Minh', N'Ho Chi Minh', N'500,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O002', N'HHCM010', N'Calista Sai Gon Hotel', N'247-249, Ly Tu Trong, Ben Thanh Ward, Qu?n 1', N'This is Hotel 3 in Ho Chi Minh', N'Ho Chi Minh', N'800,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHN001', N'Beryl Signature Hotel & Travel', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Ha Noi', N'Ha Noi', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHN002', N'Hanoi Lake View Hotel & Spa', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Ha Noi', N'Ha Noi', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHN003', N'HANZ Memory Legends Hotel', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Ha Noi', N'Ha Noi', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHN004', N'Rex Hanoi Hotel', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Ha Noi', N'Ha Noi', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HHN005', N'Nghê Prana Villa & Spa Hoi An', N'T? 7, kh?i Hà Trung, Phư?ng C?m Nam, C?m Nam', N'This is Hotel 3 in Hoi An', N'Hoi An', N'500,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O002', N'HHN006', N'Hanoi Paradise Center Hotel & Spa', N'22/5 Hang Voi Street, Ly Thai To Ward, Hoan Kiem District, Vietnam, Qu?n Hoàn Ki?mt', N'This is Hotel 1 in Ha Noi', N'Ha Noi', N'500,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O002', N'HHN007', N'La Passion Hanoi Hotel & Spa', N'Hàng Thùng 26, Qu?n Hoàn Ki?m', N'This is Hotel 2 in Ha Noi', N'Ha Noi', N'300,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O002', N'HHN008', N'22Land Residence Hotel & Spa 52 Ngo Huyen', N'52 - 54 Ngo Huyen , Qu?n Hoàn Ki?m', N'This is Hotel 3 in Ha Noi', N'Ha Noi', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HMN001', N'iHome Backpacker Resort', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Mui Ne', N'Mui Ne', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HMN002', N'MAY Bungalow', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Mui Ne', N'Mui Ne', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HMN003', N'Mui Ne Hills Backpackers', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Mui Ne', N'Mui Ne', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HMN004', N'Serenity by the Sea', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Mui Ne', N'Mui Ne', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HNT001', N'Apus Hotel', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Nha Trang', N'Nha Trang', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HNT002', N'Asia Paradise Hotel', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Nha Trang', N'Nha Trang', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HNT003', N'Luxury Condo Nha Trang by SEAGROUP', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Nha Trang', N'Nha Trang', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HNT004', N'Pavillon Garden Hotel Nha Trang', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Nha Trang', N'Nha Trang', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HPT001', N'APEC MANDALA WYNDHAM', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Phan Thiet', N'Phan Thiet', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HPT002', N'Can ho Ocean Vista 1br Garden View - SeaHome', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Phan Thiet', N'Phan Thiet', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HPT003', N'Green Organic Villas', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Phan Thiet', N'Phan Thiet', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HPT004', N'QnT Homestay', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Phan Thiet', N'Phan Thiet', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HQNh001', N'Hotel 1', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Quy Nhon', N'Quy Nhon', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HVT001', N'Hotel 1', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Vung Tau', N'Vung Tau', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HVT002', N'Hotel 2', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Vung Tau', N'Vung Tau', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HVT003', N'Hotel 3', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Vung Tau', N'Vung Tau', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HVT004', N'BOBO Boutique Hotel', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Vung Tau', N'Vung Tau', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HVT005', N'Queen Garden Hotel & Apartment', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Vung Tau', N'Vung Tau', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HVT006', N'The Song Premium Apartment', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Vung Tau', N'Vung Tau', N'700,000   ', N'avt.jpg')
INSERT [dbo].[Hotel] ([AccountID], [HotelID], [HotelName], [HotelAddress], [HotelInfo], [Province], [StartPrice], [HotelImage]) VALUES (N'O001', N'HVT007', N'Vung Tau Melody Apartment', N'147-149 Tran Hung Dao, Nai Hien Dong, Son Tra', N'This is Hotel 5 in Vung Tau', N'Vung Tau', N'700,000   ', N'avt.jpg')
GO
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDL004', N'DL4R01', N'Superior Room ', N'Standard Room with ocean view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room7.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDL004', N'DL4R02', N'Superior Queen Room ', N'Deluxe Room with mountain view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room8.jpg', 4)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDL005', N'DL5R01', N'Rooms 1', N'Standard Room with garden view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room9.jpg', 15)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDL005', N'DL5R02', N'Rooms 2', N'Deluxe Room with pool view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room10.jpg', 7)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDL006', N'DL6R01', N'Rooms 1', N'Standard Room with city view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room11.jpg', 11)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDL006', N'DL6R02', N'Rooms 2', N'Deluxe Room with ocean view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room12.jpg', 2)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDL007', N'DL7R01', N'Rooms 1', N'Standard Room with city view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room11.jpg', 11)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDL007', N'DL7R02', N'Rooms 2', N'Deluxe Room with ocean view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room12.jpg', 2)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN001', N'DN1R01', N'Rooms 1', N'Standard Room with city view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room1.jpg', 10)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN001', N'DN1R02', N'Rooms 2', N'Deluxe Room with ocean view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room2.jpg', 5)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN002', N'DN2R01', N'Rooms 1', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room3.jpg', 8)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN002', N'DN2R02', N'Rooms 2', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room4.jpg', 3)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN003', N'DN3R01', N'Rooms 1', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room5.jpg', 12)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN003', N'DN3R02', N'Rooms 2', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room6.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN004', N'DN4R01', N'Superior Double Room', N'Standard Room with ocean view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room7.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN004', N'DN4R02', N'Room with Sea View', N'Deluxe Room with mountain view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room8.jpg', 4)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN005', N'DN5R01', N'Room with Sea View', N'Standard Room with garden view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room9.jpg', 15)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN005', N'DN5R02', N'Double Room', N'Deluxe Room with pool view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room10.jpg', 7)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN006', N'DN6R01', N'Quadruple Room', N'Standard Room with city view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room11.jpg', 11)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN006', N'DN6R02', N'Twin Room with View', N'Deluxe Room with ocean view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room12.jpg', 2)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN007', N'DN7R01', N'Studio Apartment', N'Standard Room with city view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room11.jpg', 11)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HDN007', N'DN7R02', N'Deluxe Family Room ', N'Deluxe Room with ocean view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room12.jpg', 2)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HH001', N'H1R01', N'Room 1', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HH001', N'H1R02', N'Room 2', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HH002', N'H2R01', N'Deluxe Double or Twin Room with Balcony', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room15.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HH002', N'H2R02', N'Deluxe Double or Twin Room with Balcony and View', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room16.jpg', 3)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HH003', N'H3R01', N'Room 1', N'Standard Room with ocean view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room17.jpg', 12)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HH003', N'H3R02', N'Room 2', N'Deluxe Room with mountain view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room18.jpg', 5)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HH004', N'H4R01', N'Standard Double Room', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HH004', N'H4R02', N'Double Room with View', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HH005', N'H5R01', N'Premium Classic City View', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room15.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HH005', N'H5R02', N'Deluxe Double or Twin Room', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room16.jpg', 3)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HH006', N'H6R01', N'Royal Suite', N'Standard Room with ocean view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room17.jpg', 12)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HH006', N'H6R02', N'Superior Double Room', N'Deluxe Room with mountain view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room18.jpg', 5)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHA001', N'HA1R01', N'Family Room', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHA001', N'HA1R02', N'King Room', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHA002', N'HA2R01', N'Single Bed Room', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room15.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHA002', N'HA2R02', N'Double Room', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room16.jpg', 3)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHA003', N'HA3R01', N'Standard Villa', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHA003', N'HA3R02', N'Superior Villa', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHA004', N'HA4R01', N'Superior Twin Room', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room15.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHA004', N'HA4R02', N'Deluxe Double Room', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room16.jpg', 3)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM001', N'HCM1R01', N'Room 1', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM002', N'HCM1R02', N'Room 2', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM001', N'HCM2R01', N'Room 1', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM002', N'HCM2R02', N'Room 2', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM001', N'HCM3R01', N'Room 1', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM002', N'HCM3R02', N'Room 2', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM001', N'HCM4R01', N'One-Bedroom Apartment', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM002', N'HCM4R02', N'Two-Bedroom Apartment', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM001', N'HCM5R01', N'Deluxe Suite', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM002', N'HCM5R02', N'Deluxe Suite 2', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM001', N'HCM6R01', N'Suite with City View', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM002', N'HCM6R02', N'Deluxe King Room', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM001', N'HCM7R01', N'Two-Bedroom Apartment', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHCM002', N'HCM7R02', N'Three-Bedroom Apartment', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHN001', N'HN1R01', N'Junior Suite with Balcony', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHN001', N'HN1R02', N'Superior Double Room', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHN002', N'HN2R01', N'Suite with City View', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHN002', N'HN2R02', N'Deluxe Double or Twin Room with Lake View', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHN003', N'HN3R01', N'Deluxe Double Room with Balcony', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHN003', N'HN3R02', N'Superior Queen Room', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHN004', N'HN4R01', N'Junior Suite', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HHN004', N'HN4R02', N'Premier Twin Room', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HMN001', N'MN1R01', N'Single Bed in Dormitory Room', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HMN001', N'MN1R02', N'Double Room', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HMN002', N'MN2R01', N'Single Room', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room15.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HMN002', N'MN2R02', N'Double Room', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room16.jpg', 3)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HMN003', N'MN3R01', N'Standard Double Room', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HMN003', N'MN3R02', N'Deluxe Triple Room', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HMN004', N'MN4R01', N'Queen Room with Garden View', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room15.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HMN004', N'MN4R02', N'Double Queen Room with Garden View', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room16.jpg', 3)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HNT001', N'NT1R01', N'Senior Double or Twin Room Sea View With Balcony', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HNT001', N'NT1R02', N'Deluxe Double or Twin Room with City View', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HNT002', N'NT2R01', N'Standard Double or Twin Room', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room15.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HNT002', N'NT2R02', N'Superior Double or Twin Room', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room16.jpg', 3)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HNT003', N'NT3R01', N'Studio with Sea View', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HNT003', N'NT3R02', N'Quadruple Room with Sea View', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HNT004', N'NT4R01', N'Apartment with Balcony', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room15.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HNT004', N'NT4R02', N'Deluxe Premier Family City View with 2 Balconies', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room16.jpg', 3)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HPT001', N'PT1R01', N'King Studio with Sofa Bed', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HPT001', N'PT1R02', N'King Studio with Sofa Bed and Sea View', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HPT002', N'PT2R01', N'Single Room', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room15.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HPT002', N'PT2R02', N'Double Room', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room16.jpg', 3)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HPT003', N'PT3R01', N'Villa with Private Pool', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HPT003', N'PT3R02', N'Villa with Private Pool 2', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HPT004', N'PT4R01', N'Room 1', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room15.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HPT004', N'PT4R02', N'Room 2', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room16.jpg', 3)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HQNh001', N'QN1R01', N'Room 1', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT001', N'VT1R01', N'Room 1', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT001', N'VT1R02', N'Room 2', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT002', N'VT2R01', N'Room 1', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room15.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT002', N'VT2R02', N'Room 2', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room16.jpg', 3)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT003', N'VT3R01', N'Room 1', N'Standard Room with ocean view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room17.jpg', 12)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT003', N'VT3R02', N'Room 2', N'Deluxe Room with mountain view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room18.jpg', 5)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT004', N'VT4R01', N'Deluxe Twin with Balcony', N'Standard Room with garden view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room19.jpg', 14)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT004', N'VT4R02', N'Deluxe Triple Room with Balcony', N'Standard Room with mountain view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room13.jpg', 6)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT005', N'VT5R01', N'Superior with Balcony', N'Deluxe Room with garden view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room14.jpg', 1)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT005', N'VT5R02', N'Deluxe Family with Balcony', N'Standard Room with pool view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room15.jpg', 9)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT006', N'VT6R01', N'One-Bedroom Apartment', N'Deluxe Room with city view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room16.jpg', 3)
GO
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT006', N'VT6R02', N'Two-Bedroom Apartment', N'Standard Room with ocean view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room17.jpg', 12)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT007', N'VT7R01', N'One-Bedroom Apartment', N'Deluxe Room with mountain view', N'150.00', N'2', 0x01, 0x01, 0x00, N'room18.jpg', 5)
INSERT [dbo].[Room] ([HotelID], [RoomID], [RoomName], [RoomInfo], [RoomPrice], [BedQuantity], [Wifi], [Window], [Smoking], [RoomImage], [RoomAvailable]) VALUES (N'HVT007', N'VT7R02', N'Two-Bedroom Apartment', N'Standard Room with garden view', N'100.00', N'2', 0x01, 0x01, 0x00, N'room19.jpg', 14)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [username]    Script Date: 6/28/2023 9:13:45 AM ******/
ALTER TABLE [dbo].[Accountss] ADD  CONSTRAINT [username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [HotelID]    Script Date: 6/28/2023 9:13:45 AM ******/
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [HotelID] UNIQUE NONCLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accountss]  WITH CHECK ADD  CONSTRAINT [FK_Accountss_AccountRole] FOREIGN KEY([roleID])
REFERENCES [dbo].[AccountRole] ([roleID])
GO
ALTER TABLE [dbo].[Accountss] CHECK CONSTRAINT [FK_Accountss_AccountRole]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Accountss] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accountss] ([AccountID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Accountss]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Room]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Hotel]
GO
USE [master]
GO
ALTER DATABASE [SWP1] SET  READ_WRITE 
GO


ALTER TABLE Accountss
ALTER COLUMN [name] NVARCHAR(50)

alter table Room
alter column wifi varchar(10)
alter table Room
alter column [Window] varchar(10)
alter table Room
alter column Smoking varchar(10)