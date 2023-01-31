<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="marco.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Login<br />
            <br />
            email<br />
            <asp:TextBox ID="emaill" runat="server"></asp:TextBox>
            <br />
            password<br />
            <asp:TextBox ID="passwordd" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button12" runat="server" Text="login" OnClick="Button12_Click" />
        </div>
    </form>
</body>
</html>
