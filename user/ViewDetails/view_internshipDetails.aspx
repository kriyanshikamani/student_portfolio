<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="view_internshipDetails.aspx.cs" Inherits="user_ViewDetails_view_internshipDetails" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
 body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 800px;
            margin: 25px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        p {
            font-size: 16px;
            color: #888;
        }

        .content {
            width: 100%;
        }

        .summary,
        .experience,
        .education {
            margin-bottom: 30px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        h2 {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .experience .job {
            margin-bottom: 15px;
        }

        .experience .job h3,
        .education p:first-child {
            font-weight: bold;
        }
        .internship-details {
            margin: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .label {
            font-weight: bold;
        }
         .btn-download {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 8px 15px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    margin-top:10px;
    transition: background-color 0.3s ease;
}

.btn-download:hover {
    background-color: #0056b3;
}
.btn-add {
    background-color: #007bff; /* Blue color */
    color: #fff; /* White text color */
    border: none; /* No border */
    padding: 10px 20px; /* Padding */
    font-size: 16px; /* Font size */
    cursor: pointer; /* Cursor style */
    border-radius: 5px; /* Rounded corners */
    transition: background-color 0.3s ease; /* Transition effect */
    text-decoration: none; /* Remove underline */
}

.btn-add:hover {
    background-color: #0056b3; /* Darker blue color on hover */
}

        /* Position the button in the top-right corner */
        .btn-container {
            text-align: right;
            margin-bottom: 20px;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="btn-container">
        <a href="../internshipDetails.aspx" class="btn-add">Add</a>
    </div>
    <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
         <div class="container">
        <main class="content">
            <section class="experience">              
                <div class="job">
                    <h4>Company Name</h4>
                    <asp:Label ID="companyName" runat="server" Text='<%# Eval("companyName") %>'></asp:Label>
                    <p><span class="label">Position : </span> <asp:Label ID="position" runat="server" Text='<%# Eval("position") %>'></asp:Label></p>
                    <p><span class="label">Start Date:</span><asp:Label ID="startDate" runat="server" Text='<%# Eval("startDate") %>'></asp:Label></p>
                    <p><span class="label">End Date:</span><asp:Label ID="endDate" runat="server" Text='<%# Eval("endDate") %>'></asp:Label></p>
                    <p><span class="label">Description:</span></p>
                    <ul>
                        <li><asp:Label ID="description" runat="server" Text='<%# Eval("description") %>'></asp:Label></li>
                       
                    </ul>
                    <p><span class="label">Certificate:</span></p>
                    <asp:Image ID="certificate" runat="server" ImageUrl='<%# Eval("certificate") %>' Height="350px" Width="350px"/>
                    <p><asp:Button ID="btnDownload" runat="server" Text="Download" 
                onclick="btnDownload_Click" CssClass="btn-download" /></p>
                </div>
            </section>
        </main>
    </div>
    </ItemTemplate>
   </asp:Repeater>
</asp:Content>

