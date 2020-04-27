CREATE PROCEDURE [dbo].[sp_InsertBookInfo]
	@Title varchar(50),
	@PageCount int,
	@Price decimal(10,2),
	@FirstName varchar(50),
	@LastName varchar(50),
	@Name varchar(50)
AS
	BEGIN TRAN
		BEGIN TRY
			IF NOT EXISTS(SELECT * FROM dbo.book WHERE title=@Title)
					BEGIN
						IF NOT EXISTS(SELECT * FROM dbo.author WHERE firstname=@FirstName AND lastname=@LastName)
							BEGIN
								/*INSERT INTO dbo.author VALUES (@FirstName, @LastName);
								DECLARE @AuthorId int;
								SET @AuthorId=@@IDENTITY;
								INSERT INTO dbo.type VALUES (@Name);
								INSERT INTO dbo.book VALUES(@Title,@PageCount,@Price,@AuthorID,@@IDENTITY);
								COMMIT 
								SELECT 1*/
								INSERT INTO dbo.author VALUES (@FirstName, @LastName);
								DECLARE @AuthorId int;
								SET @AuthorId=@@IDENTITY;

								IF EXISTS(SELECT typeId FROM dbo.type WHERE name=@Name)
									BEGIN
										DECLARE @typeId int
										SET @typeId=(SELECT typeId FROM dbo.type WHERE name=@Name);
										INSERT INTO dbo.book VALUES(@Title,@PageCount,@Price,@AuthorID,@typeId);
										COMMIT 
										SELECT 1
									END
								ELSE 
									BEGIN
										INSERT INTO dbo.type VALUES (@Name);
										INSERT INTO dbo.book VALUES(@Title,@PageCount,@Price,@AuthorID,@@IDENTITY);
										COMMIT 
										SELECT 1
									END
							END
						ELSE
							BEGIN
								SELECT 2
							END
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