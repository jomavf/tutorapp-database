USE [master]
GO
/****** Object:  Database [TutorApp]    Script Date: 11/11/2019 11:41:25 PM ******/
CREATE DATABASE [TutorApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TutorApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TutorApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [TutorApp_Contratos] 
( NAME = N'TutorApp_Contratos_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TutorApp_Contratos_1.ndf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 20480KB ),
( NAME = N'TutorApp_Contratos_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TutorApp_Contratos_2.ndf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 20480KB ), 
 FILEGROUP [TutorApp_Mensajes] 
( NAME = N'TutorApp_Mensajes_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TutorApp_Mensajes_1.ndf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 30720KB ),
( NAME = N'TutorApp_Mensajes_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TutorApp_Mensajes_2.ndf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 30720KB )
 LOG ON 
( NAME = N'TutorApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TutorApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TutorApp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TutorApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TutorApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TutorApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TutorApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TutorApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TutorApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [TutorApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TutorApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TutorApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TutorApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TutorApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TutorApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TutorApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TutorApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TutorApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TutorApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TutorApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TutorApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TutorApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TutorApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TutorApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TutorApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TutorApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TutorApp] SET RECOVERY FULL 
GO
ALTER DATABASE [TutorApp] SET  MULTI_USER 
GO
ALTER DATABASE [TutorApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TutorApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TutorApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TutorApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TutorApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TutorApp', N'ON'
GO
ALTER DATABASE [TutorApp] SET QUERY_STORE = OFF
GO
USE [TutorApp]
GO
/****** Object:  UserDefinedDataType [dbo].[cel]    Script Date: 11/11/2019 11:41:25 PM ******/
CREATE TYPE [dbo].[cel] FROM [char](9) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[dni]    Script Date: 11/11/2019 11:41:25 PM ******/
CREATE TYPE [dbo].[dni] FROM [char](8) NULL
GO
/****** Object:  Table [dbo].[calificacion]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calificacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[calificacion_final] [decimal](6, 2) NULL,
	[numero_calificaciones] [int] NULL,
	[servicio_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comentario]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comentario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenido] [varchar](500) NULL,
	[fecha_creacion] [datetime2](7) NULL,
	[contrato_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contrato]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contrato](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[hora_inicio] [time](7) NULL,
	[hora_fin] [time](7) NULL,
	[comision] [decimal](6, 2) NULL,
	[estudiante_id] [int] NULL,
	[servicio_id] [int] NULL,
	[pago_realizado] [bit] NULL,
	[fecha_pago_realizado] [datetime] NULL,
	[confirmacion_tutor] [bit] NULL,
	[calificacion] [tinyint] NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [TutorApp_Contratos]
) ON [TutorApp_Contratos]
GO
/****** Object:  Table [dbo].[devolucion]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[devolucion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[monto] [decimal](9, 2) NULL,
	[fecha_devolucion] [datetime] NULL,
	[estado] [bit] NULL,
	[estudiante_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dia]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dia] [varchar](15) NULL,
	[hora_inicio] [time](7) NULL,
	[hora_fin] [time](7) NULL,
	[horario_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[especialidad]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NULL,
	[descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[especialidad_tutor]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialidad_tutor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tutor_id] [int] NULL,
	[especialidad_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estudiante]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudiante](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_id] [int] NULL,
	[estado] [bit] NULL,
	[servicios_contratados] [int] NULL,
	[servicios_contratados_semanales] [tinyint] NULL,
	[descuento] [decimal](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[horario]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[horario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tutor_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mensaje]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mensaje](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_envio] [datetime2](7) NULL,
	[fecha_leido] [datetime2](7) NULL,
	[contenido] [varchar](500) NULL,
	[tutor_id] [int] NULL,
	[estudiante_id] [int] NULL,
	[contrato_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [TutorApp_Contratos]
) ON [TutorApp_Contratos]
GO
/****** Object:  Table [dbo].[pago]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[monto] [decimal](6, 2) NULL,
	[tipo_pago_id] [int] NULL,
	[servicio_id] [int] NULL,
	[estudiante_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preferencia]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preferencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ubigeo_id] [int] NULL,
	[usuario_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[queja]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[queja](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[aprobada] [bit] NULL,
	[descripcion] [varchar](500) NULL,
	[contrato_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicio]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
	[costo] [decimal](8, 2) NULL,
	[estado] [bit] NULL,
	[tutor_id] [int] NULL,
	[especialidad_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_pago]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_pago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](10) NULL,
	[descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tutor]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_id] [int] NULL,
	[estado] [bit] NULL,
	[quejas_semanales] [tinyint] NULL,
	[quejas_totales] [int] NULL,
	[comision] [decimal](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tutores_baneados]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutores_baneados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tutor_id] [int] NULL,
	[fecha_quinta_queja] [datetime] NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ubigeo]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ubigeo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [char](6) NULL,
	[distrito] [varchar](20) NULL,
	[provincia] [varchar](20) NULL,
	[departamento] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 11/11/2019 11:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](20) NULL,
	[apellidos] [varchar](20) NULL,
	[edad] [tinyint] NULL,
	[dni] [dbo].[dni] NULL,
	[fecha_nacimiento] [date] NULL,
	[genero] [bit] NULL,
	[direccion] [varchar](100) NULL,
	[codigo_postal] [char](5) NULL,
	[telefono] [char](7) NULL,
	[celular] [dbo].[cel] NULL,
	[usuario] [varchar](20) NULL,
	[password] [varchar](150) NULL,
	[correo] [varchar](30) NULL,
	[ubigeo_id] [int] NULL,
	[preferencia_id] [int] NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[calificacion] ON 
GO
INSERT [dbo].[calificacion] ([id], [calificacion_final], [numero_calificaciones], [servicio_id]) VALUES (1, CAST(4.50 AS Decimal(6, 2)), 2, 1)
GO
INSERT [dbo].[calificacion] ([id], [calificacion_final], [numero_calificaciones], [servicio_id]) VALUES (2, CAST(0.00 AS Decimal(6, 2)), 0, 2)
GO
INSERT [dbo].[calificacion] ([id], [calificacion_final], [numero_calificaciones], [servicio_id]) VALUES (3, CAST(0.00 AS Decimal(6, 2)), 0, 3)
GO
INSERT [dbo].[calificacion] ([id], [calificacion_final], [numero_calificaciones], [servicio_id]) VALUES (4, CAST(0.00 AS Decimal(6, 2)), 0, 4)
GO
INSERT [dbo].[calificacion] ([id], [calificacion_final], [numero_calificaciones], [servicio_id]) VALUES (5, CAST(0.00 AS Decimal(6, 2)), 0, 6)
GO
SET IDENTITY_INSERT [dbo].[calificacion] OFF
GO
SET IDENTITY_INSERT [dbo].[contrato] ON 
GO
INSERT [dbo].[contrato] ([id], [fecha_inicio], [fecha_fin], [hora_inicio], [hora_fin], [comision], [estudiante_id], [servicio_id], [pago_realizado], [fecha_pago_realizado], [confirmacion_tutor], [calificacion], [estado]) VALUES (2, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, CAST(N'2019-11-04T17:32:51.050' AS DateTime), 1, 3, 1)
GO
INSERT [dbo].[contrato] ([id], [fecha_inicio], [fecha_fin], [hora_inicio], [hora_fin], [comision], [estudiante_id], [servicio_id], [pago_realizado], [fecha_pago_realizado], [confirmacion_tutor], [calificacion], [estado]) VALUES (3, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, CAST(N'2019-11-04T17:35:29.317' AS DateTime), 0, 5, NULL)
GO
INSERT [dbo].[contrato] ([id], [fecha_inicio], [fecha_fin], [hora_inicio], [hora_fin], [comision], [estudiante_id], [servicio_id], [pago_realizado], [fecha_pago_realizado], [confirmacion_tutor], [calificacion], [estado]) VALUES (4, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 1, 5, 1)
GO
INSERT [dbo].[contrato] ([id], [fecha_inicio], [fecha_fin], [hora_inicio], [hora_fin], [comision], [estudiante_id], [servicio_id], [pago_realizado], [fecha_pago_realizado], [confirmacion_tutor], [calificacion], [estado]) VALUES (5, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 0, 5, 0)
GO
SET IDENTITY_INSERT [dbo].[contrato] OFF
GO
SET IDENTITY_INSERT [dbo].[devolucion] ON 
GO
INSERT [dbo].[devolucion] ([id], [monto], [fecha_devolucion], [estado], [estudiante_id]) VALUES (1, CAST(12.99 AS Decimal(9, 2)), CAST(N'2019-11-10T22:20:33.953' AS DateTime), 1, NULL)
GO
INSERT [dbo].[devolucion] ([id], [monto], [fecha_devolucion], [estado], [estudiante_id]) VALUES (2, CAST(12.99 AS Decimal(9, 2)), CAST(N'2019-11-10T22:23:13.210' AS DateTime), 1, NULL)
GO
INSERT [dbo].[devolucion] ([id], [monto], [fecha_devolucion], [estado], [estudiante_id]) VALUES (3, CAST(12.99 AS Decimal(9, 2)), CAST(N'2019-11-10T22:23:32.433' AS DateTime), 1, NULL)
GO
INSERT [dbo].[devolucion] ([id], [monto], [fecha_devolucion], [estado], [estudiante_id]) VALUES (4, CAST(12.99 AS Decimal(9, 2)), CAST(N'2019-11-10T22:25:08.570' AS DateTime), 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[devolucion] OFF
GO
SET IDENTITY_INSERT [dbo].[especialidad] ON 
GO
INSERT [dbo].[especialidad] ([id], [nombre], [descripcion]) VALUES (1, N'Matematicas', N'Matematica basica de universidad')
GO
INSERT [dbo].[especialidad] ([id], [nombre], [descripcion]) VALUES (2, N'Calculo I', N'Calculo I de universidad')
GO
INSERT [dbo].[especialidad] ([id], [nombre], [descripcion]) VALUES (3, N'Lenguaje', N'Lenguaje de colegio secundaria')
GO
INSERT [dbo].[especialidad] ([id], [nombre], [descripcion]) VALUES (4, N'AUTOCAD', N'Programa informatico para ing civil')
GO
SET IDENTITY_INSERT [dbo].[especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[especialidad_tutor] ON 
GO
INSERT [dbo].[especialidad_tutor] ([id], [tutor_id], [especialidad_id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[especialidad_tutor] ([id], [tutor_id], [especialidad_id]) VALUES (3, 2, 1)
GO
INSERT [dbo].[especialidad_tutor] ([id], [tutor_id], [especialidad_id]) VALUES (6, 3, 3)
GO
INSERT [dbo].[especialidad_tutor] ([id], [tutor_id], [especialidad_id]) VALUES (7, 4, 4)
GO
INSERT [dbo].[especialidad_tutor] ([id], [tutor_id], [especialidad_id]) VALUES (9, 5, 4)
GO
SET IDENTITY_INSERT [dbo].[especialidad_tutor] OFF
GO
SET IDENTITY_INSERT [dbo].[estudiante] ON 
GO
INSERT [dbo].[estudiante] ([id], [usuario_id], [estado], [servicios_contratados], [servicios_contratados_semanales], [descuento]) VALUES (1, 7, 1, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[estudiante] OFF
GO
SET IDENTITY_INSERT [dbo].[pago] ON 
GO
INSERT [dbo].[pago] ([id], [monto], [tipo_pago_id], [servicio_id], [estudiante_id]) VALUES (1, CAST(12.99 AS Decimal(6, 2)), NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[pago] OFF
GO
SET IDENTITY_INSERT [dbo].[queja] ON 
GO
INSERT [dbo].[queja] ([id], [fecha], [aprobada], [descripcion], [contrato_id]) VALUES (3, CAST(N'2019-11-10T17:34:31.377' AS DateTime), 1, N'queja 1', 2)
GO
SET IDENTITY_INSERT [dbo].[queja] OFF
GO
SET IDENTITY_INSERT [dbo].[servicio] ON 
GO
INSERT [dbo].[servicio] ([id], [nombre], [descripcion], [costo], [estado], [tutor_id], [especialidad_id]) VALUES (1, N'Matematicas en 1 semana', N'', CAST(12.99 AS Decimal(8, 2)), 1, 1, 1)
GO
INSERT [dbo].[servicio] ([id], [nombre], [descripcion], [costo], [estado], [tutor_id], [especialidad_id]) VALUES (2, N'Lenguajes de programacion', N'Aqui aprenderas muchos paradigmas de programacion', CAST(2.33 AS Decimal(8, 2)), 1, 2, 2)
GO
INSERT [dbo].[servicio] ([id], [nombre], [descripcion], [costo], [estado], [tutor_id], [especialidad_id]) VALUES (3, N'TDP', N'Aqui aprenderas a ser exclavo', CAST(2.33 AS Decimal(8, 2)), 1, 3, 3)
GO
INSERT [dbo].[servicio] ([id], [nombre], [descripcion], [costo], [estado], [tutor_id], [especialidad_id]) VALUES (4, N'SQL server', N'Aqui aprenderas todo sobre sql server ', CAST(2.33 AS Decimal(8, 2)), 0, 4, 4)
GO
INSERT [dbo].[servicio] ([id], [nombre], [descripcion], [costo], [estado], [tutor_id], [especialidad_id]) VALUES (6, N'Administracio de la informacion', N'Aqui aprenderas data mining', CAST(2.33 AS Decimal(8, 2)), 1, 5, 4)
GO
SET IDENTITY_INSERT [dbo].[servicio] OFF
GO
SET IDENTITY_INSERT [dbo].[tutor] ON 
GO
INSERT [dbo].[tutor] ([id], [usuario_id], [estado], [quejas_semanales], [quejas_totales], [comision]) VALUES (1, 8, 1, 1, 1, CAST(0.10 AS Decimal(6, 2)))
GO
INSERT [dbo].[tutor] ([id], [usuario_id], [estado], [quejas_semanales], [quejas_totales], [comision]) VALUES (2, 7, 1, 2, 2, CAST(0.10 AS Decimal(6, 2)))
GO
INSERT [dbo].[tutor] ([id], [usuario_id], [estado], [quejas_semanales], [quejas_totales], [comision]) VALUES (3, 11, 1, 1, 5, CAST(0.10 AS Decimal(6, 2)))
GO
INSERT [dbo].[tutor] ([id], [usuario_id], [estado], [quejas_semanales], [quejas_totales], [comision]) VALUES (4, 12, 1, 5, 10, CAST(0.10 AS Decimal(6, 2)))
GO
INSERT [dbo].[tutor] ([id], [usuario_id], [estado], [quejas_semanales], [quejas_totales], [comision]) VALUES (5, 13, 1, 0, 3, CAST(0.10 AS Decimal(6, 2)))
GO
SET IDENTITY_INSERT [dbo].[tutor] OFF
GO
SET IDENTITY_INSERT [dbo].[tutores_baneados] ON 
GO
INSERT [dbo].[tutores_baneados] ([id], [tutor_id], [fecha_quinta_queja], [estado]) VALUES (2, 1, CAST(N'2019-11-04T22:08:31.820' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[tutores_baneados] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 
GO
INSERT [dbo].[usuario] ([id], [nombres], [apellidos], [edad], [dni], [fecha_nacimiento], [genero], [direccion], [codigo_postal], [telefono], [celular], [usuario], [password], [correo], [ubigeo_id], [preferencia_id], [estado], [fecha_creacion]) VALUES (7, N'jose', N'veliz', 23, N'70631655', CAST(N'2012-02-21' AS Date), 1, N'Lote 23 SJL Mariscal', N'54458', N'4595524', N'995478452', N'', N'', N'', NULL, NULL, 1, CAST(N'2019-11-11T22:19:50.383' AS DateTime))
GO
INSERT [dbo].[usuario] ([id], [nombres], [apellidos], [edad], [dni], [fecha_nacimiento], [genero], [direccion], [codigo_postal], [telefono], [celular], [usuario], [password], [correo], [ubigeo_id], [preferencia_id], [estado], [fecha_creacion]) VALUES (8, N'carlos', N'perez', 23, N'70631655', CAST(N'2012-02-21' AS Date), 1, N'Fiscalia 265', N'12345', N'4594424', N'995475485', N'', N'', N'', NULL, NULL, 1, CAST(N'2019-11-11T22:20:20.400' AS DateTime))
GO
INSERT [dbo].[usuario] ([id], [nombres], [apellidos], [edad], [dni], [fecha_nacimiento], [genero], [direccion], [codigo_postal], [telefono], [celular], [usuario], [password], [correo], [ubigeo_id], [preferencia_id], [estado], [fecha_creacion]) VALUES (11, N'jonathan', N'salaverry', 24, N'45875121', CAST(N'1995-01-12' AS Date), 1, N'San borja sur', N'24510', N'1597536', N'995485632', N'usuario', N'password', N'jonathan_sa@gmail.com', NULL, NULL, 1, CAST(N'2019-11-11T22:12:29.720' AS DateTime))
GO
INSERT [dbo].[usuario] ([id], [nombres], [apellidos], [edad], [dni], [fecha_nacimiento], [genero], [direccion], [codigo_postal], [telefono], [celular], [usuario], [password], [correo], [ubigeo_id], [preferencia_id], [estado], [fecha_creacion]) VALUES (12, N'Graciela', N'Servantez', 24, N'51214896', CAST(N'1990-02-20' AS Date), 0, N'San borja norte', N'12522', N'1235454', N'994523658', N'usuario', N'password', N'gra_ser@gmail.com', NULL, NULL, 1, CAST(N'2019-11-11T22:15:03.500' AS DateTime))
GO
INSERT [dbo].[usuario] ([id], [nombres], [apellidos], [edad], [dni], [fecha_nacimiento], [genero], [direccion], [codigo_postal], [telefono], [celular], [usuario], [password], [correo], [ubigeo_id], [preferencia_id], [estado], [fecha_creacion]) VALUES (13, N'Freddie', N'Mercury', 65, N'12456598', CAST(N'1990-12-24' AS Date), 1, N'San juan miraflores', N'32555', N'8855224', N'99456582 ', N'usuario', N'password', N'freidie_rock@gmail.com', NULL, NULL, 1, CAST(N'2019-11-11T22:15:03.533' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[calificacion] ADD  CONSTRAINT [DF_calificacion_calificacion_final]  DEFAULT ((0)) FOR [calificacion_final]
GO
ALTER TABLE [dbo].[calificacion] ADD  CONSTRAINT [DF_calificacion_numero_calificaciones]  DEFAULT ((0)) FOR [numero_calificaciones]
GO
ALTER TABLE [dbo].[contrato] ADD  DEFAULT ((0)) FOR [pago_realizado]
GO
ALTER TABLE [dbo].[contrato] ADD  DEFAULT (NULL) FOR [calificacion]
GO
ALTER TABLE [dbo].[contrato] ADD  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [dbo].[devolucion] ADD  DEFAULT (getdate()) FOR [fecha_devolucion]
GO
ALTER TABLE [dbo].[devolucion] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[estudiante] ADD  DEFAULT ((0)) FOR [servicios_contratados]
GO
ALTER TABLE [dbo].[estudiante] ADD  DEFAULT ((0)) FOR [servicios_contratados_semanales]
GO
ALTER TABLE [dbo].[estudiante] ADD  DEFAULT ((0)) FOR [descuento]
GO
ALTER TABLE [dbo].[queja] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[tutor] ADD  DEFAULT ((0.15)) FOR [comision]
GO
ALTER TABLE [dbo].[tutores_baneados] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[calificacion]  WITH CHECK ADD FOREIGN KEY([servicio_id])
REFERENCES [dbo].[servicio] ([id])
GO
ALTER TABLE [dbo].[comentario]  WITH CHECK ADD FOREIGN KEY([contrato_id])
REFERENCES [dbo].[contrato] ([id])
GO
ALTER TABLE [dbo].[contrato]  WITH CHECK ADD FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[estudiante] ([id])
GO
ALTER TABLE [dbo].[contrato]  WITH CHECK ADD FOREIGN KEY([servicio_id])
REFERENCES [dbo].[servicio] ([id])
GO
ALTER TABLE [dbo].[devolucion]  WITH CHECK ADD FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[estudiante] ([id])
GO
ALTER TABLE [dbo].[dia]  WITH CHECK ADD FOREIGN KEY([horario_id])
REFERENCES [dbo].[horario] ([id])
GO
ALTER TABLE [dbo].[especialidad_tutor]  WITH CHECK ADD FOREIGN KEY([especialidad_id])
REFERENCES [dbo].[especialidad] ([id])
GO
ALTER TABLE [dbo].[especialidad_tutor]  WITH CHECK ADD FOREIGN KEY([tutor_id])
REFERENCES [dbo].[tutor] ([id])
GO
ALTER TABLE [dbo].[estudiante]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[horario]  WITH CHECK ADD FOREIGN KEY([tutor_id])
REFERENCES [dbo].[tutor] ([id])
GO
ALTER TABLE [dbo].[mensaje]  WITH CHECK ADD FOREIGN KEY([contrato_id])
REFERENCES [dbo].[contrato] ([id])
GO
ALTER TABLE [dbo].[mensaje]  WITH CHECK ADD FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[estudiante] ([id])
GO
ALTER TABLE [dbo].[mensaje]  WITH CHECK ADD FOREIGN KEY([tutor_id])
REFERENCES [dbo].[tutor] ([id])
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[estudiante] ([id])
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD FOREIGN KEY([servicio_id])
REFERENCES [dbo].[servicio] ([id])
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD FOREIGN KEY([tipo_pago_id])
REFERENCES [dbo].[tipo_pago] ([id])
GO
ALTER TABLE [dbo].[preferencia]  WITH CHECK ADD FOREIGN KEY([ubigeo_id])
REFERENCES [dbo].[ubigeo] ([id])
GO
ALTER TABLE [dbo].[preferencia]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[queja]  WITH CHECK ADD FOREIGN KEY([contrato_id])
REFERENCES [dbo].[contrato] ([id])
GO
ALTER TABLE [dbo].[servicio]  WITH CHECK ADD FOREIGN KEY([especialidad_id])
REFERENCES [dbo].[especialidad] ([id])
GO
ALTER TABLE [dbo].[servicio]  WITH CHECK ADD FOREIGN KEY([tutor_id])
REFERENCES [dbo].[tutor] ([id])
GO
ALTER TABLE [dbo].[tutor]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD FOREIGN KEY([ubigeo_id])
REFERENCES [dbo].[ubigeo] ([id])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD FOREIGN KEY([ubigeo_id])
REFERENCES [dbo].[ubigeo] ([id])
GO
/****** Object:  StoredProcedure [dbo].[SP_CambiarEstadoTutor]    Script Date: 11/11/2019 11:41:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CambiarEstadoTutor] 
    @tutor_id int
AS
	declare @estado_tutor bit
	select @estado_tutor = t.estado from tutor t where id = @tutor_id
	print @tutor_id
	print @estado_tutor
	if @estado_tutor = 1
		begin
			print 'entre alla'
			update tutor set estado = 0 where id = @tutor_id
		end
	if @estado_tutor = 0
		begin 
			print 'entre aqui'
			update tutor set estado = 1 where id = @tutor_id
		end
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearContrato]    Script Date: 11/11/2019 11:41:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_CrearContrato]
@servicio_id as int,
@estudiante_id as int
as
insert into contrato (estudiante_id,servicio_id,pago_realizado,fecha_pago_realizado) values (@estudiante_id,@servicio_id,1,GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[SP_EncontrarMejorTutor]    Script Date: 11/11/2019 11:41:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EncontrarMejorTutor] 
    @contrato_id int,
	@antiguo_tutor_especialidad int
AS
    declare @calificacion decimal(6,2)
	select top(1) @calificacion = calificacion_final from servicio s join calificacion c on s.id = c.servicio_id where s.especialidad_id = @antiguo_tutor_especialidad order by c.calificacion_final desc
	
	if @calificacion != 0 and @calificacion is not null
		begin 
			declare @servicio_a_brindar int
			select top(1) @servicio_a_brindar = s.id from servicio s join calificacion c on s.id = c.servicio_id where s.especialidad_id = @antiguo_tutor_especialidad order by c.calificacion_final desc 
			return @servicio_a_brindar 
		end
	else 
		begin 
			return 0
		end
return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_ReiniciarServiciosContratado]    Script Date: 11/11/2019 11:41:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ReiniciarServiciosContratado] 
    @estudiante_id int
AS
    update estudiante set servicios_contratados_semanales = 0 where id = @estudiante_id
GO
/****** Object:  Trigger [dbo].[TR_ActualizarCalificacion]    Script Date: 11/11/2019 11:41:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_ActualizarCalificacion]
-- La calificacion solo podra ser ingresada una sola vez
    ON [dbo].[contrato]
    FOR UPDATE
    AS
    BEGIN
    SET NOCOUNT ON
	declare @calificacion_pasada tinyint
	select @calificacion_pasada = calificacion from deleted d
	declare @calificacion_presente tinyint
	select @calificacion_presente = calificacion from inserted i
	declare @numero_calificaciones int
	select @numero_calificaciones = numero_calificaciones from calificacion 

	print @calificacion_pasada
	print @calificacion_presente
	if (@calificacion_pasada is NULL and @calificacion_presente is not NULL)
		begin
			print 'Entre al if' 
		
			declare @calificacion_actual decimal(6,2)
			select @calificacion_actual = calificacion_final from calificacion
			declare @calificacion_final decimal(6,2)
			set @numero_calificaciones = @numero_calificaciones + 1
			set @calificacion_final = (@calificacion_actual + @calificacion_presente) / @numero_calificaciones
			update calificacion set calificacion_final = @calificacion_final, numero_calificaciones = @numero_calificaciones
		end
    END
GO
ALTER TABLE [dbo].[contrato] ENABLE TRIGGER [TR_ActualizarCalificacion]
GO
/****** Object:  Trigger [dbo].[TR_VerificarContrato]    Script Date: 11/11/2019 11:41:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_VerificarContrato]
    ON [dbo].[contrato]
    FOR UPDATE
    AS
	BEGIN
    SET NOCOUNT ON
	declare @confimacion bit
	select @confimacion = confirmacion_tutor from inserted
	if @confimacion = 0
		begin 
			declare @nuevo_servicio int
			declare @contrato_id int
			select @contrato_id = id from inserted
			declare @id_antiguo_tutor int
			select @id_antiguo_tutor = t.id from contrato c join servicio s on c.servicio_id = s.id join tutor t on s.tutor_id = t.id
			execute @nuevo_servicio = dbo.SP_EncontrarMejorTutor @contrato_id = @contrato_id , @antiguo_tutor_especialidad = @id_antiguo_tutor
			if(@nuevo_servicio!= 0)
				begin
					update contrato set servicio_id = @nuevo_servicio
				end
			else
				begin
					insert into devolucion (monto,estudiante_id) (select top(1) p.monto, i.estudiante_id from inserted i join servicio s on i.servicio_id=s.id join pago p on p.servicio_id = s.id)
					
					update contrato set estado = 0 where id = @contrato_id
				end
		end
	else 
		-- si entra aqui significa que el otro tutor entro
		begin 
			update contrato set estado = 1 where id = (select id from inserted)
		end
    END
GO
ALTER TABLE [dbo].[contrato] ENABLE TRIGGER [TR_VerificarContrato]
GO
/****** Object:  Trigger [dbo].[TR_VerificarEstudianteServicios]    Script Date: 11/11/2019 11:41:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_VerificarEstudianteServicios]
    ON [dbo].[estudiante]
    FOR UPDATE
    AS
	BEGIN
    SET NOCOUNT ON
	declare @servicios_contratados_sem int
	select @servicios_contratados_sem = i.servicios_contratados_semanales from inserted i
	if @servicios_contratados_sem >= 3
		begin
			update estudiante set descuento= 0.10 where id = (select id from inserted)
		end

    END

GO
ALTER TABLE [dbo].[estudiante] ENABLE TRIGGER [TR_VerificarEstudianteServicios]
GO
/****** Object:  Trigger [dbo].[TR_PagoInsertado]    Script Date: 11/11/2019 11:41:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_PagoInsertado]
on [dbo].[pago] for insert
as
set nocount on
declare @servicio_id int
declare @estudiante_id int
select @servicio_id = i.servicio_id, @estudiante_id = i.estudiante_id from inserted i
exec SP_CrearContrato @servicio_id,@estudiante_id
GO
ALTER TABLE [dbo].[pago] ENABLE TRIGGER [TR_PagoInsertado]
GO
/****** Object:  Trigger [dbo].[TR_AumentarQueja]    Script Date: 11/11/2019 11:41:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_AumentarQueja]
    ON [dbo].[queja]
    FOR INSERT
    AS
    BEGIN
    SET NOCOUNT ON
	declare @tutor_id int
	select @tutor_id = t.id from queja q join contrato c on q.contrato_id = c.id join servicio s on s.id = c.servicio_id join tutor t on t.id = s.tutor_id
	declare @numero_quejas_tutor_semanales tinyint
	select @numero_quejas_tutor_semanales = quejas_semanales from tutor 
	declare @numero_quejas_tutor_totales tinyint
	select @numero_quejas_tutor_totales = quejas_totales from tutor 
	declare @queja_aprobada bit
	select @queja_aprobada = aprobada from inserted
	if @queja_aprobada = 1
		begin
			set @numero_quejas_tutor_semanales = @numero_quejas_tutor_semanales + 1
			set @numero_quejas_tutor_totales = @numero_quejas_tutor_totales + 1
			update tutor set quejas_semanales = @numero_quejas_tutor_semanales where id = @tutor_id
			update tutor set quejas_totales = @numero_quejas_tutor_totales where id = @tutor_id
		end
    END
GO
ALTER TABLE [dbo].[queja] ENABLE TRIGGER [TR_AumentarQueja]
GO
/****** Object:  Trigger [dbo].[TR_CrearCalificacion]    Script Date: 11/11/2019 11:41:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_CrearCalificacion]
    ON [dbo].[servicio]
    FOR INSERT
    AS
    BEGIN
    SET NOCOUNT ON
	declare @servicio_id int
	select @servicio_id = i.id from inserted i
	insert into calificacion (servicio_id) values(@servicio_id)
    END
GO
ALTER TABLE [dbo].[servicio] ENABLE TRIGGER [TR_CrearCalificacion]
GO
/****** Object:  Trigger [dbo].[TR_TutorBaneado]    Script Date: 11/11/2019 11:41:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[TR_TutorBaneado]
on [dbo].[tutor] for update
as
declare @quejas_semanales tinyint
select @quejas_semanales = quejas_semanales from inserted
declare @tutor_id int
select @tutor_id = id from inserted
if @quejas_semanales >= 5
	begin 
		insert into tutores_baneados values (@tutor_id,getdate(),1)
		exec SP_CambiarEstadoTutor @tutor_id = @tutor_id
	end
GO
ALTER TABLE [dbo].[tutor] ENABLE TRIGGER [TR_TutorBaneado]
GO
/****** Object:  Trigger [dbo].[TR_CrearUsuarioSinComision]    Script Date: 11/11/2019 11:41:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[TR_CrearUsuarioSinComision]
    ON [dbo].[usuario]
    FOR INSERT
    AS
    BEGIN
    SET NOCOUNT ON
		declare @tutorID int
		select @tutorID = t.id from inserted i join tutor t on t.id = t.usuario_id 
		update tutor set comision = 0 where id = @tutorID
    END
GO
ALTER TABLE [dbo].[usuario] ENABLE TRIGGER [TR_CrearUsuarioSinComision]
GO
USE [master]
GO
ALTER DATABASE [TutorApp] SET  READ_WRITE 
GO
