using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lastellast
{
    public partial class TAAddToDo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand add = new SqlCommand("TAAddToDo", conn);
            add.CommandType = CommandType.StoredProcedure;

            int mmid = Int16.Parse(mid.Text);
            String lst = list.Text;



            add.Parameters.Add(new SqlParameter("@meeting_id", mmid));
            add.Parameters.Add(new SqlParameter("@to_do_list", lst));

            conn.Open();
            add.ExecuteNonQuery();
            conn.Close();

        }
    }
}