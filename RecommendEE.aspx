<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecommendEE.aspx.cs" Inherits="marco.RecommendEE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             Recommend External Examiner<br />
            fill the following to recommend an external examiner<br />
            Lecturer ID<br />
            <asp:TextBox ID="lecid" runat="server"></asp:TextBox>
            <br />
            Project ID<br />
            <asp:TextBox ID="projid" runat="server"></asp:TextBox>
            <br />
            External Examiner ID<br />
            <asp:TextBox ID="eeid" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="submit" OnClick="submit" style="height: 29px" />
        
        </div>
    </form>
</body>
</html>
