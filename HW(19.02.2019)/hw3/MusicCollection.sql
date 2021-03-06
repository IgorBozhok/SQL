USE [master]
GO
/****** Object:  Database [MusicCollection_Aleinik]    Script Date: 13.02.2019 20:48:40 ******/
CREATE DATABASE [MusicCollection_Aleinik]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicCollection_Aleinik', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.A208PCPREPOD\MSSQL\DATA\MusicCollection_Aleinik.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicCollection_Aleinik_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.A208PCPREPOD\MSSQL\DATA\MusicCollection_Aleinik_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MusicCollection_Aleinik] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicCollection_Aleinik].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicCollection_Aleinik] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET RECOVERY FULL 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET  MULTI_USER 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicCollection_Aleinik] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MusicCollection_Aleinik] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MusicCollection_Aleinik', N'ON'
GO
ALTER DATABASE [MusicCollection_Aleinik] SET QUERY_STORE = OFF
GO
USE [MusicCollection_Aleinik]
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
USE [MusicCollection_Aleinik]
GO
/****** Object:  DatabaseRole [Reader]    Script Date: 13.02.2019 20:48:40 ******/
CREATE ROLE [Reader]
GO
/****** Object:  DatabaseRole [DiscsAdmin]    Script Date: 13.02.2019 20:48:40 ******/
CREATE ROLE [DiscsAdmin]
GO
/****** Object:  DatabaseRole [Admin]    Script Date: 13.02.2019 20:48:40 ******/
CREATE ROLE [Admin]
GO
/****** Object:  Table [dbo].[Styles]    Script Date: 13.02.2019 20:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Styles](
	[StyleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Styles] PRIMARY KEY CLUSTERED 
(
	[StyleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[StylesNames]    Script Date: 13.02.2019 20:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StylesNames]
AS
SELECT        Name
FROM            dbo.Styles

GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 13.02.2019 20:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[PublishersNames]    Script Date: 13.02.2019 20:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PublishersNames]
AS
SELECT        Name
FROM            dbo.Publishers

GO
/****** Object:  Table [dbo].[Perfomers]    Script Date: 13.02.2019 20:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfomers](
	[PerfomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Perfomers] PRIMARY KEY CLUSTERED 
(
	[PerfomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discs]    Script Date: 13.02.2019 20:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discs](
	[DiskId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[PerfomerId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[PublisherId] [int] NOT NULL,
	[StyleId] [int] NOT NULL,
 CONSTRAINT [PK_Discs] PRIMARY KEY CLUSTERED 
(
	[DiskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[DiskInfo]    Script Date: 13.02.2019 20:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DiskInfo]
AS
SELECT        dbo.Discs.Name AS [Disk name], dbo.Perfomers.Name AS Perfomer, dbo.Discs.Date AS [Date of issue], dbo.Styles.Name AS Style, dbo.Publishers.Name AS Publisher
FROM            dbo.Discs INNER JOIN
                         dbo.Publishers ON dbo.Discs.PublisherId = dbo.Publishers.PublisherId INNER JOIN
                         dbo.Styles ON dbo.Discs.StyleId = dbo.Styles.StyleId INNER JOIN
                         dbo.Perfomers ON dbo.Discs.PerfomerId = dbo.Perfomers.PerfomerId

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 13.02.2019 20:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Songs]    Script Date: 13.02.2019 20:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Songs](
	[SongId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[StyleId] [int] NOT NULL,
 CONSTRAINT [PK_Songs] PRIMARY KEY CLUSTERED 
(
	[SongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SongsDiscs]    Script Date: 13.02.2019 20:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongsDiscs](
	[SongId] [int] NOT NULL,
	[DiskId] [int] NOT NULL,
 CONSTRAINT [PK_SongsDiscs] PRIMARY KEY CLUSTERED 
(
	[SongId] ASC,
	[DiskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (1, N'Беларусь                                          ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (7, N'Великобритания                                    ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (8, N'Германия                                          ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (4, N'Испания                                           ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (3, N'Канада                                            ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (6, N'Польша                                            ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (5, N'Россия                                            ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (2, N'США                                               ')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Discs] ON 

INSERT [dbo].[Discs] ([DiskId], [Name], [PerfomerId], [Date], [PublisherId], [StyleId]) VALUES (1, N'Some name                                         ', 7, CAST(N'2006-12-05' AS Date), 5, 4)
INSERT [dbo].[Discs] ([DiskId], [Name], [PerfomerId], [Date], [PublisherId], [StyleId]) VALUES (3, N'New                                               ', 3, CAST(N'2019-02-13' AS Date), 2, 1)
SET IDENTITY_INSERT [dbo].[Discs] OFF
SET IDENTITY_INSERT [dbo].[Perfomers] ON 

INSERT [dbo].[Perfomers] ([PerfomerId], [Name]) VALUES (6, N'Chuck Berry                                       ')
INSERT [dbo].[Perfomers] ([PerfomerId], [Name]) VALUES (4, N'Dato                                              ')
INSERT [dbo].[Perfomers] ([PerfomerId], [Name]) VALUES (3, N'Fabo Dukwon                                       ')
INSERT [dbo].[Perfomers] ([PerfomerId], [Name]) VALUES (7, N'Hatsune Miku                                      ')
INSERT [dbo].[Perfomers] ([PerfomerId], [Name]) VALUES (2, N'MATRIXX                                           ')
INSERT [dbo].[Perfomers] ([PerfomerId], [Name]) VALUES (1, N'MC Noize                                          ')
INSERT [dbo].[Perfomers] ([PerfomerId], [Name]) VALUES (5, N'Джексон Майкл                                     ')
SET IDENTITY_INSERT [dbo].[Perfomers] OFF
SET IDENTITY_INSERT [dbo].[Publishers] ON 

INSERT [dbo].[Publishers] ([PublisherId], [Name], [CountryId]) VALUES (6, N'Abbey Road                                        ', 7)
INSERT [dbo].[Publishers] ([PublisherId], [Name], [CountryId]) VALUES (7, N'AIR                                               ', 7)
INSERT [dbo].[Publishers] ([PublisherId], [Name], [CountryId]) VALUES (5, N'Chess                                             ', 2)
INSERT [dbo].[Publishers] ([PublisherId], [Name], [CountryId]) VALUES (3, N'Hansa                                             ', 8)
INSERT [dbo].[Publishers] ([PublisherId], [Name], [CountryId]) VALUES (4, N'Hitsville USA                                     ', 2)
INSERT [dbo].[Publishers] ([PublisherId], [Name], [CountryId]) VALUES (9, N'Muscle Shoals                                     ', 2)
INSERT [dbo].[Publishers] ([PublisherId], [Name], [CountryId]) VALUES (1, N'Olympic                                           ', 7)
INSERT [dbo].[Publishers] ([PublisherId], [Name], [CountryId]) VALUES (10, N'Sun                                               ', 2)
INSERT [dbo].[Publishers] ([PublisherId], [Name], [CountryId]) VALUES (8, N'Sunset Sound                                      ', 2)
INSERT [dbo].[Publishers] ([PublisherId], [Name], [CountryId]) VALUES (2, N'The Record Plant                                  ', 2)
SET IDENTITY_INSERT [dbo].[Publishers] OFF
SET IDENTITY_INSERT [dbo].[Songs] ON 

INSERT [dbo].[Songs] ([SongId], [Name], [DurationInSeconds], [StyleId]) VALUES (1, N'Eye of the storm                                  ', 199, 6)
INSERT [dbo].[Songs] ([SongId], [Name], [DurationInSeconds], [StyleId]) VALUES (2, N'Heart breaker                                     ', 279, 4)
INSERT [dbo].[Songs] ([SongId], [Name], [DurationInSeconds], [StyleId]) VALUES (3, N'Tell your world                                   ', 255, 4)
INSERT [dbo].[Songs] ([SongId], [Name], [DurationInSeconds], [StyleId]) VALUES (4, N'Secret police                                     ', 210, 4)
INSERT [dbo].[Songs] ([SongId], [Name], [DurationInSeconds], [StyleId]) VALUES (5, N'Lost                                              ', 210, 6)
INSERT [dbo].[Songs] ([SongId], [Name], [DurationInSeconds], [StyleId]) VALUES (7, N'Go away                                           ', 159, 6)
SET IDENTITY_INSERT [dbo].[Songs] OFF
INSERT [dbo].[SongsDiscs] ([SongId], [DiskId]) VALUES (2, 1)
INSERT [dbo].[SongsDiscs] ([SongId], [DiskId]) VALUES (3, 1)
INSERT [dbo].[SongsDiscs] ([SongId], [DiskId]) VALUES (4, 1)
SET IDENTITY_INSERT [dbo].[Styles] ON 

INSERT [dbo].[Styles] ([StyleId], [Name]) VALUES (1, N'Блюз                                              ')
INSERT [dbo].[Styles] ([StyleId], [Name]) VALUES (7, N'Джаз                                              ')
INSERT [dbo].[Styles] ([StyleId], [Name]) VALUES (2, N'Кантри                                            ')
INSERT [dbo].[Styles] ([StyleId], [Name]) VALUES (4, N'Поп                                               ')
INSERT [dbo].[Styles] ([StyleId], [Name]) VALUES (6, N'Рок                                               ')
INSERT [dbo].[Styles] ([StyleId], [Name]) VALUES (5, N'Хип-хоп                                           ')
INSERT [dbo].[Styles] ([StyleId], [Name]) VALUES (3, N'Шансон                                            ')
SET IDENTITY_INSERT [dbo].[Styles] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20190213-194150]    Script Date: 13.02.2019 20:48:41 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190213-194150] ON [dbo].[Countries]
(
	[Name] ASC
)
INCLUDE ( 	[CountryId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20190213-194703]    Script Date: 13.02.2019 20:48:41 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190213-194703] ON [dbo].[Discs]
(
	[Name] ASC,
	[PerfomerId] ASC
)
INCLUDE ( 	[DiskId],
	[StyleId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20190213-194614]    Script Date: 13.02.2019 20:48:41 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190213-194614] ON [dbo].[Perfomers]
(
	[Name] ASC
)
INCLUDE ( 	[PerfomerId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20190213-194238]    Script Date: 13.02.2019 20:48:41 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190213-194238] ON [dbo].[Publishers]
(
	[Name] ASC
)
INCLUDE ( 	[PublisherId],
	[CountryId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20190213-194903]    Script Date: 13.02.2019 20:48:41 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190213-194903] ON [dbo].[Songs]
(
	[Name] ASC,
	[StyleId] ASC
)
INCLUDE ( 	[SongId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20190213-194219]    Script Date: 13.02.2019 20:48:41 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190213-194219] ON [dbo].[Styles]
(
	[Name] ASC
)
INCLUDE ( 	[StyleId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Discs]  WITH CHECK ADD  CONSTRAINT [FK_Discs_Perfomers] FOREIGN KEY([PerfomerId])
REFERENCES [dbo].[Perfomers] ([PerfomerId])
GO
ALTER TABLE [dbo].[Discs] CHECK CONSTRAINT [FK_Discs_Perfomers]
GO
ALTER TABLE [dbo].[Discs]  WITH CHECK ADD  CONSTRAINT [FK_Discs_Publishers] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([PublisherId])
GO
ALTER TABLE [dbo].[Discs] CHECK CONSTRAINT [FK_Discs_Publishers]
GO
ALTER TABLE [dbo].[Discs]  WITH CHECK ADD  CONSTRAINT [FK_Discs_Styles] FOREIGN KEY([StyleId])
REFERENCES [dbo].[Styles] ([StyleId])
GO
ALTER TABLE [dbo].[Discs] CHECK CONSTRAINT [FK_Discs_Styles]
GO
ALTER TABLE [dbo].[Publishers]  WITH CHECK ADD  CONSTRAINT [FK_Publishers_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Publishers] CHECK CONSTRAINT [FK_Publishers_Countries]
GO
ALTER TABLE [dbo].[Songs]  WITH CHECK ADD  CONSTRAINT [FK_Songs_Styles] FOREIGN KEY([StyleId])
REFERENCES [dbo].[Styles] ([StyleId])
GO
ALTER TABLE [dbo].[Songs] CHECK CONSTRAINT [FK_Songs_Styles]
GO
ALTER TABLE [dbo].[SongsDiscs]  WITH CHECK ADD  CONSTRAINT [FK_SongsDiscs_Discs] FOREIGN KEY([DiskId])
REFERENCES [dbo].[Discs] ([DiskId])
GO
ALTER TABLE [dbo].[SongsDiscs] CHECK CONSTRAINT [FK_SongsDiscs_Discs]
GO
ALTER TABLE [dbo].[SongsDiscs]  WITH CHECK ADD  CONSTRAINT [FK_SongsDiscs_Songs] FOREIGN KEY([SongId])
REFERENCES [dbo].[Songs] ([SongId])
GO
ALTER TABLE [dbo].[SongsDiscs] CHECK CONSTRAINT [FK_SongsDiscs_Songs]
GO
/****** Object:  StoredProcedure [dbo].[AddDisk]    Script Date: 13.02.2019 20:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddDisk]
	@DiskName nchar(50),
	@IssueDate date,
	@PerfomerId int = -1,
	@PerfomerName nchar(50) = null,
	@PublisherId int = -1,
	@PublisherName nchar(50) = null,
	@StyleId int = -1,
	@StylerName nchar(50) = null
AS
BEGIN
	if @PerfomerId<=0
	begin
		if @PerfomerName is not null
			Select @PerfomerId = PerfomerId from Perfomers where Name = @PerfomerName
		else
			return 0
		if @PerfomerId<=0
			return 0
	end
	if @PublisherId<=0
	begin
		if @PublisherName is not null
			Select @PublisherId = PublisherId from Publishers where Name = @PublisherName
		else
			return 0
		if @PublisherId<=0
			return 0
	end
	if @StyleId<=0
	begin
		if @StylerName is not null
			Select @StyleId = StyleId from Styles where Name = @StylerName
		else
			return 0
		if @StyleId<=0
			return 0
	end

	INSERT INTO [dbo].[Discs]
           ([Name]
           ,[PerfomerId]
           ,[Date]
           ,[PublisherId]
           ,[StyleId])
     VALUES
           (@DiskName
           ,@PerfomerId
           ,@IssueDate
           ,@PublisherId
           ,@StyleId)
	return 1
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
         Begin Table = "Discs"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Publishers"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 119
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Styles"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 102
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Perfomers"
            Begin Extent = 
               Top = 6
               Left = 674
               Bottom = 102
               Right = 848
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
         Alias = 2010
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DiskInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DiskInfo'
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
         Begin Table = "Publishers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 212
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PublishersNames'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PublishersNames'
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
         Begin Table = "Styles"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 212
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StylesNames'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StylesNames'
GO
USE [master]
GO
ALTER DATABASE [MusicCollection_Aleinik] SET  READ_WRITE 
GO
