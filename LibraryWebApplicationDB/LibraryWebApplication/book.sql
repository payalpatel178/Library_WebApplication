CREATE TABLE [dbo].[book]
(
	[bookId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [title] VARCHAR(50) NOT NULL, 
    [pagecount] INT NOT NULL, 
    [price] DECIMAL(10, 2) NOT NULL, 
    [authorId] INT NOT NULL, 
    [typeId] INT NOT NULL, 
    CONSTRAINT [FK_book_author] FOREIGN KEY ([authorId]) REFERENCES [author]([authorId]), 
    CONSTRAINT [FK_book_type] FOREIGN KEY ([typeId]) REFERENCES [type]([typeId])
)
