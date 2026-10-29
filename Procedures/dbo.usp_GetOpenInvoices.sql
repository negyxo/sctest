SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE dbo.usp_GetOpenInvoices
    @CustomerId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT i.InvoiceId, c.Name AS Customer, i.InvoiceDate, i.Amount, i.CurrencyCode
    FROM dbo.Invoice AS i
    JOIN dbo.Customer AS c ON c.CustomerId = i.CustomerId
    WHERE i.StatusId = 2
      AND (@CustomerId IS NULL OR i.CustomerId = @CustomerId)
    ORDER BY i.InvoiceDate;
END
GO
