USE [master]
GO
/****** Object:  Database [TutorApp]    Script Date: 11/5/2019 7:09:18 AM ******/
CREATE DATABASE [TutorApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TutorApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TutorApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [TutorApp_Contratos] 
( NAME = N'TutorApp_Contratos_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TutorApp_Contratos_1.ndf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 20480KB ), 
 FILEGROUP [TutorApp_Mensajes] 
( NAME = N'TutorApp_Mensajes_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TutorApp_Mensajes_1.ndf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 30720KB )
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
/****** Object:  UserDefinedDataType [dbo].[cel]    Script Date: 11/5/2019 7:09:19 AM ******/
CREATE TYPE [dbo].[cel] FROM [char](9) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[dni]    Script Date: 11/5/2019 7:09:19 AM ******/
CREATE TYPE [dbo].[dni] FROM [char](8) NULL
GO
/****** Object:  Table [dbo].[comentario]    Script Date: 11/5/2019 7:09:19 AM ******/
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
/****** Object:  Table [dbo].[contrato]    Script Date: 11/5/2019 7:09:19 AM ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [TutorApp_Contratos]
) ON [TutorApp_Contratos]
GO
/****** Object:  Table [dbo].[dia]    Script Date: 11/5/2019 7:09:19 AM ******/
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
/****** Object:  Table [dbo].[especialidad]    Script Date: 11/5/2019 7:09:19 AM ******/
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
/****** Object:  Table [dbo].[especialidad_tutor]    Script Date: 11/5/2019 7:09:19 AM ******/
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
/****** Object:  Table [dbo].[estudiante]    Script Date: 11/5/2019 7:09:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudiante](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_id] [int] NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[horario]    Script Date: 11/5/2019 7:09:19 AM ******/
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
/****** Object:  Table [dbo].[mensaje]    Script Date: 11/5/2019 7:09:19 AM ******/
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
/****** Object:  Table [dbo].[pago]    Script Date: 11/5/2019 7:09:19 AM ******/
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
/****** Object:  Table [dbo].[preferencia]    Script Date: 11/5/2019 7:09:19 AM ******/
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
/****** Object:  Table [dbo].[servicio]    Script Date: 11/5/2019 7:09:19 AM ******/
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
/****** Object:  Table [dbo].[tipo_pago]    Script Date: 11/5/2019 7:09:19 AM ******/
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
/****** Object:  Table [dbo].[tutor]    Script Date: 11/5/2019 7:09:19 AM ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tutores_baneados]    Script Date: 11/5/2019 7:09:19 AM ******/
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
/****** Object:  Table [dbo].[ubigeo]    Script Date: 11/5/2019 7:09:19 AM ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 11/5/2019 7:09:19 AM ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[contrato] ADD  DEFAULT ((0)) FOR [pago_realizado]
GO
ALTER TABLE [dbo].[tutores_baneados] ADD  DEFAULT ((1)) FOR [estado]
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
/****** Object:  StoredProcedure [dbo].[SP_CrearContrato]    Script Date: 11/5/2019 7:09:19 AM ******/
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
USE [master]
GO
ALTER DATABASE [TutorApp] SET  READ_WRITE 
GO
