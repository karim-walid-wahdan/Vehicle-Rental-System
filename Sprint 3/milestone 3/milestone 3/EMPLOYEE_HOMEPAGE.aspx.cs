using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace milestone_3
{
    public partial class EMPLOYEE_HOMEPAGE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void viewprofile_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/employeeprofile.aspx");
        }

        protected void update_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/vehicleupdate.aspx");
        }

        protected void listrenting_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/currentlyrenting.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/listcustomerswithbills.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/editextras.aspx");
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Application["employeepassword"] = "";
            Application["employeessn"] = "";
            Response.Redirect("https://localhost:44396/startpage.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/deletepayments.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/premium%20customer.aspx");
        }

        protected void providegift_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/provide%20a%20gift.aspx");
        }

        protected void viewvehicles_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/viewavaliablevehicle.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/unavaliable%20vehicles.aspx");
        }

        protected void additem_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/additem.aspx");
        }

        protected void issuebills_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/bills.aspx");
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/vehiclestats.aspx");
        }
    }
}