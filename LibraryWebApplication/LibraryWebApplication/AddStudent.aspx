<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="LibraryWebApplication.AddStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Student</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <div class="topnav">
  <a href="https://localhost:44333/index.aspx">Home</a>
  <a class="active" href="#">Add Student</a>
  <a href="https://localhost:44333/AddBook.aspx">Add Book</a>
  <a href="https://localhost:44333/BorrowBook.aspx">Borrow Book</a>
  <a href="https://localhost:44333/ReturnBook.aspx">Return Book</a>
</div>
    <form id="form1" runat="server" class="allForms">
        <div class="heading">
            STUDENT REGISTRATION</div>
        <p>
            First Name</p>
        <p class="errorMessage">
            <asp:TextBox ID="firstname" runat="server" Height="20px" style="margin-left: 1px" Width="235px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ControlToValidate="firstname" ErrorMessage="Please Enter FirstName" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            Last Name</p>
        <p>
            <asp:TextBox ID="lastname" runat="server" style="margin-left: 1px" Width="235px" Height="20px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ControlToValidate="lastname" ErrorMessage="Please Enter LastName" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            Date of Birth
            </p>
        <p>
            <asp:TextBox ID="birthdate" runat="server" style="margin-left: 1px" Width="235px" Height="20px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDob" runat="server" ControlToValidate="birthdate" ErrorMessage="Please Enter Date of Birth in yyyy-mm-dd format" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p style="width: 243px">
            Gender
            <asp:RadioButtonList ID="RadioButtonListGender" runat="server" style="margin-left: 0px; margin-top: 0px" Width="235px">
                <asp:ListItem Selected="True">Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            Class</p>
        <p>
            <asp:TextBox ID="class" runat="server" style="margin-left: 1px" Width="235px" Height="20px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorClass" runat="server" ControlToValidate="class" ErrorMessage="Please Enter Class" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <asp:Button ID="register" runat="server" OnClick="Button1_Click" style="margin-left: 56px" Text="REGISTER" Width="170px" BackColor="#0066FF" BorderColor="#0099FF" BorderStyle="Inset" Font-Bold="True" ForeColor="White" Height="38px" />
        <asp:Label ID="Label1" runat="server" Font-Italic="True" ForeColor="White"></asp:Label>
    </form>
    <div class="footer">
        <p>All Rights reserved &copy; 2019</p>
    </div>
</body>
</html>
