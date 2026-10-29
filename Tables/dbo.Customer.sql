SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer] (
		[CustomerId]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]           [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Email]          [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_Customer]
		PRIMARY KEY
		CLUSTERED
		([CustomerId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] SET (LOCK_ESCALATION = TABLE)
GO
