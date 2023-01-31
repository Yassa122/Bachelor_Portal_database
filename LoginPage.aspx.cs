using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace marco
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void createlbp(object sender, EventArgs e)
        {

        }

        protected void createmeeting(object sender, EventArgs e)
        {

        }

        protected void createpr(object sender, EventArgs e)
        {

        }

        protected void graded(object sender, EventArgs e)
        {

        }

        protected void gradepr(object sender, EventArgs e)
        {

        }

        protected void gradethesis(object sender, EventArgs e)
        {

        }

        protected void addtodo(object sender, EventArgs e)
        {

        }

        protected void recommendee(object sender, EventArgs e)
        {

        }

        protected void suprviseindusturial(object sender, EventArgs e)
        {

        }

        protected void viewmeeting(object sender, EventArgs e)
        {

        }

        protected void viewee(object sender, EventArgs e)
        {

        }


        protected void Login(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Leqaa"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            String email = emailll.Text;
            int pass = Int16.Parse(passwordd.Text);



            if (success.Value.ToString() == "1")
            {
                Response.Write("welcome");
                Session["user"] = id;
            }
            else
                Response.Write("does not exist");
            Response.Redirect("ViewEmployees.aspx");
        }
    }
}
