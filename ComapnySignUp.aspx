<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ComapnySignUp.aspx.cs" Inherits="marco.ComapnySignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Company Sign up<br />
            <br />
            name<br />
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <br />
            <br />
            Represtitve name<br />
            <asp:TextBox ID="rname" runat="server"></asp:TextBox>
            <br />
            Represtitve email<br />
            <asp:TextBox ID="remail" runat="server"></asp:TextBox>
            <br />
            <br />
            loaction<br />
            <asp:TextBox ID="location" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </div>
    </form>
</body>
</html>
