USE [master]
GO
/****** Object:  Database [Db4]    Script Date: 2025/2/4 下午 07:13:46 ******/
CREATE DATABASE [Db4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Db4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\Db4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Db4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\Db4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Db4] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Db4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Db4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Db4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Db4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Db4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Db4] SET ARITHABORT OFF 
GO
ALTER DATABASE [Db4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Db4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Db4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Db4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Db4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Db4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Db4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Db4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Db4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Db4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Db4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Db4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Db4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Db4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Db4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Db4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Db4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Db4] SET RECOVERY FULL 
GO
ALTER DATABASE [Db4] SET  MULTI_USER 
GO
ALTER DATABASE [Db4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Db4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Db4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Db4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Db4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Db4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Db4', N'ON'
GO
ALTER DATABASE [Db4] SET QUERY_STORE = ON
GO
ALTER DATABASE [Db4] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Db4]
GO
/****** Object:  User [sa5]    Script Date: 2025/2/4 下午 07:13:46 ******/
CREATE USER [sa5] FOR LOGIN [sa5] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa5]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2025/2/4 下午 07:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](10) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventComments]    Script Date: 2025/2/4 下午 07:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventComments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[EventCommentContent] [nvarchar](500) NOT NULL,
	[CommentTime] [datetime] NOT NULL,
	[Disabled] [nchar](10) NULL,
 CONSTRAINT [PK__EventCom__3214EC073D125381] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventMembers]    Script Date: 2025/2/4 下午 07:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventMembers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[IsAttend] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 2025/2/4 下午 07:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](25) NOT NULL,
	[MemberId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[Location] [nvarchar](500) NULL,
	[IsOnline] [bit] NOT NULL,
	[ParticipantMax] [int] NOT NULL,
	[ParticipantMin] [int] NOT NULL,
	[Limit] [varchar](50) NULL,
	[DeadLine] [date] NOT NULL,
	[CommentCount] [int] NULL,
	[ParticipantNow] [int] NULL,
	[Disabled] [bit] NOT NULL,
	[EventImg] [nvarchar](max) NULL,
 CONSTRAINT [PK__Events__3214EC0763D13807] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2025/2/4 下午 07:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](25) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[PasswordHash] [nvarchar](200) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ConfirmCode] [varchar](50) NULL,
	[NickName] [nvarchar](25) NOT NULL,
	[IsConfirmed] [bit] NULL,
	[Disabled] [bit] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[AbsenceCount] [int] NULL,
	[MemberImg] [nvarchar](max) NULL,
 CONSTRAINT [PK__Members__3214EC071B6F6E88] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostComments]    Script Date: 2025/2/4 下午 07:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostComments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Comment] [nvarchar](100) NOT NULL,
	[CommentTime] [datetime] NOT NULL,
	[Disabled] [bit] NULL,
 CONSTRAINT [PK__PostComm__3214EC07462A8722] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 2025/2/4 下午 07:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[PostContent] [nvarchar](500) NOT NULL,
	[PublishTime] [datetime] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CommentCount] [int] NULL,
	[Disabled] [bit] NOT NULL,
	[PostImg] [nvarchar](max) NULL,
 CONSTRAINT [PK__Posts__3214EC0776D1E5ED] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 2025/2/4 下午 07:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CategoryName], [DisplayOrder]) VALUES (2, N'其他', 100)
INSERT [dbo].[Categories] ([Id], [CategoryName], [DisplayOrder]) VALUES (3, N'科技', 1)
INSERT [dbo].[Categories] ([Id], [CategoryName], [DisplayOrder]) VALUES (4, N'藝術', 2)
INSERT [dbo].[Categories] ([Id], [CategoryName], [DisplayOrder]) VALUES (5, N'音樂', 3)
INSERT [dbo].[Categories] ([Id], [CategoryName], [DisplayOrder]) VALUES (6, N'創業', 4)
INSERT [dbo].[Categories] ([Id], [CategoryName], [DisplayOrder]) VALUES (7, N'文化', 5)
INSERT [dbo].[Categories] ([Id], [CategoryName], [DisplayOrder]) VALUES (8, N'運動', 6)
INSERT [dbo].[Categories] ([Id], [CategoryName], [DisplayOrder]) VALUES (9, N'教育', 7)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[EventComments] ON 

INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (63, 2, 1, N'未來科技展感覺真的太棒了！期待參與！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (64, 2, 2, N'能體驗尖端科技真的是一大享受！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (65, 2, 3, N'希望未來能有更多類似的展覽！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (66, 3, 4, N'動手創作的活動非常有趣，必須參加！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (67, 3, 5, N'藝術細胞要爆發了，期待活動開始！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (68, 3, 6, N'這樣的活動真的很有意義！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (69, 4, 7, N'音樂與熱情的碰撞，這活動絕對不容錯過！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (70, 4, 8, N'期待搖滾和爵士音樂帶來的震撼！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (71, 4, 9, N'釋放壓力的最佳方式就是來參加音樂趴！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (72, 5, 10, N'與創業者面對面交流，這機會難得！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (73, 5, 11, N'激發創業靈感，讓夢想更進一步！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (74, 5, 14, N'這活動對於創業者來說非常重要！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (75, 6, 15, N'文化之旅能讓人感受到傳統的魅力！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (76, 6, 16, N'參與手工藝和美食製作真的太吸引人了！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (77, 6, 17, N'期待深入了解多元文化的獨特之處！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (78, 7, 18, N'挑戰極限運動，腎上腺素要飆升了！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (79, 7, 19, N'這活動對熱愛戶外運動的人來說很棒！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (80, 7, 20, N'期待體驗攀岩和衝浪的刺激感！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (81, 8, 21, N'教育論壇一定能收穫滿滿！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (82, 8, 22, N'探討教育趨勢非常有意義！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (83, 8, 23, N'期待與專家們的深度交流！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (84, 9, 24, N'科技趨勢分享會感覺非常精彩！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (85, 9, 26, N'期待探索科技的樂趣！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (86, 9, 27, N'活動一定能讓人收穫新知識！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (87, 12, 1, N'AI創意大賽真的充滿了科技感！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (88, 12, 2, N'挑戰和趣味兼具的活動太棒了！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (89, 12, 3, N'期待看到更多AI創意作品！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (90, 19, 4, N'彩繪藝術課程真的很有趣！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (91, 19, 5, N'學習新技巧總是讓人很有成就感！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (92, 19, 6, N'希望能和朋友一起參加這樣的活動！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (93, 20, 7, N'攝影技巧分享活動非常實用！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (94, 20, 8, N'提升拍攝技術的好機會！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (95, 20, 9, N'攝影的過程真的很有趣！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (96, 21, 10, N'DIY手作飾品課程真的是絕佳體驗！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (97, 21, 11, N'動手創作的樂趣真的難以言喻！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (98, 21, 14, N'完成作品的成就感無法取代！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (99, 24, 15, N'音樂創作課程真的太吸引人了！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (100, 24, 16, N'期待學習新曲創作技巧！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (101, 24, 17, N'這活動讓人感覺充滿了音樂的魅力！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (102, 25, 18, N'KTV歌唱比賽真的是大展才華的好機會！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (103, 25, 19, N'在舞台上展現光彩是最棒的感覺！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (104, 25, 20, N'期待和朋友一起歡樂互動！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (105, 26, 21, N'戶外音樂節是享受音樂和自然的完美結合！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (106, 26, 22, N'現場演奏的氛圍一定很震撼！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (107, 26, 23, N'期待參加這樣充滿魅力的活動！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (108, 28, 24, N'搖滾音樂大會是釋放熱情的最佳場所！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (109, 28, 26, N'熱血搖滾的氛圍讓人難以抗拒！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (110, 28, 27, N'期待與朋友一起享受音樂的震撼！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (111, 39, 1, N'籃球友誼賽一定能增進團隊合作！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (112, 39, 2, N'這活動非常適合熱愛運動的人！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (113, 39, 3, N'期待參加並享受運動的樂趣！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (114, 40, 4, N'跑步訓練營是提升體能的好機會！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (115, 40, 5, N'這活動一定能激發運動的熱情！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (116, 40, 6, N'希望能與朋友一起挑戰自我！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (117, 41, 7, N'阿里山健行活動太讓人期待了！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (118, 41, 8, N'大自然的美景是最棒的享受！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (119, 41, 9, N'挑戰登山步道真的太有趣了！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (120, 42, 10, N'墾丁衝浪課一定是挑戰和樂趣兼具！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (121, 42, 11, N'學習衝浪技巧感覺非常棒！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (122, 42, 14, N'希望能和朋友一起享受海浪的刺激！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (123, 43, 15, N'戶外攀岩活動絕對是挑戰自我的好機會！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (124, 43, 16, N'增強體能的同時享受挑戰的樂趣！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (125, 43, 17, N'期待與朋友一起突破高度的限制！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (126, 48, 18, N'親子教育課程能增進親子關係！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (127, 48, 19, N'學習教育技巧對每個家長都很重要！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (128, 48, 20, N'期待參加這樣有意義的活動！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (129, 49, 21, N'設計大賞的創意作品一定很精彩！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (130, 49, 22, N'酷就對了，這活動真的超吸引人！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (131, 49, 23, N'期待看到更多創意十足的作品！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (132, 55, 24, N'成果發表會展示的內容真的很有意義！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (133, 55, 26, N'這活動一定能展示學員們的努力成果！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (134, 55, 27, N'期待參加並學習更多新的知識！', CAST(N'2025-01-15T16:49:51.980' AS DateTime), NULL)
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (135, 5, 24, N'好耶', CAST(N'2025-01-15T23:07:20.810' AS DateTime), N'true      ')
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (136, 5, 24, N'gogo', CAST(N'2025-01-15T23:47:59.607' AS DateTime), N'true      ')
INSERT [dbo].[EventComments] ([Id], [EventId], [MemberId], [EventCommentContent], [CommentTime], [Disabled]) VALUES (137, 5, 24, N'~~~~', CAST(N'2025-01-16T07:59:13.990' AS DateTime), N'true      ')
SET IDENTITY_INSERT [dbo].[EventComments] OFF
GO
SET IDENTITY_INSERT [dbo].[EventMembers] ON 

INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (6, 2, 1, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (8, 2, 4, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (10, 4, 6, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (11, 6, 7, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (12, 6, 8, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (16, 4, 2, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (19, 4, 1, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (20, 5, 1, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (21, 5, 10, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (22, 5, 11, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (23, 8, 2, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (24, 19, 7, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (25, 19, 2, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (28, 19, 5, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (29, 3, 3, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (31, 49, 15, 1)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (32, 2, 27, 0)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (33, 3, 27, 0)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (34, 4, 27, 0)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (36, 3, 1, 1)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (37, 42, 4, 1)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (38, 41, 3, 0)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (39, 3, 24, 0)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (42, 12, 15, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (43, 12, 4, NULL)
INSERT [dbo].[EventMembers] ([Id], [EventId], [MemberId], [IsAttend]) VALUES (47, 5, 24, NULL)
SET IDENTITY_INSERT [dbo].[EventMembers] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (2, N'未來科技大冒險', 1, 3, N'體驗尖端科技的奇妙之處！無論是虛擬實境、人工智慧還是創新裝置，這場展覽將帶你感受未來生活的樣貌，探索更多科技可能性，激發你的創造潛力！', CAST(N'2025-02-01T10:00:00.000' AS DateTime), N'台北科技展覽中心', 0, 10, 2, NULL, CAST(N'2025-01-25' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_1.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (3, N'一起動手玩藝術', 2, 4, N'激發你的藝術細胞！參與藝術創作展，動手創作屬於自己的藝術作品，享受繽紛的藝術氛圍，無論是繪畫、手作還是攝影，創意將在這裡綻放！', CAST(N'2025-01-20T14:30:00.000' AS DateTime), N'新竹藝術博物館', 0, 10, 2, NULL, CAST(N'2025-01-10' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_2.png')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (4, N'瘋狂音樂趴', 3, 5, N'來一場音樂與熱情的碰撞吧！現場有多元風格的音樂演出，從搖滾到爵士，感受節奏帶來的震撼，讓你釋放壓力、享受音樂的無限魅力！', CAST(N'2025-01-25T18:00:00.000' AS DateTime), N'台中音樂廳', 0, 10, 2, NULL, CAST(N'2025-01-22' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_3.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (5, N'創業大咖開講', 4, 6, N'與創業者面對面交流！透過他們的故事和經驗，學習如何抓住機會、面對挑戰，激發你的創業靈感，讓未來的夢想不再只是遙遠的想法！', CAST(N'2025-01-20T09:00:00.000' AS DateTime), N'台南創業孵化基地', 0, 5, 3, NULL, CAST(N'2025-01-18' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_4.jpeg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (6, N'文化之旅探索日', 5, 7, N'一次沉浸式的文化之旅！親身參與傳統文化活動，從手工藝到美食製作，感受不同文化的獨特魅力，讓你對多元文化有更深刻的理解。', CAST(N'2025-02-10T13:00:00.000' AS DateTime), N'高雄文化體驗館', 0, 7, 1, NULL, CAST(N'2025-02-05' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_5.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (7, N'極限運動狂熱', 6, 8, N'挑戰自己的極限！無論是攀岩、衝浪還是其他刺激的戶外運動，這場活動將帶給你滿滿的腎上腺素與成就感，適合熱愛挑戰的你！', CAST(N'2025-02-20T16:00:00.000' AS DateTime), N'花蓮運動公園', 0, 7, 1, N'運動愛好者', CAST(N'2025-02-15' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_6.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (8, N'教育新視界論壇', 7, 9, N'探索教育的更多可能性！專家與參與者共同探討最新教育趨勢與未來發展，讓你在輕鬆的氛圍中學習新知識、分享觀點、提升自我。', CAST(N'2025-02-01T10:00:00.000' AS DateTime), N'Google Meeting', 1, 5, 1, N'教師優先', CAST(N'2024-01-25' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_7.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (9, N'科技趨勢分享會', 2, 3, N'參加科技趨勢分享會，這場活動將帶你深入體驗科技的樂趣，無論是學習新知識、享受趣味挑戰，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-02-26T01:06:41.000' AS DateTime), N'台北科技展覽中心', 0, 9, 5, NULL, CAST(N'2025-02-15' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_8.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (12, N'AI創意大賽', 24, 3, N'參加AI創意大賽，這場活動將帶你深入體驗科技的樂趣，無論是學習新知識、享受趣味挑戰，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-01-03T02:15:30.000' AS DateTime), N'花蓮文化創意園區', 0, 11, 4, NULL, CAST(N'2025-01-02' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_9.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (19, N'彩繪藝術課程', 4, 4, N'參加彩繪藝術課程，這場活動將帶你深入體驗藝術的樂趣，無論是學習新技巧、享受手作的樂趣，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-02-19T14:12:48.000' AS DateTime), N'好藝繪畫教室', 0, 5, 3, NULL, CAST(N'2025-02-10' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_10.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (20, N'攝影技巧分享', 7, 4, N'參加攝影技巧分享，這場活動將帶你深入體驗藝術的樂趣，無論是學習拍攝的秘訣、享受攝影的過程，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-02-22T18:00:00.000' AS DateTime), N'松菸', 1, 12, 6, NULL, CAST(N'2025-02-15' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_11.png')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (21, N'DIY手作飾品', 9, 4, N'參加DIY手作飾品，這場活動將帶你深入體驗藝術的樂趣，無論是學習創作的技巧、享受完成作品的成就，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-03-01T09:00:00.000' AS DateTime), N'大安森林公園', 0, 8, 4, NULL, CAST(N'2025-02-20' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_12.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (24, N'音樂創作課', 6, 5, N'參加音樂創作課，這場活動將帶你深入體驗音樂的樂趣，無論是學習創作新曲、享受音樂的魅力，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-02-20T10:00:00.000' AS DateTime), N'YAMAHA教室', 0, 12, 5, NULL, CAST(N'2025-02-10' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_13.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (25, N'KTV歌唱比賽', 8, 5, N'參加KTV歌唱比賽，這場活動將帶你深入體驗音樂的樂趣，無論是展現歌唱才華、享受舞台光彩，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-02-25T18:30:00.000' AS DateTime), N'東區錢櫃', 0, 10, 4, NULL, CAST(N'2025-02-15' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_14.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (26, N'戶外音樂節', 7, 5, N'參加戶外音樂節，這場活動將帶你深入體驗音樂的樂趣，無論是感受現場演奏的氛圍、享受大自然的美好，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-03-15T14:00:00.000' AS DateTime), N'華山公園', 0, 15, 8, NULL, CAST(N'2025-03-05' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_15.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (28, N'搖滾音樂大會', 11, 5, N'參加搖滾音樂大會，這場活動將帶你深入體驗音樂的樂趣，無論是享受搖滾演奏的震撼、感受熱血氛圍，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-03-25T20:00:00.000' AS DateTime), N'花蓮車站廣港', 0, 15, 7, NULL, CAST(N'2025-03-15' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_16.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (39, N'籃球友誼賽', 7, 8, N'參加籃球友誼賽，這場活動將帶你深入體驗運動的樂趣，無論是增強體能、享受團隊合作，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-03-22T09:00:00.000' AS DateTime), N'逢甲籃球館', 0, 10, 5, NULL, CAST(N'2025-03-12' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_17.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (40, N'跑步訓練營', 9, 8, N'參加跑步訓練營，這場活動將帶你深入體驗運動的樂趣，無論是提升跑步技巧、增強體能，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-03-29T07:00:00.000' AS DateTime), N'大江河濱公園', 0, 8, 3, NULL, CAST(N'2025-03-19' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_18.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (41, N'阿里山健行', 24, 8, N'參加阿里山健行，這場活動將帶你深入體驗運動的樂趣，無論是挑戰登山步道、欣賞大自然美景，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-03-23T08:00:00.000' AS DateTime), N'阿里山登山口', 0, 15, 6, NULL, CAST(N'2025-03-19' AS Date), NULL, NULL, 1, NULL)
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (42, N'墾丁衝浪課', 10, 8, N'參加墾丁衝浪課，這場活動將帶你深入體驗運動的樂趣，無論是挑戰海浪、學習衝浪技巧，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-04-01T10:30:00.000' AS DateTime), N'墾丁沙灘', 0, 12, 5, NULL, CAST(N'2025-03-21' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_20.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (43, N'戶外攀岩活動', 11, 8, N'參加戶外攀岩活動，這場活動將帶你深入體驗運動的樂趣，無論是挑戰高度、增強體能，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-04-05T09:00:00.000' AS DateTime), N'台中市民廣場', 0, 10, 4, NULL, CAST(N'2025-03-25' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_21.jpeg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (48, N'親子教育課程', 10, 9, N'參加親子教育課程，這場活動將帶你深入體驗教育的樂趣，無論是提升親子關係、學習教育技巧，還是和朋友一起開心交流，都非常值得參與！', CAST(N'2025-04-07T14:00:00.000' AS DateTime), N'花蓮文化創意園區', 0, 15, 7, NULL, CAST(N'2025-03-28' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event_22.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (49, N'設計大賞', 22, 4, N'酷就對了', CAST(N'2025-01-15T12:00:00.000' AS DateTime), N'111', 1, 15, 1, N'111', CAST(N'2025-01-15' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event49_Event_1.jpg')
INSERT [dbo].[Events] ([Id], [EventName], [MemberId], [CategoryId], [Description], [EventTime], [Location], [IsOnline], [ParticipantMax], [ParticipantMin], [Limit], [DeadLine], [CommentCount], [ParticipantNow], [Disabled], [EventImg]) VALUES (55, N'成果發表', 19, 3, N'展示我們的網頁。', CAST(N'2025-01-16T12:00:00.000' AS DateTime), N'北市商', 0, 25, 1, N'是北市商參加學員', CAST(N'2025-01-16' AS Date), NULL, NULL, 0, N'https://localhost:44378/Images/Event55_{668FFAD7-E419-4D86-A049-FEE934ADDEC3}.jpg')
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (1, N'123', N'Alice', N'123', N'123', N'132123', N'Alice', 1, 0, N'member', 1, N'https://localhost:44378/Images/Member_1.png')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (2, N'user001', N'王小明', N'e99a18c428cb38d5f260853678922e03', N'wang@example.com', N'12345', N'明哥', 1, 0, N'member', 0, N'https://localhost:44378/Images/Member_2.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (3, N'user002', N'李小華', N'5f4dcc3b5aa765d61d8327deb882cf99', N'li@example.com', N'67890', N'小華', 1, 0, N'member', 0, N'https://localhost:44378/Images/Member_3.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (4, N'user003', N'陳大仁', N'6cb75f652a9b52798eb6cf2201057c73', N'chen@example.com', N'ABCDE', N'大仁', 0, 0, N'member', 0, N'https://localhost:44378/Images/Member_4.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (5, N'user004', N'林美麗', N'098f6bcd4621d373cade4e832627b4f6', N'lin@example.com', N'FGHIJ', N'美麗', 1, 0, N'member', 0, N'https://localhost:44378/Images/Member_5.jpeg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (6, N'user005', N'張國榮', N'5f4dcc3b5aa765d61d8327deb882cf99', N'zhang@example.com', N'KLMNO', N'國榮', 0, 0, N'member', 0, N'https://localhost:44378/Images/Member_6.jpeg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (7, N'user006', N'周杰倫', N'098f6bcd4621d373cade4e832627b4f6', N'zhou@example.com', N'PQRST', N'周董', 1, 0, N'member', 0, N'https://localhost:44378/Images/Member_7.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (8, N'user007', N'鄭伊健', N'6cb75f652a9b52798eb6cf2201057c73', N'zheng@example.com', N'UVWXY', N'伊健', 0, 0, N'member', 1, N'https://localhost:44378/Images/Member_8.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (9, N'user008', N'郭富城', N'e99a18c428cb38d5f260853678922e03', N'guo@example.com', N'Z1234', N'富城', 1, 0, N'member', 0, N'https://localhost:44378/Images/Member_9.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (10, N'user009', N'劉德華', N'5f4dcc3b5aa765d61d8327deb882cf99', N'liu@example.com', N'56789', N'德華', 1, 0, N'member', 0, N'https://localhost:44378/Images/Member_10.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (11, N'user010', N'黃曉明', N'098f6bcd4621d373cade4e832627b4f6', N'huang@example.com', N'ABCDE', N'曉明', 0, 0, N'member', 0, N'https://localhost:44378/Images/Member_11.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (14, N'315', N'汪汪', N'377ADEB4CD4096ADC7CA64B533938CFFC6294A9B3534F883B2336A26252CDA9A', N'kk@yyy', N'64bafe24-2c3b-4a9d-b743-83bb0f81c830', N'汪汪', 1, 0, N'member', 0, N'https://localhost:44378/Images/Member_14.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (15, N'jim245', N'jim', N'BF704A68ECB7344B55723B1E5E4DE435BC9FA694CBA4D46D58A89CAD19B4E859', N'jim245.001@gmail.com', N'4e0b41fd-11bb-4670-81b6-67f9d9269cfc', N'jim', 1, 0, N'member', 0, N'https://localhost:44378/Images/Member_15.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (16, N'444', N'katie', N'3538A1EF2E113DA64249EEA7BD068B585EC7CE5DF73B2D1E319D8C9BF47EB314', N'123@123', N'2232cbf7-9055-4e75-be61-851102b1db7a', N'katie', 1, 0, N'member', 0, NULL)
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (17, N'555', N'Ivy', N'91A73FD806AB2C005C13B4DC19130A884E909DEA3F72D46E30266FE1A1F588D8', N'555@555', N'3b07e42a-7214-497e-96f7-1f4c142ed527', N'Ivy', 1, 0, N'member', 0, NULL)
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (18, N'666', N'Ally', N'C7E616822F366FB1B5E0756AF498CC11D2C0862EDCB32CA65882F622FF39DE1B', N'666@666', N'617097e2-5b54-43fe-b97c-ec177a601c9e', N'Ally', 1, 0, N'member', 0, N'https://localhost:44378/Images/Member_18.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (19, N'777', N'Jimmy', N'EAF89DB7108470DC3F6B23EA90618264B3E8F8B6145371667C4055E9C5CE9F52', N'777@777', N'6a6644a4-8236-4903-94b4-fe808dbc6b22', N'Jimmy', 1, 0, N'admin', 0, N'https://localhost:44378/Images/Member_19.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (20, N'888', N'Ella', N'5E968CE47CE4A17E3823C29332A39D049A8D0AFB08D157EB6224625F92671A51', N'888@888', N'e27260b2-7bdc-4651-a2eb-e0bf854d88e1', N'Ella', 1, 0, N'member', 0, NULL)
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (21, N'999', N'Jason', N'83CF8B609DE60036A8277BD0E96135751BBC07EB234256D4B65B893360651BF2', N'999@999', N'8cede54b-725c-4fd3-aeeb-1fb15ec407f9', N'Jason', 1, 0, N'member', 0, NULL)
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (22, N'111', N'Robot', N'F6E0A1E2AC41945A9AA7FF8A8AAA0CEBC12A3BCC981A929AD5CF810A090E11AE', N'111@111', N'69558ac9-dee8-40f6-a828-21eb8a4b9980', N'Robot', 1, 0, N'member', 0, N'https://localhost:44378/Images/Member_22.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (23, N'222', N'Hebe', N'9B871512327C09CE91DD649B3F96A63B7408EF267C8CC5710114E629730CB61F', N'222@222', N'0a24e471-4338-49f5-b105-877845124f37', N'Hebe', 1, 1, N'member', 3, NULL)
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (24, N'11111', N'Allen Kuo', N'B7E3F6B21B1E5F755036EEB2F110F88841C9E684C0EE125038DFE35FD6646887', N'11111@gmail.com', N'b4b1c7ac-32f4-4946-b2cb-f36ef1e745ed', N'郭老師', 1, 0, N'member', 2, N'https://localhost:44378/Images/Member_24.jpg')
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (26, N'77777', N'Admin', N'0744D7664EEF4DB5C675C92250350D4B7FC325E0EFAA583438E35308F0D9ADEF', N'777@yyy', N'd6b3e1d3-3fb8-461e-be0e-af2dc15a861c', N'Admin', 1, 0, N'admin', 0, NULL)
INSERT [dbo].[Members] ([Id], [Account], [Name], [PasswordHash], [Email], [ConfirmCode], [NickName], [IsConfirmed], [Disabled], [Role], [AbsenceCount], [MemberImg]) VALUES (27, N'22222', N'AmyLiu', N'CDB7F8655713E14D87C78804697F500C5F4C575C5F78AEDD1FBD35EE47B8E990', N'222@yyy', N'639c2065-0f7b-45d1-a904-caad0bd36aec', N'AmyLiu', 1, 1, N'member', 3, N'https://localhost:44378/Images/Member_27.jpg')
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[PostComments] ON 

INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (144, 30, 1, N'這篇文章內容豐富且有趣！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (145, 30, 2, N'非常感謝這樣的精采分享！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (146, 30, 3, N'內容深入淺出，受益匪淺！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (147, 31, 4, N'這篇文章讓我大開眼界！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (148, 31, 5, N'期待未來更多類似的文章！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (149, 31, 6, N'讀完後感到很有啟發，謝謝！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (150, 32, 7, N'文章的細節處理得很好！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (151, 32, 8, N'內容充實且實用，感謝分享！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (152, 32, 9, N'希望以後能看到更多這樣的內容！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (153, 33, 10, N'每次看這類文章都感到很受用！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (154, 33, 11, N'內容真的很有趣，謝謝分享！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (155, 33, 14, N'期待下次能看到更深入的分析！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (156, 34, 15, N'這次的內容設計非常棒！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (157, 34, 16, N'每次看都覺得收穫良多！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (158, 34, 17, N'文章的敘述方式很吸引人！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (159, 35, 18, N'內容真的很有啟發，謝謝！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (160, 35, 19, N'非常實用且有趣的分享！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (161, 35, 20, N'希望未來能看到更多相關內容！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (162, 36, 21, N'文章讓我感到很振奮！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (163, 36, 22, N'細節描述非常生動，感謝分享！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (164, 36, 23, N'這是一篇很值得閱讀的文章！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (165, 37, 24, N'文章的結構非常清晰！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (166, 37, 26, N'內容很有層次感，謝謝！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (167, 37, 27, N'希望未來能參與這樣的討論！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (168, 38, 1, N'內容很有深度，值得一讀！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (169, 38, 2, N'這篇文章真的非常實用！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (170, 38, 3, N'期待未來更多這樣的高質量分享！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (171, 39, 4, N'每次都能從中學到新東西！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (172, 39, 5, N'非常精彩的內容，感謝作者！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (173, 39, 6, N'這樣的分享讓人耳目一新！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (174, 40, 7, N'文章的敘述方式讓人印象深刻！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (175, 40, 8, N'內容非常豐富且有趣！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (176, 40, 9, N'希望未來能參加相關的實際活動！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (177, 41, 10, N'文章讓人感到很有啟發！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (178, 41, 11, N'希望未來能有更多這樣的主題！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (179, 41, 14, N'非常感謝作者的用心整理！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (180, 42, 15, N'每次看這篇文章都覺得很有價值！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (181, 42, 16, N'內容簡單易懂，謝謝分享！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (182, 42, 17, N'希望未來有更多深入的探討！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (183, 43, 18, N'文章的設計結構非常出色！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (184, 43, 19, N'每次閱讀都能感受到作者的用心！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (185, 43, 20, N'希望未來能學到更多知識！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (186, 44, 21, N'這篇文章讓我感到非常振奮！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (187, 44, 22, N'內容非常實用且貼近日常生活！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (188, 44, 23, N'希望未來能看到更多相關內容！', CAST(N'2025-01-15T16:43:51.667' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (189, 24, 1, N'這隻貓真的是「喵中藝術家」！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (190, 24, 2, N'哈哈，這一定是史上最搞笑的AI繪圖！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (191, 24, 3, N'我猜這可能是波斯貓？', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (192, 25, 4, N'VR旅行真的讓人身臨其境，太棒了！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (193, 25, 5, N'撞到隕石？感覺好驚險！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (194, 25, 6, N'真希望有機會也能體驗這樣的旅行！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (195, 26, 7, N'哈哈，手工總是充滿意外的驚喜！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (196, 26, 8, N'下次可以用硬一點的材料試試看！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (197, 26, 9, N'期待看到你改進後的作品！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (198, 27, 10, N'數學歌？這朋友太有創意了！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (199, 27, 11, N'笑到眼淚都流出來了！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (200, 27, 14, N'能不能分享這首歌的歌詞？', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (201, 28, 15, N'登山加咖啡，絕對是享受人生的最高境界！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (202, 28, 16, N'這一定是超棒的體驗！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (203, 28, 17, N'期待看到你更多的登山分享！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (204, 29, 18, N'爸爸的健身環成績居然比你高，太好笑了！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (205, 29, 19, N'你應該找機會好好練一練！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (206, 29, 20, N'我也遇到過類似的情況，笑死了！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (207, 30, 21, N'塑膠瓶燈罩？這創意真的很棒！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (208, 30, 22, N'看起來又環保又實用，支持！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (209, 30, 23, N'期待你的更多手工作品！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (210, 31, 24, N'AI重製的照片居然可以這麼感人！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (211, 31, 26, N'這技術真的太厲害了！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (212, 31, 27, N'我也想試試看重製我的舊照片！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (213, 32, 1, N'VR打羽毛球真的超有趣！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (214, 32, 2, N'哈哈，差點砸到牆，太搞笑了！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (215, 32, 3, N'這活動真適合居家運動！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (216, 33, 4, N'第一次做蘋果派，真的很不錯！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (217, 33, 5, N'DIY的樂趣就是從失敗中成長！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (218, 33, 6, N'加油，下次一定能做得更好！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (219, 34, 7, N'星空露營真的是無價的享受！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (220, 34, 8, N'這一定是美好的回憶！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (221, 34, 9, N'期待看到你的露營照片！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (222, 35, 10, N'你媽媽的作品真的充滿藝術感！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (223, 35, 11, N'像迷宮的畫？這聽起來很特別！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (224, 35, 14, N'能不能分享一下照片？', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (225, 36, 15, N'AI的創意真的太厲害了！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (226, 36, 16, N'復古風派對？這主題太有趣了！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (227, 36, 17, N'希望有更多這樣的AI設計靈感！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (228, 37, 18, N'滿分笑聲？這評審也太幽默了吧！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (229, 37, 19, N'這一定是一次很難忘的經歷！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (230, 37, 20, N'下次比賽加油，期待你的精彩表現！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (231, 38, 21, N'帶路的貓咪？真的是小隊長！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (232, 38, 22, N'太可愛了，這一定是一段美好的旅程！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (233, 38, 23, N'希望能看到照片分享！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (234, 39, 24, N'家庭廚藝PK真的很有趣！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (235, 39, 26, N'墊底也沒關係，重在參與嘛！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (236, 39, 27, N'期待看到你的下一道美味料理！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (237, 40, 1, N'迷你恐龍？這創意太可愛了！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (238, 40, 2, N'像海豹也很棒啊，大家都很有想像力！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (239, 40, 3, N'能不能分享一下作品照片？', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (240, 41, 4, N'VR探索海底世界一定超震撼！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (241, 41, 5, N'鯊魚？這真的是一次冒險啊！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (242, 41, 6, N'感謝分享，這活動真的很棒！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
GO
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (243, 42, 7, N'草莓蛋糕就算崩壞也是甜的！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (244, 42, 8, N'史上最醜？我一定要看看照片！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (245, 42, 9, N'期待你的下一次烘焙挑戰！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (246, 43, 10, N'大象穿高跟鞋？太有創意了吧！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (247, 43, 11, N'這LOGO一定很搞笑！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (248, 43, 14, N'能不能分享一下生成的LOGO？', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (249, 44, 15, N'吉伊卡哇真的太可愛了！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (250, 44, 16, N'漫畫的內容真的很治癒！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
INSERT [dbo].[PostComments] ([Id], [PostId], [UserId], [Comment], [CommentTime], [Disabled]) VALUES (251, 44, 17, N'期待看到更多這樣的介紹！', CAST(N'2025-01-15T16:46:24.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[PostComments] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (24, 3, N'AI幫我畫了一隻貓??', N'用AI繪圖生成了一隻超搞笑的貓，完全就是「喵中藝術家」！來猜這是什麼品種的貓？', CAST(N'2025-01-15T09:00:00.000' AS DateTime), 3, NULL, 1, N'https://localhost:44378/Images/Post_1.jpeg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (25, 5, N'虛擬探險：外太空旅行??', N'用VR探索宇宙的感覺真的太震撼了！還撞到了一顆隕石??。', CAST(N'2025-01-15T10:30:00.000' AS DateTime), 5, NULL, 0, N'https://localhost:44378/Images/Post_2.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (26, 2, N'爆笑手作：迷你書桌椅??', N'製作了一個袖珍家具，結果桌腳直接斷掉哈哈哈！要改進設計了！', CAST(N'2025-01-15T11:15:00.000' AS DateTime), 7, NULL, 0, N'https://localhost:44378/Images/Post_3.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (27, 8, N'朋友點的歌居然是數學公式??', N'笑到噴淚！朋友硬是唱了一整首關於數學的改編歌??。', CAST(N'2025-01-15T12:00:00.000' AS DateTime), 4, NULL, 0, N'https://localhost:44378/Images/Post_4.jpeg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (28, 6, N'山頂喝咖啡的儀式感?', N'爬完山來一杯自己煮的手沖咖啡，這就是快樂的最高境界！', CAST(N'2025-01-15T13:30:00.000' AS DateTime), 6, NULL, 0, N'https://localhost:44378/Images/Post_5.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (29, 7, N'爸爸說Switch是他買的??', N'我爸居然偷練健身環大冒險，現在成績比我高！誰來救救我～', CAST(N'2025-01-15T14:00:00.000' AS DateTime), 9, NULL, 0, N'https://localhost:44378/Images/Post_6.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (30, 4, N'拼拼湊湊出一個燈罩??', N'用回收的塑膠瓶製作了一個燈罩，居然意外地美觀實用！', CAST(N'2025-01-15T15:30:00.000' AS DateTime), 7, NULL, 0, N'https://localhost:44378/Images/Post_7.jpeg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (31, 3, N'AI幫我重製童年照片??', N'我把一張模糊的舊照片放進AI裡重製，結果超感人！技術太厲害了！', CAST(N'2025-01-15T16:15:00.000' AS DateTime), 3, NULL, 0, N'https://localhost:44378/Images/Post_8.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (32, 5, N'虛擬羽毛球大挑戰??', N'用VR打羽毛球，結果差點把手柄扔到牆上哈哈哈！', CAST(N'2025-01-15T17:00:00.000' AS DateTime), 5, NULL, 0, N'https://localhost:44378/Images/Post_9.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (33, 4, N'第一次做蘋果派??', N'麵團沒揉好但味道還不錯，想請教大家一些簡單的DIY技巧！', CAST(N'2025-01-15T18:30:00.000' AS DateTime), 7, NULL, 0, N'https://localhost:44378/Images/Post_10.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (34, 6, N'夜晚的星空露營???', N'上週末去了荒郊露營，看到了最美的星空，滿足了！', CAST(N'2025-01-15T19:00:00.000' AS DateTime), 6, NULL, 0, N'https://localhost:44378/Images/Post_11.png')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (35, 7, N'媽媽DIY的奇妙作品??', N'媽媽做了一個像迷宮一樣的畫，完全就是現代藝術啊！', CAST(N'2025-01-15T20:00:00.000' AS DateTime), 9, NULL, 0, N'https://localhost:44378/Images/Post_12.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (36, 3, N'AI設計了一個派對主題??', N'我輸入「80年代復古風」，結果AI設計了超酷的派對裝飾！', CAST(N'2025-01-15T20:30:00.000' AS DateTime), 3, NULL, 0, N'https://localhost:44378/Images/Post_13.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (37, 8, N'唱歌比賽的奇葩評審??', N'去參加了一場小型唱歌比賽，評審居然給了我「滿分笑聲」！', CAST(N'2025-01-15T21:00:00.000' AS DateTime), 4, NULL, 0, N'https://localhost:44378/Images/Post_14.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (38, 6, N'登山路上的貓咪小隊長??', N'在山上遇到了一隻帶路的貓咪，超可愛的！', CAST(N'2025-01-15T21:30:00.000' AS DateTime), 6, NULL, 0, N'https://localhost:44378/Images/Post_15.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (39, 7, N'家庭廚藝PK??', N'家裡辦了一場誰煮的最好吃比賽，結果我居然墊底了...', CAST(N'2025-01-15T22:00:00.000' AS DateTime), 9, NULL, 0, N'https://localhost:44378/Images/Post_16.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (40, 4, N'用黏土捏了一隻恐龍??', N'捏了一個迷你恐龍，但朋友說像海豹...到底該相信誰？', CAST(N'2025-01-15T22:30:00.000' AS DateTime), 7, NULL, 0, N'https://localhost:44378/Images/Post_17.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (41, 5, N'虛擬海底世界大探索??', N'用VR探索了珊瑚礁和魚群，結果還遇到了鯊魚！', CAST(N'2025-01-15T23:00:00.000' AS DateTime), 5, NULL, 0, N'https://localhost:44378/Images/Post_18.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (42, 4, N'草莓蛋糕的崩壞版??', N'做了個蛋糕，結果變成「史上最醜草莓蛋糕」，歡迎吐槽！', CAST(N'2025-01-15T23:30:00.000' AS DateTime), 7, NULL, 0, N'https://localhost:44378/Images/Post_19.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (43, 3, N'AI設計了一個奇葩LOGO??', N'讓AI生成了一個「大象穿高跟鞋」的LOGO，太搞笑了！', CAST(N'2025-01-16T00:00:00.000' AS DateTime), 3, NULL, 0, N'https://localhost:44378/Images/Post_20.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (44, 24, N'吉利卡哇同好會', N'《吉伊卡哇》（日語：ちいかわ）是由日本漫畫家長野創作的漫畫系列[2]，副標題《這又小又可愛的傢伙》（日語：なんか小さくてかわいいやつ）。該系列自2020年1月起透過Twitter進行連載，並由講談社出版單行本。由動畫工房製作的電視動畫於2022年4月首播。[3]

截至2023年7月6日，其官方Twitter帳戶擁有229萬粉絲[4]。截至2024年11月，系列累計發行量超過360萬份[5]。', CAST(N'2025-01-14T15:32:31.300' AS DateTime), 2, NULL, 0, N'https://localhost:44378/Images/Post_23.jpg')
INSERT [dbo].[Posts] ([Id], [MemberId], [Title], [PostContent], [PublishTime], [CategoryId], [CommentCount], [Disabled], [PostImg]) VALUES (45, 24, N'111', N'111', CAST(N'2025-01-15T23:58:27.740' AS DateTime), 2, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (1, N'我愛周杰倫')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (2, N'下水道探險')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (3, N'哥布林狂歡')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (4, N'單身狗聚會')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (5, N'宅男最愛')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (6, N'少女心爆棚')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (7, N'運動狂熱')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (8, N'夜貓必來')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (9, N'極限挑戰')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (10, N'動漫迷天堂')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (11, N'超級英雄粉絲')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (12, N'大胃王挑戰')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (13, N'靈異探險')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (14, N'小清新必去')
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (15, N'復古潮流')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Members]    Script Date: 2025/2/4 下午 07:13:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Members] ON [dbo].[Members]
(
	[NickName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventComments]  WITH CHECK ADD  CONSTRAINT [FK__EventComm__Event__6477ECF3] FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[EventComments] CHECK CONSTRAINT [FK__EventComm__Event__6477ECF3]
GO
ALTER TABLE [dbo].[EventComments]  WITH CHECK ADD  CONSTRAINT [FK__EventComm__Membe__656C112C] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[EventComments] CHECK CONSTRAINT [FK__EventComm__Membe__656C112C]
GO
ALTER TABLE [dbo].[EventMembers]  WITH CHECK ADD  CONSTRAINT [FK__EventMemb__Event__46E78A0C] FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[EventMembers] CHECK CONSTRAINT [FK__EventMemb__Event__46E78A0C]
GO
ALTER TABLE [dbo].[EventMembers]  WITH CHECK ADD  CONSTRAINT [FK__EventPart__Membe__5AEE82B9] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[EventMembers] CHECK CONSTRAINT [FK__EventPart__Membe__5AEE82B9]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK__Events__Category__48CFD27E] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK__Events__Category__48CFD27E]
GO
ALTER TABLE [dbo].[PostComments]  WITH CHECK ADD  CONSTRAINT [FK__PostComme__PostI__60A75C0F] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostComments] CHECK CONSTRAINT [FK__PostComme__PostI__60A75C0F]
GO
ALTER TABLE [dbo].[PostComments]  WITH CHECK ADD  CONSTRAINT [FK__PostComme__UserI__619B8048] FOREIGN KEY([UserId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[PostComments] CHECK CONSTRAINT [FK__PostComme__UserI__619B8048]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK__Posts__MemberId__5DCAEF64] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK__Posts__MemberId__5DCAEF64]
GO
USE [master]
GO
ALTER DATABASE [Db4] SET  READ_WRITE 
GO
