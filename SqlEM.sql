USE [EmployeeManagement]
GO
/****** Object:  Table [dbo].[tbChucVu]    Script Date: 05/07/2019 19:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbChucVu](
	[maChucVu] [int] IDENTITY(1,1) NOT NULL,
	[tenChucVu] [nvarchar](50) NOT NULL,
	[luongcung] [float] NULL,
	[huongDoanhSo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maChucVu] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPhongBan]    Script Date: 05/07/2019 19:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPhongBan](
	[maPhongBan] [int] IDENTITY(1,1) NOT NULL,
	[tenPhongBan] [nvarchar](50) NOT NULL,
	[diachiPB] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maPhongBan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbNhanVien]    Script Date: 05/07/2019 19:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNhanVien](
	[maNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[tenNV] [nvarchar](150) NULL,
	[ngaysinh] [date] NOT NULL,
	[email] [nvarchar](50) NULL,
	[sdt] [int] NULL,
	[diachi] [nvarchar](150) NULL,
	[taikhoan] [nvarchar](50) NULL,
	[matkhau] [nvarchar](50) NULL,
	[maChucVu] [int] NULL,
	[maPhongBan] [int] NULL,
	[hoatdong] [bit] NULL,
	[anh] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbChamCong]    Script Date: 05/07/2019 19:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbChamCong](
	[maNgay] [int] IDENTITY(1,1) NOT NULL,
	[maNhanVien] [int] NULL,
	[ngaylamviec] [date] NULL,
	[trangthai] [tinyint] NULL,
	[fulltime] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[maNgay] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbDuAn]    Script Date: 05/07/2019 19:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDuAn](
	[maDuAn] [int] IDENTITY(1,1) NOT NULL,
	[tenDuAn] [nvarchar](250) NOT NULL,
	[maNhanVien] [int] NULL,
	[giatri] [float] NOT NULL,
	[trangthai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[maDuAn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbDanhGia]    Script Date: 05/07/2019 19:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDanhGia](
	[maDanhGia] [int] IDENTITY(1,1) NOT NULL,
	[maNhanVien] [int] NOT NULL,
	[mucDanhGia] [nvarchar](50) NOT NULL,
	[ngayDanhGia] [date] NOT NULL,
	[ghichu] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[maDanhGia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK__tbNgayLam__maNha__182C9B23]    Script Date: 05/07/2019 19:45:56 ******/
ALTER TABLE [dbo].[tbChamCong]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[tbNhanVien] ([maNhanVien])
GO
/****** Object:  ForeignKey [FK__tbDanhGia__maNha__2C3393D0]    Script Date: 05/07/2019 19:45:56 ******/
ALTER TABLE [dbo].[tbDanhGia]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[tbNhanVien] ([maNhanVien])
GO
/****** Object:  ForeignKey [FK__tbDuAn__maNhanVi__30F848ED]    Script Date: 05/07/2019 19:45:56 ******/
ALTER TABLE [dbo].[tbDuAn]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[tbNhanVien] ([maNhanVien])
GO
/****** Object:  ForeignKey [FK__tbNhanVie__maChu__0DAF0CB0]    Script Date: 05/07/2019 19:45:56 ******/
ALTER TABLE [dbo].[tbNhanVien]  WITH CHECK ADD FOREIGN KEY([maChucVu])
REFERENCES [dbo].[tbChucVu] ([maChucVu])
GO
/****** Object:  ForeignKey [FK__tbNhanVie__maPho__0EA330E9]    Script Date: 05/07/2019 19:45:56 ******/
ALTER TABLE [dbo].[tbNhanVien]  WITH CHECK ADD FOREIGN KEY([maPhongBan])
REFERENCES [dbo].[tbPhongBan] ([maPhongBan])
GO
