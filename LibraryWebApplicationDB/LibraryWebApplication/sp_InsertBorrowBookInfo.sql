CREATE PROCEDURE [dbo].[sp_InsertBorrowBookInfo]
	@StudentId int,
	@BookId int
	
AS
	BEGIN TRAN
		BEGIN TRY

			IF(@StudentId=0)
				BEGIN
					SELECT 4
				END
			ELSE IF(@BookId=0)
				BEGIN
					SELECT 3
				END
			ELSE IF NOT EXISTS(SELECT MAX(BR.borrowId) FROM dbo.borrow BR WHERE BR.broughtDate IS NULL GROUP BY BR.bookId HAVING BR.bookId=@BookId)
				BEGIN
					INSERT INTO dbo.borrow VALUES (@StudentId, @BookId, GETDATE(), NULL);
					COMMIT 
					SELECT 1
				END
			ELSE
				BEGIN
					SELECT 2
				END
		END TRY

		BEGIN CATCH
			ROLLBACK
			SELECT 0
		END CATCH
RETURN 0