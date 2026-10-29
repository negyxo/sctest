-- Month-end close: open invoices from previous months. Run by finance on the first working day.
USE Accounting;
GO

SELECT c.Name AS Customer, i.InvoiceId, i.InvoiceDate, i.Amount, i.CurrencyCode
FROM dbo.Invoice AS i
JOIN dbo.Customer AS c ON c.CustomerId = i.CustomerId
WHERE i.StatusId = 2
  AND i.InvoiceDate < DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)
ORDER BY c.Name, i.InvoiceDate;
GO
