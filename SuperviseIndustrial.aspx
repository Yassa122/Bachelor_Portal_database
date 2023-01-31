<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SuperviseIndustrial.aspx.cs" Inherits="marco.SuperviseIndustrial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Supervise industrial local projects</div>
        <p>
            fill the following to supervise</p>
        <p>
            Lecturer ID</p>
        <p>
            <asp:TextBox ID="lecid" runat="server"></asp:TextBox>
        </p>
        <p>
            Porject ID</p>
        <p>
            <asp:TextBox ID="ProjCode" runat="server" ></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="submit" OnClick="submit" />
        </p>
    </form>
</body>
</html>
