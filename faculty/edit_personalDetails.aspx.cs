using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class faculty_edit_personalDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["fid"] != null)
            {
                int id = Convert.ToInt32(Session["fid"]);

                SqlCommand cmd = new SqlCommand("SELECT * FROM faculty_details WHERE faculty_id = @id", con);
                cmd.Parameters.AddWithValue("@id", id);

                try
                {
                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();

                    if (sdr.Read())
                    {
                        mobileno.Text = sdr["phone"].ToString(); // Assuming "phone" is the column name in the database
                        email.Text = sdr["email"].ToString();
                        bankacc.Text = sdr["bankaccNo"].ToString();
                        bankname.Text = sdr["bankName"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('Faculty details not found.')</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                Response.Write("<script>alert('Session expired.')</script>");
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Session["fid"] != null)
        {
            int id = Convert.ToInt32(Session["fid"]);
            SqlCommand cmd = new SqlCommand("UPDATE faculty_details SET phone = @phone, email = @email, bankaccNo = @bankNo, bankName = @bankNm WHERE faculty_id = @id", con);
            cmd.Parameters.AddWithValue("@phone", mobileno.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@bankNo", bankacc.Text);
            cmd.Parameters.AddWithValue("@bankNm", bankname.Text);
            cmd.Parameters.AddWithValue("@id", id);

            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    Response.Write("<script>alert('Updated.')</script>");
                }
                else
                {
                    Response.Write("<script>alert('No rows updated.')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
            }
            finally
            {
                con.Close();
            }
        }
        else
        {
            Response.Write("<script>alert('Session expired.')</script>");
        }
    }
 
}


