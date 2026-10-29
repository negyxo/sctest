-- Month-end close: open invoices from previous months. Run by finance on the first working day.
-- Disputed invoices stay open until the customer agrees, so they are reviewed too.
USE Accounting;
GO

SELECT c.Name AS Customer, i.InvoiceId, i.InvoiceDate, i.Amount, i.CurrencyCode, s.Name AS Status
FROM dbo.Invoice AS i
JOIN dbo.Customer AS c ON c.CustomerId = i.CustomerId
JOIN dbo.InvoiceStatus AS s ON s.StatusId = i.StatusId
WHERE i.StatusId IN (2, 5)
  AND i.InvoiceDate < DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)
ORDER BY c.Name, i.InvoiceDate;
GO
