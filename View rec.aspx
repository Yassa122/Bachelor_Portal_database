<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View rec.aspx.cs" Inherits="Lastellast.View_rec" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Lecturer_id:"></asp:Label>
            <br />
            <asp:TextBox ID="lecturer_id" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View" Width="170px" />
        </div>
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
    </form>
</body>
</html>
