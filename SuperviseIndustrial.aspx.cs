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
    public partial class SuperviseIndustrial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submit(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id = Int16.Parse(lecid.Text);
            int code = Int16.Parse(ProjCode.Text);

            SqlCommand supervise = new SqlCommand("SuperviseIndustrial", conn);
            supervise.CommandType = CommandType.StoredProcedure;

            supervise.Parameters.Add(new SqlParameter("@proj_code", code));
            supervise.Parameters.Add(new SqlParameter("@Lecturer_id", id));

            conn.Open();
            supervise.ExecuteNonQuery();
            conn.Close();
        }
    }
}