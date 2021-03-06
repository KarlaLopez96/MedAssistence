USE [master]
GO
/****** Object:  Database [MedAssistance]    Script Date: 1/12/2020 03:09:15 ******/
CREATE DATABASE [MedAssistance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MedAssistance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MedAssistance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MedAssistance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MedAssistance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MedAssistance] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MedAssistance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MedAssistance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MedAssistance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MedAssistance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MedAssistance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MedAssistance] SET ARITHABORT OFF 
GO
ALTER DATABASE [MedAssistance] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MedAssistance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MedAssistance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MedAssistance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MedAssistance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MedAssistance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MedAssistance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MedAssistance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MedAssistance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MedAssistance] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MedAssistance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MedAssistance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MedAssistance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MedAssistance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MedAssistance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MedAssistance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MedAssistance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MedAssistance] SET RECOVERY FULL 
GO
ALTER DATABASE [MedAssistance] SET  MULTI_USER 
GO
ALTER DATABASE [MedAssistance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MedAssistance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MedAssistance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MedAssistance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MedAssistance] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MedAssistance', N'ON'
GO
ALTER DATABASE [MedAssistance] SET QUERY_STORE = OFF
GO
USE [MedAssistance]
GO
/****** Object:  Table [dbo].[Expediente]    Script Date: 1/12/2020 03:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expediente](
	[idExpediente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Nombre_Usuario] [varchar](50) NULL,
	[Nombre_Medico] [varchar](50) NULL,
	[Fecha] [datetime] NULL,
	[Detalles_Estudios] [varchar](50) NULL,
	[Detalles_Examenes] [varchar](50) NULL,
	[Recetas] [varchar](50) NULL,
	[Costo_Cita] [varchar](50) NULL,
	[idUsuario] [int] NOT NULL,
	[idMedico] [int] NOT NULL,
 CONSTRAINT [PK_Expendiente] PRIMARY KEY CLUSTERED 
(
	[idExpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mapa]    Script Date: 1/12/2020 03:09:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mapa](
	[idMapa] [int] IDENTITY(1,1) NOT NULL,
	[idMedico] [int] NOT NULL,
	[NombreLugar] [varchar](250) NULL,
	[Direccion] [varchar](250) NULL,
	[Imagen] [varchar](250) NULL,
	[Latitude] [varchar](250) NULL,
	[Longitude] [varchar](250) NULL,
	[NombreLugarId] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMapa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 1/12/2020 03:09:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[idMedico] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Profesion] [varchar](50) NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 1/12/2020 03:09:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[Condicion] [bit] NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 1/12/2020 03:09:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[idRol] [int] NOT NULL,
	[password_hash] [varbinary](max) NULL,
	[password_salt] [varbinary](max) NULL,
	[Condicion] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Expediente] ON 

INSERT [dbo].[Expediente] ([idExpediente], [Nombre], [Nombre_Usuario], [Nombre_Medico], [Fecha], [Detalles_Estudios], [Detalles_Examenes], [Recetas], [Costo_Cita], [idUsuario], [idMedico]) VALUES (5, N'Hospital rosales', N'Codie Martin', N'Aarika Anuel', CAST(N'2020-10-30T15:44:26.000' AS DateTime), N'Sin problemas, pendiente proxima cita', N'Sin problemas', N'Pastillas, antibiotico', N'5', 1, 1)
INSERT [dbo].[Expediente] ([idExpediente], [Nombre], [Nombre_Usuario], [Nombre_Medico], [Fecha], [Detalles_Estudios], [Detalles_Examenes], [Recetas], [Costo_Cita], [idUsuario], [idMedico]) VALUES (6, N'Hospital Central', N'Karla Lopez', N'Carlos Barahona', CAST(N'2020-11-15T23:33:14.000' AS DateTime), N'Detalles prueba', N'Detalles examenes prueba', N'Prueba de recetas', N'45', 2, 1)
INSERT [dbo].[Expediente] ([idExpediente], [Nombre], [Nombre_Usuario], [Nombre_Medico], [Fecha], [Detalles_Estudios], [Detalles_Examenes], [Recetas], [Costo_Cita], [idUsuario], [idMedico]) VALUES (14, N'Hospital H', N'Carlos Paredes', N'Angel', CAST(N'2020-11-16T09:23:43.000' AS DateTime), N'Prueba estudio detalle', N'Prueba exámenes detalle', N'ninguno', N'3', 3, 1)
INSERT [dbo].[Expediente] ([idExpediente], [Nombre], [Nombre_Usuario], [Nombre_Medico], [Fecha], [Detalles_Estudios], [Detalles_Examenes], [Recetas], [Costo_Cita], [idUsuario], [idMedico]) VALUES (15, N'ISSS', N'John Vladimir Linares', N'Pedro', CAST(N'2020-11-19T19:16:16.000' AS DateTime), N'Sin problemas', N'ningún detalle', N'Pendientes', N'13', 1, 1)
SET IDENTITY_INSERT [dbo].[Expediente] OFF
SET IDENTITY_INSERT [dbo].[Mapa] ON 

INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (1, 1, N'Farmacia Value', N'Avenida Independencia Sur, Santa Ana', N'https://farmavalue.biz/elsalvador/wp-content/uploads/sites/19/2019/06/Santa-Ana1.jpg', N'14.015178380223439', N'-89.56268108185407', N'Farmacia-Value-1')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (2, 1, N'Farmacia Value', N'Estación de servicio y Centro Comercial Texaco Las Piletas B-1', N'https://farmavalue.biz/elsalvador/wp-content/uploads/sites/19/2019/06/Escalo%CC%81n2.jpg', N'13.658393407400249', N'-89.27937626849335', N'Farmacia-Value-2')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (3, 1, N'Farmacia Value', N'Diagonal Doctor Luis Edmundo Vasquez,, San Salvador', N'https://farmavalue.biz/elsalvador/wp-content/uploads/sites/19/2019/06/Escalo%CC%81n1.jpg', N'13.709680955056216', N'-89.20169949812468', N'Farmacia-Value-3')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (4, 1, N'Farmacia Value', N'Plaza Soyapango, Soyapango', N'https://farmavalue.biz/elsalvador/wp-content/uploads/sites/19/2019/06/San-Jacinto2.jpg', N'13.702342934664744', N'-89.151917696986', N'Farmacia-Value-4')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (5, 1, N'Farmacia Económica', N'Calle Chiltiupan, Santa Tecla', N'https://i.ytimg.com/vi/GAXLZ-Sk3uM/hqdefault.jpg', N'13.678560556766945', N'-89.26809090327585', N'Farmacia-Economica-1')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (6, 1, N'Farmacia Económica', N'Boulevard Constitución & Calle El Algodon, San Salvador', N'https://multiplaza-samantha.s3.amazonaws.com/uploads/post/v4_mobile/3543/v400_400_FarmaciaEconomicas_800x800.jpg', N'13.722047721532723', N'-89.22350185795166', N'Farmacia-Economica-2')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (9, 1, N'Farmacia Económica', N'9° Ave. Sur y calle Ruben Dario Centro Comericial Plaza Centro Local 211 San Salvador CP, 1101', N'https://elencuentrosv.com/wp-content/uploads/2020/04/ECL-farmacias-economicas.jpg', N'13.70370320685091', N'-89.19586437806772', N'Farmacia-Economica-3')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (10, 1, N'Farmacia Económica', N'Calle Modelo, San Salvador', N'https://1.bp.blogspot.com/-8ZKxa25MR-w/UoZty5c5YaI/AAAAAAAAADg/mG8llKW6Kl8/s1600/Plaza+Mundo+3.jpg', N'13.689855265419146', N'-89.19515490701257', N'Farmacia-Economica-4')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (11, 1, N'Farmacia San Nicolás', N'Sonsonate', N'https://cdn-pro.elsalvador.com/wp-content/uploads/2017/01/25204021/1435747365718.jpg', N'13.758889041579193', N'-89.72249867187408', N'Farmacia-San-Nicolas-1')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (12, 1, N'Farmacia San Nicolás', N'Centro comercial El encuentro, Lourdes', N'https://www.dinero.com.sv/images/20161007_143212.jpg', N'13.756221254884057', N'-89.35994984787598', N'Farmacia-San-Nicolas-2')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (13, 1, N'Farmacia San Nicolás', N'Apopa', N'https://cdn-pro.elsalvador.com/wp-content/uploads/2017/01/27002259/1434904918144.jpg', N'13.798568741372952', N'-89.17764547878467', N'Farmacia-San-Nicolas-3')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (14, 1, N'Farmacia San Nicolás', N'Km. 10, Carretera al Puerto de La Libertad Antiguo Cuscatlán, Antiguo Cuscatlán', N'https://www.farmaciasannicolas.com/img/nosotros/acerca/01.jpg', N'13.671253118961747', N'-89.27051428380605', N'Farmacia-San-Nicolas-4')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (15, 1, N'Farmacia UNO', N'Jardines de la Gloria, Prol Bulevar Constitución, Mejicanos', NULL, N'13.748177952516501', N'-89.21810405026591', N'Farmacia-UNO-1')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (16, 1, N'Farmacia UNO', N'Pje No. 5 Dr Salvador Infante Diaz, San Salvador', NULL, N'13.716494600870293', N'-89.20231120461794', N'Farmacia-UNO-2')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (17, 1, N'Farmacia UNO', N'Cd Merliot, la gran vía', NULL, N'13.68480697233331', N'-89.25483958253402', N'Farmacia-UNO-3')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (18, 1, N'Farmacia UNO', N'Calle Antigua a Huizucar C-37, San Salvador', NULL, N'13.682805505046371', N'-89.22497050489547', N'Farmacia-UNO-4')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (19, 1, N'Clínicas PARAVIDA', N'7a Calle Poniente 4025, San Salvador', NULL, N'13.70633228672362', N'-89.23485667628778', N'Clinica-PARAVIDA')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (20, 1, N'Clinicas medicas Matasol (Dermatologos)', N'81, Calle Padres Aguilar &, 83 Avenida Sur, San Salvador', N'https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_700,h_525/https://redsalud.com.sv/wp-content/uploads/2018/04/plazas-medicas-1.jpg', N'13.70137615431388', N'-89.23802733478519', N'Clinica-Matasol')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (21, 1, N'Clínicas Médicas Integrales', N'Calle Daniel Hernández, Santa Tecla', NULL, N'13.675774570575857', N'-89.2902123894203', N'Clinica-Medica-Integrales')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (22, 1, N'Clínicas Médicas Especializadas, El Salvador', N'Colonia Medica, Psj. Dr. Roberto Orellana Valdez, # 117, San Salvador', N'https://urologoelsalvador.com/wp-content/uploads/2018/03/San-Salvador-02-UrologoSV-600x446.jpg', N'13.71079883603026', N'-89.20180678210616', N'Clinica-Medica-Especializada')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (23, 1, N'Hospital de Diagnóstico', N'San Salvador', N'https://medicosdeelsalvador.com/uploads/curriculum/3/303-03.jpg', N'13.714796361781664', N'-89.20352344383359', N'Hospital-de-Diagnostico')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (24, 1, N'Hospital Nacional Psiquiátrico “Dr. José Molina Martínez” ', N'Cantón Venecia,, Calle La Fuente, San Salvador', N'https://www.revistafactum.com/wp-content/uploads/2020/05/004_hospnac_soyapango.jpg', N'13.717964912610233', N'-89.13932209053523', N'Hospital-Psiquiatrico')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (25, 1, N'Hospital Nacional San Rafael', N'Carr. Panamericana 15, Santa Tecla', N'https://verdaddigital.com/wp-content/uploads/2020/06/Hospital-San-Rafael.jpg', N'13.673351119894821', N'-89.27896861885311', N'Hospital-San-Rafael')
INSERT [dbo].[Mapa] ([idMapa], [idMedico], [NombreLugar], [Direccion], [Imagen], [Latitude], [Longitude], [NombreLugarId]) VALUES (26, 1, N'Hospital Nacional Rosales', N'25 Av Norte, San Salvador', N'https://i.ytimg.com/vi/0uLpv6yIDsE/hqdefault.jpg', N'13.70162140319081', N'-89.20575503937903', N'Hospital-Rosales')
SET IDENTITY_INSERT [dbo].[Mapa] OFF
SET IDENTITY_INSERT [dbo].[Medico] ON 

INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (1, N'Aarika Anuel', N'81866 Waywood Street El Salvador', N'(862) 2600936', N'adebruin0@google.pl', N'Database Administrator I')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (2, N'Tam', N'19481 Eggendart Alley', N'(268) 1360214', N'tdorken1@uiuc.edu', N'Pharmacist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (3, N'Stacee', N'6903 Bartillon Court', N'(951) 5166145', N'sconnop2@lulu.com', N'VP Sales')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (4, N'Gawen', N'91142 Caliangt Point', N'(181) 8014307', N'gallicock3@unc.edu', N'Speech Pathologist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (5, N'Ara', N'46104 Mallard Junction', N'(147) 9506389', N'ahook4@hostgator.com', N'Media Manager III')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (6, N'Martie', N'0 Northridge Lane', N'(409) 3738468', N'mmcteague5@linkedin.com', N'Payment Adjustment Coordinator')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (7, N'Garald', N'5 Fieldstone Court', N'(992) 9304968', N'gilyuchyov6@npr.org', N'Dental Hygienist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (8, N'Ibrahim', N'4567 Waubesa Lane', N'(831) 4522833', N'ieastes7@wsj.com', N'GIS Technical Architect')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (9, N'Nellie', N'54 Talisman Point', N'(878) 6352078', N'nlamasna8@jiathis.com', N'Account Representative I')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (10, N'Valdemar', N'9160 Arizona Hill', N'(974) 8277672', N'vgann9@yellowpages.com', N'Electrical Engineer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (11, N'Lynnette', N'65549 Merchant Drive', N'(522) 3347478', N'lsmyliea@eepurl.com', N'Marketing Assistant')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (12, N'Sascha', N'83 Jenna Alley', N'(388) 7009539', N'sfrederickb@unblog.fr', N'Social Worker')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (13, N'Claiborn', N'694 Lindbergh Park', N'(442) 6574375', N'chillenc@behance.net', N'Sales Associate')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (14, N'Johnny', N'72177 Starling Circle', N'(801) 8644956', N'jwoodburnd@last.fm', N'Environmental Specialist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (15, N'Kasey', N'2 Northport Junction', N'(263) 8539029', N'kpetrelluzzie@columbia.edu', N'Occupational Therapist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (16, N'Peterus', N'99 Merrick Hill', N'(470) 7046579', N'pbroderickf@google.co.jp', N'Software Engineer I')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (17, N'Deirdre', N'67 Park Meadow Place', N'(104) 7996479', N'dstonhewerg@4shared.com', N'Nurse Practicioner')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (18, N'Fran', N'995 Ridgeview Parkway', N'(512) 7517412', N'fheamush@naver.com', N'Dental Hygienist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (19, N'Harli', N'0 Packers Street', N'(941) 9989307', N'hhugonini@tuttocitta.it', N'General Manager')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (20, N'Giffie', N'30587 Forest Run Parkway', N'(860) 3533274', N'gkitteringhamj@pen.io', N'Product Engineer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (21, N'Hilary', N'47762 Southridge Court', N'(163) 6131997', N'hhemmsk@ovh.net', N'Senior Developer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (22, N'Derward', N'61322 Mosinee Center', N'(158) 2885814', N'dflementl@ted.com', N'Speech Pathologist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (23, N'Beatrix', N'766 Ridgeview Trail', N'(805) 3660584', N'bteaserm@linkedin.com', N'Biostatistician III')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (24, N'Bellina', N'69697 Kinsman Drive', N'(633) 5512987', N'blowmassn@unc.edu', N'Director of Sales')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (25, N'Andee', N'6222 Ludington Circle', N'(814) 6011283', N'apheasanto@bandcamp.com', N'Account Coordinator')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (26, N'Manfred', N'3940 Village Green Street', N'(468) 7176962', N'mmacpaikep@ask.com', N'Junior Executive')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (27, N'Rodd', N'5326 Stone Corner Drive', N'(511) 2435540', N'rbookerq@mashable.com', N'Design Engineer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (28, N'Bonni', N'50583 Summit Hill', N'(926) 7696072', N'bwallbrookr@cbsnews.com', N'Assistant Manager')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (29, N'Chancey', N'6901 Katie Terrace', N'(618) 2458570', N'cwickhams@admin.ch', N'Automation Specialist II')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (30, N'Mariana', N'3 Butternut Center', N'(229) 5385542', N'mhowellt@dedecms.com', N'Research Nurse')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (31, N'Janella', N'58 Maple Avenue', N'(968) 2706955', N'jhollowsu@digg.com', N'Structural Engineer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (32, N'Felipa', N'3867 Jenifer Junction', N'(232) 1414516', N'fmertonv@mysql.com', N'Senior Cost Accountant')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (33, N'Tanney', N'55978 Clarendon Trail', N'(495) 4381553', N'tdebruinw@github.io', N'Human Resources Assistant IV')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (34, N'Adella', N'383 Service Terrace', N'(498) 8853954', N'aenderwickx@altervista.org', N'Administrative Officer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (35, N'Herrick', N'3 Stang Pass', N'(657) 6343140', N'hmablesony@amazonaws.com', N'Account Coordinator')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (36, N'Tally', N'26 Ridge Oak Court', N'(651) 4720232', N'tkennettz@blinklist.com', N'Clinical Specialist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (37, N'Nichole', N'60087 Carpenter Road', N'(518) 6912612', N'nmccarney10@cyberchimps.com', N'Product Engineer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (38, N'Hinda', N'8547 Spenser Crossing', N'(359) 8608189', N'hgurney11@mlb.com', N'Operator')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (39, N'Cord', N'2 Annamark Drive', N'(241) 2531005', N'cilyinykh12@utexas.edu', N'Editor')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (40, N'Odetta', N'4698 Golf View Court', N'(945) 9801102', N'oyedy13@freewebs.com', N'Chemical Engineer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (41, N'Danyette', N'88 Johnson Crossing', N'(683) 4564658', N'darnould14@fotki.com', N'Teacher')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (42, N'Binky', N'9706 Golden Leaf Hill', N'(618) 1131141', N'bwestcarr15@soup.io', N'Recruiter')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (43, N'Terri', N'917 Parkside Avenue', N'(348) 5364557', N'ttoke16@weibo.com', N'Senior Cost Accountant')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (44, N'Cam', N'1123 Duke Avenue', N'(353) 6516933', N'cgayforth17@unesco.org', N'Financial Advisor')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (45, N'Dosi', N'63579 Vera Court', N'(317) 7555907', N'dbancroft18@fc2.com', N'Structural Engineer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (46, N'Syd', N'4077 Nobel Junction', N'(850) 5079380', N'sarnau19@com.com', N'Compensation Analyst')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (47, N'Dunn', N'6915 Fallview Drive', N'(408) 9222117', N'dmacanellye1a@cam.ac.uk', N'Senior Editor')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (48, N'Darill', N'471 Anderson Hill', N'(391) 9948230', N'dgirvin1b@mozilla.org', N'VP Marketing')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (49, N'Tonye', N'71518 Moulton Crossing', N'(812) 8458152', N'tdabnor1c@cmu.edu', N'Operator')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (50, N'Pryce', N'4207 Lighthouse Bay Drive', N'(937) 9712589', N'pbille1d@nhs.uk', N'Internal Auditor')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (51, N'Derward', N'69 Clemons Lane', N'(354) 9661688', N'djeal1e@yolasite.com', N'Database Administrator II')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (52, N'Doretta', N'9 Stang Plaza', N'(139) 6350471', N'dhedworth1f@loc.gov', N'Biostatistician II')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (53, N'Bobbette', N'957 Colorado Plaza', N'(864) 5206207', N'bsteuart1g@yolasite.com', N'Chief Design Engineer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (54, N'Stafford', N'9194 Rowland Street', N'(961) 3492036', N'slabbet1h@sfgate.com', N'Senior Developer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (55, N'Bennett', N'6114 Bashford Terrace', N'(149) 1531337', N'bthreadgill1i@home.pl', N'Health Coach II')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (56, N'Gifford', N'2 Scoville Pass', N'(486) 5942790', N'grobbeke1j@whitehouse.gov', N'Actuary')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (57, N'Cass', N'5 Katie Circle', N'(280) 2058853', N'cgrandison1k@shop-pro.jp', N'Help Desk Operator')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (58, N'Kiri', N'815 Cardinal Hill', N'(404) 1133006', N'knathon1l@sohu.com', N'Assistant Professor')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (59, N'Latisha', N'9 Bartillon Lane', N'(896) 7624654', N'ldipietro1m@123-reg.co.uk', N'Database Administrator IV')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (60, N'Mattie', N'476 Northwestern Lane', N'(225) 3009706', N'mwraith1n@a8.net', N'Software Consultant')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (61, N'Lizzie', N'36159 Bay Drive', N'(558) 1584033', N'lklulicek1o@cisco.com', N'Chief Design Engineer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (62, N'Charissa', N'13743 Aberg Street', N'(672) 4944863', N'cstodhart1p@salon.com', N'Software Consultant')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (63, N'Bella', N'8499 Macpherson Way', N'(537) 5121289', N'bbollam1q@bloglines.com', N'Accounting Assistant III')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (64, N'Karlotte', N'328 Riverside Pass', N'(547) 7868520', N'kberendsen1r@ted.com', N'Tax Accountant')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (65, N'Jarrid', N'16151 Leroy Center', N'(670) 6741423', N'jdjekic1s@google.fr', N'Senior Quality Engineer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (66, N'Kellsie', N'46 Toban Plaza', N'(880) 3339093', N'kmanzell1t@gnu.org', N'VP Quality Control')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (67, N'Timotheus', N'13423 Clove Drive', N'(426) 4959725', N'tbricklebank1u@baidu.com', N'Senior Quality Engineer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (68, N'Brenda', N'26515 Arapahoe Alley', N'(700) 5291526', N'bdibbe1v@admin.ch', N'Help Desk Operator')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (69, N'Marget', N'56 Lakewood Pass', N'(736) 6407453', N'mmaccrosson1w@joomla.org', N'Physical Therapy Assistant')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (70, N'Kellen', N'0 Kings Point', N'(506) 4769005', N'kgeere1x@stumbleupon.com', N'Engineer I')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (71, N'Alano', N'33097 Shelley Road', N'(940) 6795242', N'awebsdale1y@drupal.org', N'Research Assistant III')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (72, N'Karel', N'70 Erie Plaza', N'(513) 9805492', N'kmorcom1z@accuweather.com', N'Information Systems Manager')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (73, N'Johann', N'6255 Lakewood Gardens Drive', N'(125) 5276155', N'jpimlett20@sakura.ne.jp', N'Financial Advisor')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (74, N'Ramsay', N'74325 Acker Junction', N'(269) 8103375', N'rgislebert21@ucoz.com', N'Human Resources Assistant IV')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (75, N'Leroy', N'00900 Center Park', N'(278) 3181406', N'lgingles22@list-manage.com', N'Marketing Assistant')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (76, N'Jareb', N'8387 Schurz Hill', N'(783) 7034393', N'jgersam23@cnn.com', N'Marketing Manager')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (77, N'Claudie', N'4 Wayridge Point', N'(736) 4849519', N'cgorusso24@xinhuanet.com', N'Administrative Assistant I')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (78, N'Tabbitha', N'6 Logan Crossing', N'(205) 1797987', N'tchampniss25@ftc.gov', N'Cost Accountant')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (79, N'Deni', N'49 Mallard Parkway', N'(525) 9851815', N'dirving26@techcrunch.com', N'Sales Representative')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (80, N'Julita', N'545 Clove Trail', N'(862) 3728748', N'jdaveley27@forbes.com', N'Help Desk Operator')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (81, N'Mikaela', N'15330 Manitowish Center', N'(632) 8458744', N'mskones28@google.de', N'Environmental Specialist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (82, N'Kenn', N'9896 Continental Alley', N'(910) 7998711', N'kbloschke29@va.gov', N'Operator')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (83, N'Killie', N'07216 Kipling Parkway', N'(940) 7174479', N'kfayerbrother2a@stanford.edu', N'Pharmacist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (84, N'Abbe', N'94 Johnson Circle', N'(493) 4299072', N'aspincke2b@a8.net', N'Programmer II')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (85, N'Daveen', N'922 Di Loreto Trail', N'(317) 8687298', N'dbaudinelli2c@exblog.jp', N'Developer III')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (86, N'Cass', N'6 Susan Park', N'(111) 2833580', N'cross2d@cbc.ca', N'Graphic Designer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (87, N'Alfreda', N'98 Goodland Parkway', N'(435) 7026918', N'agoggen2e@google.ca', N'Help Desk Technician')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (88, N'Alex', N'83360 Dahle Road', N'(398) 1841039', N'ageleman2f@telegraph.co.uk', N'Geologist IV')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (89, N'Edgardo', N'648 Manitowish Terrace', N'(937) 1628826', N'edrayton2g@examiner.com', N'Research Associate')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (90, N'Emmye', N'6538 Debs Trail', N'(618) 1657094', N'emonro2h@uol.com.br', N'Safety Technician II')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (91, N'Min', N'91 Portage Point', N'(565) 4294367', N'mkepe2i@nhs.uk', N'Staff Scientist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (92, N'Niki', N'9 Manley Plaza', N'(192) 5754026', N'nbuttle2j@sciencedirect.com', N'Actuary')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (93, N'Abner', N'960 Steensland Plaza', N'(708) 1179288', N'amacparland2k@sciencedaily.com', N'Paralegal')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (94, N'Teddy', N'020 Esker Drive', N'(935) 6563274', N'traffan2l@yelp.com', N'Human Resources Manager')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (95, N'Salomon', N'0245 Lindbergh Lane', N'(283) 3655996', N'spippard2m@prnewswire.com', N'Geological Engineer')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (96, N'Obie', N'0937 Miller Drive', N'(775) 7486556', N'odebanke2n@epa.gov', N'Marketing Manager')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (97, N'Cymbre', N'475 Glacier Hill Terrace', N'(159) 4237511', N'cgrzes2o@photobucket.com', N'Occupational Therapist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (98, N'Sibylle', N'327 Bluejay Place', N'(669) 3205308', N'sscripps2p@psu.edu', N'VP Marketing')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (99, N'Edin', N'00 Manley Point', N'(170) 7140651', N'ejelliman2q@wp.com', N'Senior Quality Engineer')
GO
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (100, N'Ellsworth', N'11 Namekagon Park', N'(360) 2003385', N'edominguez2r@photobucket.com', N'Occupational Therapist')
INSERT [dbo].[Medico] ([idMedico], [Nombre], [Direccion], [Telefono], [Correo], [Profesion]) VALUES (101, N'John Linares', N'El Salvador, San Salvador', N'75809621', N'john@correo.com', N'informatico')
SET IDENTITY_INSERT [dbo].[Medico] OFF
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([idRol], [Nombre], [Descripcion], [Condicion]) VALUES (1, N'Administrador', N'Administrador de sistema', 1)
INSERT [dbo].[Rol] ([idRol], [Nombre], [Descripcion], [Condicion]) VALUES (2, N'Usuario', N'Usuario de sistema', 1)
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [Nombre], [Telefono], [Correo], [Direccion], [idRol], [password_hash], [password_salt], [Condicion]) VALUES (1, N'John', N'75809621', N'john@gmail.com', N'Santa Ana, El Salvador', 2, 0x2732DED2A6B24B1DA9E3444AD64A72C6C2C79C7E8D0E138AADCC1B6F6BEC5E0990C73F57741F4C123836CC4F5D82A8FA5FE134A5AC0DA8CEE8AFE7FBD55D3865, 0x3E744F5DD23D7D8FA853FBA190518107CEBAF7257C84AFEDC744DDD2CB24BB6CA18CA67143B986BC6BF211F0D4B77ECB32E297D7A86BAE04C20F7066E2069387DE20345685523DA220F480D7ADDA9E59AED49BCA81B9886A8EAA6AB42499494E7326D0A074466145D8BC1B95E389CC7593CECA90FAF85AB6D722B22762E5E552, 1)
INSERT [dbo].[Usuario] ([idUsuario], [Nombre], [Telefono], [Correo], [Direccion], [idRol], [password_hash], [password_salt], [Condicion]) VALUES (2, N'Karla Lopez', N'98765432', N'Karla@gmail.com', N'Santa Tecla, El Salvador', 1, 0x058A178AB6E0747F90F67A61F0983037BB80A1BC17ABAB5221B9DC721FD5D11EDF4FC55B565361FFC956CB6D016F17E4F7366FB0DA7ED091BBD299432B37C1A8, 0xCD55E7CA30B46DCBDBA851841642E9F635AAB209F7C4B28E3D112F3876D9134171006C0F49038B06F105AABC8165BBEE2F22AA251F4BC7E5AFBA36106853305510B850E402C2C59DEC214A4CEF36B2FC30778A93233EB940567A993BC1F7E5D27A2AA686C0610AD82C5C22708F924929221E01248F2F299CF7EC417AA656B491, 1)
INSERT [dbo].[Usuario] ([idUsuario], [Nombre], [Telefono], [Correo], [Direccion], [idRol], [password_hash], [password_salt], [Condicion]) VALUES (3, N'Carlos Paredes', N'58585858', N'Carlos@gmail.com', N'SantaAna,El Salvador', 2, 0xA8EEDBB8342505B46BF2A57C25E7137A0D73D1D69DB41A75CE6BF4F7457FF539677BA7074DADFDA66B42BD212E61D6689C430750ADAFEA612E58648B992C7FF8, 0x214D15ABF30906013FF330C306F6D9620E1E337A02CC72A2CFB712B2D924DCFE2DABDD38C18A1862CA7478162916B94D786C1DDF85F24EEE81B4B48836CA5FD27B0FBB9E2CFF935A0E848066B9B8263285B611BEC977F23FB326D0384AB1F35162F16233540AB11D663A7F564B6892FD96CFBF1F338007D31EF3A288D61C1F3E, 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Expediente]  WITH CHECK ADD  CONSTRAINT [FK__Expedient__idMed__3E52440B] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[Expediente] CHECK CONSTRAINT [FK__Expedient__idMed__3E52440B]
GO
ALTER TABLE [dbo].[Expediente]  WITH NOCHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Mapa]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[Usuario]  WITH NOCHECK ADD  CONSTRAINT [FK__Usuario__idRol__5DCAEF64] FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK__Usuario__idRol__5DCAEF64]
GO
USE [master]
GO
ALTER DATABASE [MedAssistance] SET  READ_WRITE 
GO
