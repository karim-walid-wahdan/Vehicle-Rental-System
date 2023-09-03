<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rentavehicle.aspx.cs" Inherits="milestone_3.rentavehicle" %>

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
            <div style="position:relative ;left:450px">
            <p> Welcome to our family please enter the required data below for ur registeration as one of our customers</p> 
            </div>
             <div style="position:relative ;left:650px">
                  <asp:Label ID="Label4" runat="server" Text="vehicle id"></asp:Label>
                  <asp:DropDownList ID="vehicleddl" runat="server">
                  </asp:DropDownList>
                  <br />
                  <asp:Label ID="Label7" runat="server" Text="insurance id"></asp:Label>
                  <asp:DropDownList ID="insuranceddl" runat="server">
                  </asp:DropDownList>
                  <br />
                  <asp:Label ID="Label5" runat="server" Text="time"></asp:Label>
                  <asp:TextBox ID="timetxt" runat="server"></asp:TextBox>
                  <asp:Label ID="timereq" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Label ID="Label8" runat="server" Text="destination"></asp:Label>
                  <asp:TextBox ID="destxt"  runat="server"></asp:TextBox>
                  <asp:Label ID="destinationreq" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Button ID="joinus"  BackColor="#7395AE" BorderStyle="None" runat="server" Text="rent" OnClick="joinus_Click" style="height: 25px" />
                  <asp:Label ID="successlbl" runat="server" Text=""></asp:Label>
                  <br />
            </div>
        </div>
    </form>
</body>
</html>
