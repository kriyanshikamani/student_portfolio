<%@ Page Title="" Language="C#" MasterPageFile="~/faculty/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="edit_personalDetails.aspx.cs" Inherits="faculty_edit_personalDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
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
        }
        
        .input-field
        {
            width: calc(100% - 20px); /* Adjusted width */
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
            display: flex;
            justify-content: space-between; /* Evenly distribute space between elements */
            flex-wrap: wrap; /* Wrap elements to next line if necessary */
        }
        .form > div
        {
            width: calc(50% - 20px); /* Adjusted width */
            padding: 0 10px; /* Adjusted padding */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
        <div class="title">
            <h2>
                Edit Your Information </h2>
        </div>
        <div class="form">
            <div>
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
            </div>
            <div>
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
            </div>
        </div>
        <div class="btn-container">
            <asp:Button runat="server" ID="btnSubmit" Text="Edit" CssClass="btn" 
                onclick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>

