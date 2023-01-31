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
    public partial class GradePR : System.Web.UI.Page
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
            DateTime datee = DateTime.Parse(date.time);
            int Grade = Int16.Parse(grade.Text);

            SqlCommand gradePR = new SqlCommand("LecGradePR", conn);
            gradePR.CommandType = CommandType.StoredProcedure;

            gradePR.Parameters.Add(new SqlParameter("@grade", Grade));
            gradePR.Parameters.Add(new SqlParameter("@datee", datee));
            gradePR.Parameters.Add(new SqlParameter("@Lecturer_id", id));
            gradePR.Parameters.Add(new SqlParameter("@s_id", sid));

            conn.Open();
            gradePR.ExecuteNonQuery();
            conn.Close();
        }
    }
}