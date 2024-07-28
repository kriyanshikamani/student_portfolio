<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
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
        
        #login-form
        {
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        #login-form h2
        {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        
        #login-form label
        {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        
        #login-form input[type="text"], #login-form input[type="email"], #login-form input[type="password"]
        {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }
        
        #login-form input[type="submit"]
        {
            width: 100%;
            padding: 15px;
            font-size: 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            margin-bottom: 5px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        #login-form input[type="submit"]:hover
        {
            background-color: #0056b3;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="border-div">
        <div class="form-header">
            <a id="loginLink" runat="server" href="login.aspx">Login</a> <a id="registerLink"
                runat="server" href="registration.aspx">Admin Login</a>
        </div>
        <div id="login-form">
            <h2>
                Admin Login</h2>
            <div>
                <label for="lbl_username">
                    Username</label>
                <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtPassword">
                    Password</label>
                <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
                 <asp:Button ID="btnLogin" runat="server" Text="Login" 
                     onclick="btnLogin_Click"  />
            </div>
            <br />
            <asp:Label ID="error" runat="server" ForeColor="Red"></asp:Label><br />
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
