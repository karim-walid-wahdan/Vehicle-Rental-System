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
    public partial class employeeupdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void update_Click(object sender, EventArgs e)
        {
            namereq.Text = "";
            emailreq.Text = "";
            addressreq.Text = "";
            passreq.Text = "";
            passrereq.Text = "";
            bool flag = true;
            string password = "";
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
            if (hpwtxt.Text == "") {
                hoursperweekreq.Text = "this field is required";
                flag = false;
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
                namereq.Text = "";
                emailreq.Text = "";
                addressreq.Text = "";
                passreq.Text = "";
                passrereq.Text = "";
                hoursperweekreq.Text = "";
                string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("UpdateEmpProfil", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                string ssn = Application["employeessn"].ToString();
                string name = nametxt.Text;
                string email = emailtxt.Text;
                string address = addresstxt.Text;
                password = passtxt.Text;
                int hpw = 0;
                try
                {
                    hpw = Int32.Parse(hpwtxt.Text);
                }
                catch(Exception exp) {
                    hoursperweekreq.Text = "must be an intgear";
                    return;
                }
                cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
                cmd.Parameters.Add(new SqlParameter("@name", name));
                cmd.Parameters.Add(new SqlParameter("@email", email));
                cmd.Parameters.Add(new SqlParameter("@address", address));
                cmd.Parameters.Add(new SqlParameter("@password", password));
                cmd.Parameters.Add(new SqlParameter("@hours_per_week", hpw));
                SqlParameter successbit = cmd.Parameters.Add("@Success_bit", SqlDbType.Int);
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
                    success.Text = "can not update user doesnot exist";
                }
            }
        }
    }
}