<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LecturerSignUP.aspx.cs" Inherits="marco.LecturerSignUP" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Fill the following to create an account for a employee 
<br />
            Type employee in the following box
            <br />
        <div>
            Fill the following to create an account for a company 
<br />
            Type company in the following box
            <br />

            <asp:TextBox ID=TextBox1
 runat="server"></asp:TextBox>
            <br />
            Username<br />
            <asp:TextBox ID=TextBox2 runat="server"></asp:TextBox>
            <br />
            Email<br />
            <asp:TextBox ID=TextBox3 runat="server"></asp:TextBox>
            <br />
            Name<br />
            <asp:TextBox ID="phone" runat="server"></asp:TextBox>
            <br />
            Phone<br />
   <asp:TextBox ID=TextBox4 runat="server"></asp:TextBox>
            <br />
            Field<br />
   <asp:TextBox ID=TextBox5 runat="server"></asp:TextBox>
            <br />
            staff_id<br />
   <asp:TextBox ID=TextBox6 runat="server"></asp:TextBox>
            <br />
            Pass<br />

            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Submit" />
            <br />
        </div>
    </form>
</body>
</html>