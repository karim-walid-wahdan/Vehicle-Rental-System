<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="startpage.aspx.cs" Inherits="milestone_3.startpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:gray">
    <form id="form1" runat="server">
        <div >
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
            <br />
                </div>
                <div style="position:relative ;left:650px">
            <asp:Label ID="Label4" runat="server" Text="Are one of out customers or employees"></asp:Label>

            <br />
            <div style="position:relative ;left:40px">
            <asp:Button ID="customerPage" runat="server" BackColor="#7394AD" BorderStyle="None" Text="customer" OnClick="customerPage_Click" />
            <asp:Button style="position:relative ;left:20px" ID="employeePage" runat="server" BackColor="#7395AE" BorderStyle="None" Text="employee" OnClick="employeePage_Click" />
          
                    </div>
            </div>
        </div>
    </form>
</body>
</html>
