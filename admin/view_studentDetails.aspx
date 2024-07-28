<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="view_studentDetails.aspx.cs" Inherits="admin_view_studentDetails" %>

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
        
        .faculty
        {
            display: inline-block;
            margin-bottom: 20px;
            width: 200px;
            height: 200px;
            object-fit: cover;
            border: 5px solid #fff;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }
        
        .faculty-name
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
                &nbsp;</h2>
            <h2>
                Student Information
            </h2>
        </div>
        <div class="info-container">
            <div class="form">
                <div class="info-item">
                    <asp:Label ID="Label1" runat="server" Text="Department:" class="info-label"></asp:Label>
                    <asp:DropDownList ID="dept" runat="server">
                        <asp:ListItem>BSC.IT</asp:ListItem>
                        <asp:ListItem>BCA</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="info-item">
                    <asp:Label ID="lbldivision" runat="server" Text="Division:" class="info-label"></asp:Label>
                    <asp:DropDownList ID="div" runat="server">
                        <asp:ListItem>F1</asp:ListItem>
                        <asp:ListItem>F2</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="info-item">
                    <asp:Label ID="lblsemester" runat="server" Text="Semester:" class="info-label"></asp:Label>
                    <asp:DropDownList ID="sem" runat="server">
                        <asp:ListItem>Semester 1</asp:ListItem>
                        <asp:ListItem>Semester 2</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form">
                <div class="info-item">
                    <asp:Label ID="enrollment" runat="server" Text="Enrollment No.:" class="info-label"></asp:Label>
                    <asp:TextBox ID="enroll" runat="server" Class="space" Width="200px"></asp:TextBox>
                </div>
                <div class="info-item">
                    <asp:Label ID="rollno" runat="server" Text="Roll No.    :" class="info-label"></asp:Label>
                    <asp:TextBox ID="rno" runat="server" Class="space" Width="200px"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="btn-container">
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn" 
                onclick="btnSubmit_Click" />
        </div>
    </div>
    
    <div class="container" runat="server" id="divResultSummary" style="margin-top: 20px;"
        visible="false">
        <div>
            <asp:Image ID="imgFaculty" runat="server" CssClass="faculty" ImageUrl="~/Images/faculty.jpg" /><br />
            <asp:Label ID="lblFacultyName" runat="server" CssClass="faculty-name" Text="John Doe" />
        </div>
        <div class="info-container">
            <div class="form">
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-user"></i>Name :</span>
                    <asp:Label ID="lblname" runat="server" Text="Name" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-map-marker-alt"></i>Address:</span>
                    <asp:Label ID="lbladdress" runat="server" Text="Address" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-venus-mars"></i>Gender:</span>
                    <asp:Label ID="lblgender" runat="server" Text="Gender" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-tint"></i>Blood Group:</span>
                    <asp:Label ID="lblbloodgroup" runat="server" Text="Blood Gropu" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-birthday-cake"></i>Date Of birth:</span>
                    <asp:Label ID="lbldob" runat="server" Text="Date Of Birth" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-mobile-alt"></i>Mobile No.:</span>
                    <asp:Label ID="lblmobileno" runat="server" Text="Mobile no" />
                </div>
            </div>
            <div class="form">
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-envelope"></i>Email:</span>
                    <asp:Label ID="lblemail" runat="server" Text="Email" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-building"></i>Department:</span>
                    <asp:Label ID="lbldepartment" runat="server" Text="Department" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-user-tie"></i>Designation:</span>
                    <asp:Label ID="lblDesignation" runat="server" Text="Professor" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-calendar-day"></i>Date Of Joioning:</span>
                    <asp:Label ID="lbldoj" runat="server" Text="Date Of Joining" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-id-card"></i>Aadhar Card No.:</span>
                    <asp:Label ID="lblaadhar" runat="server" Text="Aadhar Card No" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

