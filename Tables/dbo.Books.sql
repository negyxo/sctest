SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Books] (
		[BookId]          [int] IDENTITY(1, 1) NOT NULL,
		[Title]           [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[AuthorId]        [int] NOT NULL,
		[Price]           [decimal](10, 2) NOT NULL,
		[PublishedOn]     [date] NULL,
		CONSTRAINT [PK_Books]
		PRIMARY KEY
		CLUSTERED
		([BookId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]
	WITH CHECK
	ADD CONSTRAINT [FK_Books_Authors]
	FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[Authors] ([AuthorId])
ALTER TABLE [dbo].[Books]
	CHECK CONSTRAINT [FK_Books_Authors]

GO
ALTER TABLE [dbo].[Books] SET (LOCK_ESCALATION = TABLE)
GO
