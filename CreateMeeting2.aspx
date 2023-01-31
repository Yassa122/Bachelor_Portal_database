<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateMeeting2.aspx.cs" Inherits="marco.CreateMeeting2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             Create Meating<br />
            Please fill the following to create a meeting<br />
                        Leacturer ID<br />

        </div>
        <asp:TextBox ID="lecid" runat="server"></asp:TextBox>
        <br />
        Meeting Start Time<br />
        <asp:TextBox ID="meetET" runat="server"></asp:TextBox>
        <br />
        Meeting end etime<br />
        <asp:TextBox ID="meetST" runat="server"></asp:TextBox>
        <br />
        Meeting point<br />
        <asp:TextBox ID="meetingp" runat="server"></asp:TextBox>
        <br />
        Date<br />
        <asp:TextBox ID="meetingp0" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>
