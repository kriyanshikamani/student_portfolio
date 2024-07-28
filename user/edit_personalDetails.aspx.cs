using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class user_edit_personalDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int fileId = Convert.ToInt32(Request.QueryString["fileId"]);
            int id = Convert.ToInt32(Session["sid"].ToString());
            SqlCommand cmd = new SqlCommand("select * from student_personal_details where student_id=" + id, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    txtAddress.Text = sdr[10].ToString();
                    txtemail.Text = sdr[13].ToString();
                    txtmobileno.Text = sdr[14].ToString();
                }
                con.Close();
            }
            else
            {
                Response.Write("<script>alert('Please Refresh Your Page.')</script>");
            }
        }
    }


    protected void editbtn_Click1(object sender, EventArgs e)
    {

        if (Session["sid"] != null)
        {
            string address = txtAddress.Text;
            string email = txtemail.Text;
            string mobileNumber = txtmobileno.Text;
            int id = Convert.ToInt32(Session["sid"].ToString());

            string query = "UPDATE student_personal_details SET address = @address, email = @email, phone = @mobileNumber WHERE student_id = @id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@mobileNumber", mobileNumber);
            cmd.Parameters.AddWithValue("@id", id);

            try
            {
                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    // Update successful
                    Response.Write("<script>alert('Record updated successfully.')</script>");
                }
                else
                {
                    // Update failed
                    Response.Write("<script>alert('Record update failed.')</script>");
                }
            }
            catch (Exception ex)
            {
                // Handle the exception
                Response.Write("<script>alert('An error occurred: " + ex.Message + "')</script>");
            }
        }




    }
}