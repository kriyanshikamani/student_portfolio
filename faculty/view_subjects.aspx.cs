using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class faculty_view_subjects : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session["fid"].ToString());

        SqlCommand command = new SqlCommand("SELECT courseCode,SubjectName FROM subjects where faculty_id=@id", con);
        command.Parameters.AddWithValue("@id", id);

        con.Open();
        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read())
        {
            string subjectName = reader["SubjectName"].ToString();
            string courseCode = reader["courseCode"].ToString();

            TableRow row = new TableRow();

            TableCell cellName = new TableCell();
            TableCell cellCode = new TableCell();

            cellName.Text = subjectName;
            cellCode.Text = courseCode;


            row.Cells.Add(cellName);
            row.Cells.Add(cellCode);


            SubjectsTable.Rows.Add(row);
        }
        con.Close();
    }
}




