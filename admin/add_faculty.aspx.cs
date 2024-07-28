using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_add_faculty : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        email.Attributes.Add("type","email");
        password.Attributes.Add("type","password");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session["admin"].ToString());
        if (id > 0)
        {
            SqlCommand cmd = new SqlCommand("insert into faculty (dept_id,facultyName,email,password) values(@deptId,@nm,@email,@password) ", con);
            cmd.Parameters.AddWithValue("@deptId",dept.SelectedValue);
            cmd.Parameters.AddWithValue("@nm", name.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@password", password.Text);

            con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                Response.Write("<script>alert('new faculty added!!')</script>");
            }
            else
            {
                Response.Write("<script>alert('try again..!!')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('please login first!!')</script>");
        }
    }
}