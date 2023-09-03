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
    public partial class listcustomerswithbills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool flag = true;
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("ListCustomersWithBills", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                if (flag) {
                    div1.Controls.Clear();
                        flag = false;
                        }
                string name = rdr.GetString(rdr.GetOrdinal("customer_name"));
                string ssn = rdr.GetString(rdr.GetOrdinal("ssn"));

                
                int P_Id = rdr.GetInt32(rdr.GetOrdinal("P_Id"));
                decimal P_Value = rdr.GetDecimal(rdr.GetOrdinal("P_Value"));
                DateTime Exp_Date = rdr.GetDateTime(rdr.GetOrdinal("Exp_Date"));

                Label lbl_name = new Label();
                lbl_name.Text = "customer name :" + name + ",";
                div1.Controls.Add(lbl_name);

                Label lbl_ssn = new Label();
                lbl_ssn.Text = "ownership:" + ssn + "<br/>";
                div1.Controls.Add(lbl_ssn);


                Label lbl_pid = new Label();
                lbl_pid.Text = " paymenbt id:" + P_Id + ",";
                div1.Controls.Add(lbl_pid);

                Label lbl_pvalue = new Label();
                lbl_pvalue.Text = "payment value:" + P_Value + ",";
                div1.Controls.Add(lbl_pvalue);

                Label lbl_expdate = new Label();
                lbl_expdate.Text = "status:" + Exp_Date + "<br/>";
                div1.Controls.Add(lbl_expdate);
            }
        }
    }
}   