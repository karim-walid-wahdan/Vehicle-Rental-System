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
    public partial class deletepayments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 1; i <= 31; i++)
            {
                dayddl.Items.Add(new ListItem(i+""));
            }
            for (int i = 1; i <=12; i++)
            {
                monthddl.Items.Add(new ListItem(i + ""));
            }
            for (int i = 2022; i >= 2000; i--)
            {
                yearddl.Items.Add(new ListItem(i + ""));
            }
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("DeleteExpiredPayments", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string day = dayddl.SelectedItem.Value.ToString();
            string month = monthddl.SelectedItem.Value.ToString();
            string year = yearddl.SelectedItem.Value.ToString();
            string datestr = year + "-" + month + "-" + day;
            DateTime date = DateTime.Parse(datestr);
            cmd.Parameters.Add(new SqlParameter("@date", date));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("https://localhost:44396/EMPLOYEE_HOMEPAGE.aspx");

        }
    }
}