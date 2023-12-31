CREATE DATABASE QLNH
GO
USE [QLNH]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 4/12/2023 2:25:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SubTotal] [money] NULL,
	[DiscountPercentage] [int] NULL,
	[Total] [money] NULL,
	[Note] [nvarchar](100) NULL,
	[CheckIn] [datetime] NULL,
	[CheckOut] [datetime] NULL,
	[ReservationId] [bigint] NOT NULL,
	[TableId] [bigint] NOT NULL,
	[PaymentId] [bigint] NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Check] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/12/2023 2:25:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Slug] [varchar](100) NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/12/2023 2:25:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](30) NOT NULL,
	[Message] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 4/12/2023 2:25:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dish](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Slug] [nvarchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[Unit] [nvarchar](20) NOT NULL,
	[Summary] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[Instructions] [nvarchar](1000) NULL,
	[Avatar] [nvarchar](max) NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Dish] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/12/2023 2:25:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Avatar] [nvarchar](max) NULL,
	[PositionId] [bigint] NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 4/12/2023 2:25:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Slug] [varchar](100) NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GalleryImage]    Script Date: 4/12/2023 2:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GalleryImage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
	[GalleryId] [bigint] NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdateBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_GalleryImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 4/12/2023 2:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Slug] [nvarchar](100) NOT NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
	[Unit] [nvarchar](20) NOT NULL,
	[Summary] [nvarchar](50) NULL,
	[Avatar] [nvarchar](max) NULL,
	[CategoryId] [bigint] NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 4/12/2023 2:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Slug] [varchar](100) NOT NULL,
	[Summary] [nvarchar](50) NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Dish]    Script Date: 4/12/2023 2:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Dish](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MenuId] [bigint] NOT NULL,
	[DishId] [bigint] NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Menu_Dish] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/12/2023 2:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BillId] [bigint] NOT NULL,
	[DishId] [bigint] NOT NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Note] [nvarchar](50) NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 4/12/2023 2:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 4/12/2023 2:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 4/12/2023 2:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DishId] [bigint] NOT NULL,
	[IngredientId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Instructions] [nvarchar](1000) NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 4/12/2023 2:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupOf] [int] NOT NULL,
	[BookingDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/12/2023 2:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 4/12/2023 2:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/12/2023 2:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[RegisteredAt] [datetime] NULL,
	[Gender] [bit] NULL,
	[Avatar] [nvarchar](max) NULL,
	[RoleId] [bigint] NOT NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([Id], [SubTotal], [DiscountPercentage], [Total], [Note], [CheckIn], [CheckOut], [ReservationId], [TableId], [PaymentId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (4, 199.9500, 5, 189.9525, N'Thêm ghi chú', CAST(N'2023-04-12T01:21:46.543' AS DateTime), CAST(N'2023-04-12T02:11:04.740' AS DateTime), 5, 1, 1, N'admin', CAST(N'2023-04-12T01:21:47.230' AS DateTime), NULL, CAST(N'2023-04-12T02:11:04.740' AS DateTime), 1, 0)
INSERT [dbo].[Bill] ([Id], [SubTotal], [DiscountPercentage], [Total], [Note], [CheckIn], [CheckOut], [ReservationId], [TableId], [PaymentId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (5, 208.5300, 5, 198.1035, N'Thanh toán thành công', CAST(N'2023-04-12T02:17:55.720' AS DateTime), CAST(N'2023-04-12T02:22:52.093' AS DateTime), 7, 8, 1, N'admin', CAST(N'2023-04-12T02:17:56.030' AS DateTime), NULL, CAST(N'2023-04-12T02:22:52.093' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Slug], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (1, N'Rau củ', N'rau-cu', N'admin', CAST(N'2023-04-08T23:52:35.753' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (2, N'Nguyên liệu', N'nguyen-lieu', N'admin', CAST(N'2023-04-08T23:52:46.173' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (3, N'Hải sản', N'hai-san', N'admin', CAST(N'2023-04-09T01:09:05.683' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (4, N'Gia vị', N'gia-vi', N'admin', CAST(N'2023-04-09T02:03:04.007' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (5, N'Thức uống', N'thuc-uong', N'admin', CAST(N'2023-04-09T16:07:59.407' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (6, N'Cá', N'ca', N'admin', CAST(N'2023-04-10T01:17:49.613' AS DateTime), NULL, CAST(N'2023-04-10T01:17:52.680' AS DateTime), 0, 1)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (7, N'Hoa quả tươi', N'hoa-qua-tuoi', N'admin', CAST(N'2023-04-10T01:18:06.807' AS DateTime), NULL, CAST(N'2023-04-10T01:18:21.013' AS DateTime), 0, 0)
INSERT [dbo].[Category] ([Id], [Name], [Slug], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (8, N'Nước ngoài', N'nuoc-ngoa', N'admin', CAST(N'2023-04-10T01:23:35.213' AS DateTime), NULL, CAST(N'2023-04-10T03:15:04.697' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [Name], [Email], [Phone], [Message], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (1, N'Thành Trần', N't.cngthanh@gmai.com', N'0866036302', N'Cảm ơn vì dịch vụ của nhà hàng', CAST(N'2023-04-04T00:00:00.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Phone], [Message], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (2, N'test', N'hello@gmail.com', N'0123456', N'Thông điệp vũ trụ', CAST(N'2023-04-04T00:00:00.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Phone], [Message], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (3, N'test', N'gmail@123.com', N'0866036302', N'hello', CAST(N'2023-04-04T00:00:00.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Phone], [Message], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (4, N'Thanh Tran', N'123@gmail.com', N'0866036302', N'test', CAST(N'2023-04-04T00:00:00.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Phone], [Message], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (5, N'Test ten Nguoi gui', N'test11@gmail.com', N'0866036302', N'hello', CAST(N'2023-04-04T00:00:00.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Phone], [Message], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (8, N'new Name', N'newtestMail@gmail.com', N'12345768', N'Hello mấy anh !!', CAST(N'2023-04-04T21:47:05.290' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Phone], [Message], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (10, N'Tôi là người mới', N'hungcao1989@gmail.com', N'0612341234', N'Xin chào thế giới', CAST(N'2023-04-06T23:04:14.180' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Contact] ([Id], [Name], [Email], [Phone], [Message], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (12, N'New Contact', N'newmail@gmail.com', N'12345789', N'Thông điệp contact', CAST(N'2023-04-06T23:05:11.813' AS DateTime), NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Dish] ON 

INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (1, N'Salad', N'salad', 29.7900, N'dish', N'Sa lát hoa quả', N'<figure class="image image-style-side"><img src="/Uploads/1001_b59140a3.jpeg"></figure><p>&nbsp;</p><p>Nội dung mới<br>Nội dung mới lần tiếp theo</p><figure class="image image-style-side"><img src="/Uploads/1001_349b50db.jpeg"><figcaption>Thông điệp vũ trụ</figcaption></figure>', NULL, N'/Dish/salad.jpg', N'admin', CAST(N'2023-04-03T16:17:23.443' AS DateTime), NULL, CAST(N'2023-04-11T02:37:29.457' AS DateTime), 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (2, N'Bánh mì nướng bơ', N'banh-mi-nuong-bo', 45.0900, N'dish', N'Bánh mì nướng bơ', NULL, N'Có bao gồm tỏi trong sốt', N'/Dish/banhmi.jpg', N'admin', CAST(N'2023-04-03T16:17:23.000' AS DateTime), NULL, CAST(N'2023-04-11T02:55:33.780' AS DateTime), 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (4, N'Tôm hấp nước dừa', N'tom-hap-nuoc-dua', 12.7500, N'dish', N'Tôm hấp nước dừa thơm ngon', NULL, NULL, N'/Dish/tom.png', N'admin', CAST(N'2023-04-03T16:18:00.000' AS DateTime), NULL, CAST(N'2023-04-11T02:54:44.173' AS DateTime), 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (5, N'BeefSteak', N'beef-steak', 29.7900, N'dish', N'BeefSteak và sốt ăn kèm', NULL, NULL, N'/Dish/beefsteak.jpg', N'admin', CAST(N'2023-04-03T16:18:54.057' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (6, N'Bò hầm khoai tây', N'bo-ham-khoai-tay', 45.0900, N'dish', N'Bò hầm và rau củ ăn kèm', NULL, NULL, N'/Dish/boham.jpg', N'admin', CAST(N'2023-04-03T16:20:15.900' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (7, N'Rượu sâm-panh', N'ruou-sam-panh', 12.7500, N'bottle', N'Rượu sâm panh phục vụ trong ly cao cấp', NULL, NULL, N'/Dish/sampanh.jpg', N'admin', CAST(N'2023-04-03T16:20:53.483' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (8, N'Bò xào đậu que', N'bo-xao-dau-que', 29.7900, N'dish', N'Bò xào đậu que (đậu cove) giòn ngon', NULL, NULL, N'/Dish/boxao.jpg', N'admin', CAST(N'2023-04-03T17:10:14.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (9, N'Bánh bao', N'banh-bao', 15.7900, N'dish', N'Bánh bao chay', NULL, NULL, N'/Dish/banhbao.jpg', N'admin', CAST(N'2023-04-03T17:11:08.503' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (10, N'Hoa quả', N'hoa-qua', 45.0900, N'dish', N'Hoa quả các loại', NULL, NULL, N'/Dish/hoaqua.jpg', N'admin', CAST(N'2023-04-03T17:11:48.067' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (11, N'Cá hồi sốt bơ tỏi', N'ca-hoi-sot-bo-toi', 45.0900, N'dish', N'Cá hồi với nhiều hành và sốt', NULL, NULL, N'/Dish/cahoi.jpg', N'admin', CAST(N'2023-04-03T17:12:44.890' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (12, N'Đậu phụ sốt thịt băm', N'dau-hu-sot-thi-bam', 12.7500, N'dish', N'Đậu phụ sốt thịt băm có vị ngon ngọt', NULL, NULL, N'/Dish/dauhu.jpg', N'admin', CAST(N'2023-04-03T17:13:10.240' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (13, N'Rượu vang', N'ruou-vang', 12.7500, N'bottle', N'Rượu vang chất lượng cao', NULL, NULL, N'/Dish/ruouvang.jpg', N'admin', CAST(N'2023-04-03T17:13:31.080' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (15, N'Cô ca cô la', N'cocacola', 2.0000, N'can', N'Nước cô ca dạng lon', NULL, NULL, N'/Dish/coca.jpg', N'admin', CAST(N'2023-04-03T17:52:44.897' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (16, N'Pepsi', N'pepsi', 2.0000, N'can', N'Nước pepsi dạng lon', NULL, NULL, N'/Dish/pepsi.jpg', N'admin', CAST(N'2023-04-03T17:55:08.237' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (19, N'Lavie', N'lavie', 1.0000, N'bottle', N'Chai nước Lavie 500ml', NULL, NULL, N'/Dish/lavie.jpg', N'admin', CAST(N'2023-04-03T17:55:46.920' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (21, N'7up', N'7up', 2.0000, N'can', N'Nước seven up dạng lon', NULL, NULL, N'/Dish/up.jpeg', N'admin', CAST(N'2023-04-03T17:57:13.030' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (22, N'Chè vải hạt sen', N'che-vai-hat-sen', 10.2000, N'bát', N'Hạt sen giòn giòn, vải ngọt thanh, thơm ngon', NULL, NULL, N'/Dish/chevai.jpg', N'admin', CAST(N'2023-04-10T20:35:18.040' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (24, N'Bánh đậu xanh trái cây', N'banh-dau-xanh', 9.6500, N'đĩa', N'Những loại hình trái cây và rau củ bắt mắt', NULL, NULL, N'/Dish/dauxanh.jpg', N'admin', CAST(N'2023-04-10T20:37:20.293' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (25, N'Chè dừa dầm', N'che-dua-dam', 9.6500, N'bát', N'Chè có vị ngọt thanh, béo béo', NULL, NULL, N'/Dish/duadam.jpg', N'admin', CAST(N'2023-04-10T20:43:58.583' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (26, N'Bánh mochi', N'banh-mochi', 9.1500, N'cái', N'Món ăn ở đất nước mặt trời mọc Nhật Bản', NULL, NULL, N'/Dish/mochi.png', N'admin', CAST(N'2023-04-10T20:45:30.957' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (27, N'Kem', N'kem', 6.6500, N'cái', N'Kem tươi, ăn kèm với ốc quế hoặc là kem ký.', NULL, NULL, N'/Dish/kem.jpg', N'admin', CAST(N'2023-04-10T20:46:23.573' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Dish] ([Id], [Name], [Slug], [Price], [Unit], [Summary], [Content], [Instructions], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (28, N'Bánh tart', N'banh-tart', 7.0000, N'cái', N'Món tráng miệng nổi tiếng nước Pháp', NULL, NULL, N'/Dish/tart.jpg', N'admin', CAST(N'2023-04-10T20:47:34.060' AS DateTime), NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Dish] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Description], [Avatar], [PositionId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (1, N'Peter', N'Hart', N'Donec porta eleifend mauris ut effici-tur. Quisque non velit vestibulum, lob-ortis mi eget, rhoncus nunc', N'/Client/images/avatar-02.jpg', 1, N'admin', CAST(N'2023-04-04T21:51:50.840' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Description], [Avatar], [PositionId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (2, N'Joyce', N'Bowman', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ultricies felis a sem tempus tempus.', N'/Client/images/avatar-03.jpg', 1, N'admin', CAST(N'2023-04-04T21:54:02.660' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Description], [Avatar], [PositionId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (3, N'James', N'Holland', N'Phasellus aliquam libero a nisi varius, vitae placerat sem aliquet. Ut at velit nec ipsum iaculis posuere quis in sapien', N'/Client/images/avatar-05.jpg', 1, N'admin', CAST(N'2023-04-04T21:54:15.443' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Description], [Avatar], [PositionId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (13, N'1234', N'Tran', N'Nhân viên đẳng cấp vũ trụ', N'/Employee/710b692f-86f9-4d44-9ad1-2fb4f3a4b76a.jpeg', 1, N'admin', CAST(N'2023-04-08T05:58:49.000' AS DateTime), NULL, CAST(N'2023-04-08T06:40:47.330' AS DateTime), 0, 1)
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Description], [Avatar], [PositionId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (14, N'Thanh', N'Trấn', N'Mới có mô tả', N'/Employee/6e7ce96a-fb6d-4028-bbe1-8969d02f9480.jpeg', 2, N'admin', CAST(N'2023-04-08T15:56:56.730' AS DateTime), NULL, CAST(N'2023-04-08T15:57:01.687' AS DateTime), 0, 1)
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Description], [Avatar], [PositionId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (15, N'Nhân viên mới', N'Không có', N'Mô tả cho nhân viên đỉnh cao', N'/Employee/99f21598-7aa7-40a7-ad64-204e46744c99.jpeg', 1, N'admin', CAST(N'2023-04-10T01:58:47.097' AS DateTime), NULL, CAST(N'2023-04-10T22:03:55.223' AS DateTime), 0, 1)
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Description], [Avatar], [PositionId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (16, N'Thanh', N'Tran', N'Không có', NULL, 1, N'admin', CAST(N'2023-04-11T03:04:57.610' AS DateTime), NULL, CAST(N'2023-04-11T03:05:01.303' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([Id], [Name], [Slug], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (1, N'Interior', N'interior', NULL, CAST(N'2023-04-08T12:42:06.177' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Gallery] ([Id], [Name], [Slug], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (3, N'Food', N'food', N'admin', CAST(N'2023-04-08T12:42:24.683' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Gallery] ([Id], [Name], [Slug], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (4, N'Events', N'events', N'admin', CAST(N'2023-04-08T12:42:31.620' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Gallery] ([Id], [Name], [Slug], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (5, N'Vip Guests', N'vip-guests', N'admin', CAST(N'2023-04-08T12:42:41.690' AS DateTime), NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Gallery] OFF
GO
SET IDENTITY_INSERT [dbo].[GalleryImage] ON 

INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (1, N'photo-gallery-01.jpg', N'/GalleryImage/photo-gallery-01.jpg', 3, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (2, N'photo-gallery-02.jpg', N'/GalleryImage/photo-gallery-02.jpg', 3, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (3, N'photo-gallery-03.jpg', N'/GalleryImage/photo-gallery-03.jpg', 3, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (4, N'photo-gallery-04.jpg', N'/GalleryImage/photo-gallery-04.jpg', 3, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (5, N'photo-gallery-05.jpg', N'/GalleryImage/photo-gallery-05.jpg', 3, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (6, N'photo-gallery-06.jpg', N'/GalleryImage/photo-gallery-06.jpg', 4, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (7, N'photo-gallery-07.jpg', N'/GalleryImage/photo-gallery-07.jpg', 1, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (8, N'photo-gallery-08.jpg', N'/GalleryImage/photo-gallery-08.jpg', 3, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (9, N'photo-gallery-09.jpg', N'/GalleryImage/photo-gallery-09.jpg', 1, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (10, N'photo-gallery-10.jpg', N'/GalleryImage/photo-gallery-10.jpg', 3, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (11, N'photo-gallery-11.jpg', N'/GalleryImage/photo-gallery-11.jpg', 3, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (12, N'photo-gallery-12.jpg', N'/GalleryImage/photo-gallery-12.jpg', 5, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (13, N'photo-gallery-13.jpg', N'/GalleryImage/photo-gallery-13.jpg', 5, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (14, N'photo-gallery-14.jpg', N'/GalleryImage/photo-gallery-14.jpg', 3, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (15, N'photo-gallery-15.jpg', N'/GalleryImage/photo-gallery-15.jpg', 4, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (16, N'photo-gallery-16.jpg', N'/GalleryImage/photo-gallery-16.jpg', 3, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (17, N'photo-gallery-17.jpg', N'/GalleryImage/photo-gallery-17.jpg', 3, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (18, N'photo-gallery-18.jpg', N'/GalleryImage/photo-gallery-18.jpg', 5, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (19, N'photo-gallery-19.jpg', N'/GalleryImage/photo-gallery-19.jpg', 1, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (20, N'photo-gallery-20.jpg', N'/GalleryImage/photo-gallery-20.jpg', 1, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (21, N'photo-gallery-21.jpg', N'/GalleryImage/photo-gallery-21.jpg', 4, N'admin', CAST(N'2023-04-08T23:06:51.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (24, N'1003.jpeg', N'/GalleryImage/d7dc4bbe-1d25-4983-8939-50406406dba9.jpeg', 4, N'admin', CAST(N'2023-04-09T01:17:01.090' AS DateTime), NULL, CAST(N'2023-04-10T22:36:04.943' AS DateTime), 0, 1)
INSERT [dbo].[GalleryImage] ([Id], [Name], [Path], [GalleryId], [CreatedBy], [CreatedAt], [UpdateBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (25, N'1004.jpeg', N'/GalleryImage/775729a1-8a45-43b3-b473-3c4d1b755d82.jpeg', 4, N'admin', CAST(N'2023-04-09T14:27:20.617' AS DateTime), NULL, CAST(N'2023-04-09T14:27:47.360' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[GalleryImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingredient] ON 

INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (29, N'Cà rốt', N'ca-rot', 0.5000, 2000, N'gam', NULL, N'/Ingredient/carot.jpeg', 1, N'admin', CAST(N'2023-04-09T00:48:17.717' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (30, N'Cà chua', N'ca-chua', 0.6500, 983, N'gam', NULL, N'/Ingredient/cachua.jpg', 1, N'admin', CAST(N'2023-04-09T00:48:50.627' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (31, N'Cá viên', N'ca-vien', 1.5000, 1500, N'gam', NULL, N'/Ingredient/cavien.jpeg', 2, N'admin', CAST(N'2023-04-09T00:49:30.957' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (35, N'Đậu hũ', N'dau-hu', 0.2500, 2500, N'miếng', NULL, N'/Ingredient/dauhu.jpg', 2, N'admin', CAST(N'2023-04-09T00:51:17.573' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (36, N'Đậu que', N'dau-que', 0.8500, 2000, N'gam', NULL, N'/Ingredient/dauque.jpg', 1, N'admin', CAST(N'2023-04-09T00:51:47.047' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (37, N'Dưa leo', N'dua-leo', 1.5500, 1983, N'kilogam', NULL, N'/Ingredient/dualeo.jpg', 1, N'admin', CAST(N'2023-04-09T00:52:39.603' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (38, N'Gà', N'ga', 7.5000, 2200, N'kilogam', NULL, N'/Ingredient/ga.jpg', 2, N'admin', CAST(N'2023-04-09T00:53:16.940' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (39, N'Gạo', N'gao', 3.5000, 2800, N'kilogam', NULL, N'/Ingredient/gao.jpg', 2, N'admin', CAST(N'2023-04-09T00:53:57.967' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (40, N'Hủ tiếu', N'hu-tieu', 4.5000, 2000, N'kilogam', NULL, N'/Ingredient/hutieu.jpg', 2, N'admin', CAST(N'2023-04-09T00:54:23.460' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (41, N'Hành tây', N'hanh-tay', 1.1500, 2000, N'gam', NULL, N'/Ingredient/hanhtay.jpg', 1, N'admin', CAST(N'2023-04-09T00:54:43.973' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (42, N'Cá thu', N'ca-thu', 8.5000, 1800, N'kilogam', NULL, N'/Ingredient/cathu.jpg', 3, N'admin', CAST(N'2023-04-09T00:55:20.383' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (43, N'Cá hồi', N'ca-hoi', 8.5000, 2000, N'kilogam', NULL, N'/Ingredient/cahoi.jpg', 3, N'admin', CAST(N'2023-04-09T00:56:36.757' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (44, N'Giá đỗ', N'gia-do', 1.0000, 2000, N'gam', NULL, N'/Ingredient/giado.jpg', 1, N'admin', CAST(N'2023-04-09T00:57:00.960' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (45, N'Tôm', N'tom', 5.5000, 1996, N'kilogam', NULL, N'/Ingredient/tom.jpg', 3, N'admin', CAST(N'2023-04-09T00:57:19.677' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (46, N'Mực', N'muc', 8.6500, 1800, N'kilogam', NULL, N'/Ingredient/muc.jpg', 3, N'admin', CAST(N'2023-04-09T00:57:55.550' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (47, N'Sứa', N'sua', 8.7000, 1800, N'kilogam', NULL, N'/Ingredient/sua.jpg', 3, N'admin', CAST(N'2023-04-09T00:58:16.800' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (48, N'Trứng', N'trung', 2.5000, 2000, N'quả', NULL, N'/Ingredient/trung.jpg', 2, N'admin', CAST(N'2023-04-09T00:58:37.120' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (50, N'Thịt heo', N'thit-heo', 4.5000, 2000, N'kilogam', NULL, N'/Ingredient/thit.jpg', 2, N'admin', CAST(N'2023-04-09T01:27:26.797' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (51, N'Mộc nhĩ', N'moc-nhi', 1.5000, 2000, N'gam', NULL, N'/Ingredient/mocnhi.jpg', 2, N'admin', CAST(N'2023-04-09T01:28:01.223' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (52, N'Miến', N'mien', 2.5000, 2000, N'kilogam', NULL, N'/Ingredient/mien.jpg', 2, N'admin', CAST(N'2023-04-09T01:28:34.003' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (53, N'Muối', N'muoi', 1.0000, 1920, N'gam', NULL, N'/Ingredient/muoi.jpg', 4, N'admin', CAST(N'2023-04-09T02:03:10.200' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (55, N'Đường', N'duong', 1.0000, 1906, N'gam', NULL, N'/Ingredient/duong.jpg', 4, N'admin', CAST(N'2023-04-09T02:03:50.893' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (56, N'Tiêu', N'tieu', 1.0500, 2000, N'gam', NULL, N'/Ingredient/tieu.jpg', 4, N'admin', CAST(N'2023-04-09T02:04:26.053' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (58, N'Thịt bò', N'thit-bo', 8.0500, 2000, N'kilogam', NULL, N'/Ingredient/thitbo.jpg', 2, N'admin', CAST(N'2023-04-09T02:07:44.310' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (59, N'Bơ', N'bo', 3.5000, 1850, N'gam', NULL, N'/Ingredient/bo.jpg', 4, N'admin', CAST(N'2023-04-09T02:21:07.320' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (61, N'Nước dừa', N'nuoc-dua', 2.5000, 992, N'lít', NULL, N'/Ingredient/nuocdua.jpg', 2, N'admin', CAST(N'2023-04-09T02:26:24.160' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (62, N'Bột mì', N'bot-mi', 3.5000, 1500, N'gam', NULL, N'/Ingredient/botmi.jpg', 2, N'admin', CAST(N'2023-04-09T02:33:36.137' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (63, N'Men nở', N'men-no', 3.5000, 1500, N'gam', NULL, N'/Ingredient/menno.jpg', 2, N'admin', CAST(N'2023-04-09T02:35:31.050' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (64, N'Khoai tây', N'khoai-tay', 4.2500, 2000, N'gam', NULL, N'/Ingredient/khoaitay.jpg', 1, N'admin', CAST(N'2023-04-09T15:39:31.440' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (65, N'Hành lá', N'hanh-la', 1.0500, 1500, N'gam', NULL, N'/Ingredient/hanhla.jpg', 2, N'admin', CAST(N'2023-04-09T15:57:25.713' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (67, N'Rượu sâm-panh', N'ruou-sam-panh', 9.2500, 1000, N'lít', NULL, N'/Ingredient/sampanh.jpg', 5, N'admin', CAST(N'2023-04-09T16:06:27.607' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (68, N'Rượu vang', N'ruou-vang', 9.2500, 1000, N'lít', NULL, N'/Ingredient/ruouvang.jpg', 5, N'admin', CAST(N'2023-04-09T16:08:06.047' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (69, N'Pép si', N'pepsi', 5.2800, 1000, N'lít', NULL, N'/Ingredient/pepsi.jpg', 5, N'admin', CAST(N'2023-04-09T16:08:56.700' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (70, N'Cô ca cô la', N'co-ca-co-la', 5.0500, 1000, N'lít', NULL, N'/Ingredient/coca.jpg', 5, N'admin', CAST(N'2023-04-09T16:09:24.717' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (74, N'Nho', N'nho', 8.6800, 1000, N'kilogam', NULL, N'/Ingredient/nho.jpg', 1, N'admin', CAST(N'2023-04-09T16:11:03.897' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (75, N'Giấm', N'giam', 3.0200, 983, N'lít', NULL, N'/Ingredient/giam.jpg', 4, N'admin', CAST(N'2023-04-09T16:24:20.957' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (76, N'Ớt', N'ot', 4.6800, 983, N'quả', NULL, N'/Ingredient/ot.jpg', 1, N'admin', CAST(N'2023-04-09T16:26:27.400' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (77, N'Bánh mì', N'banh-mi', 5.6500, 1994, N'cái', NULL, N'/Ingredient/banhmi.jpg', 2, N'admin', CAST(N'2023-04-09T16:29:19.400' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (78, N'Lavie', N'lavie', 5.0000, 1000, N'lít', NULL, N'/Ingredient/lavie.jpg', 5, N'admin', CAST(N'2023-04-09T16:50:54.070' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (79, N'7up', N'7up', 4.6800, 1000, N'lít', NULL, N'/Ingredient/up.jpeg', 5, N'admin', CAST(N'2023-04-09T16:52:41.407' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (80, N'Hoa quả', N'hoa-qua', 8.8900, 100, N'đĩa', NULL, N'/Ingredient/hoaqua.jpg', 2, N'admin', CAST(N'2023-04-09T17:30:59.717' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (81, N'Vải', N'vai', 7.8600, 1000, N'kilogam', NULL, N'/Ingredient/vai.jpg', 6, N'admin', CAST(N'2023-04-10T20:32:31.260' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (82, N'Hạt sen', N'hat-sen', 8.9500, 1000, N'kilogam', NULL, N'/Ingredient/hatsen.jpg', 6, N'admin', CAST(N'2023-04-10T20:37:31.960' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (84, N'Bánh đậu xanh trái cây', N'dau-xanh-trai-cay', 8.1500, 1000, N'túi', NULL, N'/Ingredient/dauxanh.jpg', 8, N'admin', CAST(N'2023-04-10T20:39:07.453' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (85, N'Chè dừa dầm', N'che-dua-dam', 7.8600, 1000, N'túi', NULL, N'/Ingredient/duadam.jpg', 8, N'admin', CAST(N'2023-04-10T20:40:08.490' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (86, N'Bánh mochi', N'banh-mochi', 9.1500, 1000, N'túi', NULL, N'/Ingredient/mochi.png', 8, N'admin', CAST(N'2023-04-10T20:41:13.440' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (87, N'Kem', N'kem', 6.6500, 2000, N'cái', NULL, N'/Ingredient/kem.jpg', 8, N'admin', CAST(N'2023-04-10T20:41:44.800' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Ingredient] ([Id], [Name], [Slug], [Price], [Quantity], [Unit], [Summary], [Avatar], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (88, N'Bánh tart', N'banh-tart', 7.0000, 2000, N'cái', NULL, N'/Ingredient/tart.jpg', 8, N'admin', CAST(N'2023-04-10T20:50:57.987' AS DateTime), NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Ingredient] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [Name], [Slug], [Summary], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (1, N'Starters', N'starters', N'Món khai vị', N'admin', CAST(N'2023-04-03T14:35:10.537' AS DateTime), NULL, CAST(N'2023-04-10T15:33:24.550' AS DateTime), 0, 0)
INSERT [dbo].[Menu] ([Id], [Name], [Slug], [Summary], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (4, N'Main', N'main', N'Món chính', N'admin', CAST(N'2023-04-03T14:35:33.277' AS DateTime), NULL, CAST(N'2023-04-10T15:33:30.320' AS DateTime), 0, 0)
INSERT [dbo].[Menu] ([Id], [Name], [Slug], [Summary], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (5, N'Drinks', N'drinks', N'Nước uống', N'admin', CAST(N'2023-04-03T14:36:52.497' AS DateTime), NULL, CAST(N'2023-04-10T15:33:05.563' AS DateTime), 0, 0)
INSERT [dbo].[Menu] ([Id], [Name], [Slug], [Summary], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (6, N'Dessert', N'dessert', N'Món tráng miệng', N'admin', CAST(N'2023-04-03T14:37:11.450' AS DateTime), NULL, CAST(N'2023-04-10T15:33:13.433' AS DateTime), 0, 0)
INSERT [dbo].[Menu] ([Id], [Name], [Slug], [Summary], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (7, N'Lunch', N'lunch', N'Thực đơn buổi trưa', N'admin', CAST(N'2023-04-03T14:37:21.357' AS DateTime), NULL, CAST(N'2023-04-10T15:33:38.413' AS DateTime), 0, 0)
INSERT [dbo].[Menu] ([Id], [Name], [Slug], [Summary], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (8, N'Dinner', N'dinner', N'Thực đơn buổi tối', N'admin', CAST(N'2023-04-03T14:37:31.483' AS DateTime), NULL, CAST(N'2023-04-10T15:33:46.230' AS DateTime), 0, 0)
INSERT [dbo].[Menu] ([Id], [Name], [Slug], [Summary], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (9, N'Đồ Hàn', N'do-han', NULL, N'admin', CAST(N'2023-04-10T15:33:57.143' AS DateTime), NULL, CAST(N'2023-04-10T15:33:59.433' AS DateTime), 0, 1)
INSERT [dbo].[Menu] ([Id], [Name], [Slug], [Summary], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (10, N'New Menu', N'new-menu', N'Menu moiws', N'admin', CAST(N'2023-04-10T19:16:29.280' AS DateTime), NULL, CAST(N'2023-04-10T21:40:15.010' AS DateTime), 0, 1)
INSERT [dbo].[Menu] ([Id], [Name], [Slug], [Summary], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (11, N'Newest', N'newest', NULL, N'admin', CAST(N'2023-04-10T21:42:44.183' AS DateTime), NULL, CAST(N'2023-04-10T21:42:58.193' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu_Dish] ON 

INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (1, 7, 1, N'admin', CAST(N'2023-04-03T16:21:48.770' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (2, 7, 2, N'admin', CAST(N'2023-04-03T16:21:52.500' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (4, 7, 4, N'admin', CAST(N'2023-04-03T16:22:10.533' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (5, 7, 5, N'admin', CAST(N'2023-04-03T16:22:16.460' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (6, 7, 6, N'admin', CAST(N'2023-04-03T16:22:21.067' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (7, 7, 7, N'admin', CAST(N'2023-04-03T16:22:28.020' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (8, 8, 8, N'admin', CAST(N'2023-04-03T17:14:59.603' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (9, 8, 9, N'admin', CAST(N'2023-04-03T17:15:06.527' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (10, 8, 10, N'admin', CAST(N'2023-04-03T17:15:09.507' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (11, 8, 11, N'admin', CAST(N'2023-04-03T17:15:15.793' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (12, 8, 12, N'admin', CAST(N'2023-04-03T17:15:46.583' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (13, 8, 13, N'admin', CAST(N'2023-04-03T17:15:49.587' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (14, 5, 7, N'admin', CAST(N'2023-04-03T17:58:11.450' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (15, 5, 13, N'admin', CAST(N'2023-04-03T17:58:54.650' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (16, 5, 16, N'admin', CAST(N'2023-04-03T17:59:01.983' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (17, 5, 19, N'admin', CAST(N'2023-04-03T17:59:06.020' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (18, 5, 21, N'admin', CAST(N'2023-04-03T17:59:10.270' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (19, 5, 15, N'admin', CAST(N'2023-04-03T17:59:24.513' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (20, 1, 1, N'admin', CAST(N'2023-04-03T18:19:38.493' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (21, 1, 2, N'admin', CAST(N'2023-04-03T18:20:29.663' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (22, 1, 9, N'admin', CAST(N'2023-04-03T18:20:41.180' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (23, 1, 4, N'admin', CAST(N'2023-04-03T18:21:18.333' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (24, 6, 10, N'admin', CAST(N'2023-04-03T18:22:11.383' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (25, 6, 12, N'admin', CAST(N'2023-04-03T18:23:04.233' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (26, 4, 5, N'admin', CAST(N'2023-04-03T18:23:49.853' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (28, 4, 6, N'admin', CAST(N'2023-04-03T18:24:04.227' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (29, 4, 8, N'admin', CAST(N'2023-04-03T18:24:31.130' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Menu_Dish] ([Id], [MenuId], [DishId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (30, 4, 11, N'admin', CAST(N'2023-04-03T18:24:54.153' AS DateTime), NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Menu_Dish] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [BillId], [DishId], [Price], [Quantity], [Note], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (4, 4, 1, 29.7900, 5, NULL, N'admin', CAST(N'2023-04-12T01:22:16.950' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Order] ([Id], [BillId], [DishId], [Price], [Quantity], [Note], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (5, 4, 4, 12.7500, 3, NULL, N'admin', CAST(N'2023-04-12T01:29:16.187' AS DateTime), NULL, CAST(N'2023-04-12T01:34:16.907' AS DateTime), 0, 1)
INSERT [dbo].[Order] ([Id], [BillId], [DishId], [Price], [Quantity], [Note], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (6, 4, 4, 12.7500, 4, NULL, N'admin', CAST(N'2023-04-12T01:34:49.093' AS DateTime), NULL, CAST(N'2023-04-12T01:35:09.460' AS DateTime), 0, 1)
INSERT [dbo].[Order] ([Id], [BillId], [DishId], [Price], [Quantity], [Note], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (7, 4, 4, 12.7500, 4, NULL, N'admin', CAST(N'2023-04-12T01:35:28.697' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Order] ([Id], [BillId], [DishId], [Price], [Quantity], [Note], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (8, 5, 1, 29.7900, 7, N'5', N'admin', CAST(N'2023-04-12T02:18:12.987' AS DateTime), NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([Id], [PaymentType]) VALUES (1, N'Cash')
INSERT [dbo].[Payment] ([Id], [PaymentType]) VALUES (2, N'Card')
INSERT [dbo].[Payment] ([Id], [PaymentType]) VALUES (3, N'Banking')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([Id], [Name], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (1, N'Chef', N'admin', CAST(N'2023-04-04T21:49:49.160' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Position] ([Id], [Name], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (2, N'Waiter', N'admin', CAST(N'2023-04-04T21:49:49.160' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Position] ([Id], [Name], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (3, N'CEO', N'admin', CAST(N'2023-04-04T21:49:49.160' AS DateTime), NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipe] ON 

INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (2, 1, 30, 1, N'Thêm cà chua', N'admin', CAST(N'2023-04-09T16:21:45.980' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (3, 1, 37, 1, N'Thêm dưa leo', N'admin', CAST(N'2023-04-09T16:22:23.783' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (4, 1, 55, 2, N'Thêm đường', N'admin', CAST(N'2023-04-09T16:23:02.317' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (5, 1, 75, 1, N'Thêm giấm', N'admin', CAST(N'2023-04-09T16:26:57.010' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (6, 1, 76, 1, N'Thêm ớt', N'admin', CAST(N'2023-04-09T16:27:13.507' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (7, 2, 77, 2, NULL, N'admin', CAST(N'2023-04-09T16:29:40.400' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (9, 2, 59, 50, NULL, N'admin', CAST(N'2023-04-09T16:30:12.853' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (10, 2, 55, 20, NULL, N'admin', CAST(N'2023-04-09T16:32:36.213' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (11, 4, 45, 1, NULL, N'admin', CAST(N'2023-04-09T16:32:59.123' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (12, 4, 61, 2, NULL, N'admin', CAST(N'2023-04-09T16:33:14.040' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (13, 4, 53, 20, NULL, N'admin', CAST(N'2023-04-09T16:33:44.910' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (14, 5, 58, 1, NULL, N'admin', CAST(N'2023-04-09T16:34:18.767' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (15, 5, 59, 50, NULL, N'admin', CAST(N'2023-04-09T16:34:44.327' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (17, 5, 55, 30, NULL, N'admin', CAST(N'2023-04-09T16:34:59.340' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (19, 6, 58, 1, NULL, N'admin', CAST(N'2023-04-09T16:35:34.987' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (20, 6, 64, 1, NULL, N'admin', CAST(N'2023-04-09T16:36:09.353' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (21, 6, 29, 100, NULL, N'admin', CAST(N'2023-04-09T16:37:06.600' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (22, 6, 56, 20, NULL, N'admin', CAST(N'2023-04-09T16:37:45.330' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (23, 6, 53, 30, NULL, N'admin', CAST(N'2023-04-09T16:37:53.873' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (24, 7, 67, 1, NULL, N'admin', CAST(N'2023-04-09T16:38:53.347' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (25, 8, 58, 1, NULL, N'admin', CAST(N'2023-04-09T16:39:13.407' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (26, 8, 36, 100, NULL, N'admin', CAST(N'2023-04-09T16:39:39.083' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (27, 8, 53, 50, NULL, N'admin', CAST(N'2023-04-09T16:41:12.133' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (28, 9, 62, 300, NULL, N'admin', CAST(N'2023-04-09T16:42:09.060' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (29, 9, 63, 12, NULL, N'admin', CAST(N'2023-04-09T16:42:27.273' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (30, 9, 55, 30, NULL, N'admin', CAST(N'2023-04-09T16:42:55.220' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (32, 9, 61, 1, NULL, N'admin', CAST(N'2023-04-09T16:43:06.417' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (34, 11, 58, 1, NULL, N'admin', CAST(N'2023-04-09T16:44:31.920' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (35, 11, 59, 100, NULL, N'admin', CAST(N'2023-04-09T16:44:53.720' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (36, 11, 56, 20, NULL, N'admin', CAST(N'2023-04-09T16:45:17.063' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (37, 11, 53, 30, NULL, N'admin', CAST(N'2023-04-09T16:45:45.127' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (39, 12, 35, 10, NULL, N'admin', CAST(N'2023-04-09T16:46:34.907' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (40, 12, 50, 1, NULL, N'admin', CAST(N'2023-04-09T16:46:50.617' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (41, 12, 65, 50, NULL, N'admin', CAST(N'2023-04-09T16:47:27.317' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (42, 12, 76, 1, NULL, N'admin', CAST(N'2023-04-09T16:47:42.967' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (43, 13, 68, 1, NULL, N'admin', CAST(N'2023-04-09T16:48:58.097' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (44, 15, 70, 1, NULL, N'admin', CAST(N'2023-04-09T16:49:18.403' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (45, 16, 69, 1, NULL, N'admin', CAST(N'2023-04-09T16:49:35.833' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (46, 19, 78, 1, NULL, N'admin', CAST(N'2023-04-09T16:53:03.180' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (47, 21, 79, 1, NULL, N'admin', CAST(N'2023-04-09T16:53:18.347' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (48, 10, 80, 1, NULL, N'admin', CAST(N'2023-04-09T17:31:31.207' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (49, 22, 81, 1, NULL, N'admin', CAST(N'2023-04-10T20:59:07.723' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (52, 22, 82, 1, NULL, N'admin', CAST(N'2023-04-10T20:59:29.597' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (53, 24, 84, 1, NULL, N'admin', CAST(N'2023-04-10T20:59:53.090' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (54, 25, 85, 1, NULL, N'admin', CAST(N'2023-04-10T21:00:10.537' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (55, 26, 86, 1, NULL, N'admin', CAST(N'2023-04-10T21:00:15.670' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (56, 27, 87, 1, NULL, N'admin', CAST(N'2023-04-10T21:00:26.707' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Recipe] ([Id], [DishId], [IngredientId], [Quantity], [Instructions], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (57, 28, 88, 1, NULL, N'admin', CAST(N'2023-04-10T21:02:25.143' AS DateTime), NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Recipe] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([Id], [GroupOf], [BookingDate], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (1, 4, CAST(N'2023-04-13T02:04:00.000' AS DateTime), N'admin', CAST(N'2023-04-09T00:48:17.717' AS DateTime), NULL, CAST(N'2023-04-11T22:58:48.407' AS DateTime), 1, 0)
INSERT [dbo].[Reservation] ([Id], [GroupOf], [BookingDate], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (4, 4, CAST(N'2023-04-05T00:48:17.717' AS DateTime), N'admin', CAST(N'2023-04-11T14:37:54.260' AS DateTime), NULL, CAST(N'2023-04-11T23:00:44.060' AS DateTime), 1, 0)
INSERT [dbo].[Reservation] ([Id], [GroupOf], [BookingDate], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (5, 4, CAST(N'2023-04-11T21:35:00.000' AS DateTime), N'admin', CAST(N'2023-04-11T15:29:49.403' AS DateTime), NULL, CAST(N'2023-04-11T23:01:16.690' AS DateTime), 3, 0)
INSERT [dbo].[Reservation] ([Id], [GroupOf], [BookingDate], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (6, 5, CAST(N'2023-04-14T15:32:00.000' AS DateTime), N'admin', CAST(N'2023-04-11T15:32:26.700' AS DateTime), NULL, CAST(N'2023-04-11T22:51:54.627' AS DateTime), 1, 0)
INSERT [dbo].[Reservation] ([Id], [GroupOf], [BookingDate], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (7, 5, CAST(N'2023-04-04T19:21:00.000' AS DateTime), N'admin', CAST(N'2023-04-12T02:17:39.517' AS DateTime), NULL, CAST(N'2023-04-12T02:17:43.440' AS DateTime), 3, 0)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Client')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Staff')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Table] ON 

INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (1, 1, 4, N'admin', CAST(N'2023-04-11T03:24:51.860' AS DateTime), NULL, CAST(N'2023-04-12T02:12:16.853' AS DateTime), 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (2, 2, 4, N'admin', CAST(N'2023-04-11T03:24:57.467' AS DateTime), NULL, CAST(N'2023-04-11T21:40:43.987' AS DateTime), 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (3, 3, 4, N'admin', CAST(N'2023-04-11T03:25:01.383' AS DateTime), NULL, CAST(N'2023-04-11T21:40:21.997' AS DateTime), 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (5, 4, 6, N'admin', CAST(N'2023-04-11T03:26:12.990' AS DateTime), NULL, CAST(N'2023-04-12T02:12:19.150' AS DateTime), 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (6, 5, 6, N'admin', CAST(N'2023-04-11T03:26:19.440' AS DateTime), NULL, CAST(N'2023-04-11T13:12:49.127' AS DateTime), 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (7, 6, 6, N'admin', CAST(N'2023-04-11T03:26:26.043' AS DateTime), NULL, CAST(N'2023-04-11T13:12:57.450' AS DateTime), 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (8, 7, 8, N'admin', CAST(N'2023-04-11T03:26:30.697' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (9, 9, 8, N'admin', CAST(N'2023-04-11T03:26:42.263' AS DateTime), NULL, CAST(N'2023-04-11T13:13:04.720' AS DateTime), 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (10, 10, 8, N'admin', CAST(N'2023-04-11T03:26:51.387' AS DateTime), NULL, CAST(N'2023-04-11T22:00:56.867' AS DateTime), 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (11, 12, 10, N'admin', CAST(N'2023-04-11T03:27:03.120' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (12, 11, 10, N'admin', CAST(N'2023-04-11T03:28:13.493' AS DateTime), NULL, CAST(N'2023-04-11T13:13:32.970' AS DateTime), 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (13, 13, 10, N'admin', CAST(N'2023-04-11T03:28:21.583' AS DateTime), NULL, CAST(N'2023-04-11T13:13:39.663' AS DateTime), 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (14, 8, 8, N'admin', CAST(N'2023-04-11T13:14:05.957' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Table] ([Id], [Number], [Capacity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Status], [IsDeleted]) VALUES (15, 14, 10, N'admin', CAST(N'2023-04-11T13:14:33.107' AS DateTime), NULL, CAST(N'2023-04-11T20:21:12.587' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[Table] OFF
GO
INSERT [dbo].[User] ([Username], [Password], [FirstName], [LastName], [Email], [Phone], [RegisteredAt], [Gender], [Avatar], [RoleId], [Status], [IsDeleted]) VALUES (N'admin', N'admin', NULL, NULL, N't.cngthanh@gmail.com', N'0866036302', CAST(N'2023-03-31T00:00:00.000' AS DateTime), 1, NULL, 1, 0, 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CategoryName]    Script Date: 4/12/2023 2:25:58 AM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [UQ_CategoryName] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[Slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Contact]    Script Date: 4/12/2023 2:25:58 AM ******/
CREATE NONCLUSTERED INDEX [IDX_Contact] ON [dbo].[Contact]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_DishName]    Script Date: 4/12/2023 2:25:58 AM ******/
ALTER TABLE [dbo].[Dish] ADD  CONSTRAINT [UQ_DishName] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[Slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Gallery]    Script Date: 4/12/2023 2:25:58 AM ******/
CREATE NONCLUSTERED INDEX [UQ_Gallery] ON [dbo].[Gallery]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_IngredientName]    Script Date: 4/12/2023 2:25:58 AM ******/
ALTER TABLE [dbo].[Ingredient] ADD  CONSTRAINT [UQ_IngredientName] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[Slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_MenuName]    Script Date: 4/12/2023 2:25:58 AM ******/
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [UQ_MenuName] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[Slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_PositionName]    Script Date: 4/12/2023 2:25:58 AM ******/
ALTER TABLE [dbo].[Position] ADD  CONSTRAINT [UQ_PositionName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_RoleName]    Script Date: 4/12/2023 2:25:58 AM ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [UQ_RoleName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Table]    Script Date: 4/12/2023 2:25:58 AM ******/
ALTER TABLE [dbo].[Table] ADD  CONSTRAINT [UQ_Table] UNIQUE NONCLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_User]    Script Date: 4/12/2023 2:25:58 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ_User] UNIQUE NONCLUSTERED 
(
	[Username] ASC,
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF__Check__SubTotal__6EF57B66]  DEFAULT ((0)) FOR [SubTotal]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF__Check__DiscountT__6FE99F9F]  DEFAULT ((0)) FOR [DiscountPercentage]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF__Check__Total__70DDC3D8]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_CheckIn]  DEFAULT (getdate()) FOR [CheckIn]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Dish] ADD  CONSTRAINT [DF_Dish_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Dish] ADD  CONSTRAINT [DF_Dish_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Dish] ADD  CONSTRAINT [DF_Dish_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Dish] ADD  CONSTRAINT [DF_Dish_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Gallery] ADD  CONSTRAINT [DF_Gallery_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Gallery] ADD  CONSTRAINT [DF_Gallery_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Gallery] ADD  CONSTRAINT [DF_Gallery_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Gallery] ADD  CONSTRAINT [DF_Gallery_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GalleryImage] ADD  CONSTRAINT [DF_GalleryImage_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[GalleryImage] ADD  CONSTRAINT [DF_GalleryImage_CreatedDate]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[GalleryImage] ADD  CONSTRAINT [DF_GalleryImage_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[GalleryImage] ADD  CONSTRAINT [DF_GalleryImage_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Ingredient] ADD  CONSTRAINT [DF_Ingredient_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Ingredient] ADD  CONSTRAINT [DF__Ingredien__Quant__71D1E811]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Ingredient] ADD  CONSTRAINT [DF_Ingredient_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Ingredient] ADD  CONSTRAINT [DF_Ingredient_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Ingredient] ADD  CONSTRAINT [DF_Ingredient_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Ingredient] ADD  CONSTRAINT [DF_Ingredient_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF__Menu__Summary__72C60C4A]  DEFAULT (NULL) FOR [Summary]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Menu_Dish] ADD  CONSTRAINT [DF_Menu_Dish_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Menu_Dish] ADD  CONSTRAINT [DF_Menu_Dish_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Menu_Dish] ADD  CONSTRAINT [DF_Menu_Dish_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Menu_Dish] ADD  CONSTRAINT [DF_Menu_Dish_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Position] ADD  CONSTRAINT [DF_Position_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Position] ADD  CONSTRAINT [DF_Position_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Position] ADD  CONSTRAINT [DF_Position_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Position] ADD  CONSTRAINT [DF_Position_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Recipe] ADD  CONSTRAINT [DF_Recipe_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Recipe] ADD  CONSTRAINT [DF_Recipe_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Recipe] ADD  CONSTRAINT [DF_Recipe_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Recipe] ADD  CONSTRAINT [DF_Recipe_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [DF_Reservation_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [DF_Reservation_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [DF_Reservation_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [DF_Reservation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Table] ADD  CONSTRAINT [DF_Table_CreatedBy]  DEFAULT ('admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Table] ADD  CONSTRAINT [DF_Table_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Table] ADD  CONSTRAINT [DF_Table_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Table] ADD  CONSTRAINT [DF_Table_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_RegisteredAt]  DEFAULT (getdate()) FOR [RegisteredAt]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Gender__75A278F5]  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Bill] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Payment_Bill]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Bill] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Reservation_Bill]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Table_Bill] FOREIGN KEY([TableId])
REFERENCES [dbo].[Table] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Table_Bill]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Position_Employee] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Position_Employee]
GO
ALTER TABLE [dbo].[GalleryImage]  WITH CHECK ADD  CONSTRAINT [FK_GalleryImage_Gallery] FOREIGN KEY([GalleryId])
REFERENCES [dbo].[Gallery] ([Id])
GO
ALTER TABLE [dbo].[GalleryImage] CHECK CONSTRAINT [FK_GalleryImage_Gallery]
GO
ALTER TABLE [dbo].[Ingredient]  WITH CHECK ADD  CONSTRAINT [FK_Category_Ingredient] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Ingredient] CHECK CONSTRAINT [FK_Category_Ingredient]
GO
ALTER TABLE [dbo].[Menu_Dish]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Dish_Dish] FOREIGN KEY([DishId])
REFERENCES [dbo].[Dish] ([Id])
GO
ALTER TABLE [dbo].[Menu_Dish] CHECK CONSTRAINT [FK_Menu_Dish_Dish]
GO
ALTER TABLE [dbo].[Menu_Dish]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Dish_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[Menu_Dish] CHECK CONSTRAINT [FK_Menu_Dish_Menu]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Bill] FOREIGN KEY([BillId])
REFERENCES [dbo].[Bill] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Bill]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Dish] FOREIGN KEY([DishId])
REFERENCES [dbo].[Dish] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Dish]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Dish_Recipe] FOREIGN KEY([DishId])
REFERENCES [dbo].[Dish] ([Id])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Dish_Recipe]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Ingredient_Recipe] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredient] ([Id])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Ingredient_Recipe]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_Role_User] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_Role_User]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [Check_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [Check_Time_Check]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [Category_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [Category_Time_Check]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [Contact_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [Contact_Time_Check]
GO
ALTER TABLE [dbo].[Dish]  WITH CHECK ADD  CONSTRAINT [Dish_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Dish] CHECK CONSTRAINT [Dish_Time_Check]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [Employee_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [Employee_Time_Check]
GO
ALTER TABLE [dbo].[Gallery]  WITH CHECK ADD  CONSTRAINT [Gallery_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Gallery] CHECK CONSTRAINT [Gallery_Time_Check]
GO
ALTER TABLE [dbo].[GalleryImage]  WITH CHECK ADD  CONSTRAINT [Gallery_Image_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[GalleryImage] CHECK CONSTRAINT [Gallery_Image_Time_Check]
GO
ALTER TABLE [dbo].[Ingredient]  WITH CHECK ADD  CONSTRAINT [Ingredient_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Ingredient] CHECK CONSTRAINT [Ingredient_Time_Check]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [Menu_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [Menu_Time_Check]
GO
ALTER TABLE [dbo].[Menu_Dish]  WITH CHECK ADD  CONSTRAINT [Menu_Dish_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Menu_Dish] CHECK CONSTRAINT [Menu_Dish_Time_Check]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Order_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Order_Time_Check]
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD  CONSTRAINT [Position_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Position] CHECK CONSTRAINT [Position_Time_Check]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [Recipe_NonNegative_Quantity] CHECK  (([Quantity]>=(0)))
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [Recipe_NonNegative_Quantity]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [Recipe_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [Recipe_Time_Check]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [Reservation_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [Reservation_Time_Check]
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [Table_Time_Check] CHECK  (([UpdatedAt]>=[CreatedAt]))
GO
ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [Table_Time_Check]
GO
