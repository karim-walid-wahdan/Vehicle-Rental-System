﻿using System;
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
    public partial class viewaccidents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("viewMyAccidents", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string ssn = Application["customerssn"].ToString();

            cmd.Parameters.Add(new SqlParameter("@customer_ssn", ssn));
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {

                int accident_id = rdr.GetInt32(rdr.GetOrdinal("accident_id"));
                int Vehicle = rdr.GetInt32(rdr.GetOrdinal("Vehicle"));
                string Accident_Description = rdr.GetString(rdr.GetOrdinal("Accident_Description"));


                Label lbl_accident_id = new Label();
                lbl_accident_id.Text = "id:" + accident_id + ",";
                div1.Controls.Add(lbl_accident_id);

                Label lbl_Vehicle = new Label();
                lbl_Vehicle.Text = "vehicle involved:" + Vehicle + ",";
                div1.Controls.Add(lbl_Vehicle);

                Label lbl_Accident_Description = new Label();
                lbl_Accident_Description.Text = "descripation:" + Accident_Description + "<br/>";
                div1.Controls.Add(lbl_Accident_Description);
            }
        }
        }
}