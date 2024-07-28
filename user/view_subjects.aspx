<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true"
    CodeFile="view_subjects.aspx.cs" Inherits="user_view_subjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        table
        {
            width: 80%;
            border-collapse: collapse;
            margin: 30px;
        }
        
        th, td
        {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th
        {
            background-color: black;
            color: white;
            font-weight: bold;
        }
        
        tr:nth-child(even)
        {
            background-color: #f9f9f9;
        }
        
        tr:hover
        {
            background-color: #f2f2f2;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:Table ID="SubjectsTable" runat="server" CssClass="table">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Subject Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Course Code</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    </div>
</asp:Content>
