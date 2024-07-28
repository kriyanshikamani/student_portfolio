using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Boolean check=false;
        SqlCommand checkUser = new SqlCommand("select * from student_register where email=@email AND password=@password",con);
        checkUser.Parameters.AddWithValue("@email",txt_username.Text);
        checkUser.Parameters.AddWithValue("@password",txt_password.Text);
        con.Open();
        SqlDataReader sdr = checkUser.ExecuteReader();
       
        String id = "";
        if (sdr.HasRows)
        {
            while (sdr.Read())
            {
                id = sdr[0].ToString();
            }
            Session["sid"] = id;
            //Label1.Text = Session["sid"].ToString();
            Response.Redirect("~/user/ViewDetails/view_personalDetails.aspx");
        }
        else {
            check = true;
            //error.Text="Please provide valid username & password";
        }
        con.Close();
        if (check == true) {
            SqlCommand checkFaculty = new SqlCommand("SELECT * FROM faculty WHERE email=@email and password=@password",con);
            checkFaculty.Parameters.AddWithValue("@email", txt_username.Text);
            checkFaculty.Parameters.AddWithValue("@password", txt_password.Text);
            con.Open();
            SqlDataReader cf = checkFaculty.ExecuteReader();
            if (cf.HasRows)
            {
                while (cf.Read())
                {
                    id = cf[0].ToString();
                }
                Session["fid"] = id;
                Response.Redirect("faculty/view_facultyDetails.aspx");
            }
            else
                error.Text = "Please provide valid username & password";
            con.Close();
        }
        else
        {
            error.Text="Please provide valid username & password";
        }
        
    }
}