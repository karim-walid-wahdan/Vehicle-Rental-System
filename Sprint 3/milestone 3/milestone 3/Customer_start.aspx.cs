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
    public partial class Customer_start : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand Customer_Count_Cmd = new SqlCommand("customerCount", conn);
            Customer_Count_Cmd.CommandType = CommandType.StoredProcedure;
            SqlCommand Vehicle_Count_Cmd = new SqlCommand("vehicleCount", conn);
            Vehicle_Count_Cmd.CommandType = CommandType.StoredProcedure;
            SqlCommand Rental_Count_Cmd = new SqlCommand("rentCount", conn);
            Rental_Count_Cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter Customer_Count = Customer_Count_Cmd.Parameters.Add("@count", SqlDbType.Int);
            Customer_Count.Direction = ParameterDirection.Output;
            SqlParameter Vehicle_Count = Vehicle_Count_Cmd.Parameters.Add("@count", SqlDbType.Int);
            Vehicle_Count.Direction = ParameterDirection.Output;
            SqlParameter Rental_Count = Rental_Count_Cmd.Parameters.Add("@count", SqlDbType.Int);
            Rental_Count.Direction = ParameterDirection.Output;

            conn.Open();
            Customer_Count_Cmd.ExecuteNonQuery();
            Vehicle_Count_Cmd.ExecuteNonQuery();
            Rental_Count_Cmd.ExecuteNonQuery();
            conn.Close();

            customer_Count_Lbl.Text = Customer_Count.Value + " ";
            vehicle_Count_Lbl.Text = Vehicle_Count.Value + " ";
            rental_Count_Lbl.Text = Rental_Count.Value + " ";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("customerLogin", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            
            string username = usernameTxt.Text;
            string password = passwordTxt.Text;
            
            cmd.Parameters.Add(new SqlParameter("@ssn", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            
            // output parm
            SqlParameter count = cmd.Parameters.Add("@Success_bit", SqlDbType.Int);
            count.Direction = ParameterDirection.Output;
            SqlParameter renting = cmd.Parameters.Add("@renting", SqlDbType.Int);
            renting.Direction = ParameterDirection.Output;
            SqlParameter vehicle = cmd.Parameters.Add("@vehicleholder", SqlDbType.Int);
            vehicle.Direction = ParameterDirection.Output;
            SqlParameter insurance = cmd.Parameters.Add("@insurance", SqlDbType.Int);
            insurance.Direction = ParameterDirection.Output;


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            if (count.Value.ToString().Equals("0"))
            {
                incorrectuser.Text = "unknown ssn";
                incorrectpassword.Text = "";
                success.Text = "";
                usernameTxt.Text = "";
            }
            else if (count.Value.ToString().Equals("1"))
            {


                incorrectuser.Text = "";
                incorrectpassword.Text = "incorrect password";
                success.Text = "";
            }
            else
            {
                incorrectuser.Text = "";
                incorrectpassword.Text = "";
                success.Text = "login approved";
                usernameTxt.Text = "";

                if (renting.Value.ToString().Equals("1"))
                {

                    Application["insurance"] = insurance.Value;
                    Application["rentedvehicleid"] = vehicle.Value;
                    Application["customerpassword"] = password;
                    Application["customerssn"] = username;
                    Response.Redirect("https://localhost:44396/renting_homepage.aspx",true);
                    
                }
                else
                {
                    Application["customerpassword"] =password;
                    Application["customerssn"] = username;
                    Response.Redirect("https://localhost:44396/customerHomePage.aspx",true);

                }
            }
        }
    }
}