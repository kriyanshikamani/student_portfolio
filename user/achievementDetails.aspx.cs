using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class user_achievementDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        date.Attributes.Add("type", "date");

        int id = Convert.ToInt32(Session["sid"].ToString());
        if (certificate.HasFile)
        {
            string fileExt = Path.GetExtension(certificate.FileName);
            if (fileExt == ".jpg" || fileExt == ".jpeg" || fileExt == ".png")
            {
                certificate.SaveAs(Server.MapPath("~/certificates/") + Path.GetFileName(certificate.FileName));
                string image = "~/certificates/" + Path.GetFileName(certificate.FileName);


                SqlCommand insertRecord = new SqlCommand("insert into achievement_details( student_id,activityName,date,rank,description,certificate ) values (@id,@nm ,@date,@rank,@desc,@certificate)", con);
                insertRecord.Parameters.AddWithValue("@id", id);
                insertRecord.Parameters.AddWithValue("@nm", txtActivity.Text);
                insertRecord.Parameters.AddWithValue("@date", date.Text);
                insertRecord.Parameters.AddWithValue("@rank", txtRank.Text);
                insertRecord.Parameters.AddWithValue("@desc", txtDescription.Text);
                insertRecord.Parameters.AddWithValue("@certificate", image);

                con.Open();
                int result = insertRecord.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    Response.Write("<script>alert('achievement added!!')</script>");
                }

            }
            else {
                Response.Write("<script>alert('Please upload image of cerificate!!!')</script>");
            }
        }
    }
}