CREATE TABLE [dbo].[borrow]
(
	[borrowId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [studentId] INT NOT NULL, 
    [bookId] INT NOT NULL, 
    [takenDate] DATETIME NOT NULL, 
    [broughtDate] DATETIME NOT NULL, 
    CONSTRAINT [FK_borrow_student] FOREIGN KEY ([studentId]) REFERENCES [student]([studentId]), 
    CONSTRAINT [FK_borrow_book] FOREIGN KEY ([bookId]) REFERENCES [book]([bookId])
)
