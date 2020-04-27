CREATE PROCEDURE [dbo].[sp_ExecuteSelectStudentAndBook]
	
AS
	BEGIN TRY
		SELECT S.studentId, S.firstname + ' - ' + S.lastname AS StudentName FROM dbo.student S;

		SELECT B.bookId ,B.title + ' - ' + T.[name]  + ' - ' + A.firstname + '  ' + A.lastname AS BookInfo
		FROM dbo.book B
			INNER JOIN dbo.type T 
				ON B.typeId=T.typeId 
					INNER JOIN dbo.author A 
						ON A.authorId=B.authorId WHERE B.bookId NOT IN(SELECT BR.bookId FROM dbo.borrow BR WHERE BR.bookId=B.bookId)
		UNION
		SELECT DISTINCT B.bookId ,B.title + ' - ' + T.[name]  + ' - ' + A.firstname + '  ' + A.lastname AS BookInfo
		FROM dbo.book B
			INNER JOIN dbo.type T 
				ON B.typeId=T.typeId 
					INNER JOIN dbo.author A 
						ON A.authorId=B.authorId
						INNER JOIN dbo.borrow BR
						ON B.bookId=BR.bookId
						WHERE B.bookId NOT IN (SELECT BR.bookId FROM dbo.borrow BR WHERE BR.broughtDate IS NULL);
					
	END TRY
	BEGIN CATCH
		RETURN 0
	END CATCH
RETURN 1