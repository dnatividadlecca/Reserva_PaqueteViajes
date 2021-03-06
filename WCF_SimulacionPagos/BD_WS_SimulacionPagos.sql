USE [master]
GO
/****** Object:  Database [BD_WS_SimulacionPagos]    Script Date: 11/12/2017 17:54:30 ******/
CREATE DATABASE [BD_WS_SimulacionPagos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_Simulacion_Pagos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BD_Simulacion_Pagos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BD_Simulacion_Pagos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BD_Simulacion_Pagos_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_WS_SimulacionPagos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET  MULTI_USER 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_WS_SimulacionPagos', N'ON'
GO
USE [BD_WS_SimulacionPagos]
GO
/****** Object:  StoredProcedure [dbo].[sp_grabarpago]    Script Date: 11/12/2017 17:54:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_grabarpago] 
@payment_id int OUTPUT,
@payment_price decimal(18, 2),
@payment_card_number decimal(16, 0),
@payment_card_expiration_date char(5),
@email varchar(100),
@first_name varchar(100),
@last_name varchar(100),
@street varchar(100),
@city varchar(100),
@state varchar(100),
@zip varchar(100),
@country varchar(100),
@is_success char(1),
@reason_fault varchar

AS
--DECLARE @payment_id int
EXEC [dbo].[sp_obtenerCodigoNuevoPago] @codigoObtenido = @payment_id OUTPUT
INSERT INTO [tbl_pagos]([payment_id],[payment_date],[payment_price],[payment_card_number],[payment_card_expiration_date],[email],[first_name],[last_name],[street],[city],[state],[zip],[country],[is_success],[reason_fault])
VALUES(@payment_id,GETDATE(),@payment_price,@payment_card_number,@payment_card_expiration_date,@email,@first_name,@last_name,@street,@city,@state,@zip,@country,@is_success,@reason_fault)




GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerCodigoNuevoPago]    Script Date: 11/12/2017 17:54:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_obtenerCodigoNuevoPago]
@codigoObtenido int output
AS
begin
	set @codigoObtenido = (SELECT ISNULL((SELECT TOP(1) a.payment_id + 1 FROM [dbo].[tbl_pagos] a ORDER BY 1 DESC),1))
end


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerPago]    Script Date: 11/12/2017 17:54:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_obtenerPago]
@codigoPago int 
AS
	SELECT [payment_id],[payment_date],[payment_price],[payment_card_number],[payment_card_expiration_date],[email],[first_name],[last_name],[street],[city],[state],[zip],[country],[is_success],[reason_fault] 
	FROM [dbo].[tbl_pagos]
	WHERE [payment_id] = @codigoPago


GO
/****** Object:  Table [dbo].[tbl_pagos]    Script Date: 11/12/2017 17:54:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_pagos](
	[payment_id] [int] NOT NULL,
	[payment_date] [datetime] NOT NULL,
	[payment_price] [decimal](18, 2) NOT NULL,
	[payment_card_number] [decimal](16, 0) NOT NULL,
	[payment_card_expiration_date] [char](5) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[street] [varchar](100) NULL,
	[city] [varchar](100) NULL,
	[state] [varchar](100) NULL,
	[zip] [varchar](100) NULL,
	[country] [varchar](100) NULL,
	[is_success] [char](1) NOT NULL,
	[reason_fault] [varchar](100) NULL,
 CONSTRAINT [PK_pagos] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [BD_WS_SimulacionPagos] SET  READ_WRITE 
GO
