<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="view_contactDetails.aspx.cs" Inherits="user_ViewDetails_view_contactDetails" %>

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
 <h2>Contact Details</h2>
 <hr />
  <div class="container">
            <div class="column">
                <div class="form-group">
                    <label><i class="fas fa-map-marker-alt"></i> Address:</label>
                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-city"></i> City:</label>
                    <asp:Label ID="lblCity" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-flag"></i> State:</label>
                    <asp:Label ID="lblState" runat="server"></asp:Label>
                </div>
            </div>
             <div class="column">
                <div class="form-group">
                    <label><i class="fas fa-thumbtack"></i> Pincode:</label>
                    <asp:Label ID="lblPin" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-envelope"></i> Email:</label>
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-phone"></i> Phone:</label>
                    <asp:Label ID="lblPhone" runat="server"></asp:Label>
                </div>
            </div>
        </div>
        </div>
</asp:Content>

