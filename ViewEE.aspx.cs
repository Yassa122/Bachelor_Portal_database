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
    public partial class ViewEE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void view(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand Viewee = new SqlCommand("ViewEE", conn);
            Viewee.CommandType = CommandType.StoredProcedure;

            conn.Open();
            Viewee.ExecuteNonQuery();
            conn.Close();
        }
    }
}