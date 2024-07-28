using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class user_internshipDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        txtStartDate.Attributes.Add("type", "date");
        txtEndDate.Attributes.Add("type", "date");

        int id = Convert.ToInt32(Session["sid"].ToString());
        if (certificate.HasFile)
        {
            string fileExt = Path.GetExtension(certificate.FileName);
            if (fileExt == ".jpg" || fileExt == ".jpeg" || fileExt == ".png")
            {
                certificate.SaveAs(Server.MapPath("~/certificates/") + certificate.FileName);
                string image = "~/certificates/" + certificate.FileName;


                SqlCommand insertRecord = new SqlCommand("insert into internship_details( student_id,companyName,position,startDate,endDate,certificate,description ) values (@id,@companynm ,@position,@start,@end,@certificate,@desc)", con);
                insertRecord.Parameters.AddWithValue("@id", id);
                insertRecord.Parameters.AddWithValue("@companynm", txtCompanyName.Text);
                insertRecord.Parameters.AddWithValue("@position", txtPosition.Text);
                insertRecord.Parameters.AddWithValue("@start", txtStartDate.Text);
                insertRecord.Parameters.AddWithValue("@end", txtEndDate.Text);
                insertRecord.Parameters.AddWithValue("@certificate", image);
                insertRecord.Parameters.AddWithValue("@desc", txtDescription.Text);
             
                con.Open();
                int result = insertRecord.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    Response.Write("<script>alert('internship detail added!!')</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Please upload image of cerificate!!!')</script>");
            }
        }
    }
}