

--Drop table tblUsers

USE [Med_Research]
GO

/****** Object:  Table [dbo].[tblUsers]    Script Date: 08/22/2017 16:05:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100)Not NULL,
	[Password] [nvarchar](100) NULL,
	[Email] [nvarchar](200) NULL,
	[IsAdmin] [bit] NULL,
	[ISSuperAdmin] [bit] NULL,
	[RetryAttempts] [int] NULL,
	[IsLocked] [bit] NULL,
	[LockedDateTime] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
	[Isdeleted] [bit] NULL

	)
GO


alter table tblUsers
ADD CONSTRAINT PK_Users PRIMARY KEY (UserName)
