<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreatePR.aspx.cs" Inherits="marco.CreatePR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Lecturer create a progress report<br />
            fill the following to create a progress report<br />
            Lecturer ID<br />
            <asp:TextBox ID="lecid" runat="server" style="margin-bottom: 0px"></asp:TextBox>
            <br />
            Student ID<br />
            <asp:TextBox ID="studentid" runat="server"></asp:TextBox>
            <br />
            Date<br />
            <asp:TextBox ID="dateee" runat="server"></asp:TextBox>
            &nbsp;<br />
            Content<br />
            <asp:TextBox ID="content" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="submit" OnClick="submit" />
        </div>
    </form>
</body>
</html>
