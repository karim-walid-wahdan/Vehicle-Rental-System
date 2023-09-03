<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vehicleupdate.aspx.cs" Inherits="milestone_3.vehicleupdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">
    <form id="form1" runat="server">
        <div>
           <h1 style ="background-color:#7395AE;color:white;"><label style="position:relative ;left:600px">hackers rentals</label></h1>
        </div>
        <asp:Label ID="Label1" runat="server" Text="vehicle id"></asp:Label>
        <asp:TextBox ID="vehicletxt" runat="server"></asp:TextBox>
        <asp:Label ID="vehiclereq" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="range"></asp:Label>
        <asp:TextBox ID="rangetxt" runat="server"></asp:TextBox>
        <asp:Label ID="rangereq" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="status"></asp:Label>
        <asp:DropDownList ID="statusddl" runat="server">
            <asp:ListItem>available</asp:ListItem>
            <asp:ListItem>rented</asp:ListItem>
            <asp:ListItem>in maintenance</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Button ID="update" BackColor="#7394AD" BorderStyle="None" runat="server" Text="update vehicle" OnClick="update_Click" />
        <asp:Label ID="success" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
