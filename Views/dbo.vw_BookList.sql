SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW dbo.vw_BookList
AS
SELECT b.BookId, b.Title, a.FirstName + N' ' + a.LastName AS Author, b.Price
FROM dbo.Books b
JOIN dbo.Authors a ON a.AuthorId = b.AuthorId;
GO
