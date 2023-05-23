using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmers_Insurance_MS.Admin
{
    public partial class AdminProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Parameter"] != null)
            {
                lbl_session.Text = Server.UrlDecode(Request.QueryString["Parameter"].ToString());

            }
            if (!this.IsPostBack)
            {
                string constr = WebConfigurationManager.ConnectionStrings["db_fifms"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT firstName, middleName, lastName, position FROM tbl_admin WHERE emailAddress = @email_add", con);
                cmd.Parameters.AddWithValue("@email_add", lbl_session.Text);

                SqlDataReader sdr = cmd.ExecuteReader();
                try
                {
                    if (sdr.Read())
                    {
                        txt_firstname.Text = sdr["firstName"].ToString();
                        txt_middlename.Text = sdr["middleName"].ToString();
                        txt_lastname.Text = sdr["lastName"].ToString();
                        txt_position.Text = sdr["position"].ToString();
                        //byte[] imageData = (byte[])sdr["photo"];
                        //string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                        //img_profile.ImageUrl = "data:photo/png;base64," + img;
                    }

                    con.Close();
                }
                catch (Exception ex)
                {

                }
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //int filelenght = file_prof.PostedFile.ContentLength;
            //byte[] imagebytes = new byte[filelenght];
            //file_prof.PostedFile.InputStream.Read(imagebytes, 0, filelenght);
            string constr = ConfigurationManager.ConnectionStrings["db_fifms"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE tbl_farmers SET [FirstName] = @first_name, [middleName]=@middle_name, [lastName]=@last_name, [position]= @position WHERE [emailAddress] = @email_add", con); // to add image [ProfileImg]=@ProfileImg 
                SqlDataAdapter adapter = new SqlDataAdapter();
                cmd.Parameters.AddWithValue("@email_add", lbl_session.Text);
                cmd.Parameters.AddWithValue("@first_name", txt_firstname.Text);
                cmd.Parameters.AddWithValue("@middle_name", txt_middlename.Text);
                cmd.Parameters.AddWithValue("@last_name", txt_lastname.Text);
                cmd.Parameters.AddWithValue("@position", txt_position.Text);
                //cmd.Parameters.AddWithValue("@ProfileImg", imagebytes);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
                lbl_note.ForeColor = Color.Black;
                lbl_note.Font.Bold = true;
                lbl_note.Text = "Profile Successfully Updated!";
            }
        }
    }
}