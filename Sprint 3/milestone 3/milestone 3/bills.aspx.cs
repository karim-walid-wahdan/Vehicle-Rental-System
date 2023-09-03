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
    public partial class bills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("viewinsurancesid", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string id = rdr.GetString(rdr.GetOrdinal("Insurance_Number"));
                insuranceddl.Items.Add(new ListItem(id + ""));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            idreq.Text = "";
            numberreq.Text = "";
            billreq.Text = "";
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("IssueBill", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlCommand cmd1 = new SqlCommand("IssueInstallements", conn);
            cmd1.CommandType = CommandType.StoredProcedure;

            string insuranceid = insuranceddl.SelectedItem.Value.ToString();
            int accidentid = 0;
            try
            {
                accidentid = Int32.Parse(accidenttxt.Text);
            }
            catch (Exception exp)
            {
                idreq.Text = "the accident id  must be a intger";
                accidenttxt.Text = "";
                return;
            }
            decimal bill = 0;
            try
            {
                bill = Decimal.Parse(billvaluetxt.Text);
            }
            catch (Exception exp)
            {
                billreq.Text = "the gifted value must be a decimal";
                billvaluetxt.Text = "";
                return;
            }
            int number = 0;
            try
            {
                number = Int32.Parse(numbertxt.Text);
            }
            catch (Exception exp)
            {
                numberreq.Text = "the gifted value must be a decimal";
                numberreq.Text = "";
                return;
            }
            cmd.Parameters.Add(new SqlParameter("@insurance", insuranceid));
            cmd.Parameters.Add(new SqlParameter("@accident", accidentid));
            cmd.Parameters.Add(new SqlParameter("@bill", bill));
            cmd.Parameters.Add(new SqlParameter("@Number_Of_Installements", number));

            cmd1.Parameters.Add(new SqlParameter("@insurance", insuranceid));
            cmd1.Parameters.Add(new SqlParameter("@accident", accidentid));

            SqlParameter successbit = cmd.Parameters.Add("@success", SqlDbType.Int);
            successbit.Direction = ParameterDirection.Output;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            if (successbit.Value.ToString().Equals("2"))
            {
                conn.Open();
                cmd1.ExecuteNonQuery();
                conn.Close();
                idreq.Text = "";
                numberreq.Text = "";
                billreq.Text = "";
                accidenttxt.Text = "";
                numbertxt.Text = "";
                billvaluetxt.Text = "";
                success.Text = "bills issued successfully";
            }
            else if (successbit.Value.ToString().Equals("1")) {
                success.Text = "bills already exists";
            }
            else
            {

                idreq.Text = "invalid accident id";
            }
        }

        protected void insuranceddl_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}