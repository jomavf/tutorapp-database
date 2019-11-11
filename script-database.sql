USE [master]
GO
/****** Object:  Database [TutorApp]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  UserDefinedDataType [dbo].[cel]    Script Date: 11/11/2019 1:03:36 PM ******/
CREATE TYPE [dbo].[cel] FROM [char](9) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[dni]    Script Date: 11/11/2019 1:03:36 PM ******/
CREATE TYPE [dbo].[dni] FROM [char](8) NULL
GO
/****** Object:  Table [dbo].[calificacion]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[comentario]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[contrato]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[devolucion]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[dia]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[especialidad]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[especialidad_tutor]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[estudiante]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[horario]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[mensaje]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[pago]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[preferencia]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[queja]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[servicio]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[tipo_pago]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[tutor]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[tutores_baneados]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[ubigeo]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CambiarEstadoTutor]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CrearContrato]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_EncontrarMejorTutor]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ReiniciarServiciosContratado]    Script Date: 11/11/2019 1:03:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ReiniciarServiciosContratado] 
    @estudiante_id int
AS
    update estudiante set servicios_contratados_semanales = 0 where id = @estudiante_id
GO
/****** Object:  Trigger [dbo].[TR_ActualizarCalificacion]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Trigger [dbo].[TR_VerificarContrato]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Trigger [dbo].[TR_VerificarEstudianteServicios]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Trigger [dbo].[TR_PagoInsertado]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Trigger [dbo].[TR_AumentarQueja]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Trigger [dbo].[TR_CrearCalificacion]    Script Date: 11/11/2019 1:03:36 PM ******/
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
/****** Object:  Trigger [dbo].[TR_TutorBaneado]    Script Date: 11/11/2019 1:03:37 PM ******/
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
/****** Object:  Trigger [dbo].[TR_CrearUsuarioSinComision]    Script Date: 11/11/2019 1:03:37 PM ******/
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
