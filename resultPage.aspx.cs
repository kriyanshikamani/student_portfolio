using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class resultPage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    List<string> numbers = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Call LoadSubjects only when the page is first loaded, not during postbacks

        }
    }

    protected void LoadSubjects()
    {

        string semester = semster.SelectedValue;
        string dept_id = cource.SelectedValue;


        string query = "SELECT [subjectName] FROM [subjects] WHERE [semester] = @SelectedSemester and [dept_id]=@dept_id";

        SqlCommand command = new SqlCommand(query, con);
        command.Parameters.AddWithValue("@SelectedSemester", semester);
        command.Parameters.AddWithValue("@dept_id", dept_id);


        con.Open();
        SqlDataReader reader = command.ExecuteReader();

        TableRow headerRow = new TableRow();

        // Add Subject heading
        TableCell cellSubjectHeading = new TableCell();
        cellSubjectHeading.Text = "Subject";
        headerRow.Cells.Add(cellSubjectHeading);

        // Add Internal Marks heading
        TableCell cellInternalMarksHeading = new TableCell();
        cellInternalMarksHeading.Text = "Internal Marks";
        headerRow.Cells.Add(cellInternalMarksHeading);

        // Add Exam Marks heading
        TableCell cellExamMarksHeading = new TableCell();
        cellExamMarksHeading.Text = "Exam Marks";
        headerRow.Cells.Add(cellExamMarksHeading);

        // Add the header row to the table
        tableSubjects.Rows.Add(headerRow);
        int i = 1;
        while (reader.Read())
        {
            string subjectName = reader["subjectName"].ToString();

            // Create a new row for the subject table
            TableRow row = new TableRow();

            // Create a cell for the subject name
            TableCell cellSubject = new TableCell();
            cellSubject.Text = subjectName;

            // Add the subject cell to the row
            row.Cells.Add(cellSubject);

            // Create a cell for internal marks textbox
            TableCell internalMarksCell = new TableCell();
            TextBox txtInternalMarks = new TextBox();
            string id = "txtInternalMarks_" + i;
            txtInternalMarks.ID = id; // Unique ID for each textbox
            internalMarksCell.Controls.Add(txtInternalMarks);
            string val = txtInternalMarks.Text;
            numbers.Add(val);

            // Add the internal marks cell to the row
            row.Cells.Add(internalMarksCell);

            // Create a cell for exam marks textbox
            TableCell examMarksCell = new TableCell();
            TextBox txtExamMarks = new TextBox();
            txtExamMarks.ID = "txtExamMarks_" + i; // Unique ID for each textbox
            examMarksCell.Controls.Add(txtExamMarks);

            // Add the exam marks cell to the row
            row.Cells.Add(examMarksCell);

            // Add the row to the subject table
            tableSubjects.Rows.Add(row);
            i++;
        }


        reader.Close();
        con.Close();
    }

    protected void semster_SelectedIndexChanged(object sender, EventArgs e)
    {

        LoadSubjects();
    }

    protected void cource_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadSubjects();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        foreach (var array in numbers)
        {


            //foreach (var item in array)
            //{

            Response.Write(array);
            //}
        }

    }
}