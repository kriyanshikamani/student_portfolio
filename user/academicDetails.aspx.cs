using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_academicDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       
        String id = Request.QueryString["id"];
        Response.Write(id);

        SqlCommand insertRecord = new SqlCommand("insert into academic_details(student_id, dept_id, semester, division, rollno, entrollment, admissionYear, tenthmarks, twelfthmarks, admissionType) values (@id, @dept, @sem, @div, @roll, @entroll, @ad_year, @tenth, @twelfth, @ad_type)", con);
        insertRecord.Parameters.AddWithValue("@id", id);
        insertRecord.Parameters.AddWithValue("@dept", ddlDepartment.SelectedValue);
        insertRecord.Parameters.AddWithValue("@sem", ddlSemester.SelectedValue);
        insertRecord.Parameters.AddWithValue("@div", txtDivision.Text);
        insertRecord.Parameters.AddWithValue("@roll", txtRollNo.Text);
        insertRecord.Parameters.AddWithValue("@entroll", txtEnrollmentNo.Text);
        insertRecord.Parameters.AddWithValue("@ad_year", txtAdmissionYear.Text);
        insertRecord.Parameters.AddWithValue("@tenth", txt10result.Text);
        insertRecord.Parameters.AddWithValue("@twelfth", txt12result.Text);
        insertRecord.Parameters.AddWithValue("@ad_type", txt_admission_type.Text);

               

                con.Open();
                int result = insertRecord.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    Response.Redirect("~/login.aspx");
                }

            }
        
    
}