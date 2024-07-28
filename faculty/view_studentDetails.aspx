<%@ Page Title="" Language="C#" MasterPageFile="~/faculty/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="view_studentDetails.aspx.cs" Inherits="faculty_view_studentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
         .container
        {
            width: 70%;
            margin: 0 auto;
            text-align: center;
            background-color: White;
            border-radius: 10px;
        }
        
        .student
        {
            display: inline-block;
            margin-bottom: 20px;
            width: 200px;
            height: 200px;
            object-fit: cover;
            border: 5px solid #fff;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }
        
        .student-name
        {
            font-size: 24px;
            font-weight: bold;
            margin-top: 10px;
        }
        
        .info-container
        {
            display: flex;
            text-align: left;
            margin-top: 50px;
            justify-content: space-around; /* Evenly distribute space between elements */
            flex-wrap: wrap;
            font-size: 20px;
        }
        
        .info-block
        {
            flex: 1;
            padding: 20px;
            margin: 0; /* Adjusted to remove space */
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        
        
        .info-item
        {
            margin-bottom: 10px;
        }
        
        .info-label
        {
            font-weight: bold;
            margin-top: 15px;
        }
        .title
        {
            text-align: center;
            color: black;
            font-size: 20px;
            padding: 20px;
            font-family: Times New Roman;
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
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="container">
        <div class="title">
            <h2>
                Student Information
            </h2>
        </div>
        <div class="info-container">
            <div class="form">
                <div class="info-item">
                    <asp:Label ID="Label1" runat="server" Text="Department:" class="info-label"></asp:Label>
                    <asp:DropDownList ID="dept" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="deptName" DataValueField="dept_id">
                       
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONN %>" 
                        SelectCommand="SELECT * FROM [department]"></asp:SqlDataSource>
                </div>
                
                
            </div>
            <div class="form">
                <div class="info-item">
                    <asp:Label ID="enrollment" runat="server" Text="Enrollment No.:" class="info-label"></asp:Label>
                    <asp:TextBox ID="enroll" runat="server" Class="space" Width="200px"></asp:TextBox>
                </div>
               
            </div>
        </div>
        <div class="btn-container">
            <asp:Button runat="server" ID="btnSubmit" Text="Search" CssClass="btn" 
                onclick="btnSubmit_Click" />
        </div>
    </div>
    
    <div class="container" runat="server" id="divResultSummary" style="margin-top:20px;" visible="false">
        <div>
            <asp:Image ID="imgStudent" runat="server" CssClass="student" /><br />
            <asp:Label ID="studName" runat="server" CssClass="student-name" />
        </div>
        <div class="info-container">
            <div class="form">
                <div class="info-item">
                    <span class="info-label">Name :</span>
                    <asp:Label ID="lblname" runat="server" Text="Name" />
                </div>
                 <div class="info-item">
                    <span class="info-label">Semester :</span>
                    <asp:Label ID="lblSem" runat="server" />
                </div>
                <div class="info-item">
                    <span class="info-label">Address:</span>
                    <asp:Label ID="lbladdress" runat="server" Text="Address" />
                </div>
                <div class="info-item">
                    <span class="info-label">Gender:</span>
                    <asp:Label ID="lblgender" runat="server" Text="Gender" />
                </div>
                <div class="info-item">
                    <span class="info-label">Blood Group:</span>
                    <asp:Label ID="lblbloodgroup" runat="server" Text="Blood Gropu" />
                </div>
                <div class="info-item">
                    <span class="info-label">Date Of birth:</span>
                    <asp:Label ID="lbldob" runat="server" Text="Date Of Birth" />
                </div>
                <div class="info-item">
                    <span class="info-label">Mobile No.:</span>
                    <asp:Label ID="lblmobileno" runat="server" Text="Mobile no" />
                </div>
            </div>
            <div class="form">
                <div class="info-item">
                    <span class="info-label">Email:</span>
                    <asp:Label ID="lblemail" runat="server" Text="Email" />
                </div>
                 <div class="info-item">
                    <span class="info-label">Entrollment No:</span>
                    <asp:Label ID="lblEntrollment" runat="server" />
                </div>
                <div class="info-item">
                    <span class="info-label">Division:</span>
                    <asp:Label ID="lblDiv" runat="server" />
                </div>
                <div class="info-item">
                    <span class="info-label">Department:</span>
                    <asp:Label ID="lbldepartment" runat="server" Text="Department" />
                </div>
                <div class="info-item">
                    <span class="info-label">City:</span>
                    <asp:Label ID="lblCity" runat="server" />
                </div>
                <div class="info-item">
                    <span class="info-label">Admission year : </span>
                    <asp:Label ID="lblAdmissionYear" runat="server" />
                </div>
                 
                <div class="info-item">
                    <span class="info-label">Aadhar Card No :</span>
                    <asp:Label ID="lblaadhar" runat="server" Text="Aadhar Card No" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

