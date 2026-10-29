-- Read-only access for the reporting team. Run once per environment.
USE Accounting;
GO

IF DATABASE_PRINCIPAL_ID(N'ReportingReader') IS NULL
    CREATE ROLE ReportingReader;
GO

GRANT SELECT ON dbo.vInvoiceSummary TO ReportingReader;
GO
