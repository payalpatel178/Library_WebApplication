CREATE PROCEDURE [dbo].[sp_ExecuteSelectStudentWithBorrowBook]
AS
BEGIN TRY
		SELECT DISTINCT S.studentId, S.firstname + ' - ' + S.lastname AS StudentName 
		FROM dbo.student S 
		INNER JOIN dbo.borrow BR
		ON S.studentId=BR.studentId
		WHERE BR.broughtDate IS NULL;

	END TRY
	BEGIN CATCH
		RETURN 0
	END CATCH
RETURN 1