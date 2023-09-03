using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace milestone_3
{
    public partial class customerprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("ViewCustProfile", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string ssn = Application["customerssn"].ToString();
           
            cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string ssnTable = rdr.GetString(rdr.GetOrdinal("ssn"));
                string name = rdr.GetString(rdr.GetOrdinal("customer_name"));
                string email = rdr.GetString(rdr.GetOrdinal("customer_email"));
                string address = rdr.GetString(rdr.GetOrdinal("customer_address"));


                Label lbl_ssn = new Label();
                lbl_ssn.Text = "ssn :" + ssnTable + "<br/>";
                form1.Controls.Add(lbl_ssn);
                Label lbl_name = new Label();
                lbl_name.Text = "name:" + name + "<br/>";
                form1.Controls.Add(lbl_name);

                Label lbl_email = new Label();
                lbl_email.Text = "email:" + email + "<br/>";
                form1.Controls.Add(lbl_email);

                Label lbl_address = new Label();
                lbl_address.Text = "address:" + address + "<br/>";
                form1.Controls.Add(lbl_address);
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/customerupdate.aspx");
        }

        protected void phone_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/addphonenumber.aspx");
        }

        protected void payment_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/addpayment.aspx");
        }
    }
}