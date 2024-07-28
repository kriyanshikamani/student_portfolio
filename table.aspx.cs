using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class table : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Ensure that dynamically added controls are recreated on postback
        RecreateDynamicallyAddedControls();
    }

    protected void RecreateDynamicallyAddedControls()
    {
        int rowCount = 0;

        // Find out how many rows were previously added
        if (ViewState["RowCount"] != null)
        {
            rowCount = (int)ViewState["RowCount"];
        }

        // Recreate the dynamically added controls
        for (int i = 0; i < rowCount; i++)
        {
            AddNewRow();
        }
    }

    protected void AddNewRow()
    {
        
        TableRow newRow = new TableRow();

        // Add cells to the new row
        for (int i = 0; i < 3; i++)
        {
            TableCell cell = new TableCell();
            TextBox textBox = new TextBox();
            textBox.ID = "TextBox" + yourTableID.Rows.Count + "_" + i; // Unique ID for each textbox
            cell.Controls.Add(textBox);
            newRow.Cells.Add(cell);
        }
        // Add a cell for the delete button
        TableCell deleteCell = new TableCell();
        Button deleteButton = new Button();
        deleteButton.Text = "Delete";
        deleteButton.Click += new EventHandler(DeleteButton_Click);
        deleteCell.Controls.Add(deleteButton);
        newRow.Cells.Add(deleteCell);

        // Add the new row to the table
        yourTableID.Rows.Add(newRow);
    }

    protected void AddRowButton_Click(object sender, EventArgs e)
    {
        // Call the method to add a new row with a textbox
        AddNewRow();

        // Increment the row count and save it in ViewState
        int rowCount = yourTableID.Rows.Count;
        ViewState["RowCount"] = rowCount;
    }
    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        Button deleteButton = (Button)sender;
        TableRow row = (TableRow)deleteButton.Parent.Parent; // Get the parent row of the delete button
        yourTableID.Rows.Remove(row); // Remove the row from the table

        // Decrement the row count and save it in ViewState
        int rowCount = yourTableID.Rows.Count;
        ViewState["RowCount"] = rowCount;
    }

    protected void btnInsertData_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < yourTableID.Rows.Count; i++) // Start from index 1 to skip the header row
        {
            TableRow row = yourTableID.Rows[i];

            // Retrieve values from TextBox controls within the row
            string column1Value = ((TextBox)row.Cells[0].Controls[0]).Text;
            string column2Value = ((TextBox)row.Cells[1].Controls[0]).Text;
            string column3Value = ((TextBox)row.Cells[2].Controls[0]).Text;

            // Here you can insert the data into your database table
            // For demonstration purposes, I'll just print the values
            Response.Write("Row " + i + ": Column 1: " + column1Value + ", Column 2: " + column2Value + ", Column 3: " + column3Value + " <br/>");

        }


    }
}