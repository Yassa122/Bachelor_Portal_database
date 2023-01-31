<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateLBP.aspx.cs" Inherits="marco.CreateLBP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            Create Local Bachelor Project</div>
        <p>
            please fill the following to create a new project</p>
        <p>
            Your ID</p>
        <p>
            <asp:TextBox ID="lecid" runat="server"></asp:TextBox>
        </p>
        <p>
            Project Code</p>
        <asp:TextBox ID="ProjCode" runat="server"></asp:TextBox>
        <br />
        Title<br />
        <asp:TextBox ID="Title" runat="server"></asp:TextBox>
        <br />
        Description<br />
        <asp:TextBox ID="Description" runat="server"></asp:TextBox>
        <br />
        Major Code<br />
        <asp:TextBox ID="majorcode" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit Project" OnClick="CreateProj" />
    </form>
</body>
</html>
