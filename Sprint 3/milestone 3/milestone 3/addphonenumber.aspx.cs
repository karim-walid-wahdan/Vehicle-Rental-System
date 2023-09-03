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
    public partial class addphonenumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool flag = true;
            if (phonetxt.Text == "") 
            {
                phonereq.Text = "this field is required";
                flag = false;
            }
            if (flag)
            {
                successlbl.Text = "";
                string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand phone_Cmd = new SqlCommand("addMobile", conn);
                phone_Cmd.CommandType = CommandType.StoredProcedure;
                string ssn = Application["customerssn"].ToString();
                string phone = phonetxt.Text;
                phone_Cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
                phone_Cmd.Parameters.Add(new SqlParameter("@phone_number", phone));

                SqlParameter success = phone_Cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;

                conn.Open();
                phone_Cmd.ExecuteNonQuery();
                conn.Close();

                if (success.Value.ToString().Equals("1"))
                {
                    successlbl.Text = "phone added successful";
                }
                else
                {
                    successlbl.Text = "error adding phone";
                }
            }
        }
    }
}