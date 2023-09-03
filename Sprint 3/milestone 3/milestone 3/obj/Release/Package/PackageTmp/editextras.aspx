<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editextras.aspx.cs" Inherits="milestone_3.editextras" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">
    <form id="form1" runat="server">
        <div>
          <h1 style ="background-color:#7395AE;color:white;"><label style="position:relative ;left:600px">hackers rentals</label></h1>
            <asp:Label ID="Label1" runat="server" Text="extra id"></asp:Label>
            <asp:TextBox ID="extraidtxt" runat="server"></asp:TextBox>
            <asp:Label ID="extraidreq" runat="server" Text=""></asp:Label>
            <br /> 
        </div>
        <asp:Label ID="Label2" runat="server" Text="value"></asp:Label>
        <asp:TextBox ID="incvaltxt" runat="server"></asp:TextBox>
        <asp:Label ID="incvalreq" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="type" runat="server" Text="type"></asp:Label>
        <asp:DropDownList ID="types" runat="server" Width="280px">
            <asp:ListItem>please choose an extra type</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <p>
            <asp:Button ID="Button1" BackColor="#7394AD" BorderStyle="None" runat="server" Text="upate item" OnClick="Button1_Click" />
            <asp:Label ID="success" runat="server"></asp:Label>
            <asp:Button ID="Button2" BackColor="#7394AD" BorderStyle="None" runat="server" Text="update type" OnClick="Button2_Click" />
        </p>
    </form>
</body>
</html>
