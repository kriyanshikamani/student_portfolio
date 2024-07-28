using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class faculty_view_facultyDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(Session["fid"].ToString());
            SqlCommand cmd = new SqlCommand("select * from faculty_details where faculty_id=" + id, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            int getDeptId = 0;
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    getDeptId = Convert.ToInt32(sdr[2].ToString());
                    lblFacultyName.Text = sdr[3].ToString();
                    lbladdress.Text = sdr[10].ToString();
                    lblgender.Text = sdr[4].ToString();
                    lblbloodgroup.Text = sdr[11].ToString();
                    lbldob.Text = sdr[7].ToString();
                    lblmobileno.Text = sdr[9].ToString();
                    lblemail.Text = sdr[8].ToString();
                    lblDesignation.Text = sdr[5].ToString();
                    lbldoj.Text = sdr[6].ToString();
                    lblaadhar.Text = sdr[12].ToString();
                    imgFaculty.ImageUrl = sdr[15].ToString();
                }
                con.Close();
            }
            else
            {
                Response.Write("<script>alert('Please Refresh Your Page.')</script>");
            }

            SqlCommand getDept = new SqlCommand("select * from department where dept_id=" + getDeptId, con);
            con.Open();
            SqlDataReader dsdr = getDept.ExecuteReader();
            if (dsdr.HasRows)
            {
                while (dsdr.Read())
                {
                    lbldepartment.Text = dsdr[1].ToString();

                }
                con.Close();
            }
            else
            {
                Response.Write("<script>alert('Please Refresh Your Page.')</script>");
            }
        }
        catch(Exception ex){
            Response.Write("<script>alert('Please Login first!!!')</script>");
        }
        
    }
    protected void btnEditPersonalDetails_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/faculty/edit_personalDetails.aspx");
    }
  
}