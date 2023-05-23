using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmers_Insurance_MS
{
    public partial class Dashboard : System.Web.UI.Page
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
        //redirecting to pending page
        protected void link_pending_Click(object sender, EventArgs e)
        {
            Response.Redirect("PendingReport?Parameter=" + lbl_session.Text);
        }
        //redirecting to pending page
        protected void link_process_Click(object sender, EventArgs e)
        {
            Response.Redirect("InProcessReport?Parameter=" + lbl_session.Text);
        }
        //redirecting to pending page
        protected void link_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("CloseReport?Parameter=" + lbl_session.Text);
        }
        protected void gv_report_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //this block of codes will convert the image, enabling to display image
        
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlImage imageControl = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("imageControl");
                if (((DataRowView)e.Row.DataItem)["IDPhoto"] != DBNull.Value)
                {
                    imageControl.Src = "data:IDPhoto/png;base64," + Convert.ToBase64String((byte[])(((DataRowView)e.Row.DataItem))["IDPhoto"]);
                }
            }
        }
    }
}