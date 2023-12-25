CREATE DATABASE [QLBanHangMu]
USE [QLBanHangMu]
GO
/****** Object:  Table [dbo].[AnhChiTietSP]    Script Date: 19/5/2023 4:14:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhChiTietSP](
	[MaAnh] [varchar](20) NOT NULL,
	[MaSPTheoMau] [varchar](20) NULL,
	[TenFileAnh] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AnhChiTietSP] PRIMARY KEY CLUSTERED 
(
	[MaAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDH]    Script Date: 19/5/2023 4:14:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDH](
	[MaDonHang] [varchar](20) NOT NULL,
	[MaChiTietSP] [varchar](20) NOT NULL,
	[SoLuongMua] [int] NULL,
	[DonGiaBan] [bigint] NULL,
 CONSTRAINT [PK_ChiTietDH] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaChiTietSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSPBan]    Script Date: 19/5/2023 4:14:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSPBan](
	[MaChiTietSP] [varchar](20) NOT NULL,
	[MaSPTheoMau] [varchar](20) NULL,
	[KichCo] [varchar](5) NULL,
	[SoLuong] [int] NULL,
	[DonGiaBan] [bigint] NULL,
 CONSTRAINT [PK_ChiTietSPBan] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 19/5/2023 4:14:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [varchar](20) NOT NULL,
	[NgayDatHang] [date] NULL,
	[MaNguoiDung] [varchar](20) NULL,
	[DiaChiGiaoHang] [nvarchar](100) NULL,
	[PTThanhToan] [nvarchar](50) NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[TenNguoiNhanHang] [nvarchar](50) NOT NULL,
	[SoDienThoaiNhanHang] [varchar](20) NOT NULL,
	[TongTien] [bigint] NULL,
	[GiamGia] [tinyint] NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [pk_donhang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MauSac]    Script Date: 19/5/2023 4:14:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauSac](
	[MaMau] [varchar](20) NOT NULL,
	[TenMau] [nvarchar](20) NOT NULL,
 CONSTRAINT [pkmausac] PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 19/5/2023 4:14:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [varchar](20) NOT NULL,
	[TenDangNhap] [varchar](30) NULL,
	[TenNguoiDung] [nvarchar](30) NULL,
	[SoDienThoai] [varchar](12) NULL,
	[Email] [varchar](30) NULL,
	[MatKhau] [varchar](30) NULL,
	[DiaChi] [nvarchar](max) NULL,
 CONSTRAINT [pknguoidung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanLoai]    Script Date: 19/5/2023 4:14:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoai](
	[MaPhanLoai] [varchar](20) NOT NULL,
	[PhanLoaiChinh] [nvarchar](50) NULL,
 CONSTRAINT [pk_phanloai] PRIMARY KEY CLUSTERED 
(
	[MaPhanLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanLoaiPhu]    Script Date: 19/5/2023 4:14:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoaiPhu](
	[MaPhanLoaiPhu] [varchar](20) NOT NULL,
	[TenPhanLoaiPhu] [nvarchar](50) NULL,
	[MaPhanLoai] [varchar](20) NULL,
 CONSTRAINT [pk_phanloaiphu] PRIMARY KEY CLUSTERED 
(
	[MaPhanLoaiPhu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 19/5/2023 4:14:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [varchar](20) NOT NULL,
	[TenSanPham] [nvarchar](50) NOT NULL,
	[MaPhanLoai] [varchar](20) NULL,
	[GiaNhap] [bigint] NULL,
	[DonGiaBanNhoNhat] [bigint] NULL,
	[DonGiaBanLonNhat] [bigint] NULL,
	[TrangThai] [bit] NULL,
	[MoTaNgan] [nvarchar](max) NULL,
	[AnhDaiDien] [nvarchar](max) NULL,
	[NoiBat] [bit] NULL,
	[MaPhanLoaiPhu] [varchar](20) NULL,
 CONSTRAINT [pk_sanpham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPtheoMau]    Script Date: 19/5/2023 4:14:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPtheoMau](
	[MaSPTheoMau] [varchar](20) NOT NULL,
	[MaSanPham] [varchar](20) NOT NULL,
	[MaMau] [varchar](20) NOT NULL,
 CONSTRAINT [pkphanloaimssp] PRIMARY KEY CLUSTERED 
(
	[MaSPTheoMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PhanLoai] ([MaPhanLoai], [PhanLoaiChinh]) VALUES (N'001', N'Mũ cói')
GO
INSERT [dbo].[PhanLoai] ([MaPhanLoai], [PhanLoaiChinh]) VALUES (N'002', N'Mũ Len')
GO
INSERT [dbo].[PhanLoai] ([MaPhanLoai], [PhanLoaiChinh]) VALUES (N'003', N'Mũ vải')
GO
INSERT [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu], [TenPhanLoaiPhu], [MaPhanLoai]) VALUES (N'011', N'Mũ cói form mềm', N'001')
GO
INSERT [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu], [TenPhanLoaiPhu], [MaPhanLoai]) VALUES (N'012', N'Mũ cói form cứng', N'001')
GO
INSERT [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu], [TenPhanLoaiPhu], [MaPhanLoai]) VALUES (N'021', N'Mũ len lông cừu', N'002')
GO
INSERT [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu], [TenPhanLoaiPhu], [MaPhanLoai]) VALUES (N'022', N'Mũ len sợi', N'002')
GO
INSERT [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu], [TenPhanLoaiPhu], [MaPhanLoai]) VALUES (N'031', N'Mũ lưỡi trai', N'003')
GO
INSERT [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu], [TenPhanLoaiPhu], [MaPhanLoai]) VALUES (N'032', N'Mũ Bucket', N'003')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'00001', N'Mũ cói đi biển mềm có nơ', N'001', 200000, 250000, 270000, NULL, N'Mô tả sản phẩm mũ nón đi biển sợi cói tự nhiên:
•	Được làm từ chất liệu cói mềm, thoáng mát cho ngày hè nóng bức
•	Với thiết kế dây nơ trên nón giúp trông nhẹ nhàng và tinh tế hơn
•	Giúp che nắng, bảo vệ da, thể hiện sự phong cách, cá tính
Sử dụng và phối đồ với mũ nói thời trang:
•	Không những đi biển, nón còn dùng trong những hoạt động hằng ngày như dạo
•	phố, picnic
•	Giá trị của chiếc mũ càng tăng khi phối với những trang phục nữa tính
•	Khôngnhất thiết phải là váy khi kết hợp với chiếc quần jean cùng chiếc áo trắng cũng thể hiện được sự năng động, trẻ trung

', N'00001.jpg', NULL, N'011')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'00002', N'Mũ cói mềm rộng vành', N'001', 230000, 300000, 320000, NULL, N'Mô tả sản phẩm mũ nón đi biển sợi cói tự nhiên:
•	Được làm từ chất liệu cói mềm, thoáng mát cho ngày hè nóng bức
•	Với thiết kế dây nơ trên nón giúp trông nhẹ nhàng và tinh tế hơn
•	Giúp che nắng, bảo vệ da, thể hiện sự phong cách, cá tính
Sử dụng và phối đồ với mũ nói thời trang:
•	Không những đi biển, nón còn dùng trong những hoạt động hằng ngày như dạo
•	phố, picnic
•	Giá trị của chiếc mũ càng tăng khi phối với những trang phục nữa tính
•	Khôngnhất thiết phải là váy khi kết hợp với chiếc quần jean cùng chiếc áo trắng cũng thể hiện được sự năng động, trẻ trung

', N'00002.jpg', NULL, N'011')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'00003', N'Mũ cói vành nhỡ', N'001', 220000, 280000, 300000, NULL, N'Mô tả sản phẩm mũ nón đi biển sợi cói tự nhiên:
•	Được làm từ chất liệu cói mềm, thoáng mát cho ngày hè nóng bức
•	Với thiết kế dây nơ trên nón giúp trông nhẹ nhàng và tinh tế hơn
•	Giúp che nắng, bảo vệ da, thể hiện sự phong cách, cá tính
Sử dụng và phối đồ với mũ nói thời trang:
•	Không những đi biển, nón còn dùng trong những hoạt động hằng ngày như dạo
•	phố, picnic
•	Giá trị của chiếc mũ càng tăng khi phối với những trang phục nữa tính
•	Khôngnhất thiết phải là váy khi kết hợp với chiếc quần jean cùng chiếc áo trắng cũng thể hiện được sự năng động, trẻ trung

', N'00003.jpg', NULL, N'012')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'00004', N'Mũ cói rộng vành', N'001', 280000, 350000, 400000, NULL, N'Mô tả sản phẩm mũ nón đi biển sợi cói tự nhiên:
•	Được làm từ chất liệu cói mềm, thoáng mát cho ngày hè nóng bức
•	Với thiết kế dây nơ trên nón giúp trông nhẹ nhàng và tinh tế hơn
•	Giúp che nắng, bảo vệ da, thể hiện sự phong cách, cá tính
Sử dụng và phối đồ với mũ nói thời trang:
•	Không những đi biển, nón còn dùng trong những hoạt động hằng ngày như dạo
•	phố, picnic
•	Giá trị của chiếc mũ càng tăng khi phối với những trang phục nữa tính
•	Khôngnhất thiết phải là váy khi kết hợp với chiếc quần jean cùng chiếc áo trắng cũng thể hiện được sự năng động, trẻ trung

', N'00004.jpg', NULL, N'012')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'00005', N'Mũ len lông cừu trắng', N'002', 90000, 130000, 150000, NULL, N'Mô tả sản phẩm mũ nón đi biển sợi cói tự nhiên:
•	Được làm từ chất liệu cói mềm, thoáng mát cho ngày hè nóng bức
•	Với thiết kế dây nơ trên nón giúp trông nhẹ nhàng và tinh tế hơn
•	Giúp che nắng, bảo vệ da, thể hiện sự phong cách, cá tính
Sử dụng và phối đồ với mũ nói thời trang:
•	Không những đi biển, nón còn dùng trong những hoạt động hằng ngày như dạo
•	phố, picnic
•	Giá trị của chiếc mũ càng tăng khi phối với những trang phục nữa tính
•	Khôngnhất thiết phải là váy khi kết hợp với chiếc quần jean cùng chiếc áo trắng cũng thể hiện được sự năng động, trẻ trung

', N'00005.jpg', NULL, N'021')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'00006', N'Mũ len lông cừu họa tiết', N'002', 100000, 150000, 200000, NULL, N'Mô tả sản phẩm mũ nón đi biển sợi cói tự nhiên:
•	Được làm từ chất liệu cói mềm, thoáng mát cho ngày hè nóng bức
•	Với thiết kế dây nơ trên nón giúp trông nhẹ nhàng và tinh tế hơn
•	Giúp che nắng, bảo vệ da, thể hiện sự phong cách, cá tính
Sử dụng và phối đồ với mũ nói thời trang:
•	Không những đi biển, nón còn dùng trong những hoạt động hằng ngày như dạo
•	phố, picnic
•	Giá trị của chiếc mũ càng tăng khi phối với những trang phục nữa tính
•	Khôngnhất thiết phải là váy khi kết hợp với chiếc quần jean cùng chiếc áo trắng cũng thể hiện được sự năng động, trẻ trung

', N'00006.jpg', NULL, N'021')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'00007', N'Mũ len trùm đầu', N'002', 85000, 120000, 170000, NULL, N'Mô tả sản phẩm mũ nón đi biển sợi cói tự nhiên:
•	Được làm từ chất liệu cói mềm, thoáng mát cho ngày hè nóng bức
•	Với thiết kế dây nơ trên nón giúp trông nhẹ nhàng và tinh tế hơn
•	Giúp che nắng, bảo vệ da, thể hiện sự phong cách, cá tính
Sử dụng và phối đồ với mũ nói thời trang:
•	Không những đi biển, nón còn dùng trong những hoạt động hằng ngày như dạo
•	phố, picnic
•	Giá trị của chiếc mũ càng tăng khi phối với những trang phục nữa tính
•	Khôngnhất thiết phải là váy khi kết hợp với chiếc quần jean cùng chiếc áo trắng cũng thể hiện được sự năng động, trẻ trung

', N'00007.jpg', NULL, N'022')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'00008', N'Mũ len cách điệu', N'002', 230000, 280000, 320000, NULL, N'Mô tả sản phẩm mũ nón đi biển sợi cói tự nhiên:
•	Được làm từ chất liệu cói mềm, thoáng mát cho ngày hè nóng bức
•	Với thiết kế dây nơ trên nón giúp trông nhẹ nhàng và tinh tế hơn
•	Giúp che nắng, bảo vệ da, thể hiện sự phong cách, cá tính
Sử dụng và phối đồ với mũ nói thời trang:
•	Không những đi biển, nón còn dùng trong những hoạt động hằng ngày như dạo
•	phố, picnic
•	Giá trị của chiếc mũ càng tăng khi phối với những trang phục nữa tính
•	Khôngnhất thiết phải là váy khi kết hợp với chiếc quần jean cùng chiếc áo trắng cũng thể hiện được sự năng động, trẻ trung

', N'00008.jpg', NULL, N'022')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'00009', N'Mũ lưỡi tra beret', N'003', 65000, 90000, 120000, NULL, N'Mô tả sản phẩm mũ nón đi biển sợi cói tự nhiên:
•	Được làm từ chất liệu cói mềm, thoáng mát cho ngày hè nóng bức
•	Với thiết kế dây nơ trên nón giúp trông nhẹ nhàng và tinh tế hơn
•	Giúp che nắng, bảo vệ da, thể hiện sự phong cách, cá tính
Sử dụng và phối đồ với mũ nói thời trang:
•	Không những đi biển, nón còn dùng trong những hoạt động hằng ngày như dạo
•	phố, picnic
•	Giá trị của chiếc mũ càng tăng khi phối với những trang phục nữa tính
•	Khôngnhất thiết phải là váy khi kết hợp với chiếc quần jean cùng chiếc áo trắng cũng thể hiện được sự năng động, trẻ trung

', N'00009.jpg', NULL, N'031')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'00010', N'Mũ lưỡi trai thời trang', N'003', 50000, 80000, 100000, NULL, N'Mô tả sản phẩm mũ nón đi biển sợi cói tự nhiên:
•	Được làm từ chất liệu cói mềm, thoáng mát cho ngày hè nóng bức
•	Với thiết kế dây nơ trên nón giúp trông nhẹ nhàng và tinh tế hơn
•	Giúp che nắng, bảo vệ da, thể hiện sự phong cách, cá tính
Sử dụng và phối đồ với mũ nói thời trang:
•	Không những đi biển, nón còn dùng trong những hoạt động hằng ngày như dạo
•	phố, picnic
•	Giá trị của chiếc mũ càng tăng khi phối với những trang phục nữa tính
•	Khôngnhất thiết phải là váy khi kết hợp với chiếc quần jean cùng chiếc áo trắng cũng thể hiện được sự năng động, trẻ trung

', N'00010.jpg', NULL, N'031')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'00011', N'Mũ Bucket xinh xắn', N'003', 350000, 450000, 550000, NULL, N'Mô tả sản phẩm mũ nón đi biển sợi cói tự nhiên:
•	Được làm từ chất liệu cói mềm, thoáng mát cho ngày hè nóng bức
•	Với thiết kế dây nơ trên nón giúp trông nhẹ nhàng và tinh tế hơn
•	Giúp che nắng, bảo vệ da, thể hiện sự phong cách, cá tính
Sử dụng và phối đồ với mũ nói thời trang:
•	Không những đi biển, nón còn dùng trong những hoạt động hằng ngày như dạo
•	phố, picnic
•	Giá trị của chiếc mũ càng tăng khi phối với những trang phục nữa tính
•	Khôngnhất thiết phải là váy khi kết hợp với chiếc quần jean cùng chiếc áo trắng cũng thể hiện được sự năng động, trẻ trung

', N'00011.jpg', NULL, N'032')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'00012', N'Mũ Bucket kẻ ca rô', N'003', 120000, 150000, 170000, NULL, N'Mô tả sản phẩm mũ nón đi biển sợi cói tự nhiên:
•	Được làm từ chất liệu cói mềm, thoáng mát cho ngày hè nóng bức
•	Với thiết kế dây nơ trên nón giúp trông nhẹ nhàng và tinh tế hơn
•	Giúp che nắng, bảo vệ da, thể hiện sự phong cách, cá tính
Sử dụng và phối đồ với mũ nói thời trang:
•	Không những đi biển, nón còn dùng trong những hoạt động hằng ngày như dạo
•	phố, picnic
•	Giá trị của chiếc mũ càng tăng khi phối với những trang phục nữa tính
•	Khôngnhất thiết phải là váy khi kết hợp với chiếc quần jean cùng chiếc áo trắng cũng thể hiện được sự năng động, trẻ trung

', N'00012.jpg', NULL, N'032')
GO
ALTER TABLE [dbo].[AnhChiTietSP]  WITH CHECK ADD  CONSTRAINT [FK_AnhChiTietSP_SPtheoMau1] FOREIGN KEY([MaSPTheoMau])
REFERENCES [dbo].[SPtheoMau] ([MaSPTheoMau])
GO
ALTER TABLE [dbo].[AnhChiTietSP] CHECK CONSTRAINT [FK_AnhChiTietSP_SPtheoMau1]
GO
ALTER TABLE [dbo].[ChiTietDH]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDH_ChiTietSPBan] FOREIGN KEY([MaChiTietSP])
REFERENCES [dbo].[ChiTietSPBan] ([MaChiTietSP])
GO
ALTER TABLE [dbo].[ChiTietDH] CHECK CONSTRAINT [FK_ChiTietDH_ChiTietSPBan]
GO
ALTER TABLE [dbo].[ChiTietDH]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDH_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDH] CHECK CONSTRAINT [FK_ChiTietDH_DonHang]
GO
ALTER TABLE [dbo].[ChiTietSPBan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSPBan_SPtheoMau] FOREIGN KEY([MaSPTheoMau])
REFERENCES [dbo].[SPtheoMau] ([MaSPTheoMau])
GO
ALTER TABLE [dbo].[ChiTietSPBan] CHECK CONSTRAINT [FK_ChiTietSPBan_SPtheoMau]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_NguoiDung]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_PhanLoai] FOREIGN KEY([MaPhanLoai])
REFERENCES [dbo].[PhanLoai] ([MaPhanLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_PhanLoai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_PhanLoaiPhu] FOREIGN KEY([MaPhanLoaiPhu])
REFERENCES [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_PhanLoaiPhu]
GO
ALTER TABLE [dbo].[SPtheoMau]  WITH CHECK ADD  CONSTRAINT [FK_SPtheoMau_MauSac] FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([MaMau])
GO
ALTER TABLE [dbo].[SPtheoMau] CHECK CONSTRAINT [FK_SPtheoMau_MauSac]
GO
ALTER TABLE [dbo].[SPtheoMau]  WITH CHECK ADD  CONSTRAINT [FK_SPtheoMau_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[SPtheoMau] CHECK CONSTRAINT [FK_SPtheoMau_SanPham]
GO
