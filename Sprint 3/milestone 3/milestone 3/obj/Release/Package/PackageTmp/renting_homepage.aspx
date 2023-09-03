<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="renting_homepage.aspx.cs" Inherits="milestone_3.renting_homepage" %>

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
            <asp:Button ID="submit" BackColor="#7394AD" BorderStyle="None" runat="server" Text="submit an accident" OnClick="submit_Click" />
            
            <asp:Button ID="Button1" BackColor="#7394AD" BorderStyle="None" runat="server" Text="extras" OnClick="Button1_Click" />
            <asp:Button ID="updatevehicle" BackColor="#7394AD" BorderStyle="None" runat="server" Text="update vehicle" OnClick="updatevehicle_Click" />
            
        </div>
          <div>
              <asp:Label ID="Label1" runat="server" Text="vehicle stats"></asp:Label>
              <br />
              <asp:Label ID="Label2" runat="server" Text="number of rents"></asp:Label>
              <asp:Label ID="numberofrents" runat="server"></asp:Label>
              <asp:Label ID="Label3" runat="server" Text="   average rating"></asp:Label>
              <asp:Label ID="ratinglbl" runat="server"></asp:Label>
        <asp:Button ID="logout" BackColor="#7394AD" style="position:relative;left:340px" BorderStyle="None" runat="server" Text="logout" OnClick="logout_Click" />
              </div>

    </form>
</body>
</html>
