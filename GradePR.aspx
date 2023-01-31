<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GradePR.aspx.cs" Inherits="marco.GradePR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            Lecturer grade a progress report<br />
            fill the following to grade the progress report for a spesific student<br />
            Lecturer ID<br />
            <asp:TextBox ID="lecid" runat="server" OnTextChanged="TextBox1_TextChanged" style="margin-bottom: 0px"></asp:TextBox>
            <br />
            Student ID<br />
            <asp:TextBox ID="studentid" runat="server"></asp:TextBox>
            <br />
            date<br />
            <input id="date" type="date" name="begin" 
            placeholder="dd-mm-yyyy" value=""
            min="1997-01-01" max="2030-12-31">
            <br />
            grade<br />
            <asp:TextBox ID="grade" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="submit" OnClick="submit" />
        </div>
    </form>
</body>
</html>
