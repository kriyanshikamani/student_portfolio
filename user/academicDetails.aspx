<%@ Page Language="C#" AutoEventWireup="true" CodeFile="academicDetails.aspx.cs" Inherits="user_academicDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/forms.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   <div class="container">
            <div class="title">
                <h2>Academic Details</h2>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" AssociatedControlID="ddlDepartment" Text="Department" CssClass="label" />
                <asp:DropDownList runat="server" ID="ddlDepartment" CssClass="input-field" 
                    DataSourceID="SqlDataSource1" DataTextField="deptName" DataValueField="dept_id">
                 
                 
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CONN %>" 
                    SelectCommand="SELECT * FROM [department]"></asp:SqlDataSource>
            </div>
          
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" AssociatedControlID="ddlSemester" Text="Semester" CssClass="label" />
                <asp:DropDownList runat="server" ID="ddlSemester" CssClass="input-field">
                 <asp:ListItem Text="--select semester--" Value="--select semester--" />
                      <asp:ListItem Text="--select semester--" Value="--select semester--" />
                <asp:ListItem Text="1" Value="1" />
                <asp:ListItem Text="2" Value="2" />
                   
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" AssociatedControlID="txtDivision" Text="Division" CssClass="label" />
                <asp:TextBox runat="server" ID="txtDivision" CssClass="input-field" />
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" AssociatedControlID="txtRollNo" Text="Roll No" CssClass="label" />
                <asp:TextBox runat="server" ID="txtRollNo" CssClass="input-field" />
            </div>
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" AssociatedControlID="txtEnrollmentNo" Text="Enrollment No" CssClass="label" />
                <asp:TextBox runat="server" ID="txtEnrollmentNo" CssClass="input-field" />
            </div>
            <div class="form-group">
                <asp:Label ID="Label6" runat="server" AssociatedControlID="txtAdmissionYear" Text="Admission Year" CssClass="label" />
                <asp:TextBox runat="server" ID="txtAdmissionYear" CssClass="input-field" />
            </div>
            <div class="form-group">
            <asp:Label ID="Label19" runat="server" AssociatedControlID="txt10result" Text="10th Persentage"
                CssClass="label" />
            <asp:TextBox runat="server" ID="txt10result" CssClass="input-field" />
        </div>
        <div class="form-group">
            <asp:Label ID="Label17" runat="server" AssociatedControlID="txt12result" Text="12th Persentage "
                CssClass="label" />
            <asp:TextBox runat="server" ID="txt12result" CssClass="input-field" />
        </div>
             <div class="form-group">
                <asp:Label ID="Label8" runat="server" AssociatedControlID="txt_admission_type" Text="Admission Type" CssClass="label" />
                 <asp:TextBox ID="txt_admission_type" runat="server" Text="Regular"  CssClass="input-field"
                     EnableTheming="True" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="btn-container">
                <asp:Button runat="server" ID="btnSubmit" Text="Next" CssClass="btn" 
                    onclick="btnSubmit_Click" />
            </div>
        </div>
    </form>
</body>
</html>
