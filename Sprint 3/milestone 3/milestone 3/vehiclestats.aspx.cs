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
    public partial class vehiclestats : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("getLocationsOfVehicles", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string pin_number = rdr.GetString(rdr.GetOrdinal("pin_number"));
                Label lbl_pin_number = new Label();
                lbl_pin_number.Text = "loaction id:" + pin_number + ",";
                div1.Controls.Add(lbl_pin_number);
                
                string gps_loc = rdr.GetString(rdr.GetOrdinal("gps_loc"));
                Label lbl_gps_loc = new Label();
                lbl_gps_loc.Text = "id:" + gps_loc + "<br/>";
                div1.Controls.Add(lbl_gps_loc);
            }
            conn.Close();
            SqlCommand cmd1 = new SqlCommand("getEmptyLocations", conn);
            cmd1.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr1.Read())
            {

                string pin_number = rdr1.GetString(rdr1.GetOrdinal("pin_number"));
                Label lbl_pin_number = new Label();
                lbl_pin_number.Text = "loaction id:" + pin_number + ",";
                div2.Controls.Add(lbl_pin_number);

                string gps_loc = rdr1.GetString(rdr1.GetOrdinal("gps_loc"));
                Label lbl_gps_loc = new Label();
                lbl_gps_loc.Text = "id:" + gps_loc + "<br/>";
                div2.Controls.Add(lbl_gps_loc);
            }

        }
    }
}