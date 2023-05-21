using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmers_Insurance_MS
{
    public partial class UserDashboard : System.Web.UI.MasterPage
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
            Response.Redirect("~/Farmers/CreateReport?Parameter=" + lbl_session.Text);
        }
        protected void link_pending_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Farmers/PendingReport?Parameter=" + lbl_session.Text);
        }
        protected void link_process_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Farmers/InProcessReport?Parameter=" + lbl_session.Text);
        }
        protected void link_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Farmers/CloseReport?Parameter=" + lbl_session.Text);
        }
        protected void link_profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Farmers/FarmerProfile?Parameter=" + lbl_session.Text);
        }
        protected void link_change_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Farmers/FarmerChangePassword?Parameter=" + lbl_session.Text);
        }
        protected void link_dashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Farmers/Dashboard?Parameter=" + lbl_session.Text);
        }
        protected void link_dash_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Farmers/Dashboard?Parameter=" + lbl_session.Text);
        }
    }
}