<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin_dashboard.aspx.cs" Inherits="admin_Admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style>
        /* Reset default margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Define overall layout */
        .dashboard {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background-color: #f3f3f3; /* Background color */
            font-family: Arial, sans-serif;
        }

        /* Statistics container */
        .statistics-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start; /* Align items at the top */
            width: 100%;
            max-width: 1200px;
            margin-top: 20px;
        }

        /* Statistic items */
        .statistics-left {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Statistic item */
        .stat-item {
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        /* Icon */
        .icon {
            font-size: 36px;
            margin-bottom: 10px;
        }

        /* Text */
        .text {
            font-size: 18px;
            text-align: center;
            color: #333;
        }

        /* Atmiya University card */
        .atmiya-card {
            flex: 1;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            margin-left: 20px; /* Add some space between the items */
        }

        /* Image */
        .atmiya-image {
            border-radius: 10px 10px 0 0;
            width: 100%;
        }

        /* Atmiya University text */
        .atmiya-text {
            padding: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="dashboard">
        <h1>Student Portfolio</h1>
       <div class="statistics-container">
            <!-- Left side - Existing statistics -->
            <div class="statistics-left">
           <div class="stat-item-row">
        <div class="stat-item box1">
                    <div class="left-box">
                        <div class="icon" style="background-color: green;">
                            <i class="fas fa-user" style="color: white;"></i>
                        </div>
                    </div>
                    <div class="right-box">
                        <div class="text">
                            <asp:Label ID="lblTotalRegisteredStudents" runat="server" Text="" style="color: black; font-weight: bold;"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="stat-item box2">
                    <div class="left-box">
                        <div class="icon" style="background-color: blue;">
                            <i class="fas fa-user" style="color: white;"></i>
                        </div>
                    </div>
                    <div class="right-box">
                        <div class="text">
                            <asp:Label ID="lblTotalFaculty" runat="server" Text="" style="color: black; font-weight: bold;"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="stat-item box3">
                    <div class="left-box">
                        <div class="icon" style="background-color: red;">
                            <i class="fas fa-building" style="color: white;"></i>
                        </div>
                    </div>
                    <div class="right-box">
                        <div class="text">
                            <asp:Label ID="lblTotalDepartments" runat="server" Text="" style="color: black; font-weight: bold;"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>



              <div class="stat-item-row">
        <div class="stat-item box6">
                    <div class="left-box">
                        <div class="icon" style="background-color: #ff9966;">
                            <i class="fas fa-cogs" style="color: white;"></i>
                        </div>
                    </div>
                    <div class="right-box">
                        <div class="text">
                            <asp:DropDownList ID="ddlDepartments" runat="server" AutoPostBack="true" CssClass="custom-dropdown">
                            </asp:DropDownList>
                            <asp:Button ID="Button1" runat="server" Text="Button" CssClass="custom-button" onclick="Button1_Click" />
                        </div>
                    </div>
                </div>
            </div>
           <div class="stat-item-row">
        <div class="stat-item box4"> 
                    <div class="left-box">
                        <div class="icon" style="background-color: orange;">
                            <i class="fas fa-graduation-cap" style="color: white;"></i>
                        </div>
                    </div>
                    <div class="right-box">
                        <div class="text">
                            <asp:Label ID="lblTotalStudentsInDepartment" runat="server" Text="" style="color: black; font-weight: bold;"></asp:Label> Students
                        </div>
                    </div>
                </div>
                <div class="stat-item box5">
                    <div class="left-box">
                        <div class="icon" style="background-color: purple;">
                            <i class="fas fa-chalkboard-teacher" style="color: white;"></i>
                        </div>
                    </div>
                    <div class="right-box">
                        <div class="text">
                            <asp:Label ID="lblTotalFacultyInDepartment" runat="server" Text="" style="color: black; font-weight: bold;"></asp:Label> Faculty
                        </div>
                    </div>
                </div>
            </div>
            </div>
         <div class="atmiya-card">
                <div class="image">
                <!-- Insert image URL for Atmiya University -->
            <img src="../student_profile_photo/atmiya%20logo.jpeg" alt="Atmiya University" style="width: 50%; border-radius: 10px 10px 0 0; display: block; margin: 0 auto;">



            </div>
             <div class="atmiya-text">
                <h2>Atmiya University</h2>
                <p>
                    Atmiya University is a prestigious educational institution committed to providing quality education and fostering holistic development.
                    Located in a serene environment, the university offers a wide range of programs and opportunities for students to excel in their academic pursuits.
                    With state-of-the-art facilities and dedicated faculty, Atmiya University aims to empower students with knowledge and skills for a bright future.
           </div>
            </div>
        </div>
    </div>
</asp:Content>
