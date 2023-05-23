using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmers_Insurance_MS
{
    public partial class AdminDashboard : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Parameter"] != null)
            {
                lbl_session.Text = Server.UrlDecode(Request.QueryString["Parameter"].ToString());

            }
        }
        protected void link_create_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminCreateReport?Parameter=" + lbl_session.Text);
        }
        protected void link_pending_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminPendingReport?Parameter=" + lbl_session.Text);
        }
        protected void link_process_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminInProcessReport?Parameter=" + lbl_session.Text);
        }
        protected void link_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminCloseReport?Parameter=" + lbl_session.Text);
        }
        protected void link_profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminProfile?Parameter=" + lbl_session.Text);
        }
        protected void link_change_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminChangePassword?Parameter=" + lbl_session.Text);
        }
        protected void link_dashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminDash?Parameter=" + lbl_session.Text);
        }
        protected void link_dash_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminDash?Parameter=" + lbl_session.Text);
        }
        protected void link_farmer_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminAddFarmer?Parameter=" + lbl_session.Text);
        }
        protected void link_admin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminAddAdmin?Parameter=" + lbl_session.Text);
        }
        protected void link_logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Index");

        }
    }
}