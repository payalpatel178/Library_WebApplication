CREATE PROCEDURE [dbo].[sp_ExecuteBookOnStudentSelect]
	@StudentId int
AS
	BEGIN TRY

		SELECT  B.bookId ,B.title + ' - ' + T.[name]  + ' - ' + A.firstname + '  ' + A.lastname AS BookInfo
		FROM dbo.book B 
			INNER JOIN dbo.type T 
				ON B.typeId=T.typeId 
					INNER JOIN dbo.author A 
						ON A.authorId=B.authorId
							INNER JOIN dbo.borrow BR
							ON BR.bookId=B.bookId
							WHERE BR.studentId=@StudentId AND BR.broughtDate IS NULL;
		
								
	END TRY
	BEGIN CATCH
		RETURN 0
	END CATCH
RETURN 1
