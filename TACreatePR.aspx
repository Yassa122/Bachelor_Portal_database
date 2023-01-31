<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TACreatePR.aspx.cs" Inherits="Lastellast.TACreatePR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please enter TA-ID:<br />
        </div>
        <asp:TextBox ID="tid" runat="server"></asp:TextBox>
        <br />
        <br />
        Please enter S-ID:<br />
        <asp:TextBox ID="sid" runat="server"></asp:TextBox>
        <br />
        Please enter Date:<br />
        <asp:TextBox ID="dt" runat="server"></asp:TextBox>
        <br />
        Please enter content:<br />
        <asp:TextBox ID="ct" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create" />
        </p>
    </form>
</body>
</html>
