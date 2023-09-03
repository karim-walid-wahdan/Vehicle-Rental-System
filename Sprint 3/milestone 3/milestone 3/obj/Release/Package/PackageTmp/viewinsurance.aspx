<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewinsurance.aspx.cs" Inherits="milestone_3.viewinsurance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">
    <form id="form1" runat="server">
   
          <h1 style ="background-color:#7395AE;color:white;">
              <label style="position:relative ;left:650px">hackers rentals</label></h1>
        <asp:Button ID="orderrate" BackColor="#7394AD" BorderStyle="None" runat="server" Text="order by rate" OnClick="orderrate_Click" />
        <asp:Button ID="view" BackColor="#7394AD" BorderStyle="None" runat="server" Text="number of accidents" OnClick="view_Click" />
        <div id ="div1" runat="server">

        </div>
        
    <div id ="div2" runat="server">
    </div>
    </form>
</body>
</html>
