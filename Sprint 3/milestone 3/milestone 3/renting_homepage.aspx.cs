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
    public partial class renting_homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int vehicle = Int32.Parse(Application["rentedvehicleid"].ToString());

            SqlCommand rents_Cmd = new SqlCommand("numberOfRents", conn);
            rents_Cmd.CommandType = CommandType.StoredProcedure;
            SqlCommand rating_Cmd = new SqlCommand("viewAverageRating", conn);
            rating_Cmd.CommandType = CommandType.StoredProcedure;

            rents_Cmd.Parameters.Add(new SqlParameter("@vehicle_id", vehicle));
            rating_Cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));

            SqlParameter rent = rents_Cmd.Parameters.Add("@count", SqlDbType.Int);
            rent.Direction = ParameterDirection.Output;
            SqlParameter rating = rating_Cmd.Parameters.Add("@average", SqlDbType.Int);
            rating.Direction = ParameterDirection.Output;
            
            conn.Open();
            rents_Cmd.ExecuteNonQuery();
            rating_Cmd.ExecuteNonQuery();
            conn.Close();
            numberofrents.Text = rent.Value +"";
            ratinglbl.Text = rating.Value +"";
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/submitaccident.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/extrashomepage.aspx");
        }

        protected void updatevehicle_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44396/updatevehicle.aspx");
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Application["customerpassword"] = "";
            Application["customerssn"] = "";
            Response.Redirect("https://localhost:44396/startpage.aspx");
        }
    }
}