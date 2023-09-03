<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee_start.aspx.cs" Inherits="milestone_3.Employee_start" %>

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
            <br/>
            <div style="position:relative ;left:500px">
            <p>welcome to the employee login page please enter ur credinatials in the form below</p>
                </div>
             <div style="position:relative ;left:650px">
            <asp:Label ID="Label4" runat="server" Text="username "></asp:Label>
            <asp:TextBox ID="usernameTxt" runat="server"></asp:TextBox>
            <asp:Label ID="incorrectuser" runat="server" Text=""></asp:Label>
            <br />
            
        <asp:Label ID="Label5" runat="server" Text="password "></asp:Label>
        <asp:TextBox ID="passwordTxt" runat="server" TextMode="Password"></asp:TextBox>
        <asp:Label ID="incorrectpassword" runat="server" ext="" ></asp:Label>
        <br />
        <asp:Button ID="login" BackColor="#7394AD" BorderStyle="None" runat="server" Text="login" OnClick="Button1_Click" style="height: 25px" />
        <asp:Label ID="success" runat="server" Text="" ></asp:Label>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Not one of us yet? "></asp:Label>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://localhost:44396/employeeRegisteration.aspx">register here</asp:HyperLink>
    </div>
            </div>
         </form>
</body>
</html>
