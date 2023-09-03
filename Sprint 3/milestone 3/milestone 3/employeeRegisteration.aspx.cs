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
    public partial class employeeRegisteration : System.Web.UI.Page
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

        protected void joinus_Click(object sender, EventArgs e)
        {
            ssnreq.Text = "";
            namereq.Text = "";
            emailreq.Text = "";
            addressreq.Text = "";
            hpwreq.Text = "";
            passreq.Text = "";
            passrereq.Text = "";
            bool flag = true;
            string password = "";
            if (ssntxt.Text == "")
            {
                ssnreq.Text = "this field is required";
                flag = false;
            }
            if (nametxt.Text == "")
            {
                namereq.Text = "this field is required";
                flag = false;
            }
            if (emailtxt.Text == "")
            {
                emailreq.Text = "this field is required";
                flag = false;
            }
            if (addresstxt.Text == "")
            {

                addressreq.Text = "this field is required";
                flag = false;
            }
            if (hpwtxt.Text == "")
            {
                hpwreq.Text = "this field is required";

            }
            if (passtxt.Text == "")
            {
                passreq.Text = "this field is required";
                flag = false;
                if (passretxt.Text == "")
                {
                    passrereq.Text = "this field is required";
                    flag = false;
                }
            }
            else
            {
                password = passtxt.Text.ToString();
                if (passretxt.Text == "")
                {
                    passrereq.Text = "this field is required";
                    flag = false;
                }
                else if (passretxt.Text != passtxt.Text)
                {
                    passrereq.Text = "the entered passwords dont match please reenter ur password";
                    flag = false;
                    passretxt.Text = "";
                }
            }
            if (flag)
            {
                ssnreq.Text = "";
                namereq.Text = "";
                emailreq.Text = "";
                addressreq.Text = "";
                hpwreq.Text = "";
                passreq.Text = "";
                passrereq.Text = "";
                string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("EmployeeRegister", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                int hpw = 0;
                string ssn = ssntxt.Text;
                string name = nametxt.Text;
                string email = emailtxt.Text;
                string address = addresstxt.Text;
                password = passtxt.Text;
                try
                {
                    hpw = Int16.Parse(hpwtxt.Text);

                    cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
                    cmd.Parameters.Add(new SqlParameter("@name", name));
                    cmd.Parameters.Add(new SqlParameter("@email", email));
                    cmd.Parameters.Add(new SqlParameter("@address", address));
                    cmd.Parameters.Add(new SqlParameter("@password", password));
                    cmd.Parameters.Add(new SqlParameter("@hours_per_week", hpw));

                    SqlParameter successbit = cmd.Parameters.Add("@success", SqlDbType.Int);
                    successbit.Direction = ParameterDirection.Output;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    if (successbit.Value.ToString().Equals("1"))
                    {
                        Response.Redirect("https://localhost:44396/Employee_start.aspx", true);
                    }
                    else
                    {

                        success.Text = "already registered";
                    }
                }
                catch (Exception exp) {

                    hpwreq.Text = "must be an intger";
                }
            }
        }

    }

    }