<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="view_academicDetails.aspx.cs" Inherits="user_ViewDetails_view_academicDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
.main-container {
    margin:10px auto;
    width: 80%;
    background-color:#FAF9F6;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.container
{
    display:flex;   
    margin:50px 0; 
}

.column {
    flex: 1;
    padding: 10px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    font-weight: bold;
}
h2
{
    font-size:28px;
    margin:10px 10px;    
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <div class="main-container">
        <h2>
            Academic Details</h2>
        <hr />
        <div class="container">
            <div class="column">
                <div class="form-group">
                    <label>
                        <i class="fas fa-user"></i>Full Name:</label>
                    <asp:Label ID="lblFullName" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-building"></i>Department:</label>
                    <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-chalkboard"></i>Division:</label>
                    <asp:Label ID="lblDivision" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-graduation-cap"></i>Semester:</label>
                    <asp:Label ID="lblSem" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-id-card"></i>Roll no:</label>
                    <asp:Label ID="lblRno" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-id-badge"></i>Entrollment no:</label>
                    <asp:Label ID="lblEntrollment" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-calendar-alt"></i>Admission Year:</label>
                    <asp:Label ID="lblAdYear" runat="server"></asp:Label>
                </div>
            </div>
            <div class="column">
                <div class="form-group">
                    <label>
                        <i class="fas fa-user-graduate"></i>Admission Type:</label>
                    <asp:Label ID="lblAdType" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-envelope"></i>Email:</label>
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-phone"></i>Phone:</label>
                    <asp:Label ID="lblPhone" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-id-badge"></i>10th Persantage :</label>
                    <asp:Label ID="lbl10per" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label>
                        <i class="fas fa-calendar-alt"></i>12th Persantage :
                    </label>
                    <asp:Label ID="lbl12per" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

