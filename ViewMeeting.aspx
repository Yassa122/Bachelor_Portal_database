<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewMeeting.aspx.cs" Inherits="marco.ViewMeeting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            View the meeting details (leacturer)<br />
            Please fill the following to view the meeting details.<br />
            Lecturer ID<br />
            <asp:TextBox ID="lecid" runat="server"></asp:TextBox>
            <br />
            Meeting ID<br />
            <asp:TextBox ID="meetid" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="view" runat="server" Text="view" />
        </div>
    </form>
</body>
</html>
