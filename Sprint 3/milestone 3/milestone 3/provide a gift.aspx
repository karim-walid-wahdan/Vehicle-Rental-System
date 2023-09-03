<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="provide a gift.aspx.cs" Inherits="milestone_3.provide_a_gift" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">
    <form id="form1" runat="server">
        <div>
          <h1 style ="background-color:#7395AE;color:white;"><label style="position:relative ;left:600px">hackers rentals</label></h1>
             <asp:Label ID="Label3" runat="server" Text="customer with the greatest gift :"></asp:Label>
            <div id="div1" runat="server">

            </div>
            <asp:Label ID="Label4" runat="server" Text="customers with un used gift cards :"></asp:Label>
            <br />
            <div id="div2" runat="server">
            </div>
            <br />
            <asp:Label ID="Label1" runat="server" Text="SSN"></asp:Label>
            <asp:TextBox ID="ssntxt" runat="server"></asp:TextBox>
            <asp:Label ID="ssnreq" runat="server"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="value"></asp:Label>
            <asp:TextBox ID="valuetxt" runat="server"></asp:TextBox>
            <asp:Label ID="valuereq" runat="server"></asp:Label>
            <br />
            <asp:Button ID="gift"  BackColor="#7394AD" BorderStyle="None" runat="server" Text="give gift" OnClick="gift_Click" />
            <asp:Label ID="success" runat="server"></asp:Label>
            <br /> 
        </div>
    </form>
</body>
</html>
