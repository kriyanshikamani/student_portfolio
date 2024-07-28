using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlCommand checkUser = new SqlCommand("select * from admin where email=@email AND password=@password", con);
        checkUser.Parameters.AddWithValue("@email", txt_username.Text);
        checkUser.Parameters.AddWithValue("@password", txt_password.Text);
        con.Open();
        SqlDataReader sdr = checkUser.ExecuteReader();
        String id = "";
        while (sdr.Read())
        {

            id = sdr[0].ToString();

        }
        if (sdr.HasRows)
        {
            Session["admin"] = id;
           // Label1.Text = Session["admin"].ToString();
            Response.Redirect("~/admin/add_department.aspx");
        }
        else
        {

            error.Text = "Please provide valid username & password";
        }
        con.Close();
    }
}