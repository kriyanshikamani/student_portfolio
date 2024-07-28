<%@ Page Language="C#" AutoEventWireup="true" CodeFile="resultPage.aspx.cs" Inherits="faculty_resultPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
        body
        {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container
        {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2
        {
            text-align: center;
            color: #333;
        }
        table
        {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td
        {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th
        {
            background-color: #f2f2f2;
        }
        .internal-marks, .exam-marks
        {
            width: 70px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group
        {
            margin-bottom: 15px;
            overflow: hidden; /* Clear float */
        }
        .column
        {
            width: 50%;
            float: left;
        }
        .form-group label
        {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input[type="text"], .form-group select
        {
            width: calc(100% - 16px); /* Adjust for padding and border */
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Include padding and border in width */
        }
        .form-group select
        {
            cursor: pointer;
        }
        .result-summary
        {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .form-group input[type="submit"]
        {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-group input[type="submit"]:hover
        {
            background-color: #45a049;
        }
        .text-danger {
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <h2>
            Student Result Page</h2>
        <div class="form-group">
            <div class="column">
                <label for="txtCourse">
                    Course:</label>
                <asp:DropDownList ID="cource" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="deptName" DataValueField="dept_id" 
                    onselectedindexchanged="cource_SelectedIndexChanged">
                   
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CONN %>" 
                    SelectCommand="SELECT * FROM [department]"></asp:SqlDataSource>
            </div>
            <div class="column">
                <label for="txtSemester">
                    Semester:</label>
                <asp:DropDownList ID="semster" runat="server" DataSourceID="SqlDataSource2" 
                    DataTextField="semester" DataValueField="semester" OnSelectedIndexChanged="semster_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CONN %>" 
                    SelectCommand="SELECT DISTINCT [semester] FROM [subjects]">
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="form-group">
            <div class="column">
                <label for="txtEnrollmentNumber">
                    Enrollment Number:</label>
                <asp:TextBox ID="txtEnrollmentNumber" runat="server" CssClass="enrollment-number" />
            </div>
            <div class="column">
                <label for="ddlDivision">
                    Division:</label>
                <asp:DropDownList ID="ddlDivision" runat="server">
                    <asp:ListItem Text="F1" Value="F1" />
                    <asp:ListItem Text="F2" Value="F2" />
                    <asp:ListItem Text="C1" Value="C1" />
                    <asp:ListItem Text="C2" Value="C3" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="column">
                <label for="txtRollNumber">
                    Roll Number:</label>
                <asp:TextBox ID="txtRollNumber" runat="server" CssClass="roll-number" />
            </div>
        </div>
         <asp:Table ID="tableSubjects" runat="server">
          
        </asp:Table>
    
        <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        </div>
    </div>
    <div class="result-summary" runat="server" id="divResultSummary" visible="false">
        <h3>
            Result Summary</h3>
        <asp:Table ID="tableResultSummary" runat="server">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Subject</asp:TableHeaderCell>
                <asp:TableHeaderCell>Internal Marks</asp:TableHeaderCell>
                <asp:TableHeaderCell>Exam Marks</asp:TableHeaderCell>
                <asp:TableHeaderCell>Total Marks Obtained</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
        <div>
            <strong>Overall Total Marks:</strong> <span runat="server" id="spanOverallTotal" />
            <br />
            <strong>Percentage:</strong> <span runat="server" id="spanPercentage" />
            <br />
            <strong>SGPA (out of 10):</strong> <span runat="server" id="spanSGPA" />
        </div>
    </div>
    </span></span></span>
    </form>
   
</body>
</html>
