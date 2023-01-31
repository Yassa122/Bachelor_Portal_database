<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GradeThesis.aspx.cs" Inherits="marco.GradeThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Lecturer grade thesis<br />
            fill the following to grade the thesis of a specific student<br />
            Lecturer ID<br />
            <asp:TextBox ID="lecid" runat="server" style="margin-bottom: 0px"></asp:TextBox>
            <br />
            Student ID<br />
            <asp:TextBox ID="studentid" runat="server"></asp:TextBox>
            <br />
            Thesis Title<br />
            <asp:TextBox ID="thesistitle" runat="server"></asp:TextBox>
            <br />
            Grade<br />
            <asp:TextBox ID="grade" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="submit" OnClick="submit" />
        </div>
    </form>
</body>
</html>
