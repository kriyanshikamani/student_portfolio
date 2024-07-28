<%@ Page Title="" Language="C#" MasterPageFile="~/faculty/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="view_facultyDetails.aspx.cs" Inherits="faculty_view_facultyDetails" %>

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
            text-align:left;
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
 
    <div class="container" runat="server" id="divResultSummary" style="margin-top:20px;">
        <div class="title">
            <h2>
                Personal Information
            </h2>
            <hr />
        </div>
        <div>
            <asp:Image ID="imgFaculty" runat="server" CssClass="faculty" /><br />
            <asp:Label ID="lblFacultyName" runat="server" CssClass="faculty-name" Text="John Doe" />
        </div>
        <div class="info-container">
            <div class="form">
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-map-marker-alt"></i> Address:</span>
                    <asp:Label ID="lbladdress" runat="server" Text="Address" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-venus-mars"></i> Gender:</span>
                    <asp:Label ID="lblgender" runat="server" Text="Gender" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-tint"></i> Blood Group:</span>
                    <asp:Label ID="lblbloodgroup" runat="server" Text="Blood Group" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="far fa-calendar-alt"></i> Date Of Birth:</span>
                    <asp:Label ID="lbldob" runat="server" Text="Date Of Birth" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-phone-alt"></i> Mobile No.:</span>
                    <asp:Label ID="lblmobileno" runat="server" Text="Mobile No" />
                </div>
            </div>
            <div class="form">
                <div class="info-item">
                    <span class="info-label"><i class="far fa-envelope"></i> Email:</span>
                    <asp:Label ID="lblemail" runat="server" Text="Email" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-university"></i> Department:</span>
                    <asp:Label ID="lbldepartment" runat="server" Text="Department" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="fas fa-user-tie"></i> Designation:</span>
                    <asp:Label ID="lblDesignation" runat="server" Text="Professor" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="far fa-calendar-check"></i> Date Of Joining:</span>
                    <asp:Label ID="lbldoj" runat="server" Text="Date Of Joining" />
                </div>
                <div class="info-item">
                    <span class="info-label"><i class="far fa-id-card"></i> Aadhar Card No.:</span>
                    <asp:Label ID="lblaadhar" runat="server" Text="Aadhar Card No" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

