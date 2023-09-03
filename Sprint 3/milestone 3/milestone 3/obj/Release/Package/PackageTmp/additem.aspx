<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="additem.aspx.cs" Inherits="milestone_3.additem" %>

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
    <asp:Label ID="Label1" runat="server" Text="choose item to add"></asp:Label>
    <asp:DropDownList ID="items" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>please choose an item</asp:ListItem>
            <asp:ListItem >location</asp:ListItem>
                <asp:ListItem >vehicle</asp:ListItem>
                <asp:ListItem >extra</asp:ListItem>
                <asp:ListItem >insurance</asp:ListItem>
        </asp:DropDownList>
    <asp:Label ID="checker" runat="server" Text=""></asp:Label>
    <div id="locationdiv" runat="server" style="display:none">
        <asp:Label ID="Label2" runat="server" Text="pin number"></asp:Label>
         <asp:TextBox ID="pinnmbtxt" runat="server"></asp:TextBox>
        <asp:Label ID="pinnumbereq" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="location"></asp:Label>
        <asp:TextBox ID="loctxt" runat="server"></asp:TextBox>
        <asp:Label ID="locreq" runat="server" Text=""></asp:Label>
    </div>
    <div id="vehiclediv" runat="server" style="display:none" >
        <asp:Label ID="Label5" runat="server" Text="engine type"></asp:Label>
        <asp:DropDownList ID="motortypeddl" runat="server">
            <asp:ListItem>gas</asp:ListItem>
            <asp:ListItem>electric</asp:ListItem>
        </asp:DropDownList> 
         <br />
        <asp:Label ID="Label4" runat="server" Text="ownership status"></asp:Label>
        <asp:DropDownList ID="ownsddl" runat="server">
            <asp:ListItem>owned</asp:ListItem>
            <asp:ListItem>leased</asp:ListItem>
        </asp:DropDownList> 
         <br />
        <asp:Label ID="Label14" runat="server" Text="rate"></asp:Label>
        <asp:TextBox ID="ratetxt" runat="server"></asp:TextBox>
        <asp:Label ID="ratereq" runat="server" Text=""></asp:Label>
         <br />
        <asp:Label ID="Label16" runat="server" Text="class"></asp:Label>
        <asp:DropDownList ID="classddl" runat="server">
            <asp:ListItem>2-wheel</asp:ListItem>
            <asp:ListItem>3-wheel</asp:ListItem>
        </asp:DropDownList>
         <br />
        <asp:Label ID="Label18" runat="server" Text="brand"></asp:Label>
        <asp:TextBox ID="brandtxt" runat="server"></asp:TextBox>
        <asp:Label ID="brandreq" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label20" runat="server" Text="model"></asp:Label>
        <asp:TextBox ID="modeltxt" runat="server"></asp:TextBox>
        <asp:Label ID="modelreq" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label22" runat="server" Text="current millage"></asp:Label>
        <asp:TextBox ID="currentmillagetxt" runat="server"></asp:TextBox>
        <asp:Label ID="currentmillagereq" runat="server" Text=""></asp:Label>
         <br />
        <asp:Label ID="Label24" runat="server" Text="gpsloc"></asp:Label>
        <asp:TextBox ID="gpsloctxt" runat="server"></asp:TextBox>
        <asp:Label ID="gpslocreq" runat="server" Text=""></asp:Label>
      
        <br />
        <asp:Label ID="Label26" runat="server" Text="location pin number"></asp:Label>
        <asp:TextBox ID="loc2txt" runat="server"></asp:TextBox>
        <asp:Label ID="loc2req" runat="server" Text=""></asp:Label>
      
    </div>
   <div id="extradiv" runat="server" style="display:none" >
       <div>
           <asp:Label ID="Label10" runat="server" Text="extra type"></asp:Label>
           <asp:DropDownList ID="extratypeddl"  AutoPostBack="true" runat="server" Label="" server="" Width="85px" OnSelectedIndexChanged="extratypeddl_SelectedIndexChanged">
               <asp:ListItem>helmet</asp:ListItem>
               <asp:ListItem>gloves</asp:ListItem>
               <asp:ListItem>elbow</asp:ListItem>
               <asp:ListItem>knee</asp:ListItem>
               <asp:ListItem>shoes</asp:ListItem>
               <asp:ListItem>others</asp:ListItem>
           </asp:DropDownList>
           <br/>
           <asp:Label ID="Label11" runat="server" Text="extra rate"></asp:Label>
           <asp:TextBox ID="extraratetxt" runat="server"></asp:TextBox>
           <asp:Label ID="extraratereq" runat="server" Text=""></asp:Label>
       </div>
       <div id="otherbox" runat="server" style="display:none">
           <asp:Label ID="Label7" runat="server" Text="other:"></asp:Label>
           <asp:TextBox ID="othertxt" runat="server"></asp:TextBox>
           <asp:Label ID="extratypereq" runat="server" Text=""></asp:Label>
       </div>
   </div>
    <div id="insurancediv" runat="server" style="display:none">
        <asp:Label ID="Label8" runat="server" Text="insurancetype"></asp:Label>
       <asp:DropDownList ID="insurancetypeddl" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
           <asp:ListItem>Basic</asp:ListItem>
           <asp:ListItem>Advanced</asp:ListItem>
           <asp:ListItem>Premium</asp:ListItem>
           </asp:DropDownList>
         <br />
        <asp:Label ID="Label12" runat="server" Text="insurance id"></asp:Label>
        <asp:TextBox ID="insuranceidtxt" runat="server"></asp:TextBox>
        <asp:Label ID="insuranceidreq" runat="server" Text=""></asp:Label>
         <br />
        <asp:Label ID="Label9" runat="server" Text="insurance rate"></asp:Label>
        <asp:TextBox ID="insuranceratetxt" runat="server"></asp:TextBox>
        <asp:Label ID="insuranceratereq" runat="server" Text=""></asp:Label>
           <br />
     <div id="liabilitydiv" runat="server" style="display:none">
        <asp:Label ID="Label6" runat="server" Text="liabaility amount"></asp:Label>
        <asp:TextBox ID="liabilitytxt" runat="server"></asp:TextBox>
        <asp:Label ID="liabiltyreq" runat="server" Text=""></asp:Label>
         <br />
       </div>
  </div>
        
        <asp:Button ID="ADD" BackColor="#7394AD" BorderStyle="None" style="display:none" runat="server" Text="Add" OnClick="ADD_Click" />
        <asp:Label ID="success" runat="server" Text=""></asp:Label>
  </form>
   
    </body>
</html>
