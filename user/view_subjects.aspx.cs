using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class user_view_subjects : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Call a method to populate the subjects table
            PopulateSubjectsTable();
        }
    }
    private void PopulateSubjectsTable()
    {
        int id = Convert.ToInt32(Session["sid"].ToString());

        SqlCommand academics = new SqlCommand("select dept_id,semester from academic_details where student_id=" + id, con);
        con.Open();
        SqlDataReader academicsdr = academics.ExecuteReader();
        int dept_id = 0, sem = 0;
        if (academicsdr.HasRows)
        {
            while (academicsdr.Read())
            {
                dept_id = Convert.ToInt32(academicsdr[0].ToString());
                sem = Convert.ToInt32(academicsdr[1].ToString());
            }
            con.Close();
        }
        else
        {
            Response.Write("<script>alert('Please Refresh Your Page.')</script>");

        }
        SqlCommand command = new SqlCommand("SELECT courseCode,SubjectName FROM subjects where dept_id=@did and semester=@sem", con);
        command.Parameters.AddWithValue("@did", dept_id);
        command.Parameters.AddWithValue("@sem", sem);

        con.Open();
        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read())
        {
            string subjectName = reader["SubjectName"].ToString();
            string credits = reader["courseCode"].ToString();

            TableRow row = new TableRow();
            TableCell cellName = new TableCell();
            TableCell cellCode = new TableCell();

            cellName.Text = subjectName;
            cellCode.Text = credits;

  
            row.Cells.Add(cellName);
            row.Cells.Add(cellCode);

            SubjectsTable.Rows.Add(row);
        }
    }
}