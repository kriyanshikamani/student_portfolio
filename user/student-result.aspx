    <%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="student-result.aspx.cs" Inherits="user_student_result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            border-color: Black;
            border-style: solid;
            border-width: 2px;
            position: relative;
        }
         .total-info {
            margin-top: 20px;
            padding: 20px;
            border: 2px solid #000;
            border-radius: 5px;
            background-color: #f2f2f2;
        }

        .total-info h2 {
            margin: 10px 0;
            font-size: 18px;
            color: #333;
        }
        
        header1 {
            position: relative;
        }
        
        header1 h1 {
            margin: 0;
            margin-bottom:20px;
            margin-top:20px;
        }
        
        header1 p {
            margin: 5px 0;
        }
        
        .title {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .student-info p {
            margin: 5px 0;
            margin-bottom: 10px;
        }
        
        .table-container {
            overflow-x: auto;
            border-color: Black;
            border-style: solid;
            border-width:0px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 8px;
            text-align: left;
            border-color: Black;
            border-style: solid;
        }
        
        th {
            background-color: #f2f2f2;
        }

        /* Style for the image */
        .header-image {
            position: absolute;
            top: 20px;
            right: 10px;
            width: 150px; /* adjust size as needed */
            height: 150px; /* adjust size as needed */
            object-fit: cover;
            border:1px solid black;
            margin-right:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
        
        <header1>
            <h1>Atmiya University</h1>
        </header1>
         <asp:Image ID="imgUser" runat="server" CssClass="header-image"></asp:Image>

        <div class="student-info">
            <asp:Label ID="lbl_name" runat="server" Text="Student Name : "></asp:Label>
            <asp:Label ID="lbl_fullName" runat="server" ></asp:Label><br />
            <asp:Label ID="lbl_dept" runat="server" Text="Program : "></asp:Label>
            <asp:Label ID="lbl_program" runat="server" ></asp:Label><br />
            <asp:Label ID="lbl_sem" runat="server" Text="Semester : "></asp:Label>
            <asp:Label ID="lbl_semester" runat="server" ></asp:Label><br />
             <asp:Label ID="lbl_entroll" runat="server" Text="Enrollment No : "></asp:Label>
            <asp:Label ID="lbl_entrollment" runat="server" ></asp:Label><br />
        </div>
        
        <div class="table-container">
           <%-- <table>
                <thead>
                    <tr>
                        <th>Course Code</th>
                        <th>Course Title</th>
                        <th>Marks</th>
                        <th>Marks</th>
                        <th>Marks</th>
                        <th>Grade</th>
                        <th>Result</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Course Code 1</td>
                        <td>Course Title 1</td>
                        <td>Mark 1</td>
                        <td>Mark 2</td>
                        <td>Mark 3</td>
                        <td>Grade 1</td>
                        <td>Result 1</td>
                    </tr>
                </tbody>
            </table>--%>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </div>
        <div class="total-info">
            
            <h2>Total Marks (TM): <asp:Label ID="lblTotalMarks" runat="server" /></h2>
            <h2>Percentage (P): <asp:Label ID="lblPercentage" runat="server" /></h2>
            <h2>SGPA (Semester Grade Point Average): <asp:Label ID="lblSGPA" runat="server" /></h2>
        </div>
    </div>
</asp:Content>

