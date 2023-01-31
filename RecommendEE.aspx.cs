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
    public partial class RecommendEE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submit(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int lecID = Int16.Parse(lecid.Text);
            int projID = Int16.Parse(projid.Text);
            int eeID = Int16.Parse(eeid.Text);

            SqlCommand Recommendee = new SqlCommand("RecommendEE", conn);
            Recommendee.CommandType = CommandType.StoredProcedure;

            Recommendee.Parameters.Add(new SqlParameter("@Lecturer_id", lecID));
            Recommendee.Parameters.Add(new SqlParameter("@proj_id", projid));
            Recommendee.Parameters.Add(new SqlParameter("@EE_id", eeID));

            conn.Open();
            Recommendee.ExecuteNonQuery();
            conn.Close();
        }
    }
}