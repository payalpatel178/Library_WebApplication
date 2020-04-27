using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryWebApplication
{
    public partial class ReturnBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {

                DataTable student = ((DataSet)BusinessLayer.UtilityTools.ExecuteStudentWithBookReturnSelect()).Tables[0];

                this.ddlSelectStudentToReturnBook.DataSource = student;
                this.ddlSelectStudentToReturnBook.DataTextField = student.Columns["StudentName"].ToString();
                this.ddlSelectStudentToReturnBook.DataValueField = student.Columns[0].ToString();

                this.ddlSelectStudentToReturnBook.DataBind();

            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                
                BusinessLayer.Borrow returnBook = new BusinessLayer.Borrow();
                returnBook.StudentId = Convert.ToInt32(ddlSelectStudentToReturnBook.SelectedItem.Value);
                returnBook.BookId = Convert.ToInt32(ddlChooseBookToReturn.SelectedItem.Value);

                int result = BusinessLayer.UtilityTools.ExecuteReturnBookUpdateBroughtDate(returnBook);
                if (result == 3)
                {
                    this.Label4.Text = "Please Choose Valid Student!";
                }
                else if (result == 1)
                {
                    this.Label4.Text = "Successful Book Returned!";
                }
                else if (result == 0)
                {
                    this.Label4.Text = "There was an error at the database level";
                }
                else if (result == 2)
                {
                    this.Label4.Text = "Please choose Valid Book!";
                }
                else
                {
                    Response.Write(result);
                    this.Label4.Text = "There was an error at the method level";
                }

            }
            else
            {
                this.Label4.Text = "The page is not valid!";
            }
        }

        protected void ddlSelectStudentToReturnBook_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlChooseBookToReturn.Enabled = false;
            ddlChooseBookToReturn.Items.Clear();
            ddlChooseBookToReturn.Items.Insert(0, new ListItem("Select Book", "0"));

            int studentId = Convert.ToInt32(ddlSelectStudentToReturnBook.SelectedItem.Value);
            //int studentId = 4;


            if (studentId > 0)
            {
                string query = string.Format("SELECT  B.bookId AS bookId,B.title + ' - ' + T.[name]  + ' - ' + A.firstname + '  ' + A.lastname AS BookInfo FROM dbo.book B INNER JOIN dbo.type T ON B.typeId = T.typeId INNER JOIN dbo.author A ON A.authorId = B.authorId INNER JOIN dbo.borrow BR ON BR.bookId = B.bookId WHERE BR.studentId = {0} AND BR.broughtDate IS NULL", studentId);
        
                BindDropDownList(ddlChooseBookToReturn, query, "bookInfo", "bookId", "Select Book");
                ddlChooseBookToReturn.Enabled = true;
            }
                
            
        }

        private void BindDropDownList(DropDownList ddl, string query, string text, string value, string defaultText)
        {
            string conString = "Data Source=.;Initial Catalog=LibraryWebDB;Integrated Security=True";
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    con.Open();
                    ddl.DataSource = cmd.ExecuteReader();
                    ddl.DataTextField = text;
                    ddl.DataValueField = value;
                    ddl.DataBind();
                    con.Close();
                }
            }
            //ddl.Items.Insert(0, new ListItem(defaultText, "0"));
        }

    }
}