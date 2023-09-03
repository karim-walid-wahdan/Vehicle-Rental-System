<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="submitaccident.aspx.cs" Inherits="milestone_3.submitaccident" %>

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
        </div>
         <div style="position:relative ;left:670px">
            <p>please describe the accident in at most 100 charcters</p> 
            </div>
         <div style="position:relative ;left:650px">
                 
                  <asp:TextBox ID="txt" runat="server" Height="115px" Width="406px"></asp:TextBox>
                  <asp:Label ID="desreq" runat="server" Text=""></asp:Label>
                  <br />
            </div>
        <div style="position:relative ;left:830px">
         
        <asp:Button ID="submit"  BackColor="#7395AE" BorderStyle="None" runat="server" Text="submit" OnClick="submit_Click"/>
       </div>
            </form>
</body>
</html>
