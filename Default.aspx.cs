using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmers_Insurance_MS
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string constr = WebConfigurationManager.ConnectionStrings["db_fifms"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("select * from tbl_farmers where emailAddress=@emailAddress and password=@password", con);
            cmd.Parameters.AddWithValue("@emailAddress", txt_user.Text);
            cmd.Parameters.AddWithValue("@password", txt_pass.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (dt.Rows.Count > 0)
            {

                con.Open();
                SqlCommand cmd1 = new SqlCommand("SELECT firstName, lastName FROM tbl_farmers WHERE emailAddress = @email", con);
                cmd.Parameters.AddWithValue("@email", txt_user.Text);

                SqlDataReader sdr = cmd.ExecuteReader();
                try
                {
                    if (sdr.Read())
                    {
                        lbl_fn.Text = sdr["firstName"].ToString();
                        lbl_ln.Text = sdr["lastName"].ToString();
                    }

                }
                catch (Exception ex)
                {

                }
                con.Close();
                Response.Redirect("Farmers/Dashboard.aspx?Parameter=" + txt_user.Text);
            }
            else
            {
                lbl_alert.ForeColor = Color.Red;
                lbl_alert.Font.Bold = true;
                lbl_alert.Text = "Invalid Email Address or Password";

            }

        }
    }
}