using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_add_department : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session["admin"].ToString());
        if (id > 0)
        {
            SqlCommand cmd = new SqlCommand("insert into department (deptName) values('" + department.Text + "') ", con);
            con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                Response.Write("<script>alert('new department added!!')</script>");
            }
            else
            {
                Response.Write("<script>alert('try again..!!')</script>");
            }
        }
        else {
            Response.Write("<script>alert('please login first!!')</script>");
        }
    }
}