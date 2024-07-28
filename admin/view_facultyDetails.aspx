<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="view_facultyDetails.aspx.cs" Inherits="admin_view_facultyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
 <div class="container">
        <div class="title">
            <h2>
                Faculty Information
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
                <%--<div class="info-item">
                    <asp:Label ID="lblsemester" runat="server" Text="Semester:" class="info-label"></asp:Label>
                    <asp:DropDownList ID="sem" runat="server" DataSourceID="SqlDataSource3" 
                        DataTextField="semester" DataValueField="semester">
                        
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONN %>" 
                        SelectCommand="SELECT [semester] FROM [subjects]"></asp:SqlDataSource>
                </div>--%>
            </div>
            <div class="form">
                <div class="info-item">
                    <asp:Label ID="femail" runat="server" Text="Email:" class="info-label"></asp:Label>
                    <asp:DropDownList ID="facultyemail" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="email" DataValueField="email">
                        
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONN %>" 
                        SelectCommand="SELECT [email] FROM [faculty]"></asp:SqlDataSource>
                </div>
                
            </div>
        </div>
        <div class="btn-container">
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn" onclick="btnSubmit_Click"  
                 />
        </div>
    </div>
    <div class="container" runat="server" id="divResultSummary" style="margin-top:20px;" visible="false">
       
        <div>
            <asp:Image ID="imgFaculty" runat="server" CssClass="faculty"  /><br />
            <asp:Label ID="lblFacultyName" runat="server" CssClass="faculty-name" Text="" />
        </div>
        <div class="info-container">
             <div class="form">
                <div class="info-item">
                    <%--<span class="info-label">Name :</span>--%>
                    <asp:Label ID="name" runat="server" Text='<i class="fas fa-user"></i> Name :' class="info-label" />
                    <asp:Label ID="lblname" runat="server" Text="" />
                </div>
                <div class="info-item">
                    <asp:Label ID="address" runat="server" Text='<i class="fas fa-map-marker-alt"></i> Address :' class="info-label" />
                    <asp:Label ID="lbladdress" runat="server" Text="" />
                </div>
                <div class="info-item">
                    <asp:Label ID="gender" runat="server" Text='<i class="fas fa-venus-mars"></i> Gender :' class="info-label" />
                    <asp:Label ID="lblgender" runat="server" Text="" />
                </div>
                <div class="info-item">
                    <asp:Label ID="bloodgroup" runat="server" Text='<i class="fas fa-tint"></i> Blood Group :' class="info-label" />
                    <asp:Label ID="lblbloodgroup" runat="server" Text="" />
                </div>
                <div class="info-item">
                    <asp:Label ID="dateofbirth" runat="server" Text='<i class="fas fa-calendar-alt"></i> Date Of birth :' class="info-label" />
                    <asp:Label ID="lbldob" runat="server" Text="" />
                </div>
                <div class="info-item">
                    <asp:Label ID="mobileno" runat="server" Text='<i class="fas fa-phone"></i> Mobile No :' class="info-label" />
                    <asp:Label ID="lblmobileno" runat="server" Text="" />
                </div>
            </div>
            <div class="form">
                <div class="info-item">
                    <asp:Label ID="email" runat="server" Text='<i class="fas fa-envelope"></i> Email :' class="info-label" />
                    <asp:Label ID="lblemail" runat="server" Text="" />
                </div>
                <div class="info-item">
                    <asp:Label ID="department" runat="server" Text='<i class="fas fa-building"></i> Department :' class="info-label" />
                    <asp:Label ID="lbldepartment" runat="server" Text="" />
                </div>
                <div class="info-item">
                    <asp:Label ID="designation" runat="server" Text='<i class="fas fa-user-tie"></i> Designation :' class="info-label" />
                    <asp:Label ID="lblDesignation" runat="server" Text="" />
                </div>
                <div class="info-item">
                    <asp:Label ID="dateofjoining" runat="server" Text='<i class="fas fa-calendar-day"></i> Date of Joining :' class="info-label" />
                    <asp:Label ID="lbldoj" runat="server" Text="" />
                </div>
                <div class="info-item">
                    <asp:Label ID="aadhar" runat="server" Text='<i class="fas fa-id-card"></i> Aadhar Card No :' class="info-label" />
                    <asp:Label ID="lblaadhar" runat="server" Text="" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
