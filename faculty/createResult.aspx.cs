using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class faculty_createResult : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    int stud_id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        RecreateDynamicallyAddedControls();
    }



    protected void RecreateDynamicallyAddedControls()
    {
        int rowCount = 0;

        // Find out how many rows were previously added
        if (ViewState["RowCount"] != null)
        {
            rowCount = (int)ViewState["RowCount"];
        }

        // Recreate the dynamically added controls
        for (int i = 0; i < rowCount; i++)
        {
            AddNewRow();
        }
    }

    protected void AddNewRow()
    {

        TableRow newRow = new TableRow();

        // Add cells to the new row
        for (int i = 0; i < 2; i++)
        {

            TableCell cell = new TableCell();
            TextBox textBox = new TextBox();
            textBox.ID = "TextBox" + subjectTable.Rows.Count + "_" + i; // Unique ID for each textbox
            cell.Controls.Add(textBox);
            newRow.Cells.Add(cell);


        }


        // Add the new row to the table
        subjectTable.Rows.Add(newRow);
    }


    protected void AddRowButton_Click(object sender, EventArgs e)
    {
        // Query the database to get the count of available subjects for the selected semester
        int rowCount = GetSubjectCountForSemester(rbl_sem.SelectedValue);

        // Call the method to add rows dynamically based on the count obtained
        for (int i = 0; i < rowCount; i++)
        {
            AddNewRow();
        }

        // Save the row count in ViewState
        ViewState["RowCount"] = rowCount;

        // Disable the Add Row button if the maximum number of rows is reached
        if (subjectTable.Rows.Count >= rowCount)
        {
            AddRowButton.Enabled = false;
        }
    }

    // Method to get the count of available subjects for the selected semester
    protected int GetSubjectCountForSemester(string semester)
    {
        int subjectCount = 0;
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM subjects WHERE semester = @sem", con);
        cmd.Parameters.AddWithValue("@sem", semester);
        subjectCount = (int)cmd.ExecuteScalar();

        return subjectCount;
        con.Close();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter("select subjectName from subjects where semester=@sem and dept_id=@dept_id", con);
        sda.SelectCommand.Parameters.AddWithValue("@sem", rbl_sem.SelectedValue);
        sda.SelectCommand.Parameters.AddWithValue("@dept_id", rbl_department.SelectedValue);
        DataTable dt = new DataTable();

        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd = new SqlCommand("select subject_id,subjectName from subjects where semester=@sem and dept_id=@dept_id", con);
        cmd.Parameters.AddWithValue("@sem", rbl_sem.SelectedValue);
        cmd.Parameters.AddWithValue("@dept_id", rbl_department.SelectedValue);
        SqlDataReader sdr = cmd.ExecuteReader();
        string str = "";
        if (sdr.HasRows)
        {
            while (sdr.Read())
            {
                str += sdr[0].ToString();
                str += sdr[1].ToString();
            }
        }
        Label1.Text = str;
        con.Close();

        con.Open();
        SqlCommand studIdcmd = new SqlCommand("select student_id from academic_details where entrollment=@entrollment", con);
        studIdcmd.Parameters.AddWithValue("@entrollment", txtEntrollment.Text);

        SqlDataReader studIdsdr = studIdcmd.ExecuteReader();

        if (studIdsdr.HasRows)
        {
            while (studIdsdr.Read())
            {
                stud_id = Convert.ToInt32(studIdsdr[0].ToString());
            }
        }
        Session["stud_id"] = stud_id;
        con.Close();

    }

    protected void btnInsertData_Click(object sender, EventArgs e)
    {
        int totalSubjectMarks = 0;
        int internalMarks, examMarks;
        int stud_id = Convert.ToInt32(Session["stud_id"]);
        int res = 0;
        for (int i = 0; i < subjectTable.Rows.Count; i++)
        {
            TableRow row = subjectTable.Rows[i];

            // Retrieve values from TextBox controls within the row
            internalMarks = Convert.ToInt32(((TextBox)row.Cells[0].Controls[0]).Text);
            examMarks = Convert.ToInt32(((TextBox)row.Cells[1].Controls[0]).Text);
            totalSubjectMarks = internalMarks + examMarks;
            string subjectName = GridView1.Rows[i].Cells[0].Text;



            SqlCommand cmdInsert = new SqlCommand("INSERT INTO results(student_id,subjectName,entrollmentNo,internalMarks,examMarks,totalMarks) VALUES ( @student_id,@subjectNm,@entrollment, @internalMarks, @examMarks,@totalMarks)", con);

            cmdInsert.Parameters.AddWithValue("@student_id", stud_id);
            cmdInsert.Parameters.AddWithValue("@subjectNm", subjectName);
            cmdInsert.Parameters.AddWithValue("@entrollment", txtEntrollment.Text);
            cmdInsert.Parameters.AddWithValue("@internalMarks", internalMarks);
            cmdInsert.Parameters.AddWithValue("@examMarks", examMarks);
            cmdInsert.Parameters.AddWithValue("@totalMarks", totalSubjectMarks);

            con.Open();
            res = cmdInsert.ExecuteNonQuery();
            con.Close();

        }
        if (res > 0)
        {
            Response.Write("<script>alert('Result created')</script>");
        }
        else
        {
            Response.Write("<script>alert('Try again!!')</script>");
        }




    }

    protected void rbl_department_SelectedIndexChanged(object sender, EventArgs e)
    {
        subjectTable.Rows.Clear();

        // Reset the row count in ViewState
        ViewState["RowCount"] = 0;
        AddRowButton.Enabled = true;
    }
    protected void rbl_sem_SelectedIndexChanged(object sender, EventArgs e)
    {
        subjectTable.Rows.Clear();

        // Reset the row count in ViewState
        ViewState["RowCount"] = 0;
        AddRowButton.Enabled = true;
    }
}