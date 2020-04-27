<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="LibraryWebApplication.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="topnav">
  <a class="active" href="#">Home</a>
  <a href="https://localhost:44333/AddStudent.aspx">Add Student</a>
  <a href="https://localhost:44333/AddBook.aspx">Add Book</a>
  <a href="https://localhost:44333/BorrowBook.aspx">Borrow Book</a>
  <a href="https://localhost:44333/ReturnBook.aspx">Return Book</a>
</div>
        <div>
            <h1 class="headingForHome">
            WELCOME TO THE WORLD <br/>OF INFORMATION AND IMAGINATION</h1>
        <p>
        </div>

    <div class="footer">
        <p>All Rights reserved &copy; 2019</p>
    </div>
        <p>
            <asp:Image ID="Image1" runat="server" src="images\picture.png" Height="300px" Width="450px" style="padding-left: 450px;" />
        </p>
    </form>
        
</body>
</html>
