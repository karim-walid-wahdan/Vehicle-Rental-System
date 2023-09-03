<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customerHomePage.aspx.cs" Inherits="milestone_3.customerHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">
    <form id="form1" runat="server">
   
          <h1 style ="background-color:#7395AE;color:white;">
              <label style="position:relative ;left:650px">hackers rentals</label></h1>
        
        <asp:Button ID="viewavaliablevehicles" BackColor="#7394AD" BorderStyle="None" runat="server" Text="avaliable vehicles" OnClick="viewavaliablevehicles_Click" />
        <asp:Button ID="viewinsurances" BackColor="#7394AD" BorderStyle="None" runat="server" Text="insurances " OnClick="viewinsurances_Click" />
        <asp:Button ID="viewneverrented" BackColor="#7394AD" BorderStyle="None" runat="server" Text="never rented" OnClick="viewneverrented_Click" />
        <asp:Button ID="viewaccidents" BackColor="#7394AD" BorderStyle="None" runat="server" text="ur accidents" OnClick="viewaccidents_Click" />
        <asp:Button ID="viewpayments" BackColor="#7394AD" BorderStyle="None" runat="server" Text="due payments" OnClick="viewpayments_Click" />
        <asp:Button ID="rent" BackColor="#7394AD" BorderStyle="None" runat="server" Text="rent a vehicle" OnClick="rent_Click" />
        <asp:Button ID="viewprofile" BackColor="#7394AD" style="position:relative;left:740px" BorderStyle="None" runat="server" Text="view ur profile" OnClick="viewprofile_Click" />
            <br />
        <asp:Button ID="logout" BackColor="#7394AD" style="position:relative;left:1340px ;top:600px" BorderStyle="None" runat="server" Text="logout" OnClick="logout_Click" />
    </form>

    </body>
</html>
