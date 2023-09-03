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
    public partial class employeeprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("ViewEmpProfile", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string ssn = Application["employeessn"].ToString();

            cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string ssnTable = rdr.GetString(rdr.GetOrdinal("ssn"));
                string name = rdr.GetString(rdr.GetOrdinal("employee_name"));
                string email = rdr.GetString(rdr.GetOrdinal("employee_email"));
                string address = rdr.GetString(rdr.GetOrdinal("employee_address"));
                int hpw = rdr.GetInt32(rdr.GetOrdinal("Hours_Per_Week"));

                Label lbl_ssn = new Label();
                lbl_ssn.Text = "<br/>ssn :" + ssnTable + "<br/>";
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


                Label lbl_hpw = new Label();
                lbl_hpw.Text = "hours per week : " + hpw + "<br/>";
                form1.Controls.Add(lbl_hpw);
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/employeeupdate.aspx");
        }
    }
}