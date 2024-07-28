<%@ Page Title="" Language="C#" MasterPageFile="~/faculty/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="add_facultyDetails.aspx.cs" Inherits="faculty_add_facultyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style>
        .container
        {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .title
        {
            text-align: center;
            color: black;
            font-size: 20px;
            padding: 20px;
            font-family: Times New Roman;
        }
        
        .label
        {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-size:17px;
        }
        
        .input-field
        {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        
        .btn-container
        {
            text-align: center;
        }
        
        .btn
        {
            padding: 10px 20px;
            background-color: black;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .btn:hover
        {
            background-color: #0056b3;
        }
        .form
        {
            display:flex;
            justify-content: space-between; /* Evenly distribute space between elements */
            flex-wrap: wrap; /* Wrap elements to next line if necessary */
        }
        .form > div {
            width: calc(50% - 20px); /* Adjusted width */
            padding: 0 10px; /* Adjusted padding */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="title">
            <h2>
                Faculty Information Form</h2>
        </div>
        <div class="form"> 
            <div>
                <div class="form-group">
                    <asp:Label ID="label_fullname" runat="server" AssociatedControlID="fullname" Text="Full Name"
                        CssClass="label" />
                    <asp:TextBox runat="server" ID="fullname" CssClass="input-field" />
                </div>
                <div class="form-group">
                    <asp:Label ID="label_gender" runat="server" AssociatedControlID="gender" Text="Gender"
                        CssClass="label" />
                    <asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="form-group">
                    <asp:Label ID="label_address" runat="server" AssociatedControlID="address" Text="Address"
                        CssClass="label" />
                    <asp:TextBox runat="server" ID="address" CssClass="input-field" />
                </div>
                <div class="form-group">
                    <asp:Label ID="label_bloodgroup" runat="server" AssociatedControlID="bloodgroup"
                        Text="Blood Group" CssClass="label" />
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
                    <asp:Label ID="label_dojoining" runat="server" AssociatedControlID="dojoining" Text="Date Of Joining"
                        CssClass="label" />
                    <asp:TextBox runat="server" ID="dojoining" CssClass="input-field" />
                </div>
                <div class="form-group">
                    <asp:Label ID="label_dob" runat="server" AssociatedControlID="dob" Text="Date Of Birth"
                        CssClass="label" />
                    <asp:TextBox runat="server" ID="dob" CssClass="input-field" />
                </div>
                <div class="form-group">
                    <asp:Label ID="label_dept" runat="server" AssociatedControlID="dept" Text="Department Name"
                        CssClass="label" />
                    <asp:DropDownList ID="dept" runat="server" CssClass="input-field" 
                        DataSourceID="SqlDataSource1" DataTextField="deptName" DataValueField="dept_id">
                      
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONN %>" 
                        SelectCommand="SELECT * FROM [department]"></asp:SqlDataSource>
                </div>
            </div>
            <div>
                <div class="form-group">
                    <asp:Label ID="label_designation" runat="server" AssociatedControlID="designation"
                        Text="Designation" CssClass="label" />
                    <asp:TextBox runat="server" ID="designation" CssClass="input-field" />
                </div>
                <div class="form-group">
                    <asp:Label ID="label_mobileno" runat="server" AssociatedControlID="mobileno" Text="Mobile Number "
                        CssClass="label" />
                    <asp:TextBox runat="server" ID="mobileno" CssClass="input-field" />
                </div>
                <div class="form-group">
                    <asp:Label ID="label_email" runat="server" AssociatedControlID="email" Text="Email "
                        CssClass="label" />
                    <asp:TextBox runat="server" ID="email" CssClass="input-field" />
                </div>
                <div class="form-group">
                    <asp:Label ID="label_aadharcardno" runat="server" AssociatedControlID="aadharcardno"
                        Text="Aadhar Card Number" CssClass="label" />
                    <asp:TextBox runat="server" ID="aadharcardno" CssClass="input-field" />
                </div>
                <div class="form-group">
                    <asp:Label ID="label_bankacc" runat="server" AssociatedControlID="bankacc" Text="BankAccount Number"
                        CssClass="label" />
                    <asp:TextBox runat="server" ID="bankacc" CssClass="input-field" />
                </div>
                <div class="form-group">
                    <asp:Label ID="label_bankname" runat="server" AssociatedControlID="bankname" Text="Bank Name"
                        CssClass="label" />
                    <asp:TextBox runat="server" ID="bankname" CssClass="input-field" />
                </div>
                 <div class="form-group">
                    <asp:Label ID="label1" runat="server" AssociatedControlID="profilePhoto" Text="Profile photo"
                        CssClass="label" />
                     <asp:FileUpload ID="profilePhoto" runat="server" />
                </div>
            </div>
        </div>
        <div class="btn-container">
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn" 
                onclick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>

