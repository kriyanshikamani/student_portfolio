<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeFile="view_achievementDetails.aspx.cs" Inherits="user_ViewDetails_view_achievementDetails" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }   
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .achievement {
            background-color: #f9f9f9;
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            transition: all 0.3s ease;
            border-radius:6px;
        }

        .achievement:hover {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

       .achievement label {
    font-size: 18px;
    color: #444;
    margin-bottom: 5px;
    display: inline-block;
    width: 200px;
}

.achievement .achievement-label,
.achievement .student-name,
.achievement .achievement-info,
.achievement .date,
.achievement .certificate-image {
    display: inline-block;
    vertical-align: top;
    width: calc(50% - 10px);
    margin-right: 20px;
}

.achievement label,
.achievement .achievement-label,
.achievement .student-name,
.achievement .achievement-info,
.achievement .date {
    margin-bottom: 10px;
}

        .achievement .student-name {
            font-weight: bold;
            color: #333;
            font-size: 20px;
            margin-bottom: 15px;
        }

        .achievement .achievement-info {
            color: #666;
            font-size: 18px;
            margin-bottom: 15px;
        }

        .achievement .certificate-image {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .achievement .certificate-image:hover {
            transform: scale(1.05);
        }

        .achievement .date {
            color: #999;
            font-style: italic;
            font-size: 14px;
        }
        .btn-download {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.btn-download:hover {
    background-color: #0056b3;
}
.btn-add {
    background-color: #007bff; /* Blue color */
    color: #fff; /* White text color */
    border: none; /* No border */
    padding: 10px 20px; /* Padding */
    font-size: 16px; /* Font size */
    cursor: pointer; /* Cursor style */
    border-radius: 5px; /* Rounded corners */
    transition: background-color 0.3s ease; /* Transition effect */
    text-decoration: none; /* Remove underline */
}

.btn-add:hover {
    background-color: #0056b3; /* Darker blue color on hover */
}

        /* Position the button in the top-right corner */
        .btn-container {
            text-align: right;
            margin-bottom: 20px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <h2>Student Achievements</h2>
  <!-- Add button -->
    <div class="btn-container">
        <a href="../achievementDetails.aspx" class="btn-add">Add</a>
    </div>
<asp:Repeater ID="projectRepeater" runat="server">
        <ItemTemplate>      
        <div class="achievement">

            <label for="lblActivityName">Achievement name</label>
            <asp:Label ID="lblActivityName" runat="server" Text='<%# Eval("activityName")%>' CssClass="achievement-info"></asp:Label>

            <label for="imgCertificate">Certificate</label>
            <asp:Image ID="imgCertificate" runat="server" ImageUrl='<%# Eval("certificate")%>' CssClass="certificate-image" />

            <label for="lblAchievementRank">Achievement Rank</label>
            <asp:Label ID="lblAchievementRank" runat="server" Text='<%# Eval("rank")%>' CssClass="achievement-info"></asp:Label>

            <label for="lblDescription">Achievement Description</label>
            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("description")%>' CssClass="achievement-info"></asp:Label>

           
            <label for="lblDate">Date</label>
            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("date")%>' CssClass="date"></asp:Label>
            <asp:Button ID="btnDownload" runat="server" Text="Download" 
                onclick="btnDownload_Click" CssClass="btn-download" />

        </div>
     </ItemTemplate>
        </asp:Repeater>
</asp:Content>

