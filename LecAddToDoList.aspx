<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LecAddToDoList.aspx.cs" Inherits="marco.LecAddToDoList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            Create To Do List By The Lecturer<br />
            Please fill the following to make a to-do list in a the meeting.<br />
            Meeting ID<br />
            <asp:TextBox ID="meetingID" runat="server"></asp:TextBox>
            <br />
            To-Do list<br />
            <asp:TextBox ID="todoList" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="submit1" runat="server" Text="Submit" onclick="submit"/>
        </div>
    </form>
</body>
</html>
