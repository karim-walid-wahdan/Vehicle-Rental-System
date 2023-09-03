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
    
    public partial class additem : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            success.Text = "";
            if (items.SelectedItem.Value.ToString().Equals("location"))
            {
                locationdiv.Style.Clear();
                vehiclediv.Style.Add("display", "none");
                extradiv.Style.Add("display", "none");
                insurancediv.Style.Add("display", "none");
                ADD.Style.Clear();
                checker.Text = "";
            }
            else if (items.SelectedItem.Value.ToString().Equals("vehicle"))
            {
                locationdiv.Style.Add("display", "none");
                vehiclediv.Style.Clear();
                extradiv.Style.Add("display", "none");
                insurancediv.Style.Add("display", "none");
                ADD.Style.Clear();
                checker.Text = "";
            }
            else if (items.SelectedItem.Value.ToString().Equals("extra"))
            {

                locationdiv.Style.Add("display", "none");
                vehiclediv.Style.Add("display", "none");
                extradiv.Style.Clear();
                insurancediv.Style.Add("display", "none");
                ADD.Style.Clear();
                checker.Text = "";

            }
            else if (items.SelectedItem.Value.ToString().Equals("insurance"))
            {
                locationdiv.Style.Add("display", "none");
                vehiclediv.Style.Add("display", "none");
                extradiv.Style.Add("display", "none");
                insurancediv.Style.Clear();
                ADD.Style.Clear();
                checker.Text = "";

            }
            else {
                checker.Text = "please choose a item to proceed";
            }
        
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (insurancetypeddl.SelectedItem.Value.ToString().Equals("Advanced"))
            {
                insurancediv.Style.Clear();
                liabiltyreq.Text = "";
                liabilitydiv.Style.Clear();
                ADD.Style.Clear();
            }
            else {
                insurancediv.Style.Clear();
                ADD.Style.Clear();
            }
        }
        protected void ADD_Click(object sender, EventArgs e)
        {

            success.Text = "";
            bool flag = true;
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            if (items.SelectedItem.Value.ToString().Equals("location"))
            {
                locationdiv.Style.Clear();
                vehiclediv.Style.Add("display", "none");
                extradiv.Style.Add("display", "none");
                insurancediv.Style.Add("display", "none");
                ADD.Style.Clear();
                checker.Text = "";
                
                pinnumbereq.Text = "";
                locreq.Text = "";

                if (loctxt.Text == "")
                {
                    locreq.Text = "this field is required";
                    flag = false;
                }
                if (pinnmbtxt.Text == "")
                {
                    pinnumbereq.Text = "this field is required";
                    flag = false;
                }
                if (flag) {
                    SqlCommand add_Cmd = new SqlCommand("ADDLocation", conn);
                    add_Cmd.CommandType = CommandType.StoredProcedure;

                    string location = loctxt.Text;
                    string pin_number = pinnmbtxt.Text;
                    add_Cmd.Parameters.Add(new SqlParameter("@pin_number", pin_number));
                    add_Cmd.Parameters.Add(new SqlParameter("@gps_location", location));
                    SqlParameter successbit = add_Cmd.Parameters.Add("@success", SqlDbType.Int);
                    successbit.Direction = ParameterDirection.Output;

                    conn.Open();
                    add_Cmd.ExecuteNonQuery();
                    conn.Close();
                    if (successbit.Value.ToString().Equals("0"))
                    {
                        pinnmbtxt.Text = "";
                        loctxt.Text = "";
                        success.Text = "location already exists";
                    }
                    else {
                        success.Text = "location added successfully";
                    }

                }
            }
            else if (items.SelectedItem.Value.ToString().Equals("vehicle"))
            {
                brandreq.Text = "";
                modelreq.Text = "";
                gpslocreq.Text = "";
                loc2req.Text = "";
                ratereq.Text = "";
                currentmillagereq.Text = "";
                locationdiv.Style.Add("display", "none");
                vehiclediv.Style.Clear();
                extradiv.Style.Add("display", "none");
                insurancediv.Style.Add("display", "none");
                ADD.Style.Clear();
                checker.Text = "";
                SqlCommand add_Cmd = new SqlCommand("addvehicle", conn);
                add_Cmd.CommandType = CommandType.StoredProcedure;
                if (brandtxt.Text == "")
                {
                    brandreq.Text = "this field is required";
                    flag = false;
                }
                if (modeltxt.Text == "")
                {
                    modelreq.Text = "this field is required";
                    flag = false;
                }
                if (gpsloctxt.Text == "")
                {
                    gpslocreq.Text = "this field is required";
                    flag = false;
                }
                if (loc2txt.Text == "")
                {
                    loc2req.Text = "this field is required";
                    flag = false;
                }
                if (ratetxt.Text == "")
                {
                    ratereq.Text = "this field is required";
                    flag = false;
                }
                if (currentmillagetxt.Text == "")
                {
                    currentmillagereq.Text = "this field is required";
                    flag = false;
                }
                if (flag)
                {

                    brandreq.Text = "";
                    modelreq.Text = "";
                    gpslocreq.Text = "";
                    loc2req.Text = "";
                    ratereq.Text = "";
                    currentmillagereq.Text = "";

                    string engine = motortypeddl.SelectedItem.Value.ToString();
                    string owned = ownsddl.SelectedItem.Value.ToString();
                    decimal rate = 0;
                    try {
                        rate = Decimal.Parse(ratetxt.Text);
                    }
                    catch (Exception exp) {
                        ratereq.Text = "this field must be an decimal";
                             return;
                    }
                    string classv = classddl.SelectedItem.Value.ToString();
                    string brand = brandtxt.Text;
                    string model = modeltxt.Text;
                    int currentmilage = 0;
                    try {

                        currentmilage = Int32.Parse(currentmillagetxt.Text);
                    }
                    catch (Exception exp) {

                        currentmillagereq.Text = "this field must be an intger";
                        return;
                    }
                    string gps_loc = gpsloctxt.Text;
                    string loc = loc2txt.Text;


                    add_Cmd.Parameters.Add(new SqlParameter("@motor", engine));
                    add_Cmd.Parameters.Add(new SqlParameter("@owned", owned));
                    add_Cmd.Parameters.Add(new SqlParameter("@rate", rate));
                    add_Cmd.Parameters.Add(new SqlParameter("@class", classv));
                    add_Cmd.Parameters.Add(new SqlParameter("@brand", brand));
                    add_Cmd.Parameters.Add(new SqlParameter("@model", model));
                    add_Cmd.Parameters.Add(new SqlParameter("@current_milage", currentmilage));
                    add_Cmd.Parameters.Add(new SqlParameter("@gps_loc", gps_loc));
                    add_Cmd.Parameters.Add(new SqlParameter("@loc", loc));

                    conn.Open();
                    try
                    {
                        add_Cmd.ExecuteNonQuery();
                    }
                    catch {
                        loc2req.Text = "please enter a valid location pin number";
                        return;
                    }
                    conn.Close();
                    success.Text = "vehicle added successfully";

                }
            }
            else if (items.SelectedItem.Value.ToString().Equals("extra"))
            {

                extratypereq.Text = "";
                if (extratypeddl.SelectedItem.Value.ToString().Equals("others")) {
                    otherbox.Style.Clear();
                }
                locationdiv.Style.Add("display", "none");
                vehiclediv.Style.Add("display", "none");
                extradiv.Style.Clear();
                insurancediv.Style.Add("display", "none");
                ADD.Style.Clear();
                checker.Text = "";
                if (othertxt.Text == "")
                {
                    if (extratypeddl.SelectedItem.Value.ToString().Equals("others"))
                    {
                        extratypereq.Text = "this field is required";
                        flag = false;
                    }
                }
                if (extraratetxt.Text == "")
                {
                    extraratereq.Text = "this field is required";
                    flag = false;
                }
                if (flag)
                {
                    string type = "";
                    SqlCommand add_Cmd = new SqlCommand("AddExtra", conn);
                    add_Cmd.CommandType = CommandType.StoredProcedure;
                    decimal rate = 0;
                    try
                    {
                        rate = Decimal.Parse(extraratetxt.Text);
                    }
                    catch (Exception exp)
                    {
                        extraratereq.Text = "this field must be an decimal";
                        return;
                    }
                    if (extratypeddl.SelectedItem.Value.ToString().Equals("others"))
                    {
                        type = othertxt.Text;
                        extratypeddl.Items.Remove("others");
                        extratypeddl.Items.Add(new ListItem(type));

                        extratypeddl.Items.Add("others");
                    }
                    else {
                        type = extratypeddl.SelectedItem.Value.ToString();
                    }
                    add_Cmd.Parameters.Add(new SqlParameter("@type", type));
                    add_Cmd.Parameters.Add(new SqlParameter("@rate", rate));
                    conn.Open();
                    add_Cmd.ExecuteNonQuery();
                    conn.Close();
                    success.Text = " extra added successfully";
                }
            }
            else if (items.SelectedItem.Value.ToString().Equals("insurance"))
            {
                if (insurancetypeddl.SelectedItem.ToString().Equals("Advanced")) {
                liabiltyreq.Text = "";
                    liabilitydiv.Style.Clear();
                }
                insuranceidreq.Text = "";
                insuranceidreq.Text = "";
                liabiltyreq.Text = "";

                locationdiv.Style.Add("display", "none");
                vehiclediv.Style.Add("display", "none");
                extradiv.Style.Add("display", "none");
                insurancediv.Style.Clear();
                ADD.Style.Clear();
                checker.Text = "";

                if (insuranceidtxt.Text == "")
                {
                    insuranceidreq.Text = "this field is required";
                    flag = false;
                }
                if (insuranceratetxt.Text == "")
                {
                    insuranceratereq.Text = "this field is required";
                    flag = false;
                }
                if (liabilitytxt.Text == "" &&insurancetypeddl.SelectedItem.ToString().Equals("Advanced"))
                {
                    liabiltyreq.Text = "this field is required";
                    flag = false;
                }
                if (flag)
                {
                    SqlCommand add_Cmd = new SqlCommand("AddInsurance", conn);
                    add_Cmd.CommandType = CommandType.StoredProcedure;
                    string insurancetype = insurancetypeddl.SelectedItem.Value.ToString();
                    string insuranceid = insuranceidtxt.Text;
                    decimal rate = 0;
                    try
                    {
                        rate = Decimal.Parse(insuranceratetxt.Text);
                    }
                    catch (Exception exp)
                    {
                        insuranceratereq.Text = "this field must be an decimal";
                        return;
                    }
                    decimal liability_amount = 0;
                    try
                    {
                        liability_amount = Decimal.Parse(liabilitytxt.Text);
                    }
                    catch (Exception exp)
                    {
                        liabiltyreq.Text = "this field must be an decimal";
                        liability_amount = 0;
                        if (insurancetypeddl.SelectedItem.Value.ToString().Equals("Advanced"))
                        {
                            return;
                        }
                    }
                    add_Cmd.Parameters.Add(new SqlParameter("@type", insurancetype));
                    add_Cmd.Parameters.Add(new SqlParameter("@insurance", insuranceid));
                    add_Cmd.Parameters.Add(new SqlParameter("@rate", rate));
                    add_Cmd.Parameters.Add(new SqlParameter("@liability_amount", liability_amount));
                    SqlParameter successbit = add_Cmd.Parameters.Add("@success", SqlDbType.Int);
                    successbit.Direction = ParameterDirection.Output;

                    conn.Open();
                    add_Cmd.ExecuteNonQuery();
                    conn.Close();
                    if (successbit.Value.ToString().Equals("0"))
                    {
                        insuranceidtxt.Text = "";
                        insuranceratetxt.Text = "";
                        liabilitytxt.Text = "";
                        success.Text = "insurance already exists";
                    }
                    else
                    {
                        success.Text = "insurance added successfully";
                    }

                }
            }
        }

        protected void extratypeddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (extratypeddl.SelectedItem.Value.ToString().Equals("others")) {
                othertxt.Text = "";
                extratypereq.Text = "";
                extradiv.Style.Clear();
                otherbox.Style.Clear();
                ADD.Style.Clear();
            }
            else {
                extratypereq.Text = "";
                extradiv.Style.Clear();
                ADD.Style.Clear();

            }
        }
    }
}