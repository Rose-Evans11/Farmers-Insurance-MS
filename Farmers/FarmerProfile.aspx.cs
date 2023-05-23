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

namespace Farmers_Insurance_MS.Farmers
{
    public partial class FarmerProfile : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SELECT firstName, middleName, lastName, contactNumber, barangayName, photo FROM tbl_farmers WHERE emailAddress = @email_add", con);
                cmd.Parameters.AddWithValue("@email_add", lbl_session.Text);

                SqlDataReader sdr = cmd.ExecuteReader();
                try
                {
                    if (sdr.Read())
                    {
                        txt_firstname.Text = sdr["firstName"].ToString();
                        txt_middlename.Text = sdr["middleName"].ToString();
                        txt_lastname.Text = sdr["lastName"].ToString();
                        txt_contact.Text = sdr["contactNumber"].ToString();
                        dl_address.Text = sdr["barangayName"].ToString();
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
                SqlCommand cmd = new SqlCommand("UPDATE tbl_farmers SET [FirstName] = @first_name, [middleName]=@middle_name, [lastName]=@last_name, [contactNumber]= @contact, [barangayName]=@address WHERE [emailAddress] = @email_add", con); // to add image [ProfileImg]=@ProfileImg 
                SqlDataAdapter adapter = new SqlDataAdapter();
                cmd.Parameters.AddWithValue("@email_add", lbl_session.Text);
                cmd.Parameters.AddWithValue("@first_name", txt_firstname.Text);
                cmd.Parameters.AddWithValue("@middle_name", txt_middlename.Text);
                cmd.Parameters.AddWithValue("@last_name", txt_lastname.Text);
                cmd.Parameters.AddWithValue("@contact", txt_contact.Text);
                cmd.Parameters.AddWithValue("@address", dl_address.Text);
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