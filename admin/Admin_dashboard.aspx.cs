using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class admin_Admin_dashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DisplayTotalRegisteredStudents(); // Call method to fetch and display total number of registered students
            DisplayTotalFaculty(); // Call method to fetch and display total number of faculty
            DisplayTotalDepartments(); // Call method to fetch and display total number of departments
            //DisplayTotalStudentsPassFail(); // Call method to fetch and display total number of students who passed and failed
            PopulateDepartments();
          
        }
    }

    protected void DisplayTotalRegisteredStudents()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CONN"].ConnectionString;
        string query = "SELECT COUNT(DISTINCT student_id) FROM student_register"; // Replace student_register with your actual table name for student registrations

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            // Execute the query and get the total number of registered students
            int totalRegisteredStudents = (int)command.ExecuteScalar();

            // Display the total number of registered students on the page
            lblTotalRegisteredStudents.Text = "Total Registered Students: " + totalRegisteredStudents.ToString();
            connection.Close();
        }
    }

    protected void DisplayTotalFaculty()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CONN"].ConnectionString;
        string query = "SELECT COUNT(*) FROM faculty"; // Replace faculty with your actual table name for faculty

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            // Execute the query and get the total number of faculty
            int totalFaculty = (int)command.ExecuteScalar();

            // Display the total number of faculty on the page
            lblTotalFaculty.Text = "Total Faculty: " + totalFaculty.ToString();
            connection.Close();
        }
    }

    protected void DisplayTotalDepartments()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CONN"].ConnectionString;
        string query = "SELECT COUNT(*) FROM department";  // Replace faculty with your actual table name for departments

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            // Execute the query and get the total number of departments
            int totalDepartments = (int)command.ExecuteScalar();

            // Display the total number of departments on the page
            lblTotalDepartments.Text = "Total Departments: " + totalDepartments.ToString();
            connection.Close();
        }
    }
//   protected void DisplayTotalStudentsPassFail()
//{
//    string connectionString = ConfigurationManager.ConnectionStrings["CONN"].ConnectionString;
//    string query = @"
//        SELECT 
//            SUM(CASE WHEN internalMarks > 12 AND examMarks > 28 THEN 1 ELSE 0 END) AS Passed,
//            SUM(CASE WHEN internalMarks <= 12 OR examMarks <= 28 THEN 1 ELSE 0 END) AS Failed
//        FROM results";

//    using (SqlConnection connection = new SqlConnection(connectionString))
//    {
//        SqlCommand command = new SqlCommand(query, connection);
//        connection.Open();

//        SqlDataReader reader = command.ExecuteReader();
//        if (reader.Read())
//        {
//            int passedCount = Convert.ToInt32(reader["Passed"]);
//            int failedCount = Convert.ToInt32(reader["Failed"]);

//            lblTotalRegisteredStudentss.Text = "Passed: " + passedCount + ", Failed: " + failedCount;
//        }
//        reader.Close();
//    }
//}

    
    // Method to populate departments dropdown list
    private void PopulateDepartments()
    {
        // You'll need to replace connection string and SQL query with your actual database details
        string connectionString = ConfigurationManager.ConnectionStrings["CONN"].ConnectionString;
        string query = "SELECT dept_id,deptName FROM department";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                ddlDepartments.DataSource = reader;
                ddlDepartments.DataTextField = "deptName";
                ddlDepartments.DataValueField = "dept_id";
                ddlDepartments.DataBind();
                connection.Close();
            }
        }
    }

    // Method to fetch total number of students in a department from the database
    // Method to fetch total number of students in a department from the database
  
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM faculty WHERE dept_id = @dept_id",con);
        cmd.Parameters.AddWithValue("@dept_id",ddlDepartments.SelectedValue);
        
        //string result = null;
        //object value = cmd.ExecuteScalar();
        //if (value != null)
        //{
        //    result = value.ToString();
        //}
        string getValue = Convert.ToString(cmd.ExecuteScalar());
        con.Close();
        lblTotalFacultyInDepartment.Text = getValue;

        con.Open();
        SqlCommand scmd = new SqlCommand("SELECT COUNT(*) FROM academic_details WHERE dept_id = @dept_id", con);
        scmd.Parameters.AddWithValue("@dept_id", ddlDepartments.SelectedValue);

        //string result = null;
        //object value = cmd.ExecuteScalar();
        //if (value != null)
        //{
        //    result = value.ToString();
        //}
        string stud = Convert.ToString(scmd.ExecuteScalar());
        con.Close();
        lblTotalStudentsInDepartment.Text = stud;
    }

}


