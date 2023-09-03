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
    public partial class addpayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool flag = true;
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand phone_Cmd = new SqlCommand("viewpaymentinfo", conn);
            phone_Cmd.CommandType = CommandType.StoredProcedure;
            string ssn = Application["customerssn"].ToString();
            phone_Cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
            conn.Open();
            SqlDataReader rdr = phone_Cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                if (flag) {
                    div1.Controls.Clear();
                    flag = false;
                }
                string card_number = rdr.GetString(rdr.GetOrdinal("Number"));

                Label lbl_card_number = new Label();
                lbl_card_number.Text = "card_number :" + card_number + "<br/>";
                div1.Controls.Add(lbl_card_number);

            }
        }

            protected void Button1_Click(object sender, EventArgs e)
        {
            cardreq.Text = "";
            cvvreq.Text = "";
            yearreq.Text = "";
            monthreq.Text = "";
            dayreq.Text = "";
            bool flag = true;
            if (cardtxt.Text=="") {
                cardreq.Text = "this field is required";
                flag = false;
            }

            if (cvvtxt.Text == "")
            {
                cvvreq.Text = "this field is required";
                flag = false;
            }

            if (yeartxt.Text == "")
            {
                yearreq.Text = "this field is required";
                flag = false;
            }

            if (monthtxt.Text == "")
            {
                monthreq.Text = "this field is required";
                flag = false;
            }

            if (daytxt.Text == "")
            {
                dayreq.Text = "this field is required";
                flag = false;
            }

            if (flag)
            {
                string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand phone_Cmd = new SqlCommand("addOnlinePayment", conn);
                phone_Cmd.CommandType = CommandType.StoredProcedure;
                string ssn = Application["customerssn"].ToString();
                string card = cardtxt.Text;
                string cvv = cvvtxt.Text;
                string year = yeartxt.Text;
                string month = monthtxt.Text;
                string day = daytxt.Text;
                string date = year + "-" + month + "-" + day;
                phone_Cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
                phone_Cmd.Parameters.Add(new SqlParameter("@credit_card_number", card));
                phone_Cmd.Parameters.Add(new SqlParameter("@cvv", cvv));
                phone_Cmd.Parameters.Add(new SqlParameter("@expire", date));

                SqlParameter success = phone_Cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;

                conn.Open();
                phone_Cmd.ExecuteNonQuery();
                conn.Close();

                if (success.Value.ToString().Equals("1"))
                {
                    successlbl.Text = "card added successful";
                }
                else
                {
                    successlbl.Text = "error adding card";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            cardreq.Text = "";
            successlbl.Text = "";
            bool flag = true;
            if (cardtxt.Text == "")
            {
                cardreq.Text = "this field is required";
                flag = false;
            }
            if (flag)
            {
                string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand phone_Cmd = new SqlCommand("deleteCreditCard", conn);
                phone_Cmd.CommandType = CommandType.StoredProcedure;
                string ssn = Application["customerssn"].ToString();
                string card = cardtxt.Text;

                phone_Cmd.Parameters.Add(new SqlParameter("@customer_ssn", ssn));
                phone_Cmd.Parameters.Add(new SqlParameter("@credit_card_number", card));
                SqlParameter success = phone_Cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;

                conn.Open();
                phone_Cmd.ExecuteNonQuery();
                conn.Close();

                if (success.Value.ToString().Equals("1"))
                {
                    successlbl.Text = "card deleted successful";
                }
                else
                {
                    successlbl.Text = "error deleting card ";
                }
            }
        }
    }
}