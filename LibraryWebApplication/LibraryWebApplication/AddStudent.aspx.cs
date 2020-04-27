using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryWebApplication
{
    public partial class AddStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.Label1.Text = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                BusinessLayer.Student student = new BusinessLayer.Student();
                student.FirstName = this.firstname.Text; 
                student.LastName = this.lastname.Text;
                student.BirthDate = this.birthdate.Text;
                student.Gender = this.RadioButtonListGender.SelectedValue;
                student.Class = this.@class.Text;

                int result = BusinessLayer.UtilityTools.ExecuteStudentInsert(student);
                if (result == 1)
                {
                    this.Label1.Text = "Successful Registration!";
                }
                else if (result == 0)
                {
                    this.Label1.Text = "There was an error at the database level";
                }
                else if (result == 2)
                {
                    this.Label1.Text = "Already Registered!";
                }
                else
                {
                    Response.Write(result);
                    this.Label1.Text = "There was an error at the method level";
                }

            }
            else
            {
                this.Label1.Text = "The page is not valid!";
            }
        }

    }
}