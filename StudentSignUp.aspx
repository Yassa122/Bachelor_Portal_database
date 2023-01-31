<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentSignUp.aspx.cs" Inherits="marco.StudentSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
</head>
<body>
    <form id="form1" runat="server">
        <div>
             Fill the following to create an account for a student<br />
             your first name<br />
            <asp:TextBox ID="firstname" runat="server"></asp:TextBox>
             <br />
             your last name<br />
            <asp:TextBox ID="lastname" runat="server"></asp:TextBox>
             <br />
             your major coder<br />
            <asp:TextBox ID="majorcode" runat="server"></asp:TextBox>
             <br />
             date of birth<br />
            <asp:TextBox ID="dob" runat="server"></asp:TextBox>
             <br />
             address<br />
            <asp:TextBox ID="address" runat="server"></asp:TextBox>
             <br />
             semester<br />
            <asp:TextBox ID="semster" runat="server"></asp:TextBox>
             <br />
             gpa<br />
            <asp:TextBox ID="gpa" runat="server"></asp:TextBox>
            <br />
            Username<br />
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
            <br />
            Email<br />
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <br />
            phone number<br />
            <asp:TextBox ID="phone" runat="server"></asp:TextBox>
             <br />
            <br />
            Your password will be auto generated.<br />
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Submit" />
            <br />
        </div>
    </form>
</body>
</html>