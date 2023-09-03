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
    public partial class viewinsurance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("viewInsurance", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                string avgrate = null;
                string id = rdr.GetString(rdr.GetOrdinal("Insurance_Number"));
                decimal rate = rdr.GetDecimal(rdr.GetOrdinal("rate"));
                object iability_amount = rdr.GetValue(rdr.GetOrdinal("iability_amount"));
                avgrate = iability_amount.ToString();

                Label lbl_id = new Label();
                lbl_id.Text = "id :" + id + ",";
                div1.Controls.Add(lbl_id);

                Label lbl_rate = new Label();
                lbl_rate.Text = "rate :" + rate + ",";
                div1.Controls.Add(lbl_rate);
                if (avgrate != "")
                {
                    Label lbl_ability_amount = new Label();
                    lbl_ability_amount.Text = "liability_amount :" + avgrate + "<br/>";
                    div1.Controls.Add(lbl_ability_amount);
                }
                else
                {

                    Label lbl_ability_amount = new Label();
                    lbl_ability_amount.Text = "<br/>";
                    div1.Controls.Add(lbl_ability_amount);
                }
            }
        }

        protected void orderrate_Click(object sender, EventArgs e)
        {
            div1.Controls.Clear();
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("viewInsurances", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                string avgrate = null;
                string id = rdr.GetString(rdr.GetOrdinal("Insurance_Number"));
                decimal rate = rdr.GetDecimal(rdr.GetOrdinal("rate"));
                object iability_amount = rdr.GetValue(rdr.GetOrdinal("iability_amount"));
                avgrate = iability_amount.ToString();

                Label lbl_id = new Label();
                lbl_id.Text = "id :" + id + ",";
                div1.Controls.Add(lbl_id);

                Label lbl_rate = new Label();
                lbl_rate.Text = "rate :" + rate + ",";
                div1.Controls.Add(lbl_rate);
                if (avgrate != "")
                {
                    Label lbl_ability_amount = new Label();
                    lbl_ability_amount.Text = "liability_amount :" + avgrate + "<br/>";
                    div1.Controls.Add(lbl_ability_amount);
                }
                else
                {

                    Label lbl_ability_amount = new Label();
                    lbl_ability_amount.Text = "<br/>";
                    div1.Controls.Add(lbl_ability_amount);
                }
            }

        }

        protected void view_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd1 = new SqlCommand("countAccidentsPerInsurance", conn);
            cmd1.CommandType = CommandType.StoredProcedure;

            conn.Open();
            SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr1.Read())
            {

                string id1 = rdr1.GetString(rdr1.GetOrdinal("Insurance"));
                int rate1 = rdr1.GetInt32(rdr1.GetOrdinal("COUNT"));

                Label lbl_id1 = new Label();
                lbl_id1.Text = "the insurnace number " + id1 + ",";
                div2.Controls.Add(lbl_id1);

                Label lbl_rate1 = new Label();
                lbl_rate1.Text = " covered  :" + rate1 + "accidents,<br/>";
                div2.Controls.Add(lbl_rate1);

            }
        }
    }
}