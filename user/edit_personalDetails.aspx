<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="edit_personalDetails.aspx.cs" Inherits="user_edit_personalDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="css/forms.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
        <div class="title">
            <h2>
                Edit Your Information
            </h2>
        </div>
        <div class="form-group">
            <asp:Label ID="lbladdress" runat="server" AssociatedControlID="txtAddress" Text="Address"
                CssClass="label" />
            <asp:TextBox runat="server" ID="txtAddress" CssClass="input-field" TextMode="MultiLine"
                Rows="4" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblemail" runat="server" AssociatedControlID="txtemail" Text="Email " CssClass="label" />
            <asp:TextBox runat="server" ID="txtemail" CssClass="input-field" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblmobileno" runat="server" AssociatedControlID="txtmobileno" Text="Mobile Number "
                CssClass="label" />
            <asp:TextBox runat="server" ID="txtmobileno" CssClass="input-field" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblfileupload" runat="server" AssociatedControlID="txtfileupload" Text="Profile Photo"
                CssClass="label" />
            <asp:FileUpload ID="txtfileupload" runat="server" CssClass="input-field" />
        </div>
        <div class="btn-container">
            <asp:Button runat="server" ID="editbtn" Text="Edit" CssClass="btn" onclick="editbtn_Click1" />
        </div>
    </div>
</asp:Content>

