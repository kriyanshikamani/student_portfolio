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


public partial class user_personalDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        dob.Attributes.Add("type", "date");
        String email = Request.QueryString["email"];
        txtEmail.Text = email;
        txtEmail.ReadOnly = true;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        String email = Request.QueryString["email"];
        if (profilePhoto.HasFile)
        {
            string fileExt = Path.GetExtension(profilePhoto.FileName);
            if (fileExt == ".jpg" || fileExt == ".jpeg" || fileExt == ".png")
            {
                profilePhoto.SaveAs(Server.MapPath("~/student_profile_photo/") + Path.GetFileName(profilePhoto.FileName));
                string image = "~/student_profile_photo/" + Path.GetFileName(profilePhoto.FileName);

                SqlCommand checkUser = new SqlCommand("select * from student_register where email=@email", con);
                checkUser.Parameters.AddWithValue("@email",email);
                con.Open();
                SqlDataReader sdr = checkUser.ExecuteReader();
                String id = "";
                while (sdr.Read())
                {
                    id = sdr[0].ToString();
                }
                con.Close();
                SqlCommand insertRecord = new SqlCommand("insert into student_personal_details( student_id,fullName,fatherName,motherName,gender,dob,state,city,pincode,address,aadharCardNo,bloodGroup,email,phone,profilePhoto ) values (@id,@fullnm ,@fathername,@mothername,@gender,@dob,@state,@city,@pincode,@address,@aadharno,@bloodgrp,@email,@phone,@profilePhoto)", con);
                insertRecord.Parameters.AddWithValue("@id",id);
                insertRecord.Parameters.AddWithValue("@fullnm", fullname.Text);
                insertRecord.Parameters.AddWithValue("@fathername", fathername.Text);
                insertRecord.Parameters.AddWithValue("@mothername", mothername.Text);
                insertRecord.Parameters.AddWithValue("@gender", gender.SelectedValue);
                insertRecord.Parameters.AddWithValue("@dob", dob.Text);
                insertRecord.Parameters.AddWithValue("@state", state.Text);
                insertRecord.Parameters.AddWithValue("@city", city.Text);
                insertRecord.Parameters.AddWithValue("@pincode", pincode.Text);
                insertRecord.Parameters.AddWithValue("@address", txtAddress.Text);
                insertRecord.Parameters.AddWithValue("@aadharno", aadharcardno.Text);
                insertRecord.Parameters.AddWithValue("@bloodgrp", bloodgroup.SelectedValue);
                insertRecord.Parameters.AddWithValue("@email",email);
                insertRecord.Parameters.AddWithValue("@phone", mobileno.Text);
                insertRecord.Parameters.AddWithValue("@profilePhoto", image);

                con.Open();
                int result = insertRecord.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    Response.Redirect("~/user/academicDetails.aspx?id="+id);
                }

            }
        }
    }
}