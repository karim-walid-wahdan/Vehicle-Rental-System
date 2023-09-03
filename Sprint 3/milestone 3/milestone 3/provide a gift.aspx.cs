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
    public partial class provide_a_gift : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("greatestGiftCard", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string ssnTable = rdr.GetString(rdr.GetOrdinal("ssn"));
                string name = rdr.GetString(rdr.GetOrdinal("customer_name"));
                string email = rdr.GetString(rdr.GetOrdinal("customer_email"));
                string address = rdr.GetString(rdr.GetOrdinal("customer_address"));
                decimal value = rdr.GetDecimal(rdr.GetOrdinal("Amount"));

                Label lbl_ssn = new Label();
                lbl_ssn.Text = "ssn :" + ssnTable + ",";
                div1.Controls.Add(lbl_ssn);
                Label lbl_name = new Label();
                lbl_name.Text = "name:" + name + ",";
                div1.Controls.Add(lbl_name);

                Label lbl_email = new Label();
                lbl_email.Text = "email:" + email + ",";
                div1.Controls.Add(lbl_email);

                Label lbl_address = new Label();
                lbl_address.Text = "address:" + address + ",";
                div1.Controls.Add(lbl_address);

                Label lbl_value = new Label();
                lbl_value.Text = "card value:" + value + "<br/>";
                div1.Controls.Add(lbl_value);
            }
            conn.Close();

            SqlCommand cmd1 = new SqlCommand("CustomerWithGift", conn);
            cmd1.CommandType = CommandType.StoredProcedure;
            
            conn.Open();
            SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr1.Read())
            {
                string ssnTable = rdr1.GetString(rdr1.GetOrdinal("ssn"));
                string name = rdr1.GetString(rdr1.GetOrdinal("customer_name"));
                string email = rdr1.GetString(rdr1.GetOrdinal("customer_email"));
                string address = rdr1.GetString(rdr1.GetOrdinal("customer_address"));
                decimal value = rdr1.GetDecimal(rdr1.GetOrdinal("Amount"));

                Label lbl_ssn = new Label();
                lbl_ssn.Text = "ssn :" + ssnTable + ",";
                div2.Controls.Add(lbl_ssn);
                Label lbl_name = new Label();
                lbl_name.Text = "name:" + name + ",";
                div2.Controls.Add(lbl_name);

                Label lbl_email = new Label();
                lbl_email.Text = "email:" + email + ",";
                div2.Controls.Add(lbl_email);

                Label lbl_address = new Label();
                lbl_address.Text = "address:" + address + ",";
                div2.Controls.Add(lbl_address);

                Label lbl_value = new Label();
                lbl_value.Text = "card value:" + value + "<br/>";
                div2.Controls.Add(lbl_value);
            }
        }

        protected void gift_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("ProvideGift", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            decimal value = 0;
            string emp_ssn = Application["employeessn"].ToString();
            string cus_ssn = ssntxt.Text;
            try {
                value = Decimal.Parse(valuetxt.Text);
            }
            catch (Exception exp) {
                valuereq.Text="the gifted value must be a decimal";
                valuetxt.Text = "";
                return;
            }
            cmd.Parameters.Add(new SqlParameter("@customer_ssn", cus_ssn));
            cmd.Parameters.Add(new SqlParameter("@employee_ssn", emp_ssn));
            cmd.Parameters.Add(new SqlParameter("@amount", value));


            SqlParameter successbit = cmd.Parameters.Add("@success", SqlDbType.Int);
            successbit.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            if (successbit.Value.ToString().Equals("1"))
            {
                Response.Redirect("https://localhost:44396/EMPLOYEE_HOMEPAGE.aspx");
            }
            else
            {

                success.Text = "invalid ssn";
            }
        }
    }
}