using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_ViewDetails_view_academicDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Convert.ToInt32(Session["sid"].ToString());

        SqlCommand cmd = new SqlCommand("select * from student_personal_details where student_id=" + id, con);
        con.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.HasRows)
        {
            while (sdr.Read())
            {
                lblFullName.Text = sdr[2].ToString();
                lblEmail.Text = sdr[13].ToString();
                lblPhone.Text = sdr[14].ToString();

            }
            con.Close();
        }
        else
        {
            Response.Write("<script>alert('Please Refresh Your Page.')</script>");
        }
       

        SqlCommand academics = new SqlCommand("select * from academic_details where student_id=" + id, con);
        con.Open();
        SqlDataReader academicsdr = academics.ExecuteReader();
        int dept_id=0;
        if (academicsdr.HasRows)
        {
            while (academicsdr.Read())
            {
                dept_id = Convert.ToInt32(academicsdr[2].ToString());
                lblSem.Text = academicsdr[3].ToString();
                lblDivision.Text = academicsdr[4].ToString();
                lblRno.Text = academicsdr[5].ToString();
                lblEntrollment.Text = academicsdr[6].ToString();
                lblAdYear.Text = academicsdr[7].ToString();
                lblAdType.Text = academicsdr[8].ToString();
                lbl10per.Text = academicsdr[9].ToString()+"%";
                lbl12per.Text = academicsdr[10].ToString()+"%";
    
            }
            con.Close();
        }
        else
        {
            Response.Write("<script>alert('Please Refresh Your Page.')</script>");
        }

        SqlCommand dept = new SqlCommand("select * from department where dept_id=" + dept_id, con);
        con.Open();
        SqlDataReader dept_sdr = dept.ExecuteReader();
        if (dept_sdr.HasRows) {
            while (dept_sdr.Read())
            {
                lblDepartment.Text = dept_sdr[1].ToString();
            }
        }
        con.Close();
        
    }
}