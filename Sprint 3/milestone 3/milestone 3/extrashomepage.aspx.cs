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
    public partial class extrashomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            div1.Controls.Clear();
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("viewExtraNotRented", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                int id = rdr.GetInt32(rdr.GetOrdinal("id"));
                string type = rdr.GetString(rdr.GetOrdinal("extra_type"));
                decimal rate = rdr.GetDecimal(rdr.GetOrdinal("rate"));
                Label lbl_id = new Label();
                lbl_id.Text = "the extra number " + id + ",";
                div1.Controls.Add(lbl_id);

                Label lbl_type = new Label();
                lbl_type.Text = " type :" + type;
                div1.Controls.Add(lbl_type);

                Label lbl_rate = new Label();
                lbl_rate.Text = " rate :" + rate + "<br/>";
                div1.Controls.Add(lbl_rate);
            }
        }
        protected void view_Click(object sender, EventArgs e)
        {

            div1.Controls.Clear();
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("viewExtraOrdered", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                int id = rdr.GetInt32(rdr.GetOrdinal("id"));
                string type = rdr.GetString(rdr.GetOrdinal("extra_type"));
                decimal rate = rdr.GetDecimal(rdr.GetOrdinal("rate"));
                Label lbl_id = new Label();
                lbl_id.Text = "the extra number " + id + ",";
                div1.Controls.Add(lbl_id);

                Label lbl_type = new Label();
                lbl_type.Text = " type :" + type;
                div1.Controls.Add(lbl_type);

                Label lbl_rate = new Label();
                lbl_rate.Text = " rate :" + rate + "<br/>";
                div1.Controls.Add(lbl_rate);



            }
        }

        protected void viewmin_Click(object sender, EventArgs e)
        {
            div2.Controls.Clear();
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("viewMinPerType", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {

                string type = rdr.GetString(rdr.GetOrdinal("extra_type"));
                decimal rate = rdr.GetDecimal(rdr.GetOrdinal("RATE"));

                
                Label lbl_type = new Label();
                lbl_type.Text = " type :" + type;
                div2.Controls.Add(lbl_type);

                Label lbl_rate = new Label();
                lbl_rate.Text = " has a min rate :" + rate + "<br/>";
                div2.Controls.Add(lbl_rate);
                
            }
        }

        protected void rent_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("rentExtra", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            int id = 0;

            string ssn = Application["customerssn"].ToString();
            try
            {
                 id = Int16.Parse(extratxt.Text);
            }
            catch (Exception exp) {
                wrongid.Text = "please enter a valid extra id";
                return;
            }
            cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
            cmd.Parameters.Add(new SqlParameter("@id", id));

            SqlParameter successbit = cmd.Parameters.Add("@success", SqlDbType.Int);
            successbit.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            
            if (successbit.Value.ToString().Equals("0"))
            {
                wrongid.Text = "invalid extra id";
                extratxt.Text = "";
            }
            else {
                Response.Redirect("https://localhost:44396/renting_homepage.aspx");
            }
        }

        protected void return_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("returnExtra", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            int id = 0;

            string ssn = Application["customerssn"].ToString();
            try
            {
                id = Int16.Parse(extratxt.Text);
            }
            catch (Exception exp)
            {
                wrongid.Text = "please enter a valid extra id";
                return;
            }
            cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
            cmd.Parameters.Add(new SqlParameter("@id", id));
            SqlParameter successbit = cmd.Parameters.Add("@success", SqlDbType.Int);
            successbit.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            if (successbit.Value.ToString().Equals("0"))
            {
                wrongid.Text = "invalid extra id u are not renting this extra to return it";
                extratxt.Text = "";
            }
            else
            {
                Response.Redirect("https://localhost:44396/renting_homepage.aspx");
            }
        }
    }
}