using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_student_result : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session["sid"].ToString());

        SqlCommand cmd = new SqlCommand("select fullName,profilePhoto from student_personal_details where student_id=" + id, con);
        con.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.HasRows)
        {
            while (sdr.Read())
            {
                lbl_fullName.Text = sdr[0].ToString();
             
                imgUser.ImageUrl = sdr[1].ToString();
            }
            con.Close();
        }
        else
        {
            Response.Write("<script>alert('Please Refresh Your Page.')</script>");
        }


        SqlCommand academics = new SqlCommand("select semester,entrollment,dept_id from academic_details where student_id=" + id, con);
        con.Open();
        SqlDataReader academicsdr = academics.ExecuteReader();
        int dept_id = 0;
        if (academicsdr.HasRows)
        {
            while (academicsdr.Read())
            {
                lbl_semester.Text = academicsdr[0].ToString();
                lbl_entrollment.Text = academicsdr[1].ToString();
                dept_id = Convert.ToInt32(academicsdr[2].ToString());
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
        if (dept_sdr.HasRows)
        {
            while (dept_sdr.Read())
            {
                lbl_program.Text = dept_sdr[1].ToString();
            }
        }
        con.Close();


        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter("select subjectName,internalMarks,examMarks,totalMarks from results where student_id=" + id, con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        con.Close();

        int totalObtainedMarks = 0;
        int totalPossibleMarks = dt.Rows.Count * 100; 

        foreach (DataRow row in dt.Rows)
        {
            totalObtainedMarks += Convert.ToInt32(row["internalMarks"]) + Convert.ToInt32(row["examMarks"]);
        }
        lblTotalMarks.Text = totalObtainedMarks + "/" + totalPossibleMarks;
        double percentage = (totalObtainedMarks / (double)totalPossibleMarks) * 100;
        lblPercentage.Text = percentage.ToString("0.00") + "%";
        double sgpa = CalculateSGPA(totalObtainedMarks); 
        lblSGPA.Text = sgpa.ToString("0.00");

        con.Close();
    }

    private double CalculateSGPA(int totalMarks)
    {
        return totalMarks / 100.0; 
    }

}