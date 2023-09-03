using System;

namespace milestone_3
{
    public partial class customerHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void viewavaliablevehicles_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/viewavaliablevehicle.aspx");
        }
        protected void viewinsurances_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/viewinsurance.aspx");
        }
        protected void viewneverrented_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/neverrented.aspx");
        }
        protected void viewaccidents_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/viewaccidents.aspx");
        }
        protected void viewpayments_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/viewpayments.aspx");
        }
        protected void viewprofile_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/customerprofile.aspx");
        }
        protected void rent_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/rentavehicle.aspx");
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Application["customerpassword"] = "";
            Application["customerssn"] = "";
            Response.Redirect("https://localhost:44396/startpage.aspx");
        }

       
    }
}