<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="add_faculty.aspx.cs" Inherits="admin_add_faculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .form-container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

.form-container h2 {
            margin-top: 0;
            padding-bottom: 50px; /* Add padding bottom to create space between title and form */
        }

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

.form-group input[type="text"],
.form-group input[type="email"],
.form-group input[type="password"],
.form-group select {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.form-group select {
    cursor: pointer;
}

.btn-submit {
            background-color: black;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            margin: 0 auto; /* Center the button horizontally */
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-container">
            <h2>Add Faculty</h2>
            <div class="form-group">
                <asp:Label ID="fullname" runat="server" Text="Full Name"></asp:Label>
                <asp:TextBox ID="name" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lbl_email" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="email" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lbl_password" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="password" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lbl_dept" runat="server" Text="Department"></asp:Label>
                <asp:DropDownList ID="dept" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="deptName" DataValueField="dept_id">
                   
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CONN %>" 
                    SelectCommand="SELECT * FROM [department]"></asp:SqlDataSource>
            </div>
            
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Add"  CssClass="btn-submit" 
                    onclick="btnSubmit_Click" />
            </div>
        </div>
</asp:Content>

