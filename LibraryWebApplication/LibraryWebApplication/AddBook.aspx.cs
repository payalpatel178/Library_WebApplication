using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryWebApplication
{
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Label2.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                BusinessLayer.Book book = new BusinessLayer.Book();
                book.Title = this.txtTitle.Text;
                book.PageCount = Convert.ToInt32(this.txtPageCount.Text);
                book.Price = Convert.ToDecimal(this.txtPrice.Text);

                BusinessLayer.Author author = new BusinessLayer.Author();
                author.FirstName = this.txtAuthorFirstName.Text;
                author.LastName = this.txtAuthorLastName.Text;

                BusinessLayer.Type type = new BusinessLayer.Type();
                type.Name = this.txtBookType.Text;

                int result = BusinessLayer.UtilityTools.ExecuteBookInsert(book,author,type);
                if (result == 1)
                {
                    this.Label2.Text = "Successful Book Insertion!";
                }
                else if (result == 0)
                {
                    this.Label2.Text = "There was an error at the database level";
                }
                else if (result == 2)
                {
                    this.Label2.Text = "Already Inserted!";
                }
                else
                {
                    Response.Write(result);
                    this.Label2.Text = "There was an error at the method level";
                }

            }
            else
            {
                this.Label2.Text = "The page is not valid!";
            }
        }
    }
}