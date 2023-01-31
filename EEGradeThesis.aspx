<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EEGradeThesis.aspx.cs" Inherits="Lastellast.EEGradeThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter External Examiner ID:</div>
        <asp:TextBox ID="eeid" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Enter SID:"></asp:Label>
        <p>
            <asp:TextBox ID="sidd" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label2" runat="server" Text="Enter Thesis Title:"></asp:Label>
        <p>
            <asp:TextBox ID="tt" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label3" runat="server" Text="Enter External Examiner Grade"></asp:Label>
        <p>
            <asp:TextBox ID="eeg" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="gra" runat="server" Text="Grade" Width="170" OnClick="gra_Click" />
    </form>
</body>
</html>
