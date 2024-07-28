<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="add_subjects.aspx.cs" Inherits="admin_add_subjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
        .form-container {
            max-width: 80%;
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
            width:100%;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input[type="text"],
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
         .margin
    {
        margin-left:50px;
     }
    .btn-new-department {
        background-color: black;
        color: white;
        border: none;
        border-radius: 4px;
        padding: 10px 20px;
        cursor: pointer;
    }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="form-container">
        <h2>Add Subjects</h2>
        <asp:Button ID="btnNewDepartment" runat="server" Text="+ New Department" 
            onclick="btnNewDepartment_Click" CssClass="btn-new-department" />
        <div class="form-group">
            <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
            <asp:DropDownList ID="ddlDepartment" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="deptName" 
                DataValueField="deptName">
  
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CONN %>" 
                SelectCommand="SELECT * FROM [department]"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:Label ID="lblSemester" runat="server" Text="Semester"></asp:Label>
            <asp:DropDownList ID="ddlSemester" runat="server">
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                <asp:ListItem Text="2" Value="2"></asp:ListItem>
            </asp:DropDownList>
        </div>
      
      <div class="form-group">
       <asp:Label ID="Label1" runat="server" Text="Course Code" CssClass="margin"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Subject Name"  CssClass="margin" ></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="Faculty Name"  CssClass="margin" ></asp:Label>
        </div>
 
<asp:Table ID="subjectTable" runat="server" >
   
</asp:Table>
 
        <div class="form-group">
           <asp:Button ID="AddRowButton" runat="server" Text="Add Row" OnClick="AddRowButton_Click" />
  <asp:Button ID="btnInsertData" runat="server" Text="Insert Data" OnClick="btnInsertData_Click" />
        </div>
        
    </div>

   
</asp:Content>

