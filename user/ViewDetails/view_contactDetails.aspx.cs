using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_ViewDetails_view_contactDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session["sid"].ToString());
        SqlCommand cmd = new SqlCommand("select * from student_personal_details where student_id=" + id, con);
        con.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.HasRows)
        {
            while (sdr.Read())
            {
                lblPin.Text = sdr[9].ToString();
                lblAddress.Text = sdr[10].ToString();
                lblState.Text = sdr[7].ToString();   
                lblEmail.Text = sdr[13].ToString();
                lblPhone.Text = sdr[14].ToString();
                lblCity.Text = sdr[8].ToString();
            }
            con.Close();
        }
        else
        {
            Response.Write("<script>alert('Please Refresh Your Page.')</script>");
        }
    }
}