SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW dbo.vInvoiceSummary
AS
SELECT c.CustomerId,
       c.Name         AS Customer,
       COUNT(*)       AS Invoices,
       SUM(i.Amount)  AS TotalAmount
FROM dbo.Invoice AS i
JOIN dbo.Customer AS c ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.Name;
GO
