<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScheduleDefense.aspx.cs" Inherits="Lastellast.ScheduleDefense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please enter S_ID:<br />
        </div>
        <asp:TextBox ID="sid" runat="server"></asp:TextBox>
        <br />
        <br />
        Please enter the date:<br />
        <asp:TextBox ID="datee" runat="server"></asp:TextBox>
        <br />
        <br />
        Please enter the time:<br />
        <asp:TextBox ID="timee" runat="server"></asp:TextBox>
        <br />
        <br />
        Please enter the location:<br />
        <asp:TextBox ID="loc" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Schedule meeting" Width="196px" />
        </p>
    </form>
</body>
</html>
