<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="currentlyrenting.aspx.cs" Inherits="milestone_3.currentlyrenting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">
    <form id="form1" runat="server">
        <div>
          <h1 style ="background-color:#7395AE;color:white;"><label style="position:relative ;left:600px">hackers rentals</label></h1>
            <br /> 
            <asp:Label ID="Label1" runat="server" Text="vehicles rented :"></asp:Label>

    <div id ="div1" runat="server">
    </div>
    <asp:Label ID="Label2" runat="server" Text="customers renting :"></asp:Label>
    <div id ="div2" runat="server">
    </div>
                </div>
        <asp:Label ID="Label3" runat="server" Text="extras rented"></asp:Label>
               
    <div id ="div3" runat="server">
    </div>
         </form>
</body>
</html>
