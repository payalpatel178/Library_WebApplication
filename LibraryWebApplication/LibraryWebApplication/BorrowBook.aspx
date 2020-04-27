<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BorrowBook.aspx.cs" Inherits="LibraryWebApplication.BorrowBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Borrow Book</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <div class="topnav">
  <a href="https://localhost:44333/index.aspx">Home</a>
  <a href="https://localhost:44333/AddStudent.aspx">Add Student</a>
  <a href="https://localhost:44333/AddBook.aspx">Add Book</a>
  <a class="active" href="#">Borrow Book</a>
  <a href="https://localhost:44333/ReturnBook.aspx">Return Book</a>
</div>
    <form id="form1" runat="server" class="allForms">
        <div class="heading">
            BORROW BOOK
        </div>
        
        <p>
            Select&nbsp; Student</p>
        <asp:DropDownList ID="ddlSelectStudent" runat="server" AppendDataBoundItems="True" Width="352px" Height="30px">
            <asp:ListItem Value="0">-- Please Select Student -- </asp:ListItem>
        </asp:DropDownList>
        <p>
            Choose Book</p>
        <p>
            <asp:DropDownList ID="ddlchooseBook" runat="server" AppendDataBoundItems="True" Width="350px" Height="30px" style="margin-top: 0px">
                <asp:ListItem Value="0">-- Please Select Book -- </asp:ListItem>
            </asp:DropDownList>
        </p>
        <asp:Button ID="btnBorrowBook" runat="server" OnClick="Button3_Click" Text="BORROW BOOK" Width="187px" BackColor="#0066FF" BorderColor="#0099FF" BorderStyle="Inset" Font-Bold="True" ForeColor="White" style="margin-left: 78px" Height="38px" />
        <asp:Label ID="Label3" runat="server"></asp:Label>
    </form>
    <div class="footer">
        <p>All Rights reserved &copy; 2019</p>
    </div>
</body>
</html>
