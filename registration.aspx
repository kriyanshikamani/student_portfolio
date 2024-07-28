<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title><style type="text/css">
         .form-header
        {
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            background-color: #0056b3;
        }
        
        .form-header a
        {
            text-decoration: none;
            color: #fff;
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
            margin: 0 5px;
        }
        
        .form-header a:hover
        {
            background-color: #007bff;
        }
      
        .border-div
        {
            border: 2px solid #0056b3;
            width: 60%;
             margin:0 auto;
        }
        .active-link
        {
          
            font-weight: bold;
            color: blue; 
        }

        #registration-form {
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        #registration-form h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        #registration-form label {
            display: inline;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }

        #registration-form input[type="text"],
        #registration-form input[type="email"],
        #registration-form input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }

        #registration-form input[type="text"]:focus,
        #registration-form input[type="email"]:focus,
        #registration-form input[type="password"]:focus {
            border-color: #4caf50;
        }

        #registration-form input[type="submit"] {
            width: 100%;
            padding: 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            font-size:16px;
            margin-bottom:5px;
            border-radius: 5px;
            cursor: pointer;
           
        }

        #registration-form input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="border-div">
        <div class="form-header">
            <a id="loginLink" runat="server" href="login.aspx">Login</a> <a id="registerLink"
                runat="server" href="Admin_Login.aspx">Admin Login</a>
        </div>
    <div id="registration-form">
            <h2>Registration Form</h2>
            <div>
                <label for="txtName">First Name</label><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" 
                    ControlToValidate="txt_fname" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txt_fname" runat="server"></asp:TextBox>
                
            </div>
            <div>
                <label for="txtName">Last Name</label><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" 
                    ControlToValidate="txt_lname" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txt_lname" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtEmail">Email</label><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" 
                    ControlToValidate="txt_email" ForeColor="Red"></asp:RequiredFieldValidator> <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                  ErrorMessage="Invalid Gmail id" ControlToValidate="txt_email" 
                  ValidationExpression="^[a-z\d]*@gmail\.[a-z]{3}$" ForeColor="Red"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtPassword">Password</label><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" 
                    ControlToValidate="txt_password" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
            </div>

            <div>
                <asp:Button ID="btnRegister" runat="server" Text="SIGN UP" 
                    onclick="btnRegister_Click"  />
            </div>
            Already have an account?<asp:HyperLink ID="HyperLink1" 
                runat="server" NavigateUrl="~/login.aspx">Sign in</asp:HyperLink>

            <br /><br />
        <asp:Label ID="error" runat="server" ForeColor="Red"></asp:Label>
        </div>
        </div>
    </form>
</body>
</html>

