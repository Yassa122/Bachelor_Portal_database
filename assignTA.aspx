<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="assignTA.aspx.cs" Inherits="Lastellast.assignTA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="coorid" runat="server" Text="Coordinator ID:"></asp:Label>
        </div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="ta" runat="server" Text="TA Id:"></asp:Label>
        <p>
            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
        </p>
        <asp:Label ID="proj" runat="server" Text="Project Code:"></asp:Label>
        <p>
            <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
        </p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Assign" Width="170" />
    </form>
</body>
</html>
