<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="view_personalDetails.aspx.cs" Inherits="user_ViewDetails_view_personalDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style>
    /* Your CSS styles here */
    body {
        font-family: Arial, sans-serif; /* Change to your preferred font */
        line-height: 1.6; /* Adjust line height for better readability */
    }

    .container {
        width: 90%;
        margin: 20px auto;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        display: grid;
        grid-template-columns: 0.5fr 1fr 1fr; /* Three columns */
        grid-gap: 5px; /* Gap between columns */
    }

    h1 {
        text-align: center;
        color: #333;
        grid-column: 1 / -1; /* Span across all columns */
        margin-bottom: 20px; /* Add some space below the heading */
    }

    .form-group {
        display: flex;
        flex-direction: row; /* Change from column to row */
        align-items: center; /* Align items vertically center */
        margin-bottom: 10px; /* Adjust margin */
    }

    .form-group label {
        flex: 0 0 40%; /* Set label width */
        font-weight: bold;  
    }

    .form-control {
        flex: 1; /* Take remaining space */
        padding: 5px;
        width: auto; /* Adjust width */
      
    }

    .image-container {
        text-align: center;
        /* Span only the first column */
        height:150px;
        width:150px;
        
    }

    .column {
        display: flex;
        flex-direction: column; /* Change from row to column */
    }

   .title h2 {
    margin-bottom: 10px;
    padding: 10px;
    background-color:#145185;
    color: #fff;
    font-size:20px;
    text-align: center;
}
  .edit-button {
            background-color: #007bff; /* Blue background color */
            color: #fff; /* White text color */
            border: none; /* No border */
            padding: 10px 20px; /* Padding */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Cursor style */
        }

        .edit-button:hover {
            background-color: #0056b3; /* Darker blue background color on hover */
        }
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
     <div class="container">
        <h1>
            <asp:Label ID="lblFullName" runat="server" Text="John Doe"></asp:Label></h1>
        <div style="display: flex;">
            <div class="form-group image-container">
                <asp:Image ID="imgUser" runat="server" Height="150px" Width="150px" BorderColor="Black"
                    BorderWidth="2px" />
            </div>
        </div>
        <div class="column">
            <div class="form-group">
                <label><i class="fas fa-venus-mars"></i> Gender:</label>
                <asp:Label ID="lblGender" runat="server" CssClass="form-control"></asp:Label>
            </div>
            <div class="form-group">
                <label><i class="far fa-calendar-alt"></i> Date of Birth:</label>
                <asp:Label ID="lblDateOfBirth" runat="server" CssClass="form-control"></asp:Label>
            </div>
            <div class="form-group">
                <label><i class="far fa-id-card"></i> Adharcard No:</label>
                <asp:Label ID="lblAdharcard" runat="server" CssClass="form-control"></asp:Label>
            </div>
            <div class="form-group">
                <label><i class="fas fa-tint"></i> Blood Group:</label>
                <asp:Label ID="lblBloodGroup" runat="server" CssClass="form-control"></asp:Label>
            </div>
        </div>
        <div class="column">
            <div class="form-group">
                <label><i class="far fa-envelope"></i> Email:</label>
                <asp:Label ID="lblEmail" runat="server" CssClass="form-control"></asp:Label>
            </div>
            <div class="form-group">
                <label><i class="fas fa-phone-alt"></i> Mobile No:</label>
                <asp:Label ID="lblMobileNo" runat="server" CssClass="form-control"></asp:Label>
            </div>
            <div class="form-group">
                <label><i class="fas fa-city"></i> City:</label>
                <asp:Label ID="lblCity" runat="server" CssClass="form-control"></asp:Label>
            </div>
        </div>
       <div style="text-align: center; margin-top: 20px;">
            <asp:Button ID="btnEdit" runat="server" Text="Edit"  CssClass="edit-button" />
        </div>
        </div>
</asp:Content>

