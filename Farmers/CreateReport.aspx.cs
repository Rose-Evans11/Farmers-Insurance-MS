using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmers_Insurance_MS.Farmers
{
    public partial class CreateReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this block of codes is getting the parameter or session information
            if (Request.QueryString["Parameter"] != null)
            {
                lbl_session.Text = Server.UrlDecode(Request.QueryString["Parameter"].ToString());

            }
            //this is displaying information of session information that the previous page get
            if (!this.IsPostBack)
            {
                string constr = WebConfigurationManager.ConnectionStrings["db_fifms"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT firstName, middleName, lastName, barangayName, contactNumber, emailAddress FROM tbl_farmers WHERE emailAddress = @email_add", con);
                cmd.Parameters.AddWithValue("@email_add", lbl_session.Text);

                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    txt_fname.Text = sdr["firstName"].ToString();
                    txt_mname.Text = sdr["middleName"].ToString();
                    txt_lname.Text = sdr["lastName"].ToString();
                    txt_barangay.Text = sdr["barangayName"].ToString();
                    txt_contact.Text = sdr["contactNumber"].ToString();
                    txt_email.Text = sdr["emailAddress"].ToString();

                }

                con.Close();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["db_fifms"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("SELECT MAX(ReportID) ReportID FROM tbl_report", con);

            con.Open();
            int id = Convert.ToInt32(cmd.ExecuteScalar().ToString() == "" ? 0 : cmd.ExecuteScalar());
            int filelenght = fl_id.PostedFile.ContentLength;
            byte[] imagebytes = new byte[filelenght];
            fl_id.PostedFile.InputStream.Read(imagebytes, 0, filelenght);
            if (id == 0)
            {
                cmd = new SqlCommand("SET IDENTITY_INSERT [dbo].[tbl_report] on;INSERT INTO tbl_report(ReportID," +
                        "firstName, " +
                        "middleName," +
                        "lastName," +
                        "contactNumber," +
                        " IDName," +
                        " IDPhoto," +
                        " barangayName, " +
                        "insuranceType, " +
                        "cropName, " +
                        "description, " +
                        "farmLocationName, " +
                        "cost, " +
                        "north, " +
                        "east, " +
                        "west, " +
                        "south, " +
                        "remarks, " +
                        "datePlanted, " +
                        "dateApplied, " +
                        "emailAddress, " +
                        "farmPortion) VALUES(@ReportID," +
                        "@firstName, " +
                        "@middleName," +
                        "@lastName," +
                        "@contactNumber," +
                        "@IDName," +
                        "@IDPhoto," +
                        "@barangayName, " +
                        "@insuranceType, " +
                        "@cropName, " +
                        "@description, " +
                        "@farmLocationName, " +
                        "@cost, " +
                        "@north, " +
                        "@east, " +
                        "@west, " +
                        "@south," +
                        "@remarks," +
                        "@datePlanted," +
                        "@dateApplied," +
                        "@emailAddress," +
                        "@farmPortion)", con);
                cmd.Parameters.AddWithValue("@ReportID", 1);
                cmd.Parameters.AddWithValue("@firstName", txt_fname.Text);
                cmd.Parameters.AddWithValue("@middleName", txt_mname.Text);
                cmd.Parameters.AddWithValue("@lastName", txt_lname.Text);
                cmd.Parameters.AddWithValue("@contactNumber", txt_contact.Text);
                cmd.Parameters.AddWithValue("@IDName", dl_ID.Text);
                cmd.Parameters.AddWithValue("@IDPhoto",imagebytes);
                cmd.Parameters.AddWithValue("@barangayName", txt_barangay.Text);
                cmd.Parameters.AddWithValue("@insuranceType", dl_insuranceType.Text);
                cmd.Parameters.AddWithValue("@cropName", dl_crop.Text);
                cmd.Parameters.AddWithValue("@description", txt_desc.Text);
                cmd.Parameters.AddWithValue("@farmLocationName", dl_farm.Text);
                cmd.Parameters.AddWithValue("@cost", txt_cost.Text);
                cmd.Parameters.AddWithValue("@north", txt_north.Text);
                cmd.Parameters.AddWithValue("@east", txt_east.Text);
                cmd.Parameters.AddWithValue("@west", txt_west.Text);
                cmd.Parameters.AddWithValue("@south", txt_south.Text);
                cmd.Parameters.AddWithValue("@remarks", "Pending");
                cmd.Parameters.AddWithValue("@datePlanted", txt_dtPlanted.Text);
                cmd.Parameters.AddWithValue("@dateApplied", txt_dtApplied.Text);
                cmd.Parameters.AddWithValue("@emailAddress", lbl_session.Text);
                cmd.Parameters.AddWithValue("@farmPortion", txt_portion.Text);
                cmd.ExecuteNonQuery();
            }
            else
            {
                id++;
                cmd = new SqlCommand("SET IDENTITY_INSERT [dbo].[tbl_report] on;INSERT INTO tbl_report(ReportID," +
                        "firstName, " +
                        "middleName," +
                        "lastName," +
                        "contactNumber," +
                        " IDName," +
                        " IDPhoto," +
                        " barangayName, " +
                        "insuranceType, " +
                        "cropName, " +
                        "description, " +
                        "farmLocationName, " +
                        "cost, " +
                        "north, " +
                        "east, " +
                        "west, " +
                        "south, " +
                        "remarks, " +
                        "datePlanted, " +
                        "dateApplied, " +
                        "emailAddress, " +
                        "farmPortion) VALUES(@ReportID," +
                        "@firstName, " +
                        "@middleName," +
                        "@lastName," +
                        "@contactNumber," +
                        "@IDName," +
                        "@IDPhoto," +
                        "@barangayName, " +
                        "@insuranceType, " +
                        "@cropName, " +
                        "@description, " +
                        "@farmLocationName, " +
                        "@cost, " +
                        "@north, " +
                        "@east, " +
                        "@west, " +
                        "@south," +
                        "@remarks," +
                        "@datePlanted," +
                        "@dateApplied," +
                        "@emailAddress," +
                        "@farmPortion)", con);
                cmd.Parameters.AddWithValue("@ReportID", id);
                cmd.Parameters.AddWithValue("@firstName", txt_fname.Text);
                cmd.Parameters.AddWithValue("@middleName", txt_mname.Text);
                cmd.Parameters.AddWithValue("@lastName", txt_lname.Text);
                cmd.Parameters.AddWithValue("@contactNumber", txt_contact.Text);
                cmd.Parameters.AddWithValue("@IDName", dl_ID.Text);
                cmd.Parameters.AddWithValue("@IDPhoto", imagebytes);
                cmd.Parameters.AddWithValue("@barangayName", txt_barangay.Text);
                cmd.Parameters.AddWithValue("@insuranceType", dl_insuranceType.Text);
                cmd.Parameters.AddWithValue("@cropName", dl_crop.Text);
                cmd.Parameters.AddWithValue("@description", txt_desc.Text);
                cmd.Parameters.AddWithValue("@farmLocationName", dl_farm.Text);
                cmd.Parameters.AddWithValue("@cost", txt_cost.Text);
                cmd.Parameters.AddWithValue("@north", txt_north.Text);
                cmd.Parameters.AddWithValue("@east", txt_east.Text);
                cmd.Parameters.AddWithValue("@west", txt_west.Text);
                cmd.Parameters.AddWithValue("@south", txt_south.Text);
                cmd.Parameters.AddWithValue("@remarks", "Pending");
                cmd.Parameters.AddWithValue("@datePlanted", txt_dtPlanted.Text);
                cmd.Parameters.AddWithValue("@dateApplied", txt_dtApplied.Text);
                cmd.Parameters.AddWithValue("@emailAddress", lbl_session.Text);
                cmd.Parameters.AddWithValue("@farmPortion", txt_dtApplied.Text);
                cmd.ExecuteNonQuery();
            }
            lbl_note.ForeColor = Color.Black;
            lbl_note.Font.Bold = true;
            lbl_note.Text = "Report Successfully Updated!";
            con.Close();
        }
        
    }
}