CREATE PROCEDURE [dbo].[sp_UpdateDateOnReturnBook]
	@StudentId int,
	@BookId int
	
AS
	BEGIN TRAN
		BEGIN TRY
			IF(@StudentId=0)
				BEGIN
					SELECT 3
				END
			IF(@BookId=0)
				BEGIN
					SELECT 2
				END
			ELSE IF EXISTS(SELECT 1 FROM dbo.book WHERE bookId=@BookId)
				BEGIN
					UPDATE dbo.borrow SET broughtDate=GETDATE() 
					WHERE borrow.studentId=@StudentId AND borrow.bookId=@BookId AND borrow.broughtDate IS NULL;
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