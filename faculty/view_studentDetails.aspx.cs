using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class faculty_view_studentDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //string entrollmentNo = "";
        //int dept_id = 0;
        int student_id = 0;

        SqlCommand academicCmd = new SqlCommand("select * from academic_details where entrollment=@entrollment and dept_id=@dept", con);
        academicCmd.Parameters.AddWithValue("@entrollment", enroll.Text);
        academicCmd.Parameters.AddWithValue("@dept", dept.SelectedValue);

        con.Open();
        SqlDataReader academicSdr = academicCmd.ExecuteReader();
        if (academicSdr.HasRows)
        {
            while (academicSdr.Read())
            {
                //entrollmentNo = academicSdr[6].ToString();
                student_id = Convert.ToInt32(academicSdr[1].ToString());
                lblSem.Text = academicSdr[3].ToString();
                lblEntrollment.Text = academicSdr[6].ToString();
                lblDiv.Text = academicSdr[4].ToString();
                lblAdmissionYear.Text = academicSdr[7].ToString();

            }
            con.Close();
            SqlCommand InfoCmd = new SqlCommand("select fullName,gender,dob,city,address,aadharCardNo,bloodGroup,email,phone,profilePhoto from student_personal_details where student_id=" + student_id, con);
            con.Open();
            SqlDataReader InfoSdr = InfoCmd.ExecuteReader();
            if (InfoSdr.HasRows)
            {
                while (InfoSdr.Read())
                {
                    studName.Text = InfoSdr[0].ToString();
                    lblname.Text = InfoSdr[0].ToString();
                    lblgender.Text = InfoSdr[1].ToString();
                    lbldob.Text = InfoSdr[2].ToString();
                    lblCity.Text = InfoSdr[3].ToString();
                    lbladdress.Text = InfoSdr[4].ToString();
                    lblaadhar.Text = InfoSdr[5].ToString();
                    lblbloodgroup.Text = InfoSdr[6].ToString();
                    lblemail.Text = InfoSdr[7].ToString();
                    lblmobileno.Text = InfoSdr[8].ToString();
                    imgStudent.ImageUrl = InfoSdr[9].ToString();

                }
            }
            divResultSummary.Visible = true;
        }
        else {

            Response.Write("<script>alert('No Data Found!!')</script>");
            divResultSummary.Visible = false;
        }
       

       

        
    }
}