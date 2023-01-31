using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace marco
{
    public partial class LecturePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void addtodo(object sender, EventArgs e)
        {
            Response.Redirect("LecAddToDoList.aspx");

        }

        protected void veiwmeet(object sender, EventArgs e)
        {
            Response.Redirect("ViewMeeting.aspx");

        }

        protected void createm(object sender, EventArgs e)
        {
            Response.Redirect("CreateMeeting2.aspx");

        }

        protected void viewee(object sender, EventArgs e)
        {
            Response.Redirect("ViewEE.aspx");

        }

        protected void superviseInd(object sender, EventArgs e)
        {
            Response.Redirect("SuperviseIndustrial.aspx");

        }


        protected void gradeT(object sender, EventArgs e)
        {
            Response.Redirect("GradeThesis.aspx");

        }

        protected void gradeD(object sender, EventArgs e)
        {
            Response.Redirect("GradeDefence.aspx");

        }



        protected void recommende(object sender, EventArgs e)
        {
            Response.Redirect("RecommendEE.aspx");

        }

        protected void viewm(object sender, EventArgs e)
        {
            Response.Redirect("ViewMeeting.aspx");

        }

        protected void createlbn(object sender, EventArgs e)
        {
            Response.Redirect("CreateLBP.aspx");

        }

        protected void createPR(object sender, EventArgs e)
        {
            Response.Redirect("CreatePR.aspx");

        }



    }
}