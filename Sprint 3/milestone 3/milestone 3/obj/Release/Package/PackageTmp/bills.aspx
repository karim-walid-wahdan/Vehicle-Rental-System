<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bills.aspx.cs" Inherits="milestone_3.bills" %>

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
        <div id="div1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="insurance "></asp:Label>
            <asp:DropDownList ID="insuranceddl" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="accident id"></asp:Label>
            <asp:TextBox ID="accidenttxt" runat="server"></asp:TextBox>
            <asp:Label ID="idreq" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="bill value :"></asp:Label>
            <asp:TextBox ID="billvaluetxt" runat="server"></asp:TextBox>
            <asp:Label ID="billreq" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Text="number of installments"></asp:Label>
            <asp:TextBox ID="numbertxt" runat="server"></asp:TextBox>
            <asp:Label ID="numberreq" runat="server"></asp:Label>
            <br />
            <asp:Button ID="Button1" BackColor="#7394AD" BorderStyle="None" runat="server" OnClick="Button1_Click" Text="issue" />
            <asp:Label ID="success" runat="server" Text=""></asp:Label>
            </div>
    </form>
</body>
</html>
