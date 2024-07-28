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

public partial class faculty_add_facultyDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        dob.Attributes.Add("type", "date");
        dojoining.Attributes.Add("type", "date");
        email.Attributes.Add("type", "email");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session["fid"].ToString());
        if (profilePhoto.HasFile)
        {
            string fileExt = Path.GetExtension(profilePhoto.FileName);
            if (fileExt == ".jpg" || fileExt == ".jpeg" || fileExt == ".png")
            {
                profilePhoto.SaveAs(Server.MapPath("~/faculty/Photos/") + Path.GetFileName(profilePhoto.FileName));
                string image = "~/faculty/Photos/" + Path.GetFileName(profilePhoto.FileName);

                SqlCommand insertRecord = new SqlCommand("insert into faculty_details(faculty_id,dept_id,fullName,gender,designation,dateOfJoin,dob,email,phone,address,bloodGroup,aadharCard,bankaccNo,bankName,profilePhoto ) values (@id,@did,@fullnm ,@gender,@designation,@doj,@dob,@email,@phone,@address,@bloodgrp,@aadharno,@bankNo,@bankNm,@profilePhoto)", con);
                insertRecord.Parameters.AddWithValue("@id", id);
                insertRecord.Parameters.AddWithValue("@did", dept.SelectedValue);
                insertRecord.Parameters.AddWithValue("@fullnm", fullname.Text);
                insertRecord.Parameters.AddWithValue("@gender", gender.SelectedValue);
                insertRecord.Parameters.AddWithValue("@designation", designation.Text);
                insertRecord.Parameters.AddWithValue("@doj", dojoining.Text);
                insertRecord.Parameters.AddWithValue("@dob", dob.Text);
                insertRecord.Parameters.AddWithValue("@email", email.Text);
                insertRecord.Parameters.AddWithValue("@phone", mobileno.Text);
                insertRecord.Parameters.AddWithValue("@address", address.Text);
                insertRecord.Parameters.AddWithValue("@bloodgrp", bloodgroup.SelectedValue);
                insertRecord.Parameters.AddWithValue("@aadharno", aadharcardno.Text);
                insertRecord.Parameters.AddWithValue("@bankNo", bankacc.Text);
                 insertRecord.Parameters.AddWithValue("@bankNm", bankname.Text);
                insertRecord.Parameters.AddWithValue("@profilePhoto", image);

                con.Open();
                int result = insertRecord.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    Response.Write("<script>alert('Data added successfully')</script>");
                }
                else {
                    Response.Write("<script>alert('Data not added!!')</script>");
                }

            }
        }
    }
}