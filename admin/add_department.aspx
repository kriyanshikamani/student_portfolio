<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="add_department.aspx.cs" Inherits="admin_add_department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .form-container
        {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        
        .form-container h2
        {
            margin-top: 0;
            padding-bottom: 50px;
        }
        
        .form-group
        {
            margin-bottom: 15px;
        }
        
        .form-group label
        {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        
        .form-group input[type="text"], .form-group select
        {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        .form-group select
        {
            cursor: pointer;
        }
        
        .btn-submit
        {
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-container">
        <h2>
            Add Department</h2>
        <div class="form-group">
            <asp:Label ID="dept" runat="server" Text="Department Name"></asp:Label>
            <asp:TextBox ID="department" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn-submit" OnClick="btnAdd_Click" />
        </div>
    </div>
</asp:Content>
