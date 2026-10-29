SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoice] (
		[InvoiceId]        [int] IDENTITY(1, 1) NOT NULL,
		[CustomerId]       [int] NOT NULL,
		[InvoiceDate]      [date] NOT NULL,
		[Amount]           [decimal](12, 2) NOT NULL,
		[CurrencyCode]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[StatusId]         [tinyint] NOT NULL,
		[DueDate]          [date] NULL,
		CONSTRAINT [PK_Invoice]
		PRIMARY KEY
		CLUSTERED
		([InvoiceId])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invoice]
	WITH CHECK
	ADD CONSTRAINT [FK_Invoice_Customer]
	FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([CustomerId])
ALTER TABLE [dbo].[Invoice]
	CHECK CONSTRAINT [FK_Invoice_Customer]

GO
ALTER TABLE [dbo].[Invoice]
	WITH CHECK
	ADD CONSTRAINT [FK_Invoice_Currency]
	FOREIGN KEY ([CurrencyCode]) REFERENCES [dbo].[Currency] ([CurrencyCode])
ALTER TABLE [dbo].[Invoice]
	CHECK CONSTRAINT [FK_Invoice_Currency]

GO
ALTER TABLE [dbo].[Invoice]
	WITH CHECK
	ADD CONSTRAINT [FK_Invoice_Status]
	FOREIGN KEY ([StatusId]) REFERENCES [dbo].[InvoiceStatus] ([StatusId])
ALTER TABLE [dbo].[Invoice]
	CHECK CONSTRAINT [FK_Invoice_Status]

GO
ALTER TABLE [dbo].[Invoice] SET (LOCK_ESCALATION = TABLE)
GO
