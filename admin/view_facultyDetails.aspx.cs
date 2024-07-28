using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class admin_view_facultyDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        divResultSummary.Visible = false; // Hide the result summary initially


        int faculty_id = 0;

        SqlCommand facCmd = new SqlCommand("SELECT faculty_id FROM faculty_details WHERE dept_id=@dept AND email=@email", con);
        facCmd.Parameters.AddWithValue("@dept", dept.SelectedValue);
        facCmd.Parameters.AddWithValue("@email", facultyemail.SelectedValue);
        con.Open();
        int deptid = 0;

        SqlDataReader academicSdr = facCmd.ExecuteReader();
        if (academicSdr.HasRows)
        {
            while (academicSdr.Read())
            {
                //entrollmentNo = academicSdr[6].ToString();
                faculty_id = Convert.ToInt32(academicSdr[0].ToString());

            }
            con.Close();
            SqlCommand infoCmd = new SqlCommand("SELECT fullName, gender, designation, dateOfJoin, dob, address, bloodgroup, aadharCard, phone,email,dept_id,profilePhoto FROM faculty_details WHERE faculty_id=@faculty_id", con);
            infoCmd.Parameters.AddWithValue("@faculty_id", faculty_id);
            con.Open();
            SqlDataReader InfoSdr = infoCmd.ExecuteReader();

            if (InfoSdr.HasRows)
            {
                while (InfoSdr.Read())
                {
                    lblname.Text = InfoSdr["fullName"].ToString();
                    lblgender.Text = InfoSdr["gender"].ToString();
                    lblDesignation.Text = InfoSdr["designation"].ToString();
                    lbldoj.Text = InfoSdr["dateOfJoin"].ToString();
                    lbldob.Text = InfoSdr["dob"].ToString();
                    lbladdress.Text = InfoSdr["address"].ToString();
                    lblbloodgroup.Text = InfoSdr["bloodgroup"].ToString();
                    lblaadhar.Text = InfoSdr["aadharCard"].ToString();
                    lblmobileno.Text = InfoSdr["phone"].ToString();
                    lblemail.Text = InfoSdr["email"].ToString();
                    imgFaculty.ImageUrl = InfoSdr["profilePhoto"].ToString();
                    deptid = Convert.ToInt32(InfoSdr["dept_id"].ToString());

                }
            }

            divResultSummary.Visible = true;
            con.Close();
        }
        else
        {

            Response.Write("<script>alert('No Data Found!!')</script>");
            divResultSummary.Visible = false;
        }
        //con.Open();
        //SqlCommand deptCmd = new SqlCommand("select from deptName where dept_id=@dept_id");
        //deptCmd.Parameters.AddWithValue("@dept_id", deptid);

        ////SqlDataReader deptsdr = deptCmd.ExecuteReader();
        //SqlDataReader deptsdr = deptCmd.ExecuteReader();

        //if (deptsdr.HasRows)
        //{
        //    while (deptsdr.Read())
        //    {
        //        lbldepartment.Text = deptsdr["deptName"].ToString();


        //    }
        //}
        //con.Close();
        con.Open();
        SqlCommand deptCmd = new SqlCommand("SELECT deptName FROM department where dept_id = @dept_id", con); // Corrected SQL query
        deptCmd.Parameters.AddWithValue("@dept_id", deptid);

        SqlDataReader deptsdr = deptCmd.ExecuteReader();

        if (deptsdr.HasRows)
        {
            while (deptsdr.Read())
            {
                lbldepartment.Text = deptsdr["deptName"].ToString();
            }
        }

        deptsdr.Close(); // Close the SqlDataReader
        con.Close();

    }
}