using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace marco
{
    public partial class GradeDefence : System.Web.UI.Page
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
            int defenceLocation = Int16.Parse(defencel.Text);
            int Grade = Int16.Parse(grade.Text);

            SqlCommand gradeD = new SqlCommand("LecGradedefense", conn);
            gradeD.CommandType = CommandType.StoredProcedure;

            gradeD.Parameters.Add(new SqlParameter("@grade", Grade));
            gradeD.Parameters.Add(new SqlParameter("@defense_location", defenceLocation));
            gradeD.Parameters.Add(new SqlParameter("@Lecturer_id", id));
            gradeD.Parameters.Add(new SqlParameter("@s_id", sid));

            conn.Open();
            gradeD.ExecuteNonQuery();
            conn.Close();
        }
    }
}