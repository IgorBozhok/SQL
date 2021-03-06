USE [master]
GO
/****** Object:  Database [BarbershopDB]    Script Date: 06.03.2019 21:27:10 ******/
CREATE DATABASE [BarbershopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BarbershopDB', FILENAME = N'C:\Users\st\BarbershopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BarbershopDB_log', FILENAME = N'C:\Users\st\BarbershopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BarbershopDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BarbershopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BarbershopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BarbershopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BarbershopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BarbershopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BarbershopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BarbershopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BarbershopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BarbershopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BarbershopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BarbershopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BarbershopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BarbershopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BarbershopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BarbershopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BarbershopDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BarbershopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BarbershopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BarbershopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BarbershopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BarbershopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BarbershopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BarbershopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BarbershopDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BarbershopDB] SET  MULTI_USER 
GO
ALTER DATABASE [BarbershopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BarbershopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BarbershopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BarbershopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BarbershopDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BarbershopDB] SET QUERY_STORE = OFF
GO
USE [BarbershopDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BarbershopDB]
GO
/****** Object:  Table [dbo].[BarberInfo]    Script Date: 06.03.2019 21:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BarberInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Birthday] [date] NOT NULL,
	[HiringDay] [date] NOT NULL,
	[PositionId] [int] NOT NULL,
	[EvaluationId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[GetAllBarber]    Script Date: 06.03.2019 21:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetAllBarber]()

RETURNS TABLE 
AS
RETURN 
(
SELECT BarberInfo.Name From BarberInfo
)

GO
/****** Object:  Table [dbo].[BarberPosition]    Script Date: 06.03.2019 21:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BarberPosition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsUnique] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[GetAllSignor]    Script Date: 06.03.2019 21:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetAllSignor]() 

RETURNS TABLE 
AS
RETURN 
(
	Select BarberInfo.Name from BarberInfo 
	INNER JOIN BarberPosition
	On BarberInfo.PositionId = BarberPosition.Id
	Where BarberPosition.Id = 2
)

GO
/****** Object:  Table [dbo].[ServiceAndPrice]    Script Date: 06.03.2019 21:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceAndPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Service] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[DurationOfService] [int] NULL,
	[BarberId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[GetNameByServes]    Script Date: 06.03.2019 21:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetNameByServes](@Servic nvarchar(50))

RETURNS TABLE 
AS
RETURN 
(
	Select BarberInfo.Name from BarberInfo 
	INNER JOIN ServiceAndPrice on ServiceAndPrice.BarberId = BarberInfo.Id
	where ServiceAndPrice.Service = @Servic
)

GO
/****** Object:  Table [dbo].[ClinetInfo]    Script Date: 06.03.2019 21:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinetInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[EvaluationId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[AddBarber]    Script Date: 06.03.2019 21:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddBarber]
@Name nvarchar(50),
@Phone nvarchar(50),
@Email nvarchar(50),
@Birthday date,
@HiringDay date,
@PositionId int,
@EvaluationId int 

AS
BEGIN
declare @Age int
select  @Age = DATEDIFF(yy,@Birthday, cast(getdate() as date))
	if @Age < 21
	return 1

declare @tmp bit
select @tmp = IsUnique from BarberPosition where Id=@PositionId
if @tmp = 1

begin
	declare @counter int = 0
	Select @counter = count(Id) from BarberInfo where PositionId = @PositionId
	if @counter>0
		return 1

end
INSERT INTO  [dbo].[BarberInfo]
           ([Name]
           ,[Phone]
           ,[Email]
           ,[Birthday]
           ,[HiringDay]
           ,[PositionId]
           ,[EvaluationId])
     VALUES
           (@Name,
           @Phone,
           @Email,
           @Birthday,
           @HiringDay,
           @PositionId,
           @EvaluationId)
END


GO
/****** Object:  StoredProcedure [dbo].[AddServece]    Script Date: 06.03.2019 21:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddServece]
@Service nvarchar(50),
@Price money,
@DurationOfService int,
@BarerId int
AS
BEGIN
	INSERT INTO [dbo].[ServiceAndPrice]
           ([Service]
           ,[Price]
           ,[DurationOfService]
           ,[BarberId])
     VALUES
           (@Service,
           @Price,
           @DurationOfService,
           @BarerId)
return 0
end

GO
USE [master]
GO
ALTER DATABASE [BarbershopDB] SET  READ_WRITE 
GO
