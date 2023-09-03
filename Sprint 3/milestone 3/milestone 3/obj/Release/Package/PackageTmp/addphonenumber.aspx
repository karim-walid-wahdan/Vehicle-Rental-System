<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addphonenumber.aspx.cs" Inherits="milestone_3.addphonenumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">
    <form id="form1" runat="server">
        <div>
               <div>
           <h1 style ="background-color:#7395AE;color:white;"><label style="position:relative ;left:600px">hackers rentals</label></h1>
             </div>
       
        
        <div style="position:relative ;left:650px">
        <asp:Label ID="Label1" runat="server" Text="phone number"></asp:Label>
        <asp:TextBox ID="phonetxt" runat="server"></asp:TextBox>
        <p>
        <asp:Button ID="Button1" runat="server" BackColor="#7394AD" BorderStyle="None" Text="add" OnClick="Button1_Click" />
            <asp:Label ID="successlbl" runat="server"></asp:Label>
        </p>
            </div>
             </div>
    </form>
</body>
</html>
