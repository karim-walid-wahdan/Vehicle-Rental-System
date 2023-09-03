<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deletepayments.aspx.cs" Inherits="milestone_3.deletepayments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">
    <form id="form1" runat="server">
        <div>
          <h1 style ="background-color:#7395AE;color:white;"><label style="position:relative ;left:600px">hackers rentals</label></h1>
            <asp:Label ID="Label1" runat="server" Text="year"></asp:Label>
            <asp:DropDownList ID="yearddl" runat="server" >
            </asp:DropDownList>
            <asp:Label ID="Label2" runat="server" Text="month"></asp:Label>
            <asp:DropDownList ID="monthddl" runat="server">
            </asp:DropDownList>
            <asp:Label ID="Label3" runat="server" Text="day"></asp:Label>
            <asp:DropDownList ID="dayddl" runat="server">
                
            </asp:DropDownList>
            <br />
            <asp:Button ID="delete" BackColor="#7394AD" BorderStyle="None" runat="server" Text="delete" OnClick="delete_Click" />
            <br /> 
        </div>


    </form>
</body>
</html>
