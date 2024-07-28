<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="internshipDetails.aspx.cs" Inherits="user_internshipDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="css/forms.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="container">
        <div class="title">
            <h2>Internship Details</h2>
        </div>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Company Name:" AssociatedControlID="txtCompanyName" CssClass="label" />
            <asp:TextBox runat="server" ID="txtCompanyName" CssClass="input-field" placeholder="Enter company name" required />
        </div>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Position:" AssociatedControlID="txtPosition" CssClass="label" />
            <asp:TextBox runat="server" ID="txtPosition" CssClass="input-field" placeholder="Enter position" required />
        </div>

        <div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Start Date:" AssociatedControlID="txtStartDate" CssClass="label" />
            <asp:TextBox runat="server" ID="txtStartDate" CssClass="input-field" placeholder="Enter start date" required />
        </div>

        <div class="form-group">
            <asp:Label ID="Label7" runat="server" Text="End Date:" AssociatedControlID="txtEndDate" CssClass="label" />
            <asp:TextBox runat="server" ID="txtEndDate" CssClass="input-field" placeholder="Enter end date" required />
        </div>

        <div class="form-group">
            <asp:Label ID="Label8" runat="server" Text="Certificate:" AssociatedControlID="certificate" CssClass="label" />
            <asp:FileUpload ID="certificate" runat="server" CssClass="input-field" />
        </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Description:" AssociatedControlID="txtDescription" CssClass="label" />
            <asp:TextBox runat="server" ID="txtDescription" CssClass="input-field" TextMode="MultiLine" placeholder="Enter description" required />
        </div>

        <div class="btn-container">
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn"  />
        </div>
    </div>
</asp:Content>

