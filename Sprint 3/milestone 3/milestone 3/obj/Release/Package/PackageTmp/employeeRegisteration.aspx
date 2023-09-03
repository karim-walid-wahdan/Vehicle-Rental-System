<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employeeRegisteration.aspx.cs" Inherits="milestone_3.employeeRegisteration" %>

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
            </div>
            <br />
            <div style="position:relative ;left:450px">
            <p> Welcome to our family please enter the required data below for ur registeration as one of our employees</p> 
                </div>  
              <div style="position:relative ;left:650px">
                <asp:Label ID="Label4" runat="server" Text="ssn"></asp:Label>
                  <asp:TextBox ID="ssntxt" runat="server"></asp:TextBox>
                  <asp:Label ID="ssnreq" runat="server" Text=""></asp:Label>
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
                  <asp:Label ID="hpwreq" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Label ID="Label8" runat="server" Text="password"></asp:Label>
                  <asp:TextBox ID="passtxt" TextMode="Password" runat="server"></asp:TextBox>
                  <asp:Label ID="passreq" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Label ID="Label9" runat="server" Text="retype password"></asp:Label>
                  <asp:TextBox ID="passretxt" TextMode="Password" runat="server"></asp:TextBox>
                  <asp:Label ID="passrereq"  runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Button ID="joinus"  BackColor="#7395AE" BorderStyle="None" runat="server" Text="join us" OnClick="joinus_Click" />
                  <asp:Label ID="success" runat="server" Text=""></asp:Label>
                  <br />
                  </div>

        </div>
    </form>
</body>
</html>
