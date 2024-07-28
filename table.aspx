<%@ Page Language="C#" AutoEventWireup="true" CodeFile="table.aspx.cs" Inherits="table" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    .margin
    {
        margin-left:100px;
     }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label" CssClass=margin></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label"  CssClass=margin ></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="Label"  CssClass=margin ></asp:Label>
<asp:Table ID="yourTableID" runat="server">
   
</asp:Table>
 <asp:Button ID="AddRowButton" runat="server" Text="Add Row" OnClick="AddRowButton_Click" />
  <asp:Button ID="btnInsertData" runat="server" Text="Insert Data" OnClick="btnInsertData_Click" />
    </div>
    </form>
</body>
</html>
