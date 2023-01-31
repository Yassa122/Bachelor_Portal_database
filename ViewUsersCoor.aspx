<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewUsersCoor.aspx.cs" Inherits="Lastellast.ViewUsersCoor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Your User Type :<br />
            <asp:TextBox ID="usertype" runat="server"></asp:TextBox>
            <br />
            Enter User Id:</div>
        <asp:TextBox ID="userid" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="details" runat="server" Text="see details" Width="170" OnClick="details_Click" />
        </p>
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
    </form>
</body>
</html>
