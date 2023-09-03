<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="extrashomepage.aspx.cs" Inherits="milestone_3.extrashomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">
    <form id="form1" runat="server">
   <div>
          <h1 style ="background-color:#7395AE;color:white;">
              <label style="position:relative ;left:650px">hackers rentals</label></h1>
          
        </div>
        
              <asp:Button ID="view" BackColor="#7394AD" BorderStyle="None" runat="server" Text="order by rate" OnClick="view_Click" />
        <asp:Button ID="viewmin" BackColor="#7394AD" BorderStyle="None" runat="server" Text="view min per type" OnClick="viewmin_Click" />

        <div id="div1" runat="server">

            </div>
        <br />
        <br />
<br />

        <div id="div2" runat="server">

            </div>
        <br />
        <div id="div3" runat="server">

            <asp:Label ID="Label1" runat="server" Text="extra id"></asp:Label>
            <asp:TextBox ID="extratxt" runat="server"></asp:TextBox>
            <asp:Button ID="rent" BackColor="#7394AD" BorderStyle="None" runat="server" Text="rent" OnClick="rent_Click" />

            <asp:Button ID="return"  BackColor="#7394AD" BorderStyle="None" runat="server" Text="return" OnClick="return_Click" />

            <asp:Label ID="wrongid" runat="server" Text=""></asp:Label>

            <br />

            </div>

    </form>
</body>
</html>
