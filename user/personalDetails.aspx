<%@ Page Language="C#" AutoEventWireup="true" CodeFile="personalDetails.aspx.cs" Inherits="user_personalDetails" %>

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
            <h2> Student Information Form</h2>
        </div>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" AssociatedControlID="fullname" Text="Full Name"
                CssClass="label" />
            <asp:TextBox runat="server" ID="fullname" CssClass="input-field" />
        </div>
        <div class="form-group">
            <asp:Label ID="Label7" runat="server" AssociatedControlID="fathername" Text="Father's Name"
                CssClass="label" />
            <asp:TextBox runat="server" ID="fathername" CssClass="input-field" />
        </div>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" AssociatedControlID="mothername" Text="Mother's Name"
                CssClass="label" />
            <asp:TextBox runat="server" ID="mothername" CssClass="input-field" />
        </div>
        <div class="form-group">
            <asp:Label ID="Label3" runat="server" AssociatedControlID="gender" Text="Gender"
                CssClass="label" />
            <asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem>Other</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="form-group">
            <asp:Label ID="Label4" runat="server" AssociatedControlID="dob" Text="Date Of Birth"
                CssClass="label" />
            <asp:TextBox runat="server" ID="dob" CssClass="input-field" />
        </div>
         <div class="form-group">
            <asp:Label ID="Label13" runat="server" AssociatedControlID="state" Text="State"
                CssClass="label" />
            <asp:TextBox runat="server" ID="state" CssClass="input-field" />
        </div>
        <div class="form-group">
            <asp:Label ID="Label12" runat="server" AssociatedControlID="city" Text="City"
                CssClass="label" />
            <asp:TextBox runat="server" ID="city" CssClass="input-field" />
        </div>
        <div class="form-group">
            <asp:Label ID="Label14" runat="server" AssociatedControlID="pincode" Text="Pincode"
                CssClass="label" />
            <asp:TextBox runat="server" ID="pincode" CssClass="input-field" />
        </div>
         <div class="form-group">
                <asp:Label ID="Label11" runat="server" AssociatedControlID="txtAddress" Text="Address" CssClass="label" />
                <asp:TextBox runat="server" ID="txtAddress" CssClass="input-field" TextMode="MultiLine" Rows="4" />
            </div>
        <div class="form-group">
            <asp:Label ID="Label5" runat="server" AssociatedControlID="aadharcardno" Text="Aadhar Card Number"
                CssClass="label" />
            <asp:TextBox runat="server" ID="aadharcardno" CssClass="input-field" />
        </div>
        <div class="form-group">
            <asp:Label ID="Label6" runat="server" AssociatedControlID="bloodgroup" Text="Blood Group"
                CssClass="label" />
            <asp:DropDownList ID="bloodgroup" runat="server" CssClass="input-field">
                <asp:ListItem>A+</asp:ListItem>
                <asp:ListItem>A-</asp:ListItem>
                <asp:ListItem>B+</asp:ListItem>
                <asp:ListItem>B-</asp:ListItem>
                <asp:ListItem>O+</asp:ListItem>
                <asp:ListItem>O-</asp:ListItem>
                <asp:ListItem>AB+</asp:ListItem>
                <asp:ListItem>AB-</asp:ListItem>
               
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label ID="Label9" runat="server" AssociatedControlID="txtEmail" Text="Email "
                CssClass="label" />
            <asp:TextBox runat="server" ID="txtEmail" CssClass="input-field" />
        </div>
        <div class="form-group">
            <asp:Label ID="Label10" runat="server" AssociatedControlID="mobileno" Text="Mobile Number "
                CssClass="label" />
            <asp:TextBox runat="server" ID="mobileno" CssClass="input-field" />
        </div>
         <div class="form-group">
                <asp:Label ID="Label8" runat="server" AssociatedControlID="profilePhoto" Text="Profile Photo" CssClass="label" />
                <asp:FileUpload ID="profilePhoto" runat="server" CssClass="input-field"/>
            </div>
        <div class="btn-container">
            <asp:Button runat="server" ID="btnSubmit" Text="Next" CssClass="btn" 
                onclick="btnSubmit_Click" />
        </div>
    </div>
    </form>
</body>
</html>
