using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmers_Insurance_MS
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            //this will redirect the user into Admin Login
            Response.Redirect("~/Admin/Login");

        }

        protected void btnFarmers_Click1(object sender, EventArgs e)
        {
            //this will redirect the user into farmers Login
            Response.Redirect("~/Default");

        }
    }
}