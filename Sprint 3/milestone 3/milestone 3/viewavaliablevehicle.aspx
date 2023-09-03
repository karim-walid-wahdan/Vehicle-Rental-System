<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewavaliablevehicle.aspx.cs" Inherits="milestone_3.avaliablevehicle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <body style="background-color:gray">
    <form id="form1" runat="server">
        <div>
            <div >
          <h1 style ="background-color:#7395AE;color:white;"><label style="position:relative ;left:600px"> hackers rentals</label></h1>
                <asp:Button ID="brand" runat="server" BackColor="#7394AD" BorderStyle="None" Text="order by brand" OnClick="brand_Click"/>
                <asp:Button ID="class" runat="server" BackColor="#7394AD" BorderStyle="None" Text="order by class" OnClick="class_Click"/>
                <asp:Button ID="price" runat="server" BackColor="#7394AD" BorderStyle="None" Text="order by price" OnClick="price_Click"/>
            <br />
            </div>
            <div id ="div1" runat="server" >

            </div>
        </div>
    </form>
</body>
</html>
