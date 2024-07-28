using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_ViewDetails_view_personalDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
       
        int id = Convert.ToInt32(Session["sid"].ToString());
        SqlCommand cmd = new SqlCommand("select * from student_personal_details where student_id="+id,con);
        con.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.HasRows)
        {
            while (sdr.Read())
            {
                lblFullName.Text = sdr[2].ToString();
                lblGender.Text = sdr[5].ToString();
                lblDateOfBirth.Text = ((DateTime)sdr[6]).ToShortDateString();

                lblAdharcard.Text = sdr[11].ToString();
                lblBloodGroup.Text = sdr[12].ToString();
                lblEmail.Text = sdr[13].ToString();
                lblMobileNo.Text = sdr[14].ToString();
                lblCity.Text = sdr[8].ToString();
                imgUser.ImageUrl = sdr[15].ToString();
            }
            con.Close();
        }
        else {
            Response.Write("<script>alert('Please Refresh Your Page.')</script>");
        }
        
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        // Redirect to edit_personalDetails.aspx page
        Response.Redirect("~/user/edit_personalDetails.aspx");
    }
}