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
    public partial class GradeThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id = Int16.Parse(lecid.Text);
            int sid = Int16.Parse(studentid.Text);
            int title = Int16.Parse(thesistitle.Text);
            int Grade = Int16.Parse(grade.Text);

            SqlCommand gradeT = new SqlCommand("LecGradeThesis", conn);
            gradeT.Parameters.Add(new SqlParameter("@grade", Grade));
            gradeT.Parameters.Add(new SqlParameter("@thesis_title", title));
            gradeT.Parameters.Add(new SqlParameter("@Lecturer_id", id));
            gradeT.Parameters.Add(new SqlParameter("@s_id", sid));

            conn.Open();
            gradeT.ExecuteNonQuery();
            conn.Close();

        }
    }
}