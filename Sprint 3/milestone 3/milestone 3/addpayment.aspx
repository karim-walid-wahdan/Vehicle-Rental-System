<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addpayment.aspx.cs" Inherits="milestone_3.addpayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head><body style="background-color:gray">
    <form id="form1" runat="server">
        <div>
               <div>
           <h1 style ="background-color:#7395AE;color:white;"><label style="position:relative ;left:600px">hackers rentals</label></h1>
                   <div id="div1" runat="server">
                       <asp:Label ID="Label6" runat="server" Text="no payment details registered to ur account"></asp:Label>
                   </div>
             </div>
       
        
        <div style="position:relative ;left:650px">
        <asp:Label ID="Label1" runat="server" Text="card number"></asp:Label>
         
        <asp:TextBox ID="cardtxt" runat="server"></asp:TextBox>
            <asp:Label ID="cardreq" runat="server" Text=""></asp:Label>
            <br />
            cvv<asp:TextBox ID="cvvtxt" runat="server"></asp:TextBox>
            <asp:Label ID="cvvreq" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="year"></asp:Label>
            <asp:TextBox ID="yeartxt" runat="server" Width="66px" ></asp:TextBox>
            <asp:Label ID="yearreq" runat="server" Text=""></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="month"></asp:Label>
            <asp:TextBox ID="monthtxt" runat="server" Width="66px"></asp:TextBox>
            <asp:Label ID="monthreq" runat="server" Text=""></asp:Label>
            <asp:Label ID="Label5" runat="server" Text="day"></asp:Label>
            <asp:TextBox ID="daytxt" runat="server" Width="66px"></asp:TextBox>
            <asp:Label ID="dayreq" runat="server" Text=""></asp:Label>
        <p>
        <asp:Button ID="Button1" runat="server" BackColor="#7394AD" BorderStyle="None" Text="add" OnClick="Button1_Click" />
            <asp:Label ID="successlbl" runat="server"></asp:Label>
       
            <asp:Button ID="Button2" BackColor="#7394AD" BorderStyle="None" runat="server" Text="delete" OnClick="Button2_Click" />
       
            </p>
            </div>
             </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
