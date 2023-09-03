<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EMPLOYEE_HOMEPAGE.aspx.cs" Inherits="milestone_3.EMPLOYEE_HOMEPAGE" %>

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
            <asp:Button ID="update"  BackColor="#7394AD" BorderStyle="None" runat="server" Text="update vehicle" OnClick="update_Click" />
            <asp:Button ID="listrenting" BackColor="#7394AD" BorderStyle="None" runat="server" Text="rents details" OnClick="listrenting_Click" />
             <asp:Button ID="viewvehicles"  BackColor="#7394AD" BorderStyle="None" runat="server" Text="avaliable vehicles" OnClick="viewvehicles_Click" />
             <asp:Button ID="Button1" BackColor="#7394AD" BorderStyle="None" runat="server" Text="unavailable vehicles " OnClick="Button1_Click1" />
            <asp:Button ID="editextras" BackColor="#7394AD" BorderStyle="None" runat="server" Text="edit extras" OnClick="Button2_Click" />
            <asp:Button ID="additem"  BackColor="#7394AD" BorderStyle="None"  runat="server" Text="add item" OnClick="additem_Click" />
            <asp:Button ID="lcwb" BackColor="#7394AD" BorderStyle="None"  runat="server" Text="list customer with bills" OnClick="Button1_Click" />
            <asp:Button ID="deletepayments" BackColor="#7394AD" BorderStyle="None" runat="server" Text="delete payments" OnClick="Button3_Click" />
             <asp:Button ID="premuimcustomers" BackColor="#7394AD" BorderStyle="None" runat="server" Text="premium customers" OnClick="Button4_Click" />
             <asp:Button ID="providegift" BackColor="#7394AD" BorderStyle="None" runat="server" Text="provide a gift" OnClick="providegift_Click" style="margin-bottom: 0px" />
             <asp:Button ID="issuebills"  BackColor="#7394AD" BorderStyle="None" runat="server" Text="issue bills" OnClick="issuebills_Click" />
             <asp:Button ID="Button2"  BackColor="#7394AD" BorderStyle="None" runat="server" Text="location stats" OnClick="Button2_Click1" />
             <asp:Button ID="viewprofile" BackColor="#7394AD" style="position:relative;left:40px" BorderStyle="None" runat="server" Text="view ur profile" OnClick="viewprofile_Click" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
           
        <asp:Button ID="logout" BackColor="#7394AD" style="position:relative;left:340px " BorderStyle="None" runat="server" Text="logout" OnClick="logout_Click" />
        </div>
    </form>
</body>
</html>
