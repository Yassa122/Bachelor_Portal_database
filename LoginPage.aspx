<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="marco.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             Welcome to Login page.<br />
             Enter your email:<br />
        <asp:TextBox ID="emailll" runat="server"></asp:TextBox>
        <br />
             Enter your password:<br />
        <asp:TextBox ID="passwordd" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Loginbutton" runat="server" Text="login" OnClick="Login" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="create LBP" Width="118px" OnClick="createlbp" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="create meeting" OnClick="createmeeting" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" Text="create PR" OnClick="createpr" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" Text="grade defence" OnClick="graded" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button5" runat="server" Text="grade pr" OnClick="gradepr" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button6" runat="server" Text="grade thesis" OnClick="gradethesis" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button7" runat="server" Text="add to do list" OnClick="addtodo" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button8" runat="server" Text="recommend ee" OnClick="recommendee" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button9" runat="server" Text="supervise indus project" Width="190px" OnClick="suprviseindusturial" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button10" runat="server" Text="view meeting" OnClick="viewmeeting" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button11" runat="server" Text="view EE" OnClick="viewee" />
    
        </div>
    </form>
</body>
</html>
