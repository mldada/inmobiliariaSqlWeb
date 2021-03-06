USE [master]
GO
/****** Object:  Database [Inmobiliaria]    Script Date: 10/1/2019 4:10:21 p. m. ******/
CREATE DATABASE [Inmobiliaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inmobiliaria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Inmobiliaria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Inmobiliaria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Inmobiliaria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Inmobiliaria] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inmobiliaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inmobiliaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inmobiliaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inmobiliaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inmobiliaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inmobiliaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inmobiliaria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inmobiliaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inmobiliaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inmobiliaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inmobiliaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inmobiliaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inmobiliaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inmobiliaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inmobiliaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inmobiliaria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Inmobiliaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inmobiliaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inmobiliaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inmobiliaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inmobiliaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inmobiliaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inmobiliaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inmobiliaria] SET RECOVERY FULL 
GO
ALTER DATABASE [Inmobiliaria] SET  MULTI_USER 
GO
ALTER DATABASE [Inmobiliaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inmobiliaria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inmobiliaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inmobiliaria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Inmobiliaria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Inmobiliaria] SET QUERY_STORE = OFF
GO
USE [Inmobiliaria]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Inmobiliaria]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[dc_estado] [varchar](50) NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Listar_Estados]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_Listar_Estados]
AS
SELECT Estados.id_estado, 
				   Estados.dc_estado
			  FROM Estados
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[id_localidad] [int] IDENTITY(1,1) NOT NULL,
	[dc_localidad] [varchar](50) NULL,
	[es_activa] [bit] NULL,
 CONSTRAINT [PK_Localidades] PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Listar_Localidades]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[View_Listar_Localidades]
AS
SELECT Localidades.id_localidad, 
				   Localidades.dc_localidad
			  FROM Localidades 
GO
/****** Object:  Table [dbo].[Tipos_Propiedades]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Propiedades](
	[id_tipo_propiedad] [int] IDENTITY(1,1) NOT NULL,
	[dc_tipo_propiedad] [varchar](50) NOT NULL,
	[es_venta] [bit] NOT NULL,
 CONSTRAINT [PK_Tipos_Propiedades] PRIMARY KEY CLUSTERED 
(
	[id_tipo_propiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Listar_TiposPropiedades_Alquiler]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[View_Listar_TiposPropiedades_Alquiler]
AS
SELECT Tipos_Propiedades.id_tipo_propiedad, 
				   Tipos_Propiedades.dc_tipo_propiedad,
				   Tipos_Propiedades.es_venta
			  FROM Tipos_Propiedades 
GO
/****** Object:  View [dbo].[View_Listar_TiposPropiedades_Venta]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[View_Listar_TiposPropiedades_Venta]
AS
SELECT Tipos_Propiedades.id_tipo_propiedad, 
				   Tipos_Propiedades.dc_tipo_propiedad,
				   Tipos_Propiedades.es_venta
			  FROM Tipos_Propiedades
			  WHERE Tipos_Propiedades.es_venta = 1 
GO
/****** Object:  Table [dbo].[Inmuebles]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inmuebles](
	[id_inmueble] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_propiedad] [int] NOT NULL,
	[es_venta] [bit] NOT NULL,
	[importe] [int] NOT NULL,
	[superficie] [int] NOT NULL,
	[calle] [varchar](50) NOT NULL,
	[altura] [int] NOT NULL,
	[id_localidad] [int] NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[id_estado] [int] NOT NULL,
	[cant_ambientes] [int] NOT NULL,
	[piso] [varchar](2) NOT NULL,
	[depto] [varchar](5) NOT NULL,
	[apto_credito] [bit] NOT NULL,
 CONSTRAINT [PK_Inmueble] PRIMARY KEY CLUSTERED 
(
	[id_inmueble] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Estados] ON 
GO
INSERT [dbo].[Estados] ([id_estado], [dc_estado]) VALUES (1, N'Publicado')
GO
INSERT [dbo].[Estados] ([id_estado], [dc_estado]) VALUES (2, N'Reservado')
GO
INSERT [dbo].[Estados] ([id_estado], [dc_estado]) VALUES (3, N'Operado')
GO
SET IDENTITY_INSERT [dbo].[Estados] OFF
GO
SET IDENTITY_INSERT [dbo].[Inmuebles] ON 
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (35, 2, 1, 11, 11, N'11', 11, 2, N'11', 2, 11, N'11', N'11', 0)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (36, 3, 1, 22, 22, N'22', 22, 4, N'22', 2, 22, N'22', N'22', 0)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (37, 4, 1, 33, 33, N'33', 33, 2, N'33', 1, 33, N'33', N'33', 1)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (38, 5, 1, 44, 44, N'44', 44, 1, N'44', 1, 44, N'44', N'44', 0)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (39, 1, 0, 88, 88, N'88', 88, 1, N'88', 1, 88, N'88', N'88', 0)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (40, 2, 0, 777, 777, N'777', 777, 2, N'777', 3, 777, N'77', N'777', 0)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (41, 3, 0, 555, 555, N'555', 555, 5, N'555', 2, 555, N'55', N'555', 0)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (42, 4, 0, 444, 444, N'444', 444, 1, N'444', 1, 444, N'44', N'444', 0)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (43, 1, 1, 45345, 34534, N'345', 3453, 3, N'34534', 2, 3454, N'34', N'456', 1)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (44, 1, 0, 1201, 800, N'1', 70, 4, N'2', 3, 700, N'3', N'3', 0)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (46, 1, 1, 222, 222, N'222', 222, 1, N'222', 1, 222, N'22', N'22', 1)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (47, 1, 1, 888, 888, N'888', 88, 1, N'888', 1, 888, N'88', N'888', 1)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (48, 2, 0, 777, 777, N'777', 777, 4, N'7777', 1, 777, N'77', N'777', 0)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (49, 3, 0, 555, 555, N'555', 555, 1, N'555', 1, 555, N'55', N'555', 0)
GO
INSERT [dbo].[Inmuebles] ([id_inmueble], [id_tipo_propiedad], [es_venta], [importe], [superficie], [calle], [altura], [id_localidad], [descripcion], [id_estado], [cant_ambientes], [piso], [depto], [apto_credito]) VALUES (50, 5, 1, 222, 222, N'222', 222, 4, N'222', 1, 222, N'22', N'222', 1)
GO
SET IDENTITY_INSERT [dbo].[Inmuebles] OFF
GO
SET IDENTITY_INSERT [dbo].[Localidades] ON 
GO
INSERT [dbo].[Localidades] ([id_localidad], [dc_localidad], [es_activa]) VALUES (1, N'Caballito', 1)
GO
INSERT [dbo].[Localidades] ([id_localidad], [dc_localidad], [es_activa]) VALUES (2, N'Boedo', 1)
GO
INSERT [dbo].[Localidades] ([id_localidad], [dc_localidad], [es_activa]) VALUES (3, N'Almagro', 0)
GO
INSERT [dbo].[Localidades] ([id_localidad], [dc_localidad], [es_activa]) VALUES (4, N'Nuñez', 0)
GO
INSERT [dbo].[Localidades] ([id_localidad], [dc_localidad], [es_activa]) VALUES (5, N'Balvanera', 1)
GO
SET IDENTITY_INSERT [dbo].[Localidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos_Propiedades] ON 
GO
INSERT [dbo].[Tipos_Propiedades] ([id_tipo_propiedad], [dc_tipo_propiedad], [es_venta]) VALUES (1, N'Departamento', 1)
GO
INSERT [dbo].[Tipos_Propiedades] ([id_tipo_propiedad], [dc_tipo_propiedad], [es_venta]) VALUES (2, N'Casa/Duplex', 1)
GO
INSERT [dbo].[Tipos_Propiedades] ([id_tipo_propiedad], [dc_tipo_propiedad], [es_venta]) VALUES (3, N'Tipo Casa', 1)
GO
INSERT [dbo].[Tipos_Propiedades] ([id_tipo_propiedad], [dc_tipo_propiedad], [es_venta]) VALUES (4, N'Local/Galpon', 1)
GO
INSERT [dbo].[Tipos_Propiedades] ([id_tipo_propiedad], [dc_tipo_propiedad], [es_venta]) VALUES (5, N'Lote/Terreno', 0)
GO
SET IDENTITY_INSERT [dbo].[Tipos_Propiedades] OFF
GO
ALTER TABLE [dbo].[Inmuebles]  WITH CHECK ADD  CONSTRAINT [FK_Inmuebles_Estados] FOREIGN KEY([id_estado])
REFERENCES [dbo].[Estados] ([id_estado])
GO
ALTER TABLE [dbo].[Inmuebles] CHECK CONSTRAINT [FK_Inmuebles_Estados]
GO
ALTER TABLE [dbo].[Inmuebles]  WITH CHECK ADD  CONSTRAINT [FK_Inmuebles_Localidades] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[Localidades] ([id_localidad])
GO
ALTER TABLE [dbo].[Inmuebles] CHECK CONSTRAINT [FK_Inmuebles_Localidades]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Actualizar_Inmueble_Id]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Actualizar_Inmueble_Id] 
	@id_inmueble int = null,
	@id_tipo_propiedad int = null,
	@es_venta bit = null,
	@importe int = null,
	@superficie int = null,
	@calle varchar(50) = null,
	@altura int = null,
	@id_localidad int = null,
	@descripcion varchar(1000) = null,
	@id_estado int = null,
	@cant_ambientes int = null,
	@piso varchar(2) = null,
	@depto varchar(5) = null,
	@apto_credito bit = null
	
AS
BEGIN	
		     
				 UPDATE Inmuebles
				    SET id_tipo_propiedad = @id_tipo_propiedad, 
						es_venta = @es_venta, 
						importe = @importe, 
						superficie = @superficie, 
						calle = @calle, 
						altura = @altura, 
						id_localidad = @id_localidad,
						descripcion = @descripcion,
						id_estado = @id_estado,
						cant_ambientes = @cant_ambientes,
						piso = @piso,
						depto = @depto,
						apto_credito = @apto_credito 
				  WHERE id_inmueble = @id_inmueble

END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Agregar_Inmueble]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Agregar_Inmueble] 
	@id_tipo_propiedad int = null,
	@es_venta bit = null,
	@importe int = null,
	@superficie int = null,
	@calle varchar(50) = null,
	@altura int = null,
	@id_localidad int = null,
	@descripcion varchar(1000) = null,
	@id_estado int = null,
	@cant_ambientes int = null,
	@piso varchar(2) = null,
	@depto varchar(5) = null,
	@apto_credito bit = null
	
AS
BEGIN	
		
				 INSERT INTO Inmuebles 
						     (id_tipo_propiedad, es_venta, importe, superficie, calle, altura, id_localidad,
					          descripcion, id_estado, cant_ambientes, piso, depto, apto_credito)
				      VALUES (@id_tipo_propiedad, @es_venta, @importe, @superficie, @calle, @altura, @id_localidad,
					          @descripcion, @id_estado, @cant_ambientes, @piso, @depto, @apto_credito)
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_Buscar_Inmueble_Id]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Buscar_Inmueble_Id] 
	@id_inmueble int = null	
AS
BEGIN	
				SELECT Inmuebles.id_inmueble, 
				   Inmuebles.id_tipo_propiedad, 
				   Tipos_Propiedades.dc_tipo_propiedad,
				   Inmuebles.es_venta,
				   Inmuebles.importe,
				   Inmuebles.superficie,
				   Inmuebles.calle,
				   Inmuebles.altura,
				   Inmuebles.id_localidad,
				   Localidades.dc_localidad,
				   Inmuebles.descripcion,
				   Inmuebles.id_estado,
				   Estados.dc_estado,
				   Inmuebles.cant_ambientes,
				   Inmuebles.piso,
				   Inmuebles.depto,
				   Inmuebles.apto_credito
			  FROM Inmuebles AS Inmuebles LEFT JOIN 
				   Tipos_Propiedades AS Tipos_Propiedades ON Tipos_Propiedades.id_tipo_propiedad = Inmuebles.id_tipo_propiedad LEFT JOIN
				   Localidades AS Localidades ON Localidades.id_localidad = Inmuebles.id_localidad LEFT JOIN
				   Estados AS Estados ON Estados.id_estado = Inmuebles.id_estado 
				   WHERE Inmuebles.id_inmueble = @id_inmueble	
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buscar_Inmuebles]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Buscar_Inmuebles] 
	@id_tipo_propiedad int = null,
	@es_venta bit = null	
AS
BEGIN	
			SELECT Inmuebles.id_inmueble, 
				   Inmuebles.id_tipo_propiedad, 
				   Tipos_Propiedades.dc_tipo_propiedad,
				   Inmuebles.es_venta,
				   Inmuebles.importe,
				   Inmuebles.superficie,
				   Inmuebles.calle,
				   Inmuebles.altura,
				   Inmuebles.id_localidad,
				   Localidades.dc_localidad,
				   Inmuebles.descripcion,
				   Inmuebles.id_estado,
				   Estados.dc_estado,
				   Inmuebles.cant_ambientes,
				   Inmuebles.piso,
				   Inmuebles.depto,
				   Inmuebles.apto_credito
			  FROM Inmuebles AS Inmuebles LEFT JOIN 
				   Tipos_Propiedades AS Tipos_Propiedades ON Tipos_Propiedades.id_tipo_propiedad = Inmuebles.id_tipo_propiedad LEFT JOIN
				   Localidades AS Localidades ON Localidades.id_localidad = Inmuebles.id_localidad LEFT JOIN
				   Estados AS Estados ON Estados.id_estado = Inmuebles.id_estado 
				   WHERE Inmuebles.id_tipo_propiedad = @id_tipo_propiedad and Inmuebles.es_venta = @es_venta 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Eliminar_Inmueble]    Script Date: 10/1/2019 4:10:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Eliminar_Inmueble] 
	@id_inmueble int = null	
AS
BEGIN	

				 DELETE FROM Inmuebles 
				 WHERE id_inmueble = @id_inmueble 



END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Estados"
            Begin Extent = 
               Top = 6
               Left = 34
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Listar_Estados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Listar_Estados'
GO
USE [master]
GO
ALTER DATABASE [Inmobiliaria] SET  READ_WRITE 
GO
