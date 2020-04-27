CREATE TABLE [dbo].[student]
(
	[studentId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [firstname] VARCHAR(50) NOT NULL, 
    [lastname] VARCHAR(50) NOT NULL, 
    [birthdate] DATETIME NOT NULL, 
    [gender] CHAR(6) NOT NULL, 
    [class] VARCHAR(20) NOT NULL
)
