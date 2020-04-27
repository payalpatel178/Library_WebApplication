using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryWebApplication
{
    public partial class BorrowBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                DataTable student = ((DataSet)BusinessLayer.UtilityTools.ExecuteStudentAndBookSelect()).Tables[0];

                DataTable book = ((DataSet)BusinessLayer.UtilityTools.ExecuteStudentAndBookSelect()).Tables[1];

                this.ddlSelectStudent.DataSource = student;
                this.ddlSelectStudent.DataTextField = student.Columns["StudentName"].ToString();
                this.ddlSelectStudent.DataValueField = student.Columns[0].ToString();

                this.ddlSelectStudent.DataBind();

                this.ddlchooseBook.DataSource = book;
                this.ddlchooseBook.DataTextField = book.Columns["BookInfo"].ToString();
                this.ddlchooseBook.DataValueField = book.Columns[0].ToString();

                this.ddlchooseBook.DataBind();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                BusinessLayer.Borrow borrow = new BusinessLayer.Borrow();
                borrow.StudentId = Convert.ToInt32(ddlSelectStudent.SelectedItem.Value);
                borrow.BookId = Convert.ToInt32(ddlchooseBook.SelectedItem.Value);
                
                int result = BusinessLayer.UtilityTools.ExecuteBorrowBookInsert(borrow);
                if (result == 3)
                {
                    this.Label3.Text = "Please Choose Valid Book!";
                }
                else if (result == 4)
                {
                    this.Label3.Text = "Please Choose Valid Student!";
                }
                else if (result == 1)
                {
                    this.Label3.Text = "Successfully Book Borrowed!";
                }
                else if (result == 2)
                {
                    this.Label3.Text = "Already Book Borrowed By Another Student!";
                }
                else if (result == 0)
                {
                    this.Label3.Text = "There was an error at the database level";
                }
                else
                {
                    Response.Write(result);
                    this.Label3.Text = "There was an error at the method level";
                }

            }
            else
            {
                this.Label3.Text = "The page is not valid!";
            }
        }
    }
}