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
    public partial class premium_customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("ViewPremiumCustomers", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            bool flag = true;
            while (rdr.Read())
            {
                if (flag) {
                    div1.Controls.Clear();
                    flag = false;
                }
                string ssnTable = rdr.GetString(rdr.GetOrdinal("ssn"));
                string name = rdr.GetString(rdr.GetOrdinal("customer_name"));
                string email = rdr.GetString(rdr.GetOrdinal("customer_email"));
                string address = rdr.GetString(rdr.GetOrdinal("customer_address"));

                Label lbl_ssn = new Label();
                lbl_ssn.Text = "ssn :" + ssnTable + ",";
                form1.Controls.Add(lbl_ssn);
                Label lbl_name = new Label();
                lbl_name.Text = "name:" + name + ",";
                form1.Controls.Add(lbl_name);

                Label lbl_email = new Label();
                lbl_email.Text = "email:" + email + ",";
                form1.Controls.Add(lbl_email);

                Label lbl_address = new Label();
                lbl_address.Text = "address:" + address + "<br/>";
                form1.Controls.Add(lbl_address);
            }
        }
    }
}