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
    public partial class submitaccident : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand Cmd = new SqlCommand("accidentSubmission", conn);
            Cmd.CommandType = CommandType.StoredProcedure;

            string des = txt.Text;
            string  ssn = Application["customerssn"].ToString();
            int vehicle = Int16.Parse(Application["rentedvehicleid"].ToString());

            Cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
            Cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
            Cmd.Parameters.Add(new SqlParameter("@description", des));


            conn.Open();
            Cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("https://localhost:44396/renting_homepage.aspx");
        }
    }
}