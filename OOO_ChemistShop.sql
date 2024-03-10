USE [OOO_DBChemistShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11.03.2024 2:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManufacturerCountry]    Script Date: 11.03.2024 2:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManufacturerCountry](
	[ManufacturerCountryId] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerCountryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ManufacturerCountry] PRIMARY KEY CLUSTERED 
(
	[ManufacturerCountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 11.03.2024 2:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[MedicineManufacturerId] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerCountryId] [int] NOT NULL,
	[ManufacturerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[MedicineManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 11.03.2024 2:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[MedicineId] [int] IDENTITY(1,1) NOT NULL,
	[MedicineManufacturerId] [int] NOT NULL,
	[MedicineName] [nvarchar](100) NOT NULL,
	[MedicineCost] [float] NOT NULL,
	[MedicineDiscount] [float] NOT NULL,
	[MedicineDiscountMax] [float] NOT NULL,
	[MedicineRank] [float] NOT NULL,
	[MedicineCount] [int] NOT NULL,
	[MedicineCategory] [int] NOT NULL,
	[MedicineDateManufacturing] [date] NOT NULL,
	[MedicineExpirationDate] [int] NOT NULL,
	[MedicineDescription] [nvarchar](110) NULL,
	[MedicinePhoto] [nvarchar](100) NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineOrder]    Script Date: 11.03.2024 2:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineOrder](
	[OrderId] [int] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_MedicineOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11.03.2024 2:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [datetime] NOT NULL,
	[DateDelivery] [datetime] NOT NULL,
	[OrderPointId] [int] NOT NULL,
	[OrderClient] [nvarchar](100) NOT NULL,
	[OrderCode] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point]    Script Date: 11.03.2024 2:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point](
	[PointId] [int] IDENTITY(1,1) NOT NULL,
	[PointAddress] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Point] PRIMARY KEY CLUSTERED 
(
	[PointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11.03.2024 2:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11.03.2024 2:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11.03.2024 2:54:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserRoleId] [int] NOT NULL,
	[UserFullName] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Жаропонижающее')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Снотворное')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Антисептик')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Иммуностимулирующее')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (5, N'Антибиотики')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (6, N'Сосудосуживающие')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (7, N'Противокашлевое')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (8, N'Противовосполительное')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[ManufacturerCountry] ON 

INSERT [dbo].[ManufacturerCountry] ([ManufacturerCountryId], [ManufacturerCountryName]) VALUES (1, N'Германия')
INSERT [dbo].[ManufacturerCountry] ([ManufacturerCountryId], [ManufacturerCountryName]) VALUES (2, N'Россия')
INSERT [dbo].[ManufacturerCountry] ([ManufacturerCountryId], [ManufacturerCountryName]) VALUES (3, N'США')
INSERT [dbo].[ManufacturerCountry] ([ManufacturerCountryId], [ManufacturerCountryName]) VALUES (4, N'Япония')
INSERT [dbo].[ManufacturerCountry] ([ManufacturerCountryId], [ManufacturerCountryName]) VALUES (5, N'Китай')
SET IDENTITY_INSERT [dbo].[ManufacturerCountry] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 

INSERT [dbo].[Manufacturers] ([MedicineManufacturerId], [ManufacturerCountryId], [ManufacturerName]) VALUES (1, 1, N'Bionorica')
INSERT [dbo].[Manufacturers] ([MedicineManufacturerId], [ManufacturerCountryId], [ManufacturerName]) VALUES (2, 3, N'Reckitt Benckiser Healthcare International Ltd')
INSERT [dbo].[Manufacturers] ([MedicineManufacturerId], [ManufacturerCountryId], [ManufacturerName]) VALUES (3, 1, N'Материа Медика Холдинг')
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicine] ON 

INSERT [dbo].[Medicine] ([MedicineId], [MedicineManufacturerId], [MedicineName], [MedicineCost], [MedicineDiscount], [MedicineDiscountMax], [MedicineRank], [MedicineCount], [MedicineCategory], [MedicineDateManufacturing], [MedicineExpirationDate], [MedicineDescription], [MedicinePhoto]) VALUES (1, 1, N'Синупрет', 500, 5, 13, 4.8, 50, 8, CAST(N'2023-06-13' AS Date), 12, NULL, N'Синупрет.jpg')
INSERT [dbo].[Medicine] ([MedicineId], [MedicineManufacturerId], [MedicineName], [MedicineCost], [MedicineDiscount], [MedicineDiscountMax], [MedicineRank], [MedicineCount], [MedicineCategory], [MedicineDateManufacturing], [MedicineExpirationDate], [MedicineDescription], [MedicinePhoto]) VALUES (2, 2, N'Нурофен', 300, 10, 6, 4, 40, 1, CAST(N'2023-06-14' AS Date), 36, N'', N'Нурофен.jpg')
INSERT [dbo].[Medicine] ([MedicineId], [MedicineManufacturerId], [MedicineName], [MedicineCost], [MedicineDiscount], [MedicineDiscountMax], [MedicineRank], [MedicineCount], [MedicineCategory], [MedicineDateManufacturing], [MedicineExpirationDate], [MedicineDescription], [MedicinePhoto]) VALUES (3, 1, N'Анаферон', 213, 11, 3, 3, 100, 1, CAST(N'2023-12-01' AS Date), 12, N'Для профилактики.', N'Анаферон.jpg')
SET IDENTITY_INSERT [dbo].[Medicine] OFF
GO
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (1, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (1, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (2, 2, 5)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (2, 3, 10)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (3, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (3, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (4, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (5, 1, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (5, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (5, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (6, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (8, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (9, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (9, 3, 2)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (10, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (11, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (11, 3, 2)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (12, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (12, 3, 2)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (13, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (14, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (15, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (16, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (17, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (18, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (19, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (20, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (21, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (22, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (23, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (24, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (25, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (26, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (27, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (27, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (28, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (29, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (30, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (31, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (32, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (33, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (34, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (35, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (36, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (37, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (38, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (39, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (40, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (41, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (42, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (43, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (44, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (45, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (46, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (47, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (48, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (48, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (49, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (49, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (50, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (51, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (52, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (53, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (53, 3, 2)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (54, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (55, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (56, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (57, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (57, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (58, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (58, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (59, 2, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (59, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (60, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (61, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (62, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (63, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (64, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (65, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (66, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (67, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (68, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (69, 3, 1)
INSERT [dbo].[MedicineOrder] ([OrderId], [MedicineId], [ProductCount]) VALUES (70, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (1, CAST(N'2024-02-27T22:32:42.250' AS DateTime), CAST(N'2024-03-01T22:32:42.273' AS DateTime), 14, N'Тест', 409, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (2, CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-03-01T00:00:00.000' AS DateTime), 14, N'Тестик2', 410, 2)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (3, CAST(N'2024-02-28T01:17:07.007' AS DateTime), CAST(N'2024-03-02T01:17:07.023' AS DateTime), 15, N'Тест', 323, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (4, CAST(N'2024-02-28T01:18:43.097' AS DateTime), CAST(N'2024-03-02T01:18:43.110' AS DateTime), 13, N'Тест', 267, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (5, CAST(N'2024-02-28T01:18:55.410' AS DateTime), CAST(N'2024-03-02T01:18:55.413' AS DateTime), 15, N'Тест', 828, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (6, CAST(N'2024-02-28T01:22:39.993' AS DateTime), CAST(N'2024-03-02T01:22:40.010' AS DateTime), 1, N'Тест', 137, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (8, CAST(N'2024-03-07T04:22:37.393' AS DateTime), CAST(N'2024-03-10T04:22:37.410' AS DateTime), 6, N'Гостик', 331, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (9, CAST(N'2024-03-07T04:24:52.930' AS DateTime), CAST(N'2024-03-10T04:24:52.950' AS DateTime), 6, N'Я гостик', 497, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (10, CAST(N'2024-03-07T04:26:21.680' AS DateTime), CAST(N'2024-03-10T04:26:21.707' AS DateTime), 8, N'Гость', 719, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (11, CAST(N'2024-03-07T04:30:00.750' AS DateTime), CAST(N'2024-03-10T04:30:00.770' AS DateTime), 9, N'Гооость', 770, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (12, CAST(N'2024-03-07T04:33:21.450' AS DateTime), CAST(N'2024-03-10T04:33:21.450' AS DateTime), 9, N'Гооость', 165, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (13, CAST(N'2024-03-07T04:33:52.563' AS DateTime), CAST(N'2024-03-10T04:33:52.590' AS DateTime), 7, N'1', 281, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (14, CAST(N'2024-03-07T04:35:32.090' AS DateTime), CAST(N'2024-03-10T04:35:32.110' AS DateTime), 5, N'dsa', 744, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (15, CAST(N'2024-03-07T04:36:35.153' AS DateTime), CAST(N'2024-03-10T04:36:35.180' AS DateTime), 7, N'asda', 481, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (16, CAST(N'2024-03-07T04:37:47.170' AS DateTime), CAST(N'2024-03-10T04:37:47.187' AS DateTime), 10, N'123', 894, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (17, CAST(N'2024-03-07T04:39:15.810' AS DateTime), CAST(N'2024-03-10T04:39:15.827' AS DateTime), 11, N'124', 266, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (18, CAST(N'2024-03-07T04:41:44.833' AS DateTime), CAST(N'2024-03-10T04:41:44.850' AS DateTime), 8, N'тест', 776, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (19, CAST(N'2024-03-07T04:43:29.847' AS DateTime), CAST(N'2024-03-10T04:43:29.863' AS DateTime), 8, N'цвуак', 468, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (20, CAST(N'2024-03-07T04:44:02.850' AS DateTime), CAST(N'2024-03-10T04:44:02.863' AS DateTime), 7, N'щл', 823, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (21, CAST(N'2024-03-07T04:45:10.030' AS DateTime), CAST(N'2024-03-10T04:45:10.047' AS DateTime), 8, N'', 241, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (22, CAST(N'2024-03-07T04:45:47.680' AS DateTime), CAST(N'2024-03-10T04:45:47.697' AS DateTime), 5, N'', 644, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (23, CAST(N'2024-03-07T04:55:06.540' AS DateTime), CAST(N'2024-03-10T04:55:06.557' AS DateTime), 7, N'', 724, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (24, CAST(N'2024-03-07T04:59:28.590' AS DateTime), CAST(N'2024-03-10T04:59:28.610' AS DateTime), 7, N'', 711, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (25, CAST(N'2024-03-07T05:02:36.127' AS DateTime), CAST(N'2024-03-10T05:02:36.143' AS DateTime), 8, N'', 229, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (26, CAST(N'2024-03-07T05:05:21.543' AS DateTime), CAST(N'2024-03-10T05:05:21.580' AS DateTime), 8, N'', 335, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (27, CAST(N'2024-03-07T05:05:59.767' AS DateTime), CAST(N'2024-03-10T05:05:59.770' AS DateTime), 7, N'', 851, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (28, CAST(N'2024-03-07T05:08:10.047' AS DateTime), CAST(N'2024-03-10T05:08:10.060' AS DateTime), 13, N'', 934, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (29, CAST(N'2024-03-07T05:09:43.477' AS DateTime), CAST(N'2024-03-10T05:09:43.497' AS DateTime), 10, N'', 373, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (30, CAST(N'2024-03-07T05:11:10.003' AS DateTime), CAST(N'2024-03-10T05:11:10.020' AS DateTime), 6, N'', 506, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (31, CAST(N'2024-03-07T05:12:16.543' AS DateTime), CAST(N'2024-03-10T05:12:16.560' AS DateTime), 13, N'', 790, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (32, CAST(N'2024-03-07T05:12:57.800' AS DateTime), CAST(N'2024-03-10T05:12:57.817' AS DateTime), 13, N'', 830, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (33, CAST(N'2024-03-07T05:15:09.440' AS DateTime), CAST(N'2024-03-10T05:15:09.457' AS DateTime), 6, N'', 461, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (34, CAST(N'2024-03-07T05:15:39.827' AS DateTime), CAST(N'2024-03-10T05:15:39.853' AS DateTime), 6, N'гостик', 486, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (35, CAST(N'2024-03-07T05:19:29.383' AS DateTime), CAST(N'2024-03-10T05:19:29.400' AS DateTime), 8, N'Ефремов  Сергей Пантелеймонович', 486, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (36, CAST(N'2024-03-07T05:21:26.537' AS DateTime), CAST(N'2024-03-10T05:21:26.553' AS DateTime), 11, N'', 720, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (37, CAST(N'2024-03-07T05:23:36.733' AS DateTime), CAST(N'2024-03-10T05:23:36.750' AS DateTime), 9, N'', 276, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (38, CAST(N'2024-03-07T05:25:04.493' AS DateTime), CAST(N'2024-03-10T05:25:04.523' AS DateTime), 10, N'', 439, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (39, CAST(N'2024-03-07T05:26:38.227' AS DateTime), CAST(N'2024-03-10T05:26:38.250' AS DateTime), 12, N'', 452, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (40, CAST(N'2024-03-07T05:28:02.617' AS DateTime), CAST(N'2024-03-10T05:28:02.663' AS DateTime), 7, N'', 447, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (41, CAST(N'2024-03-07T05:28:47.240' AS DateTime), CAST(N'2024-03-10T05:28:47.273' AS DateTime), 9, N'', 653, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (42, CAST(N'2024-03-07T19:01:58.653' AS DateTime), CAST(N'2024-03-10T19:01:58.673' AS DateTime), 9, N'', 638, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (43, CAST(N'2024-03-07T19:04:54.097' AS DateTime), CAST(N'2024-03-10T19:04:54.123' AS DateTime), 6, N'', 718, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (44, CAST(N'2024-03-07T19:06:29.457' AS DateTime), CAST(N'2024-03-10T19:06:29.473' AS DateTime), 7, N'', 248, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (45, CAST(N'2024-03-07T19:08:13.857' AS DateTime), CAST(N'2024-03-10T19:08:13.887' AS DateTime), 8, N'', 229, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (46, CAST(N'2024-03-07T19:09:15.697' AS DateTime), CAST(N'2024-03-10T19:09:15.697' AS DateTime), 8, N'', 113, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (47, CAST(N'2024-03-07T19:09:34.820' AS DateTime), CAST(N'2024-03-10T19:09:34.820' AS DateTime), 8, N'', 459, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (48, CAST(N'2024-03-07T19:10:44.123' AS DateTime), CAST(N'2024-03-10T19:10:44.140' AS DateTime), 8, N'', 338, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (49, CAST(N'2024-03-07T19:11:09.367' AS DateTime), CAST(N'2024-03-10T19:11:09.367' AS DateTime), 8, N'', 230, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (50, CAST(N'2024-03-07T19:18:32.467' AS DateTime), CAST(N'2024-03-10T19:18:32.487' AS DateTime), 7, N'', 700, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (51, CAST(N'2024-03-07T19:18:51.603' AS DateTime), CAST(N'2024-03-10T19:18:51.607' AS DateTime), 7, N'', 899, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (52, CAST(N'2024-03-07T19:19:56.063' AS DateTime), CAST(N'2024-03-10T19:19:56.083' AS DateTime), 9, N'', 213, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (53, CAST(N'2024-03-07T19:21:18.527' AS DateTime), CAST(N'2024-03-10T19:21:18.530' AS DateTime), 7, N'', 694, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (54, CAST(N'2024-03-07T19:22:00.833' AS DateTime), CAST(N'2024-03-10T19:22:00.867' AS DateTime), 7, N'', 138, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (55, CAST(N'2024-03-07T19:22:49.590' AS DateTime), CAST(N'2024-03-10T19:22:49.607' AS DateTime), 6, N'', 348, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (56, CAST(N'2024-03-07T19:23:41.507' AS DateTime), CAST(N'2024-03-10T19:23:41.523' AS DateTime), 7, N'', 679, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (57, CAST(N'2024-03-07T19:25:36.290' AS DateTime), CAST(N'2024-03-10T19:25:36.307' AS DateTime), 9, N'Ефремов  Сергей Пантелеймонович', 229, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (58, CAST(N'2024-03-07T19:27:45.903' AS DateTime), CAST(N'2024-03-10T19:27:45.920' AS DateTime), 10, N'', 249, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (59, CAST(N'2024-03-07T19:29:53.953' AS DateTime), CAST(N'2024-03-10T19:29:53.973' AS DateTime), 11, N'', 567, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (60, CAST(N'2024-03-07T19:32:16.143' AS DateTime), CAST(N'2024-03-10T19:32:16.160' AS DateTime), 6, N'', 646, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (61, CAST(N'2024-03-07T19:34:24.400' AS DateTime), CAST(N'2024-03-10T19:34:24.417' AS DateTime), 11, N'', 688, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (62, CAST(N'2024-03-07T19:37:17.720' AS DateTime), CAST(N'2024-03-10T19:37:17.737' AS DateTime), 13, N'', 629, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (63, CAST(N'2024-03-07T19:38:47.460' AS DateTime), CAST(N'2024-03-10T19:38:47.477' AS DateTime), 8, N'', 481, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (64, CAST(N'2024-03-07T19:39:51.240' AS DateTime), CAST(N'2024-03-10T19:39:51.257' AS DateTime), 10, N'', 309, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (65, CAST(N'2024-03-07T19:40:33.443' AS DateTime), CAST(N'2024-03-10T19:40:33.460' AS DateTime), 7, N'', 233, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (66, CAST(N'2024-03-07T19:42:19.420' AS DateTime), CAST(N'2024-03-10T19:42:19.437' AS DateTime), 8, N'', 133, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (67, CAST(N'2024-03-07T19:43:26.630' AS DateTime), CAST(N'2024-03-10T19:43:26.643' AS DateTime), 10, N'', 949, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (68, CAST(N'2024-03-07T19:43:57.903' AS DateTime), CAST(N'2024-03-10T19:43:57.920' AS DateTime), 8, N'', 614, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (69, CAST(N'2024-03-07T19:44:35.057' AS DateTime), CAST(N'2024-03-10T19:44:35.073' AS DateTime), 8, N'', 825, 1)
INSERT [dbo].[Order] ([OrderId], [DateOrder], [DateDelivery], [OrderPointId], [OrderClient], [OrderCode], [OrderStatusId]) VALUES (70, CAST(N'2024-03-11T01:58:22.197' AS DateTime), CAST(N'2024-03-14T01:58:22.210' AS DateTime), 7, N'Ефремов  Сергей Пантелеймонович', 412, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Point] ON 

INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (1, N'344288, г. Дубна, ул. Чехова, 1')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (2, N'614164, г.Дубна,  ул. Степная, 30')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (3, N'394242, г. Дубна, ул. Коммунистическая, 43')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (4, N'660540, г. Дубна, ул. Солнечная, 25')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (5, N'125837, г. Дубна, ул. Шоссейная, 40')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (6, N'125703, г. Дубна, ул. Партизанская, 49')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (7, N'625283, г. Дубна, ул. Победы, 46')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (8, N'614611, г. Дубна, ул. Молодежная, 50')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (9, N'454311, г.Дубна, ул. Новая, 19')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (10, N'660007, г.Дубна, ул. Октябрьская, 19')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (11, N'603036, г. Дубна, ул. Садовая, 4')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (12, N'450983, г.Дубна, ул. Комсомольская, 26')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (13, N'394782, г. Дубна, ул. Чехова, 3')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (14, N'603002, г. Дубна, ул. Дзержинского, 28')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (15, N'450558, г. Дубна, ул. Набережная, 30')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (16, N'394060, г.Дубна, ул. Фрунзе, 43')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (17, N'410661, г. Дубна, ул. Школьная, 50')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (18, N'625590, г. Дубна, ул. Коммунистическая, 20')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (19, N'625683, г. Дубна, ул. 8 Марта')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (20, N'400562, г. Дубна, ул. Зеленая, 32')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (21, N'614510, г. Дубна, ул. Маяковского, 47')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (22, N'410542, г. Дубна, ул. Светлая, 46')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (23, N'620839, г. Дубна, ул. Цветочная, 8')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (24, N'443890, г. Дубна, ул. Коммунистическая, 1')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (25, N'603379, г. Дубна, ул. Спортивная, 46')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (26, N'603721, г. Дубна, ул. Гоголя, 41')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (27, N'410172, г. Дубна, ул. Северная, 13')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (28, N'420151, г. Дубна, ул. Вишневая, 32')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (29, N'125061, г. Дубна, ул. Подгорная, 8')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (30, N'630370, г. Дубна, ул. Шоссейная, 24')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (31, N'614753, г. Дубна, ул. Полевая, 35')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (32, N'426030, г. Дубна, ул. Маяковского, 44')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (33, N'450375, г. Дубна ул. Клубная, 44')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (34, N'625560, г. Дубна, ул. Некрасова, 12')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (35, N'630201, г. Дубна, ул. Комсомольская, 17')
INSERT [dbo].[Point] ([PointId], [PointAddress]) VALUES (36, N'190949, г. Дубна, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[Point] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (1, N'Новый ')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (2, N'Завершен')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (1, 1, N'Ефремов  Сергей Пантелеймонович', N'loginDEppn2018', N'6}i+FD')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (2, 1, N'Родионова  Тамара Валентиновна', N'loginDElqb2018', N'RNynil')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (3, 2, N'Миронова  Галина Улебовна', N'loginDEydn2018', N'34I}X9')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (4, 2, N'Сидоров  Роман Иринеевич', N'loginDEijg2018', N'4QlKJW')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (5, 2, N'Ситников  Парфений Всеволодович', N'loginDEdpy2018', N'MJ0W|f')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (6, 2, N'Никонов  Роман Геласьевич', N'loginDEwdm2018', N'&PynqU')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (7, 1, N'Щербаков  Владимир Матвеевич', N'loginDEdup2018', N'JM+2{s')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (8, 2, N'Кулаков  Мартын Михаилович', N'loginDEhbm2018', N'9aObu4')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (9, 3, N'Сазонова  Оксана Лаврентьевна', N'loginDExvq2018', N'hX0wJz')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (10, 2, N'Архипов  Варлам Мэлорович', N'loginDErks2018', N'LQNSjo')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (11, 3, N'Устинова  Ираида Мэлоровна', N'loginDErvb2018', N'ceAf&R')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (12, 3, N'Лукин  Георгий Альбертович', N'loginDEulo2018', N'#ИМЯ?')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (13, 1, N'Кононов  Эдуард Валентинович', N'loginDEgfw2018', N'3c2Ic1')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (14, 2, N'Орехова  Клавдия Альбертовна', N'loginDEmxb2018', N'ZPXcRS')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (15, 2, N'Яковлев  Яков Эдуардович', N'loginDEgeq2018', N'&&Eim0')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (16, 1, N'Воронов  Мэлс Семёнович', N'loginDEkhj2018', N'Pbc0t{')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (17, 1, N'Вишнякова  Ия Данииловна', N'loginDEliu2018', N'32FyTl')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (18, 1, N'Третьяков  Фёдор Вадимович', N'loginDEsmf2018', N'{{O2QG')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (19, 2, N'Макаров  Максим Ильяович', N'loginDEutd2018', N'GbcJvC')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (20, 2, N'Шубина  Маргарита Анатольевна', N'loginDEpgh2018', N'YV2lvh')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (21, 2, N'Блинова  Ангелина Владленовна', N'loginDEvop2018', N'pBP8rO')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (22, 1, N'Воробьёв  Владлен Фролович', N'loginDEwjo2018', N'EQaD|d')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (23, 2, N'Сорокина  Прасковья Фёдоровна', N'loginDEbur2018', N'aZKGeI')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (24, 1, N'Давыдов  Яков Антонович', N'loginDEszw2018', N'EGU{YE')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (25, 1, N'Рыбакова  Евдокия Анатольевна', N'loginDExsu2018', N'*2RMsp')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (26, 1, N'Маслов  Геннадий Фролович', N'loginDEztn2018', N'nJBZpU')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (27, 1, N'Цветкова  Элеонора Аристарховна', N'loginDEtmn2018', N'UObB}N')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (28, 1, N'Евдокимов  Ростислав Александрович', N'loginDEhep2018', N'SwRicr')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (29, 1, N'Никонова  Венера Станиславовна', N'loginDEevr2018', N'zO5l}l')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (30, 1, N'Громов  Егор Антонович', N'loginDEnpa2018', N'M*QLjf')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (31, 3, N'Суворова  Валерия Борисовна', N'loginDEgyt2018', N'Pav+GP')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (32, 1, N'Мишина  Елизавета Романовна', N'loginDEbrr2018', N'Z7L|+i')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (33, 3, N'Зимина  Ольга Аркадьевна', N'loginDEyoo2018', N'UG1BjP')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (34, 3, N'Игнатьев  Игнатий Антонинович', N'loginDEaob2018', N'3fy+3I')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (35, 1, N'Пахомова  Зинаида Витальевна', N'loginDEwtz2018', N'&GxSST')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (36, 3, N'Устинов  Владимир Федосеевич', N'loginDEctf2018', N'sjt*3N')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (37, 2, N'Кулаков  Мэлор Вячеславович', N'loginDEipm2018', N'MAZl6|')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (38, 1, N'Сазонов  Авксентий Брониславович', N'loginDEjoi2018', N'o}C4jv')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (39, 2, N'Бурова  Наина Брониславовна', N'loginDEwap2018', N'4hny7k')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (40, 1, N'Фадеев  Демьян Федосеевич', N'loginDEaxm2018', N'BEc3xq')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (41, 1, N'Бобылёва  Дарья Якуновна', N'loginDEsmq2018', N'ATVmM7')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (42, 1, N'Виноградов  Созон Арсеньевич', N'loginDEeur2018', N'n4V{wP')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (43, 1, N'Гордеев  Владлен Ефимович', N'loginDEvke2018', N'WQLXSl')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (44, 2, N'Иванова   Зинаида Валерьевна', N'loginDEvod2018', N'0EW93v')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (45, 1, N'Гусев  Руслан Дамирович', N'loginDEjaw2018', N'h6z&Ky')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (46, 2, N'Маслов  Дмитрий Иванович', N'loginDEpdp2018', N'8NvRfC')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (47, 1, N'Антонова  Ульяна Семёновна', N'loginDEjpp2018', N'oMOQq3')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (48, 2, N'Орехова  Людмила Владимировна', N'loginDEkiy2018', N'BQzsts')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (49, 2, N'Авдеева  Жанна Куприяновна', N'loginDEhmn2018', N'a|Iz|7')
INSERT [dbo].[Users] ([UserId], [UserRoleId], [UserFullName], [UserLogin], [UserPassword]) VALUES (50, 1, N'Кузнецов  Фрол Варламович', N'loginDEfmn2018', N'cw3|03')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Manufacturers]  WITH CHECK ADD  CONSTRAINT [FK_Manufacturers_Manufacturers] FOREIGN KEY([ManufacturerCountryId])
REFERENCES [dbo].[ManufacturerCountry] ([ManufacturerCountryId])
GO
ALTER TABLE [dbo].[Manufacturers] CHECK CONSTRAINT [FK_Manufacturers_Manufacturers]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Categories] FOREIGN KEY([MedicineCategory])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_Categories]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Manufacturers] FOREIGN KEY([MedicineManufacturerId])
REFERENCES [dbo].[Manufacturers] ([MedicineManufacturerId])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_Manufacturers]
GO
ALTER TABLE [dbo].[MedicineOrder]  WITH CHECK ADD  CONSTRAINT [FK_MedicineOrder_Medicine] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicine] ([MedicineId])
GO
ALTER TABLE [dbo].[MedicineOrder] CHECK CONSTRAINT [FK_MedicineOrder_Medicine]
GO
ALTER TABLE [dbo].[MedicineOrder]  WITH CHECK ADD  CONSTRAINT [FK_MedicineOrder_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[MedicineOrder] CHECK CONSTRAINT [FK_MedicineOrder_Order]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Point] FOREIGN KEY([OrderPointId])
REFERENCES [dbo].[Point] ([PointId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Point]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([UserRoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
