<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LecturerSignUP.aspx.cs" Inherits="marco.LecturerSignUP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Fill the following to create an account for a student<br />
            Type student in the following box
            <br />
            <asp:TextBox ID="SID" runat="server"></asp:TextBox>
            <br />
            Username<br />
            <asp:TextBox ID="title" runat="server"></asp:TextBox>
            <br />
         
            <asp:TextBox ID="pdf" runat="server"></asp:TextBox>
    			   <br />
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Submit" />
            <br />
        </div>
    </form>
</body>
</html>