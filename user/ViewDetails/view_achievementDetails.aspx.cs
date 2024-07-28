﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class user_ViewDetails_view_achievementDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session["sid"].ToString());

        SqlCommand cmd = new SqlCommand("select activityName,description,date,rank,certificate from achievement_details where student_id=" + id, con);

        con.Open();
        projectRepeater.DataSource = cmd.ExecuteReader();
        projectRepeater.DataBind();
        con.Close();

    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        Button btnDownload = (Button)sender;
        RepeaterItem item = (RepeaterItem)btnDownload.NamingContainer;
        string certificateUrl = ((Image)item.FindControl("imgCertificate")).ImageUrl.ToString();

        string physicalPath = Server.MapPath(certificateUrl);
        string fileName = Path.GetFileName(physicalPath);
        Response.Clear();
        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        try
        {
            Response.TransmitFile(physicalPath);
        }
        catch (Exception ex)
        {
            Response.Write("Error: file not found");
        }
        finally
        {
            Response.End();
        }
    }
}