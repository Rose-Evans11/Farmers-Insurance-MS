using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Farmers_Insurance_MS.Farmers
{
    public partial class PendingReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Parameter"] != null)
            {
                lbl_session.Text = Server.UrlDecode(Request.QueryString["Parameter"].ToString());

            }
            fl_change.Visible = false;
            lbl_change.Visible = false;
        }
       
            protected void gv_report_RowDataBound(object sender, GridViewRowEventArgs e)
            {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlImage imageControl = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("imageControl");
                if (((DataRowView)e.Row.DataItem)["IDPhoto"] != DBNull.Value)
                {
                    imageControl.Src = "data:IDPhoto/png;base64," + Convert.ToBase64String((byte[])(((DataRowView)e.Row.DataItem))["IDPhoto"]);
                }
            }
        }

        protected void gv_report_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row =gv.SelectedRow;
            lbl_report_id.Text = row.Cells[1].Text;
            lbl_fname.Text = row.Cells[2].Text;
            lbl_mname.Text = row.Cells[3].Text;
            lbl_lname.Text = row.Cells[4].Text;
            lbl_contact.Text = row.Cells[5].Text;
            dl_ID.Text = row.Cells[6].Text.ToString();
            lbl_brgy.Text = row.Cells[7].Text;
            dl_insurance.Text = row.Cells[8].Text.ToString();
            dl_crop.Text = row.Cells[9].Text.ToString();
            lbl_desc.Text = row.Cells[10].Text;
            dl_farm.Text = row.Cells[11].Text.ToString();
            lbl_cost.Text = row.Cells[12].Text;
            lbl_north.Text = row.Cells[13].Text;
            lbl_east.Text = row.Cells[14].Text;
            lbl_west.Text = row.Cells[15].Text;
            lbl_south.Text = row.Cells[16].Text;
            lbl_planted.Text = row.Cells[17].Text.ToString();
            lbl_applied.Text = row.Cells[18].Text.ToString();
            lbl_email.Text = row.Cells[19].Text;
            lbl_portion.Text = row.Cells[20].Text;

            string constr = ConfigurationManager.ConnectionStrings["db_fifms"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand cmd = new SqlCommand("Select IDPhoto from tbl_report where ReportID= '" + lbl_report_id.Text + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    byte[] imageData = (byte[])dr["IDPhoto"];
                    string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                    img_photo.ImageUrl = "data:IDPhoto/png;base64," + img;
                }
            }
        }
        protected void btn_change_Click(object sender, EventArgs e)
        {
            lbl_change.Visible = true;
            fl_change.Visible = true;
        }
        protected void btn_update_Click(object sender, EventArgs e)
        {

            string constr = ConfigurationManager.ConnectionStrings["db_fifms"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {

                con.Open();

                if (fl_change.HasFile)
                {
                    int filelenght = fl_change.PostedFile.ContentLength;
                    byte[] imagebytes = new byte[filelenght];
                    fl_change.PostedFile.InputStream.Read(imagebytes, 0, filelenght);
                    SqlCommand cmd = new SqlCommand("UPDATE tbl_report SET [insuranceType]=@insuranceType, [cropName]=@cropName, [farmLocationName]=@farmLocationName,[datePlanted]=@datePlanted, [dateApplied]=@dateApplied, [description]=@description, " +
                        "[cost]=@cost,[north]=@north, [east]=@east, [west]=@west, [south]=@south, [IDName]=@IDName, [IDPhoto]=@IDPhoto" +
                    " WHERE [ReportID] = @report_id", con);
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    cmd.Parameters.AddWithValue("@report_id", lbl_report_id.Text);
                    cmd.Parameters.AddWithValue("@insuranceType", dl_insurance.Text);
                    cmd.Parameters.AddWithValue("@cropName", dl_crop.Text);
                    cmd.Parameters.AddWithValue("@farmLocationName", dl_farm.Text);
                    cmd.Parameters.AddWithValue("@datePlanted", lbl_planted.Text);
                    cmd.Parameters.AddWithValue("@dateApplied", lbl_applied.Text);
                    cmd.Parameters.AddWithValue("@description", lbl_desc.Text);
                    cmd.Parameters.AddWithValue("@cost", lbl_cost.Text);
                    cmd.Parameters.AddWithValue("@north", lbl_north.Text);
                    cmd.Parameters.AddWithValue("@east", lbl_east.Text);
                    cmd.Parameters.AddWithValue("@west", lbl_west.Text);
                    cmd.Parameters.AddWithValue("@south", lbl_south.Text);
                    cmd.Parameters.AddWithValue("@IDName", dl_ID.Text);
                    cmd.Parameters.AddWithValue("@IDPhoto", imagebytes);

                    cmd.ExecuteNonQuery();
                    //Response.Write("<script>alert('Successfully!')</script>");
                    lbl_note.ForeColor = Color.Black;
                    lbl_note.Font.Bold = true;
                    lbl_note.Text = "Report Successfully Updated!";
                    gv.DataBind();
                    cmd.Dispose();
                    con.Close();
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("UPDATE tbl_report SET [insuranceType]=@insuranceType, [cropName]=@cropName, [farmLocationName]=@farmLocationName,[datePlanted]=@datePlanted, [dateApplied]=@dateApplied, [description]=@description, " +
                    "[cost]=@cost,[north]=@north, [east]=@east, [west]=@west, [south]=@south, [IDName]=@IDName" +
                   " WHERE [ReportID] = @report_id", con);
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    cmd.Parameters.AddWithValue("@report_id", lbl_report_id.Text);
                    cmd.Parameters.AddWithValue("@insuranceType", dl_insurance.Text);
                    cmd.Parameters.AddWithValue("@cropName", dl_crop.Text);
                    cmd.Parameters.AddWithValue("@farmLocationName", dl_farm.Text);
                    cmd.Parameters.AddWithValue("@datePlanted", lbl_planted.Text);
                    cmd.Parameters.AddWithValue("@dateApplied", lbl_applied.Text);
                    cmd.Parameters.AddWithValue("@description", lbl_desc.Text);
                    cmd.Parameters.AddWithValue("@cost", lbl_cost.Text);
                    cmd.Parameters.AddWithValue("@north", lbl_north.Text);
                    cmd.Parameters.AddWithValue("@east", lbl_east.Text);
                    cmd.Parameters.AddWithValue("@west", lbl_west.Text);
                    cmd.Parameters.AddWithValue("@south", lbl_south.Text);
                    cmd.Parameters.AddWithValue("@IDName", dl_ID.Text);

                    cmd.ExecuteNonQuery();
                    //Response.Write("<script>alert('Successfully!')</script>");
                    lbl_note.ForeColor = Color.Black;
                    lbl_note.Font.Bold = true;
                    lbl_note.Text = "Report Successfully Updated!";
                    gv.DataBind();
                    cmd.Dispose();
                    con.Close();
                }



            }
        }
        

        
    }
}