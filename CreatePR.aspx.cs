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
    public partial class CreatePR : System.Web.UI.Page
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
            string Content = content.Text;
            DateTime d = new DateTime(2023, 1, 5, 12, 0, 0);

            SqlCommand createRP = new SqlCommand("LecCreatePR", conn);
            createRP.Parameters.Add(new SqlParameter("@datee", d));
            createRP.Parameters.Add(new SqlParameter("@content", Content));
            createRP.Parameters.Add(new SqlParameter("@Lecturer_id", id));
            createRP.Parameters.Add(new SqlParameter("@s_id", sid));

            conn.Open();
            createRP.ExecuteNonQuery();
            conn.Close();
        }
    }
}