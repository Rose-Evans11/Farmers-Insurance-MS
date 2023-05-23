using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmers_Insurance_MS.Admin
{
    public partial class AdminAddAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this will get the parameter and set it in lbl session
            if (Request.QueryString["Parameter"] != null)
            {
                lbl_session.Text = Server.UrlDecode(Request.QueryString["Parameter"].ToString());

            }
            btn_update.Visible = false;
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            //this code of blocks will connect on the database of fifms and get the max ID of the tbl_admin
            //Admin will allow to add new admin

            string constr = ConfigurationManager.ConnectionStrings["db_fifms"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("SELECT MAX(adminID) adminID FROM tbl_admin", con);

            con.Open();
            int id = Convert.ToInt32(cmd.ExecuteScalar().ToString() == "" ? 0 : cmd.ExecuteScalar());

            if (id == 0)
            {
                cmd = new SqlCommand("SET IDENTITY_INSERT [dbo].[tbl_admin] on;INSERT INTO tbl_admin(adminID," +
                        "firstName, " +
                        "middleName," +
                        "lastName," +
                        "emailAddress, " +
                        "password," +
                        "position) VALUES(@adminID," +
                        "@firstName, " +
                        "@middleName," +
                        "@lastName," +
                        "@emailAddress, " +
                        "@password," +
                        "@position)", con);
                cmd.Parameters.AddWithValue("@adminID", 1);
                cmd.Parameters.AddWithValue("@firstName", lbl_fname.Text);
                cmd.Parameters.AddWithValue("@middleName", lbl_mname.Text);
                cmd.Parameters.AddWithValue("@lastName", lbl_lname.Text);
                cmd.Parameters.AddWithValue("@password", txt_password.Text);
                cmd.Parameters.AddWithValue("@position", lbl_position.Text);
                cmd.Parameters.AddWithValue("@emailAddress", lbl_email.Text);
                cmd.ExecuteNonQuery();
            }
            else
            {
                id++;
                cmd = new SqlCommand("SET IDENTITY_INSERT [dbo].[tbl_admin] on;INSERT INTO tbl_admin(adminID," +
                       "firstName, " +
                        "middleName," +
                        "lastName," +
                        "emailAddress, " +
                        "password," +
                        "position) VALUES(@adminID," +
                        "@firstName, " +
                        "@middleName," +
                        "@lastName," +
                        "@emailAddress, " +
                        "@password," +
                        "@position)", con);
                cmd.Parameters.AddWithValue("@adminID", id);
                cmd.Parameters.AddWithValue("@firstName", lbl_fname.Text);
                cmd.Parameters.AddWithValue("@middleName", lbl_mname.Text);
                cmd.Parameters.AddWithValue("@lastName", lbl_lname.Text);
                cmd.Parameters.AddWithValue("@password", txt_password.Text);
                cmd.Parameters.AddWithValue("@position", lbl_position.Text);
                cmd.Parameters.AddWithValue("@emailAddress", lbl_email.Text);
                cmd.ExecuteNonQuery();
            }
            lbl_note.ForeColor = Color.Black;
            lbl_note.Font.Bold = true;
            gv.DataBind();
            lbl_note.Text = "Report Successfully Updated!";
            con.Close();
        }
        protected void btn_edit_Click(object sender, EventArgs e)
        {
            //this will shows  the button for update
            btn_add.Visible = false;
            btn_update.Visible = true;
            set_pass.Visible = false;
            txt_password.Visible = false;
        }
        protected void btn_update_Click(object sender, EventArgs e)
        {
            //this block of codes will allow admin to update the information of the specific admin account
            btn_update.Visible = true;
            string constr = ConfigurationManager.ConnectionStrings["db_fifms"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE tbl_admin SET [FirstName] = @first_name, [middleName]=@middle_name, [lastName]=@last_name, [emailAddress]=@email, [position]=@position WHERE [adminID] = @adminID", con); // to add image [ProfileImg]=@ProfileImg 
                SqlDataAdapter adapter = new SqlDataAdapter();
                cmd.Parameters.AddWithValue("@adminID", lbl_id.Text);
                cmd.Parameters.AddWithValue("@first_name", lbl_fname.Text);
                cmd.Parameters.AddWithValue("@middle_name", lbl_mname.Text);
                cmd.Parameters.AddWithValue("@last_name", lbl_lname.Text);
                cmd.Parameters.AddWithValue("@position", lbl_position.Text);
                cmd.Parameters.AddWithValue("@email", lbl_email.Text);
                //cmd.Parameters.AddWithValue("@ProfileImg", imagebytes);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
                lbl_note.ForeColor = Color.Black;
                lbl_note.Font.Bold = true;
                gv.DataBind();
                lbl_note.Text = "Farmers Successfully Updated!";

            }

        }
        protected void gv_report_SelectedIndexChanged(object sender, EventArgs e)
        {
            //this will display the selected data in the form
            GridViewRow row = gv.SelectedRow;
            lbl_id.Text = row.Cells[1].Text;
            lbl_fname.Text = row.Cells[2].Text;
            lbl_mname.Text = row.Cells[3].Text;
            lbl_lname.Text = row.Cells[4].Text;
            lbl_email.Text = row.Cells[5].Text;
            lbl_position.Text = row.Cells[6].Text.ToString();
        }
    }
}


    