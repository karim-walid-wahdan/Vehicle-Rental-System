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
    public partial class vehicleupdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void update_Click(object sender, EventArgs e)
        {

            bool flag = true;
            if (vehicletxt.Text == "")
            {
                vehiclereq.Text = "this field is required";
                flag = false;
            }
            if (rangetxt.Text == "")
            {
                rangereq.Text = "this field is required";
                flag = false;
            }

            if (flag)
            {
                string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                int vehicle = 0;
                try
                {
                    vehicle = Int32.Parse(vehicletxt.Text);
                }
                catch (Exception exp)
                {
                    vehiclereq.Text = "must be an intger";
                    return;
                }
                decimal rangeleft = 0;
                try
                {
                    rangeleft = Decimal.Parse(rangetxt.Text);
                }
                catch (Exception exp)
                {
                    success.Text = "range must be a decimal";
                    return;
                }

                SqlCommand check_cmd = new SqlCommand("decidemotor", conn);
                check_cmd.CommandType = CommandType.StoredProcedure;

                check_cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
                SqlParameter motor = check_cmd.Parameters.Add("@motor", SqlDbType.Int);
                motor.Direction = ParameterDirection.Output;

                conn.Open();
                check_cmd.ExecuteNonQuery();
                conn.Close();
                if (motor.Value.ToString().Equals("1"))
                {
                    SqlCommand update_status_Cmd = new SqlCommand("updatestatus", conn);
                    update_status_Cmd.CommandType = CommandType.StoredProcedure;

                    string status = statusddl.SelectedValue.ToString();
                    update_status_Cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
                    update_status_Cmd.Parameters.Add(new SqlParameter("@status", status));
                   
                    SqlParameter check = update_status_Cmd.Parameters.Add("@success", SqlDbType.Int);
                    check.Direction = ParameterDirection.Output;

                    SqlCommand disel_cmd = new SqlCommand("UpdateDiesel", conn);
                    disel_cmd.CommandType = CommandType.StoredProcedure;
                    disel_cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
                    disel_cmd.Parameters.Add(new SqlParameter("@motor", rangeleft));
                    conn.Open();
                    disel_cmd.ExecuteNonQuery();
                    update_status_Cmd.ExecuteNonQuery();
                    conn.Close();
                    success.Text = "kilometers left updated";
                }
                else if (motor.Value.ToString().Equals("2"))
                {
                    SqlCommand update_status_Cmd = new SqlCommand("updatestatus", conn);
                    update_status_Cmd.CommandType = CommandType.StoredProcedure;

                    string status = statusddl.SelectedValue.ToString();
                    update_status_Cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
                    update_status_Cmd.Parameters.Add(new SqlParameter("@status", status));

                    SqlParameter check = update_status_Cmd.Parameters.Add("@success", SqlDbType.Int);
                    check.Direction = ParameterDirection.Output;

                    SqlCommand battery_cmd = new SqlCommand("UpdateBattery", conn);
                    battery_cmd.CommandType = CommandType.StoredProcedure;
                    battery_cmd.Parameters.Add(new SqlParameter("@vehicle", vehicle));
                    battery_cmd.Parameters.Add(new SqlParameter("@battery", rangeleft));
                    conn.Open();
                    battery_cmd.ExecuteNonQuery();
                    update_status_Cmd.ExecuteNonQuery();
                    conn.Close();
                    success.Text = "battery range updated";
                }
                else
                {
                    vehiclereq.Text = "unknown vehicle";
                }
                
            }
        }
    }
}