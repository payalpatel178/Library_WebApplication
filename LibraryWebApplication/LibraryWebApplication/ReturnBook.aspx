<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReturnBook.aspx.cs" Inherits="LibraryWebApplication.ReturnBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Return Book</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <div class="topnav">
  <a href="https://localhost:44333/index.aspx">Home</a>
  <a href="https://localhost:44333/AddStudent.aspx">Add Student</a>
  <a href="https://localhost:44333/AddBook.aspx">Add Book</a>
  <a href="https://localhost:44333/BorrowBook.aspx">Borrow Book</a>
  <a class="active" href="#">Return Book</a>
</div>
    <form id="form1" runat="server" class="allForms">
        <div class="heading">
            RETURN BOOK</div>
        <p>
            Select Student</p>
        <p>
            <asp:DropDownList ID="ddlSelectStudentToReturnBook" runat="server" AppendDataBoundItems="True" Width="285px" OnSelectedIndexChanged="ddlSelectStudentToReturnBook_SelectedIndexChanged" AutoPostBack="true" Height="30px">
            <asp:ListItem Value="0">-- Please Select student -- </asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            Select Book To Be Returned by Student</p>
        <asp:DropDownList ID="ddlChooseBookToReturn" AppendDataBoundItems="True" runat="server" Width="285px" Height="30px">
            <asp:ListItem Value="0">-- List Of Borrowed Books -- </asp:ListItem>
        </asp:DropDownList>
        <p>
            <asp:Button ID="btnReturnBook" runat="server" BackColor="#0066FF" BorderColor="#0099FF" BorderStyle="Inset" Font-Bold="True" ForeColor="White" Height="42px" style="margin-left: 39px" Text="RETURN BOOK" Width="190px" OnClick="Button4_Click" />
            <asp:Label ID="Label4" runat="server"></asp:Label>
        </p>
    </form>
    <div class="footer">
        <p>All Rights reserved &copy; 2019</p>
    </div>
</body>
</html>
