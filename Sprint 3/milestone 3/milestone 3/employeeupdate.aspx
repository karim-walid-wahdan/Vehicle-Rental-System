<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employeeupdate.aspx.cs" Inherits="milestone_3.employeeupdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head><body style="background-color:gray">
    <form id="form1" runat="server">
        <div>
            <div>
          <h1 style ="background-color:#7395AE;color:white;"><label style="position:relative ;left:600px"> hackers rentals</label></h1>
            <br />

            </div>
             <div style="position:relative ;left:650px">
                 
            <p >please fill the form to update ur profile</p> 
                  <br />
                  <asp:Label ID="Label7" runat="server" Text="name"></asp:Label>
                  <asp:TextBox ID="nametxt" runat="server"></asp:TextBox>
                  <asp:Label ID="namereq" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Label ID="Label5" runat="server" Text="email"></asp:Label>
                  <asp:TextBox ID="emailtxt" runat="server"></asp:TextBox>
                  <asp:Label ID="emailreq" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Label ID="Label6" runat="server" Text="address"></asp:Label>
                  <asp:TextBox ID="addresstxt" runat="server"></asp:TextBox>
                  <asp:Label ID="addressreq" runat="server" Text=""></asp:Label>
                  <br />
                 <asp:Label ID="Label10" runat="server" Text="hours per week"></asp:Label>
                 <asp:TextBox ID="hpwtxt" runat="server"></asp:TextBox>
                 <asp:Label ID="hoursperweekreq" runat="server"></asp:Label>
                  <br />
                  <asp:Label ID="Label8" runat="server" Text="password"></asp:Label>
                  <asp:TextBox ID="passtxt" TextMode="Password" runat="server"></asp:TextBox>
                  <asp:Label ID="passreq" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Label ID="Label9" runat="server" Text="retype password"></asp:Label>
                  <asp:TextBox ID="passretxt" TextMode="Password" runat="server"></asp:TextBox>
                  <asp:Label ID="passrereq"  runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Button ID="update" runat="server"  BackColor="#7394AD" BorderStyle="None" Text="update profile" OnClick="update_Click" />
                 <asp:Label ID="success" runat="server" Text=""></asp:Label>
                 </div>

        </div>
    </form>
</body>

</html>
