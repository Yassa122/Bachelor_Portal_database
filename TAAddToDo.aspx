<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TAAddToDo.aspx.cs" Inherits="Lastellast.TAAddToDo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add to the to-do list in meetings.<br />
            <br />
            Enter meeting id:<br />
            <br />
            <asp:TextBox ID="mid" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            Enter ToDoList:<br />
        </div>
        <asp:TextBox ID="list" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" />
        </p>
    </form>
</body>
</html>
