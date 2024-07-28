<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="achievementDetails.aspx.cs" Inherits="user_achievementDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="css/forms.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">

         <div class="title">
                <h2>Achievements Form</h2>
            </div>
            
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" AssociatedControlID="txtActivity" Text="Activity Name" CssClass="label" />
                <asp:TextBox ID="txtActivity" runat="server"  CssClass="input-field"></asp:TextBox>
            </div>
              <div class="form-group">
                <asp:Label ID="Label7" runat="server" AssociatedControlID="certificate" Text="Cetificates" CssClass="label" />
                <asp:FileUpload ID="certificate" runat="server" CssClass="input-field"/>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" AssociatedControlID="date" Text="Date of Achievement" CssClass="label" />
                <asp:TextBox ID="date" runat="server"  CssClass="input-field"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" AssociatedControlID="txtRank" Text="Achievement Rank" CssClass="label" />
                <asp:TextBox runat="server" ID="txtRank" CssClass="input-field" />
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" AssociatedControlID="txtDescription" Text="Description of Achievement" CssClass="label" />
                <asp:TextBox runat="server" ID="txtDescription" CssClass="input-field" TextMode="MultiLine" Rows="5" />
            </div>
            <div class="btn-container">
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn" />
            </div>
            </div>
</asp:Content>

