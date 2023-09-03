<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updatevehicle.aspx.cs" Inherits="milestone_3.updatevehicle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">
    <form id="form1" runat="server">
   
          <h1 style ="background-color:#7395AE;color:white;">
              <label style="position:relative ;left:650px">hackers rentals</label></h1>
        <div>

            <asp:Label ID="Label3" runat="server" Text="gps location"></asp:Label>

            <asp:TextBox ID="gpstxt" runat="server"></asp:TextBox>

            <asp:Button ID="updatelocation" BackColor="#7394AD" BorderStyle="None" runat="server" Text="updatelocation" OnClick="updatelocation_Click" />

            <asp:Label ID="gpssuccess" runat="server" Text=""></asp:Label>

            <br />
            <asp:Label ID="Label4" runat="server" Text="range"></asp:Label>
            <asp:TextBox ID="rangetxt" runat="server"></asp:TextBox>
            <asp:Button ID="updateRange" BackColor="#7394AD" BorderStyle="None" runat="server" Text="update range left" OnClick="updateRange_Click" />

            <asp:Label ID="success" runat="server" Text=""></asp:Label>

            <br />
            <asp:Label ID="Label2" runat="server" Text="parking location pin"></asp:Label>
            <asp:DropDownList ID="locationddl" runat="server">
            </asp:DropDownList>

            <asp:Label ID="Label1" runat="server" Text="rate"></asp:Label>
            <asp:TextBox ID="ratetxt" runat="server"></asp:TextBox>
            <asp:Label ID="ratingreq" runat="server"></asp:Label>

            <asp:Button ID="returnvehicle" BackColor="#7394AD" BorderStyle="None" runat="server" Text="return" OnClick="returnvehicle_Click" />

            <br />

        </div>
    </form>
</body>
</html>
