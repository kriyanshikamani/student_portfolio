using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_add_subjects : System.Web.UI.Page
{
    SqlConnection con=new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        // Ensure that dynamically added controls are recreated on postback
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
        for (int i = 0; i < 3; i++)
        {
            if (i==2) // When i == 3, add a dropdown list
            {
                TableCell dropdownCell = new TableCell();
                DropDownList dropdownList = new DropDownList();
                dropdownList.ID = "DropDownList" + subjectTable.Rows.Count;

                // Fetch data from the database and bind to the dropdown list
                // Fetch data from the database and bind to the dropdown list
                DataTable facultyData = GetFacultyData();
                dropdownList.DataSource = facultyData;
                dropdownList.DataTextField = "facultyName"; // Assuming "faculty_id" is the field name in the Faculty table
                dropdownList.DataValueField = "faculty_id"; // Assuming "faculty_id" is the field name in the Faculty table
                dropdownList.DataBind();

                dropdownCell.Controls.Add(dropdownList);
                newRow.Cells.Add(dropdownCell);
            }
            else
            {
                TableCell cell = new TableCell();
                TextBox textBox = new TextBox();
                textBox.ID = "TextBox" + subjectTable.Rows.Count + "_" + i; // Unique ID for each textbox
                cell.Controls.Add(textBox);
                newRow.Cells.Add(cell);
            }
           
        }
       
        // Add a cell for the delete button
        TableCell deleteCell = new TableCell();
        Button deleteButton = new Button();
        deleteButton.Text = "Delete";
        deleteButton.Click += new EventHandler(DeleteButton_Click);
        deleteCell.Controls.Add(deleteButton);
        newRow.Cells.Add(deleteCell);

        // Add the new row to the table
        subjectTable.Rows.Add(newRow);
    }

    protected void AddRowButton_Click(object sender, EventArgs e)
    {
        // Call the method to add a new row with a textbox
        AddNewRow();

        // Increment the row count and save it in ViewState
        int rowCount = subjectTable.Rows.Count;
        ViewState["RowCount"] = rowCount;
    }
    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        Button deleteButton = (Button)sender;
        TableRow row = (TableRow)deleteButton.Parent.Parent; // Get the parent row of the delete button
        subjectTable.Rows.Remove(row); // Remove the row from the table

        // Decrement the row count and save it in ViewState
        int rowCount = subjectTable.Rows.Count;
        ViewState["RowCount"] = rowCount;
    }

    protected void btnInsertData_Click(object sender, EventArgs e)
    {
         //Get department ID
            int departmentId;
            SqlCommand cmdDeptId = new SqlCommand("SELECT dept_id FROM department WHERE deptName = @Department", con);

                cmdDeptId.Parameters.AddWithValue("@Department", ddlDepartment.SelectedValue);
                con.Open();
                departmentId = (int)cmdDeptId.ExecuteScalar();
                con.Close();

                int res = 0;
        for (int i = 0; i < subjectTable.Rows.Count; i++) 
        {
            TableRow row = subjectTable.Rows[i];

            // Retrieve values from TextBox controls within the row
            string courseCode = ((TextBox)row.Cells[0].Controls[0]).Text;
            string subjectName = ((TextBox)row.Cells[1].Controls[0]).Text;
            string facultyName = ((DropDownList)row.Cells[2].Controls[0]).SelectedValue;

           

            string insertQuery = "INSERT INTO subjects (faculty_id, dept_id,courseCode,subjectName, semester) VALUES (@FacultyId, @DeptId,@courseCode, @SubjectName, @Semester)";
            SqlCommand cmdInsert = new SqlCommand(insertQuery, con);

            cmdInsert.Parameters.AddWithValue("@FacultyId", facultyName);
            cmdInsert.Parameters.AddWithValue("@DeptId", departmentId);
            cmdInsert.Parameters.AddWithValue("@courseCode", courseCode);
            cmdInsert.Parameters.AddWithValue("@SubjectName", subjectName);
            cmdInsert.Parameters.AddWithValue("@Semester", ddlSemester.SelectedValue);
            
            con.Open();
            res = cmdInsert.ExecuteNonQuery();
             con.Close();
        }

        if (res > 0)
        {
            Response.Write("<script>alert('Subjects added')</script>");
        }
        else
        {
            Response.Write("<script>alert('Try again!!')</script>");
        }
    }
    protected DataTable GetFacultyData()
    {

        string query = "SELECT * FROM faculty";
     
        SqlCommand command = new SqlCommand(query, con);
           
                con.Open();
                DataTable dataTable = new DataTable();
                SqlDataReader reader = command.ExecuteReader();
                
                dataTable.Load(reader);
                con.Close();
                
                return dataTable;
            
        
}
    protected void btnNewDepartment_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/add_department.aspx");
    }
}