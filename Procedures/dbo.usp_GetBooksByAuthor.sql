SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.usp_GetBooksByAuthor
    @AuthorId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT BookId, Title, Price
    FROM dbo.Books
    WHERE AuthorId = @AuthorId;
END
GO
