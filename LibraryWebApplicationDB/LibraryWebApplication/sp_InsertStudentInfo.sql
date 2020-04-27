CREATE PROCEDURE [dbo].[sp_InsertStudentInfo]
	@FirstName varchar(50),
	@LastName varchar(50),
	@BirthDate datetime,
	@Gender char(6),
	@Class varchar(20)
AS
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS(SELECT * FROM dbo.student WHERE firstname=@FirstName AND lastname=@LastName AND birthdate=@BirthDate AND gender=@Gender AND class=@Class)
				BEGIN
					INSERT INTO dbo.student VALUES (@FirstName, @LastName, @BirthDate, @Gender, @Class );
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