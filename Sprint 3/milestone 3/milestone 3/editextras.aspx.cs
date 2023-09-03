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
    public partial class editextras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("viewextrasid", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string id = rdr.GetString(rdr.GetOrdinal("extra_type"));
                types.Items.Add(new ListItem(id + ""));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("UpdateExtraRate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            int extra_id = 0;
            try {
                extra_id = Int16.Parse(extraidtxt.Text);
            }
            catch (Exception exp) {
                extraidreq.Text = " the extra id must be an intger";
                return;
            }
            decimal rate = 0;
            try
            {
                rate = Decimal.Parse(incvaltxt.Text);
            }
            catch (Exception exp)
            {
                incvalreq.Text = " the new rate must be an decimal";
                return;
            }
            cmd.Parameters.Add(new SqlParameter("@id", extra_id));
            cmd.Parameters.Add(new SqlParameter("@rate", rate));
            
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            success.Text = " item rate updated successfully";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("UpdateExtraTypeWithVal", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string type = types.SelectedValue.ToString();
            decimal rate = 0;
            try
            {
                rate = Decimal.Parse(incvaltxt.Text);
            }
            catch (Exception exp)
            {
                incvalreq.Text = " the new rate must be an decimal";
                return;
            }
            cmd.Parameters.Add(new SqlParameter("@type", type));
            cmd.Parameters.Add(new SqlParameter("@value", rate));

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            success.Text = " item type rates updated successfully";
        }
    }
}