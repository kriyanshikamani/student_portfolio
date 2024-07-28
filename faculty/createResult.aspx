<%@ Page Title="" Language="C#" MasterPageFile="~/faculty/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="createResult.aspx.cs" Inherits="faculty_createResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:Label ID="lbl_department" runat="server" Text="select department : "></asp:Label>
    <asp:RadioButtonList ID="rbl_department" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="deptName" 
        DataValueField="dept_id" onselectedindexchanged="rbl_department_SelectedIndexChanged" 
       >
    </asp:RadioButtonList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CONN %>" 
        SelectCommand="SELECT DISTINCT * FROM [department]"></asp:SqlDataSource><br />

    <asp:Label ID="lbl_semester" runat="server" Text="select semester : "></asp:Label>
    <asp:RadioButtonList ID="rbl_sem" runat="server" DataSourceID="SqlDataSource2" 
        DataTextField="semester" DataValueField="semester" onselectedindexchanged="rbl_sem_SelectedIndexChanged" 
      >
    </asp:RadioButtonList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CONN %>" 
        SelectCommand="SELECT DISTINCT [semester] FROM [subjects]">
    </asp:SqlDataSource>
    <asp:Label ID="Label4" runat="server" Text="Entrollment No : "></asp:Label>
    <asp:TextBox ID="txtEntrollment" runat="server"></asp:TextBox>
   
    
    
    
    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>

     <div >
    
        <asp:Label ID="Label2" runat="server" Text="Internal Marks" ></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="Exam Marks" ></asp:Label>
        </div>
 
<asp:Table ID="subjectTable" runat="server" >
   
</asp:Table>
  <asp:Button ID="AddRowButton" runat="server" Text="Add Row" OnClick="AddRowButton_Click" />
   
    <asp:Button ID="Button1" runat="server" Text="show subjects" onclick="Button1_Click" />
    <asp:Button ID="btnInsertData" runat="server" Text="Insert Data" OnClick="btnInsertData_Click" /><br />
     <asp:Label ID="Label1" runat="server" Text=" Marks" ></asp:Label>
    
    
   
</asp:Content>

