<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_start.aspx.cs" Inherits="milestone_3.Customer_start" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">
    <form id="form1" runat="server">
        <div>
          <h1 style ="background-color:#7395AE;color:white;"><label style="position:relative ;left:600px">welcome to hackers rentals</label></h1>
            <br />
            <div style="position:relative ;left:600px">
            <asp:Label ID="Label1" runat="server" Text="customer count "></asp:Label>
            <asp:Label ID="customer_Count_Lbl" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="vehicle count "></asp:Label>
            <asp:Label ID="vehicle_Count_Lbl" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text= "rental count "></asp:Label>
            <asp:Label ID="rental_Count_Lbl" runat="server" Text="Label"></asp:Label>
         
            <br />
       </div>
            <div style="position:relative ;left:500px">
         <p>welcome to the customer login page please enter ur credinatials in the form below</p>
                </div>
            <div style="position:relative ;left:650px">
            <asp:Label ID="Label4" runat="server" Text="username "></asp:Label>
            <asp:TextBox ID="usernameTxt" runat="server"></asp:TextBox>
            <asp:Label ID="incorrectuser" runat="server" Text=""></asp:Label>
            <br/>
            <asp:Label ID="Label5" runat="server" Text="password "></asp:Label>
            <asp:TextBox ID="passwordTxt" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Label ID="incorrectpassword" runat="server" Text="" ></asp:Label>
            <br/>               
            <asp:Button ID="login" style="position:relative ;left:200px" runat="server" Text="login" BackColor="#7395AE" BorderStyle="None" OnClick="Button1_Click" />
            <br/>
            <asp:Label ID="success" style="position:relative ;left:100px" runat="server" Text="" ></asp:Label>
            <br/>
        <asp:Label ID="Label6" runat="server" Text="Not a part of our family yet? "></asp:Label>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://localhost:44396/customerRegisteration.aspx">register here</asp:HyperLink>
            </div>
          </div>
    </form>
</body>
</html>
