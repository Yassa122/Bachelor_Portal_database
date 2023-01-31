using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace marco
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Lecturer_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerSignUP.aspx");
        }

        protected void Student_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentSignUp.aspx");
        }

        protected void Company_Click(object sender, EventArgs e)
        {
            Response.Redirect("companySignUp");
        }

        protected void ExternalExaminer_Click(object sender, EventArgs e)
        {
            Response.Redirect("EESignUP");
        }

        protected void TA_Click(object sender, EventArgs e)
        {
            Response.Redirect("TASignUP");

        }
    }
}