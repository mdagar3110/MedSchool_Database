USE [Med_Research]
GO

/****** Object:  Table [dbo].[tblResetPasswordRequests]    Script Date: 08/22/2017 16:06:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblResetPasswordRequests](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [int] NULL,
	[ResetRequestDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblResetPasswordRequests]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUsers] ([Id])
GO


