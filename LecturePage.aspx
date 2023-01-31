<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LecturePage.aspx.cs" Inherits="marco.LecturePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="direction: ltr">
            
            what do you want to do<br />
            <asp:Button ID="Button1" runat="server" Text="create lbp" OnClick="createlbn" />
            
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="addtodoo" runat="server" Text="addtodo" OnClick="addtodo" />
            
        &nbsp;&nbsp;
            <asp:Button ID="viewmeeting" runat="server" Text="view meeting" OnClick="viewm" />
            
            <asp:Button ID="Button5" runat="server" Text="create meeting" OnClick="createm" />
            
            <asp:Button ID="Button6" runat="server" Text="View ee" OnClick="viewee" />
            
            <asp:Button ID="Button7" runat="server" Text="Recommend ee" OnClick="recommende" />
            
            <asp:Button ID="Button8" runat="server" Text="supervise Industrial" OnClick="superviseInd" />
            
            <asp:Button ID="Button9" runat="server" Text="grade Thesis" OnClick="gradeT" />
            
            <asp:Button ID="Button10" runat="server" Text="grade defence" OnClick="gradeD" />
            
            <asp:Button ID="Button11" runat="server" Text="grade Thesis" OnClick="gradeT" />
            
            <asp:Button ID="Button12" runat="server" Text="create progress report" OnClick="createPR" />
            
        </div>
    </form>
    <p>
        </p>
</body>
</html>
