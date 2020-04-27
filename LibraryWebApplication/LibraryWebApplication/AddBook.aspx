<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="LibraryWebApplication.AddBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Book</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <div class="topnav">
  <a href="https://localhost:44333/index.aspx">Home</a>
  <a href="https://localhost:44333/AddStudent.aspx">Add Student</a>
  <a class="active" href="#">Add Book</a>
  <a href="https://localhost:44333/BorrowBook.aspx">Borrow Book</a>
  <a href="https://localhost:44333/ReturnBook.aspx">Return Book</a>
</div>
    <form id="form1" runat="server" class="allForms">
        <div class="heading">
            ADD NEW BOOK</div>
        <p>
            Title</p>
        <p>
            <asp:TextBox ID="txtTitle" runat="server" Width="235px" Height="20px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="Please Enter Title" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            Page Count</p>
        <p>
            <asp:TextBox ID="txtPageCount" runat="server" Width="235px" Height="20px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPageCount" ErrorMessage="Please Enter Page Count" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            Price</p>
        <p>
            <asp:TextBox ID="txtPrice" runat="server" Width="235px" Height="20px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice" ErrorMessage="Please Enter Price" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            Author&#39;s FirstName</p>
        <p>
            <asp:TextBox ID="txtAuthorFirstName" runat="server" Width="235px" Height="20px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAuthorFirstName" ErrorMessage="Please Enter Author's FirstName" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            Author&#39;s LastName</p>
        <p>
            <asp:TextBox ID="txtAuthorLastName" runat="server" Width="235px" Height="20px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAuthorLastName" ErrorMessage="Please Enter Author's LastName" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            Book Type</p>
        <p>
            <asp:TextBox ID="txtBookType" runat="server" Width="235px" Height="20px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtBookType" ErrorMessage="Please Enter Book Type" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Button ID="book_register" runat="server" OnClick="Button2_Click" style="margin-left: 35px" Text="ADD BOOK" Width="159px" BackColor="#0066FF" BorderColor="#0066FF" BorderStyle="Inset" Font-Bold="True" ForeColor="White" Height="29px" />
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </p>
    </form>
    <div class="footer">
        <p>All Rights reserved &copy; 2019</p>
    </div>
</body>
</html>
