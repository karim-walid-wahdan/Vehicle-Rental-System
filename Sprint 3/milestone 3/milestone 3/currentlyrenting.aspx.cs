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
    public partial class currentlyrenting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("ListRentedVehicles", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int id = rdr.GetInt32(rdr.GetOrdinal("id"));
                string owned = rdr.GetString(rdr.GetOrdinal("owned"));
                string v_status = rdr.GetString(rdr.GetOrdinal("v_status"));
                decimal rate = rdr.GetDecimal(rdr.GetOrdinal("rate"));
                string class1 = rdr.GetString(rdr.GetOrdinal("class"));
                string brand = rdr.GetString(rdr.GetOrdinal("brand"));
                string model = rdr.GetString(rdr.GetOrdinal("model"));
                int current_milage = rdr.GetInt32(rdr.GetOrdinal("current_milage"));
                string gps_loc = rdr.GetString(rdr.GetOrdinal("gps_loc"));

                Label lbl_id = new Label();
                lbl_id.Text = "id:" + id + ",";
                div1.Controls.Add(lbl_id);

                Label lbl_owned = new Label();
                lbl_owned.Text = "ownership:" + owned + ",";
                div1.Controls.Add(lbl_owned);

                Label lbl_status = new Label();
                lbl_status.Text = "status:" + v_status + ",";
                div1.Controls.Add(lbl_status);

                Label lbl_rate = new Label();
                lbl_rate.Text = "price :" + rate + ",";
                div1.Controls.Add(lbl_rate);

                Label lbl_class = new Label();
                lbl_class.Text = "vehicle class :" + class1 + ",";
                div1.Controls.Add(lbl_class);

                Label lbl_brand = new Label();
                lbl_brand.Text = "brand :" + brand + ",";
                div1.Controls.Add(lbl_brand);

                Label lbl_model = new Label();
                lbl_model.Text = "model :" + model + ",";
                div1.Controls.Add(lbl_model);

                Label lbl_current_milage = new Label();
                lbl_current_milage.Text = "current milage :" + current_milage + ",";
                div1.Controls.Add(lbl_current_milage);

                Label lbl_gps_loc = new Label();
                lbl_gps_loc.Text = "gps location :" + gps_loc + " <br/>";
                div1.Controls.Add(lbl_gps_loc);
                }
            conn.Close();

            SqlCommand cmd1 = new SqlCommand("ListCustomersCurrentlyRenting", conn);
            cmd1.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr1.Read())
            {
                string name = rdr1.GetString(rdr1.GetOrdinal("customer_name"));
                string ssn = rdr1.GetString(rdr1.GetOrdinal("ssn"));
                
                Label lbl_name = new Label();
                lbl_name.Text = "customer name :" + name + ",";
                div2.Controls.Add(lbl_name);

                Label lbl_ssn = new Label();
                lbl_ssn.Text = "ssn:" + ssn + "<br/>";
                div2.Controls.Add(lbl_ssn);

            }
            conn.Close();


            SqlCommand cmd2 = new SqlCommand("viewExtraRented", conn);
            cmd2.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr2 = cmd2.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr2.Read())
            {
                int id = rdr2.GetInt32(rdr2.GetOrdinal("id"));
                string extra_type = rdr2.GetString(rdr2.GetOrdinal("extra_type"));
                decimal rate = rdr2.GetDecimal(rdr2.GetOrdinal("rate"));
                string Rented_By = rdr2.GetString(rdr2.GetOrdinal("Rented_By"));

                Label lbl_id = new Label();
                lbl_id.Text = "extra id :" + id + ",";
                div3.Controls.Add(lbl_id);

                Label lbl_extra_type = new Label();
                lbl_extra_type.Text = "extra_type:" + extra_type + ",";
                div3.Controls.Add(lbl_extra_type);

                Label lbl_rate = new Label();
                lbl_rate.Text = "rate:" + rate + ",";
                div3.Controls.Add(lbl_rate);

                Label lbl_Rented_By = new Label();
                lbl_Rented_By.Text = "Rented_By:" + Rented_By + "<br/>";
                div3.Controls.Add(lbl_Rented_By);

            }
            conn.Close();
        }
       
        }
    }

