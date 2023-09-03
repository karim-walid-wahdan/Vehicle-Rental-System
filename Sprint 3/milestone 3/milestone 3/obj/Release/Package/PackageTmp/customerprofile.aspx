<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customerprofile.aspx.cs" Inherits="milestone_3.customerprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">

    <form id="form1" runat="server">
        <div id="div1" runat="server"></div>
        <div>
           <h1 style ="background-color:#7395AE;color:white;"><label style="position:relative ;left:600px">hackers rentals</label></h1>
        </div>
        <asp:Button ID="update" runat="server" BackColor="#7394AD" BorderStyle="None" Text="update profile" OnClick="update_Click" />
        <asp:Button ID="phone" runat="server" BackColor="#7394AD" BorderStyle="None" Text="add phone numbers" OnClick="phone_Click" />
        <asp:Button ID="payment" runat="server" BackColor="#7394AD" BorderStyle="None" Text="payment methods" OnClick="payment_Click" />
        <br />
    </form>
</body>
</html>
