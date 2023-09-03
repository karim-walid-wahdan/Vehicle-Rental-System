<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listcustomerswithbills.aspx.cs" Inherits="milestone_3.listcustomerswithbills" %>

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
        </div>
        <asp:Label ID="Label1" runat="server" Text="the following payment info is avaliable :"></asp:Label>
    </form>
    <div id="div1" runat="server">
        <asp:Label ID="Label2" runat="server" Text="no due payments are avaiable"></asp:Label>
    </div>
</body>
</html>
