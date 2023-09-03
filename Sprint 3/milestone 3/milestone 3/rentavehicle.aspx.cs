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
    public partial class rentavehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void joinus_Click(object sender, EventArgs e)
        {
            timereq.Text = "";
            destinationreq.Text = "";
            successlbl.Text = "";
            bool flag = true;
           
            if (timetxt.Text == "")
            {
                timereq.Text = "this field is required";
                flag = false;
            }
            if (destxt.Text == "")
            {

                destinationreq.Text = "this field is required";
                flag = false;
            }
            if (flag)
            {
                string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("rentTime", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                string ssn = Application["customerssn"].ToString();
                int vehicle = 0;
                try
                {
                    vehicle = Int16.Parse(vehicletxt.Text);
                }
                catch (Exception exp1)
                {
                    timereq.Text = "must be an intger";
                    return;
                }

                string insurance = insurancetxt.Text;
                decimal time = 0;
                try
                {
                     time = Decimal.Parse(timetxt.Text);
                }
                catch (Exception exp2)
                {
                   timereq.Text = "must be an decimal";
                    return;
                }
                string des = destxt.Text;

                cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
                cmd.Parameters.Add(new SqlParameter("@insurance", insurance));
                cmd.Parameters.Add(new SqlParameter("@customer_ssn", ssn));
                cmd.Parameters.Add(new SqlParameter("@time", time));
                cmd.Parameters.Add(new SqlParameter("@destination", des));


                SqlParameter successbit = cmd.Parameters.Add("@success", SqlDbType.Int);
                successbit.Direction = ParameterDirection.Output;
                try {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    if (successbit.Value.ToString().Equals("0")) {
                        vehiclereq.Text = "invalid vehicle";

                    }
                    else if (successbit.Value.ToString().Equals("1"))
                    {
                        vehiclereq.Text = "invalid insurance";

                    }
                    else if (successbit.Value.ToString().Equals("2"))
                    {
                        successlbl.Text = "unknown error occured";
                    }
                    else if (successbit.Value.ToString().Equals("4"))
                    {
                        successlbl.Text = "renting unsuccessful";
                    }
                    else
                    {
                        Application["rentedvehicleid"] = vehicle;
                        Application["rentedinsuranceid"] = insurance;
                        successlbl.Text = "rent data accepted";
                        Response.Redirect("https://localhost:44396/renting_homepage.aspx");
                    }

                }
                catch (Exception exp) {
                    successlbl.Text = "rent not possible";
                }
            }
        } 
    }
    }