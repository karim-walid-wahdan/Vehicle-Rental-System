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
    public partial class updatevehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("viewlocation", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string id = rdr.GetString(rdr.GetOrdinal("pin_number"));
                locationddl.Items.Add(new ListItem(id + ""));
            }
        }

        protected void updatelocation_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("updateLocation", conn);
            cmd.CommandType = CommandType.StoredProcedure;


            string gps = gpstxt.Text;
            int vehicle = Int32.Parse(Application["rentedvehicleid"].ToString());

            cmd.Parameters.Add(new SqlParameter("@vehicle",vehicle ));
            cmd.Parameters.Add(new SqlParameter("@vehicle_location", gps));

            SqlParameter success = cmd.Parameters.Add("@success_bit", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            if (success.Value.ToString().Equals("1"))
            {
                gpssuccess.Text = "location updated successfully";
            }
            else {
                gpssuccess.Text = "error updating location ";
            }
        }

        protected void returnvehicle_Click(object sender, EventArgs e)
        {
            ratingreq.Text = "";
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand return_cmd = new SqlCommand("returnvehicle", conn);
            return_cmd.CommandType = CommandType.StoredProcedure;

            int vehicle = Int32.Parse(Application["rentedvehicleid"].ToString());
            string loc_pin = locationddl.SelectedItem.Value;

            return_cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
            return_cmd.Parameters.Add(new SqlParameter("@loc_pin", loc_pin));


            SqlParameter success = return_cmd.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            //evaluate command
            SqlCommand evaluate_cmd = new SqlCommand("evaluateVehicle", conn);
            evaluate_cmd.CommandType = CommandType.StoredProcedure;
            if (ratetxt.Text == "")
            {
                ratingreq.Text = "this field is required";
            }
            string customer = Application["customerssn"].ToString();

            int rating =0;
            try
            {

                rating = Int32.Parse(ratetxt.Text);
            }
            catch (Exception exp1)
            {
                ratingreq.Text = "must be an intvger from zero to 10";
            }
                evaluate_cmd.Parameters.Add(new SqlParameter("@customer_ssn", customer));
                evaluate_cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
                evaluate_cmd.Parameters.Add(new SqlParameter("@rating", rating));
                //END OF EVALUATE COMMAND

                conn.Open();
                return_cmd.ExecuteNonQuery();
                conn.Close();

                if (success.Value.ToString().Equals("1"))
                {
                    conn.Open();
                    evaluate_cmd.ExecuteNonQuery();
                    conn.Close();
                    Application["insurance"] = "";
                    Application["rentedvehicleid"] = "";
                    Response.Redirect("https://localhost:44396/customerHomePage.aspx");
                    
                }
                else {
                    ratingreq.Text = "unknown location pin";
                }
            
        }

        protected void updateRange_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand check_cmd = new SqlCommand("decidemotor", conn);
            check_cmd.CommandType = CommandType.StoredProcedure;

            int vehicle = Int32.Parse(Application["rentedvehicleid"].ToString());
            decimal rangeleft = 0;
            try
            {
                rangeleft = Decimal.Parse(rangetxt.Text);
                }
            catch (Exception exp) {
                success.Text = "range must be a decimal";
                return;
            }
            check_cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
            SqlParameter motor = check_cmd.Parameters.Add("@motor", SqlDbType.Int);
            motor.Direction = ParameterDirection.Output;

            conn.Open();
            check_cmd.ExecuteNonQuery();
            conn.Close();
            if (motor.Value.ToString().Equals("1"))
            {
                SqlCommand disel_cmd = new SqlCommand("UpdateDiesel", conn);
                disel_cmd.CommandType = CommandType.StoredProcedure;
                disel_cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
                disel_cmd.Parameters.Add(new SqlParameter("@motor", rangeleft));
                conn.Open();
                disel_cmd.ExecuteNonQuery();
                conn.Close();
                success.Text = "kilometers left updated";
            }
            else if (motor.Value.ToString().Equals("2"))
            {
                SqlCommand battery_cmd = new SqlCommand("UpdateBattery", conn);
                battery_cmd.CommandType = CommandType.StoredProcedure;
                battery_cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
                battery_cmd.Parameters.Add(new SqlParameter("@battery", rangeleft));
                conn.Open();
                battery_cmd.ExecuteNonQuery();
                conn.Close();
                success.Text = "battery range updated";
            }
            else {
                success.Text = "unknown vehicle";
            }
        }
    }
}