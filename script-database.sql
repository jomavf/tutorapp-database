USE [TutorApp]
GO
/****** Object:  UserDefinedDataType [dbo].[cel]    Script Date: 11/11/2019 12:51:21 PM ******/
CREATE TYPE [dbo].[cel] FROM [char](9) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[dni]    Script Date: 11/11/2019 12:51:21 PM ******/
CREATE TYPE [dbo].[dni] FROM [char](8) NULL
GO
/****** Object:  Table [dbo].[calificacion]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[comentario]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[contrato]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[devolucion]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[dia]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[especialidad]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[especialidad_tutor]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[estudiante]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[horario]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[mensaje]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[pago]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[preferencia]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[queja]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[servicio]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[tipo_pago]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[tutor]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[tutores_baneados]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[ubigeo]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CambiarEstadoTutor]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CrearContrato]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_EncontrarMejorTutor]    Script Date: 11/11/2019 12:51:21 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ReiniciarServiciosContratado]    Script Date: 11/11/2019 12:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ReiniciarServiciosContratado] 
    @estudiante_id int
AS
    update estudiante set servicios_contratados_semanales = 0 where id = @estudiante_id
GO
