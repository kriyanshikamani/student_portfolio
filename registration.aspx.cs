using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class registration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Boolean check = false;
        SqlCommand checkusername = new SqlCommand("select * from student_register where email=@email", con);
        checkusername.Parameters.AddWithValue("@email", txt_email.Text);
        con.Open();
        SqlDataReader sdr = checkusername.ExecuteReader();
        if (sdr.HasRows)
        {
            error.Text = "Please Enter Unique UserName";
        }
        else
        {
            check = true;
        }
        con.Close();
        if (check == true)
        {
            SqlCommand insertRecord = new SqlCommand("insert into student_register( firstName,lastName,email,password ) values (@fname ,@lname,@email ,@password)", con);
            insertRecord.Parameters.AddWithValue("@fname", txt_fname.Text);
            insertRecord.Parameters.AddWithValue("@lname", txt_lname.Text);
            insertRecord.Parameters.AddWithValue("@email", txt_email.Text);
            insertRecord.Parameters.AddWithValue("@password",txt_password.Text);

            con.Open();
            int result = insertRecord.ExecuteNonQuery();
            con.Close();

            if (result == 1)
            {
               
                Response.Redirect("~/user/personalDetails.aspx?email="+txt_email.Text);
            }
        }

    }
}